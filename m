Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E842445F0B9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233205.404525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqdCe-0002K1-3r; Fri, 26 Nov 2021 15:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233205.404525; Fri, 26 Nov 2021 15:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqdCd-0002Gv-Ve; Fri, 26 Nov 2021 15:31:55 +0000
Received: by outflank-mailman (input) for mailman id 233205;
 Fri, 26 Nov 2021 15:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8kDD=QN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqdCc-0002Gp-Mf
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:31:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb2e1869-4ecd-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:31:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4BA82193C;
 Fri, 26 Nov 2021 15:31:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A753613C65;
 Fri, 26 Nov 2021 15:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1y6hJ+j9oGGubgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 26 Nov 2021 15:31:52 +0000
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
X-Inumbo-ID: fb2e1869-4ecd-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637940712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iuWswj+KSBKhGTzpmaFe1OYVr6F6OkM+6uhQMY9vN6U=;
	b=RUScaE9Z/A4fFF1JFlCkn4fO8pSEQRWQhJzg8wUClWJJT51aDFtUKPBhbm5mahTWg/c0Oy
	L1m1ZquVx9X1Gxn7qf+uWsrQ3Cq35aX83ZijsE52IvKEaLVbc85I8Q2gVi0ajYeXkYIPnk
	USZ/gWrE/TDjnn1rkbjj0WYkgLx+jCQ=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.16-rc3
Date: Fri, 26 Nov 2021 16:31:52 +0100
Message-Id: <20211126153152.380-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.16c-rc3-tag

xen: branch for v5.16-rc3

It contains the following changes:
- a Xen related Kconfig fix for making it possible to control building
  of the privcmd driver
- 3 patches for fixing issues identified by the kernel test robot
- a 5 patch series for simplifying timeout handling for Xen PV driver
  initialization
- 2 patches for fixing error paths in xenstore/xenbus driver initialization

Thanks.

Juergen

 arch/x86/include/asm/xen/hypercall.h       |  4 ++--
 arch/x86/include/asm/xen/hypervisor.h      |  1 +
 drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
 drivers/input/misc/xen-kbdfront.c          |  1 +
 drivers/tty/hvc/hvc_xen.c                  |  1 +
 drivers/video/fbdev/xen-fbfront.c          |  1 +
 drivers/xen/Kconfig                        |  8 +++++++-
 drivers/xen/pvcalls-front.c                |  1 +
 drivers/xen/xenbus/xenbus_probe.c          | 27 ++++++++++++++++++++++++++-
 drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
 include/xen/xenbus.h                       |  1 +
 sound/xen/xen_snd_front.c                  |  1 +
 12 files changed, 46 insertions(+), 15 deletions(-)

Juergen Gross (9):
      xen/privcmd: make option visible in Kconfig
      xen/pvh: add missing prototype to header
      xen: add "not_essential" flag to struct xenbus_driver
      xen: flag xen_drm_front to be not essential for system boot
      xen: flag hvc_xen to be not essential for system boot
      xen: flag pvcalls-front to be not essential for system boot
      xen: flag xen_snd_front to be not essential for system boot
      xen: make HYPERVISOR_get_debugreg() always_inline
      xen: make HYPERVISOR_set_debugreg() always_inline

Stefano Stabellini (2):
      xen: don't continue xenstore initialization in case of errors
      xen: detect uninitialized xenbus in xenbus_init

