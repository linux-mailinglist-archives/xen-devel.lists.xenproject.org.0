Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF42C2867
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36241.68238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYZJ-0006op-GY; Tue, 24 Nov 2020 13:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36241.68238; Tue, 24 Nov 2020 13:41:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYZI-0006jT-IU; Tue, 24 Nov 2020 13:41:16 +0000
Received: by outflank-mailman (input) for mailman id 36241;
 Tue, 24 Nov 2020 13:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYPQ-0000Qf-4u
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:31:04 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fec4524-e973-4418-a24f-5ab909f2a098;
 Tue, 24 Nov 2020 13:29:04 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNI-0006fd-9V; Tue, 24 Nov 2020 13:28:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYPQ-0000Qf-4u
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:31:04 +0000
X-Inumbo-ID: 1fec4524-e973-4418-a24f-5ab909f2a098
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fec4524-e973-4418-a24f-5ab909f2a098;
	Tue, 24 Nov 2020 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NQmGHAp8ccIKeWKzHSDEWMgq45K7twbBhC04AX3u2zo=; b=LD3aUh6zWx06zp1Z5Hd2CQ/dQG
	DfvGBwpoMcvO7Yz8mgjMzoezBV5tVQdN5HpA41kDsI15KL3v6qNkNWXDuxQX3QIXARr7UOFFet4ML
	7s0d/Mewr7Aa6NcLrs5z4wtNOmHCSa4T8JZE1yYgO0sHZb7exqUu8c/bWLVQM+oiT8/2uMRSn07yp
	GBsPonmOh8TQgUX3qfkRgVQdWa/7j6CQ1OofbIBkl68FUN7k2RGQoRhOsk2OYb2KW7C8bXP9GwX/I
	Y5UgK6gcqHputfdO8FvgBOq1pLnrJAa+D8ZbFcDaPxXceBBrzkMPjCFAIwNFVOftQy/pkuYdClKgM
	JpNXfQvg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYNI-0006fd-9V; Tue, 24 Nov 2020 13:28:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 34/45] block: move holder_dir to struct block_device
Date: Tue, 24 Nov 2020 14:27:40 +0100
Message-Id: <20201124132751.3747337-35-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Move the holder_dir field to struct block_device in preparation for
kill struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             |  5 +++--
 block/partitions/core.c   |  8 ++++----
 fs/block_dev.c            | 11 +++++------
 include/linux/blk_types.h |  1 +
 include/linux/genhd.h     |  1 -
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 20c7bf6d091e94..a991f0122e53d8 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -671,7 +671,8 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 	 */
 	pm_runtime_set_memalloc_noio(ddev, true);
 
-	disk->part0.holder_dir = kobject_create_and_add("holders", &ddev->kobj);
+	disk->part0.bdev->bd_holder_dir =
+			kobject_create_and_add("holders", &ddev->kobj);
 	disk->slave_dir = kobject_create_and_add("slaves", &ddev->kobj);
 
 	if (disk->flags & GENHD_FL_HIDDEN) {
@@ -871,7 +872,7 @@ void del_gendisk(struct gendisk *disk)
 
 	blk_unregister_queue(disk);
 
-	kobject_put(disk->part0.holder_dir);
+	kobject_put(disk->part0.bdev->bd_holder_dir);
 	kobject_put(disk->slave_dir);
 
 	part_stat_set_all(&disk->part0, 0);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index e24673b4cba61f..ff60a14ed4dcdd 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -344,7 +344,7 @@ void delete_partition(struct hd_struct *part)
 	 */
 	get_device(disk_to_dev(disk));
 	rcu_assign_pointer(ptbl->part[part->partno], NULL);
-	kobject_put(part->holder_dir);
+	kobject_put(part->bdev->bd_holder_dir);
 	device_del(part_to_dev(part));
 
 	/*
@@ -452,8 +452,8 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 		goto out_put;
 
 	err = -ENOMEM;
-	p->holder_dir = kobject_create_and_add("holders", &pdev->kobj);
-	if (!p->holder_dir)
+	bdev->bd_holder_dir = kobject_create_and_add("holders", &pdev->kobj);
+	if (!bdev->bd_holder_dir)
 		goto out_del;
 
 	dev_set_uevent_suppress(pdev, 0);
@@ -487,7 +487,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 out_remove_file:
 	device_remove_file(pdev, &dev_attr_whole_disk);
 out_del:
-	kobject_put(p->holder_dir);
+	kobject_put(bdev->bd_holder_dir);
 	device_del(pdev);
 out_put:
 	put_device(pdev);
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 2393395201aa6c..0b8d6009486643 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1137,7 +1137,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	WARN_ON_ONCE(!bdev->bd_holder);
 
 	/* FIXME: remove the following once add_disk() handles errors */
-	if (WARN_ON(!disk->slave_dir || !bdev->bd_part->holder_dir))
+	if (WARN_ON(!disk->slave_dir || !bdev->bd_holder_dir))
 		goto out_unlock;
 
 	holder = bd_find_holder_disk(bdev, disk);
@@ -1160,14 +1160,14 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	if (ret)
 		goto out_free;
 
-	ret = add_symlink(bdev->bd_part->holder_dir, &disk_to_dev(disk)->kobj);
+	ret = add_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
 	if (ret)
 		goto out_del;
 	/*
 	 * bdev could be deleted beneath us which would implicitly destroy
 	 * the holder directory.  Hold on to it.
 	 */
-	kobject_get(bdev->bd_part->holder_dir);
+	kobject_get(bdev->bd_holder_dir);
 
 	list_add(&holder->list, &bdev->bd_holder_disks);
 	goto out_unlock;
@@ -1202,9 +1202,8 @@ void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
 
 	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
 		del_symlink(disk->slave_dir, bdev_kobj(bdev));
-		del_symlink(bdev->bd_part->holder_dir,
-			    &disk_to_dev(disk)->kobj);
-		kobject_put(bdev->bd_part->holder_dir);
+		del_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
+		kobject_put(bdev->bd_holder_dir);
 		list_del_init(&holder->list);
 		kfree(holder);
 	}
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 2f8ede04e5a94c..c0591e52d7d7ce 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -35,6 +35,7 @@ struct block_device {
 #ifdef CONFIG_SYSFS
 	struct list_head	bd_holder_disks;
 #endif
+	struct kobject		*bd_holder_dir;
 	u8			bd_partno;
 	struct hd_struct *	bd_part;
 	/* number of times partitions within this device have been opened. */
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 1e52f38b719db3..c2a8cf12c5cab5 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -55,7 +55,6 @@ struct hd_struct {
 
 	struct block_device *bdev;
 	struct device __dev;
-	struct kobject *holder_dir;
 	int policy, partno;
 #ifdef CONFIG_FAIL_MAKE_REQUEST
 	int make_it_fail;
-- 
2.29.2


