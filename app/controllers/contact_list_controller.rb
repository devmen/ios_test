class ContactListController < PFQueryTableViewController
  def init
    if super
      self.title = 'List'
      self.className = 'Contact'
      # self.pullToRefreshEnabled = true
      # self.paginationEnabled = true
      # self.objectsPerPage = 25
    end
    self
  end

  def queryForTable
    query = PFQuery.queryWithClassName(className)
    if objects.count == 0
      query.cachePolicy = KPFCachePolicyCacheThenNetwork
    end
    query.orderByDescending("createdAt")
    query
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath, object:object)
    cellIdentifier = "Cell";
    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) || PFTableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:cellIdentifier)
    cell.textLabel.text = object.objectForKey(:name)
    cell.detailTextLabel.text = object.objectForKey(:phone)
    cell
  end
end
