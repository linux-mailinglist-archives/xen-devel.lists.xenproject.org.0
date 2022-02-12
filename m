Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B514B3432
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 11:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270759.465078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIpab-00087o-SC; Sat, 12 Feb 2022 10:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270759.465078; Sat, 12 Feb 2022 10:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIpab-00085z-OP; Sat, 12 Feb 2022 10:25:13 +0000
Received: by outflank-mailman (input) for mailman id 270759;
 Sat, 12 Feb 2022 10:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nIpaa-00085t-Lf
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 10:25:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e5c6d96-8bee-11ec-8eb8-a37418f5ba1a;
 Sat, 12 Feb 2022 11:25:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7BA01F3AB;
 Sat, 12 Feb 2022 10:25:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99727133A6;
 Sat, 12 Feb 2022 10:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VLYyJAWLB2IUJwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 12 Feb 2022 10:25:09 +0000
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
X-Inumbo-ID: 0e5c6d96-8bee-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644661509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5yXRQYPz7tyCPh12Y6Rub4FEyQM5xqaM15UqmQ0cHI0=;
	b=hK0dVY9gMUYw5lm60eoc/yhhP8D82RZIj0sUbLJvcZM0BVyEIomMKz9HLqR75ORkZnMjZg
	Z/p4dfWEuxqFeT/MkfK1Z+PNmpLkaRgZmBCd2chTSVshmMJXI8vQJMzlcFvzoWtpQoWfPI
	wfeX/xpC7jJcU4NB/IOcjxqsqWhY7mQ=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.17-rc4
Date: Sat, 12 Feb 2022 11:25:09 +0100
Message-Id: <20220212102509.24629-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc4-tag

xen: branch for v5.17-rc4

It contains the following patches:

- 2 small cleanups

- Another fix for addressing the EFI framebuffer above 4GB when running
  as Xen dom0

- A patch for letting Xen guests use reserved bits in MSI- and IO-APIC-
  registers for extended APIC-IDs the same way KVM guests are doing it
  already.

Thanks.

Juergen

 arch/x86/include/asm/xen/cpuid.h |  7 +++++++
 arch/x86/xen/enlighten_hvm.c     |  9 +++++++--
 arch/x86/xen/vga.c               | 16 ++++++++--------
 drivers/xen/pci.c                |  2 +-
 4 files changed, 23 insertions(+), 11 deletions(-)

Cai Huoqing (1):
      xen/pci: Make use of the helper macro LIST_HEAD()

Jan Beulich (1):
      xen/x86: obtain full video frame buffer address for Dom0 also under EFI

Jiapeng Chong (1):
      xen/x2apic: Fix inconsistent indenting

Roger Pau Monne (1):
      xen/x86: detect support for extended destination ID

