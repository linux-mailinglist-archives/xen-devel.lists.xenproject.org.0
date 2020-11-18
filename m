Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874382B7933
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29440.58851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ8t-0006oo-7v; Wed, 18 Nov 2020 08:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29440.58851; Wed, 18 Nov 2020 08:48:43 +0000
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
	id 1kfJ8t-0006ny-4H; Wed, 18 Nov 2020 08:48:43 +0000
Received: by outflank-mailman (input) for mailman id 29440;
 Wed, 18 Nov 2020 08:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ8s-0006e0-1o
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:42 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ec9e0d1-13b2-44d9-83ef-d58e4f30802e;
 Wed, 18 Nov 2020 08:48:24 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8M-0007ky-MA; Wed, 18 Nov 2020 08:48:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ8s-0006e0-1o
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:42 +0000
X-Inumbo-ID: 2ec9e0d1-13b2-44d9-83ef-d58e4f30802e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2ec9e0d1-13b2-44d9-83ef-d58e4f30802e;
	Wed, 18 Nov 2020 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yHhXeiyRNaQPcpM2nqUGOQAlRtiBH1PeNN6xDbuA8UE=; b=ZzCRySiTV8SiCXIJ3vfmIUEXvr
	uIJL5nS39gGqLhbC29g9AgM4MwKAtfdRHvWFPaw8smy3i22eU8iUjNKhVCWvGhbBViCoRsKcO6GQU
	SrQ87ktJRa5o18ql91Xe/INMz7nHNZqm8LQea7oI5+JgzZpIdqxe0qq5Ujh4GvgHhDai5SolBAJuU
	l/EDSwn8iwf9v+NLccmqQ0SiSa/CQy9vyIOE8M4CboYWb1kWDaemO8wzQB2ZRBmLrktfDwZWQWu2e
	CuL+t5bFawnPWgtVE7aLR0tFwcZmUHWOkcqi2WOEC8evYMNZjdXQFh3mSoEa6nq87Jj9ktco/+Nkh
	5sAjpgag==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8M-0007ky-MA; Wed, 18 Nov 2020 08:48:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 05/20] block: use put_device in put_disk
Date: Wed, 18 Nov 2020 09:47:45 +0100
Message-Id: <20201118084800.2339180-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use put_device to put the device instead of poking into the internals
and using kobject_put.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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


