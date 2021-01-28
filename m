Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552E306E55
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76637.138398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VV-0005Ct-Ov; Thu, 28 Jan 2021 07:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76637.138398; Thu, 28 Jan 2021 07:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51VV-0005C9-KS; Thu, 28 Jan 2021 07:14:21 +0000
Received: by outflank-mailman (input) for mailman id 76637;
 Thu, 28 Jan 2021 07:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51VU-0005BH-Nh
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:20 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f71a8279-8ac6-4682-824d-537aead0bc24;
 Thu, 28 Jan 2021 07:14:20 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:18 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:58:38 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:18 -0800
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
X-Inumbo-ID: f71a8279-8ac6-4682-824d-537aead0bc24
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818060; x=1643354060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SCctODBcoMVRMibJjtR9kI3GnL0tVZIiIK8qwMLhuQk=;
  b=qdqyxKe3yUWbRVVnMj8HMLkLfvTUhUlWHfOYDRlZV661tSR3jyHIutX0
   70dbM4HVhubEC6O6E+jts1HT3o4JTQSCGSjW7ThucLKvCboeyDv0X7nEW
   174nhhrArwDSOaJJO2SWVXYmHoIVTm/z/J+Oota1lpY4usfRL1CWHCPks
   TAGAUl6p0fhbwr0V7M6Sc+W7dxG+8kME1JlQ12fuIOFmcLLL8lsw8CRub
   kuOhdJSLKWUGgsZrdWgFNswozYKNWEOaZm7ZNJjOKEaO5xkGDqEL/SxZK
   XlhuNf4Yfj2TBEs/OKGueemBoUCAmOu08pnRdb4d6ZwvyjMokMrDjbD5c
   A==;
IronPort-SDR: pK692UaIEnP1XIpoIqEh2c3HLlD6x0lnVRSjCfBU9TS6HoDHKsgh/edt/TKkJrKwWPmq0Ua6JT
 HAbthreXMxsYvvPUNxMLU2JAFNHMFwktPQANSID8hfODguMNLr2gAfLtCCF0UVrye3gEUespHN
 m2ISnexpHqlYWlr7f6zyfdMJAoforZwGwBc+F4t7VMraQsPO9oxQTgei1cs/+PtIEPFBBsfJK1
 xE2/vWe5Im+jy283q+34mky8bB7w0djJlNGuwPSd3FTRk+JlI7Z8cxqcQQrwHjzkBDHBA/vwcD
 W6c=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518274"
IronPort-SDR: FI+nhGOOuPuDu8M5kbpqnDdZpIcHVCvLVkg0rWAH0kfli3UNt+ADqPUjM6iGp44MF+gnY3IMm7
 UU+dUpa9ZamKNJ7EJuhtWvwUvrSG/genpTFYxW1zjHMhXDM2V7GCqTEhnqOY/ELyieYgi89Op5
 JUuH1BitVkyjJwK64wIyPxgheR1BDfzc8YHdBBWjY3uisMaGUk1mxi+ZKF9HXrGSV2jQqSqOyZ
 Uy88ydX8xsNBeE3Zy6xpxfblHQV+4Ntl/ja7k2EVcstok9YOaBizNnGFF6pQzpRtnl05SXn+9t
 oWiNAHTeXvXKeYupL/xbCnWQ
IronPort-SDR: SE/7jhzj8mUN4IuNpOkC3snrZ8NJ1clnXy6y5ds9FsX94ZBtriQ4uRa7QWKdGcnXbjLMCBoUCV
 muTlW54Qa3qPh6fwMtXMlfwP2+yfKLqOcAu45V7pI+dpenWI0L1OM9udcXtJMTQueAmHig5gDN
 d6OcRwyGrT7GxH48PliS/P58sqmLq3e242QCy6iyXTMgFXRd2EClUAs64FPFphS/GBkZYgQLMx
 xAByTj3G42kPYoeBIsWoRZMAgUwhHcuqehcOxGoJkKVhb66+D9X5hujEyFAgPHDC4Sd1jNsKev
 N7A=
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
Subject: [RFC PATCH 18/34] iomap: use bio_new in iomap_dio_bio_actor
Date: Wed, 27 Jan 2021 23:11:17 -0800
Message-Id: <20210128071133.60335-19-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/iomap/direct-io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index f6c557a1bd25..0737192f7e5c 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -267,9 +267,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 			goto out;
 		}
 
-		bio = bio_alloc(GFP_KERNEL, nr_pages);
-		bio_set_dev(bio, iomap->bdev);
-		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
+		bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), 0, 0,
+			      nr_pages, GFP_KERNEL);
 		bio->bi_write_hint = dio->iocb->ki_hint;
 		bio->bi_ioprio = dio->iocb->ki_ioprio;
 		bio->bi_private = dio;
-- 
2.22.1


