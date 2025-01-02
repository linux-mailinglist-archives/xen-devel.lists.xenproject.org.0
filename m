Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862189FFC87
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864341.1275538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOdS-0003TN-5L; Thu, 02 Jan 2025 17:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864341.1275538; Thu, 02 Jan 2025 17:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOdS-0003Rq-2d; Thu, 02 Jan 2025 17:05:26 +0000
Received: by outflank-mailman (input) for mailman id 864341;
 Thu, 02 Jan 2025 17:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTOdQ-0003Rk-CV
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:05:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0163c36-c92b-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 18:05:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2486A4124B;
 Thu,  2 Jan 2025 17:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89764C4CED0;
 Thu,  2 Jan 2025 17:05:18 +0000 (UTC)
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
X-Inumbo-ID: c0163c36-c92b-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735837520;
	bh=tD3X7qmk6X5VY3ilQmZOPe49SWy3E0Pbl7DlfgonAmI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CbPb5Fbe0IFEk/ewqT6OBZmQ3MCesIFXr5nFks0kCiVEV+b0Gbgm+8SnhIVmUh3SR
	 whBDtk+/mfIcT/nPXnmdddmdPIapZJA6Rzfuaz5t3IgnHmERCcZh6KYbZd7eHl3nln
	 I6zwJtHi4KJEcB5+m+21FNghCHR/GftXPnfgONJQYfvWX3ES30oMeUcKE0/3UJBSBN
	 idtUwRYK/BPsOfc5bkwvyOPhxIvpB+OyEzxaAX5QinY9c8V0D6MovYospgInCkxovi
	 G7NPdft+GFZrbq6njYYKcjv0kJ27ujV/LJHkIH3jo6omd13KK8wlToAHIn7uA4A0LW
	 MLpa8iWW4/zZA==
Date: Thu, 2 Jan 2025 09:05:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule R11.8.
In-Reply-To: <d9beec69-a167-4768-9bce-5067ab18f0ad@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501020904270.16425@ubuntu-linux-20-04-desktop>
References: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com> <d312a46a-238a-4fa3-84d7-4836c610c8ea@suse.com> <58439457588e585b08b48931e94754b2@bugseng.com> <d9beec69-a167-4768-9bce-5067ab18f0ad@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Dec 2024, Jan Beulich wrote:
> On 19.12.2024 09:58, Nicola Vetrini wrote:
> > On 2024-12-19 09:49, Jan Beulich wrote:
> >> On 18.12.2024 15:25, Alessandro Zucchelli wrote:
> >>> Rule 11.8 states as following: "A cast shall not remove any `const' or
> >>> `volatile' qualification from the type pointed to by a pointer".
> >>>
> >>> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
> >>> function, where the parameter needs to not be const because it can be
> >>> set for write or not. As it was decided a new const-only function will
> >>> lead to more developer confusion than it's worth, this violation is
> >>> addressed by deviating the function.
> >>> All cases of casting away const-ness are accompanied with a comment
> >>> explaining why it is safe given the other flags passed in; such 
> >>> comment is used
> >>> by the deviation in order to match the appropriate function call.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> >>> ---
> > 
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -393,6 +393,12 @@ Fixing this violation would require to increase 
> >>> code complexity and lower readab
> >>>  
> >>> -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
> >>>  -doc_end
> >>>
> >>> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a 
> >>> double-use
> >>> +function, where the parameter needs to not be const because it can be 
> >>> set for
> >>> +write or not"
> >>> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest 
> >>> doesn't modify.*$)))"}
> >>
> >> This is probably good enough for now, yet still: It constrains 
> >> re-formatting
> >> that we may want to do on such function calls. Personally I'd consider 
> >> it
> >> entirely unexpected if I ended up (re)introducing a violation just by 
> >> re-
> >> formatting one of those function calls to
> >>
> >>     return __hvm_copy(
> >>                (void *)buf /* HVMCOPY_to_guest doesn't modify */,
> >>                addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
> >>                PFEC_page_present | PFEC_write_access | pfec, pfinfo);
> >>
> >> yet aiui the pattern above would have this effect (I don't think .* 
> >> matches
> >> newlines; instead I expect such regex-es to be applied to individual 
> >> lines
> >> only). Thoughts anyone?
> > 
> > we can simply drop the "__hvm_copy" part from the regex. The regex can 
> > be made multiline, or alternatively we can apply the search to a range 
> > of lines. By default it searches on the same location mentioned by the 
> > report, which in this case is the line containing __hvm_copy (range 
> > defaults to 0..0). However I would leave it either as is or without the 
> > __hvm_copy prefix.
> 
> Omitting the __hvm_copy part would again widen it too much for my taste.

I am also OK with the change as it is. However, I would ask that we also
update docs/misra/deviations.rst with the same

