Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A499294E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811871.1224584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl58-0003mK-L4; Mon, 07 Oct 2024 10:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811871.1224584; Mon, 07 Oct 2024 10:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl58-0003j3-HN; Mon, 07 Oct 2024 10:35:14 +0000
Received: by outflank-mailman (input) for mailman id 811871;
 Mon, 07 Oct 2024 10:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sxl56-0003GC-Gi
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:35:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d42bf279-8497-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 12:35:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89CA121BF8;
 Mon,  7 Oct 2024 10:35:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 596C313786;
 Mon,  7 Oct 2024 10:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1lMhFF65A2eFKgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 07 Oct 2024 10:35:10 +0000
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
X-Inumbo-ID: d42bf279-8497-11ef-a0bb-8be0dac302b0
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 2/2] drop CONFIG_XC support
Date: Mon,  7 Oct 2024 12:34:56 +0200
Message-ID: <20241007103456.14946-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007103456.14946-1-jgross@suse.com>
References: <20241007103456.14946-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 89CA121BF8
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

CONFIG_XC is no longer needed with individual CONFIG_LIBXEN support.

Remove it, while disabling the CONFIG_LIBXEN items by default.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/Config.mk b/Config.mk
index d0fbacac..f59a0cf4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -193,6 +193,15 @@ CONFIG-n += CONFIG_9PFRONT
 CONFIG-n += CONFIG_TPM_TIS
 CONFIG-n += CONFIG_TPMBACK
 CONFIG-n += CONFIG_BALLOON
+CONFIG-n += CONFIG_LIBXENCALL
+CONFIG-n += CONFIG_LIBXENCTRL
+CONFIG-n += CONFIG_LIBXENDEVICEMODEL
+CONFIG-n += CONFIG_LIBXENEVTCHN
+CONFIG-n += CONFIG_LIBXENFOREIGNMEMORY
+CONFIG-n += CONFIG_LIBXENGNTTAB
+CONFIG-n += CONFIG_LIBXENGUEST
+CONFIG-n += CONFIG_LIBXENTOOLCORE
+CONFIG-n += CONFIG_LIBXENTOOLLOG
 # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
 # console apart of standard dom0 handled console.
 CONFIG-n += CONFIG_USE_XEN_CONSOLE
@@ -201,8 +210,6 @@ CONFIG-y += CONFIG_PARAVIRT
 else
 CONFIG-n += CONFIG_PARAVIRT
 endif
-# Support legacy CONFIG_XC value
-CONFIG_XC ?= $(libc)
 
 CONFIG-$(lwip) += CONFIG_LWIP
 
@@ -212,25 +219,6 @@ $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
 CONFIG-x += CONFIG_LIBXS
 CONFIG_LIBXS ?= $(CONFIG_XENBUS)
 
-CONFIG-x += CONFIG_LIBXENCALL
-CONFIG-x += CONFIG_LIBXENCTRL
-CONFIG-x += CONFIG_LIBXENDEVICEMODEL
-CONFIG-x += CONFIG_LIBXENEVTCHN
-CONFIG-x += CONFIG_LIBXENFOREIGNMEMORY
-CONFIG-x += CONFIG_LIBXENGNTTAB
-CONFIG-x += CONFIG_LIBXENGUEST
-CONFIG-x += CONFIG_LIBXENTOOLCORE
-CONFIG-x += CONFIG_LIBXENTOOLLOG
-CONFIG_LIBXENCALL ?= $(CONFIG_XC)
-CONFIG_LIBXENCTRL ?= $(CONFIG_XC)
-CONFIG_LIBXENDEVICEMODEL ?= $(CONFIG_XC)
-CONFIG_LIBXENEVTCHN ?= $(CONFIG_XC)
-CONFIG_LIBXENFOREIGNMEMORY ?= $(CONFIG_XC)
-CONFIG_LIBXENGNTTAB ?= $(CONFIG_XC)
-CONFIG_LIBXENGUEST ?= $(CONFIG_XC)
-CONFIG_LIBXENTOOLCORE ?= $(CONFIG_XC)
-CONFIG_LIBXENTOOLLOG ?= $(CONFIG_XC)
-
 CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
 
 # Export config items as compiler directives
-- 
2.43.0


