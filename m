Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802FE1AE0E1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 17:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPSkO-0004N4-9N; Fri, 17 Apr 2020 15:17:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jPSkM-0004Mx-PT
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 15:17:38 +0000
X-Inumbo-ID: 925c32b8-80be-11ea-8d1d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 925c32b8-80be-11ea-8d1d-12813bfff9fa;
 Fri, 17 Apr 2020 15:17:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68C39AD2A;
 Fri, 17 Apr 2020 15:17:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.7-rc2
Date: Fri, 17 Apr 2020 17:17:35 +0200
Message-Id: <20200417151735.30600-1-jgross@suse.com>
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

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc2-tag

xen: branch for v5.7-rc2

It contains:
- a small cleanup patch
- a security fix for a bug in the Xen hypervisor to avoid enabling Xen
  guests to crash dom0 on an unfixed hypervisor.

Thanks.

Juergen

 arch/arm/xen/enlighten.c           | 2 +-
 drivers/xen/xenbus/xenbus_client.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

Jason Yan (1):
      arm/xen: make _xen_start_info static

Juergen Gross (1):
      xen/xenbus: ensure xenbus_map_ring_valloc() returns proper grant status

