Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1776F6CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 03:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576750.903282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjOi-0001bl-BB; Fri, 04 Aug 2023 01:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576750.903282; Fri, 04 Aug 2023 01:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjOi-0001Zx-7f; Fri, 04 Aug 2023 01:14:32 +0000
Received: by outflank-mailman (input) for mailman id 576750;
 Fri, 04 Aug 2023 01:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRjOg-0001Zb-Ru
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 01:14:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a6ae3b-3264-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 03:14:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF99061EDD;
 Fri,  4 Aug 2023 01:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AB0C433C7;
 Fri,  4 Aug 2023 01:14:26 +0000 (UTC)
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
X-Inumbo-ID: 42a6ae3b-3264-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691111668;
	bh=92tN2DfU2nM4pUttl6ojxsNSgRfdxW+Cw6LmxlTiFw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JY/QtElVycxg8XfAbu6pk8SjpLIdQ2xNiVz1jPWwnFswnMbkXtDv11tgXLiOuRCml
	 0FcrKsOKweLnYpx6Ozjdfzeo0D1nf8EUVfnJ/i04p1GdWGkaZ1CblTiKVRegNmZw14
	 R4UJynL+M8UuYTGV5eH6RSGIhenuPGb3G2MW63F92A2ovQQeN+tWLIP7ijutsjgXSk
	 G1Zd5zTJBwvTmoGbeCCvt43FNlsguDDcUueRxzTVHQBCCYaYsJ/lilmpFXM2m70DER
	 6e4+4ApYbgBaYeto/r8J+JvOhf1kc0TmAPtrh6dPklPNKjXEhNDxcOzSuSN3YejfWz
	 fE/bIHHN8JGMA==
Date: Thu, 3 Aug 2023 18:14:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <alpine.DEB.2.22.394.2308031221440.2127516@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2308031811380.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop> <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com> <alpine.DEB.2.22.394.2308031221440.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Stefano Stabellini wrote:
> > Actually, they can be deviated because they don't result in wrong code being
> > generated.
> > This, modulo the review comments received, is what most of the code would look
> > like if
> > they weren't, with the biggest pain point being that in many cases the choice
> > is either
> > the pattern with blocks for certain clauses or moving them in the enclosing
> > scope, which may
> > be several hundred lines above. If there's agreement on deviating them, I can
> > drop the patches
> > dealing with switches and do a v2 with just the other modifications.
> 
> I think we should deviate them. Good idea to remove them in v2.

We should add a note about this to docs/misra/rules.rst as well?

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8f0e4d3f25..e713b0ea99 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -106,7 +106,8 @@ maintainers if you want to suggest a change.
    * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
      - Required
      - A project shall not contain unreachable code
-     -
+     - It is acceptable to declare local variables under a switch
+       statement block
 
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
      - Advisory

