Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC952C283E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36127.67926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYYK-0004LD-E8; Tue, 24 Nov 2020 13:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36127.67926; Tue, 24 Nov 2020 13:40:16 +0000
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
	id 1khYYK-0004J7-3g; Tue, 24 Nov 2020 13:40:16 +0000
Received: by outflank-mailman (input) for mailman id 36127;
 Tue, 24 Nov 2020 13:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYQT-0000Qf-78
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:32:09 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53cf6379-1e78-4f12-bf8c-3463abba7bd9;
 Tue, 24 Nov 2020 13:29:21 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNJ-0006ft-Oa; Tue, 24 Nov 2020 13:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYQT-0000Qf-78
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:32:09 +0000
X-Inumbo-ID: 53cf6379-1e78-4f12-bf8c-3463abba7bd9
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 53cf6379-1e78-4f12-bf8c-3463abba7bd9;
	Tue, 24 Nov 2020 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oCaG9QTti35Co15ZkTmy9WR1wN4N3tzsYJ4o9aP2968=; b=uTjq+lzNK3MRvJUZJe1MFek3QY
	mdTWQqnQ6bq3Bs9Eh1zdFXj1RqnhHFuSzSt0o314aTwb5YooreOfWR4Gmgn/r7VxTMNLuIUI2gBnN
	Ym7inGUKXhKLVn4XEfAdQgHIzdr3jOVC/NgIXZI6iMRHxIF1O+uILzeLIxHG+SnknBLygyZesVlYM
	Uk9wQKOssAMW3w8as2Z6Tn9IvRXZpZfVZZ/c6w4j4Aww1N6913//5WtpNlj6xqJ9Ek4ANTYisQPlM
	+6XnevhikD3blqjEd/gF5Tvp+llNnQOKWfeZVuBaB/9fPWQMHTFcFKvfAGo7ObRXC2Kdd1b9A1KcU
	267uk3bg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYNJ-0006ft-Oa; Tue, 24 Nov 2020 13:28:54 +0000
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
Subject: [PATCH 35/45] block: move make_it_fail to struct block_device
Date: Tue, 24 Nov 2020 14:27:41 +0100
Message-Id: <20201124132751.3747337-36-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Move the make_it_fail flag to struct block_device an turn it into a bool
in preparation of killing struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 3 ++-
 block/genhd.c             | 4 ++--
 include/linux/blk_types.h | 3 +++
 include/linux/genhd.h     | 3 ---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9a3793d5ce38d4..9121390be97a76 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -668,7 +668,8 @@ __setup("fail_make_request=", setup_fail_make_request);
 
 static bool should_fail_request(struct hd_struct *part, unsigned int bytes)
 {
-	return part->make_it_fail && should_fail(&fail_make_request, bytes);
+	return part->bdev->bd_make_it_fail &&
+		should_fail(&fail_make_request, bytes);
 }
 
 static int __init fail_make_request_debugfs(void)
diff --git a/block/genhd.c b/block/genhd.c
index a991f0122e53d8..8c734a4e8ff31c 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1276,7 +1276,7 @@ ssize_t part_fail_show(struct device *dev,
 {
 	struct hd_struct *p = dev_to_part(dev);
 
-	return sprintf(buf, "%d\n", p->make_it_fail);
+	return sprintf(buf, "%d\n", p->bdev->bd_make_it_fail);
 }
 
 ssize_t part_fail_store(struct device *dev,
@@ -1287,7 +1287,7 @@ ssize_t part_fail_store(struct device *dev,
 	int i;
 
 	if (count > 0 && sscanf(buf, "%d", &i) > 0)
-		p->make_it_fail = (i == 0) ? 0 : 1;
+		p->pdev->bd_make_it_fail = (i == 0) ? 0 : 1;
 
 	return count;
 }
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index c0591e52d7d7ce..b237f1e4081405 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -52,6 +52,9 @@ struct block_device {
 	struct super_block	*bd_fsfreeze_sb;
 
 	struct partition_meta_info *bd_meta_info;
+#ifdef CONFIG_FAIL_MAKE_REQUEST
+	bool			bd_make_it_fail;
+#endif
 } __randomize_layout;
 
 #define bdev_whole(_bdev) \
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c2a8cf12c5cab5..5d46ea7be7e4f0 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -56,9 +56,6 @@ struct hd_struct {
 	struct block_device *bdev;
 	struct device __dev;
 	int policy, partno;
-#ifdef CONFIG_FAIL_MAKE_REQUEST
-	int make_it_fail;
-#endif
 	struct rcu_work rcu_work;
 };
 
-- 
2.29.2


