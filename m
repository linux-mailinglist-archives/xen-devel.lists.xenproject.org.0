Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B15F8175
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 02:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418361.663147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxVR-0003V0-Tg; Sat, 08 Oct 2022 00:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418361.663147; Sat, 08 Oct 2022 00:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogxVR-0003Ri-Qq; Sat, 08 Oct 2022 00:15:53 +0000
Received: by outflank-mailman (input) for mailman id 418361;
 Sat, 08 Oct 2022 00:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrwE=2J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogxVQ-00035E-BR
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 00:15:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e1bdebb-469e-11ed-964a-05401a9f4f97;
 Sat, 08 Oct 2022 02:15:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42A1CB823E4;
 Sat,  8 Oct 2022 00:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A33C433D6;
 Sat,  8 Oct 2022 00:15:48 +0000 (UTC)
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
X-Inumbo-ID: 5e1bdebb-469e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665188150;
	bh=Pn0SMEjA4kouOtSJc3+2PqkihW2Mj/UTC9QmDMLz6gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PsrT/GWgiKv+EXj2535+PgO3VFTa3Cf2Hzqod7FlQsrbHKdGBuGbYAD7HFxxsivHz
	 20Zo5je+3K57QOP0L/5N6FWeAKnlQkDFaXg1on9rsGtL4O5UTPpR8zO9WVxFCByD8r
	 33TQLTAPShx6Qyuaq56JrfmF/d/NFPH/12cBVjmvmHrQFHjxh83he2wzv0yU88Nk3B
	 JLsIPIk09WL673A1veSyMyPJsClEvRQvHMAkR4p7lNN9SyXwwbnIkwKe8o/2SAfRIb
	 ltOODlzCWLH9MdmPP+4Apws2lxsqeUNaFaPu9K6fIaSxAXLxminne3YreuZ0GyXxxB
	 SaQLDBwjTROeQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	wl@xen.org,
	jbeulich@suse.com,
	george.dunlap@citrix.com,
	andrew.cooper3@citrix.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	roger.pau@citrix.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 1/4] Add SPDX to CODING_STYLE
Date: Fri,  7 Oct 2022 17:15:41 -0700
Message-Id: <20221008001544.78302-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 CODING_STYLE | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 3386ee1d90..5faf274b3a 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
 coding style is fairly common). In general you should copy the style
 of the surrounding code. If you are unsure please ask.
 
+SPDX
+----
+
+New files should start with a single-line SPDX comment to express the
+license, e.g.:
+
+/* SPDX-License-Identifier: GPL-2.0 */
+
+See LICENSES/ for a list of licenses and SPDX tags currently used.
+
 MISRA C
 -------
 
-- 
2.25.1


