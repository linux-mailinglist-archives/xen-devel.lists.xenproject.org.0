Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C1A30484
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 08:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885096.1294870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thkke-0002sU-QZ; Tue, 11 Feb 2025 07:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885096.1294870; Tue, 11 Feb 2025 07:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thkke-0002qV-Ny; Tue, 11 Feb 2025 07:32:12 +0000
Received: by outflank-mailman (input) for mailman id 885096;
 Tue, 11 Feb 2025 07:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ER+F=VC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1thkkc-0002qP-4O
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 07:32:11 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af646fe-e84a-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 08:32:05 +0100 (CET)
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
X-Inumbo-ID: 4af646fe-e84a-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kohoteqq3vezlp2uwi7gjkket4.protonmail; t=1739259124; x=1739518324;
	bh=0MHGcIco4OqpSfhpoI4fkKcz0YdJnDemAEhN7SvzHIo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=f+F6qcVRc0zBUuom/UGS+OpjSX+UZ5RCzqsf8aiyMKOB7NQQshqMXxzR2L25rigwU
	 iEvGUWKGMHG5g6vtZWFF3vGVemwv6K1HU/lbVQeTEUVIC3gLDTXLUyze3l0w57dz8c
	 g/18fPePWyd5G7BgeJqwkDXnx4MWQTSrE4bXPP5j043RbYrup34z9FVfFWaVZqYTvW
	 hcUVUfQ5hMdjGe8TkmSZc0vps5E+VfVl2leqlKNYBi+/wCknG4lX5HxG3XTFk/3P7Y
	 VdNC8XQVFQpTjfpQriGtEXkYPeuhO6+FeSH0JMMY3ht5nqqoy8QIGgU150W4jPOBUG
	 9KmEUb0UokDIQ==
Date: Tue, 11 Feb 2025 07:31:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] tools: fix typo in sysconfig.xencommons.in
Message-ID: <20250211073106.189350-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2f011bd87095d812ff4c83bc26d697df59578024
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hot=
plug/Linux/init.d/sysconfig.xencommons.in
index 1bdd830d8a..1720a9b075 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -8,7 +8,7 @@
 ## Type: string
 ## Default: daemon
 #
-# Select type of xentore service.
+# Select type of xenstore service.
 #
 # This can be either of:
 #  * daemon
--=20
2.34.1



