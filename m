Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB22566C6
	for <lists+xen-devel@lfdr.de>; Sat, 29 Aug 2020 12:04:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBxiT-0006lQ-FV; Sat, 29 Aug 2020 10:04:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x5UR=CH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBxiR-0006lL-SW
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2020 10:04:07 +0000
X-Inumbo-ID: 94071203-900a-4156-894f-589c1cb78cb7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94071203-900a-4156-894f-589c1cb78cb7;
 Sat, 29 Aug 2020 10:04:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71682ACB5;
 Sat, 29 Aug 2020 10:04:39 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.9-rc3
Date: Sat, 29 Aug 2020 12:04:05 +0200
Message-Id: <20200829100405.23826-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc3-tag

xen: branch for v5.9-rc3

It contains two fixes for Xen: one needed for ongoing work to support
virtio with Xen, and one for a corner case in IRQ handling with Xen.


Thanks.

Juergen

 drivers/xen/events/events_base.c   | 16 ++++++++--------
 drivers/xen/xenbus/xenbus_client.c | 10 ++++++++--
 include/xen/arm/page.h             |  6 +++++-
 3 files changed, 21 insertions(+), 11 deletions(-)

Simon Leiner (2):
      xen/xenbus: Fix granting of vmalloc'd memory
      arm/xen: Add misuse warning to virt_to_gfn

Thomas Gleixner (1):
      XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt XEN data pointer which contains XEN specific information.

