Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9115BCD10
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408728.651559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGmA-0000kh-TD; Mon, 19 Sep 2022 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408728.651559; Mon, 19 Sep 2022 13:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGmA-0000i7-Q5; Mon, 19 Sep 2022 13:25:30 +0000
Received: by outflank-mailman (input) for mailman id 408728;
 Mon, 19 Sep 2022 13:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ik4Y=ZW=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1oaGm8-0000i1-OK
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:25:28 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861f9f31-381e-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 15:25:27 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id e81so23083971ybb.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 06:25:27 -0700 (PDT)
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
X-Inumbo-ID: 861f9f31-381e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hHA46XAy9IS/HsZ7WagEcP60CX98wkXEL3EQg41vkvI=;
        b=o9YIwa5J3twi0Y2vLSCntQ1ToAkk/yZh1vhdozJ7RsZukizFRC2kOXze6a5nG2moO4
         q2p5aD7x7ExRMmQww2953KNQMHJ+lkDGVCR01tjqJnazioip66V5ev+dYjlIzeOPQbyS
         GJDU3t8CDWf72lwY+MhMWxjQDB8TUmqrEU2ie1W0jvezem2MNMgOwc8NtE80CGp4o8+U
         dUfmSmpm4EDYibEW26eBqNtHLnBWMzVxqrWvjBHLuwxYsTR144hJBiR/u65IOpaFfPfa
         yGIfCUpA1e7JZ8+1UnhEGu3ChJ1+zzLSgqTf85O40lkgCk6/wztd5Oxj6gX6C16Wb5v7
         lW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hHA46XAy9IS/HsZ7WagEcP60CX98wkXEL3EQg41vkvI=;
        b=GkB8MXMJ2/v2FU7llwHy73nKBhL/XNFyWAmdOKpVVJVkP0at9kWbvHmuuMEjIzx4e4
         Z/g6+7M5BVzLZymVvtvTkICI8/fh5NBG/bAbRwIkz6FucD73uRvV3cIEXNxOzzvTQwl/
         wEiyG6Ho5qCHv0i3xo+qOaStK9TGpA9tAmzC5Z+Xi4yv17Jtl9UiLkFKlYdOQEkwT+iC
         A67HNDC11tIVEin4yTY9QUjylJkO6ksDczVFMk1qJgHeb9jtxn+T/6MuiIQqbcxmaDbP
         +yDrRNtGqbiUwCHfDbRYsKTIchlIFQUo01vsPG+GvlzfkvlFfzNhTAkm+aFmB0alYwW0
         CKRQ==
X-Gm-Message-State: ACrzQf2WgRq58iS2v39jaQg779x1ToVKo6ILkyXpzdtLaNM1NRQ0Nr+N
	Z4Qcyw4Dg706YEjt36HCNxkQA2fRWV0dEVxbK8Y=
X-Google-Smtp-Source: AMsMyM7fJfoJSdJGOhLEO3Gr0fCPs0DukInMNVx4S0VKeDTIJhfuApyZQj8dcf4H2Uy6GEBKhfSidsbV0MPbPIIbxa0=
X-Received: by 2002:a25:2554:0:b0:6ae:af3f:4137 with SMTP id
 l81-20020a252554000000b006aeaf3f4137mr14550006ybl.230.1663593926408; Mon, 19
 Sep 2022 06:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com> <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com> <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
In-Reply-To: <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 19 Sep 2022 09:24:52 -0400
Message-ID: <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 19.09.2022 14:25, Tamas K Lengyel wrote:
> > On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 16.09.2022 23:35, Boris Ostrovsky wrote:
> >>>
> >>> On 9/16/22 8:52 AM, Jan Beulich wrote:
> >>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
> >>>>> While experimenting with the vPMU subsystem an ASSERT failure was
> >>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
> >>>>>
> >>>>> The root cause of the bug appears to be the fact that the vPMU subsystem
> >>>>> doesn't save its state on context_switch.
>
> For the further reply below - is this actually true? What is the
> vpmu_switch_from() (resolving to vpmu_save()) doing then early
> in context_switch()?
>
> >>>>> The vpmu_load function will attempt
> >>>>> to gather the PMU state if its still loaded two different ways:
> >>>>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
> >>>>>      2. if the current pcpu had another vcpu active before doing a local save
> >>>>>
> >>>>> However, in case the prev vcpu is being rescheduled on another pcpu its state
> >>>>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
> >>>>> ASSERT. The only way to avoid this race condition is to make sure the
> >>>>> prev vcpu is paused while being checked and its context saved. Once the prev
> >>>>> vcpu is resumed and does #1 it will find its state already saved.
> >>>> While I consider this explanation plausible, I'm worried:
> >>>>
> >>>>> --- a/xen/arch/x86/cpu/vpmu.c
> >>>>> +++ b/xen/arch/x86/cpu/vpmu.c
> >>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
> >>>>>           vpmu = vcpu_vpmu(prev);
> >>>>>
> >>>>>           /* Someone ran here before us */
> >>>>> +        vcpu_pause(prev);
> >>>>>           vpmu_save_force(prev);
> >>>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>>>> +        vcpu_unpause(prev);
> >>>>>
> >>>>>           vpmu = vcpu_vpmu(v);
> >>>>>       }
> >>>> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
> >>>> to actually be de-scheduled. Even with IRQs on this is already a
> >>>> relatively heavy operation (also including its impact on the remote
> >>>> side). Additionally the function is called from context_switch(), and
> >>>> I'm unsure of the usability of vcpu_pause() on such a path. In
> >>>> particular: Is there a risk of two CPUs doing this mutually to one
> >>>> another? If so, is deadlocking excluded?
> >>>>
> >>>> Hence at the very least I think the description wants extending, to
> >>>> discuss the safety of the change.
> >>>>
> >>>> Boris - any chance you could comment here? Iirc that's code you did
> >>>> introduce.
> >>>
> >>>
> >>> Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)?
> >>
> >> You cannot safely check for "running", as "runnable" may transition
> >> to/from "running" behind your back.
> >
> > The more I look at this the more I think the only sensible solution is
> > to have the vPMU state be saved on vmexit for all vCPUs.
>
> Do you really mean vmexit? It would suffice if state was reliably
> saved during context-switch-out, wouldn't it? At that point the
> vCPU can't be resumed on another pCPU, yet.
>
> > That way all
> > this having to figure out where and when a context needs saving during
> > scheduling goes away. Yes, it adds a bit of overhead for cases where
> > the vCPU will resume on the same pCPU and that context saved could
> > have been skipped,
>
> If you really mean vmexit, then I'm inclined to say that's more
> than just "a bit of overhead". I'd agree if you really meant
> context-switch-out, but as said further up it looks to me as if
> that was already occurring. Apparently I'm overlooking something
> crucial ...

Yes, the current setup is doing exactly that, saving the vPMU context
on context-switch-out, and that's where the ASSERT failure occurs
because the vCPU it needs to save the context for is already runnable
on another pCPU.

Tamas

