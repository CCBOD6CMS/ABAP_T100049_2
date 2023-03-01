define hierarchy ZCDS_25_T100049
  with parameters
    pManager : abap.char(3)
  as parent child hierarchy(
    source ZCDS_24_T100049
    child to parent association _Manager
    start where
      Manager = $parameters.pManager
    siblings order by
      Employe
  )
{
  key Employe,
      Manager,
      Name,
      $node.parent_id             as ParentId,
      $node.hierarchy_parent_rank as ParentRank,
      $node.node_id               as NodeId,
      $node.hierarchy_level       as Hlevel,
      $node.hierarchy_tree_size   as TreeSize,
      $node.hierarchy_rank        as HRank

}
