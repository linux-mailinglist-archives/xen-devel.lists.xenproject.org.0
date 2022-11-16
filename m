Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C662BCD5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 13:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444282.699315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovH6B-0001io-Ig; Wed, 16 Nov 2022 12:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444282.699315; Wed, 16 Nov 2022 12:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovH6B-0001go-Ef; Wed, 16 Nov 2022 12:00:59 +0000
Received: by outflank-mailman (input) for mailman id 444282;
 Wed, 16 Nov 2022 12:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QvhJ=3Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ovH6A-0001gf-HQ
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 12:00:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5442f264-65a6-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 13:00:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE7B11F920;
 Wed, 16 Nov 2022 12:00:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 958F5134CE;
 Wed, 16 Nov 2022 12:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id udgsI/jQdGMmfAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Nov 2022 12:00:56 +0000
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
X-Inumbo-ID: 5442f264-65a6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668600056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TaAYGyrK+gIkH4bFpXR1icxkafDb9eg/FxEUQ9skTfs=;
	b=SOtoES5Q5ipivJ35qSqTxfv5+AoEThrnnoou+X6m6xTHbdx+vgUMXn3AdSOX+DDuTMSZYZ
	xtKuWmoSxGRceSkOn/CPK4OXP0zsj2gYpnIJAS6Q4wVexRs6McRVEMsFZSifBKyADXrC65
	33z0+a3A44nNJCREnmrTDKMc7M2v3oM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc6
Date: Wed, 16 Nov 2022 13:00:55 +0100
Message-Id: <20221116120055.4299-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc6-tag

xen: branch for v6.1-rc6

It contains two trivial cleanups, and 3 simple fixes.


Thanks.

Juergen

 arch/x86/xen/enlighten_pv.c                     |  3 ++-
 arch/x86/xen/setup.c                            |  3 ++-
 drivers/xen/pcpu.c                              |  2 +-
 drivers/xen/platform-pci.c                      | 10 +++++++---
 drivers/xen/xen-pciback/conf_space_capability.c |  9 ++++++---
 5 files changed, 18 insertions(+), 9 deletions(-)

Christophe JAILLET (1):
      x86/xen: Use kstrtobool() instead of strtobool()

Juergen Gross (1):
      xen/platform-pci: use define instead of literal number

Marek Marczykowski-Górecki (1):
      xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too

Yang Yingliang (1):
      xen/pcpu: fix possible memory leak in register_pcpu()

ruanjinjie (1):
      xen/platform-pci: add missing free_irq() in error path

