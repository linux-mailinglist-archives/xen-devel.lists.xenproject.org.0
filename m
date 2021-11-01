Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C59441D4F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219248.380033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ76-0002pG-8A; Mon, 01 Nov 2021 15:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219248.380033; Mon, 01 Nov 2021 15:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ75-0002hS-Sw; Mon, 01 Nov 2021 15:20:43 +0000
Received: by outflank-mailman (input) for mailman id 219248;
 Mon, 01 Nov 2021 15:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ73-0008DB-Na
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:41 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a74d3e6-3b27-11ec-8548-12813bfff9fa;
 Mon, 01 Nov 2021 15:20:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F040D2195E;
 Mon,  1 Nov 2021 15:20:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFA2D13A4A;
 Mon,  1 Nov 2021 15:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNKQKbQFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:20 +0000
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
X-Inumbo-ID: 3a74d3e6-3b27-11ec-8548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fOAnqYxsnad8GqJq5hXRodGMqLBqJqDZsiqhfOtnv4=;
	b=dmVJvcHjlAFox+w7U7UJhXGRcyhbfhJlw/WY/mMMQbBGHd+pbF34GP7lgZTC+6Dm/xaJtD
	1KdNN7OW3wM67qY3FlM1OxD9yQcRuHrcoMjJHQHjQ3BrgBG0hrqdoJViH5vpzpI08FE24r
	TA47+bjDizjHp3k+DBHB6NJsodC0cik=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/15] add .gitignore entries for *.[is] below xen
Date: Mon,  1 Nov 2021 16:20:06 +0100
Message-Id: <20211101152015.28488-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of listing each single file with .s or .i suffixes in
.gitignore use pattern based entries. Restrict those to the xen
directory as we have e.g. tools/libs/stat/bindings/swig/xenstat.i in
our tree.

Below xen the pattern based entries are fine, as we have pattern rules
for creating *.s and *.i files in xen/Rules.mk.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 .gitignore | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8ebb51b6c5..9513506dd9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -301,12 +301,13 @@ tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
 tools/xentrace/xenctx
 tools/xentrace/xentrace
+xen/**/*.i
+xen/**/*.s
 xen/.banner
 xen/.config
 xen/.config.old
 xen/.xen.elf32
 xen/System.map
-xen/arch/x86/asm-macros.i
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
 xen/arch/x86/boot/reloc.S
@@ -322,7 +323,6 @@ xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
-xen/asm-offsets.s
 xen/common/config_data.S
 xen/common/config.gz
 xen/include/headers*.chk
-- 
2.26.2


