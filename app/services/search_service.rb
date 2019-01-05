class SearchService
  KLASSES = %w[Product Article DataSheet]

  def initialize(args)
    @current_user = args[:current_user]

    @klasses = args.fetch(:klasses, KLASSES).map do |k|
      KLASSES.include?(k.to_s) ? k.to_s.constantize : nil
    end

    @klasses.compact!

    @active = args[:active]

    @filters = args.fetch(:filters, {}) # should be  hash, like {id: 1}
  end

  def search(term = nil)
    return if @klasses.blank?

    term = term.presence || '*'

    Searchkick.search(term, index_name: @klasses, where: where)
  rescue Searchkick::MissingIndexError # @todo for debug, remove it
    KLASSES.each{|klass| klass.constantize.reindex }
    super(term)
  end

  def main_klass
    return if @klasses.size != 1

    @klasses.first
  end

  def available_filters
    return [] unless main_klass

    main_klass.new.attributes.keys
  end

  private

  def where
    res = {}

    res[:active] = @active unless @active.nil?

    if @current_user&.admin? && main_klass
      @filters.each do |filter, val|
        res[filter] = val if available_filters.include?(filter) && val.present?
      end
    end

    res
  end
end
