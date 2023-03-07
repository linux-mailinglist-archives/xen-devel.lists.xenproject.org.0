Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A099B6AD772
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 07:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507207.780482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQsC-0003da-70; Tue, 07 Mar 2023 06:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507207.780482; Tue, 07 Mar 2023 06:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQsC-0003bN-2l; Tue, 07 Mar 2023 06:32:32 +0000
Received: by outflank-mailman (input) for mailman id 507207;
 Tue, 07 Mar 2023 06:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZQsA-0003aF-Kh
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 06:32:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5179822-bcb1-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 07:32:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C56E71FE0C;
 Tue,  7 Mar 2023 06:32:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 890A013440;
 Tue,  7 Mar 2023 06:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3N0nIHzaBmS+WQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 06:32:28 +0000
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
X-Inumbo-ID: d5179822-bcb1-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678170748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQeQBjgXognDwpHsaZ/AdZba+6tFL2v6oNaCRwJ1TnI=;
	b=D8+8v5bkh08q2MmzoZcAi3hf8xMrj6fm5p9kVA2yYHMDS7xSLVjAFD5NN7OIH++y03KK31
	eDDc05NFACfU5fXQzHYwjGOZXgiktwOfWsiMJaoXWQeJ4jbUuaI9/78VCtIIWw4wxJ+DTZ
	kEKImUQgJXJAObpnaUrfrlg+C1R56qg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Date: Tue,  7 Mar 2023 07:32:14 +0100
Message-Id: <20230307063214.30569-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230307063214.30569-1-jgross@suse.com>
References: <20230307063214.30569-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the help text of the CONFIG_DEBUG_INFO option to be a little
bit more specific.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/Kconfig.debug | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index a2691f4239..20c73ee55a 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -15,8 +15,11 @@ config DEBUG_INFO
 	bool "Compile Xen with debug info"
 	default DEBUG
 	---help---
-	  If you say Y here the resulting Xen will include debugging info
-	  resulting in a larger binary image.
+	  Say Y here if you want to build Xen with debug information. This
+	  information is needed e.g. for doing crash dump analysis of the
+	  hypervisor via the "crash" tool.
+	  Saying Y will increase the size of xen-syms and the built EFI
+	  binary.
 
 if DEBUG || EXPERT
 
-- 
2.35.3


