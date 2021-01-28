Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736E306EDD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76736.138590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51b1-0007fK-R9; Thu, 28 Jan 2021 07:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76736.138590; Thu, 28 Jan 2021 07:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51b1-0007dk-N0; Thu, 28 Jan 2021 07:20:03 +0000
Received: by outflank-mailman (input) for mailman id 76736;
 Thu, 28 Jan 2021 07:20:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51XS-0005xp-1n
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:16:22 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46873ac7-7b59-4e8d-9007-43eeeef2532c;
 Thu, 28 Jan 2021 07:16:20 +0000 (UTC)
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:19 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 23:00:39 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:19 -0800
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
X-Inumbo-ID: 46873ac7-7b59-4e8d-9007-43eeeef2532c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818180; x=1643354180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KxHF3VRS1HdpvW1dkgXeP6+bfyoqSsbsdMU7tIvbgNk=;
  b=iu5ToMmjT3V+P9Ny1GeOrvLZwd+2H25WQCLIKVqZdtQm2MU6AWv/VyAi
   Es0cUQMeQmJ2MqKkhhqEHSN5xcjDOtoQLLRP5JxEf1Wc7Ej4EMLam5arl
   WNOG96BPaDQCyl9GlZkLEtiT82Y66Q9d25A7pvjMUw03MfQcQiuBpVU8s
   NoMRDzR51Ppb+LXMOMF3hoYx5l0ddpKdoXAuCpngqtxkiKepXH0FDHeTc
   EceQlN1sRSPUcuzt19KSnLgAggitJagrFoZHxxZo312+mfgwFabcpDFAu
   TFJjk1SHmt5Zo51SvpH7JSWFJPh3R96+Wkp4CZUEEgHScfQy5iTdEzkqJ
   A==;
IronPort-SDR: 3pkBAcaoGuzV06ZtFef2zlOmet03jibTng12LemyungsglWByqz0lAOXHs/dgDdf6Hmxp3U3mK
 2PBv0jXUnSSZKC2hBxLtb8U8XgKI1ypp5ohV8zjEND2/pwge+FS3O6eVrd8bV41JaQ/4Ozfmao
 EnR0W4YVvaNDpqdNFQZ/eHH36r+Zf9857F1cLnc+pFS/4xjmdd7zTscnH0/o42q0UQD/xCBwm0
 9Lj9jZn75uxqMCSvHQM8eJI1DeQzDDMqshwRvne7lh+FXFp0wLFu/wZyw5AsOqqGxzt8mHZQg2
 cXs=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963531"
IronPort-SDR: 1LA7JLuevG4sT6KnJTsZsAaEQzYUxu0PSeh4AyFNx6wcL6cUqYUDuodSGWXGu2OHuYZeBHfVoe
 XOjZBvQNOEyVrm6UpvGNZfqUgyWtMvIc4dq/IA/UQhv3FWQUbbtIYkr7LdaDowEmx/blflCYQj
 h3wDra5qkbM1aFk81MrE+9gb1+MnImKxNX1fi2j6J6FU9D7psBjL1QhZ9rMIs5kr9QGVfHOB+7
 KCKhpgru2+vjZTcck6iQM7J28RwtRjHz5UEHrIVsJkXjru9KqamZhA4MnvUaGuOX0TgXZGzFoS
 p71m4ds5sYou8SgOWEM253xh
IronPort-SDR: e2VgktU8Igp+G/4kwCau3Wofn5lcroMY0YPC7tNcu39YNL7JBNMa1+cKXT86WcuzihvSj94J7W
 8sv8AfyOojzHeLFV1vgVT8Pm71/iwcQAmabu9Ufd/jwBkzWKoKpTzhJn2DWIwNp2e8mqIx3G5A
 LS7tN5JWZnYOGTkwZ/LMhdAEhsm6g9R10Edu6WiLHx+xz1R0nO/OSJcMH5j4uo+XVYn8ORNhbv
 mynrcW4WJ2Z8dThUFTylCCg25lF4TIegFSZNE+eSh2Iz0rquG/Dk4lImC2ZggxF5isWDJ8MWSG
 Bw0=
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
Subject: [RFC PATCH 34/34] mm: add swap_bio_new common bio helper
Date: Wed, 27 Jan 2021 23:11:33 -0800
Message-Id: <20210128071133.60335-35-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 mm/page_io.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 7579485ccb5e..cc30c9a0b0a7 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -287,6 +287,17 @@ static void bio_associate_blkg_from_page(struct bio *bio, struct page *page)
 #define bio_associate_blkg_from_page(bio, page)		do { } while (0)
 #endif /* CONFIG_MEMCG && CONFIG_BLK_CGROUP */
 
+static inline struct bio *swap_bio_new(struct block_device *dev,
+		unsigned op, unsigned opf, gfp_t gfp, struct page *p,
+		bio_end_io_t *end_io)
+{
+	struct bio *bio = bio_new(dev, swap_page_sector(p), op, opf, 1, gfp);
+
+	bio->bi_end_io = end_io;
+	bio_add_page(bio, p, thp_size(p), 0);
+	return bio;
+}
+
 int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		bio_end_io_t end_write_func)
 {
@@ -342,11 +353,9 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
-			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
-	bio->bi_end_io = end_write_func;
-	bio_add_page(bio, page, thp_size(page), 0);
-
+	bio = swap_bio_new(sis->bdev, REQ_OP_WRITE,
+			REQ_SWAP | wbc_to_write_flags(wbc), GFP_KERNEL,
+			page, end_write_func);
 	bio_associate_blkg_from_page(bio, page);
 	count_swpout_vm_event(page);
 	set_page_writeback(page);
@@ -406,11 +415,8 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_READ, 0, 1,
-			GFP_KERNEL);
-	bio->bi_end_io = end_swap_bio_read;
-	bio_add_page(bio, page, thp_size(page), 0);
-
+	bio = swap_bio_new(sis->bdev, REQ_OP_READ, 0, GFP_KERNEL, page,
+			end_swap_bio_read);
 	disk = bio->bi_bdev->bd_disk;
 	/*
 	 * Keep this task valid during swap readpage because the oom killer may
-- 
2.22.1


