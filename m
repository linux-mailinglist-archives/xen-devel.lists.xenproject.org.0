Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2713306E69
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76687.138516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wp-0006MH-Fu; Thu, 28 Jan 2021 07:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76687.138516; Thu, 28 Jan 2021 07:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wp-0006LH-6d; Thu, 28 Jan 2021 07:15:43 +0000
Received: by outflank-mailman (input) for mailman id 76687;
 Thu, 28 Jan 2021 07:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Wo-0005xp-09
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:42 +0000
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7a66c51-aa5a-4519-bc9d-05b32741e4b6;
 Thu, 28 Jan 2021 07:15:33 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:18:33 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:59:52 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:32 -0800
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
X-Inumbo-ID: d7a66c51-aa5a-4519-bc9d-05b32741e4b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818314; x=1643354314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cXmRF2Su1ZKio9gUSME8BeoE9pXLYvn976s4DXPYmio=;
  b=QIacUKU9yyuXrFsLNOJ3/cAlWaM/YNuVsLyI0jzb5iCD9id30IEx5d8g
   Qg0WZBSLOZld9Ugspj+PCSDQ8DC+vwQQz6ivTxMPxiYJP3vkqA8ePHb17
   mKbz675BbNRcr10onze8EhQ3PnP7KQcFfIlLJxjpdK3L3p/b+l5c7mS5r
   LiutP3d9tF1YIRj2SYiEJbbHo5zbvOGzpzDQXZKXoTb9dS3qGw0WdScBs
   5Kn7zuVeQHe7R8HweBDaOMEtJ+iKkT8W7KlEMg63obkTa8/fLlpjnxF32
   rdii4tLmI8stVf4d0Q4Hpcpp2ijDTfg4ePIcK2XMfeXCLP3KNntnxWl8j
   Q==;
IronPort-SDR: +DeOHSiPuYXzZqiyAIX3LDlBHW0KIsbf68EHkSE9GrD05QRZOrlk03Yfgm5CJwWUthdVGMbUwy
 dKZsvQTGYjdKmFmEg83qwiiRFxPWI7aLa4+FXj2MY/vEPxOX3vp5N5vxIeB2c1JtSyJ5jEXqCI
 8KGIicmmBmGNtkYRzYBdcUmu2Tu9Xmmr+qNb9zdN7bUCxUdIxqypReAimH4dVO50H9zsNjMO0M
 HK1ikRb+vDT3qfVV0QH7h0g0VxE5KpEk31o9hjw9aQmVscpEbk6AuB7YGDErOxL8wJjwiCr/NG
 fjc=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="262549193"
IronPort-SDR: 9ERyHW2iXRv3pJTiHfQ6FCkvxQIn6RJoWyH5LT+UwXZT6ya7nLIzPeXSBcUtFJlYLbzJ1jDzxN
 pHV16noZdfrJgeYrFgZiSV9/HCaVgGMNxhaPnz3oXfu0fVwYpGlTH/1bmIIXWjjR2b9nT1t/4l
 0Z2IC1wX2I3hVw8IlpAjOMZ7GJogy47Ic6kGXndqejrVNVoYa8f+ikzzvDphAHKl1xbxW+pbly
 uH1WBsmk4xtsYcu3MZd4HwNMp+vBKja986bP94zC3xKVEq5SqQYTyn/o9akXG36Lx7xn5fsdTW
 aUf4tCGYfqHI98qHkVuQcnZn
IronPort-SDR: m+UU9TJBIXCvSyFz/7O2vaYmlOCexk8ewW0e2kOKkWSuwpQEVFGI+DHENO7Q1Bf8IQzN352Mi5
 5dDETfg3/zd0aL0yHDjcbUD/eS6byN5dveWHS0JlUn01j5YdJYnuzvRhCyGEwEvsPLeiwlo6h7
 h47UPjLb7UDOPAPFC4EqcqtJYlkeHUwpVqBF6C8WUdWbiBbzIaj0jcLgB21R8kA1PJHycwAnr3
 51c0CVR8EMmKQ6pEvymjZcIoINYcADZvl3xn96JSQjk6KW59eeMqwpBFLuZiCrCp4Zkdz1bD1j
 kZU=
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
Subject: [RFC PATCH 28/34] zonefs: use bio_new
Date: Wed, 27 Jan 2021 23:11:27 -0800
Message-Id: <20210128071133.60335-29-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/zonefs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index ab68e27bb322..620d67965a22 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -661,6 +661,7 @@ static const struct iomap_dio_ops zonefs_write_dio_ops = {
 
 static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 {
+	unsigned int op = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct zonefs_inode_info *zi = ZONEFS_I(inode);
 	struct block_device *bdev = inode->i_sb->s_bdev;
@@ -678,15 +679,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	if (!nr_pages)
 		return 0;
 
-	bio = bio_alloc(GFP_NOFS, nr_pages);
+	bio = bio_new(bdev, zi->i_zsector, op, 0, GFP_NOFS, nr_pages);
 	if (!bio)
 		return -ENOMEM;
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = zi->i_zsector;
 	bio->bi_write_hint = iocb->ki_hint;
 	bio->bi_ioprio = iocb->ki_ioprio;
-	bio->bi_opf = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	if (iocb->ki_flags & IOCB_DSYNC)
 		bio->bi_opf |= REQ_FUA;
 
-- 
2.22.1


