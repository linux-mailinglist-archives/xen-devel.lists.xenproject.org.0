Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26680973D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650269.1015605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOlV-0006TX-RD; Fri, 08 Dec 2023 00:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650269.1015605; Fri, 08 Dec 2023 00:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOlV-0006RN-OI; Fri, 08 Dec 2023 00:30:49 +0000
Received: by outflank-mailman (input) for mailman id 650269;
 Fri, 08 Dec 2023 00:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOlU-0006RH-Bo
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:30:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067f6d97-9561-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:30:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2DED36225A;
 Fri,  8 Dec 2023 00:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CFAC433C7;
 Fri,  8 Dec 2023 00:30:42 +0000 (UTC)
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
X-Inumbo-ID: 067f6d97-9561-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701995443;
	bh=rQ+S/PPmFmkuuRVo8a6LonEI7Q94VMLt8Z05bVUjT9Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fqKRNJsGc75lEDzc6vm9oo9r51ghzPg+R/qFQOhVmqRS3WvoSrCjdB5XFPPxxjgxW
	 OI/GYa+LeNDbUyWfPExNpHt0HxDKDp2fKcXg0V8tz4lCWT4ldfBcZkUtpSMR9nPN7y
	 xATgNNqDjemXcsKPbtVp3vIAFdoUH+lsEgeHZIBfRLQQ1BEpr92FdYh6YzS1FL0PqS
	 twSE1C/JR2vErJw0BGjMDUewE+iF56UaX9zUP3ES2exnquxMU8gtJGJnH6kgoUwyQg
	 bePZzAkL3Qi4SytzwFn2G5DbQS8V2poI3vpYcH4hTqx7LOvfNALqh9WT7Dj9ZgZz1o
	 RPJU+5XEIfgug==
Date: Thu, 7 Dec 2023 16:30:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
In-Reply-To: <866ae09f-8e21-4f1b-a82e-8b72cc0f34e8@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312071628130.1265976@ubuntu-linux-20-04-desktop>
References: <4fa08aaed77d2b68db39ce51beef29820f1ba9b0.1701940034.git.federico.serafini@bugseng.com> <866ae09f-8e21-4f1b-a82e-8b72cc0f34e8@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Julien Grall wrote:
> Hi Federico,
> 
> On 07/12/2023 09:08, Federico Serafini wrote:
> > MISRA C:2012 Rule 16.3 states that an unconditional break statement
> > shall terminate every switch-clause.
> > 
> > Update ECLAIR configuration to take into account:
> > - continue, goto, return statements;
> > - functions and macros that do not give the control back;
> > - fallthrough comments and pseudo-keywords.
> > 
> > Update docs/misra/deviations.rst accordingly.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > ---
> >   .../eclair_analysis/ECLAIR/deviations.ecl     | 18 ++++++++++++++
> >   docs/misra/deviations.rst                     | 24 +++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> 
> It would be good that this is depending on to be accepted:
> 
> https://lore.kernel.org/alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop.
> 
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index b0c79741b5..df0b58a010 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -321,6 +321,24 @@ statements are deliberate"
> >   -config=MC3R1.R14.3,statements={deliberate ,
> > "wrapped(any(),node(if_stmt))" }
> >   -doc_end
> >   +#
> > +# Series 16.
> > +#
> > +
> > +-doc_begin="Switch clauses ending with continue, goto, return statements
> > are safe."
> > +-config=MC3R1.R16.3,terminals+={safe,
> > "node(continue_stmt||goto_stmt||return_stmt)"}
> > +-doc_end
> > +
> > +-doc_begin="Switch clauses not ending with the break statement are safe if
> > a function/macro that does not give the control back is present."
> > +-config=MC3R1.R16.3,terminals+={safe,
> > "call(decl(name(__builtin_unreachable||do_unexpected_trap||fatal_trap||machine_halt||machine_restart||maybe_reboot||panic)))"}
> > +-config=MC3R1.R16.3,terminals+={safe,"macro(name(BUG||BUG_ON))"}
> > +-doc_end
> > +
> > +-doc_begin="Switch clauses not ending with the break statement are safe if
> > an explicit comment or pseudo-keyword indicating the fallthrough intention
> > is present."
> > +-config=MC3R1.R16.3,reports+={safe,
> > "any_area(any_loc(any_exp(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[-
> > ]?THROUGH).*$,0..1))))"}
> > +-config=MC3R1.R16.3,reports+={safe, "any_area(text(^(?s).*([fF]all[-
> > ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))"}
> 
> This is not trivial to read. Can you document the exhaustive list of keywords
> you are actually trying to deviate on? Also, did you consider to harmonize to
> only a few?
> 
> > +-doc_end
> > +
> >   #
> >   # Series 20.
> >   #
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 6e7c4f25b8..fecd2bae8e 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -270,6 +270,30 @@ Deviations related to MISRA C:2012 Rules:
> >          statements are deliberate.
> >        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
> >   +   * - R16.3
> > +     - Switch clauses ending with continue, goto, return statements are
> > safe.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R16.3
> > +     - Switch clauses not ending with the break statement are safe if a
> > +       function/macro that does not give the control back is present.
> > +     - Tagged as `safe` for ECLAIR, such functions/macros are:
> > +        - __builtin_unreachable
> > +        - do_unexpected_trap
> > +        - fatal_trap
> > +        - machine_halt
> > +        - machine_restart
> > +        - maybe_reboot
> > +        - panic
> > +        - BUG
> 
> To me, it seems to be odd to deviate R16.3 by function. Some of those have an
> attribute noreboot. Can this be used?

Just to clarify, I think Julien meant "noreturn" which is defined as
__attribute__((__noreturn__))

I think we need to deviate by function, rather than using SAF, because
we would have to use SAF in every switch rather than at the declaration
of panic and friends. But if we could use noreturn, that would be
awesome.


> > +        - BUG_ON
> 
> BUG_ON() can return if the condition is false. So it doesn't look correct to
> deviate with the argument that the function doesn't give the control back...

+1


> > +
> > +   * - R16.3
> > +     - Switch clauses not ending with the break statement are safe if an
> > +       explicit comment or pseudo-keyword indicating the fallthrough
> > intention
> > +       is present.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> >      * - R20.7
> >        - Code violating Rule 20.7 is safe when macro parameters are used:
> >          (1) as function arguments;

