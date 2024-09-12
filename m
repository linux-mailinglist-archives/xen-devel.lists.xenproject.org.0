Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0897747E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 00:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797838.1207900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosXv-0008No-Gx; Thu, 12 Sep 2024 22:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797838.1207900; Thu, 12 Sep 2024 22:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosXv-0008MG-DU; Thu, 12 Sep 2024 22:44:15 +0000
Received: by outflank-mailman (input) for mailman id 797838;
 Thu, 12 Sep 2024 22:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sosXt-0008M5-3a
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 22:44:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8707efd1-7158-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 00:44:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90E2FA458A8;
 Thu, 12 Sep 2024 22:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1496C4CEC6;
 Thu, 12 Sep 2024 22:44:08 +0000 (UTC)
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
X-Inumbo-ID: 8707efd1-7158-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726181049;
	bh=jJB8nfvGTP9u2Ff331LMF3OfyV3VDm7+Xdb3kV2sidw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KUhprOc45+5cfMTgPpqnIdTTsgbjSSdkfx4P/mt7ToEGu1wfDFDWXXIR6QNjOErxk
	 tyoPYWRv5ojAw5p2sj+IpjA+Pd91yUGBZiFcDBnBUV8D5VuF7WWqJ51csQ5iz21yLC
	 eoc6l7Q6N8Z74px62TmC4d0Mh+/j4eFrbZgPrQorZAmLHxrq95rbwUEZ8Ext579KKk
	 +BsvalLoXIGN69GrLnldSJY9+tYAJUY7kxnp4C/bpNT3vDBIb8n7UfmZ4ocbU3EkRQ
	 KD7CVlR99o9aNSBmQL3TqqCYLEjPfDK7TyELsuugEkep11fAcjVP8ZLDZTFdSv1zvQ
	 FYH614zGMl+vg==
Date: Thu, 12 Sep 2024 15:44:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <e2542d65-d5a5-44aa-a90b-ea8dad6a547f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409121540340.611587@ubuntu-linux-20-04-desktop>
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com> <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com> <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop> <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com>
 <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop> <e2542d65-d5a5-44aa-a90b-ea8dad6a547f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Sep 2024, Jan Beulich wrote:
> On 12.09.2024 03:13, Stefano Stabellini wrote:
> > On Tue, 10 Sep 2024, Jan Beulich wrote:
> >> On 10.09.2024 06:57, Stefano Stabellini wrote:
> >>> On Mon, 9 Sep 2024, Jan Beulich wrote:
> >>>> On 05.09.2024 17:48, Alessandro Zucchelli wrote:
> >>>>> This section explains which format should be followed by header
> >>>>> inclusion guards via a drop-down list of rules.
> >>>>>
> >>>>> No functional change.
> >>>>>
> >>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> >>>>>
> >>>>> ---
> >>>>> Changes in v6:
> >>>>> - edit inclusion guards naming conventions, including more details
> >>>>
> >>>> Yet I'm afraid that from my pov we're still not there. Specifically ...
> >>>>
> >>>>> --- a/CODING_STYLE
> >>>>> +++ b/CODING_STYLE
> >>>>> @@ -159,6 +159,34 @@ Emacs local variables
> >>>>>  A comment block containing local variables for emacs is permitted at
> >>>>>  the end of files.  It should be:
> >>>>>  
> >>>>> +Header inclusion guards
> >>>>> +-----------------------
> >>>>> +
> >>>>> +Unless otherwise specified, all header files should include proper
> >>>>> +guards to prevent multiple inclusions. The following naming conventions
> >>>>> +apply:
> >>>>
> >>>> ... reading this, I can't derive ...
> >>>>
> >>>>> +- Private headers: <dir>__<filename>_H
> >>>>> +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> >>>>> +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> >>>>> +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> >>>>
> >>>> ... the absence of an equivalent of the arch/ part of the path. As per
> >>>> my recollection we agreed on that shortening, but it needs spelling out
> >>>> in the textual description. Such that it is possible to derived what to
> >>>> uses as a name for, say, a header under common/, crypto/, or drivers/
> >>>> (or anywhere else of course). Specifically with the further examples ...
> >>>
> >>> Are you asking for something like this?
> >>>
> >>> Omit the word "arch" from the filepath.
> >>>
> >>> If you prefer an alternative wording please suggest the text. 
> >>>
> >>>
> >>>>> +- asm-generic headers: ASM_GENERIC__<filename>_H
> >>>>> +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> >>>>> +
> >>>>> +- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
> >>>>> +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> >>>>
> >>>> ... here and ...
> >>>
> >>> Suggested text:
> >>>
> >>> Omit the words "arch" and "include/asm" from the filepath, ASM is also
> >>> prefixed.
> >>>
> >>>
> >>>>> +- Xen headers: XEN__<filename>_H
> >>>>> +    - include/xen/something.h -> XEN__SOMETHING_H
> >>>>
> >>>> ... here, where more than just one path component is omitted, deriving
> >>>> what's meant can end up ambiguous. Yet ambiguity is what we absolutely
> >>>> want to avoid, to preempt later discussions on any such naming.
> >>>
> >>> Suggested text:
> >>>
> >>> Omit the words "include/xen" from the filepath, XEN is always prefixed.
> >>>
> >>> Please suggest a specific alternative if you prefer
> >>
> >> Looks like I still didn't get across my point: The verbal description
> >> that's ahead of all of the examples should be complete enough to describe
> >> the whole set of rules, in sufficiently abstract terms. Then the examples
> >> will be easy to prove as fitting those rules, and it will be easy to
> >> derive the naming for further identifiers. IOW - no, I'm not asking for
> >> the examples to be further commented, but for the naming rules to be
> >> _fully_ spelled out.
> > 
> > 
> > Hi Jan, we have gone back and forth on this a few times, but neither
> > Alessandro nor I fully understand your perspective. To help streamline
> > the process and save time for everyone, I suggest you provide an example
> > of the rules written in the style you believe is appropriate. Once you
> > set the initial direction, Alessandro and I can continue and complete
> > the rest in that preferred style.
> 
> If you really expect me to do so (hence effectively me becoming the one
> to make the proposal, which I never meant to), it'll have to wait until
> I'm back from the GNU Tools Cauldron and the PTO I'm taking immediately
> afterwards.

It looks like you have specific ideas on how it should be done so I
think it would be better if you provide a couple of complete examples
for a subset of the proposal. For instance, only covering Private
headers: <dir>__<filename>_H.

With that example, I think we can extrapolate the others.

I understand if we need to wait until you are back from PTO.

