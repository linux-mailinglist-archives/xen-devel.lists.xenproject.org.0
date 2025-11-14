Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A1DC5CE01
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162451.1490117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs32-0002LM-S3; Fri, 14 Nov 2025 11:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162451.1490117; Fri, 14 Nov 2025 11:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs32-0002Jt-O0; Fri, 14 Nov 2025 11:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1162451;
 Fri, 14 Nov 2025 11:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJs32-0001W6-0Z
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:33:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab8c1d2e-c14d-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 12:32:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E85E1F791;
 Fri, 14 Nov 2025 11:32:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 195453EA61;
 Fri, 14 Nov 2025 11:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k4WxBGoTF2nTSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Nov 2025 11:32:58 +0000
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
X-Inumbo-ID: ab8c1d2e-c14d-11f0-980a-7dc792cee155
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 3/4] config: remove unused paths from config/Paths.mk.in
Date: Fri, 14 Nov 2025 12:32:37 +0100
Message-ID: <20251114113238.9279-4-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114113238.9279-1-jgross@suse.com>
References: <20251114113238.9279-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 3E85E1F791
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

Some paths in config/Paths.mk.in are used nowhere, so remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Paths.mk.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/config/Paths.mk.in b/config/Paths.mk.in
index bc42748b7a..668545be2f 100644
--- a/config/Paths.mk.in
+++ b/config/Paths.mk.in
@@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
 datarootdir              := @datarootdir@
 mandir                   := @mandir@
 docdir                   := @docdir@
-dvidir                   := @dvidir@
 htmldir                  := @htmldir@
-pdfdir                   := @pdfdir@
-psdir                    := @psdir@
 includedir               := @includedir@
 localstatedir            := @localstatedir@
 sysconfdir               := @sysconfdir@
@@ -34,8 +31,6 @@ LIBEXEC_LIB              := @LIBEXEC_LIB@
 LIBEXEC_INC              := @LIBEXEC_INC@
 
 SHAREDIR                 := @SHAREDIR@
-MAN1DIR                  := $(mandir)/man1
-MAN8DIR                  := $(mandir)/man8
 
 XEN_RUN_DIR              := @XEN_RUN_DIR@
 XEN_LOG_DIR              := @XEN_LOG_DIR@
-- 
2.51.0


