Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E7B2B445
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 01:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086263.1444453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo8pu-0007t5-Rv; Mon, 18 Aug 2025 23:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086263.1444453; Mon, 18 Aug 2025 23:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo8pu-0007rc-P3; Mon, 18 Aug 2025 23:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1086263;
 Mon, 18 Aug 2025 23:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEV0=26=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uo8pt-0006Lc-5p
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 23:00:17 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0372b7-7c87-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 01:00:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0418600AE;
 Mon, 18 Aug 2025 23:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D666C4CEEB;
 Mon, 18 Aug 2025 23:00:12 +0000 (UTC)
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
X-Inumbo-ID: 1a0372b7-7c87-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558013;
	bh=3CXg2tE4KKA0wDurcBj5cTe6r8vOH8zOapjVdFmlqhY=;
	h=Date:From:To:cc:Subject:From;
	b=ilOjzXIXe/on/iUATydkVzmN3fDM5sE38/KeB15dnsYdSo6yQj4BJ7kBRj+NNE1Lo
	 oj8x/owzgE0dlYXWcojNHdgiRi7AMpU5lLPt+HNRWE96f0jnpL2wVJDIhVjiY4vFZ2
	 jZudq/5CJuuAmNMqWHGlATMSi4pMaz+EMST7sRTt1cT96o0CTp4tGEdRV7fSrDnVUA
	 ewWB3DUzplEpAxlqmXSR4UWwussJ+5bu5EWcc2tpsvbybE80m16Q7Uw6dytRcaUw20
	 i17j1R8ur8UeDcFV7EMyQkSd+5ICEyKwcWtIdQRJ/sCC4WAz1QoRhkslEMhjw726KZ
	 SEmye3LDPDD4g==
Date: Mon, 18 Aug 2025 16:00:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com
Subject: [PATCH v2] docs/sending-patches: add GitLab pipeline link
Message-ID: <alpine.DEB.2.22.394.2508181558550.923618@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

When submitting patches to xen-devel, add a link to a successful
pipeline run.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- address Julien's comments

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 1991932b68..13bb3bf47a 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -314,3 +314,38 @@ A patch should always be sent **to** the xen-devel mailing list
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
+When submitting a patch or patch series, please include a link to the
+successful GitLab pipeline run on your personal branch. The branch
+should be based on a recent version of the "master" branch, ideally not
+older than two days.
+
+This information can be added after the `---` line.  For example:
+
+    ---
+    Test CI pipeline:
+    https://gitlab.com/xen-project/people/your-username/xen/-/pipelines/1980129839
+
+While it is technically possible to implement an automated system that
+picks up patches and patch series from xen-devel and runs the GitLab
+pipeline on them automatically, doing so would consume a significant
+amount of resources on the testing infrastructure. There is no reliable
+way to automatically determine whether a patch is close to being
+committed or still undergoing substantial review. By having users submit
+the link to the pipeline manually, we can manage testing resources much
+more efficiently.
+
+When submitting new features, please also consider whether you can add a
+GitLab test for the feature to ensure it continues to work correctly in
+the future.

