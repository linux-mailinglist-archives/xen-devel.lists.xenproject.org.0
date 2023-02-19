Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6169BE91
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 06:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497700.768578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTcKK-0008Bc-Kb; Sun, 19 Feb 2023 05:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497700.768578; Sun, 19 Feb 2023 05:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTcKK-00088d-Gz; Sun, 19 Feb 2023 05:33:32 +0000
Received: by outflank-mailman (input) for mailman id 497700;
 Sun, 19 Feb 2023 05:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LAzH=6P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pTcKI-00088X-Ni
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 05:33:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc38b89-b016-11ed-93b5-47a8fe42b414;
 Sun, 19 Feb 2023 06:33:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52189205B9;
 Sun, 19 Feb 2023 05:33:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28EE9139D3;
 Sun, 19 Feb 2023 05:33:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6O+aCKe08WMDVAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Feb 2023 05:33:27 +0000
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
X-Inumbo-ID: efc38b89-b016-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676784807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=832f7y/DEQYVNUWLP48lxy1p/M35cveOY0myYlavc1w=;
	b=upN1/SCIPXlb6jyI32YIG7qFUWroZV28TAjKX8jrvE9zckezEYa3l3FXqDepsPlucEVfKS
	TL0lBYsQ4RYmu0bTmjgGRPNsith4+Rmygwdlj2bg4s1jCWL5rOy2sXASDdZinwE7Q6fT3h
	Fq3tTX2JhVkBspHc8eL5HSbx6v+mmJk=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.3-rc1
Date: Sun, 19 Feb 2023 06:33:26 +0100
Message-Id: <20230219053326.4980-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc1-tag

xen: branch for v6.3-rc1

It contains the following patches:

- A patch to help deprecating the /proc/xen files by making the related
  information available via sysfs.

- 2 patches for making the Xen variants of play_dead "noreturn".

- A patch to support a shared Xen platform interrupt.

- Several small cleanups and fixes.


Thanks.

Juergen

 Documentation/ABI/stable/sysfs-hypervisor-xen | 13 +++++
 arch/x86/xen/setup.c                          |  4 --
 arch/x86/xen/smp.h                            |  2 +
 arch/x86/xen/smp_pv.c                         | 17 ++-----
 arch/x86/xen/time.c                           | 38 +++++++++++++-
 arch/x86/xen/xen-head.S                       |  7 +++
 drivers/xen/events/events_base.c              |  9 ++--
 drivers/xen/grant-dma-iommu.c                 | 11 ++++-
 drivers/xen/platform-pci.c                    |  5 +-
 drivers/xen/pvcalls-back.c                    |  3 +-
 drivers/xen/sys-hypervisor.c                  | 71 +++++++++++++++++++++++++--
 drivers/xen/xen-front-pgdir-shbuf.c           |  2 +-
 include/xen/events.h                          |  2 +-
 tools/objtool/check.c                         |  1 +
 14 files changed, 151 insertions(+), 34 deletions(-)

David Woodhouse (1):
      xen: Allow platform PCI interrupt to be shared

Gustavo A. R. Silva (1):
      xen: Replace one-element array with flexible-array member

Jan Beulich (1):
      x86/Xen: drop leftover VM-assist uses

Juergen Gross (2):
      x86/xen: don't let xen_pv_play_dead() return
      x86/xen: mark xen_pv_play_dead() as __noreturn

Krister Johansen (1):
      x86/xen/time: prefer tsc as clocksource when it is invariant

Oleksandr Tyshchenko (1):
      xen/grant-dma-iommu: Implement a dummy probe_device() callback

Per Bilse (1):
      drivers/xen/hypervisor: Expose Xen SIF flags to userspace

Thomas Weißschuh (1):
      xen: sysfs: make kobj_type structure constant

Volodymyr Babchuk (1):
      xen/pvcalls-back: fix permanently masked event channel

