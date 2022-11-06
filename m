Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421E61E079
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 07:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438403.692504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYhe-0000kb-3Z; Sun, 06 Nov 2022 06:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438403.692504; Sun, 06 Nov 2022 06:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYhd-0000is-TO; Sun, 06 Nov 2022 06:00:17 +0000
Received: by outflank-mailman (input) for mailman id 438403;
 Sun, 06 Nov 2022 06:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orYhO-0008H4-D9
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 06:00:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f597eaa-5d98-11ed-8fd1-01056ac49cbb;
 Sun, 06 Nov 2022 07:00:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5DA1A1F950;
 Sun,  6 Nov 2022 05:59:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 268D8132E7;
 Sun,  6 Nov 2022 05:59:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jppJB19NZ2ODJwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 06 Nov 2022 05:59:59 +0000
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
X-Inumbo-ID: 3f597eaa-5d98-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667714399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hVb6BAyWvekO938dQSC+RJ8T7govWTrExn1p5zb8JU=;
	b=nbO5SOj8oSk1Wc6NC1zqUlHYUboewu/rFh7gRlQxz5QNG6n0JrCA1nTPpK98nAWanzV0ak
	UljRMSzvy6qoaeujTPcpcfsWzvT3ybfV3taCt7SmU52+d02nsrEfbM5XA6tZuw1bXiwGI+
	uBjL8FaLKaMNp4sGw4Sn99D8r037Ct4=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc4
Date: Sun,  6 Nov 2022 06:59:58 +0100
Message-Id: <20221106055958.14139-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc4-tag

xen: branch for v6.1-rc4

It contains only one fix for silencing a smatch warning, and a small
cleanup patch.

Thanks.

Juergen

 arch/x86/xen/pmu.c   |  2 +-
 arch/x86/xen/setup.c | 23 ++++++-----------------
 2 files changed, 7 insertions(+), 18 deletions(-)

Juergen Gross (2):
      x86/xen: silence smatch warning in pmu_msr_chk_emulated()
      x86/xen: simplify sysenter and syscall setup

