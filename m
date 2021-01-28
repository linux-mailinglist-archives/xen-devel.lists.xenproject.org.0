Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A1306E54
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76635.138387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VS-00058u-GD; Thu, 28 Jan 2021 07:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76635.138387; Thu, 28 Jan 2021 07:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VS-00058F-AI; Thu, 28 Jan 2021 07:14:18 +0000
Received: by outflank-mailman (input) for mailman id 76635;
 Thu, 28 Jan 2021 07:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51VQ-0004at-5K
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:16 +0000
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8ca2039-dd26-45e2-ad6f-4b3d53f460d7;
 Thu, 28 Jan 2021 07:14:11 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:10 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:28 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:10 -0800
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
X-Inumbo-ID: c8ca2039-dd26-45e2-ad6f-4b3d53f460d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818051; x=1643354051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0nkVYESNcCP1ZuiY2joF5zZXurD0RzvJ1s1BM2N7jGA=;
  b=ZVcxLlzRKElg0u8TXFmI4lzEQt9BWuAqWhttYEhWH3KoMO6Z91dGYaKT
   a7fwpum/0OmqryxvtnKMyDssyMtKOJiUIbubWZhgY8Vz8e/P8NE+C60X3
   MCRdGhtlQjoyI/sMRvEtbbCRzGOnVx8Rzta6a8W1QAd1LL23Sjz+4GMqe
   JMsUMku4Us/MZaY4oQbQNgiCa8k3sjPor4FoWqSktj7h8YmQmwKqrcmKH
   Lq9FabIXMnRNE+0zNQttALYDA96Ks6KO6gBOS9QC0dXbIJ+PZMTdr8i1D
   yKrSefYQpyHmHIY6B7rwbIoACt3EZviclFoYYWDqp/DOd6WbEehLmTI6a
   Q==;
IronPort-SDR: CUDo5p95W9tOieIQT/wbDoPPgXN8QL6mi8l6K2R0rDtA97wKLfAaPMMjBydckHtsV7t+tvKARk
 qVSf4WtNVnwBgCmyA3Wjb8COS5AviElUuNCTjNXV9mOkudq6IFEMAYE9u9H0FdgZp+/EbWxkTF
 qgH70VuaZ8G1co3YCGtcEZmoawKxI/9awmxddgWeVEp+8ur85573n+OUdH0vj2yE2F7+0HEPct
 EmmXzNjkzy8H2XIjARhrTbaVndO3B1S1dX/hvRaYjL6gw2odEHhyPN9NDEJHEqz9FVOMAT9dJf
 HYo=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158517410"
IronPort-SDR: L/VInY705JlXACbJkMGxb7OFP8KHDfxN5GNWTq6G/fmkGM72rSOkp4/mkhVrAue88h19Xy13Bu
 dyTvQBHPIfHhdVI0CqOA5zMpvfPIn84U/UuYNXkFu5ATTAEoUUqdWYpnhC5YlBBRhX8IMVP2cF
 8rA46cizFU5Igu1j/tm/PblN/0JypXqjSh2VZ1I1cG9D4PjEUyp8Xf57PY8arzufsM+eayrqK0
 SH9eglD1o7DrgenSU+Dx/vstvHBzNdsI37hKPMPdUiS68bmrfuWQnuMzc6HtIVpnOoYVgv0lJW
 Ioangw+oCllSWtVekkCVmo00
IronPort-SDR: lKKhoxaMeyOwXqrT2FSzD4wN8uVJ+mvKyFTUKLm7JjK92Do6Pp8LlRaYGgmaQWgAcNgigcbWq0
 dr8eH/C5m6jarJyZCPupuIjbqQYzS6I98zkdR7vs+3yNowqMQiZeF1CHZrTo/tpym1SjWfvRXs
 6jUItt1/GcDgh349QalPLGcjYuMZ5A1EKw0wTA/1PN33qNlegyypjYwNakr5Qt7Zi77XOTVrdO
 glPMuXb+RS4OnELTigLzoH/k3P2LKO+/yrMNDKd4LQa/txopqXKI4iyznrBVm1YJBPOgSOjnjZ
 uxk=
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
Subject: [RFC PATCH 17/34] iomap: use bio_new in iomap_dio_zero
Date: Wed, 27 Jan 2021 23:11:16 -0800
Message-Id: <20210128071133.60335-18-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/iomap/direct-io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ea1e8f696076..f6c557a1bd25 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -189,15 +189,13 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
-	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, iomap->bdev);
-	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
+	bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), REQ_OP_WRITE,
+		      flags, 1, GFP_KERNEL);
 	bio->bi_private = dio;
 	bio->bi_end_io = iomap_dio_bio_end_io;
 
 	get_page(page);
 	__bio_add_page(bio, page, len, 0);
-	bio_set_op_attrs(bio, REQ_OP_WRITE, flags);
 	iomap_dio_submit_bio(dio, iomap, bio, pos);
 }
 
-- 
2.22.1


