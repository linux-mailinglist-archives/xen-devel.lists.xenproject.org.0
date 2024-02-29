Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F81686D7DB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687462.1070955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfppr-0007mi-29; Thu, 29 Feb 2024 23:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687462.1070955; Thu, 29 Feb 2024 23:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfppq-0007kP-Ue; Thu, 29 Feb 2024 23:29:06 +0000
Received: by outflank-mailman (input) for mailman id 687462;
 Thu, 29 Feb 2024 23:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfppp-0007kF-HG
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:29:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51690d33-d75a-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 00:29:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 05847CE1B64;
 Thu, 29 Feb 2024 23:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFE7C433F1;
 Thu, 29 Feb 2024 23:28:54 +0000 (UTC)
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
X-Inumbo-ID: 51690d33-d75a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709249336;
	bh=yLkOZYsNkYyeStMQcxfFu62ISwDUw5RGaHksZiUJAX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lRE0z+Ha1P5ip46wgGwvSB1xbNS7vphi7+zWrReIlVE5Do7rYXfJEzQBrPALE2sHu
	 gb455KHfq9jDjCCH499nNBrkVdcJ0fbQ0PIZo7IWsLDjlCUrU7AO3m5beI++306GFC
	 +RTpUXBJTis+fUq/BHPQ+OCEeepr5Jlv/IX27BXpTXifyZV/2MRzrhq5+MJrH0T4EI
	 q5Jh0Q7ORIJ+adU7Wkr1MFLIWrpWLKoB8zDEj9yagneCLccNK//KpVle7q2BzuWbr4
	 yB1V0iYIqk/GoX38p6myveVKmJoRlu3X66VWP5Y8Q0df+sANs6jgJa7YxZUGiPzNey
	 SmRxW7HwpKTJA==
Date: Thu, 29 Feb 2024 15:28:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    roberto.bagnara@bugseng.com
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
In-Reply-To: <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop> <20240213223334.3693410-2-stefano.stabellini@amd.com> <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com> <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com> <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Feb 2024, Federico Serafini wrote:
> On 14/02/24 14:15, Jan Beulich wrote:
> > On 14.02.2024 12:27, Federico Serafini wrote:
> > > On 14/02/24 09:28, Jan Beulich wrote:
> > > > On 13.02.2024 23:33, Stefano Stabellini wrote:
> > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > ---
> > > > >    docs/misra/rules.rst | 6 ++++++
> > > > >    1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > > > index c185366966..931158b354 100644
> > > > > --- a/docs/misra/rules.rst
> > > > > +++ b/docs/misra/rules.rst
> > > > > @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
> > > > >           headers (xen/include/public/) are allowed to retain longer
> > > > >           identifiers for backward compatibility.
> > > > >    +   * - `Rule 5.5
> > > > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> > > > > +     - Required
> > > > > +     - Identifiers shall be distinct from macro names
> > > > > +     - Clashes between function-like macros and non-callable entities
> > > > > +       are allowed. The pattern #define x x is also allowed.
> > > > 
> > > > Just for me to know what exactly is covered (hence also a question
> > > > to Roberto as to [to be] implemented Eclair behavior): Even when
> > > > the above would be sufficient (and imo better) people frequently
> > > > write
> > > > 
> > > > #define a(x, y) b(x, y)
> > > > 
> > > > which, transformed to the specific case here, would then be
> > > > 
> > > > #define a(x, y) a(x, y)
> > > > 
> > > > I'd assume such ought to also be covered, but that's not clear
> > > > from the spelling above.
> > > 
> > > I list what happens in some different situations,
> > > then we can find the right words for the documentation and/or
> > > refine the configuration:
> > > 
> > > If you
> > > #define x x
> > > and then use `x' as identifier,
> > > the resulting violation is deviated (allowed pattern).
> > > 
> > > If you
> > > #define a(x, y) a(x, y)
> > > and then use `a' as identifier for a non-callable entity,
> > > the resulting violation is deviated (no clash with non-callable
> > > entities).
> > > If you use identifier `a' for a callable entity, the resulting violation
> > > is reported: the allowed pattern covers only macros expanding to their
> > > own name, in this case the macro name is considered to be
> > > `a' only, not a(x, y).
> > > 
> > > If you
> > > #define a(x, y) b(x, y)
> > > and then use `a' as identifier for a non-callable entity,
> > > the resulting violation is deviated (no clash with non-callable
> > > entities).
> > 
> > I'm afraid I don't see what violation there is in this case, to
> > deviate. As a result I'm also not sure I correctly understand the
> > rest of your reply.
> 
> #define a(x, y) b(x, y)
> 
> int a; // Violation of Rule 5.5.
> 
> The macro name `a' that exist before the preprocessing phase,
> still exists after the preprocessing phase as identifier for the integer
> variable and this is a violation.
> 
> > > If you use `a' as identifier for a callable entity,
> > > this is not a violation because after the preprocessing phase,
> > > identifier `a' no longer exists.
> I correct myself:
> if you use `a' as identifier for a *function*,
> it is not a violation because after the preprocessing phase
> the identifier `a' no longer exists, for example:
> 
> #define a(x, y) b(x, y)
> 
> void a(int x, int y); // Ok.

Federico, do you have a better wording suggestion for this rule?

Jan, any further requests here? What would you like to see as next step?

