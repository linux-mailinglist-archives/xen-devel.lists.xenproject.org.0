Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A111393A8CC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 23:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763574.1173843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNGa-0002pg-0x; Tue, 23 Jul 2024 21:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763574.1173843; Tue, 23 Jul 2024 21:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWNGZ-0002my-Tv; Tue, 23 Jul 2024 21:41:51 +0000
Received: by outflank-mailman (input) for mailman id 763574;
 Tue, 23 Jul 2024 21:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWNGY-0002mq-AN
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 21:41:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b168fa2-493c-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 23:41:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42775CE0F15;
 Tue, 23 Jul 2024 21:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A514EC4AF09;
 Tue, 23 Jul 2024 21:41:39 +0000 (UTC)
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
X-Inumbo-ID: 5b168fa2-493c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770900;
	bh=ff5YjC90GVSl12piLg//AWX/fJWKZqOrozrOhQaUu+g=;
	h=Date:From:To:cc:Subject:From;
	b=YeT0MoJaGRalfx5wsTWAu8UScilDbWoA+fRgof2FtL26eV+n5cWgLLM56NtUDG5TZ
	 Ug2qgVgARGC+FrNipgwb5LegAfC/rJ/ndTuK77JTjltR2SnrvUyXF2JCvvpI9bVGe3
	 ySU5uBmbevPFHEV4FvlJJNt9nte7UKv+LXvT7kmi19ahWQNz9PKJa4KrvXdj6UnfUY
	 C3SbBDBhZ4itEUMzjg2g2L+SXK55I+7lQeidVJqPGDqSAEdngGGykgrsao0pQyCFc4
	 rd1L1e4b/lPI4AjbgZqNgk1JfLkl8KdiVgSWqaJo6A/puJ7hDcliWdTo6VXI5a6iZa
	 JH1scWKZfX60g==
Date: Tue, 23 Jul 2024 14:41:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH] docs/misra: add R18.6 to rules.rst
Message-ID: <alpine.DEB.2.22.394.2407231439260.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

In practice, we are already following R18.6 and we have zero violations
reported by ECLAIR (there are some cautions being reported.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..0cb2fb8f24 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -580,6 +580,13 @@ maintainers if you want to suggest a change.
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
      -
 
+   * - `Rule 18.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_06_1.c>`_
+     - Required
+     - The address of an object with automatic storage shall not be
+       copied to another object that persists after the first object has
+       ceased to exist
+     -
+
    * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_19_01.c>`_
      - Mandatory
      - An object shall not be assigned or copied to an overlapping

