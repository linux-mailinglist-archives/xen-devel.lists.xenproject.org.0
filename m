Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C086D734
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687447.1070935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpO3-0003RB-LY; Thu, 29 Feb 2024 23:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687447.1070935; Thu, 29 Feb 2024 23:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpO3-0003Oz-IL; Thu, 29 Feb 2024 23:00:23 +0000
Received: by outflank-mailman (input) for mailman id 687447;
 Thu, 29 Feb 2024 23:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpO2-0003Ot-40
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:00:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e33d270-d756-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 00:00:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FB976134B;
 Thu, 29 Feb 2024 23:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDF1C43390;
 Thu, 29 Feb 2024 23:00:15 +0000 (UTC)
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
X-Inumbo-ID: 4e33d270-d756-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709247616;
	bh=Nr+2S5hkfscTDCR6fobtHuzA31U3TLZ01xIBOfUECyE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=grgkGWyGhT8nGhX6dJ7Nrivwz0+0H4h7TeU1omZvb9tW8EiHPTroyJPwmBBLI1d+U
	 WOKrjPXsNCqo6LRScH0OsMk26GfeZm3FwxaMUtBF0ZdZ4KK56xgAZjMyx3N/5Nq1bM
	 dBHN9klN8m27xtEiRGPCUEfCFFtlAYKwrSg+WXgQwshv4UmvaKoXbDootnIq7T0oHg
	 kljtm/yAOBttfXm65crzKQy3OSvN7yx+olzlhfErt6WhywXtq80njSS3G+nairfXw3
	 sdX4MGEp+rddSkT2gXLsqWLgNFV6B5sbiIYoal1eftmw5dLftnjZjhAZlQbBPx/Cl2
	 GZ85xID2moNYQ==
Date: Thu, 29 Feb 2024 15:00:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair: extend deviations of MISRA C:2012
 Rule 16.3
In-Reply-To: <0e2f5394-6322-4845-954f-ff080626523f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402291458370.853156@ubuntu-linux-20-04-desktop>
References: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com> <1a00c221-ce1c-45be-9ab3-e8f1a0e5678d@suse.com> <98d82c40-a81a-4c75-8cdf-aaef640382b6@bugseng.com> <0e2f5394-6322-4845-954f-ff080626523f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Jan Beulich wrote:
> On 29.02.2024 09:01, Federico Serafini wrote:
> > On 28/02/24 10:06, Jan Beulich wrote:
> >> On 28.02.2024 09:53, Federico Serafini wrote:
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>
> >> Comments below apply similarly to text added to this file.
> >>
> >>> --- a/docs/misra/deviations.rst
> >>> +++ b/docs/misra/deviations.rst
> >>> @@ -291,7 +291,14 @@ Deviations related to MISRA C:2012 Rules:
> >>>        - Project-wide deviation; tagged as `deliberate` for ECLAIR.
> >>>   
> >>>      * - R16.3
> >>> -     - Switch clauses ending with continue, goto, return statements are safe.
> >>> +     - Switch clauses ending with an unconditional flow control statement
> >>> +       (i.e., continue, goto, or return) are safe.
> >>> +     - Tagged as `safe` for ECLAIR.
> >>
> >> With this edit (unmentioned in the description, btw) ...
> >>
> >>> +   * - R16.3
> >>> +     - Switch clauses ending with an if-else statement are safe if both
> >>> +       branches consist of a flow control statement (i.e., continue, break,
> >>> +       goto, return).
> >>
> >> ... why is it not also "ending with" here?
> > 
> > Because the allowed pattern is:
> > 
> > if ( cond )
> >   return; /* Or continue / break / goto */
> > else
> >   break;  /* Or continue / goto / return */
> > 
> > See below for more information.
> > 
> >>
> >> Also what about either situation ending with a call to a noreturn function?
> > 
> > This can be added.
> > 
> >>
> >>> @@ -307,6 +314,16 @@ Deviations related to MISRA C:2012 Rules:
> >>>        - Switch clauses ending with failure method \"BUG()\" are safe.
> >>>        - Tagged as `safe` for ECLAIR.
> >>>   
> >>> +   * - R16.3
> >>> +     - On X86, switch clauses ending generating an exception through
> >>> +       \"generate_exception()\" are safe.
> >>> +     - Tagged as `safe` for ECLAIR.
> >>
> >> This macro is limited to the emulator, so shouldn't be deviated globally.
> > 
> > Noted.
> > 
> >> Furthermore - why does the special case need mentioning here? Shouldn't
> >> it be the underlying pattern which is deviated (along the lines of the
> >> earlier ones):
> >>
> >>      if ( true )
> >>      {
> >>          ...
> >>          goto ...; /* Or break / continue / return */
> >>      }
> > 
> > This pattern that involves a compound statement for the true branch
> > is not deviated by this configuration.
> > 
> > See below for more information.
> > 
> >>
> >>> +   * - R16.3
> >>> +     - Switch clauses ending generating a parse error through
> >>> +       \"PARSE_ERR_RET()\" are safe.
> >>> +     - Tagged as `safe` for ECLAIR.
> >>
> >> Again this isn't a global scope macro, so shouldn't be deviated globally.
> > 
> > Noted.
> > 
> >> Plus it ends in "return", so ought to be covered by the earlier clause.
> >> The fact that the return is in a body of do {} while(0) shouldn't matter
> >> at all - that's purely syntactic sugar.
> > 
> > I gather from your comments/questions that you would like to deviate
> > *all* the patterns where an unintentional fall through can not happen.
> > 
> > Rule 16.3 is a purely syntactic rule, and, as a consequence,
> > in the current version of ECLAIR additional "allowed pattern" (aka
> > deviations) for that rule need to be described through AST nodes,
> > meaning that all what you consider as syntactic sugar cannot be ignored.
> > 
> > A deviation that covers all the pattern you are asking for could be
> > done, but it will result in a complex and quite long expression
> > (not easy to read and justify in front of an assessor).
> > 
> > Hence, what I am proposing is to deviate only the the simplest and
> > most readable cases, such as:
> > 
> > if ( cond )
> >    return x;
> > else
> >    return y;
> > 
> > without involving compound statements, fake do-wile and fake if
> > statements but rather deviating the macro inside of which are used
> > (as I did).
> 
> I see. Problem is that this isn't sufficient for the code we have, and
> the seemingly random deviation of certain constructs by name looks to
> me as pretty undesirable.

Yeah, I also think it is not ideal. At the same time among all options,
it is probably the best way forward (better than in-code comments or
better than leaving the violations outstanding).

I think we should go for it.

