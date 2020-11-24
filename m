Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0162C27AF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36054.67832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYOT-0002Fa-T0; Tue, 24 Nov 2020 13:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36054.67832; Tue, 24 Nov 2020 13:30:05 +0000
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
	id 1khYOT-0002DM-O2; Tue, 24 Nov 2020 13:30:05 +0000
Received: by outflank-mailman (input) for mailman id 36054;
 Tue, 24 Nov 2020 13:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYNy-0000Qf-2P
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:34 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8eef9b6d-0fcd-4372-b97b-0a155c9a35bc;
 Tue, 24 Nov 2020 13:28:39 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMj-0006XN-5i; Tue, 24 Nov 2020 13:28:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYNy-0000Qf-2P
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:34 +0000
X-Inumbo-ID: 8eef9b6d-0fcd-4372-b97b-0a155c9a35bc
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8eef9b6d-0fcd-4372-b97b-0a155c9a35bc;
	Tue, 24 Nov 2020 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5XlVZbSBkS7owyByi7+TU2krdZYtRQJNSLbElG7UMJM=; b=GrByciCmlypygW+ymXF+7X/jSp
	HsgeqlURzqGzlgS5RJ/o9YvA/LFELAtg9fJnwnXHIYCDHFU5pcD4d6q944dHkxA6N7cn0bDnE7VXh
	GGu35B6Gcg+bgzCRYC//r/GDM/4JYgkFo6e+maqC9WuOLWUBLvew8ZTAEOoLACaBDzdaiWX4kCzN1
	mrD6nnXkiMIkyK5dE06VrsauzZZkdbBiGnIewiH224Fo/WsEG8HJfz+sdUEhX6TsJp+ZFRhjiRw2S
	cY+TmRWWh+F6CCP9jGYgpqRwjHhvoZocC5aLnQE1p+91dxzwMcKB7t/OezvIVTW5MzvYKNFt5e/x4
	rVcbPBpg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMj-0006XN-5i; Tue, 24 Nov 2020 13:28:17 +0000
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
Subject: [PATCH 15/45] block: use put_device in put_disk
Date: Tue, 24 Nov 2020 14:27:21 +0100
Message-Id: <20201124132751.3747337-16-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use put_device to put the device instead of poking into the internals
and using kobject_put.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/genhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index 0bd9c41dd4cb69..f46e89226fdf91 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1803,7 +1803,7 @@ EXPORT_SYMBOL(__alloc_disk_node);
 void put_disk(struct gendisk *disk)
 {
 	if (disk)
-		kobject_put(&disk_to_dev(disk)->kobj);
+		put_device(disk_to_dev(disk));
 }
 EXPORT_SYMBOL(put_disk);
 
-- 
2.29.2


