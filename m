Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310A9784DC7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 02:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588835.920453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbgJ-0007Jd-Cd; Wed, 23 Aug 2023 00:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588835.920453; Wed, 23 Aug 2023 00:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbgJ-0007Hy-9C; Wed, 23 Aug 2023 00:25:07 +0000
Received: by outflank-mailman (input) for mailman id 588835;
 Wed, 23 Aug 2023 00:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYbgH-0007Hd-Hy
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 00:25:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b6b78c-414b-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 02:25:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDC70621B6;
 Wed, 23 Aug 2023 00:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A51C433C9;
 Wed, 23 Aug 2023 00:25:00 +0000 (UTC)
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
X-Inumbo-ID: 80b6b78c-414b-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692750302;
	bh=0fnDgd9VqxOhuS1+2vFxp51JlrQK6RbDCPZVAh1WEwE=;
	h=From:To:Cc:Subject:Date:From;
	b=EfY29OCnM0trBR+PwPXWgCjBxczMgTxavenZipD4kGdt4omD3F8erEFhhHdG8y+oQ
	 e/MWUy2URAIuAl+54kBOAtRJwd4MsipfjGMkcU0K/+Kvy2l6LA5cBXSCIjXW0NBQ+z
	 5WGGl3ZRZCDXopTLsBSawqXz6hG8xioEjIS/J8V4oXX2CSGq+lcnAHGCwHtCBT4Y+4
	 rbzydXECI7WCxyWFQjgNbeuTria4fHR2vC6pIKgdLnvja4TeiI7/2tbRUF02OlT52p
	 Z3+bwmzc2h8ry7kMtOZ+S6nhi43QYuo4O3g1ZlFA0KZv7uCkasWe+z7Tm4KCSwUYrc
	 vMLYnkfKyxX6Q==
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
Subject: [PATCH] docs/misra: add rule 2.1 exceptions
Date: Tue, 22 Aug 2023 17:24:58 -0700
Message-Id: <20230823002458.2738365-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

During the discussions that led to the acceptable of Rule 2.1, we
decided on a few exceptions that were not properly recorded in
rules.rst. Add them now.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b6d87e076b..8f38227994 100644
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
+         - Functions that are intended to be never referenced from C
+           code (e.g. 'do_trap_fiq')
+         - Unreachability caused by the certain macros/functions is
+           deliberate, e.g. BUG, assert_failed, panic, etc.
+         - asm-offsets.c, as they are not linked deliberately, because
+           they are used to generate definitions for asm modules
+         - declarations without initializer are safe, as they are not
+           executed
 
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
      - Advisory
-- 
2.25.1


