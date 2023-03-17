Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B1F6BE165
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 07:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510906.789472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd3lO-0004q3-J1; Fri, 17 Mar 2023 06:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510906.789472; Fri, 17 Mar 2023 06:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd3lO-0004oK-Fw; Fri, 17 Mar 2023 06:40:30 +0000
Received: by outflank-mailman (input) for mailman id 510906;
 Fri, 17 Mar 2023 06:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pd3lN-0004oC-70
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 06:40:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b4f326-c48e-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 07:40:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12F561FDD8;
 Fri, 17 Mar 2023 06:40:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF10113428;
 Fri, 17 Mar 2023 06:40:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wksJNVcLFGQhfwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 06:40:23 +0000
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
X-Inumbo-ID: 98b4f326-c48e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679035224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oXhQ00jPveWGt6xvfgqkrGOY8fgVyIZGH7STWyheHWY=;
	b=E1t/Sg7Ji8i0b2pYewTrDjtoAbUewcg/C5VkVXR9piZ0rjNgQLg9gzt99o1W0Vosl/rP6T
	8Ndj7sJyl7xhgjhtsCXV+2rRxks2BF9P9A8LwWnKKnMXcPVvnULAUrDpXixWjmLC9bS7ls
	GgZ5NxXpUshiyN+P/oUavsDn/ONtHsY=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.3-rc3
Date: Fri, 17 Mar 2023 07:40:23 +0100
Message-Id: <20230317064023.1229-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc3-tag

xen: branch for v6.3-rc3

It contains:

- a small cleanup series for xen time handling
- a patch for enabling the VGA console in a Xen PVH dom0
- a small cleanup patch for the xenfs driver

Thanks.

Juergen

 arch/x86/include/asm/xen/cpuid.h | 22 ++++++++++++++++++----
 arch/x86/xen/Makefile            |  2 +-
 arch/x86/xen/enlighten_pv.c      |  3 ++-
 arch/x86/xen/enlighten_pvh.c     | 13 +++++++++++++
 arch/x86/xen/time.c              |  7 ++-----
 arch/x86/xen/vga.c               |  5 ++---
 arch/x86/xen/xen-ops.h           |  7 ++++---
 drivers/xen/xenfs/xensyms.c      | 10 +++++-----
 include/xen/interface/platform.h |  3 +++
 9 files changed, 50 insertions(+), 22 deletions(-)

Jan Beulich (1):
      x86/PVH: obtain VGA console info in Dom0

Krister Johansen (2):
      xen: update arch/x86/include/asm/xen/cpuid.h
      x86/xen/time: cleanup xen_tsc_safe_clocksource

Yu Zhe (1):
      xen: remove unnecessary (void*) conversions

