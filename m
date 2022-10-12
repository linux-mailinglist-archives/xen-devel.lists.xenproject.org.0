Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9545FC124
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 09:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420818.665866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVyY-0006pI-Fr; Wed, 12 Oct 2022 07:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420818.665866; Wed, 12 Oct 2022 07:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVyY-0006mD-CU; Wed, 12 Oct 2022 07:16:22 +0000
Received: by outflank-mailman (input) for mailman id 420818;
 Wed, 12 Oct 2022 07:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zRMe=2N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oiVyX-0006m6-Fn
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 07:16:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ef1c96-49fd-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 09:16:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 814C31F8AC;
 Wed, 12 Oct 2022 07:16:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4873013A5C;
 Wed, 12 Oct 2022 07:16:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KZxSEMNpRmNROQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Oct 2022 07:16:19 +0000
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
X-Inumbo-ID: c4ef1c96-49fd-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665558979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uVN9aIUqx34P/45tcMyef9ckHEUfMNnGUM08QJbEcWE=;
	b=FZS6AM6zDQA0sW9E4AD+vHPONn2WtBOhg/pbZ/EKi9wcFoL2lpkJUc5MYMKmtT0BbNORyO
	rotC6zeIWH9kOkSQTxynPjX+Nlds9dAUuDfgnEezA+dCLuotphLFB882Cs/ODXkVenqH9X
	mujfc4JLFRWQQQk+D2ikhwVu/4ADcq4=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc1
Date: Wed, 12 Oct 2022 09:16:18 +0200
Message-Id: <20221012071618.8859-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc1-tag

xen: branch for v6.1-rc1

It contains:

- Some minor typo fixes

- A fix of the Xen pcifront driver for supporting the device model to
  run in a Linux stub domain

- A cleanup of the pcifront driver

- A series to enable grant-based virtio with Xen on x86

- A cleanup of Xen PV guests to distinguish between safe and faulting
  MSR accesses

- Two fixes of the Xen gntdev driver

- Two fixes of the new xen grant DMA driver


Thanks.

Juergen

 Documentation/admin-guide/kernel-parameters.txt |   6 +
 arch/x86/xen/Kconfig                            |   9 ++
 arch/x86/xen/enlighten_hvm.c                    |   2 +-
 arch/x86/xen/enlighten_pv.c                     | 101 ++++++++++-----
 arch/x86/xen/pmu.c                              |  71 ++++++-----
 drivers/pci/xen-pcifront.c                      | 161 ++++++++----------------
 drivers/xen/Kconfig                             |   2 +-
 drivers/xen/gntdev-common.h                     |   3 +-
 drivers/xen/gntdev.c                            |  80 ++++++------
 drivers/xen/grant-dma-ops.c                     | 112 ++++++++++++-----
 drivers/xen/xen-pciback/xenbus.c                |   2 +-
 include/xen/xen-ops.h                           |   6 +
 12 files changed, 313 insertions(+), 242 deletions(-)

Colin Ian King (2):
      xen/xenbus: Fix spelling mistake "hardward" -> "hardware"
      xen: Kconfig: Fix spelling mistake "Maxmium" -> "Maximum"

Jason Andryuk (1):
      xen-pcifront: Handle missed Connected state

Juergen Gross (8):
      xen/pcifront: move xenstore config scanning into sub-function
      xen/virtio: restructure xen grant dma setup
      xen/virtio: use dom0 as default backend for CONFIG_XEN_VIRTIO_FORCE_GRANT
      xen/virtio: enable grant based virtio on x86
      xen/pv: add fault recovery control to pmu msr accesses
      xen/pv: fix vendor checks for pmu emulation
      xen/pv: refactor msr access functions to support safe and unsafe accesses
      xen/pv: support selecting safe/unsafe msr accesses

M. Vefa Bicakci (2):
      xen/gntdev: Prevent leaking grants
      xen/gntdev: Accommodate VMA splitting

Oleksandr Tyshchenko (2):
      xen/virtio: Fix n_pages calculation in xen_grant_dma_map(unmap)_page()
      xen/virtio: Fix potential deadlock when accessing xen_grant_dma_devices

