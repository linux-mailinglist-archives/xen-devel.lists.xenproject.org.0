Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE2752103
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 14:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563125.880131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvEZ-0004mV-J1; Thu, 13 Jul 2023 12:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563125.880131; Thu, 13 Jul 2023 12:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvEZ-0004jF-G5; Thu, 13 Jul 2023 12:15:47 +0000
Received: by outflank-mailman (input) for mailman id 563125;
 Thu, 13 Jul 2023 12:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qJvEX-0004j9-Kk
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 12:15:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd1e51ec-2176-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 14:15:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFFFD1FDAE;
 Thu, 13 Jul 2023 12:15:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA2C0133D6;
 Thu, 13 Jul 2023 12:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MjDtK+7qr2TLJQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 13 Jul 2023 12:15:42 +0000
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
X-Inumbo-ID: fd1e51ec-2176-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689250542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=69I9n2IK3naLFPJAhL5ZT4b7LKGGJ1CwIXBa7kBCt5U=;
	b=MQCCxB2Vlfl4wRDyy7mk8NCrZoyHLEB6I2HxpmeQgn8e4ut2z2KDRmd4VZrd1H+0jImkaw
	1tBCvT0JpY8S+P0Iq3SbfO/w1TDlYUW5z6u3B67RF/wabIAeEnecE48LwiMhZefI5M+agi
	v8mX3H8rOGhC4aQOvyK6jSLksu4fSRc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.5-rc2
Date: Thu, 13 Jul 2023 14:15:42 +0200
Message-Id: <20230713121542.4854-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc2-tag

xen: branch for v6.5-rc2

It contains the following patches:

- a cleanup of the Xe related ELF-notes

- a fix for virtio handling in Xen dom0 when running Xen in a VM


Thanks.

Juergen

 arch/x86/xen/xen-head.S     | 37 +++++++++++++++++++++----------------
 drivers/xen/grant-dma-ops.c |  2 ++
 2 files changed, 23 insertions(+), 16 deletions(-)

Jan Beulich (1):
      x86/Xen: tidy xen-head.S

Petr Pavlu (1):
      xen/virtio: Fix NULL deref when a bridge of PCI root bus has no parent

