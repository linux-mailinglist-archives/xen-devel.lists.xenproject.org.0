Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8E306E97
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76726.138555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Zz-00072W-Ks; Thu, 28 Jan 2021 07:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76726.138555; Thu, 28 Jan 2021 07:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Zz-000727-Hc; Thu, 28 Jan 2021 07:18:59 +0000
Received: by outflank-mailman (input) for mailman id 76726;
 Thu, 28 Jan 2021 07:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Vf-0004at-5o
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:31 +0000
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acc075e5-c520-4e8d-984d-3086641da3f1;
 Thu, 28 Jan 2021 07:14:27 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:53 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:58:46 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:26 -0800
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
X-Inumbo-ID: acc075e5-c520-4e8d-984d-3086641da3f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818215; x=1643354215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ehPvHcNFObZpIErrj099M/D2lwJDNRsp+vZtBu0oImM=;
  b=k/Jru1VNjukvwvnvZz0pM0LaZbG8K+F6BQzUFH9Qf1jMHx0aq5ApLu88
   Rb8tduHQb5dWDKKlXRj44rBBaKXeXcDl6Txj9hhXUnD6FJrAChKpq1Vfb
   oanL2XI1ICrkolTcMjRJecKzIA8dvr8BsxJEByutfSpkAxv9nfF5ZUAlM
   Bp1kUF7CRdOmzo2LnZg3/Rv9p80v2i2se7EeTNdMM5Wg5HV6AdsYYHl2F
   FJogJwPPr1Ps6OJyuned0ffgeWjG6oX5RNUBVys95X8RP9zmoILZN2pXE
   cjAsTfUjOYhIFE8SIIP7Sf+KfGs/Fytf/0LEMcdcuZNM2CiCRP5VAcy88
   g==;
IronPort-SDR: TIyCIEWYac9w41uOVHCx1NlputHnePgau9U4Nio69e774e+y9cOp4h+IKaKCI301hgNtB8yprv
 OzNvH/7WTp9HgJAKWBfCFL5vppPayTQkk3hFAENtRx52kjln5+RR1BZGzrFHbTG4CDVeqqWHjT
 sHZteJXFthRUvmtbzVRktJolWtP6ZxivYoDAZ6//uohOXrJ/AeHt4qoVfe5cXbpPCyeAhQh4Iq
 NpUJaFI0UegbzGqXhx6UsK6U6WC90CBjOhzjwY/+zZXOl/14RnhLTZscq/M21E4vFU7BFXIgcF
 4kk=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="262549081"
IronPort-SDR: 1cbHfofSamCo/ApmAsljDsCfz4r54G2FUZWYGmNyuiSCN/Z2YbFMK4sTHBY6hI5X9G+hdRKckL
 MECpSuOA5McwEFqGcWF9fZAuz1wtmgLEfP04Iww38ZdVq/7yvSG85e0GGhFjwhuUeHPHiZ+CA0
 KVoKo0o6pkY6maaofqS39ufg6JO/WLTcZRQ5Fkl5MyqYubTWnwqw9qWJ8sa/aAQljenlUfCNNe
 CGBAKcNX2u0L20dVF1ImlGoD1GGzcPw5ZLeIoSk0Novo+/GPe+cqpPa4nboxjKy0E+3Zuvs8Qn
 +Wrn6/RiP2m2ygrD+0NiE/MM
IronPort-SDR: 8zWpKV1GG73An1zpnhB0A6RHwKcvj53Vuxf9sCqOuA5ZBa5rmYze0QOVvU8HXRv/G7xpZnMIM1
 owK+1cH03BzVuf34Vf4nPTxb3MJRxKHU7MPVsfYKBvoE5U6OUm3WvlKRFiuZT6me2l9YBpl9Dw
 srBAVfHgvdy6RitQaBWTWMkJB+swHKrWKKu/bnpunnMHs5/vTt80z06ovpDFKB7vDmFytTZ38T
 a/jEmxYBTtNgI1MsJxovm0Lez6j5sfQFarO3Hedm9NgwCWDpXDWzTcx88c/FgbEiOtdVVLfaVV
 avQ=
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
Subject: [RFC PATCH 19/34] fs/jfs/jfs_logmgr.c: use bio_new in lbmRead
Date: Wed, 27 Jan 2021 23:11:18 -0800
Message-Id: <20210128071133.60335-20-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/jfs/jfs_logmgr.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 9330eff210e0..4481f3e33a3f 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1979,17 +1979,14 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 
 	bp->l_flag |= lbmREAD;
 
-	bio = bio_alloc(GFP_NOFS, 1);
-
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
+	bio = bio_new(log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			REQ_OP_READ, 0, 1, GFP_NOFS);
 
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
 	bio->bi_private = bp;
-	bio->bi_opf = REQ_OP_READ;
 	/*check if journaling to disk has been disabled*/
 	if (log->no_integrity) {
 		bio->bi_iter.bi_size = 0;
-- 
2.22.1


