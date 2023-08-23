Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B5786380
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 00:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589668.921649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwW2-0006cJ-L6; Wed, 23 Aug 2023 22:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589668.921649; Wed, 23 Aug 2023 22:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwW2-0006Zu-IO; Wed, 23 Aug 2023 22:39:54 +0000
Received: by outflank-mailman (input) for mailman id 589668;
 Wed, 23 Aug 2023 22:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYwW0-0006YH-9k
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 22:39:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f753d59c-4205-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 00:39:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD4E560FAD;
 Wed, 23 Aug 2023 22:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE03C433C7;
 Wed, 23 Aug 2023 22:39:45 +0000 (UTC)
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
X-Inumbo-ID: f753d59c-4205-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692830387;
	bh=E9W2QjNI6ycZiWfJtdywMvws2mKzbaJYzNzgODHfcXE=;
	h=From:To:Cc:Subject:Date:From;
	b=NYQWQOGeRY8HS9AhqMVQKvygbAeS1EjBZgwClaVUYnaP0BF9zRK+g+NN7EdDocQra
	 ZY1exZqUf3tcFmVypqAKJp9Pxx1RmOuaHrFiro4X5RcF3JLr3FPoYxFOiX9bwo3Trx
	 vRnvZITotpZOCNkYi1C3SDrZWvBkbtZjlRwx3ER+pAhHTqPJHf/Dd2neAHzZs3fPwY
	 c27aXLv72l7fVAnuudPN9WQZ0g7+AJl+zNFyNQIYVjSxeygYHExU+C4/aoAibPByWJ
	 MkjIOzPZlcm/W1PEo7ndDRZNpnm0Twlivh8XrndhBEYOfHNSkpwmN+YWCx1Y5sI9YL
	 ucwu6ZmG0nMZg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: add rule 2.1 exceptions
Date: Wed, 23 Aug 2023 15:39:42 -0700
Message-Id: <20230823223942.2981782-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

During the discussions that led to the acceptance of Rule 2.1, we
decided on a few exceptions that were not properly recorded in
rules.rst. Add them now.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Note that safe.json and the codebase are not yet updated with an
appropriate tag for BUG, panic and friends.

v2:
- fix typo in commit message
- use "only referenced from assembly"
- use "Deliberate unreachability caused by"
- add "See safe.json"
- add acked-by (although I also added "See safe.json")
---
 docs/misra/rules.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8f0e4d3f25..4f33ed4ba6 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -106,7 +106,18 @@ maintainers if you want to suggest a change.
    * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
      - Required
      - A project shall not contain unreachable code
-     -
+     - The following are allowed:
+         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
+         - Switch with a controlling value statically determined not to
+           match one or more case statements
+         - Functions that are intended to be referenced only from
+           assembly code (e.g. 'do_trap_fiq')
+         - Deliberate unreachability caused by certain macros/functions,
+           e.g. BUG, assert_failed, panic, etc. See safe.json.
+         - asm-offsets.c, as they are not linked deliberately, because
+           they are used to generate definitions for asm modules
+         - Declarations without initializer are safe, as they are not
+           executed
 
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
      - Advisory
-- 
2.25.1


