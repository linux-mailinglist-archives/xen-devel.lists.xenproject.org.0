Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA1306E45
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76602.138303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51UT-0004J3-3l; Thu, 28 Jan 2021 07:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76602.138303; Thu, 28 Jan 2021 07:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51US-0004IY-UO; Thu, 28 Jan 2021 07:13:16 +0000
Received: by outflank-mailman (input) for mailman id 76602;
 Thu, 28 Jan 2021 07:13:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51UQ-0004HS-Ph
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:14 +0000
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b36a3af8-cf16-4143-a2da-c9522a8f143c;
 Thu, 28 Jan 2021 07:13:12 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:55:29 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:11 -0800
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
X-Inumbo-ID: b36a3af8-cf16-4143-a2da-c9522a8f143c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817992; x=1643353992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Co0rYGelfI2tueL8o6ihJdxL5NS5pM4BZ/hI8135Y8w=;
  b=Xb0Fwe+1dWPBGptYkuW1jwf0/pZzxPFbd1k2654Y7VdM3NyEvMkmEi+D
   bsLUjUBzbjPwi0zwkSs6vsj9bYM590MjUObhNIrHJEzgUO8FRa8JxrV1C
   8iz17D9kCor6WwcXELJ+G5szdApVOehLDL9LGn8Lkwycnk9mex6Hvp1aX
   sdk1Wt0t3OK4yrVhczWc+H+G6S2sZT3paqJOOYEDfLSlOH31rMYgafTZB
   qc195Ao5EorIWWdlOE7IEy+GzXpWO0FO6A5YH+jGEwM9Ys7nb4OZTOUbf
   CAxD00a3wU73cGuJ4IQLTfjqttOxPMX39gE0XqyhowJVIdxyz+du6BaXR
   A==;
IronPort-SDR: F1mHyW95umCD7a3sFVNmF+qtCvYxKvBQx6aM6py0FlsYazS841A2FT1TjRRiDXQt6e2HptVUDY
 WlUdRbhH6+bJO/ZL5yrRZAEWyuQII0nmmeVox7VmMDTyZsMav1u42YjXe7qzHbs87/2LdwXenX
 cVO/bQ6kr00Bx78sZXGIDrxIRYYQU4UezmKrqFxWwUFFf52kiNC6AhOnIWT7OgXCgqyMIfXrit
 pmbePu98NDmQ4bgl+c+R/NM76dPKe0PcVhunaBwtndktFfJvp4afOI34YTtGmqw3MJ/WmrF08Y
 aVU=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="159693817"
IronPort-SDR: FaQz2V8CERfrk48nsZSBXmkkk+/mcmabB9fTkoyiXUUhqfB7zf2fUdszkQAFqtLVBHvCh+LV2r
 QG//dfRVhHf2u1EqPeuCc65uFAUTve8TznyVonyWQE8Sf4C39Ir7kMudh6oigcsUN/aeQsdp2q
 DNFayyEQaOy97P20vJIqx4qyQnIdqxDvdnY9jjPvDbEDsEdWHsWkcHArXmTLKHMpg7v6O5Eu1c
 kAJlbdXfeTu/TSdGNHuMd7oKwzcEPe34qsnEWngd7kRDZm0CLDd/SUfXJuwAMMt1lDISVOKTvm
 pgbrJBkopkgS+jFsGs5ELYut
IronPort-SDR: B3g2yURiLlkRDJQjiSw5Axb2Dh2vXpaNrKE/QAQl3YC0d9KYF6ZY/2WEGrs8Ad4s6CTMSYijlI
 As81DRh7fxTUcG6XscFZ0dEUGMxghLXCUSNbFTul1lhg8N84M173b0zoMSc59+C6RPGCZyVbXT
 e5q9NGchuukS+6n/XolnPl9CgZkf3lpSTdPe2xwj7IsZkLY+Q3H2m4972b6vr4aHe8P7F7VrjW
 YTjKY9EpCmYYdyolrCzI7bP6MpRPHgjkbRdfoyYEpwC7inxXY41c/i8ke9uNT4EC8+Q8lA/Kgh
 6rI=
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
Subject: [RFC PATCH 10/34] dm-zoned: use bio_new in dmz_rdwr_block
Date: Wed, 27 Jan 2021 23:11:09 -0800
Message-Id: <20210128071133.60335-11-chaitanya.kulkarni@wdc.com>
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
index fa0ee732c6e9..5b5ed5fce2ed 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -755,13 +755,11 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), op,
+		      REQ_SYNC | REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
-- 
2.22.1


