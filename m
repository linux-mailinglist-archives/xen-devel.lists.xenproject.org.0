Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C6A5EBD8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 07:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911197.1317685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscHS-0006gQ-Jc; Thu, 13 Mar 2025 06:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911197.1317685; Thu, 13 Mar 2025 06:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscHS-0006fd-GL; Thu, 13 Mar 2025 06:42:58 +0000
Received: by outflank-mailman (input) for mailman id 911197;
 Thu, 13 Mar 2025 05:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+a2O=WA=samsung.com=anuj20.g@srs-se1.protection.inumbo.net>)
 id 1tsatT-0005Lm-TL
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 05:14:08 +0000
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f495bd73-ffc9-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 06:13:56 +0100 (CET)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250313051351epoutp0360b76a551a7d63bf808c8d1942858cff~sRNOxAcUO0801908019epoutp03N;
 Thu, 13 Mar 2025 05:13:51 +0000 (GMT)
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20250313051351epcas5p259ea25a093c959df9d8be994a07591ec~sRNOZ1lku1821918219epcas5p24;
 Thu, 13 Mar 2025 05:13:51 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4ZCwdT3d8sz4x9Pt; Thu, 13 Mar
 2025 05:13:49 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 73.65.29212.D8962D76; Thu, 13 Mar 2025 14:13:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250313040150epcas5p347f94dac34fd2946dea51049559ee1de~sQOWNZ2Q31805718057epcas5p3J;
 Thu, 13 Mar 2025 04:01:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250313040150epsmtrp1a7eed40ae47eb292a7062f705876c591~sQOWL7WLG1044810448epsmtrp1N;
 Thu, 13 Mar 2025 04:01:50 +0000 (GMT)
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.6E.18729.EA852D76; Thu, 13 Mar 2025 13:01:50 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250313040144epsmtip1810106b581625acc2fb4d4139e6c1a76~sQORBWe191683316833epsmtip1n;
 Thu, 13 Mar 2025 04:01:44 +0000 (GMT)
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
X-Inumbo-ID: f495bd73-ffc9-11ef-9898-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250313051351epoutp0360b76a551a7d63bf808c8d1942858cff~sRNOxAcUO0801908019epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741842831;
	bh=9Jmp5ZLIsyH8yuGTLV+R5+QG3R9RVCY2zlygWNpZ2tE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hNErEb6SN3cmVmZJ10VUrqkwy++BcWjx47Uo9UVTj83RDc1tAV3yuQQfjTzlac8my
	 AaSdViZdJopy4+rEh6F4vzhf0xvVNS5QTjWCmtEQvVdg+R3tRcd6EmmXBt3TeqisGv
	 m5iEG3kQ2yPOBKUfqeQhrnnpLdPo9QymdXyRYIr8=
X-AuditID: b6c32a50-801fa7000000721c-cc-67d2698d9fec
From: Anuj Gupta <anuj20.g@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
	Tyshchenko <oleksandr_tyshchenko@epam.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, Zhihao Cheng
	<chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith
	Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
	<sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
	Kulkarni <kch@nvidia.com>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>
