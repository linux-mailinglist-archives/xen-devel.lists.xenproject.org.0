Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A666A7DD7DB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 22:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626009.975878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxwVA-0004sj-RK; Tue, 31 Oct 2023 21:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626009.975878; Tue, 31 Oct 2023 21:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxwVA-0004pR-Oi; Tue, 31 Oct 2023 21:42:20 +0000
Received: by outflank-mailman (input) for mailman id 626009;
 Tue, 31 Oct 2023 21:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxwV8-0004pL-CQ
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 21:42:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a0ab803-7836-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 22:42:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B863BCE0B33;
 Tue, 31 Oct 2023 21:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B6AC433C7;
 Tue, 31 Oct 2023 21:42:06 +0000 (UTC)
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
X-Inumbo-ID: 5a0ab803-7836-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698788529;
	bh=mI1MR8jy+vjBKrxG8UnQuAIQSUVNiA1NAl7Wzvfucrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hkEt9qt10y5ue5LZMJYz5Apv7SOG3WoE2tX1zdyKS07CyOAy3+l/LefaLJPlxER4g
	 zx2HIujMMrwF4Xsd/y+0gRJ+7OPW9kAdN3VlCDoxGASNLSzIg2cFtUe6YFau4DhxOW
	 xvbvFvCROAnmRSCMpOcuMaSznMtCvzJENfvko80wZIs+vYMxVbhIOUScR6a3aBBgLD
	 OtuPQFBpWSlwPYsf2jmqzD/hXmioUPzqD/lgrAdA7uHeii7Smvur1Eywu/fZrZyXwr
	 QdcqksJfAvx8abZWXBodAuCrcZ+dZuEMX2gcDEw9edmpXrGsI521eblpR7AVGPQcCx
	 dPFh7qFII/JEw==
Date: Tue, 31 Oct 2023 14:41:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310311441530.1795129@ubuntu-linux-20-04-desktop>
References: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com> <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org> <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Oct 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 30/10/2023 22:49, Stefano Stabellini wrote:
> > On Mon, 30 Oct 2023, Julien Grall wrote:
> > > Hi Nicola,
> > > 
> > > On 27/10/2023 16:11, Nicola Vetrini wrote:
> > > > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > > > index 8511a189253b..8aaaa1473fb4 100644
> > > > --- a/docs/misra/deviations.rst
> > > > +++ b/docs/misra/deviations.rst
> > > > @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
> > > >             - __emulate_2op and __emulate_2op_nobyte
> > > >             - read_debugreg and write_debugreg
> > > >    +   * - R7.1
> > > > +     - It is safe to use certain octal constants the way they are
> > > > defined
> > > > +       in specifications, manuals, and algorithm descriptions. Such
> > > > places
> > > > +       are marked safe with a /\* octal-ok \*/ in-code comment, or with
> > > > a
> > > > SAF
> > > > +       comment (see safe.json).
> > > 
> > > Reading this, it is unclear to me why we have two ways to deviate the rule
> > > r7.1. And more importantely, how would the developper decide which one to
> > > use?
> > 
> > I agree with you on this and we were discussing this topic just this
> > morning in the FUSA community call. I think we need a way to do this
> > with the SAF framework:
> > 
> > if (some code with violation) /* SAF-xx-safe */
> > 
> > This doesn't work today unfortunately. It can only be done this way:
> > 
> > /* SAF-xx-safe */
> > if (some code with violation)
> > 
> > Which is not always desirable. octal-ok is just an ad-hoc solution for
> > one specific violation but we need a generic way to do this. Luca is
> > investigating possible ways to support the previous format in SAF.
> 
> Why can't we use octal-ok everywhere for now?

I think this is a good option for now, yes


> My point here is to make simple for the developper to know what to use.
>
> > 
> > I think we should take this patch for now and harmonize it once SAF is
> > improved.
> 
> The description of the deviation needs some improvement.

+1


> To give an example,
> with the current wording, one could they can use octal-ok everywhere. But
> above, you are implying that SAF-xx-safe should be
> preferred.
> 
> I would still strongly prefer if we use octal-ok everywhere because this is
> simple to remember. But if the other are happy to have both SAF-XX and
> octal-ok, then the description needs to be completely unambiguous and the
> patch should contain some explanation why we have two different ways to
> deviate.

I think we could say "octal-ok" only and not mention SAF. As you can see
from the other messages we still have work to do on SAF to be able to
use it the way we would like to use it.

