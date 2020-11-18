Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8ED2B7922
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29436.58827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ8j-0006gZ-Gg; Wed, 18 Nov 2020 08:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29436.58827; Wed, 18 Nov 2020 08:48:33 +0000
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
	id 1kfJ8j-0006fz-DG; Wed, 18 Nov 2020 08:48:33 +0000
Received: by outflank-mailman (input) for mailman id 29436;
 Wed, 18 Nov 2020 08:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ8i-0006e0-1R
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:32 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 754bf64a-9605-43bd-a6cf-fc582c7d0c4f;
 Wed, 18 Nov 2020 08:48:23 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8E-0007kG-NB; Wed, 18 Nov 2020 08:48:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ8i-0006e0-1R
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:32 +0000
X-Inumbo-ID: 754bf64a-9605-43bd-a6cf-fc582c7d0c4f
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 754bf64a-9605-43bd-a6cf-fc582c7d0c4f;
	Wed, 18 Nov 2020 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rtXdmB6pB+D+QbtGbV+uHFq0yQJijYyGHbBI0cLjv2A=; b=MbUsQaP4K2SpOGVW5mv43oSYV6
	aSTVb67wwO58YAjNvYMV+JptsTZETqgQ3iVNAbfWHCQ9HE5JT81DQ5LdbNLiSSXvHq/k7/yLci8zE
	BWakOahKmMr+FGf6UbLTbY5ACvNjirGAI+lCUyjSOA50PJSXlUcCDA0CuGKj7KT+rJUTyYFPsUGnT
	6eRsMiIYjULW2kg2XeaXIAB0btu3VodTKNE1Pz44bT6gTmxgQcB687KguKJxiJBm9EAIUQxLSiLOJ
	rMJ8Ixv3mA08atwcPFG6zZ0vA+A8nlhq/s/JYSobbimDNkp47kt2AOxl+LkE9cWtZofajTO0QNTZm
	OmM7zM1Q==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8E-0007kG-NB; Wed, 18 Nov 2020 08:48:03 +0000
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
Subject: merge struct block_device and struct hd_struct
Date: Wed, 18 Nov 2020 09:47:40 +0100
Message-Id: <20201118084800.2339180-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this series cleans up our main per-device node data structure by merging
the block_device and hd_struct data structures that have the same scope,
but different life times.  The main effect (besides removing lots of
code) is that instead of having two device sizes that need complex
synchronization there is just one now.

Note that it depends on the previous "misc cleanups" series.

A git tree is available here:

    git://git.infradead.org/users/hch/block.git bdev-lookup

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup

Diffstat:
 block/bio.c                                  |    6 
 block/blk-cgroup.c                           |   50 +-
 block/blk-core.c                             |   85 +--
 block/blk-flush.c                            |    2 
 block/blk-iocost.c                           |   36 -
 block/blk-lib.c                              |    2 
 block/blk-merge.c                            |    6 
 block/blk-mq.c                               |   11 
 block/blk-mq.h                               |    5 
 block/blk.h                                  |   92 ----
 block/genhd.c                                |  444 +++++---------------
 block/ioctl.c                                |    7 
 block/partitions/core.c                      |  238 +++--------
 drivers/block/drbd/drbd_receiver.c           |    2 
 drivers/block/drbd/drbd_worker.c             |    2 
 drivers/block/loop.c                         |   21 
 drivers/block/nbd.c                          |    6 
 drivers/block/xen-blkback/common.h           |    4 
 drivers/block/xen-blkfront.c                 |   20 
 drivers/block/zram/zram_drv.c                |   20 
 drivers/md/bcache/request.c                  |    4 
 drivers/md/bcache/super.c                    |   53 --
 drivers/md/dm-table.c                        |    9 
 drivers/md/dm.c                              |   16 
 drivers/md/md.c                              |    8 
 drivers/mtd/mtdsuper.c                       |   17 
 drivers/nvme/target/admin-cmd.c              |   20 
 drivers/s390/block/dasd.c                    |    8 
 drivers/s390/block/dasd_ioctl.c              |    9 
 drivers/scsi/scsicam.c                       |    2 
 drivers/target/target_core_file.c            |    6 
 drivers/target/target_core_pscsi.c           |    7 
 drivers/usb/gadget/function/storage_common.c |    8 
 fs/block_dev.c                               |  578 ++++++++-------------------
 fs/btrfs/sysfs.c                             |   15 
 fs/btrfs/volumes.c                           |   13 
 fs/ext4/super.c                              |   18 
 fs/ext4/sysfs.c                              |   10 
 fs/f2fs/checkpoint.c                         |    5 
 fs/f2fs/f2fs.h                               |    2 
 fs/f2fs/super.c                              |    8 
 fs/f2fs/sysfs.c                              |    9 
 fs/inode.c                                   |    3 
 fs/internal.h                                |    7 
 fs/io_uring.c                                |   10 
 fs/pipe.c                                    |    5 
 fs/pstore/blk.c                              |    2 
 fs/quota/quota.c                             |   40 +
 fs/statfs.c                                  |    2 
 fs/super.c                                   |   86 ----
 include/linux/blk-cgroup.h                   |    4 
 include/linux/blk_types.h                    |   26 +
 include/linux/blkdev.h                       |   24 -
 include/linux/fs.h                           |    5 
 include/linux/genhd.h                        |  104 ----
 include/linux/part_stat.h                    |   17 
 init/do_mounts.c                             |  271 +++++-------
 kernel/trace/blktrace.c                      |   54 --
 mm/filemap.c                                 |    9 
 59 files changed, 837 insertions(+), 1716 deletions(-)

