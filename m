Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C958306ED2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76734.138577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51ao-0007Gr-Eo; Thu, 28 Jan 2021 07:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76734.138577; Thu, 28 Jan 2021 07:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51ao-0007Ft-7d; Thu, 28 Jan 2021 07:19:50 +0000
Received: by outflank-mailman (input) for mailman id 76734;
 Thu, 28 Jan 2021 07:19:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51XN-0005xp-1b
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:16:17 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92279879-bade-4780-a7c9-ef19f5d031bc;
 Thu, 28 Jan 2021 07:16:12 +0000 (UTC)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:58:29 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:11 -0800
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
X-Inumbo-ID: 92279879-bade-4780-a7c9-ef19f5d031bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818172; x=1643354172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mzuBJgEjO7736zP2e3T55gtpCfO2cszPJHhO/o9ayC4=;
  b=lsRfQ2jjI5d+6cWPC2TCr7VUcGR0BLYsaMFCDVh13NuenqAB1zRrkp61
   UAk4xXhQTIV7XwigoJWAs3IDCuvgRVFJVU1g8+iC+62x9siVnRA1fXkod
   3SWLcVn/92/412NUkzW9l7Zpj0zvgQ9wk9aA8pBdindTEv8tXXFHdmRkZ
   o5LcrNs1ktImif77vfkak4sLfu6k0uMg5YAS66Aszdu+5uWtn16cbnIok
   aNVuDNv9SlN7tKBq+EVYV3d20yoe2xJeNxon1GYpJW+wMMETb4y1tcIhf
   f6PxGkORJV/9lsxiwo/znPO4n912EkzsFaHmUcHdRMur604l6RvGfbvfE
   g==;
IronPort-SDR: 13aMzD5B30suQ0EUA9uB0xrjaohxw1peRDX2LmTYLbVLBLKrUk7f/OqoS1E83lhys8wXZ9SCwt
 18tluODWPypY6UQGOgCEeCPtiVcMe/1Ks4y3TFUYjpF5a7cfKutqA2GYNg7WZ3D1z9oeTMivdX
 oqoxJth5ZpQMiRDvxeSmTSylJVjCJpwSmneqJO1GfqwIPH/DK9gJLWQ1qjGM2UlrhoekwM5A1t
 Db+T1QLrJ/ZpOdROIWU3s15b1JBSpaRZqQ1pqlMg4IdansaV23awPZinV03fP+62vcPWAzl6Fe
 11Y=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963517"
IronPort-SDR: vyex7oJdlSE9DmCxe12rWZzf7D0IhWESRbEnG+ugtUGicSX77dov+e4iAzm6McZTQnYMWdwNxO
 se5C9grs4q6fHPCIUcRWczidVREGeItmthVWHgJp6WWTx2jUU+UO14Dn+SpUmbJmz9tUTu5SLQ
 GburUybr11twBzaAP0Qhab5s2D+qKbUEJiqpZFbj0ewC7WCTB2OXL4X/xrFwsJQ6HOF3gCIgO3
 smJGb/hRLxrQZxjk0/PqZ0a4UIifATCY5pL7iOAxeRvRVE1fzTutX4ZHk267Q9Lg7fCZb1+57Q
 86wub+K/GVDYJSPHHA8Lw7eh
IronPort-SDR: g9DYrZw82vrtcoqwLuT41C5LPwtay4x47njX4TQvn100PG3qzIQDYIPSbD2aKZ0nambVfkCSmu
 JHC6z8/1ifbcXhuz1R2nfguMjBFRQ4RaTCr3wehJDb3ERuWQ1NBrP8es0szoYDQyY3216WdfEV
 JcMopMzzk+/Wudlq5O10ELulyKCOeTk+PuDGw5+9rtJas4CG58lZZY6nLuQYmFyKdDpDYbQYnL
 x05lIaxi3M2yfAJSgs6mfnc20aeVZIpUbieSq2c4z3+si2ic8ziehclZMxZZAWaM0XsUZa2+hJ
 /C8=
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
Subject: [RFC PATCH 33/34] mm: use bio_new in swap_readpage
Date: Wed, 27 Jan 2021 23:11:32 -0800
Message-Id: <20210128071133.60335-34-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 mm/page_io.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 25b321489703..7579485ccb5e 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -342,7 +342,7 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_alloc(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
+	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
 			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
 	bio->bi_end_io = end_write_func;
 	bio_add_page(bio, page, thp_size(page), 0);
@@ -406,10 +406,8 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, sis->bdev);
-	bio->bi_opf = REQ_OP_READ;
-	bio->bi_iter.bi_sector = swap_page_sector(page);
+	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_READ, 0, 1,
+			GFP_KERNEL);
 	bio->bi_end_io = end_swap_bio_read;
 	bio_add_page(bio, page, thp_size(page), 0);
 
-- 
2.22.1


