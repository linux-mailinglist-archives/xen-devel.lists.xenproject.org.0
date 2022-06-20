Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA295511A7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352530.579341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzc-0003D0-4G; Mon, 20 Jun 2022 07:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352530.579341; Mon, 20 Jun 2022 07:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzb-00032O-Ud; Mon, 20 Jun 2022 07:38:39 +0000
Received: by outflank-mailman (input) for mailman id 352530;
 Mon, 20 Jun 2022 07:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bza-0002ZE-K0
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd8397c4-f06b-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:38:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 985DB21BD0;
 Mon, 20 Jun 2022 07:38:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6206E13A79;
 Mon, 20 Jun 2022 07:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EFuXFvojsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:34 +0000
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
X-Inumbo-ID: fd8397c4-f06b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g253R54BCUXErJG0A5bqZZ4ZPguYj/1UWM+5iFTL2Q4=;
	b=NGnw937lMT/LOym5c4FxAJvsiKqbPHFdtXnXWnw+KPZQ2CZdE9erEzVRNC9go0JBFdw03p
	8vE7N10ooM3hfysMkQhuqM6HfgEQpdZa1qMynsfHUvdUYEFL6tdgtW5f0TIK0r9ltl89H3
	Bz9JR4qLhGl9SYSPaB8KTneMQ/jTnSI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 8/8] mini-os: add mini-os-debug[.gz] to .gitignore
Date: Mon, 20 Jun 2022 09:38:20 +0200
Message-Id: <20220620073820.9336-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mini-os-debug and mini-os-debug.gz are created when building Mini-OS,
add them to .gitignore.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index d57c2bdd..abef46b2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -14,3 +14,5 @@ include/list.h
 mini-os
 mini-os.gz
 minios-config.mk
+mini-os-debug
+mini-os-debug.gz
-- 
2.35.3


