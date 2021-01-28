Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C6306E2D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76571.138207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51TF-0003TB-B4; Thu, 28 Jan 2021 07:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76571.138207; Thu, 28 Jan 2021 07:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51TF-0003Sa-6h; Thu, 28 Jan 2021 07:12:01 +0000
Received: by outflank-mailman (input) for mailman id 76571;
 Thu, 28 Jan 2021 07:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51TD-0003QU-Ph
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:11:59 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 062e1d88-3293-431d-a3c9-ee9f572ce136;
 Thu, 28 Jan 2021 07:11:58 +0000 (UTC)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:11:57 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:54:15 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:11:57 -0800
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
X-Inumbo-ID: 062e1d88-3293-431d-a3c9-ee9f572ce136
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817917; x=1643353917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Q7huJyMDOVynURh2o3jolV4xRilOq3cl8xkF29/liU=;
  b=enGvdYf9NC84Zw8fbazQwuF8lHG7Hl7OHG0Djn6p15CQ6sFWQnSTdMIE
   fTVb2TGE7FlZTfw/GSjjxlF8nlg6qwVG3KwfAiR9/Sb3jbYufvvtcwSDF
   uRuW2DIRa+wWd+gEg/P94nTH9uFQdCSYAJg82Ys9HYgDM21+absYlbSFy
   r1Y7ZFsFafQhwTFE0hF4lHuvM4ibWvT1gCpdwtL+fzmm3p6AyJSnMOTyk
   iCSboWzoGwZ+lY/cihXiZ/SnVrv3xPyB6RsMsbW4QRpoEo6xXdH9RfQFO
   C26zlsxlQYPVKqFwWyWh1tH/tUYek+t4qaUQZm0ja4Hm/fZDXuHpSEoIA
   w==;
IronPort-SDR: 8/dBKA7g/jbRzCZQg8lJkOc/yY6kSqYaDab+Qwamz43l63acYbyrw55KYd8E88hJ/2S18+xLDx
 34HJ1ZzvJbk3iIqM0QLbkVgAV9xf2UGJW0IHCnpFfvc092M5n1y9oe8Yu5ZwMP68v3j4sl1GQD
 jNYRfiGszaTJeCGQ9wovfl8D5XqpGyxMM2MtP3LpRKmZP+c/8UQgUFCtYNhYNpDb6W9fPYCCRw
 pi4ninNiqvJ5LLJuvbsMg3pfVxNf3TeDidcPKBNI1f/Qv1spgjuryrUrAa3Dr5s4UuUn4ETXBO
 Ap4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158517995"
IronPort-SDR: rfQpYOswVNFR2gS5xT3kk1zuVCn6nMX/nrwfivaz/wWQ5oqSiqcBR8y+LbTIOAR1VlKnfwdzCX
 pgmDoujWGwMsqy8TiKbKr0dZnxwwv7dIc0sgGlsLJkBXZ9WGw0zXPypvaKgWZTxDO8eslsgk6e
 EEZz3l8yfORjDN6QdKYDQhLJ8/F7XLcCEwJoxAMlQQlDK/cTN3ymDwF20i/2Ux7cobX4NoSCex
 W2lzL8X+PCJFxvxcVmVSIvT3UIr781Kl0DuO5kZ1Dg/0tSkr0w4SgUfWMLskjEJyF7nEMcj66F
 4Q109esZwg0XsCE9Kisw6n8G
IronPort-SDR: HYKG8+pmcZ9KZ4KZ0ijEvKFdi7W0dgGDXHFsWIaWNxW3zaOZulAuYVmKBU97gor6eDg6ylP5Ni
 6/ahnxe6yM79ewZwsqKvrfMjvqQiAhLVOYCtlxS8Bh1Gz/vhwXPlVRnl4SwtLQD680yYKL86EL
 o3y724i0cbqHM9ChTIb0swq0MYuYoJx+iwqVjQ/XkVzNSKEtJ8uwRbdybmRUPVMHWHGtPAl98+
 IjNd0sVxBZiY+I2eDgAQpiJ9r1dqmBNoZAqnfBCkqleNy/DSVZGKQaXDO89s0wR1FlZS/ZCSSd
 5w0=
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
Subject: [RFC PATCH 02/34] block: introduce and use bio_new
Date: Wed, 27 Jan 2021 23:11:01 -0800
Message-Id: <20210128071133.60335-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce bio_new() helper and use it in blk-lib.c to allocate and
initialize various non-optional or semi-optional members of the bio
along with bio allocation done with bio_alloc(). Here we also calmp the
max_bvecs for bio with BIO_MAX_PAGES before we pass to bio_alloc().

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-lib.c     |  6 +-----
 include/linux/bio.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index fb486a0bdb58..ec29415f00dd 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -14,17 +14,13 @@ struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
 			sector_t sect, unsigned op, unsigned opf,
 			unsigned int nr_pages, gfp_t gfp)
 {
-	struct bio *new = bio_alloc(gfp, nr_pages);
+	struct bio *new = bio_new(bdev, sect, op, opf, gfp, nr_pages);
 
 	if (bio) {
 		bio_chain(bio, new);
 		submit_bio(bio);
 	}
 
-	new->bi_iter.bi_sector = sect;
-	bio_set_dev(new, bdev);
-	bio_set_op_attrs(new, op, opf);
-
 	return new;
 }
 
diff --git a/include/linux/bio.h b/include/linux/bio.h
index c74857cf1252..2a09ba100546 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -826,5 +826,30 @@ static inline void bio_set_polled(struct bio *bio, struct kiocb *kiocb)
 	if (!is_sync_kiocb(kiocb))
 		bio->bi_opf |= REQ_NOWAIT;
 }
+/**
+ * bio_new -	allcate and initialize new bio
+ * @bdev:	blockdev to issue discard for
+ * @sector:	start sector
+ * @op:		REQ_OP_XXX from enum req_opf
+ * @op_flags:	REQ_XXX from enum req_flag_bits
+ * @max_bvecs:	maximum bvec to be allocated for this bio
+ * @gfp_mask:	memory allocation flags (for bio_alloc)
+ *
+ * Description:
+ *    Allocates, initializes common members, and returns a new bio.
+ */
+static inline struct bio *bio_new(struct block_device *bdev, sector_t sector,
+				  unsigned int op, unsigned int op_flags,
+				  unsigned int max_bvecs, gfp_t gfp_mask)
+{
+	unsigned nr_bvec = clamp_t(unsigned int, max_bvecs, 0, BIO_MAX_PAGES);
+	struct bio *bio = bio_alloc(gfp_mask, nr_bvec);
+
+	bio_set_dev(bio, bdev);
+	bio->bi_iter.bi_sector = sector;
+	bio_set_op_attrs(bio, op, op_flags);
+
+	return bio;
+}
 
 #endif /* __LINUX_BIO_H */
-- 
2.22.1


