Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74705B286F9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083849.1443297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0mZ-0000Fj-5H; Fri, 15 Aug 2025 20:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083849.1443297; Fri, 15 Aug 2025 20:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0mZ-0000Dj-2g; Fri, 15 Aug 2025 20:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1083849;
 Fri, 15 Aug 2025 20:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un0mY-0000Dc-Cu
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:12:10 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c3ae4b4-7a14-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:12:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 545704482B;
 Fri, 15 Aug 2025 20:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34211C4CEEB;
 Fri, 15 Aug 2025 20:12:02 +0000 (UTC)
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
X-Inumbo-ID: 1c3ae4b4-7a14-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755288723;
	bh=sToq7dYo63iihTltLRWdAyJmRpr8xV/Hq79f1DzLLDc=;
	h=Date:From:To:cc:Subject:From;
	b=SeCg42IQiGnFQ5tIRJ0xpR0SavOS2lUxSF0sPDb1Mr553dscZJM0nB7Lpp9Irobmt
	 /Y9fEfsI26xydzimKbU0iYc8fz4L16iXnRz81f1yDq9xVLGDbnNbC1BjFTVfof4p4M
	 b0g2pkS/HPcpEn3tq+ZwCyueBh5gKEMWs3fPlLlUIr9FuPd/z3OZERQoqSkA1BF0lE
	 wbut6jKaFMbAx/J4bILcm9Y7BB2SxcfV8csoaHnQAPLtsk3tN+b0n/ZTmjMwRc+ZR1
	 Smn+sct0kRJOZYEd641nhzwTP84Rhh+4hJclkXOFKOcE8R0eZh9Z7A9C3J1no6aSlC
	 WXM8pF27EpVFA==
Date: Fri, 15 Aug 2025 13:12:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com
Subject: [PATCH] docs/sending-patches: add GitLab pipeline link
Message-ID: <alpine.DEB.2.22.394.2508151310010.923618@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

When submitting patches to xen-devel, add a link to a successful
pipeline run.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 1991932b68..6e1401ea22 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -314,3 +314,23 @@ A patch should always be sent **to** the xen-devel mailing list
 of all touched code areas should get a copy of the mail via **Cc**. In case
 some other recipients are known to be interested in the patch, they can be
 added via **Cc**, too.
+
+## Testing
+
+Xen Project uses a GitLab-based CI infrastructure. You can request to
+have your GitLab account added to the Xen Project organization on GitLab
+(https://gitlab.com/xen-project) by reaching out to THE REST maintainers
+via xen-devel or Matrix. Once your account is added to the Xen Project
+organization on GitLab, also a personal Xen repository will be created
+for you under https://gitlab.com/xen-project/people/<your-username>/xen.
+You will be able to trigger a GitLab testing pipeline with a single git
+push to your personal Xen repository.
+
+When submitting a non-trivial patch or a non-trivial patch series,
+please include a link to the successful GitLab pipeline run on your
+personal branch. This information can be added after the `---` line.
+For example:
+
+    ---
+    Test CI pipeline:
+    https://gitlab.com/xen-project/people/your-username/xen/-/pipelines/1980129839

