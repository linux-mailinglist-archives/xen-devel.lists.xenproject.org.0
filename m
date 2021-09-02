Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40633FEA08
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177079.322279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhA5-0002yz-F7; Thu, 02 Sep 2021 07:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177079.322279; Thu, 02 Sep 2021 07:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhA5-0002wG-BO; Thu, 02 Sep 2021 07:29:25 +0000
Received: by outflank-mailman (input) for mailman id 177079;
 Thu, 02 Sep 2021 07:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fIFR=NY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mLhA4-0002wA-0E
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 07:29:24 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e147abc-0bbf-11ec-ae41-12813bfff9fa;
 Thu, 02 Sep 2021 07:29:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 18F7720312;
 Thu,  2 Sep 2021 07:29:22 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DE1D813887;
 Thu,  2 Sep 2021 07:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id am2SNFF9MGH1OQAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 02 Sep 2021 07:29:21 +0000
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
X-Inumbo-ID: 7e147abc-0bbf-11ec-ae41-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630567762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IhcUjy8QGji2IABo6zcQqKi+1URPttsD+rMluhzr+U0=;
	b=gmK9k6utB4XDKQvE7yRgd7hk0/UUoy/oSRCveEWBBA12IccGUhOvjxNCVAqE7Hv9LWIwzf
	RfboEvRXeWHC5aZvw5Ej+gSD+W065MgGPNiCDNnnWXjNWBjs38EK8644ge/S3VHdKXlmfT
	f8HsXXPLRLgwX4qF6ZXJoXm+7xmJI1I=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.15-rc1
Date: Thu,  2 Sep 2021 09:29:21 +0200
Message-Id: <20210902072921.27763-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15-rc1-tag

xen: branch for v5.15-rc1

It contains the following changes:

- some small cleanups
- a fix for a bug when running as Xen PV guest which could result in
  not all memory being transferred in case of a migration of the guest
- a small series for getting rid of code for supporting very old Xen
  hypervisor versions nobody should be using since many years now
- a series for hardening the Xen block frontend driver
- a fix for Xen PV boot code issuing warning messages due to a stray
  preempt_disable() on the non-boot processors

Thanks.

Juergen

 arch/x86/xen/enlighten_pv.c        |  12 +---
 arch/x86/xen/mmu_pv.c              |   4 +-
 arch/x86/xen/p2m.c                 |   4 +-
 arch/x86/xen/platform-pci-unplug.c |  16 ++---
 arch/x86/xen/smp_pv.c              |   1 -
 drivers/block/xen-blkfront.c       | 126 ++++++++++++++++++++++++-------------
 drivers/pci/xen-pcifront.c         |  30 +++++----
 drivers/xen/features.c             |  18 ++++++
 drivers/xen/gntdev.c               |  36 +----------
 drivers/xen/xenbus/xenbus_client.c |   9 +--
 10 files changed, 141 insertions(+), 115 deletions(-)

Jing Yangyang (1):
      drivers/xen/xenbus/xenbus_client.c: fix bugon.cocci warnings

Juergen Gross (9):
      xen: fix setting of max_pfn in shared_info
      xen: check required Xen features
      xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
      xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests
      xen/blkfront: read response from backend only once
      xen/blkfront: don't take local copy of a request from the ring page
      xen/blkfront: don't trust the backend response data blindly
      xen: remove stray preempt_disable() from PV AP startup code

Sergio Miguéns Iglesias (1):
      xen/pcifront: Removed unnecessary __ref annotation

zhaoxiao (1):
      x86: xen: platform-pci-unplug: use pr_err() and pr_warn() instead of raw printk()

