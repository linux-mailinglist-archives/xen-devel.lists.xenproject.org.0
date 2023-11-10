Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA07E86AA
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 00:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630832.983971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1bBL-0001bl-Tk; Fri, 10 Nov 2023 23:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630832.983971; Fri, 10 Nov 2023 23:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1bBL-0001ZP-Qg; Fri, 10 Nov 2023 23:44:59 +0000
Received: by outflank-mailman (input) for mailman id 630832;
 Fri, 10 Nov 2023 23:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1bBK-0001ZJ-03
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 23:44:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2616f480-8023-11ee-98da-6d05b1d4d9a1;
 Sat, 11 Nov 2023 00:44:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8ABBCE16DB;
 Fri, 10 Nov 2023 23:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E15C433C7;
 Fri, 10 Nov 2023 23:44:47 +0000 (UTC)
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
X-Inumbo-ID: 2616f480-8023-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699659888;
	bh=Hpx6GugfqohRisxCktQeLstLukR5qZu5Z2gkoGaWJvU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mg/7rGLJPRdufwAdCk6Fx13rJSl7wcWtyCQ2fUVhmS4Z4xH+/v325osDetV3wETJi
	 5dNI0rxEOvTkNogBGL1SyL2GfXxwEdY9DzPS/IL8yts7tDksAuJGsXvZ/zikvw6Xch
	 h/wLcjQuHs8ewbvtmQFJu439cQdIZXVcVqjpHNeNKWsO79kPtLhcWGhuFWzUl4Xa3V
	 uWeg61fidojMpt1Bl1zCuTlnY22xKcru5qMFKsVCqx1xFwjzxc73RXUmpd3Ra4jhWs
	 U6DkI++orpje3X/wLyNaWcNUkOingaS7ejMGtTPzWjN3ehamfPStx9zGlkeNn+J384
	 gJ9eevfDNgHBw==
Date: Fri, 10 Nov 2023 15:44:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
In-Reply-To: <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311101544120.3478774@ubuntu-linux-20-04-desktop>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com> <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com> <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop> <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1891703912-1699659888=:3478774"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1891703912-1699659888=:3478774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 Nov 2023, Andrew Cooper wrote:
> On 09/11/2023 11:59 pm, Stefano Stabellini wrote:
> > On Thu, 9 Nov 2023, Jan Beulich wrote:
> >> On 08.11.2023 15:37, Andrew Cooper wrote:
> >>> These 3 Kconfig docs were imported from Linux erroneously.  They are
> >>> GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
> >>> be included by the blanket statement saying that all RST files are CC-BY-4.0.
> >>>
> >>> We should not be carrying a shadow copy of these docs.  They aren't even wired
> >>> into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
> >>> look at the Linux docs anyway.  These, and more docs can be found at:
> >>>
> >>>   https://www.kernel.org/doc/html/latest/kbuild/
> >>>
> >>> which also have corrections vs the snapshot we took.
> >> Imo this reference ...
> >>
> >>> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> ---
> >>> CC: George Dunlap <George.Dunlap@citrix.com>
> >>> CC: Jan Beulich <JBeulich@suse.com>
> >>> CC: Stefano Stabellini <sstabellini@kernel.org>
> >>> CC: Wei Liu <wl@xen.org>
> >>> CC: Julien Grall <julien@xen.org>
> >>> CC: Henry Wang <Henry.Wang@arm.com>
> >>> ---
> >>>  docs/misc/kconfig-language.rst       | 701 ---------------------------
> >>>  docs/misc/kconfig-macro-language.rst | 247 ----------
> >>>  docs/misc/kconfig.rst                | 304 ------------
> >>>  3 files changed, 1252 deletions(-)
> >>>  delete mode 100644 docs/misc/kconfig-language.rst
> >>>  delete mode 100644 docs/misc/kconfig-macro-language.rst
> >>>  delete mode 100644 docs/misc/kconfig.rst
> >> ... wants putting into, say, the last of these three files you delete, as
> >> a replacement. I can't spot any other place where we would have such a
> >> reference.
> >>
> >> One problem I see with deleting our shadow copy is that by referring to
> >> Linux'es doc, the wrong impression may arise that whatever new features
> >> they invent we also support. Thoughts? (If nothing else, I'd expect this
> >> aspect to be mentioned / justified in the description.)
> > I think the ideal solution would be to replace the shadow copies with a
> > link to the Linux docs of a specific Linux tag (v5.4), instead of
> > generic Linux master. I am not sure where to place the links though.
> 
> I don't personally think we need to keep any other reference around. 
> They're not interesting, because they're not going to be found by anyone
> except those who already know they're there, and won't need to refer to
> them for the kind of content they provide.
> 
> Kconfig isn't a fast-moving target, and there's nothing new in Linux vs
> what we've got here.  The only interesting difference between us and
> Linux is the fact we don't use modules, and we didn't even strip that
> out of the shadow copy.
> 
> We do have xen/tools/kconfig/README.source which states where it came from.
> 
> I could be persuaded to add the following hunk.  What we have isn't
> precisely v5.4 anyway - we've got some reasonable differences in the
> makefile side of things.

The below is good enough in my opinion. Ack.


> diff --git a/xen/tools/kconfig/README.source
> b/xen/tools/kconfig/README.source
> index 44631f68e8..ac394106b9 100644
> --- a/xen/tools/kconfig/README.source
> +++ b/xen/tools/kconfig/README.source
> @@ -5,5 +5,7 @@ in this part of the Xen source tree.
>  
>  xen/tools/kconfig
>  -----------------
> -The kconfig directory was originally imported from the linux kernel
> -git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig
> +The kconfig directory was originally imported from the Linux kernel
> +git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig of
> +roughly v5.4.  Linux's documentation can be found at:
> +https://www.kernel.org/doc/html/latest/kbuild/
> 
--8323329-1891703912-1699659888=:3478774--

