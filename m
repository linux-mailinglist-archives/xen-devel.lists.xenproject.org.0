Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7D306E48
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76619.138339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Uu-0004f1-2v; Thu, 28 Jan 2021 07:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76619.138339; Thu, 28 Jan 2021 07:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Ut-0004eI-SK; Thu, 28 Jan 2021 07:13:43 +0000
Received: by outflank-mailman (input) for mailman id 76619;
 Thu, 28 Jan 2021 07:13:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Us-0004at-6x
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:42 +0000
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85411200-e327-4b7f-a61d-050bada68c6b;
 Thu, 28 Jan 2021 07:13:39 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:38 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:55:56 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:38 -0800
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
X-Inumbo-ID: 85411200-e327-4b7f-a61d-050bada68c6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818019; x=1643354019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OdHsUuhLqy4MrzmNdd/tdpH4dcVzXnQrrHk/wuqLVYg=;
  b=BmcUjl2e66oFnSa18MPNVGlB/flKPZ+C9X/e27m609RMD6t4EEHkLQvS
   ihTY/41u+4v8g5AgvKg5QTRxjluYE4xvKMI5B2XTEP1oqo/M+sYQCS91n
   Y/huMQPesj9CKY+W2icBSGBWAb3lWOEWy8V+02A3a6ez+aOEt+fHLeYOh
   DGePOZllzlDtHTetWOWpMjD753bxWA48wdbjhWIFnc7nL6FRG99jZ3iG4
   krm8v3Mx1/2lhg6DzR9Bk8qdbXDWolxSBQ61tEXWT4Gl57X4bSaKDova8
   wqrabiM8qBHRKwl1/ZNrjmCIRJ3z0qFn+7a6cpPxBNHsbPplVfJqvBxCY
   w==;
IronPort-SDR: 9tB28j1q+nnIPuDB5wePPnLsv+Mo5WRek8Uh+zU5su/oJexnaAaYu9yPRqaho091YftwlpUJBE
 PhX3rQffvkggnbazPvdbC5aZXrUJ9S/WG8zbB/hC8pka+zkamLggTJ9gcgMB5qVM7byIp5uUmq
 AV72Hii6/Ui/705IHx5ZpKWsbcumeu3J/exRk4/yPggJGQE9Le6tDjfAAy5ssecXCn+T+6pyVG
 TzzfTaxKw4oYrKb8ZwUCxT8YmZ3SK4zk1jie//PSY05+/j626pRwX1fxsoZ0fYyF+DujVimOrj
 j2s=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="159693858"
IronPort-SDR: fmFECU/ozojdAGO4TaFB94S6o/akCQP5Na+pHyxekpThs8wHDa8O2Ehtmi0q7ax0Igbtiu0Shv
 nE/wwFwlPEksS13Rys+8U5cq8zVV5nlEkhVhIvYArOA9IVZ/2JwX6yjmECTimHfDVRAp/5Ehgi
 +QoVQbFDbkMq1PIsbaFhPwknOvaTq8yVEhifj8Re8s2LfMiLd2XTIohDt387FZP1fY+9ywMFbs
 yo7QaRE7MYJ8czE4PCNOYkpFvU3PMlN+24Sx17iDATDVngu8lqKN/8D9Sn46Wu6Z3sGmIxNPG/
 vesTxhe1MXqN0GNI+/HLzYtH
IronPort-SDR: Soam0z/hZs1yuoqW7i6jx5roOoHAapZwcG8+RboeMSicIzBmOYiX0n71yThGE0I1AnlhuM1di0
 VAe/ab59Zj3d54HqeQwwCvYowNBZyfmch3v7Oy4azaqst0BpJQIg4rXG9R5IU/X7180i4BamQI
 Pdm6cEOWuqZT053sZGwqRvhtwriLsaGVJTX83nQ+r2PwZZdfIXxXkXEJoScfk1suUPevohY8gp
 ghp78Zzi9GkjGDnNvz6HqiAkBvVb/9awaEDn2T+13/9ul6gQjwyqb4x2IkJNU2l4rR1clxPnay
 0k0=
WDCIronportException: Internal
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Cc: axboe@kernel.dk,
	philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	minchan@kernel.org,
	ngupta@vflare.org,
	sergey.senozhatsky.work@gmail.com,
	agk@redhat.com,
	snitzer@redhat.com,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanya.kulkarni@wdc.com,
	martin.petersen@oracle.com,
	viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	ebiggers@kernel.org,
	djwong@kernel.org,
	shaggy@kernel.org,
	konishi.ryusuke@gmail.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	damien.lemoal@wdc.com,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	rjw@rjwysocki.net,
	len.brown@intel.com,
	pavel@ucw.cz,
	akpm@linux-foundation.org,
	hare@suse.de,
	gustavoars@kernel.org,
	tiwai@suse.de,
	alex.shi@linux.alibaba.com,
	asml.silence@gmail.com,
	ming.lei@redhat.com,
	tj@kernel.org,
	osandov@fb.com,
	bvanassche@acm.org,
	jefflexu@linux.alibaba.com
Subject: [RFC PATCH 13/34] block: use bio_new in __blkdev_direct_IO
Date: Wed, 27 Jan 2021 23:11:12 -0800
Message-Id: <20210128071133.60335-14-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/block_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 9d4b1a884d76..f3e3247894d7 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -367,6 +367,8 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		return -EINVAL;
 
 	bio = bio_alloc_bioset(GFP_KERNEL, nr_pages, &blkdev_dio_pool);
+	bio_set_dev(bio, bdev);
+	bio->bi_iter.bi_sector = pos >> 9;
 
 	dio = container_of(bio, struct blkdev_dio, bio);
 	dio->is_sync = is_sync = is_sync_kiocb(iocb);
@@ -389,8 +391,6 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		blk_start_plug(&plug);
 
 	for (;;) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = pos >> 9;
 		bio->bi_write_hint = iocb->ki_hint;
 		bio->bi_private = dio;
 		bio->bi_end_io = blkdev_bio_end_io;
@@ -446,7 +446,7 @@ __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter, int nr_pages)
 		}
 
 		submit_bio(bio);
-		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		bio = bio_new(bdev, pos >> 9, 0, 0, nr_pages, GFP_KERNEL);
 	}
 
 	if (!is_poll)
-- 
2.22.1


