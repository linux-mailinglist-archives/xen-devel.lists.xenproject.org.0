Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82550CA64
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 15:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311596.528851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niFUf-0001dG-DA; Sat, 23 Apr 2022 13:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311596.528851; Sat, 23 Apr 2022 13:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niFUf-0001Zl-7f; Sat, 23 Apr 2022 13:08:09 +0000
Received: by outflank-mailman (input) for mailman id 311596;
 Sat, 23 Apr 2022 13:08:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JeyS=VB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1niFUe-0001Zf-DG
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 13:08:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6adc7278-c306-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 15:08:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBE1F1F388;
 Sat, 23 Apr 2022 13:08:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5EE813AD8;
 Sat, 23 Apr 2022 13:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n3tYKzb6Y2LfdQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 23 Apr 2022 13:08:06 +0000
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
X-Inumbo-ID: 6adc7278-c306-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650719286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xWfm7BakUoeVsVVbr6mNUxRV4SUG2JRam42wgGqtYIc=;
	b=lLi+d9yy5DdQq1TLM/gtOzFoULe+auo+MlB7Eb/Vz/ccN+lu+y3HD2Z51wKWEk1aYNuVUf
	BumjDvrMkoyaSoeefg9FcpWDUueGpX5j4RX1D5iHPWNYKIjD05Af3tQo8xPyLRKERrjtmb
	o+y0XW1Qk1LHhO8GyB6nelsfitmTUgI=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.18-rc4
Date: Sat, 23 Apr 2022 15:08:06 +0200
Message-Id: <20220423130806.15699-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc4-tag

xen: branch for v5.18-rc4

It contains a simple cleanup patch and a refcount fix for Xen on Arm.

Thanks.

Juergen

 arch/arm/xen/enlighten.c | 9 +++++++--
 drivers/xen/gntalloc.c   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

Alaa Mohamed (1):
      xen: Convert kmap() to kmap_local_page()

Miaoqian Lin (1):
      arm/xen: Fix some refcount leaks

