Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471C306E7F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76692.138532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wz-0006WD-VR; Thu, 28 Jan 2021 07:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76692.138532; Thu, 28 Jan 2021 07:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wz-0006Ve-PQ; Thu, 28 Jan 2021 07:15:53 +0000
Received: by outflank-mailman (input) for mailman id 76692;
 Thu, 28 Jan 2021 07:15:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Wy-0005xp-0V
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:52 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da9bff1e-c501-457d-9cf5-275f1f36d2d5;
 Thu, 28 Jan 2021 07:15:49 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:48 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 23:00:08 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:48 -0800
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
X-Inumbo-ID: da9bff1e-c501-457d-9cf5-275f1f36d2d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818149; x=1643354149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NNQh//SoJS4GqMqJS7HaqIWs/nAFaMjGpU2K0hvKGW0=;
  b=fQfK9wUdOyIrIsfy9RLLvC5xPgYcSXg3MNYnHSc9IsYLZx30nRHzIAUZ
   294UUudQQlYk8gJcK/edZROZYlJIE1eNrjLm1JGiz/Q21FfSGShI1OpDG
   AVL3nWWtzIN++jlZ98TQAnqMod+6Ql8ECPGPLXwk9xo2jd9Tx5vttBp8A
   MKW1qB5k/Qt/1N/OTPnz9MYuOySMfX9ETamQAGkN5rbbeVBg424fAd1GQ
   hDTtCXp/Z9hfKKx9hoSKub7BrBRCs+yLmSqVgpJS1F86spUPwH+/QWj7g
   HR1yP3TJs98ynx2C6xmfLztXq4e7yWbpoTlZnnY6hLXY72FFMg4KLmomH
   Q==;
IronPort-SDR: FIV1m0hqMjPv7EbDoudd3IU/sfM4dtIXVcOrfZP9FG6QS+qNV/cpHr7zPfe6cikVTuMAIWMrRE
 1CFFIA3M2n74FPetnuW4UIXhHv04+NojRtALLIm1ShTbRzoMpJzodse0FT7TKA9rmpzDk0hf2J
 osqfJT1Hw13QCXwtTqc43/JeIOacFqdvj3uOE8wdnBhSuCJtni52KCfSDmNsSyMqak0NZQLmhb
 RVqXLrFPttVmJHYuA+DRTQ/CQCt7oxoFooNbcGq7LXUqJAFun/IgoGhOb61ZyQh4tY4TVzWgoL
 SfQ=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518450"
IronPort-SDR: s18G1HC83Rr3z3ZHjRbyNRB84D8eeJyfxEsQsWugvQYNm/5tp9Bykx2d0PDD1lJnqQ7n3ROCLB
 YSWyg9J7I6HqnB2NgFwMU4ssoB6tjGH/79230TWkDogzAEgyRx4yPiMRRDGGGJYtPzQqzrHfUY
 iO3zDWOiwemtUczZcPdewa4KogxATq3ygZIiw6li+/J7dkvbfEn3uGzNA0AnmVFzdIkRTnkjEr
 NZyMm+4X1MpeNq7dOG+OefxOr48EAZ8pX3UG1xjxSqFs9hl07ia08o8M9UC0qFD/6LvMa4wq1F
 GfS04fX+yByC8zurUKSx9scr
IronPort-SDR: QLHAdyBGhpMGQ+9sBMvXF0omk88B/E7BRqUoQLtstkadK8XTqcLBOvZ/pjpZSQe5Fab6+IJLIs
 ck58Xl2YqFxcQH934VbGmHAxVZYNpxUZEqIAo35K+cwpiHURts0rCHDJ2TNufJwwd/0szVEfZu
 V2kbFpOqLyVucrhtvqpRhrkBznCSCkx3a3rZqsYu2xJ2ZrJKihugfXyvxYjD/F6eNL2QYyPhq5
 GySOsYgZ6Jfrk4o/qsLABBe1b7+pVB/jDQ0aaMBZEhc+3I3KzSll4D3O/V1q5DDbYD+ht9Zxf5
 kSQ=
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
Subject: [RFC PATCH 30/34] hfsplus: use bio_new in hfsplus_submit_bio()
Date: Wed, 27 Jan 2021 23:11:29 -0800
Message-Id: <20210128071133.60335-31-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/hfsplus/wrapper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/hfsplus/wrapper.c b/fs/hfsplus/wrapper.c
index 0350dc7821bf..8341ee6c9b31 100644
--- a/fs/hfsplus/wrapper.c
+++ b/fs/hfsplus/wrapper.c
@@ -64,10 +64,7 @@ int hfsplus_submit_bio(struct super_block *sb, sector_t sector,
 	offset = start & (io_size - 1);
 	sector &= ~((io_size >> HFSPLUS_SECTOR_SHIFT) - 1);
 
-	bio = bio_alloc(GFP_NOIO, 1);
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, sb->s_bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+	bio = bio_new(sb->s_bdev, sector, op, op_flags, 1, GFP_NOIO);
 
 	if (op != WRITE && data)
 		*data = (u8 *)buf + offset;
-- 
2.22.1


