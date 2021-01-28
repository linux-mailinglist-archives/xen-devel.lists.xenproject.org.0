Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F90306E53
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76630.138374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VI-00050s-4B; Thu, 28 Jan 2021 07:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76630.138374; Thu, 28 Jan 2021 07:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VI-00050H-0H; Thu, 28 Jan 2021 07:14:08 +0000
Received: by outflank-mailman (input) for mailman id 76630;
 Thu, 28 Jan 2021 07:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51VG-0004at-55
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:06 +0000
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38a5af84-08f1-40a3-a2bf-279b83347813;
 Thu, 28 Jan 2021 07:14:03 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:03 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:20 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:02 -0800
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
X-Inumbo-ID: 38a5af84-08f1-40a3-a2bf-279b83347813
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818043; x=1643354043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+nCtEeEc6ftLNfXULXJD9MfOSjGF3wrLBEXOv9oezHI=;
  b=mGMHMACVYdi5FiLtGjJiyXx6tYott3zQopn4qTNBqtOG7JuQ2trtio0O
   9aUONhKGZkoO5i0NgCH96neygJdAFv4CT7cIyRIw0xwdBfpzVWcqemvPA
   xbZTxuruuZjfnRzHoz0Tk4cdeyj+jqwW3U/qqhf11t2OToho4vVzRd2bx
   zKd8EmnhWqkhMSzVDsmvUdO4mExjkBF1NZyuee6JPZNukp6BlYDmwNyWp
   3O3jkCGKmOKR5IYHS9qkyeHfuLASbOdBcpKLzGZ2oAy+z0AzWMaafYaeB
   hsV/xvUmeFQ9I1IOiOldMW+i31fRKH38Y4R5v6YdEGpTrqnS04wiGBPc8
   g==;
IronPort-SDR: WffcUY7bvyf0WjRpF8NVaETUrcT9JdLXbdh9tHv7drXZroN96+svLlrLd+0a0rWnxHQ065JZMS
 KfNc1dL7Z8OwqmLsBjJL0WKVemzGJv6ZOi8PrrSSEXJyXBPybU4MfpAROj6LvlHpktxrIZQUpY
 Cb1h/rGWTXB0JnosNca8qc8Vfz+bCQKnn6hkvC7/zECT9+VPROmi4ktOYMRKR3vrp3/O31181p
 9AHI4h/Hvq5XOaQl7H/9ivEZ7R60mTcJ9yQIWApadU7bLv9wnkRHPIIwzL75B/ooAz1hi2jsfH
 43c=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="159693891"
IronPort-SDR: BrWFwASdanTfo/yZF9eDLHp1M6QnBBw0rAdQgsB968atZAgRzuAT2HRxDGPaRPxF/4uC/oRssP
 /87zsVdKOxiG+JKJn7qJn9ZZ6UdnxvgE9xGVF8zXFWDjO8mh1KvlfO7boSfHIW84/xXdvxudgM
 SdindsHdU0BDrt08w0WWbE1V4occ4a9j28wvGFF6i8+T2ql0SglwySk8Q9O1+FuK01SUtc4lW3
 cx+beVEpwlrsn45ABAROEqeHuDxkqEheshirncNHBUXqZcX9mfTFNUucD5cqFJGCiW/IncYv+U
 pzfjstKUT4tY2mVsi/Pmj8m+
IronPort-SDR: bKh0CeniWKxunCNm+jG9l29yuZPN3D1Gz/JAN/nXUgFIRD0d9U6vumFzntseHSRI/MX2HRMaPA
 UMPAuzQRLKKctTclKUM2aKzz/TiMAXwUZH3o+WrBdocCIchNR3Uaqkot1vGRPosruVN9zghU/S
 4vOkqxWogelsFgsfoTKuGHPXS0UKS78L+4719OXJlLRXt4xtaxkQvpBhG3tmxGAdTiSRUPHfPH
 NMPtpPqqTRUN1CMc8PtnqpeNKU9vUEZxV6F3t4AwWzk79mqUHtn9Cp1IEV7L86NNsrAMFQsKWR
 ljI=
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
Subject: [RFC PATCH 16/34] fs/direct-io: use bio_new in dio_bio_alloc
Date: Wed, 27 Jan 2021 23:11:15 -0800
Message-Id: <20210128071133.60335-17-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/crypto/bio.c | 2 +-
 fs/direct-io.c  | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 20dab9bdf098..28cd62ce853e 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -148,7 +148,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -EINVAL;
 
 	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
-	bio = bio_alloc(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
+	bio = bio_new(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
 			GFP_NOFS);
 
 	do {
diff --git a/fs/direct-io.c b/fs/direct-io.c
index aa1083ecd623..6aab1bd167bc 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -397,11 +397,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
 	 * we request a valid number of vectors.
 	 */
-	bio = bio_alloc(GFP_KERNEL, nr_vecs);
+	bio = bio_new(bdev, first_sector, dio->op, dio->op_flags, nr_vecs,
+		      GFP_KERNEL);
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = first_sector;
-	bio_set_op_attrs(bio, dio->op, dio->op_flags);
 	if (dio->is_async)
 		bio->bi_end_io = dio_bio_end_aio;
 	else
-- 
2.22.1


