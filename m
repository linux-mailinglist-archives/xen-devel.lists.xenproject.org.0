Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9B730B23
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 01:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549254.857700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZWa-0005Ny-Ug; Wed, 14 Jun 2023 23:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549254.857700; Wed, 14 Jun 2023 23:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZWa-0005L4-Rf; Wed, 14 Jun 2023 23:03:36 +0000
Received: by outflank-mailman (input) for mailman id 549254;
 Wed, 14 Jun 2023 23:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9ZWY-0005Ky-PF
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 23:03:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af33913a-0b07-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 01:03:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57FEA6355B;
 Wed, 14 Jun 2023 23:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA0BC433C8;
 Wed, 14 Jun 2023 23:03:30 +0000 (UTC)
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
X-Inumbo-ID: af33913a-0b07-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686783811;
	bh=cCuwpT8Xu8wzNNPOH1vRl/UyjmhgUyE3jKyHcmogiaw=;
	h=From:To:Cc:Subject:Date:From;
	b=Lr0O1UJRp/Go21t2q1m3E/agGYX4Hh6X39hgK1t5cDbmsv50aimVnUU6VTNZzSlN9
	 4kupMDkkeYi7dL7qbX/e13oG5sqkGluSWBt1DQDzX81wk4Jv5CR+UDqyjoMTd4broo
	 FUTlx/Ma5y4eogVfhbgtNZ3RRUqOeVp+luEmixGJdmNRK7uoysfa5L7kbUGBlJ3yCd
	 buq9xpu2JBBwCQb6W59bcMVCQD21ozBNhrnpNBJTLaun4gVFr12WGIw9j8lCKrD/WX
	 Ve5xlVkTnuoL/tU3iZpa8Q/zf3XQnj784x5wd3VYTvWmiABnXZ9l5w+DmBz80Je0ks
	 RR+A1GMfHemVg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] xen/misra: add rules 1.4 and 2.1
Date: Wed, 14 Jun 2023 16:03:28 -0700
Message-Id: <20230614230328.1060282-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 41a727ca98..4179e49ac2 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -90,6 +90,17 @@ existing codebase are work-in-progress.
        behaviour
      -
 
+   * - Rule 1.4
+     - Required
+     - Emergent language features shall not be used
+     - Emergent language features, such as C11 features, should not be
+       confused with similar compiler extensions, which we use.
+
+   * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
+     - Required
+     - A project shall not contain unreachable code
+     -
+
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
      - Advisory
      - A function should not contain unused label declarations
-- 
2.25.1


