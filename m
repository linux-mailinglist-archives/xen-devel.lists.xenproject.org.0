Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E2306E58
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76649.138435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vy-0005Zn-Qa; Thu, 28 Jan 2021 07:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76649.138435; Thu, 28 Jan 2021 07:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vy-0005ZF-Lv; Thu, 28 Jan 2021 07:14:50 +0000
Received: by outflank-mailman (input) for mailman id 76649;
 Thu, 28 Jan 2021 07:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Vx-0005X4-Og
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:49 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7078d0d5-27a7-477a-985c-0c358a16cb1e;
 Thu, 28 Jan 2021 07:14:48 +0000 (UTC)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:47 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:57:05 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:47 -0800
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
X-Inumbo-ID: 7078d0d5-27a7-477a-985c-0c358a16cb1e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818088; x=1643354088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3pvsXY5ThsGIWZu3d1vhsE8XvMocy29CAsL/BvlC2XE=;
  b=mPm7CbOZdmLtpobO9yq+nQO72k+7QULfahO5kuNYGQLLSAB6X63SC2d9
   CF4yrUPyPLt+tJg2JxreIoEztTiJ7udO2KztyBJFsxmdrY+DEBgSt+B+b
   GsVvUGzSYXwFB3j1Nqc4PLIJyCn9jPAFaPCLDf9CTKcK8eIOioEbrfdl7
   wEysO8uJyun88U9+IOcGefNYsTNIp9OkM6CbwcuFePIByKW/eXC6/sXFW
   n2GZ0ZA2zRrBDEc/Kd3ttPxBJOC0m0YP5O5kL/iAXrMPpoYBjcPSeN3fP
   QMxDg5aNPWHHzVln1HdHpuns9NU8KVNZyI5X1wMrCYlP/zhZztHje3rGF
   A==;
IronPort-SDR: lZjp/eMUSsMESHTtCChbwb6VyMiEXmTQ/y/IQ7/ru1m3c5xZhJ5D385B28E1b0tSh4Beu9vc7G
 9TFj7PhJXcFCMRjV+nIAbkbUAhDJ7WpFhwmB/x45QSg3Q+eUtWixh+312GHWTM/fzpy1RiU+a9
 dUxdl36JdXknm2Cq5Mk9OYJ97XMu1MQebHV3WAjmX8lgZLs+MLlvrJ4eguSPoTvuVbCGCzNL6P
 fsxNMzzgsqsjZlYCebY6aoOTH+rJuRZ/3da9/7OpqE2Ac1pEhJNFRyIW3s5OoHlcw6La41O3CV
 Duk=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963357"
IronPort-SDR: FSKzYQgHZ6rOGMnwTZeg+FPOT7Q3/2ZbeRA8q9SZM92IWDrnODMZ4lGtJxzmYRODLERERayUPK
 3McLtC5PipEkgHgTcRuGN1MsaQakfxBTz55VRXDFSVBDHhq5PuN30+p6u6yWh+kpxyg2a1v9B7
 jdsx+MbBM88qdHielJhWC7btuG3YgFf25wn9TtuwXg5SAS/5fcJ6yD1tjbgAym1uZmRonGfrAc
 2e+2T5j5oWvxY34zHe4DCvu+ZRADUkwfj1LZL8zWiPKNgVaPfSwED8V/JQMYbgtBekqGFuTpkn
 9iodV/HRODBVjoeqKHB8hkSI
IronPort-SDR: /NPjYa5/vzKcQxwITziayqgew/xym2P+2wPZ/H6tqOBM0Xhb9g154b50VotcIn3s/gPeO6yJQj
 jaDu5T7BNEIYITi6TAhnovFoYzPUstLQt0EGdLi5t/kGP6Y/bNfbV9+olcDvctAzlPCNttcR2B
 XcI2j3jvNIAhA1FsWohm0Q1E2hEvaC5Uto6Y7wmXZKJ1CZQCBzspE+8o3ZgyvyjFSagVsi+kvR
 d3gH64xpw3ry94057Mia9wtqUGJtdB9qbq+w9vxtVohjFozpBIeHLdl7QNCYcftS3gwSjr5dcQ
 UPU=
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
Subject: [RFC PATCH 22/34] fs/jfs/jfs_metapage.c: use bio_new in metapage_readpage
Date: Wed, 27 Jan 2021 23:11:21 -0800
Message-Id: <20210128071133.60335-23-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/jfs/jfs_metapage.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 3fa09d9a0b94..c7be3a2773bf 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -495,13 +495,11 @@ static int metapage_readpage(struct file *fp, struct page *page)
 			if (bio)
 				submit_bio(bio);
 
-			bio = bio_alloc(GFP_NOFS, 1);
-			bio_set_dev(bio, inode->i_sb->s_bdev);
-			bio->bi_iter.bi_sector =
-				pblock << (inode->i_blkbits - 9);
+			bio = bio_new(inode->i_sb->s_bdev,
+					pblock << (inode->i_blkbits - 9),
+					REQ_OP_READ, 0, 1, GFP_NOFS);
 			bio->bi_end_io = metapage_read_end_io;
 			bio->bi_private = page;
-			bio_set_op_attrs(bio, REQ_OP_READ, 0);
 			len = xlen << inode->i_blkbits;
 			offset = block_offset << inode->i_blkbits;
 			if (bio_add_page(bio, page, len, offset) < len)
-- 
2.22.1


