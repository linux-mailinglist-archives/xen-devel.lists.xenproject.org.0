Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853421F7391
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 07:39:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjcO0-00023m-GT; Fri, 12 Jun 2020 05:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjcNy-00023h-Vl
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 05:37:51 +0000
X-Inumbo-ID: da172b18-ac6e-11ea-b5a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da172b18-ac6e-11ea-b5a2-12813bfff9fa;
 Fri, 12 Jun 2020 05:37:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BA98AF19;
 Fri, 12 Jun 2020 05:37:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.8-rc1
Date: Fri, 12 Jun 2020 07:37:47 +0200
Message-Id: <20200612053747.13750-1-jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc1-tag

xen: branch for v5.8-rc1

It contains the following patches:

- several smaller cleanups

- a fix for a Xen guest regression with CPU offlining

- a small fix in the xen pvcalls backend driver

- an update of MAINTAINERS


Thanks.

Juergen

 MAINTAINERS                                 |  4 +--
 drivers/pci/xen-pcifront.c                  | 27 ++++++--------
 drivers/xen/Kconfig                         |  4 +++
 drivers/xen/cpu_hotplug.c                   |  8 ++---
 drivers/xen/platform-pci.c                  |  2 +-
 drivers/xen/pvcalls-back.c                  |  5 +--
 drivers/xen/xen-pciback/conf_space.c        | 16 ++++-----
 drivers/xen/xen-pciback/conf_space_header.c | 44 ++++++++---------------
 drivers/xen/xen-pciback/conf_space_quirks.c |  6 ++--
 drivers/xen/xen-pciback/pci_stub.c          | 38 +++++++++-----------
 drivers/xen/xen-pciback/pciback.h           |  2 --
 drivers/xen/xen-pciback/pciback_ops.c       | 55 +++++++++--------------------
 drivers/xen/xen-pciback/vpci.c              | 10 +++---
 drivers/xen/xenbus/xenbus_probe.c           | 11 +++---
 14 files changed, 90 insertions(+), 142 deletions(-)

Bjorn Helgaas (2):
      xen-pciback: Use dev_printk() when possible
      xenbus: Use dev_printk() when possible

Boris Ostrovsky (2):
      xen/cpuhotplug: Fix initial CPU offlining for PV(H) guests
      xen/pci: Get rid of verbose_request and use dev_dbg() instead

Deep Shah (1):
      MAINTAINERS: Update PARAVIRT_OPS_INTERFACE and VMWARE_HYPERVISOR_INTERFACE

Juergen Gross (1):
      xen/pvcalls-back: test for errors when calling backend_connect()

Rikard Falkeborn (1):
      xen-platform: Constify dev_pm_ops

Roger Pau Monne (2):
      xen: expand BALLOON_MEMORY_HOTPLUG description
      xen: enable BALLOON_MEMORY_HOTPLUG by default

YueHaibing (1):
      xen/pvcalls: Make pvcalls_back_global static

