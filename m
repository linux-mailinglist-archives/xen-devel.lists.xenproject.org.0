Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE587F618
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695207.1084791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQHw-0006k1-Ts; Tue, 19 Mar 2024 03:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695207.1084791; Tue, 19 Mar 2024 03:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQHw-0006hm-Pi; Tue, 19 Mar 2024 03:37:20 +0000
Received: by outflank-mailman (input) for mailman id 695207;
 Tue, 19 Mar 2024 03:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQHv-0006hc-9c
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:37:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa9fe42e-e5a1-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 04:37:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9442CCE0C06;
 Tue, 19 Mar 2024 03:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDADC433C7;
 Tue, 19 Mar 2024 03:37:12 +0000 (UTC)
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
X-Inumbo-ID: fa9fe42e-e5a1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819433;
	bh=Qp+ceH466MEmTf3psBBUjzqnLdC90VUOgisMKeZ0OEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QlfEh+gzWweaf39N6dW+6DXLFnbbZgQlXn3ScCybA0UbSykhJym5z+wawbt3b+Awb
	 5CDuRI2fqIqYiiXwKUJYQiDbQiE+tK033DDIrCdY0KMei/hh/5tTTW3BLt/QKHGwM5
	 76WenIclII6SMqpeRHkbuajfxg00yS9IN7lRelwOE8rx6R/dK5HHy2aUYThZaT7mZS
	 BMc+qNRyGt7FVo0fJmUnTyfOUyFcCTRjXEvf2jlixU/muYmBhW3Mnrf6qNOLSitdeN
	 sPUDm3pdhYH0z/baY4JECXO/JhFJMUdOKEVw6iNnosBJJwr3n/Kum8ttpOMfm6U1sk
	 XaQ9L7lKUP9cw==
Date: Mon, 18 Mar 2024 21:37:10 -0600 (MDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <7ab73379-b057-4568-9869-141cef185752@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com> <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop> <7ab73379-b057-4568-9869-141cef185752@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Jan Beulich wrote:
> On 16.03.2024 01:07, Stefano Stabellini wrote:
> > On Fri, 15 Mar 2024, Jan Beulich wrote:
> >> On 14.03.2024 23:17, Stefano Stabellini wrote:
> >>> Xen makes assumptions about the size of integer types on the various
> >>> architectures. Document these assumptions.
> >>
> >> My prior reservation wrt exact vs minimum sizes remains.
> > 
> > We have to specify the exact size. In practice the size is predetermined
> > and exact with all our supported compilers given a architecture.
> 
> But that's not the purpose of this document; if it was down to what
> compilers offer, we could refer to compiler documentation (and iirc we
> already do for various aspects). The purpose of this document, aiui,
> is to document assumption we make in hypervisor code. And those should
> be >=, not ==.

Well... I guess the two of us are making different assumptions then :-)

Which is the reason why documenting assumptions is so important. More at
the bottom.


> > Most importantly, unfortunately we use non-fixed-size integer types in
> > C hypercall entry points and public ABIs. In my opinion, that is not
> > acceptable.
> 
> The problem is that I can't see the reason for you thinking so. The C
> entry points sit past assembly code doing (required to do) necessary
> adjustments, if any. If there was no assembly layer, whether to use
> fixed with types for such parameters would depend on what the
> architecture guarantees.

This could be the source of the disagreement. I see the little assembly
code as not important, I consider it just like a little trampoline to
me. As we describe the hypercalls in C header files, I consider the C
functions the "official" hypercall entry points.

Also, as this is an ABI, I consider mandatory to use clear width
definitions of all the types (whether with this document or with
fixed-width types, and fixed-width types are clearer and better) in both
the C header files that describe the ABI interfaces, as well as the C
entry points that corresponds to it. E.g. I think we have to use
the same types in both do_sched_op and the hypercall description in
xen/include/public/sched.h


> As to public ABIs - that's structure definitions, and I agree we ought
> to uniformly use fixed-width types there. We largely do; a few things
> still require fixing.

+1


> > We have two options:
> > 
> > 1) we go with this document, and we clarify that even if we specify
> >   "unsigned int", we actually mean a 32-bit integer
> > 
> > 2) we change all our public ABIs and C hypercall entry points to use
> >    fixed-size types (e.g. s/unsigned int/uint32_t/g)
> > 
> > 2) is preferred because it is clearer but it is more work. So I went
> > with 1). I also thought you would like 1) more.
> 
> For ABIs (i.e. structures) we ought to be making that change anyway.
> Leaving basic types in there is latently buggy.

I am glad we agree :-)

It is just that I also consinder the C hypercall entry points as part of
the ABI


> I'm happy to see a document like this added, for the purpose described
> above. But to me 1) and 2) and largely independent of one another.

Good that you are also happy with a document like this.

The remaining question is: what about the rest of the C functions in Xen
that are certainly not part of an ABI?

Those are less critical, still this document should apply uniformily to
them too. I don't understand why you are making the >= width assumption
you mentioned at the top of the file when actually it is impossible to
exercise or test this assumption on any compiler or any architecture
that works with Xen. If it cannot be enabled, it hasn't been tested, and
it probably won't work.


