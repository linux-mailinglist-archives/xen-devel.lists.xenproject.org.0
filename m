Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F4766DF3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 15:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571465.895378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNM9-0002WM-2q; Fri, 28 Jul 2023 13:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571465.895378; Fri, 28 Jul 2023 13:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNM8-0002Ud-Uv; Fri, 28 Jul 2023 13:18:08 +0000
Received: by outflank-mailman (input) for mailman id 571465;
 Fri, 28 Jul 2023 13:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPNM7-0002UW-Hu
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 13:18:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fcf890c-2d49-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 15:18:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC5C01F8AF;
 Fri, 28 Jul 2023 13:18:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C29E1133F7;
 Fri, 28 Jul 2023 13:18:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iAEHLgzAw2RwBAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 13:18:04 +0000
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
X-Inumbo-ID: 2fcf890c-2d49-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690550284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w6/qEz7nuZR61tfXugJCI1zoAyn3+vTp7j7ZdW0CUF0=;
	b=Zrb8k/4MLbqbE61aIzBIkf0QXmDe5FlHONb0N7cc2QX6LSVpiA0g6iXSnfUTiEdRpDqsgP
	qGenDFA1Y41Wstyjx+1K8HPKcBxM1k8kdUfFVcV+OM0zq5ET+4vGomwCxGWGTVV3sW8Ivo
	ZnHJUjzqzgagGgWu/w7VTSeLXbUgqmk=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.5-rc4
Date: Fri, 28 Jul 2023 15:18:04 +0200
Message-Id: <20230728131804.10538-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5a-rc4-tag

xen: branch for v6.5-rc4

It contains the following patches:

- A fix for a performance problem in QubesOS, adding a way to drain
  the queue of grants experiencing delayed unmaps faster.

- A patch enabling the use of static event channels from user mode,
  which was omitted when introducing supporting static event channels.

- A fix for a problem where Xen related code didn't check properly for
  running in a Xen environment, resulting in a WARN splat.


Thanks.

Juergen

 Documentation/ABI/testing/sysfs-module | 11 ++++++++++
 drivers/xen/events/events_base.c       | 16 +++++---------
 drivers/xen/evtchn.c                   | 35 +++++++++++++++++++++--------
 drivers/xen/grant-table.c              | 40 ++++++++++++++++++++++++----------
 drivers/xen/xenbus/xenbus_probe.c      |  3 +++
 include/uapi/xen/evtchn.h              |  9 ++++++++
 include/xen/events.h                   | 11 +++++++++-
 7 files changed, 93 insertions(+), 32 deletions(-)

Demi Marie Obenour (1):
      xen: speed up grant-table reclaim

Rahul Singh (1):
      xen/evtchn: Introduce new IOCTL to bind static evtchn

Stefano Stabellini (1):
      xenbus: check xen_domain in xenbus_probe_initcall

