Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB19301E6
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758306.1167730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOJZ-0002O1-Kc; Fri, 12 Jul 2024 22:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758306.1167730; Fri, 12 Jul 2024 22:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOJZ-0002Ma-Hx; Fri, 12 Jul 2024 22:00:29 +0000
Received: by outflank-mailman (input) for mailman id 758306;
 Fri, 12 Jul 2024 22:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOJY-0002MU-0i
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:00:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23d2e020-409a-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:00:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2AA7CE13CF;
 Fri, 12 Jul 2024 22:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D2CC32782;
 Fri, 12 Jul 2024 22:00:17 +0000 (UTC)
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
X-Inumbo-ID: 23d2e020-409a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720821619;
	bh=Yu+33vDlvfcMRATj6+pT5vELXsbar+dkgtyJQyIHPP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bUNYl51TVXsY+oFnJbrH2nIqKZYSX42qJ1NYzsc9q+qEZyR3T5c/ujC6usJ1wCr3z
	 3jraFkbyj/5AhPXEKHKUDS+069bC+GRH+rTpRwp8M7a0rMflq3ktXd4+A0J1h7MDgb
	 LgxtpJRAhmyASZWmC1GBaMEx+ukoaEQYFcqDiXhJehmvCH+ncSC6LGe63sMo1xe5Y6
	 cYxHJ9fSUjJbpIbNiCLYkXjWG9cK1WiB4m17Uyb0ehyyIx9rPWH2CS7+QWI9lSI3jg
	 drxeRtHVA0YDM4QnUnwFp3zChIyx+d1v/OixNdtMqXVvZbLG9VhODGOi7m6qGFIQ7v
	 fmIUuMO6c2Wgw==
Date: Fri, 12 Jul 2024 15:00:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 03/17] misra: add deviations for direct inclusion
 guards
In-Reply-To: <a9133a97-d874-48ae-8ee4-83d752dcedd7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121459590.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <64e80abfaa68d87e8cb4fee67bc2624eda4f466a.1719829101.git.alessandro.zucchelli@bugseng.com> <a9133a97-d874-48ae-8ee4-83d752dcedd7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Jan Beulich wrote:
> On 01.07.2024 13:10, Alessandro Zucchelli wrote:
> > From: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > Add deviation comments to address violations of
> > MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> > to prevent the contents of a header file being included more than
> > once").
> > 
> > Inclusion guards must appear at the beginning of the headers
> > (comments are permitted anywhere).
> > 
> > This patch adds deviation comments using the format specified
> > in docs/misra/safe.json for headers with just the direct
> > inclusion guard before the inclusion guard since they are
> > safe and not supposed to comply with the directive.
> > 
> > Note that with SAF-9-safe in place, failures to have proper guards later
> > in the header files will not be reported
> 
> Rebasing mistake, seeing that it's ...

Yes with "SAF-9-safe" changed to SAF-10-safe in the commit message:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> > --- a/docs/misra/safe.json
> > +++ b/docs/misra/safe.json
> > @@ -84,6 +84,14 @@
> >          },
> >          {
> >              "id": "SAF-10-safe",
> > +            "analyser": {
> > +                "eclair": "MC3R1.D4.10"
> > +            },
> > +            "name": "Dir 4.10: direct inclusion guard before",
> > +            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
> > +        },
> > +        {
> > +            "id": "SAF-11-safe",
> >              "analyser": {},
> >              "name": "Sentinel",
> >              "text": "Next ID to be used"
> 
> ... SFA-10-safe that's being added and ...
> 
> > --- a/xen/arch/arm/include/asm/hypercall.h
> > +++ b/xen/arch/arm/include/asm/hypercall.h
> > @@ -1,3 +1,4 @@
> > +/* SAF-10-safe direct inclusion guard before */
> >  #ifndef __XEN_HYPERCALL_H__
> >  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
> >  #endif
> > --- a/xen/arch/x86/include/asm/hypercall.h
> > +++ b/xen/arch/x86/include/asm/hypercall.h
> > @@ -2,6 +2,7 @@
> >   * asm-x86/hypercall.h
> >   */
> >  
> > +/* SAF-10-safe direct inclusion guard before */
> >  #ifndef __XEN_HYPERCALL_H__
> >  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
> >  #endif
> 
> ... used here?
> 
> Jan
> 

