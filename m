Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3A2C285A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36162.68106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYYo-0005eT-9A; Tue, 24 Nov 2020 13:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36162.68106; Tue, 24 Nov 2020 13:40:46 +0000
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
	id 1khYYn-0005ae-Lt; Tue, 24 Nov 2020 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 36162;
 Tue, 24 Nov 2020 13:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYOD-0000Qf-34
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:49 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8182bed2-3796-44c6-ab08-0196e6a8c9b2;
 Tue, 24 Nov 2020 13:28:43 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMt-0006ZX-Sm; Tue, 24 Nov 2020 13:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYOD-0000Qf-34
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:49 +0000
X-Inumbo-ID: 8182bed2-3796-44c6-ab08-0196e6a8c9b2
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8182bed2-3796-44c6-ab08-0196e6a8c9b2;
	Tue, 24 Nov 2020 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Xb3N2WAG9okvbjUfnpwdPBpAQhXn4NZ0O9b+iLQ2eLQ=; b=CD/Zu5S2v7JQL86T+0gRFtsLfM
	kUwH6dfh/CUdlgUxbwmElUz1fNicSaXpuoV30QiF0OgxlWK+j2EQGIY98jL+xCm41ZUs+ViX+4lbj
	llVEfGhPh4OpwiirW/phioWj5T3r2yQ0gr6vFtAr06LZvYhNT0W/ToEJaw6bUZy8/QSzbAoLJ2UC2
	QBgLCJI2097N6fhHep3+PhoV8nL1LM5nsWvpDoUPBnB//Qcb6h/ul/dvjIH2tAZVhJ1IXEJkOYBJS
	i/4l9EYviSTH0C4sbrZzfFcEyr70QHVgNDAlvJ0U7h2bfcMEoxnQVw6Zb5q1tzhzSoYmcYIu7Wg3G
	DywyGKyA==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMt-0006ZX-Sm; Tue, 24 Nov 2020 13:28:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 22/45] block: opencode devcgroup_inode_permission
Date: Tue, 24 Nov 2020 14:27:28 +0100
Message-Id: <20201124132751.3747337-23-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Just call devcgroup_check_permission to avoid various superflous checks
and a double conversion of the access flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 2ffa11a95f10db..1e35faf6dad42c 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1515,15 +1515,13 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
 	struct block_device *claiming;
 	bool unblock_events = true;
 	struct gendisk *disk;
-	int perm = 0;
 	int partno;
 	int ret;
 
-	if (mode & FMODE_READ)
-		perm |= MAY_READ;
-	if (mode & FMODE_WRITE)
-		perm |= MAY_WRITE;
-	ret = devcgroup_inode_permission(bdev->bd_inode, perm);
+	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
+			imajor(bdev->bd_inode), iminor(bdev->bd_inode),
+			((mode & FMODE_READ) ? DEVCG_ACC_READ : 0) |
+			((mode & FMODE_WRITE) ? DEVCG_ACC_WRITE : 0));
 	if (ret)
 		goto bdput;
 
-- 
2.29.2


