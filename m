Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684A7A390EC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 03:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891031.1300131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkDcO-0006sZ-N7; Tue, 18 Feb 2025 02:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891031.1300131; Tue, 18 Feb 2025 02:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkDcO-0006qk-Ja; Tue, 18 Feb 2025 02:45:52 +0000
Received: by outflank-mailman (input) for mailman id 891031;
 Tue, 18 Feb 2025 02:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkDcN-0006qe-M1
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 02:45:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c794a4-eda2-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 03:45:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 499C0A41B57;
 Tue, 18 Feb 2025 02:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A9C4CED1;
 Tue, 18 Feb 2025 02:45:46 +0000 (UTC)
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
X-Inumbo-ID: 75c794a4-eda2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739846747;
	bh=C8I/Mm2+nV6W3mzMP0X4NrX8BvRGGLPGauOk8OAp9oU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mRfVMuTgKtlJj4D7OUjjlGnyYcSf0ptVKoMJO4Rok5FEPgIVr6GtLzkxjDMHI5ucD
	 xWNqCcLnZG/b7OICd3q1kdZQPKpOOTqueBdNaQaD3Yb6R/igY0VDZ6klmeEdL8ZRn1
	 WE3tIX+FHArVWbynLA3EAjHE/c9cxix3zqG94qXsYph6E6yQxdaeVMWMPS6R/1F0in
	 MWx3GhQlsgnpcaHxomfq8S1+SbuqxGg6Ee8u1xZxFhBY/gTHYKZky/SeR4E5bNBq9P
	 cLARB9OtUGGyHh4ZAWJ+Tog3FzuOuOOpgAbyoca8rbbnUJRbQU4fmUVAZRM77ZPwdk
	 1scJYLgvhUMKQ==
Date: Mon, 17 Feb 2025 18:45:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com> <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop> <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com> <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop> <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com> <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Jan Beulich wrote:
> On 15.02.2025 09:59, Nicola Vetrini wrote:
> > On 2025-02-15 00:04, Stefano Stabellini wrote:
> >> On Fri, 14 Feb 2025, Jan Beulich wrote:
> >>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
> >>>
> >>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
> >>> well.
> >>
> >> I wrote this patch. Nicola, can you please check the changes to
> >> deviations.ecl, this is the first time I try to write the deviation
> >> myself :-)
> >>
> >> ---
> >> misra: add 11.2 deviation for incomplete types
> >>
> >> struct mctelem_cookie* is used exactly because it is an incomplete type
> >> so the pointer cannot be dereferenced. This is deliberate. So add a
> >> deviation for it.
> >>
> >> In deviations.ecl, add the list of macros that do the conversions to 
> >> and
> >> from struct mctelem_cookie*.
> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> >> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> index a28eb0ae76..87bfd2160c 100644
> >> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> @@ -366,6 +366,14 @@ constant expressions are required.\""
> >>  }
> >>  -doc_end
> >>
> >> +-doc_begin="Certain pointers point to incomplete types purposely so 
> >> that they are impossible to dereference."
> >> +-config=MC3A2.R11.2,reports+={deliberate, 
> >> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
> >> +-config=MC3A2.R11.2,reports+={deliberate, 
> >> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
> >> +-config=MC3A2.R11.2,reports+={deliberate, 
> >> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
> >> +-config=MC3A2.R11.2,reports+={deliberate, 
> >> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
> >> +}
> > 
> > -config=MC3A2.R11.2,reports+={deliberate, 
> > "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
> > 
> > Note however that there is also this deviation in place
> > 
> > -doc_begin="The conversion from a pointer to an incomplete type to 
> > unsigned long does not lose any information, provided that the target 
> > type has enough bits to store it."
> > -config=MC3A2.R11.2,casts+={safe,
> >    "from(type(any()))
> >     &&to(type(canonical(builtin(unsigned long))))
> >     &&relation(definitely_preserves_value)"
> > }
> > -doc_end
> > 
> > I was a bit confused by Jan's remark, which seemed correct, but I 
> > couldn't see any violations in the report, so I dug a bit deeper. 
> > ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
> > excluded due to being safe. If you envision those macros to be used with 
> > other types, then your deviation should mention them, otherwise they are 
> > already handled.
> 
> Yet then can't we leverage that deviation to also make the other two
> covered:
> 
> #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
> #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))
> 
> Arguable that's ...

Jan is asking why ID2COOKIE and COOKIE2ID are considered safe, while
COOKIE2MCTE and MCTE2COOKIE are not. I think the reason is that
ID2COOKIE and COOKIE2ID convert to/from unsigned long and that falls
under the other deviation we already have:

-doc_begin="The conversion from a pointer to an incomplete type to 
unsigned long does not lose any information, provided that the target 
type has enough bits to store it."
-config=MC3A2.R11.2,casts+={safe,
   "from(type(any()))
    &&to(type(canonical(builtin(unsigned long))))
    &&relation(definitely_preserves_value)"

On the other hand COOKIE2MCTE and MCTE2COOKIE convert to/from another
pointer type, so they don't fall under the same deviation.


> >> --- a/docs/misra/deviations.rst
> >> +++ b/docs/misra/deviations.rst
> >> @@ -324,6 +324,12 @@ Deviations related to MISRA C:2012 Rules:
> >>         semantics that do not lead to unexpected behaviour.
> >>       - Tagged as `safe` for ECLAIR.
> >>
> >> +   * - R11.2
> >> +     - Certain pointers point to incomplete types purposely so that 
> >> they
> >> +       are impossible to dereference.
> >> +     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
> >> +       mctelem_cookie \*.
> >> +
> > 
> > I think here (or above in the deviation text) the concern raised by the 
> > rationale of the rule should be addressed; namely, the rule states: 
> > "Conversions shall not be performed between a pointer to an incomplete 
> > type and any other type" because the resulting pointer might be 
> > misaligned, therefore there should be an argument as to why such thing 
> > is not possible.

I think the explanation would be that it is OK to have misaligned pointers
because they cannot be dereferenced by design.