Cc: Anuj Gupta <anuj20.g@samsung.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH] block: remove unused parameter
Date: Thu, 13 Mar 2025 09:23:18 +0530
Message-Id: <20250313035322.243239-1-anuj20.g@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01TeVCUZRye9/v2ghFaEeIdksBNJSxglzheSMrK8ps0hxFNh8GBHfhaCNhd
	dhdCmojh8ABhETRlOdqII1gDXBBZDs0FOYc7KK4UhCJAQFAX2IBYdy3/e57n/T2/650fAzcb
	plsxQvgSUsTnhrFoxpTqRnt7h9SQPh5b3m6BqjrSAIpPX8fR6oApUoxJaagsuxNDD3NL6Ki6
	o4KOShT3MFT+kw+6IWWguh8eY6iobxlDOUPO6JHyMgVlqAcBmhqQYUj5cJCKGobfQv21OTTU
	tCkFqC6+iI6+L5qio5TfamiouGUDQ3Nt+XTUeO42FW2uzVDReLMCRytaLRXdqd6gokzVHEDX
	un+korLZBQpSlPmj2YxNKvpnZBNDLT+fRJudi3R071YJFWmqMjE0GI8O2BN5178mZPc7acRs
	ZjogRgtVgFDJxuhE9x83KMR3Ge00IrHpEZXomBvFiF9+jcOJ/s5IQll6gUaMDtbTCNW4B1FZ
	8C0xXZkFvK19Q/cHk9wgUmRL8gMFQSF8nhfrsI//R/6ubmyOA8cDubNs+dxw0ot18Ii3wych
	YVvLZdlGccMityRvrljMcnpvv0gQKSFtgwViiReLFAaFCV2EjmJuuDiSz3PkkxJPDpvt7LoV
	GBAa3LyYjwuTP4+emxzC40AmkQyMGJDpAgu66qjJwJhhxqwHsODBHZqeLAE40rBoIM8ArK1P
	oyQDxnPLvNpHrzcA2Jxwha4nywDmPZvBdHlpTDvY9FcS0D2YM8eMYGpVHaYjOHMMgyW9T2m6
	qB1MJ5i7nErTpaUw98BhdYRONmF6wt9bByj6Bm1gVp+Grte3w7asyec6vqUn3MzGdTkhM9kY
	Pq68D/SGg3B0KQ3T4x1wpqWKrsdW8G/pWQPmwZX+KUOMECY03zZ434dJ7VJc1w/OtIfltU56
	2RpeaS/D9HVNYap20mA1gTV5LzALnivJMWAIG7riDJiAhfJEoEtpxjwNNUOx6cBG9tI0spem
	kf1fWA7wUmBFCsXhPDLQVchx4JNf/fezgYJwJXh+ZPu8a4CiYt1RDTAGUAPIwFnmJgqvHp6Z
	SRD3TAwpEviLIsNIsRq4bq34Em5lESjYulK+xJ/j4sF2cXNzc/F4x43DsjRJUCXyzJg8roQM
	JUkhKXrhwxhGVnGYsttz+Y3sTbKHBV5Xm6/GJg1GkwPmKiCXdjufONSa0v7nkyfa+UMXPvbT
	SPHtCbeWYk/2vKbdfalj+k3BivW2iVOrnndDj7LbrK7u9Q0pdteqC0Z7C86qul7Z9cWHp6qP
	fNkb4XKebyObkAY9tZxq6+LbT2QfT+UtXR1j9322993izLZPnRaz3ccfrPmsa/3g0HzkWl3E
	RQfzo9tOFEpPbyy+/YGcZ6SUx6wu2DCWm2NNQ1Lsyh0br48Vli4HNB5rtz9ju9papMxdulyR
	FHU++rhmZKN8jyX7sGLX3eiAV9dUKoupcKdvGo9F3RzI33mg1n36mmYwZsHPrnJV47uzJGt0
	dzOLIg7mcvbhIjH3X+zuQzrtBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjG+Z97WdADdOEAk2kzQsBR6TaTV7MxYrLl+IFEUx2OZYFGzoqR
	S9cC22AqMJ0CqSBdJlTYvFGFOhjYAS1j03IrMoIDYQOqGykExm0omVxq21nZEr+9z+/3JM+X
	l8EDTpEhzJGMLEGdoUiTUL5Ec4ckLLr+0KAyxuQKAlPfWQSFZS4c1oY3gfF+KQX1F/oxcFTX
	0tDc9z0NtcYuDBquy6GxlIG2Sw8xMAwuY1A1+hosNH1FQLl1BMHUsB6DJscICe1j22HIUkVB
	p6cUQVuhgYZvDVM0lPzWSsG1HjcG872Xaeg4/RMJnvVZEia6jTisOp0k/NzsJkFnnkdQMXCF
	hPq5vwkw1ifBXLmHhCfjHgx6vksAT/8SDV0ttSSsmHQYjBRCXCT/zY08Xv9HP8XP6coQb68x
	I96sv0/zAw8aCf7r8jsUf7JzgeT75u0Yf+tePs4P9WfzTXVFFG8f+ZHizRO7+JtXT/AzNyvR
	vi2Jvm+mCGlHcgT1jthk39Tupcu4qvi9T+cnR/F8pOOLEcNw7BvcolVejHyZALYNce2lNqIY
	iZ5yjrvzlwFt3IFcrXua3ig9RJxl5SLmFRQbwXVOn0JeIWb/EXFVLi3mDTg7jXFnxm9T3lYg
	u4OrXtZS3jmCDefGrB97sR+7m/vdNvzf2stc5eAKvcH9ud7KyWccf8q/+OECXoY26Z9T+ufU
	RYTVoWBBpUlXpmtkKlmG8IlUo0jXZGcopYcz05vQs0+JimxFLXVLUivCGGRFHINLxH7Gt+4q
	A/xSFJ/lCurMJHV2mqCxolCGkAT5Bc1oUwJYpSJLOCoIKkH9v8UYUUg+NjS7c82TvCiPrCyx
	+4eZ8ra4XqwoaR3T7G3Rnl7YtuoMP2cT1eRmhTR8aInziR8XH7j+iv9azrHNNT4FO+fWH2OH
	o+M9itcdvdWTRVWxWtfVCvKx9oT4rCNTbk5IXPtyr8ge9YLqjKl9/yN/54EZmf5z/J2xsKnk
	ocTzPX/umt5TvSAL3JObquo6f3J7aKZt8dE1lSwYOZeN63yr4+1j3QU5YZ6Uu5eOU9LVmNCG
	6IJ1S7whoeWDiYO6zS99JFbKHefcq3nB4bExE6/+Opz37u7bdXZbxOz+g2IiqPEX51Zp0q0H
	DdlPOopi9/UedY8et8jKEuOMPgOSexFb29+nbijHJYQmVSGLwtUaxb96QmhXmAMAAA==
