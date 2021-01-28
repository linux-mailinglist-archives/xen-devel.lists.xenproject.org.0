Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44306E31
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76579.138231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51TZ-0003fQ-6G; Thu, 28 Jan 2021 07:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76579.138231; Thu, 28 Jan 2021 07:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51TZ-0003eg-1S; Thu, 28 Jan 2021 07:12:21 +0000
Received: by outflank-mailman (input) for mailman id 76579;
 Thu, 28 Jan 2021 07:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51TX-0003e2-GD
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:12:19 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8155d42f-4410-473e-9aec-c33bf1545e19;
 Thu, 28 Jan 2021 07:12:18 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:16 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:36 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:16 -0800
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
X-Inumbo-ID: 8155d42f-4410-473e-9aec-c33bf1545e19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817938; x=1643353938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H5WYNiBvrNWIzR/dDsyAI0RzKPxZxlDuB4vWYUDlMrE=;
  b=nTCJ/jo6Ravq1fP7M7IF2+lgEPjN9ey5djcz2unlL5FDEMGuhD6cUyK8
   iZ06mGy8V/A2r5wqd6kLwsj4NrvQH3M979SFcamKcpIUNDj8xiIoiszYY
   Pp4SC0IDJYmaovKrkiGT0ysPRKU4Z/yORg6PiGVeSWJvJYXhMAh7T17Fm
   4zPkDDVJDUv46+d38RVKBko5bzVXPv57ddmlEheqIVlm8JALbDtUXEAI6
   v8mbiJQZPF3F/QDXPnMI9qApDMtxSwcEnmlikzusXsyMdudJtTMTTZrQh
   LOnFcI0J8VdIke4yuH0YDrZuBmrTthOddYocxoa9H//YaHk9BQmJV4avA
   g==;
IronPort-SDR: gdFFU5PZNAYOhnKxNZLzR/eMpHEKmd5S6QzV4b7iDR/oQnrAdr4QVw2tqljSiwQrUgX3C9YccN
 3rixqsLpteMciiAzZ823QwdhSvvQZxCEvRF3wk+wvsWkwT9y6v92AFAk1DNzuqn8ZlojCVdDSv
 71ObpD8V1BVRqckwnGU2vYGA9iep2DpypMt0BhJGTvqwIwnW+khuntXoHCq7QiCRySRyCR2hAJ
 dkYuyMwrCWiKHNubJGed7RHDxQgF9ErKvmj1H9AcmwfcYK/E3b3U/VwdGnMBe4/Zt9sB/0I6dl
 EoA=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518045"
IronPort-SDR: TnX6CdAM0G669YD2/0mFLpB/iYawSSNiP4c9iqDMqX1DZp2e7WWQ+pnV/pFUq+AtYqBpnMTsRT
 Wp60HApwwH6w5mm2JeZy8nmGENxMsHWw8aec68dB1/c/65vLKBtUz03+jVpm+0B15nx5H1WRKq
 hfFj0rECp61vKw3Gb2eQTvjRW03bLiSeFBrRbBuic+qFBl450DZstf0FZg+DclUIPeJVfPrCZr
 cTwGdhS9YMFLzZ9umS/vxFaFCNAa6gXkI1FleVQCUiQGjtzyEBGWD7Af1BZa78h+C2gTPiw7cy
 h3GHNFwJLNg/0Vd9eG89nC2p
IronPort-SDR: sJ1sB4+NIXrk86BqB2mBiNRkLb2CtaUtTUjLUptuVolKqncgiWgms0hBmEnyXBHOe2LGJgTWAc
 Mtkqx7/Ji/KEF3P2zVgoCc4AZmvUpaw07sB7pwwqNDwBZIjeJgdIawB6xDKz7hKZuinbJ6FPFN
 v+digmuqEID+qvvg+Pvdb6mLkPbYX8es6TqyRNtA6iTBnQbrstI0JA9CgrvLf0RhQ0DnF83KdI
 QwpSDAYi/vWthDgyxzldo4sKChZfQfmY/MjRYeTOvpJG4q5JRSujoZAO3KJfZIMHz0OJMVK9L1
 YPQ=
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
Subject: [RFC PATCH 04/34] drdb: use bio_new() in submit_one_flush
Date: Wed, 27 Jan 2021 23:11:03 -0800
Message-Id: <20210128071133.60335-5-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/drbd/drbd_receiver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e1cd3427b28b..b86bbf725cbd 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1277,8 +1277,10 @@ static void one_flush_endio(struct bio *bio)
 
 static void submit_one_flush(struct drbd_device *device, struct issue_flush_context *ctx)
 {
-	struct bio *bio = bio_alloc(GFP_NOIO, 0);
+	struct block_device *bdev = device->ldev->backing_bdev;
+	struct bio *bio = bio_new(bdev, 0, REQ_OP_FLUSH, REQ_PREFLUSH, 0, GFP_NOIO);
 	struct one_flush_context *octx = kmalloc(sizeof(*octx), GFP_NOIO);
+
 	if (!bio || !octx) {
 		drbd_warn(device, "Could not allocate a bio, CANNOT ISSUE FLUSH\n");
 		/* FIXME: what else can I do now?  disconnecting or detaching
@@ -1296,10 +1298,8 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 
 	octx->device = device;
 	octx->ctx = ctx;
-	bio_set_dev(bio, device->ldev->backing_bdev);
 	bio->bi_private = octx;
 	bio->bi_end_io = one_flush_endio;
-	bio->bi_opf = REQ_OP_FLUSH | REQ_PREFLUSH;
 
 	device->flush_jif = jiffies;
 	set_bit(FLUSH_PENDING, &device->flags);
-- 
2.22.1


