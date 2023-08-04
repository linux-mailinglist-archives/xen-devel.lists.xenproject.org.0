Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF576F704
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 03:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576767.903318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjiJ-00052U-Ja; Fri, 04 Aug 2023 01:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576767.903318; Fri, 04 Aug 2023 01:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjiJ-00050s-EU; Fri, 04 Aug 2023 01:34:47 +0000
Received: by outflank-mailman (input) for mailman id 576767;
 Fri, 04 Aug 2023 01:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRjiH-00050V-Rx
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 01:34:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1651faea-3267-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 03:34:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B835B61E6F;
 Fri,  4 Aug 2023 01:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8170C433C8;
 Fri,  4 Aug 2023 01:34:40 +0000 (UTC)
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
X-Inumbo-ID: 1651faea-3267-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691112882;
	bh=49awLqtP5ffAvdFDI7t3AqrjjCHxZIRC4PDakMVh9vg=;
	h=From:To:Cc:Subject:Date:From;
	b=NMlZO6P7fOI7Pm2IYOICmvINhgQllAoNvk8e3l7AbS2lXrYRX/mXD1Hir+ppareGW
	 mz5sQpKqzq+bEJ71wwJzrhA7hVRhPlA4weAVvkiPy6LRokUMREKI3XAxubFMqpK4fd
	 YAy4RSDFJEPlLXSX0INjA218ZcUXD9OV68hnx34odvMjia/pScwmOv62zN01FNV9Sy
	 VpGfT1nZVsOWMWI64wftWCF76Xs3VaLh8nUOm7FlxOCPu6KjimM5mm+gCW3W/2ST1C
	 dmg+YSSSlCkLQM/hn7nlpUoWf2eBVxH1detGH+ZpildMPSzN3EcnnqbW5Be62vGrS4
	 VFAlY1cJtgYUA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add always_inline to C-language-toolchain
Date: Thu,  3 Aug 2023 18:34:38 -0700
Message-Id: <20230804013438.2894725-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/C-language-toolchain.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 785aed1eaf..21b292898c 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -84,6 +84,8 @@ The table columns are as follows:
           see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
        __const__, __inline__, __inline:
           see Section "6.48 Alternate Keywords" of GCC_MANUAL.
+       always_inline:
+          see Section "6.45 An Inline Function is As Fast As a Macro" of GCC_MANUAL.
        typeof, __typeof__:
           see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
        __alignof__, __alignof:
-- 
2.25.1


