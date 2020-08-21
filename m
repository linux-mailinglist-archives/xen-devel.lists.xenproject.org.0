Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803724DF0D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 20:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9BMr-0007PF-1T; Fri, 21 Aug 2020 18:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NMHL=B7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9BMp-0007PA-SL
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 18:02:19 +0000
X-Inumbo-ID: 28a04d08-9252-4924-aa2a-32a888fa64e1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28a04d08-9252-4924-aa2a-32a888fa64e1;
 Fri, 21 Aug 2020 18:02:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 133F2ACA3;
 Fri, 21 Aug 2020 18:02:46 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.9-rc2
Date: Fri, 21 Aug 2020 20:02:17 +0200
Message-Id: <20200821180217.14469-1-jgross@suse.com>
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

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc2-tag

xen: branch for v5.9-rc2

It contains one build fix and a minor fix for suppressing a useless
warning when booting a Xen dom0 via UEFI.


Thanks.

Juergen

 arch/x86/pci/xen.c          | 1 +
 drivers/video/fbdev/efifb.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

Juergen Gross (1):
      efi: avoid error message when booting under Xen

Randy Dunlap (1):
      Fix build error when CONFIG_ACPI is not set/enabled:

