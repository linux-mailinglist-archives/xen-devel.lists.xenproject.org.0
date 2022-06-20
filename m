Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8FD55119F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352525.579310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BzZ-0002fX-Kg; Mon, 20 Jun 2022 07:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352525.579310; Mon, 20 Jun 2022 07:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BzZ-0002a6-Hk; Mon, 20 Jun 2022 07:38:37 +0000
Received: by outflank-mailman (input) for mailman id 352525;
 Mon, 20 Jun 2022 07:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3BzY-0002ZD-BQ
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0d334d-f06b-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:38:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF3C521B85;
 Mon, 20 Jun 2022 07:38:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91AD1134CA;
 Mon, 20 Jun 2022 07:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nOwwIvgjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:32 +0000
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
X-Inumbo-ID: fc0d334d-f06b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw3aoVhr/WUv7SQwVbjYwYfUJ9Uxj7BJzlvpNqO58Ls=;
	b=R/2lQtS318TyDax/XDzFR0kI36a8m2rfgLF2Lrv4sspyhoEJbmSJe9DwzIy5LJQBRwGpAl
	34tJOPRYQ4mTPmerBXT2tBf/53Vea0FLctnSh8xhYpifZqgY359Q3JB9qvYx97bkaEJMTj
	b8X6CBfwMZPBlDKGvJ3TrvdGAAqIuWo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/8] mini-os: some cleanup patches
Date: Mon, 20 Jun 2022 09:38:12 +0200
Message-Id: <20220620073820.9336-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some cleanups.

No functional change intended, apart from whitespace changes only
minor modifications making code easier to read.

Juergen Gross (8):
  mini-os: drop xenbus directory
  mini-os: apply coding style to xenbus.c
  mini-os: eliminate console/console.h
  mini-os: rename console/xenbus.c to consfront.c
  mini-os: apply coding style to consfront.c
  mini-os: eliminate console directory
  mini-os: apply coding style to console.c
  mini-os: add mini-os-debug[.gz] to .gitignore

 .gitignore                      |   2 +
 Makefile                        |   9 +-
 console/xenbus.c => consfront.c |  99 ++++---
 console.c                       | 415 ++++++++++++++++++++++++++
 console/console.c               | 177 -----------
 console/console.h               |   2 -
 console/xencons_ring.c          | 238 ---------------
 include/console.h               |   1 +
 xenbus/xenbus.c => xenbus.c     | 510 +++++++++++++++++++-------------
 9 files changed, 778 insertions(+), 675 deletions(-)
 rename console/xenbus.c => consfront.c (78%)
 create mode 100644 console.c
 delete mode 100644 console/console.c
 delete mode 100644 console/console.h
 delete mode 100644 console/xencons_ring.c
 rename xenbus/xenbus.c => xenbus.c (71%)

-- 
2.35.3


