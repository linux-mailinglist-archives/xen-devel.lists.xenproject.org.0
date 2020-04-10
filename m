Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA891A4280
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 08:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMn5h-00053L-02; Fri, 10 Apr 2020 06:24:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L1Sz=52=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMn5g-00053G-1f
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 06:24:36 +0000
X-Inumbo-ID: f0ed61e2-7af3-11ea-83b3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0ed61e2-7af3-11ea-83b3-12813bfff9fa;
 Fri, 10 Apr 2020 06:24:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BD58AC77;
 Fri, 10 Apr 2020 06:24:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.7-rc1
Date: Fri, 10 Apr 2020 08:24:30 +0200
Message-Id: <20200410062430.20949-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc1b-tag

xen: branch for v5.7-rc1b

This is a second batch of Xen related patches:

- two cleanup patches
- a patch to fix a boot regression introduced earlier in 5.7
- a patch to fix wrong usage of memory allocation flags

Thanks.

Juergen

 arch/x86/xen/setup.c                  |  2 +-
 arch/x86/xen/xen-head.S               |  2 +-
 drivers/block/xen-blkfront.c          | 17 +++++--
 drivers/xen/events/events_2l.c        | 16 +++---
 drivers/xen/events/events_base.c      | 93 ++++++++++++++++++-----------------
 drivers/xen/events/events_fifo.c      | 22 ++++-----
 drivers/xen/events/events_internal.h  | 30 +++++------
 drivers/xen/evtchn.c                  | 13 ++---
 drivers/xen/gntdev-common.h           |  3 +-
 drivers/xen/gntdev.c                  |  2 +-
 drivers/xen/pvcalls-back.c            |  5 +-
 drivers/xen/pvcalls-front.c           | 15 +++---
 drivers/xen/xen-pciback/xenbus.c      |  7 +--
 drivers/xen/xen-scsiback.c            |  3 +-
 drivers/xen/xenbus/xenbus_client.c    |  6 +--
 include/xen/events.h                  | 22 ++++-----
 include/xen/interface/event_channel.h |  2 +-
 include/xen/xenbus.h                  |  5 +-
 18 files changed, 142 insertions(+), 123 deletions(-)

Jason Yan (1):
      x86/xen: make xen_pvmmu_arch_setup() static

Juergen Gross (2):
      xen/blkfront: fix memory allocation flags in blkfront_setup_indirect()
      x86/xen: fix booting 32-bit pv guest

Yan Yankovskyi (1):
      xen: Use evtchn_type_t as a type for event channels

