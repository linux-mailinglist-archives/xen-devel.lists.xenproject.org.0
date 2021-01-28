Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94DB306E6B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76685.138507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wo-0006LF-V1; Thu, 28 Jan 2021 07:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76685.138507; Thu, 28 Jan 2021 07:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Wo-0006Ko-RI; Thu, 28 Jan 2021 07:15:42 +0000
Received: by outflank-mailman (input) for mailman id 76685;
 Thu, 28 Jan 2021 07:15:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Wn-0006K0-CL
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:41 +0000
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55264d12-e0be-46d6-b9ac-490a0d653ba8;
 Thu, 28 Jan 2021 07:15:40 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:39 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:59:59 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:39 -0800
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
X-Inumbo-ID: 55264d12-e0be-46d6-b9ac-490a0d653ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818140; x=1643354140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mX0lBXgZV5dDDUNO5/xUPQTxA6WXojrnDbaB4rJIAQ4=;
  b=aaVLORsEGRgytiupj+H8u8Nwfro8Wh3jnZGjXcDD4jt2HKyp/W8ERIXp
   fQEmB8ar99oys/4QKD4tcrrQUi5sGkoM1TPci77eg8niu4H/UQKRJF7xu
   KazKuO3tqz61g7nyfZl+sAsXbjSqmq8Iz6yUbq2cwh0J/GKqg6NTTlJUW
   Yub6sZdsFGXQTXwUA2NDFDHVC1hcVkngxwoRiXEyhK0L/ACZRPo7hEM8+
   UIGoinidpnrqFz9AHnIlAtP1yx7dx8L79GJwiNFw/pIZ7nWLPgL5W3r8F
   xsuNeovEl2ICMMBi09a0/fuW2gsLkovlx87gPzzhca5uipPwjfQQJ7fW5
   A==;
IronPort-SDR: NAk5m52GoaY29bds24u2KQ1qBvFn8Wa+/LcNmDWFgF8OYkvl53M7tYgY9bsXTvcF2Xrk0r1Vbg
 ophQVnMAMJZf/kH5eFdEYq+vuv/6rfLZCDAsFQyDSXkXnH3aOlX1RngvMkFkhvQuhC7vCMEB/q
 vgC1NmBLrTFqW45C6WXqsHW3S2mCTSD0EvptpsgvF6ieg4XJFhZ8qmlIywZFjX1kEhxKdx39Wi
 4Y6Hxoyq/TBKKU3PhCHJ5yoJCSfUM2g7Wp5LzVs3faRk2SCoDUVkhyFf9P9vAlR0H+k7mKArmh
 jV8=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158517545"
IronPort-SDR: H5QB8oH8qT7CGwyeMbvP6Jex1n5Ad0nKeXTChgPOMt6L0rK5j7qcLv9+EF3MyWUSHYnU7Vb/xL
 WPEi5+iUvwCnx8AG/EOFf/ZvPTkBTClx1hJwvbj3cxA2vxv/IJ9hR0FR51lJfElrqEL3cCpAMR
 Dd9DLyTrHZQcFYU9kC8VgFO2EUUnG6Zt7GttE/rX9wfuCG0LQnMSoqCU/cGPe5vzGAcFpnc9xe
 frL7j0+g+G9cL5BN7yx/sOJzbv9rL//AiKkqMYIOR9xHTytIaBnIotnHxqH3Visks1zAwVIFdH
 3j3B/8WI312Hk5JgkTqx7Sx/
IronPort-SDR: +tiKd6++/IklFSy7iDJaHbayhG5AQMYy46sQaNwq7O80dac1IZ8ZNlxjx4DxYbXvKYV6ua9+Jn
 RJlpIO7cWN3eoJjRXIKMWDgWPb2hxGv4A2WF6qkOCUmJWGu679NggrholDw0Y/zhUvvPmDPwT6
 YMwbiHmVzfz4ihKs4Lc84G8Ml2oUugQkKwA3saHG7RouPgTCEOWIbUjZGA0E7lav6RMiRyuWgb
 NQVibBmtLzaPM7sNDSYSURpVt5muhPgCfKQdUKPwhH4mY9hUDkI5QyIoSDd8h2S0Ai5kAfU9pn
 AHM=
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
Subject: [RFC PATCH 29/34] power/swap: use bio_new in hib_submit_io
Date: Wed, 27 Jan 2021 23:11:28 -0800
Message-Id: <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 kernel/power/swap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index c73f2e295167..e92e36c053a6 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -271,13 +271,12 @@ static int hib_submit_io(int op, int op_flags, pgoff_t page_off, void *addr,
 		struct hib_bio_batch *hb)
 {
 	struct page *page = virt_to_page(addr);
+	sector_t sect = page_off * (PAGE_SIZE >> 9);
 	struct bio *bio;
 	int error = 0;
 
-	bio = bio_alloc(GFP_NOIO | __GFP_HIGH, 1);
-	bio->bi_iter.bi_sector = page_off * (PAGE_SIZE >> 9);
-	bio_set_dev(bio, hib_resume_bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+	bio = bio_new(hib_resume_bdev, sect, op, op_flags, 1,
+		      GFP_NOIO | __GFP_HIGH);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		pr_err("Adding page to bio failed at %llu\n",
-- 
2.22.1


