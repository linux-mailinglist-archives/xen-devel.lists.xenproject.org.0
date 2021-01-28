Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC996306E38
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76582.138243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Ti-0003ll-Ev; Thu, 28 Jan 2021 07:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76582.138243; Thu, 28 Jan 2021 07:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Ti-0003lC-AW; Thu, 28 Jan 2021 07:12:30 +0000
Received: by outflank-mailman (input) for mailman id 76582;
 Thu, 28 Jan 2021 07:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Tg-0003e2-T7
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:12:28 +0000
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 137ebf97-0169-4203-a9bb-30765848f164;
 Thu, 28 Jan 2021 07:12:27 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:26 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:46 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:26 -0800
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
X-Inumbo-ID: 137ebf97-0169-4203-a9bb-30765848f164
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817947; x=1643353947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yNs/pnE8yDpXGswjvz9qkLYz+CA1dL9+4aNznurTKfw=;
  b=ABqU0TSLndvxDDWKfL5zVGwpxOOy19qhSPFc5HmUY2mnGdtSaNggSoFg
   potYzDbECGCx6ycrzIuG7KOMDkzGvkNrD736uvfYR7/CHzHKsmFIhXXLt
   R5H0LfnZItvqgJmo93KjECDJFniM56JettL6AZYiWC8fbZeZEvb3QeP+5
   cwNFNzg58qYJD5QkLPad/Tl47BGOWYVg6sOxN6n/zwR7QkwaoG7BI0nuK
   205irqTa5aT9d03xdWv0PbGzP5JNfTnyyFiqDcaUphlvlNKQB/R1AbYMx
   2yEf+KSSQefgLUNtP4KtBknKiKXcC+y/zRh6BCE3zlwELA98BuzJxZnGI
   Q==;
IronPort-SDR: Mv1tRe6U/EO5kUv1FeWtqgcDQJUUExtDzrSUhjgk7JAI6KP4Li+dnoI3okQt3nbSq2u4t9K6FE
 1DaZwYEXkXOyzofZofWdTGrzJ8X81Q9Z3p3BR2SS3zx7RQWxdp0SDS5/LzX0BDwYTWmOz6aZDn
 zyYPS2oo+1KuxXeqqS2M9OFa33qC1Vn5pOd1I96fklPxAXFYkXJeYMwV78eRNCCWVI0acQZ23H
 oMadudcLFsP5L8jXXg+xLhGMM77ewHXj4fTDvhcrYgyVuRgNUP3RmcdDKYVlnekODhsfNf3s/n
 2qs=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="268892389"
IronPort-SDR: vtLaAN5oc3j+BEPgkSi3uqE78KETxSIhCasFKkZ0GSPc7o8wgtr09TmfI0aiUc0gBQh/j5uCa+
 X9719Q3w8GgxS96CvH6IVb+ex1ueRFnBLv4b5V5EFZEuBz3DLfDm3RnGNvSmPB1M3sboUnyDD2
 NZOWBEQp9ZfkyS0srDBETR1C4HWz30icYBXxOzN0p7bK866e0v/uvdferIF/9Z1sZ7M6cHcaq5
 VxYHMxn08XJEIZlCBMcLYheJL3btw4xO+6a4hw46oLBcAiKKU151Gf5ThOVM/OMCH0gngpchby
 oCcdFuapDLQyKM07K6WJM1cb
IronPort-SDR: AXyfJ+0DzRblLd1C2a8i26F/p5ozSimYWSlSS31hVM9ZD6XicSUM+PrSEKfC1Dird0dpCST4jr
 RH8MY1sbvDVq5P84PowPihV3IFXmyzQNH7jhgBGPCvDUQHmJMRxTWJczw7haMsXH6G94Is8ChW
 3Thpc5BIBnKiKhlT74BApZ+91+Tr+DAOOck7bXVmzNs8yvwHiSmvLe1vToPqpHXLGvuEQ8CHDc
 wMtFD3vO2n6mQgoI8Yf56mEPo6oNIWF003bHhQMN3DD+ikOw4kJGblAZl7I7M30srcHVxOHbPk
 wqE=
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
Subject: [RFC PATCH 05/34] xen-blkback: use bio_new
Date: Wed, 27 Jan 2021 23:11:04 -0800
Message-Id: <20210128071133.60335-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a wrapper on the tio of the bio_new() named get_new_bio() & use
it in the dispatch_rw_block_io().
p
Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/xen-blkback/blkback.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 9ebf53903d7b..3760278f0ee6 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1174,6 +1174,15 @@ do_block_io_op(struct xen_blkif_ring *ring, unsigned int *eoi_flags)
 
 	return more_to_do;
 }
+
+static struct bio *
+get_new_bio(struct phys_req *preq, unsigned int op, unsigned int op_flags,
+	    gfp_t gfp_mask, unsigned int nr_bvec)
+{
+	return bio_new(preq->bdev, preq->sector_number, op, op_flags, nr_bvec,
+		       gfp_mask);
+
+}
 /*
  * Transmutation of the 'struct blkif_request' to a proper 'struct bio'
  * and call the 'submit_bio' to pass it to the underlying storage.
@@ -1324,16 +1333,14 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 				     seg[i].offset) == 0)) {
 
 			int nr_iovecs = min_t(int, (nseg-i), BIO_MAX_PAGES);
-			bio = bio_alloc(GFP_KERNEL, nr_iovecs);
+			bio = get_new_bio(&preq, operation, operation_flags,
+					  GFP_KERNEL, nr_iovecs);
 			if (unlikely(bio == NULL))
 				goto fail_put_bio;
 
 			biolist[nbio++] = bio;
-			bio_set_dev(bio, preq.bdev);
 			bio->bi_private = pending_req;
 			bio->bi_end_io  = end_block_io_op;
-			bio->bi_iter.bi_sector  = preq.sector_number;
-			bio_set_op_attrs(bio, operation, operation_flags);
 		}
 
 		preq.sector_number += seg[i].nsec;
@@ -1343,15 +1350,14 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	if (!bio) {
 		BUG_ON(operation_flags != REQ_PREFLUSH);
 
-		bio = bio_alloc(GFP_KERNEL, 0);
+		bio = get_new_bio(&preq, operation, operation_flags,
+				  GFP_KERNEL, 0);
 		if (unlikely(bio == NULL))
 			goto fail_put_bio;
 
 		biolist[nbio++] = bio;
-		bio_set_dev(bio, preq.bdev);
 		bio->bi_private = pending_req;
 		bio->bi_end_io  = end_block_io_op;
-		bio_set_op_attrs(bio, operation, operation_flags);
 	}
 
 	atomic_set(&pending_req->pendcnt, nbio);
-- 
2.22.1


