Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0D7DA7E0
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 17:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624766.973399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwleu-0008E6-6l; Sat, 28 Oct 2023 15:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624766.973399; Sat, 28 Oct 2023 15:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwleu-0008CF-3q; Sat, 28 Oct 2023 15:55:32 +0000
Received: by outflank-mailman (input) for mailman id 624766;
 Sat, 28 Oct 2023 15:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vYyO=GK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qwles-0008C9-6R
 for xen-devel@lists.xenproject.org; Sat, 28 Oct 2023 15:55:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6926c80f-75aa-11ee-98d6-6d05b1d4d9a1;
 Sat, 28 Oct 2023 17:55:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE86921D6F;
 Sat, 28 Oct 2023 15:55:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81222138F8;
 Sat, 28 Oct 2023 15:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id krgQHu0uPWXCJwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 28 Oct 2023 15:55:25 +0000
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
X-Inumbo-ID: 6926c80f-75aa-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698508525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dGrk1kgDIUUWjtfSnQ+C6LXr6l7ET+4+pAVQ44VHhtE=;
	b=ViN190DzdFdCqnn/9/LXvKVD9+pLQ/qwts27v0yZ1th3p5cYApaXylS+yaUvJfJIefggDM
	JDN2CZA0l9cODgsnaMQgIQkg4O+Y2bbceSse3uKqWfnA7I03FBTNhoDtInOSDSaPov+lgk
	CLVJWgD/TM4vZNwDctXmDJ+D28wt3DM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.7-rc1
Date: Sat, 28 Oct 2023 17:55:24 +0200
Message-Id: <20231028155524.19315-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.68
X-Spamd-Result: default: False [-1.68 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(1.42)[85.23%];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7-rc1-tag

xen: branch for v6.7-rc1

It contains the following patches:

- 2 small cleanup patches

- a fix for PCI passthrough under Xen

- a 4 patch series speeding up virtio under Xen with user space backends


Thanks.

Juergen

 drivers/xen/Kconfig                             |   8 +-
 drivers/xen/events/events_base.c                |   3 +-
 drivers/xen/evtchn.c                            |   2 +-
 drivers/xen/privcmd.c                           | 407 +++++++++++++++++++++++-
 drivers/xen/xen-pciback/conf_space.c            |  19 +-
 drivers/xen/xen-pciback/conf_space_capability.c |   8 +-
 drivers/xen/xen-pciback/conf_space_header.c     |  21 +-
 drivers/xen/xenbus/xenbus_dev_frontend.c        |   4 +-
 drivers/xen/xenbus/xenbus_probe.c               |   2 +-
 include/uapi/xen/privcmd.h                      |  22 +-
 include/xen/interface/hvm/ioreq.h               |  51 +++
 11 files changed, 508 insertions(+), 39 deletions(-)

Gustavo A. R. Silva (1):
      xen/xenbus: Add __counted_by for struct read_buffer and use struct_size()

Juergen Gross (1):
      xenbus: fix error exit in xenbus_init()

Marek Marczykowski-Górecki (1):
      xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled

Viresh Kumar (4):
      xen: Make struct privcmd_irqfd's layout architecture independent
      xen: irqfd: Use _IOW instead of the internal _IOC() macro
      xen: evtchn: Allow shared registration of IRQ handers
      xen: privcmd: Add support for ioeventfd

