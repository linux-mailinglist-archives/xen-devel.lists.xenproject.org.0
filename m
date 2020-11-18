Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E62B79C0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29545.59077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJn-0001iS-DQ; Wed, 18 Nov 2020 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29545.59077; Wed, 18 Nov 2020 08:59:59 +0000
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
	id 1kfJJn-0001hb-8c; Wed, 18 Nov 2020 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 29545;
 Wed, 18 Nov 2020 08:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ9q-0006e0-4H
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:42 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b48ae73e-9e8a-4dbf-b138-9c98ee0aa84f;
 Wed, 18 Nov 2020 08:48:42 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8f-0007o7-Ef; Wed, 18 Nov 2020 08:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ9q-0006e0-4H
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:42 +0000
X-Inumbo-ID: b48ae73e-9e8a-4dbf-b138-9c98ee0aa84f
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b48ae73e-9e8a-4dbf-b138-9c98ee0aa84f;
	Wed, 18 Nov 2020 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jJNK9/H8sfmZrYurqzVwgyu9MJNwxw5ihe1GEzXuM6I=; b=jr1pmgSmLgODWAxYLebiTtixWG
	E1FQCz1t4RsLXrDcKfCHo6N5wK4/ZRUATPnOoS+1KhQWSkL+IYBAcKPpKT/D+msyWWNJRH4w+SFnj
	JBRSKKj3TirzVD1MdsKHZ9Flq10GFrmbhjDJZhSyjzB4kyj1B0nzh8UbaRZ4y/HZdtSR9e8+1QDyD
	trkeCJ3uOhAJr0QSCPeeqOHGZi+qybaTd0Iwo6NsH61NtELVxfc3F3mwTNzCSqbmQPVbAslaT7l/f
	rcS41nOzYQ+YaKX/c14HNjwjzYbiCVclFfMYiSfxLG2wzSa+j8BcmUl2NsNkYxtieohJSwf+tr+K1
	+WNVXfww==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8f-0007o7-Ef; Wed, 18 Nov 2020 08:48:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 16/20] block: stop using bdget_disk for partition 0
Date: Wed, 18 Nov 2020 09:47:56 +0100
Message-Id: <20201118084800.2339180-17-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

We can just dereference the point in struct gendisk instead.  Also
remove the now unused export.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c                   |  1 -
 drivers/block/nbd.c             |  4 +---
 drivers/block/xen-blkfront.c    | 20 +++++---------------
 drivers/block/zram/zram_drv.c   | 18 +++---------------
 drivers/md/dm.c                 |  8 +-------
 drivers/s390/block/dasd_ioctl.c |  5 ++---
 6 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index a14e2408e3d4e8..ec41d0f18f5ce1 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -907,7 +907,6 @@ struct block_device *bdget_disk(struct gendisk *disk, int partno)
 
 	return bdev;
 }
-EXPORT_SYMBOL(bdget_disk);
 
 /*
  * print a full list of all partitions - intended for places where the root
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 014683968ce174..92f84ed0ba9eb6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1488,12 +1488,10 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 static void nbd_release(struct gendisk *disk, fmode_t mode)
 {
 	struct nbd_device *nbd = disk->private_data;
-	struct block_device *bdev = bdget_disk(disk, 0);
 
 	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
-			bdev->bd_openers == 0)
+			disk->part0->bd_openers == 0)
 		nbd_disconnect_and_put(nbd);
-	bdput(bdev);
 
 	nbd_config_put(nbd);
 	nbd_put(nbd);
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 79521e33d30ed5..188e0b47534bcf 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2153,7 +2153,7 @@ static void blkfront_closing(struct blkfront_info *info)
 	}
 
 	if (info->gd)
-		bdev = bdget_disk(info->gd, 0);
+		bdev = bdgrab(info->gd->part0);
 
 	mutex_unlock(&info->mutex);
 
@@ -2518,7 +2518,7 @@ static int blkfront_remove(struct xenbus_device *xbdev)
 
 	disk = info->gd;
 	if (disk)
-		bdev = bdget_disk(disk, 0);
+		bdev = bdgrab(disk->part0);
 
 	info->xbdev = NULL;
 	mutex_unlock(&info->mutex);
@@ -2595,19 +2595,11 @@ static int blkif_open(struct block_device *bdev, fmode_t mode)
 static void blkif_release(struct gendisk *disk, fmode_t mode)
 {
 	struct blkfront_info *info = disk->private_data;
-	struct block_device *bdev;
 	struct xenbus_device *xbdev;
 
 	mutex_lock(&blkfront_mutex);
-
-	bdev = bdget_disk(disk, 0);
-
-	if (!bdev) {
-		WARN(1, "Block device %s yanked out from us!\n", disk->disk_name);
+	if (disk->part0->bd_openers)
 		goto out_mutex;
-	}
-	if (bdev->bd_openers)
-		goto out;
 
 	/*
 	 * Check if we have been instructed to close. We will have
@@ -2619,7 +2611,7 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
 
 	if (xbdev && xbdev->state == XenbusStateClosing) {
 		/* pending switch to state closed */
