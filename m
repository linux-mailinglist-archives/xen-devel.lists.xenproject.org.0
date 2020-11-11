Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8282AEB66
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24359.51551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclTV-0002dj-Tp; Wed, 11 Nov 2020 08:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24359.51551; Wed, 11 Nov 2020 08:27:29 +0000
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
	id 1kclTV-0002dK-Qb; Wed, 11 Nov 2020 08:27:29 +0000
Received: by outflank-mailman (input) for mailman id 24359;
 Wed, 11 Nov 2020 08:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclTS-0002dF-J8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:27:27 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ccb2d29-f0d0-4874-8e7e-1d45f2d6a14d;
 Wed, 11 Nov 2020 08:27:24 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclT1-0007Z4-Lb; Wed, 11 Nov 2020 08:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclTS-0002dF-J8
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:27:27 +0000
X-Inumbo-ID: 8ccb2d29-f0d0-4874-8e7e-1d45f2d6a14d
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ccb2d29-f0d0-4874-8e7e-1d45f2d6a14d;
	Wed, 11 Nov 2020 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JAKJjNQpsrrbjmsxnYVVJRTgGHrM34ycZR/npT/boCU=; b=b1ddQnGWc2jtHoKywAuScN8Zdh
	JpUZaUqXCtKuY0r1wvcQJho9I5LlxQ+Jf1PeuV9MT8HozEqz08MjPlQ2bflOzs5jN6AtnzX9UZLvR
	TP+ksdGoX+zMrKqAYf6UV/230oaeX+lnludtn/sFHHGEZUrrgeMSlNkGj8LNwkKSIL8M1BtpRD8QW
	JHnmwoGSdoYRlX13Qq80Wbx/PB+8AMxck1eRfIb4ZyOL7mf/BnfhPUzDrVsEYY2/hN12f5r+V4/aB
	CJTa0r5tvV0A5l4JwwqEcBTVEhomL9IDTnuaOQ3CyD1joSKU5ImqC0esiM6bTSJ+Tq3LxQEN03v+h
	/wjoDc/w==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclT1-0007Z4-Lb; Wed, 11 Nov 2020 08:27:00 +0000
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
Subject: cleanup updating the size of block devices v2
Date: Wed, 11 Nov 2020 09:26:34 +0100
Message-Id: <20201111082658.3401686-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this series builds on top of the work that went into the last merge window,
and make sure we have a single coherent interfac for updating the size of a
block device.

Changes since v1:
 - minor spelling fixes

Diffstat:
 block/genhd.c                  |   16 +++----
 drivers/block/aoe/aoecmd.c     |   15 +-----
 drivers/block/drbd/drbd_main.c |    6 --
 drivers/block/loop.c           |   36 ++--------------
 drivers/block/nbd.c            |   88 +++++++++++++----------------------------
 drivers/block/pktcdvd.c        |    3 -
 drivers/block/rbd.c            |    3 -
 drivers/block/rnbd/rnbd-clt.c  |    3 -
 drivers/block/virtio_blk.c     |    3 -
 drivers/block/xen-blkfront.c   |    2 
 drivers/block/zram/zram_drv.c  |    7 ---
 drivers/md/dm-raid.c           |    3 -
 drivers/md/dm.c                |    3 -
 drivers/md/md-cluster.c        |    8 ---
 drivers/md/md-linear.c         |    3 -
 drivers/md/md.c                |   24 ++++-------
 drivers/nvme/host/core.c       |   18 --------
 drivers/scsi/sd.c              |    9 +---
 fs/block_dev.c                 |    7 ---
 include/linux/genhd.h          |    3 -
 20 files changed, 76 insertions(+), 184 deletions(-)

