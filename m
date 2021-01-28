Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6F306E5C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76670.138483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WS-00062P-BR; Thu, 28 Jan 2021 07:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76670.138483; Thu, 28 Jan 2021 07:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WS-00061t-7J; Thu, 28 Jan 2021 07:15:20 +0000
Received: by outflank-mailman (input) for mailman id 76670;
 Thu, 28 Jan 2021 07:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51WQ-0005xp-Cy
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:18 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fd3f813-19de-4249-8083-77ee226e691c;
 Thu, 28 Jan 2021 07:15:17 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:16 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:59:36 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:16 -0800
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
X-Inumbo-ID: 6fd3f813-19de-4249-8083-77ee226e691c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818117; x=1643354117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oh6V4IvaBATnJjcr0mcg+O0k1fwwkwTxUMEnAmiYk7w=;
  b=N/9xsZ4vaUqT4FOnsamVd0tO/aQtqkb2SkD9Lqw5RnvjLL3jaD5MzkR5
   +Kke1qnUFvRlpJzQI+sSe6H6sUN6iGFdjl9jqpGX2mjPG6wZ1jk7n6+Tt
   4QyAlu2458qBnQqPRGCFSYmi6NLhhDeBHtSjX68uOIf1Un/z8/FkLlu1q
   h7Ecg9AsPAKbYSY8QsKN32WQyr2E2duO2g0plsYxJSpyrpcthtYPbHtpv
   HAZWy6aj72kMtxTeXIXumTxoxrKZZjNitFc7fFtBJJdZdeWfcrVBvgeAb
   X6kYsiK11Dw0t5Bf77LLh0vlmjjFLh3+8h01K7b8QsCM6uC7ZymXjU33t
   A==;
IronPort-SDR: Z+JOTqyRzYtcry0F0dAKXGe2PYMHZgI+MMobDqmrZPh6GgGjOpfG3TLJMVEuNRUKjqELDSDF81
 7MC1fT0EYMLkcZ8R1L2r9LlqMYTQw2nI4X9Pj/EI9OS+nlysaahx9piv0i/lWwUnjVmC1hyjh+
 lXmfQmtvmAVUYIYSYxDAkTgCWwbh5L/hCVtJIOsPy/jWXKdBfTV5HSTS9cn15Ws5IHdN1/s+hN
 PQGrRECLaTyMLtku2Cej/wUTfmoAm6XJjbGpk99k447avo0qBZCSWAV8v0e3goBjbOeY+hMpW4
 Ly4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518390"
IronPort-SDR: 6szTg1BcMnTAmpFuggK4CSsHi1QnQw2SeD6YY8vs9Mho29fEl7YQ0OHD0eK8hRBny/QzZ5ZM4t
 ozeYVmIhGkHoeP0Qf4tRhCjSaBLgJ/ZDpYJPi9J4N6OPLXKBdrSEclHA/yrnKCDIIgXJ1VY9t7
 JSs2stogFLgY5P+o21xh/K895Eto2JO+cwB3Rj14zn1Cz13Qo+TM4Q6S3etzrqJjk35Pr12cVQ
 4/RM6Gp3X19y9CV22gPZUQciRp5T3qdg9GyCM9KvCdatgq4gZmLLagoTDoc01qvv1Ypy2OwKu1
 VO8V7fXSbH3vVenfK/ktJ31J
IronPort-SDR: VKPK85FFDQ0ubYH9k6Rw6wieHrPcfl4K1hBg1VEjOVVMtv+Wn9OrY3VfBreYbEOSh7D7aOPUjq
 dJWJ6VlQs6sIYpC3Ssc6YP0uwWxx1b9TT9J1h3Z9GJWPAkbpd7nwyEHzf2X7DKDqvOlXI3kZN0
 S1wmdVHTrX+2YjnNZtTeKY+gTEIX2ZCvjrzBqJLi0bsvbsghiV571IsEQgaSLG4TZiYK5W8fXC
 DCDkO56zOq766cZD9jubbH+fYuelJGqJtYeO7naSGnNxMZmGQNaOGjq3DEnkrTfIYty+jvU6Mh
 VMc=
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
Subject: [RFC PATCH 26/34] xfs: use bio_new in xfs_rw_bdev
Date: Wed, 27 Jan 2021 23:11:25 -0800
Message-Id: <20210128071133.60335-27-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/xfs/xfs_bio_io.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
index e2148f2d5d6b..e4644f22ebe6 100644
--- a/fs/xfs/xfs_bio_io.c
+++ b/fs/xfs/xfs_bio_io.c
@@ -26,11 +26,8 @@ xfs_rw_bdev(
 	if (is_vmalloc && op == REQ_OP_WRITE)
 		flush_kernel_vmap_range(data, count);
 
-	bio = bio_alloc(GFP_KERNEL, bio_max_vecs(left));
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = sector;
-	bio->bi_opf = op | REQ_META | REQ_SYNC;
-
+	bio = bio_new(bdev, sector, op, REQ_META | REQ_SYNC, bio_max_vecs(left),
+		      GFP_KERNEL);
 	do {
 		struct page	*page = kmem_to_page(data);
 		unsigned int	off = offset_in_page(data);
-- 
2.22.1


