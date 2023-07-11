Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3774F8F9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 22:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561893.878466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJrv-00043r-6U; Tue, 11 Jul 2023 20:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561893.878466; Tue, 11 Jul 2023 20:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJrv-00041F-2u; Tue, 11 Jul 2023 20:21:55 +0000
Received: by outflank-mailman (input) for mailman id 561893;
 Tue, 11 Jul 2023 20:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y2eC=C5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJJrs-000419-SH
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 20:21:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 918493c9-2028-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 22:21:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BC54615DD;
 Tue, 11 Jul 2023 20:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B41FC433C8;
 Tue, 11 Jul 2023 20:21:48 +0000 (UTC)
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
X-Inumbo-ID: 918493c9-2028-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689106909;
	bh=s5cOSymdjcLQwXjedQSQ4b1V0Qqbv9IUkI9Uizo+ch8=;
	h=From:To:Cc:Subject:Date:From;
	b=nDwxLhL46DE0Ve3L1akBgukj4QROHHZjTLpma/qddHwhqCHxerYWCuFpoSpF2D1+/
	 maKToYmTehb+RTvOlynBSvJgRnNhJ7LbPMD6usjWLvNqgt8aAixDYE/n8gOJ/bhrmd
	 r71wAdACvizaBFBXSZ3q4cHXOY23tyf2ZuWE9VWNonXjtoKspQ/g4j+TwLWIhmdTz2
	 FhVY/1uSQWXeqc34qSa6+bJUtxWinSE+W/6SP7TI5KmniT/u8kynghc421NqfVvb9a
	 goOFrCjqExgL0f0kixNAA1iKce2dxF9bJ49WTKbN1iFql8XAMqsyrxlPKmnlQ3uXK/
	 Nq7h90O9bmAmg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add Rule 9.3
Date: Tue, 11 Jul 2023 13:21:45 -0700
Message-Id: <20230711202145.2334563-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Specify that {} is allowed for zero-initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 72aa986bce..29a777938a 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -284,6 +284,11 @@ maintainers if you want to suggest a change.
        braces
      -
 
+   * - `Rule 9.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_03.c>`_
+     - Required
+     - Arrays shall not be partially initialized
+     - {} is also allowed to specify explicit zero-initialization
+
    * - `Rule 9.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_04.c>`_
      - Required
      - An element of an object shall not be initialized more than once
-- 
2.25.1


