Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826A7AF799
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 03:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608617.947229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlIzt-0004Hr-Pf; Wed, 27 Sep 2023 01:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608617.947229; Wed, 27 Sep 2023 01:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlIzt-0004F6-M9; Wed, 27 Sep 2023 01:05:49 +0000
Received: by outflank-mailman (input) for mailman id 608617;
 Wed, 27 Sep 2023 01:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlIzs-0004Ex-2p
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 01:05:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa81651f-5cd1-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 03:05:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 245FDB815A1;
 Wed, 27 Sep 2023 01:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E4C433C8;
 Wed, 27 Sep 2023 01:05:40 +0000 (UTC)
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
X-Inumbo-ID: fa81651f-5cd1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695776741;
	bh=8Zy/S2qAU0clffH7exmIqF2GC5RWNwcxk1KpJiy6hvU=;
	h=From:To:Cc:Subject:Date:From;
	b=g7u4ZgU585mVWv9ND94e7Ce8Ab+Y6AXQI8OmYm9tYaBP3UqoO2u1/FB4huUnEZU8c
	 ZpO2lCCabOJyy/svDmT5HgWaIgrrwfEB3Fmqthv2VYzveStGmdZUTUPVqqfCfIw5UH
	 tFiKGLf04kPOipItwA9T68dVjXhGP5JPe2aZmtv1n2vs3zv6TxKk1FHiC/gL4wQsZw
	 +97ZVDbRfDqwFLuXfxsDKikt94ZwkpTVLlBQBUbdvbUcPSuQ/M2WUb4UCxLyhjR14Q
	 paWzKQBee/ZJOIUVRmCWhwR0ftGHjhMvr+scziVP5RyCBZpDIIH+uogQqPMaVZuU3O
	 nt8tFEGM1G0AA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	george.dunlap@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	roger.pau@citrix.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add rule 11.9
Date: Tue, 26 Sep 2023 18:05:38 -0700
Message-Id: <20230927010538.1778201-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Following up from the MISRA C group discussion, add Rule 11.9 to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Rule 13.1 also discussed but it is already in docs/misra/rules.rst
---
 docs/misra/rules.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8e7d17d242..28dc3a4d66 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -373,6 +373,11 @@ maintainers if you want to suggest a change.
      - A cast shall not remove any const or volatile qualification from the type pointed to by a pointer
      -
 
+   * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
+     - Required
+     - The macro NULL shall be the only permitted form of integer null pointer constant
+     -
+
    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
      - The sizeof operator shall not have an operand which is a function
-- 
2.25.1


