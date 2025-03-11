Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB098A5B9C5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907253.1314512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru2Z-0006WF-3h; Tue, 11 Mar 2025 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907253.1314512; Tue, 11 Mar 2025 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru2Z-0006UK-0y; Tue, 11 Mar 2025 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 907253;
 Tue, 11 Mar 2025 07:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lFlb=V6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tru2X-0006UE-QS
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:28:37 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f84c9dc-fe4a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:28:32 +0100 (CET)
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
X-Inumbo-ID: 6f84c9dc-fe4a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741678111; x=1741937311;
	bh=JmhzxO9rdDUsXnDJqFL064KibvhgPZWJo7yJkXf/GzI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=bUzMP04Y9D0p9kY8NfVr1uksrMaeCNScS1hGa7ikkDaLClYBFXgaBiSZL4bSKeG6h
	 iJy71TsrgF5ibf4gg3FqeBom5ZKztx8C19zsoX2NYCtqnIcJuFwePXiHCgiwKOBxW3
	 m5RBC5KX4XaSfaEQlbWSk1y3zfdii+Z6vunboLvROoUurGd6y459ECpAfiAqblqgC/
	 VD9y37LmsqO/ZmwYNaZ4Z3HWWGlHDChovUv6XQ2Pp2EiT0tsz7pKhNWTS/FprblfV9
	 Su4zByNkWBRKPYu/o8ktKI4CBE3uqbXj2JOTVZiy1O6JC9Dgx0bPFRtGIAlcWrBdU9
	 Bs6idXsJ5hOUg==
Date: Tue, 11 Mar 2025 07:28:26 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] docs: add explanation for 'Resolved:'
Message-ID: <20250311072805.778362-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 993e177be34fd94cf41db44dd87822b4dd895f63
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

'Resolves:' tag may be used if the patch addresses one of the tickets
logged via Gitlab to auto-close such ticket when the patch got merged.

Add documentation for the tag.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/process/sending-patches.pandoc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-pat=
ches.pandoc
index 2e74c3b57e..9fc3b407ff 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -106,6 +106,18 @@ If git was configured as explained earlier, this can b=
e retrieved using
 ``git log --pretty=3Dfixes`` otherwise ``git log --abbrev=3D12 --oneline``=
 will
 give the proper tag and commit-id.
=20
+### Resolves:
+
+If your patch addresses an issue logged in a GitLab ticket, use the `Resol=
ves:`
+tag followed by the issue link to automatically close the ticket when the =
patch
+is merged.
+
+    Resolves: <URL>
+
+E.g.:
+
+    Resolves: https://gitlab.com/xen-project/xen/-/issues/185
+
 ### Backport:
=20
 A backport tag is an optional tag in the commit message to request a
--=20
2.34.1



