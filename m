Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0560306E44
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76599.138291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51UI-0004Am-Pg; Thu, 28 Jan 2021 07:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76599.138291; Thu, 28 Jan 2021 07:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51UI-0004AF-Ke; Thu, 28 Jan 2021 07:13:06 +0000
Received: by outflank-mailman (input) for mailman id 76599;
 Thu, 28 Jan 2021 07:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51UG-00048y-HN
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:04 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db42adc0-1404-41f4-a545-7206404311c3;
 Thu, 28 Jan 2021 07:13:03 +0000 (UTC)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:02 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:55:20 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:02 -0800
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
X-Inumbo-ID: db42adc0-1404-41f4-a545-7206404311c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817983; x=1643353983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OzcT2XWni+wbNY2uowp8HTdSyU1JsS57dIOzGLP71ak=;
  b=DCTHmIIs3gw9kivtm1op9LgYX/zeqSVgFsjj2hNMK2fMLuZq9MQHtCJt
   t0oiq11BdFbk/DXas69rVxIqZuCNmWUmwpDuWf0x8VwTUKtVxaB90TiRi
   L/ueumxYEhwKh2TrQClHjvx4F834UdICFwe7nVOZYCFsE4X4wguTTfZdh
   QSqf9oMBvqF95b4wse/GArJtRfIJuC18O3FdPNdjJqWW6RCZBzxD4yNMT
   7INZz48bFm2oZF9bqV6NzcPiGpqzWjVVYR64vBmpc1bgTLkjjnfIAWI2r
   hBZdD1Qor8OQO4k0Ybd5xsqLjZgAlAofvNh6PqJ0okrd0ZlQhrsJVGl19
   Q==;
IronPort-SDR: /Ehg7W3oO96HmOx7BOpK3IpA5+Q6Y6NIujGptz5FGbcCktNolbiyM0WDYaVrQeYK2NDzqfdOpB
 eiES1DZtHxFBLCP5yGjDQg2TmN9jZb7kl29SwOZ2q4vk+WYVY0ci/FnSJc/Vrw+TyPAXjy498W
 awJ5E96c1gb1FBra+MoXD6Ggmnx5qB4vJkiSPOcciYX7NUM9RF3YzktZzeh3MBej09lC0x9qfu
 h61xgBHS0IDEzh+6oofukF0zbllbB+LcDQk/qOzucr3WQG9wmKlzEeSnj6tZeENlUkl0oCj7i6
 Xhs=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963196"
IronPort-SDR: Ksd/LnIoJ+vsFjCGE8tsOEW2ssFLNYKgKtFW+zEdJnb6jheXsNaO5rq7C6Kw+rR7gylft6icMH
 +YReDC/JTUTpHxel8AR1WRqSJiG2B1pKhetrt7VRuVSmg5QVOdufPSwwbEzUMDZJ+NwViVtvl/
 fSNlkrqdAhpvcDO7ttYJG+K2Yt+vF/+JW3bB1L7VKapGrK3PgNLbCM2QgRFPKM2x2YQ3Ycok+b
 VI4KBf8NOdKQ/GVu2B00bbycOSgZPx7QhAr+//E0FXXz4DXyinwg/QG/xXzFzV7V9tdTxePKHz
 SM2XlRlNjpgO7YMRTg4uGJB6
IronPort-SDR: m8MWhLly+Q/ggpFQoQazEvRAK79hMprrsJeibomNIX1/4xtKgak83IDhV3hY33IYYgETWfckla
 12cflgJcZOLhtYF332W1ZeqMwkaZsc7uQahEN2f8ydynExvlY4KkvRqWC31LBbVv2+B3KXuSeg
 s9mXwdZWg1TGYc2w+IbnJALYEzC776WPgdLPtLGdrMUnCNPoz5WeDSYQd/QZ1Y+MzxJurZd/eC
 94O7CZ/ZfohxaTfsL58Np58+H9TOWMfDJbBI8BFZ4728SkC4ncTHu1ybMvyhjmP7gPrroYjKqQ
 UWE=
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
Subject: [RFC PATCH 09/34] dm-zoned: use bio_new in dmz_write_mblock
Date: Wed, 27 Jan 2021 23:11:08 -0800
Message-Id: <20210128071133.60335-10-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index e6252f48a49c..fa0ee732c6e9 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -723,7 +723,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), REQ_OP_WRITE,
+		      REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio) {
 		set_bit(DMZ_META_ERROR, &mblk->state);
 		return -ENOMEM;
@@ -731,11 +732,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
-	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
 
-- 
2.22.1


