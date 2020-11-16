Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510D2B46BD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 15:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28011.56630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kefyK-0007IW-GH; Mon, 16 Nov 2020 14:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28011.56630; Mon, 16 Nov 2020 14:59:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kefyK-0007Hg-AK; Mon, 16 Nov 2020 14:59:12 +0000
Received: by outflank-mailman (input) for mailman id 28011;
 Mon, 16 Nov 2020 14:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefyJ-0006ni-0B
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af4cc64f-5e0f-485f-8d6f-89071da97c7a;
 Mon, 16 Nov 2020 14:58:37 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxT-0003kh-MQ; Mon, 16 Nov 2020 14:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefyJ-0006ni-0B
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:59:11 +0000
X-Inumbo-ID: af4cc64f-5e0f-485f-8d6f-89071da97c7a
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id af4cc64f-5e0f-485f-8d6f-89071da97c7a;
	Mon, 16 Nov 2020 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oD/feK/kknJy8NgrN6GUwKk4j5cIe6yLgGU87KzsgtI=; b=IrFVDJmAyDCdyIjxW0mx/wM+i0
	EfULIltaIxUj6jxf0IidNz1l2jSw8Ksulh7xmd0CBDNRy5YCjxY1r+V6kXvdMfu4B/jrKJGjZItyY
	pmVnQEQV+OHhGl4k/Fbj2BhN/m0dlPmLgbtOB54UGEgkstKPEUU8vGqNKmkcDv/niskfsfpX18U5w
	8InEkFKVUp9ZNaV7h0/GILJT1k3XrBuLsYqtDA+gf+w4j99DHcs4CUnHwP7kXuwaUANPik+3qgqiI
	RHxMSvMovWPDR+Oayh36XrbKH+oZyCtI9oB6aJjNi0FJ0TmkB7C1+oOtTu6BFVjYIqdqBrv/I5gjp
	v+ue0wAw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxT-0003kh-MQ; Mon, 16 Nov 2020 14:58:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 07/78] nbd: move the task_recv check into nbd_size_update
Date: Mon, 16 Nov 2020 15:56:58 +0100
Message-Id: <20201116145809.410558-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

nbd_size_update is about to acquire a few more callers, so lift the check
into the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a9a0b49ff16101..48054051e281e6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -299,8 +299,11 @@ static void nbd_size_clear(struct nbd_device *nbd)
 static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
-	struct block_device *bdev = bdget_disk(nbd->disk, 0);
 	sector_t nr_sectors = config->bytesize >> 9;
+	struct block_device *bdev;
+
+	if (!nbd->task_recv)
+		return;
 
 	if (config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = config->blksize;
@@ -309,7 +312,9 @@ static void nbd_size_update(struct nbd_device *nbd)
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
+
 	set_capacity(nbd->disk, nr_sectors);
+	bdev = bdget_disk(nbd->disk, 0);
 	if (bdev) {
 		if (bdev->bd_disk)
 			bd_set_nr_sectors(bdev, nr_sectors);
@@ -326,8 +331,7 @@ static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
 	struct nbd_config *config = nbd->config;
 	config->blksize = blocksize;
 	config->bytesize = blocksize * nr_blocks;
-	if (nbd->task_recv != NULL)
-		nbd_size_update(nbd);
+	nbd_size_update(nbd);
 }
 
 static void nbd_complete_rq(struct request *req)
-- 
2.29.2


