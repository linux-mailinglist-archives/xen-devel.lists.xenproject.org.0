Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC827992A0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 01:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598267.932922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qekVj-0004fK-FE; Fri, 08 Sep 2023 23:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598267.932922; Fri, 08 Sep 2023 23:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qekVj-0004cM-C3; Fri, 08 Sep 2023 23:03:35 +0000
Received: by outflank-mailman (input) for mailman id 598267;
 Fri, 08 Sep 2023 23:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qekVh-0004ax-P4
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 23:03:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd23825-4e9b-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 01:03:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9F51BCE1CE7;
 Fri,  8 Sep 2023 23:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954D5C433C9;
 Fri,  8 Sep 2023 23:03:21 +0000 (UTC)
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
X-Inumbo-ID: ecd23825-4e9b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694214203;
	bh=lgwU7Z5792uj1BjLTLhQ5oE1XrVQV3QOd015unveqhA=;
	h=From:To:Cc:Subject:Date:From;
	b=F4GKMNqhKeHksxzsBxUtMc1FbMDT19L1KidBmufoXrxohcF9/YdVFvIYz6Kh6Rza4
	 bLqI8ynFY59mUWpdu1YnoaaD5s+mkwUFg389NiEIWbtx6QF5Zz8nFgbku4nLWbqfsV
	 +DcOfOw9dzw1DdkJbuoOn2gvRQHqtIbQMG1bfD11YGKgtamHdwI0ejQP25GgQMJ9AV
	 /A3FQyomM68LZaXjC5P+0aQG8LDBJgmjO00AD43U3mMa3QUUizCWqHJyqVsx2aZlwk
	 hEW8vntMjKP5hxUWoj3kMqf2XzZop4UvuTQsyqQ96qnvfYl2/F2eztCKaJqiBBNqz4
	 tukLuRkKO/rdw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3] docs/misra: add rule 2.1 exceptions
Date: Fri,  8 Sep 2023 16:03:18 -0700
Message-Id: <20230908230318.1719290-1-sstabellini@kernel.org>
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
Nicola, does this work with ECLAIR?

I am referring to the locations of the SAF-2-safe tag on top of
call_psci_system_off, BUG, etc.

Changes in v3:
- added SAF-2-safe to safe.json
- added a few SAF-2-safe examples
---
 docs/misra/rules.rst    | 13 ++++++++++++-
 docs/misra/safe.json    |  8 ++++++++
 xen/arch/arm/psci.c     |  1 +
 xen/arch/x86/shutdown.c |  1 +
 xen/include/xen/bug.h   |  2 ++
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 34916e266a..82de4c645d 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
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
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 39c5c056c7..fc96a99fd5 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -20,6 +20,14 @@
         },
         {
             "id": "SAF-2-safe",
+            "analyser": {
+                "eclair": "MC3R1.R2.1"
+            },
+            "name": "Rule 2.1: deliberate unreachability",
+            "text": "Macro or function designed to be unreachable."
+        },
+        {
+            "id": "SAF-3-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1..2a8527cacc 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
     }
 }
 
+/* SAF-2-safe */
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14..47e0f59024 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -118,6 +118,7 @@ static inline void kb_wait(void)
             break;
 }
 
+/* SAF-2-safe */
 static void noreturn cf_check __machine_halt(void *unused)
 {
     local_irq_disable();
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index e8a4eea71a..d47c54f034 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -117,6 +117,7 @@ struct bug_frame {
 #endif
 
 #ifndef BUG
+/* SAF-2-safe */
 #define BUG() do {                                              \
     BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
     unreachable();                                              \
@@ -124,6 +125,7 @@ struct bug_frame {
 #endif
 
 #ifndef assert_failed
+/* SAF-2-safe */
 #define assert_failed(msg) do {                                 \
     BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
     unreachable();                                              \
-- 
2.25.1


