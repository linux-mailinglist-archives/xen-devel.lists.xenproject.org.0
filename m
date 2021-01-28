Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1B306E4B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76623.138350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51V2-0004lu-GM; Thu, 28 Jan 2021 07:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76623.138350; Thu, 28 Jan 2021 07:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51V2-0004lO-CY; Thu, 28 Jan 2021 07:13:52 +0000
Received: by outflank-mailman (input) for mailman id 76623;
 Thu, 28 Jan 2021 07:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51V1-0004at-4b
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:51 +0000
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b0a8e08-2d3e-432f-a1e1-97912fa5dfcc;
 Thu, 28 Jan 2021 07:13:47 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:46 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:04 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:46 -0800
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
X-Inumbo-ID: 9b0a8e08-2d3e-432f-a1e1-97912fa5dfcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818027; x=1643354027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ph9rmwEURyYiJjcGgT3e2aApJZNJOSNpUoZqKSV1dx8=;
  b=R0H0BBlYwokmIFrBez2p9fEC8db94MCPractRJhmKSgF/0N/EwjucYDp
   eInEL+qyXGnxxTG86wUtt/iEWKav4ntKme4SwWqQA4xGYtFSXhfQ04MxW
   XXeP/JbbboWTFmyOgcplJH7RHIyoQ1LZI8c5yO/EMTkEIZL2MpHiripYl
   s4UZ8Eemx2yAV7seL0AUPeyVJbhHX8kgU87L3h3OYpZcIbWRJyLRq1Oue
   746ki6pS2w1WTulu1CS4W6DwGVSyHr7vAGiAatIBAiYVoCvGBirxusRFh
   elZDMhiH/HYtyOToZZ3FiA8wvn9KhpVlfJ7Lb2OK8RdpTD1tLAp+55gUz
   Q==;
IronPort-SDR: PxkB4tEb6SkklkQyJOvN1E/naXNRiNQ3w+3MQVtLtM9nnLJ80dbI+U2blbAUCc97CWeIrJ2YCA
 biozTuAQqsxKBa177I2FJ044CYNks2OUMpmxfXSHmjZNlEWJHRuABXLuEzpOXsl2/tsEiUZWgF
 TClexH1InSBvi7yc8VK0QNv8Bn+k9Xs14OjKP5cvyd+5vv+iONmnvHYzgUiSIxVWRmqBhm6A+z
 eoSM3ogiIMr44jZr/GgH4de1y4DiI8gwGHCsdXC3LE5ukPGRNdVrfoLu9W1a7Q2mqdVF1CU1/o
 808=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158517361"
IronPort-SDR: LikeUj7PUk3ZLLpc6Px6qO01HqC1wlvZZzrPY7ZnZhHS4w+tCONfQJ+C7YfrTFndxX6zHW701m
 uXH8Ec+SdAgbEtSwMH5U9R1ttunpWEL+zdgq53HlP7ORRwCetLMMo4J+lv/6fc4rIg6e69PRT+
 ZyLqDvhyJE5IUdrq/ZQdKQH1vVHd8Tahx2MUuVziV5zEb4dvc0i6/jOLg1fPJa1DPKyR7HQ4hc
 zfFZLR6r5pmRF36OyGY/413rw6Aua0a/7RlI2P7jMF0gJ+nwo8MogZ/qRcGExCm6IzLXv8Qf2G
 jJbi+lLsafIAyOsJhpORr9Go
IronPort-SDR: 2qgPwD8neR80/SdtH4pRH50bxmDr7msnaiMmu0nET+XLf24Atsm9LH9w2S7p7pMRphnBeo5pVx
 VOFkyyTuzt5tWdOljMzaLRlQ/2Y+vBgbMl5P6BLyAgHROT8V3ajdo6WQ+YwR34TObygZuUERZX
 rfU+sPmHgGS1V+3dgxOeo8REERCKgWHIYxzhiuWRBtY6dBheQaeAr6VP4LTAPeLl+kd1iFUoyd
 mqKwU7dlwbyE4M8F7GURh/yglDYKxcs47wr8oitkT1bgU4EtSPSZoGcLrNM5tqqKQP8I79UW3Y
 S3E=
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
Subject: [RFC PATCH 14/34] fs/buffer: use bio_new in submit_bh_wbc
Date: Wed, 27 Jan 2021 23:11:13 -0800
Message-Id: <20210128071133.60335-15-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/buffer.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 32647d2011df..fcbea667fa04 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3023,12 +3023,16 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	if (test_set_buffer_req(bh) && (op == REQ_OP_WRITE))
 		clear_buffer_write_io_error(bh);
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	if (buffer_meta(bh))
+		op_flags |= REQ_META;
+	if (buffer_prio(bh))
+		op_flags |= REQ_PRIO;
+
+	bio = bio_new(bh->b_bdev,  bh->b_blocknr * (bh->b_size >> 9), op,
+		      op_flags, GFP_NOIO, 1);
 
 	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
 
-	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_write_hint = write_hint;
 
 	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
@@ -3037,12 +3041,6 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	bio->bi_end_io = end_bio_bh_io_sync;
 	bio->bi_private = bh;
 
-	if (buffer_meta(bh))
-		op_flags |= REQ_META;
-	if (buffer_prio(bh))
-		op_flags |= REQ_PRIO;
-	bio_set_op_attrs(bio, op, op_flags);
-
 	/* Take care of bh's that straddle the end of the device */
 	guard_bio_eod(bio);
 
-- 
2.22.1