-		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
+		dev_info(disk_to_dev(disk), "releasing disk\n");
 		xlvbd_release_gendisk(info);
 		xenbus_frontend_closed(info->xbdev);
  	}
@@ -2628,14 +2620,12 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
 
 	if (!xbdev) {
 		/* sudden device removal */
-		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
+		dev_info(disk_to_dev(disk), "releasing disk\n");
 		xlvbd_release_gendisk(info);
 		disk->private_data = NULL;
 		free_info(info);
 	}
 
-out:
-	bdput(bdev);
 out_mutex:
 	mutex_unlock(&blkfront_mutex);
 }
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 01757f9578dcb8..56024905bd242c 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1748,7 +1748,7 @@ static ssize_t reset_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
 	struct zram *zram = dev_to_zram(dev);
-	struct block_device *bdev;
+	struct block_device *bdev = zram->disk->part0;
 	unsigned short do_reset;
 	int ret = 0;
 
@@ -1758,17 +1758,12 @@ static ssize_t reset_store(struct device *dev,
 	if (!do_reset)
 		return -EINVAL;
 
-	bdev = bdget_disk(zram->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
-
 	mutex_lock(&bdev->bd_mutex);
 	if (bdev->bd_openers)
 		ret = -EBUSY;
 	else
 		zram_reset_device(zram);
 	mutex_unlock(&bdev->bd_mutex);
-	bdput(bdev);
 
 	return ret ? ret : len;
 }
@@ -1933,15 +1928,8 @@ static int zram_add(void)
 
 static int zram_remove(struct zram *zram)
 {
-	struct block_device *bdev = bdget_disk(zram->disk, 0);
-
-	if (bdev) {
-		if (bdev->bd_openers) {
-			bdput(bdev);
-			return -EBUSY;
-		}
-		bdput(bdev);
-	}
+	if (zram->disk->part0->bd_openers)
+		return -EBUSY;
 
 	del_gendisk(zram->disk);
 	zram_debugfs_unregister(zram);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c9438feefe55a3..ec48ccae50dd53 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2375,17 +2375,12 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
  */
 static int lock_fs(struct mapped_device *md)
 {
-	struct block_device *bdev;
 	int r;
 
 	WARN_ON(md->frozen_sb);
 
-	bdev = bdget_disk(md->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
-	md->frozen_sb = freeze_bdev(bdev);
+	md->frozen_sb = freeze_bdev(md->disk->part0);
 	if (IS_ERR(md->frozen_sb)) {
-		bdput(bdev);
 		r = PTR_ERR(md->frozen_sb);
 		md->frozen_sb = NULL;
 		return r;
@@ -2402,7 +2397,6 @@ static void unlock_fs(struct mapped_device *md)
 		return;
 
 	thaw_bdev(md->frozen_sb->s_bdev, md->frozen_sb);
-	bdput(md->frozen_sb->s_bdev);
 	md->frozen_sb = NULL;
 	clear_bit(DMF_FROZEN, &md->flags);
 }
diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
index 304eba1acf163c..9f642440894655 100644
--- a/drivers/s390/block/dasd_ioctl.c
+++ b/drivers/s390/block/dasd_ioctl.c
@@ -220,9 +220,8 @@ dasd_format(struct dasd_block *block, struct format_data_t *fdata)
 	 * enabling the device later.
 	 */
 	if (fdata->start_unit == 0) {
-		struct block_device *bdev = bdget_disk(block->gdp, 0);
-		bdev->bd_inode->i_blkbits = blksize_bits(fdata->blksize);
-		bdput(bdev);
+		block->gdp->part0->bd_inode->i_blkbits =
+			blksize_bits(fdata->blksize);
 	}
 
 	rc = base->discipline->format_device(base, fdata, 1);
-- 
2.29.2


