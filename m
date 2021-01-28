Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30093306E5A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76661.138460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WE-0005oy-IC; Thu, 28 Jan 2021 07:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76661.138460; Thu, 28 Jan 2021 07:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WE-0005oK-A2; Thu, 28 Jan 2021 07:15:06 +0000
Received: by outflank-mailman (input) for mailman id 76661;
 Thu, 28 Jan 2021 07:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51WC-0005fA-KY
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:04 +0000
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32764df1-7018-4ea7-8610-3e6724f698d9;
 Thu, 28 Jan 2021 07:15:03 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:02 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:57:20 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:02 -0800
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
X-Inumbo-ID: 32764df1-7018-4ea7-8610-3e6724f698d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818103; x=1643354103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTRBelY7PTDZbFRPdQdHgUhYseaoF0bY2tLyF8ypbSg=;
  b=ByXjOQviNjNgXtwnqW/T6IzPNeS+qZuS8XIl7jeqlnsAk1geM1Btt4M4
   WRoe0Emeatja+qXFuDNDq+qspChDgoKSlT1GVE7O/SmfF5msw0Jevid/a
   fHlghhurHoF0Hd4L/+89L+Ap40DYT2mwt26PO+Jd3oxo7EKEDa3xNaY9g
   39keBLXzYhqgSmaj1f1pdfGU3SKNgPm8LIMgE+EAcNKSTbc3BzXPhXs/2
   5izk9S5T/tDVNHbXCScMrOVBzyoop1ABRegzpnDjLzRephGz4WyRPsk3o
   XoIaf4CJQlZa4AQjO8+3zUUtF/HbPJtOED6zbdqF7oBbQzfq/RohiXWz6
   w==;
IronPort-SDR: Z5Pu5IFCYXkSshom1iiCgpoCUs78dLPitwcLyKSZ8FrGoj7fjZsjUc2LDUsvhz5qfONN/TPDgC
 2bJ25Hul/NR1CppuWgUR7yB+TSxYPSXqR4J5XwbsgbdQnAMVTboNqiFOQUv/BZpmjWNBS0bFCQ
 hf8rS97Jor6uX+rytS6e9CVLJ88Xl55IFrwl+hUcMJphgOwJNjUBVrHgO7vdX2ngTnGzwWGBcV
 qFt2xiKjXw3OBW8KQI2QwNWI/X2wsNUYF/4KdhZ2IanlxaEyJj7/PVsGH5ELjnTM+Utn0xUKGb
 PNI=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="268892608"
IronPort-SDR: qt6uqyl+nyhvkzSlBF0UfG9XFFoOXcQij6f+Pgod2v9ir5/eLsSIoYaPnFPnbxUlBn9VUdoRED
 79PgF/GbNJxMwwJpp4ICRFwu2Ga2z3tPPNKgWSb+c7RR6W3SavfK2leS9SeR3OPRg/A4FjtT6R
 Gk9MyKLceK+JzfMX2gvFGZEXxVpzHqCx0M60n6mvO5Sl6k/F4TZqsMe2ErKwnIxDLfsI81nq2m
 uGsfFFtzoti9NgI2Jfm8fbweiIPQrUOM1cEqtt8A+BIJVhhooc6iJeLSIn9Zlzeal+kxxs3Q1p
 hs5Z16QWPKoipZC9IVPItcoq
IronPort-SDR: RvbuIrKpOmmqZ+oQPbnvg4P9b6yDctCj11PDSHseFUe3NzGe7aNswGzNT7aYrNNymGc7RRLBwA
 EyS5TC5ya2f1DBzchV289rrRJN4G30R6UcKQHWHLCT1EqyVYm8BdK2p8B74xj927ubYpSXJJYX
 yqNCzY6cgWt8a45E/OUvNDiMBg+lmhS8FA2ZqgTfl/62S3ZiS0x0JS7q7oikS9hfGQV2kW1Mb+
 vR4fnDhlmPbHKapqq2eTmDAeG1Ipck513pFwPBeDtMk5IkG3qgl83KvWp5povuzxSWxrnJjDon
 5kw=
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
Subject: [RFC PATCH 24/34] fs/nilfs: use bio_new nilfs_alloc_seg_bio
Date: Wed, 27 Jan 2021 23:11:23 -0800
Message-Id: <20210128071133.60335-25-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/nilfs2/segbuf.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index 1e75417bfe6e..df352cab7a93 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -383,15 +383,9 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 static struct bio *nilfs_alloc_seg_bio(struct the_nilfs *nilfs, sector_t start,
 				       int nr_vecs)
 {
-	struct bio *bio;
+	sector_t sect = start << (nilfs->ns_blocksize_bits - 9);
 
-	bio = bio_alloc(GFP_NOIO, nr_vecs);
-	if (likely(bio)) {
-		bio_set_dev(bio, nilfs->ns_bdev);
-		bio->bi_iter.bi_sector =
-			start << (nilfs->ns_blocksize_bits - 9);
-	}
-	return bio;
+	return bio_new(nilfs->ns_bdev, sect, 0, 0, nr_vecs, GFP_NOIO);
 }
 
 static void nilfs_segbuf_prepare_write(struct nilfs_segment_buffer *segbuf,
-- 
2.22.1