X-CMS-MailID: 20250313040150epcas5p347f94dac34fd2946dea51049559ee1de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250313040150epcas5p347f94dac34fd2946dea51049559ee1de
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com>

request_queue param is not used by blk_rq_map_sg and __blk_rq_map_sg.
remove it.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-merge.c                   | 4 ++--
 block/bsg-lib.c                     | 2 +-
 drivers/block/mtip32xx/mtip32xx.c   | 2 +-
 drivers/block/rnbd/rnbd-clt.c       | 2 +-
 drivers/block/sunvdc.c              | 2 +-
 drivers/block/virtio_blk.c          | 2 +-
 drivers/block/xen-blkfront.c        | 2 +-
 drivers/memstick/core/ms_block.c    | 2 +-
 drivers/memstick/core/mspro_block.c | 4 +---
 drivers/mmc/core/queue.c            | 2 +-
 drivers/mtd/ubi/block.c             | 2 +-
 drivers/nvme/host/apple.c           | 2 +-
 drivers/nvme/host/fc.c              | 2 +-
 drivers/nvme/host/pci.c             | 2 +-
 drivers/nvme/host/rdma.c            | 3 +--
 drivers/nvme/target/loop.c          | 2 +-
 drivers/scsi/scsi_lib.c             | 2 +-
 include/linux/blk-mq.h              | 9 ++++-----
 18 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 1d1589c35297..fdd4efb54c6c 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -551,8 +551,8 @@ static inline struct scatterlist *blk_next_sg(struct scatterlist **sg,
  * Map a request to scatterlist, return number of sg entries setup. Caller
  * must make sure sg can hold rq->nr_phys_segments entries.
  */
-int __blk_rq_map_sg(struct request_queue *q, struct request *rq,
-		struct scatterlist *sglist, struct scatterlist **last_sg)
+int __blk_rq_map_sg(struct request *rq, struct scatterlist *sglist,
+		    struct scatterlist **last_sg)
 {
 	struct req_iterator iter = {
 		.bio	= rq->bio,
diff --git a/block/bsg-lib.c b/block/bsg-lib.c
index 93523d8f8195..9ceb5d0832f5 100644
--- a/block/bsg-lib.c
+++ b/block/bsg-lib.c
@@ -219,7 +219,7 @@ static int bsg_map_buffer(struct bsg_buffer *buf, struct request *req)
 	if (!buf->sg_list)
 		return -ENOMEM;
 	sg_init_table(buf->sg_list, req->nr_phys_segments);
-	buf->sg_cnt = blk_rq_map_sg(req->q, req, buf->sg_list);
+	buf->sg_cnt = blk_rq_map_sg(req, buf->sg_list);
 	buf->payload_len = blk_rq_bytes(req);
 	return 0;
 }
diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 95361099a2dc..0d619df03fa9 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2056,7 +2056,7 @@ static void mtip_hw_submit_io(struct driver_data *dd, struct request *rq,
 	unsigned int nents;
 
 	/* Map the scatter list for DMA access */
-	nents = blk_rq_map_sg(hctx->queue, rq, command->sg);
+	nents = blk_rq_map_sg(rq, command->sg);
 	nents = dma_map_sg(&dd->pdev->dev, command->sg, nents, dma_dir);
 
 	prefetch(&port->flags);
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 82467ecde7ec..15627417f12e 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1010,7 +1010,7 @@ static int rnbd_client_xfer_request(struct rnbd_clt_dev *dev,
 	 * See queue limits.
 	 */
 	if ((req_op(rq) != REQ_OP_DISCARD) && (req_op(rq) != REQ_OP_WRITE_ZEROES))
-		sg_cnt = blk_rq_map_sg(dev->queue, rq, iu->sgt.sgl);
+		sg_cnt = blk_rq_map_sg(rq, iu->sgt.sgl);
 
 	if (sg_cnt == 0)
 		sg_mark_end(&iu->sgt.sgl[0]);
diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 282f81616a78..2b33fb5b949b 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -485,7 +485,7 @@ static int __send_request(struct request *req)
 	}
 
 	sg_init_table(sg, port->ring_cookies);
-	nsg = blk_rq_map_sg(req->q, req, sg);
+	nsg = blk_rq_map_sg(req, sg);
 
 	len = 0;
 	for (i = 0; i < nsg; i++)
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 6a61ec35f426..a3df4d49bd46 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -226,7 +226,7 @@ static int virtblk_map_data(struct blk_mq_hw_ctx *hctx, struct request *req,
 	if (unlikely(err))
 		return -ENOMEM;
 
-	return blk_rq_map_sg(hctx->queue, req, vbr->sg_table.sgl);
+	return blk_rq_map_sg(req, vbr->sg_table.sgl);
 }
 
 static void virtblk_cleanup_cmd(struct request *req)
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index edcd08a9dcef..5babe575c288 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -751,7 +751,7 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 	id = blkif_ring_get_request(rinfo, req, &final_ring_req);
 	ring_req = &rinfo->shadow[id].req;
 
-	num_sg = blk_rq_map_sg(req->q, req, rinfo->shadow[id].sg);
+	num_sg = blk_rq_map_sg(req, rinfo->shadow[id].sg);
 	num_grant = 0;
 	/* Calculate the number of grant used */
 	for_each_sg(rinfo->shadow[id].sg, sg, num_sg, i)
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 5b617c1f6789..f4398383ae06 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1904,7 +1904,7 @@ static void msb_io_work(struct work_struct *work)
 
 		/* process the request */
 		dbg_verbose("IO: processing new request");
-		blk_rq_map_sg(msb->queue, req, sg);
+		blk_rq_map_sg(req, sg);
 
 		lba = blk_rq_pos(req);
 
diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index 634d343b6bdb..c9853d887d28 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -627,9 +627,7 @@ static int mspro_block_issue_req(struct memstick_dev *card)
 	while (true) {
 		msb->current_page = 0;
 		msb->current_seg = 0;
-		msb->seg_count = blk_rq_map_sg(msb->block_req->q,
-					       msb->block_req,
-					       msb->req_sg);
+		msb->seg_count = blk_rq_map_sg(msb->block_req, msb->req_sg);
 
 		if (!msb->seg_count) {
 			unsigned int bytes = blk_rq_cur_bytes(msb->block_req);
diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index ab662f502fe7..3ba62f825b84 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -523,5 +523,5 @@ unsigned int mmc_queue_map_sg(struct mmc_queue *mq, struct mmc_queue_req *mqrq)
 {
 	struct request *req = mmc_queue_req_to_req(mqrq);
 
-	return blk_rq_map_sg(mq->queue, req, mqrq->sg);
+	return blk_rq_map_sg(req, mqrq->sg);
 }
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 2836905f0152..39cc0a6a4d37 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -199,7 +199,7 @@ static blk_status_t ubiblock_read(struct request *req)
 	 * and ubi_read_sg() will check that limit.
 	 */
 	ubi_sgl_init(&pdu->usgl);
-	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
+	blk_rq_map_sg(req, pdu->usgl.sg);
 
 	while (bytes_left) {
 		/*
diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index a060f69558e7..a437eee741e1 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -525,7 +525,7 @@ static blk_status_t apple_nvme_map_data(struct apple_nvme *anv,
 	if (!iod->sg)
 		return BLK_STS_RESOURCE;
 	sg_init_table(iod->sg, blk_rq_nr_phys_segments(req));
-	iod->nents = blk_rq_map_sg(req->q, req, iod->sg);
+	iod->nents = blk_rq_map_sg(req, iod->sg);
 	if (!iod->nents)
 		goto out_free_sg;
 
diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index b9929a5a7f4e..1b5ad1173bc7 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -2571,7 +2571,7 @@ nvme_fc_map_data(struct nvme_fc_ctrl *ctrl, struct request *rq,
 	if (ret)
 		return -ENOMEM;
 
-	op->nents = blk_rq_map_sg(rq->q, rq, freq->sg_table.sgl);
+	op->nents = blk_rq_map_sg(rq, freq->sg_table.sgl);
 	WARN_ON(op->nents > blk_rq_nr_phys_segments(rq));
 	freq->sg_cnt = fc_dma_map_sg(ctrl->lport->dev, freq->sg_table.sgl,
 				op->nents, rq_dma_dir(rq));
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 950289405ef2..a0b1c57067aa 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -812,7 +812,7 @@ static blk_status_t nvme_map_data(struct nvme_dev *dev, struct request *req,
 	if (!iod->sgt.sgl)
 		return BLK_STS_RESOURCE;
 	sg_init_table(iod->sgt.sgl, blk_rq_nr_phys_segments(req));
-	iod->sgt.orig_nents = blk_rq_map_sg(req->q, req, iod->sgt.sgl);
+	iod->sgt.orig_nents = blk_rq_map_sg(req, iod->sgt.sgl);
 	if (!iod->sgt.orig_nents)
 		goto out_free_sg;
 
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 86a2891d9bcc..b5a0295b5bf4 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -1476,8 +1476,7 @@ static int nvme_rdma_dma_map_req(struct ib_device *ibdev, struct request *rq,
 	if (ret)
 		return -ENOMEM;
 
-	req->data_sgl.nents = blk_rq_map_sg(rq->q, rq,
-					    req->data_sgl.sg_table.sgl);
+	req->data_sgl.nents = blk_rq_map_sg(rq, req->data_sgl.sg_table.sgl);
 
 	*count = ib_dma_map_sg(ibdev, req->data_sgl.sg_table.sgl,
 			       req->data_sgl.nents, rq_dma_dir(rq));
diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index a9d112d34d4f..a5c41144667c 100644
--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -162,7 +162,7 @@ static blk_status_t nvme_loop_queue_rq(struct blk_mq_hw_ctx *hctx,
 		}
 
 		iod->req.sg = iod->sg_table.sgl;
-		iod->req.sg_cnt = blk_rq_map_sg(req->q, req, iod->sg_table.sgl);
+		iod->req.sg_cnt = blk_rq_map_sg(req, iod->sg_table.sgl);
 		iod->req.transfer_len = blk_rq_payload_bytes(req);
 	}
 
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index f1cfe0bb89b2..0d29470e86b0 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1149,7 +1149,7 @@ blk_status_t scsi_alloc_sgtables(struct scsi_cmnd *cmd)
 	 * Next, walk the list, and fill in the addresses and sizes of
 	 * each segment.
 	 */
-	count = __blk_rq_map_sg(rq->q, rq, cmd->sdb.table.sgl, &last_sg);
+	count = __blk_rq_map_sg(rq, cmd->sdb.table.sgl, &last_sg);
 
 	if (blk_rq_bytes(rq) & rq->q->limits.dma_pad_mask) {
 		unsigned int pad_len =
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index fa2a76cc2f73..f2eff998913d 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -1165,14 +1165,13 @@ static inline unsigned short blk_rq_nr_discard_segments(struct request *rq)
 	return max_t(unsigned short, rq->nr_phys_segments, 1);
 }
 
-int __blk_rq_map_sg(struct request_queue *q, struct request *rq,
-		struct scatterlist *sglist, struct scatterlist **last_sg);
-static inline int blk_rq_map_sg(struct request_queue *q, struct request *rq,
-		struct scatterlist *sglist)
+int __blk_rq_map_sg(struct request *rq, struct scatterlist *sglist,
+		struct scatterlist **last_sg);
+static inline int blk_rq_map_sg(struct request *rq, struct scatterlist *sglist)
 {
 	struct scatterlist *last_sg = NULL;
 
-	return __blk_rq_map_sg(q, rq, sglist, &last_sg);
+	return __blk_rq_map_sg(rq, sglist, &last_sg);
 }
 void blk_dump_rq_flags(struct request *, char *);
 
-- 
2.25.1


