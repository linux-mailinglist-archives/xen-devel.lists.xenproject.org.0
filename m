Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF87E7563
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 00:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629850.982356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Evw-0000hK-Sw; Thu, 09 Nov 2023 23:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629850.982356; Thu, 09 Nov 2023 23:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Evw-0000ev-Pv; Thu, 09 Nov 2023 23:59:36 +0000
Received: by outflank-mailman (input) for mailman id 629850;
 Thu, 09 Nov 2023 23:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7SK=GW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1Evv-0000ep-Va
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 23:59:35 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078bfd68-7f5c-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 00:59:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1585FCE1381;
 Thu,  9 Nov 2023 23:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F403C433C8;
 Thu,  9 Nov 2023 23:59:31 +0000 (UTC)
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
X-Inumbo-ID: 078bfd68-7f5c-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699574372;
	bh=UnQCvF9PHgz6cfQ/XY5RRVLCVH9a9PeH27mh0lbM+No=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l2iEs4kxGX60E0+ojLWYKQ5aqDhLbBtSzGa+pCowRXJb2zJh807+VnrvGWnehBwZt
	 WME4d0c/RCXNxDMm3EklrsNTIPzpt9lU7nwS4SrQuP0XK5zYGIlxpED8bnBjCEdwLu
	 v6CAFwkPlMIGgtApDX2nrUWxpa0GLeMfo/qVvfes9phG7V7aVdyJiVdPhsIXATVc5A
	 02TL7BW33Kws9ihaFOjwt6dRFzeREK/WRPEnFwzRG0bO6kx4pqpT8UjaXscVRPdyDx
	 dNiNMA9UZCmhUQxfmb7gK5wa6nlilVRXlfKyEOY2tEexnkljWlNOosjEdsOuEqlgyU
	 KvPqgEFRrY93A==
Date: Thu, 9 Nov 2023 15:59:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
In-Reply-To: <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com> <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Nov 2023, Jan Beulich wrote:
> On 08.11.2023 15:37, Andrew Cooper wrote:
> > These 3 Kconfig docs were imported from Linux erroneously.  They are
> > GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
> > be included by the blanket statement saying that all RST files are CC-BY-4.0.
> > 
> > We should not be carrying a shadow copy of these docs.  They aren't even wired
> > into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
> > look at the Linux docs anyway.  These, and more docs can be found at:
> > 
> >   https://www.kernel.org/doc/html/latest/kbuild/
> > 
> > which also have corrections vs the snapshot we took.
> 
> Imo this reference ...
> 
> > Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: George Dunlap <George.Dunlap@citrix.com>
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Wei Liu <wl@xen.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Henry Wang <Henry.Wang@arm.com>
> > ---
> >  docs/misc/kconfig-language.rst       | 701 ---------------------------
> >  docs/misc/kconfig-macro-language.rst | 247 ----------
> >  docs/misc/kconfig.rst                | 304 ------------
> >  3 files changed, 1252 deletions(-)
> >  delete mode 100644 docs/misc/kconfig-language.rst
> >  delete mode 100644 docs/misc/kconfig-macro-language.rst
> >  delete mode 100644 docs/misc/kconfig.rst
> 
> ... wants putting into, say, the last of these three files you delete, as
> a replacement. I can't spot any other place where we would have such a
> reference.
> 
> One problem I see with deleting our shadow copy is that by referring to
> Linux'es doc, the wrong impression may arise that whatever new features
> they invent we also support. Thoughts? (If nothing else, I'd expect this
> aspect to be mentioned / justified in the description.)

I think the ideal solution would be to replace the shadow copies with a
link to the Linux docs of a specific Linux tag (v5.4), instead of
generic Linux master. I am not sure where to place the links though.

