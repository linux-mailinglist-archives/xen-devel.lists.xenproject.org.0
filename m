Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEECA3AB29
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 22:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892261.1301257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkVHM-0003to-Tu; Tue, 18 Feb 2025 21:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892261.1301257; Tue, 18 Feb 2025 21:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkVHM-0003sN-QX; Tue, 18 Feb 2025 21:37:20 +0000
Received: by outflank-mailman (input) for mailman id 892261;
 Tue, 18 Feb 2025 21:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkVHL-0003sH-Nv
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 21:37:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83bdc0da-ee40-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 22:37:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D80B75C6155;
 Tue, 18 Feb 2025 21:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032DDC4CEE2;
 Tue, 18 Feb 2025 21:37:10 +0000 (UTC)
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
X-Inumbo-ID: 83bdc0da-ee40-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739914631;
	bh=3f679bOD5mGHYjz004KOjMI2Tgw+he8WBOWH0z4iP7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oNWq+134TBN/11p/gPHCKnkHKSw9KB653/1W2kah11wvRYwtalqGpor0XEn+UzIO9
	 +SzKVv1epWvsRLMalyPkcXJX81663fP+FeU1zKY9B2ncMSZG6oRx1SjfgV01LcHUek
	 dgETqFijxtqLAfRBbIWkpfCaSXSBqhViM2Ha60VqOMmWdCxRFHnnxMA8HQ4FR80744
	 hSKtX9xDuMIEX36131ABTGei/Ik/vXkdFiNk60Uqoy6deoNWZK8b8RWSmejD6/nRUa
	 l3lfFIv85AIpHb0uO6ZzE+4SHqhdSjvRx7Pp4ZKg7FiDMoB1Ps/jTWhHqfv2XJaXIx
	 PbuxCyGD2RHiA==
Date: Tue, 18 Feb 2025 13:37:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <9d966b20-18c4-49ac-8007-95bac3a95b51@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502181330360.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com> <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop> <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com> <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop> <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com> <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com> <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
 <9d966b20-18c4-49ac-8007-95bac3a95b51@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Jan Beulich wrote:
> On 18.02.2025 03:45, Stefano Stabellini wrote:
> > On Mon, 17 Feb 2025, Jan Beulich wrote:
> >> On 15.02.2025 09:59, Nicola Vetrini wrote:
> >>> On 2025-02-15 00:04, Stefano Stabellini wrote:
> >>>> On Fri, 14 Feb 2025, Jan Beulich wrote:
> >>>>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
> >>>>>
> >>>>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
> >>>>> well.
> >>>>
> >>>> I wrote this patch. Nicola, can you please check the changes to
> >>>> deviations.ecl, this is the first time I try to write the deviation
> >>>> myself :-)
> >>>>
> >>>> ---
> >>>> misra: add 11.2 deviation for incomplete types
> >>>>
> >>>> struct mctelem_cookie* is used exactly because it is an incomplete type
> >>>> so the pointer cannot be dereferenced. This is deliberate. So add a
> >>>> deviation for it.
> >>>>
> >>>> In deviations.ecl, add the list of macros that do the conversions to 
> >>>> and
> >>>> from struct mctelem_cookie*.
> >>>>
> >>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>>
> >>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> >>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>>> index a28eb0ae76..87bfd2160c 100644
> >>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>>> @@ -366,6 +366,14 @@ constant expressions are required.\""
> >>>>  }
> >>>>  -doc_end
> >>>>
> >>>> +-doc_begin="Certain pointers point to incomplete types purposely so 
> >>>> that they are impossible to dereference."
> >>>> +-config=MC3A2.R11.2,reports+={deliberate, 
> >>>> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
> >>>> +-config=MC3A2.R11.2,reports+={deliberate, 
> >>>> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
> >>>> +-config=MC3A2.R11.2,reports+={deliberate, 
> >>>> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
> >>>> +-config=MC3A2.R11.2,reports+={deliberate, 
> >>>> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
> >>>> +}
> >>>
> >>> -config=MC3A2.R11.2,reports+={deliberate, 
> >>> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
> >>>
> >>> Note however that there is also this deviation in place
> >>>
> >>> -doc_begin="The conversion from a pointer to an incomplete type to 
> >>> unsigned long does not lose any information, provided that the target 
> >>> type has enough bits to store it."
> >>> -config=MC3A2.R11.2,casts+={safe,
> >>>    "from(type(any()))
> >>>     &&to(type(canonical(builtin(unsigned long))))
> >>>     &&relation(definitely_preserves_value)"
> >>> }
> >>> -doc_end
> >>>
> >>> I was a bit confused by Jan's remark, which seemed correct, but I 
> >>> couldn't see any violations in the report, so I dug a bit deeper. 
> >>> ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
> >>> excluded due to being safe. If you envision those macros to be used with 
> >>> other types, then your deviation should mention them, otherwise they are 
> >>> already handled.
> >>
> >> Yet then can't we leverage that deviation to also make the other two
> >> covered:
> >>
> >> #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
> >> #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))
> > 
> > Jan is asking why ID2COOKIE and COOKIE2ID are considered safe, while
> > COOKIE2MCTE and MCTE2COOKIE are not. I think the reason is that
> > ID2COOKIE and COOKIE2ID convert to/from unsigned long and that falls
> > under the other deviation we already have:
> > 
> > -doc_begin="The conversion from a pointer to an incomplete type to 
> > unsigned long does not lose any information, provided that the target 
> > type has enough bits to store it."
> > -config=MC3A2.R11.2,casts+={safe,
> >    "from(type(any()))
> >     &&to(type(canonical(builtin(unsigned long))))
> >     &&relation(definitely_preserves_value)"
> > 
> > On the other hand COOKIE2MCTE and MCTE2COOKIE convert to/from another
> > pointer type, so they don't fall under the same deviation.
> 
> And then the adjusted forms suggested above ought to also be covered,
> I would have thought.

I understand your point. I tried it, but it does not work. I do not know
why. Someone with more knowledge of ECLAIR internals than I have might
be able to explain.

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/my-eclair-11.2-4-1/X86_64/9176469474/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}


I suggest we go with this patch instead.

---
misra: add 11.2 deviation for incomplete types

struct mctelem_cookie* is used exactly because it is an incomplete type
so the pointer cannot be dereferenced. This is deliberate. So add a
deviation for it.

In deviations.ecl, add the list of macros that do the conversions to and
from struct mctelem_cookie*.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index a28eb0ae76..d33b777e6a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -366,6 +366,10 @@ constant expressions are required.\""
 }
 -doc_end
 
+-doc_begin="Certain pointers point to incomplete types purposely so that they are impossible to dereference."
+-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
+-doc_end
+
 -doc_begin="Conversions to object pointers that have a pointee type with a smaller (i.e., less strict) alignment requirement are safe."
 -config=MC3A2.R11.3,casts+={safe,
   "!relation(more_aligned_pointee)"
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index fe0b1e10a2..04ffc62f44 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -324,6 +324,13 @@ Deviations related to MISRA C:2012 Rules:
        semantics that do not lead to unexpected behaviour.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.2
+     - Certain pointers point to incomplete types purposely so that they
+       are impossible to dereference, since they cannot be dereferenced,
+       pointers alignments considerations do not apply.
+     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
+       mctelem_cookie \*.
+
    * - R11.2
      - The conversion from a pointer to an incomplete type to unsigned long
        does not lose any information, provided that the target type has enough

