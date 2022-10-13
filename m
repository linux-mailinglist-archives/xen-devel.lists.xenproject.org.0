Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635E5FD1F3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 02:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421539.666958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimWy-00075f-8c; Thu, 13 Oct 2022 00:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421539.666958; Thu, 13 Oct 2022 00:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimWy-000715-1C; Thu, 13 Oct 2022 00:57:00 +0000
Received: by outflank-mailman (input) for mailman id 421539;
 Thu, 13 Oct 2022 00:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8Z/=2O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oimWv-0006e6-Ph
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 00:56:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eecd9407-4a91-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 02:56:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21C0E61683;
 Thu, 13 Oct 2022 00:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD5AC433C1;
 Thu, 13 Oct 2022 00:56:53 +0000 (UTC)
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
X-Inumbo-ID: eecd9407-4a91-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665622614;
	bh=Pn0SMEjA4kouOtSJc3+2PqkihW2Mj/UTC9QmDMLz6gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elermjqtwshMiAiqQdTeN7C6vWj/JfY8s+FOi8lTL8oreIpSJJ6CWaL+C/88VKIWT
	 tU7MsM6CUi973ExvRLUDUdgg914x5DFtWMMKc8csbiGNwzfhpvOpkGkWA7Zd2ajNnn
	 EJanYqVd/0i0+ijJNOwT+CoBOQGRm3UKBrMmwI9bccg3zYLyWKEYvIAYM1rvs3m6P+
	 HPNRSvgif2hUrY9LwKHwwD1gDbt8MT5czsh6U3TW2YHzRlzDNs8NWC6pV7ZompCX2V
	 f1IV3/xK6B/aQklD+wowTz8i8S6cJyCPm5ALHmYKlRnlv/78Lh816STu43zYV41KEh
	 NgoNDXwBl0M8g==
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
Subject: [PATCH v4 3/4] Add SPDX to CODING_STYLE
Date: Wed, 12 Oct 2022 17:56:47 -0700
Message-Id: <20221013005648.1444144-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2210121752580.3690179@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2210121752580.3690179@ubuntu-linux-20-04-desktop>
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


