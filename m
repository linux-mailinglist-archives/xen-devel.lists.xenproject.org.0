Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701B4F8137
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300824.513217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSiP-0005kc-GB; Thu, 07 Apr 2022 14:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300824.513217; Thu, 07 Apr 2022 14:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSiP-0005ht-D4; Thu, 07 Apr 2022 14:02:25 +0000
Received: by outflank-mailman (input) for mailman id 300824;
 Thu, 07 Apr 2022 14:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6u3=UR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1ncSiN-0005hn-9r
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:02:23 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 575af1c8-b67b-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 16:02:21 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id E16AA18000B1
 for <xen-devel@lists.xenproject.org>; Thu,  7 Apr 2022 10:02:19 -0400 (EDT)
Received: from mail-oa1-f47.google.com (unknown [10.20.151.185])
 by mta-07.privateemail.com (Postfix) with ESMTPA id BC37118000AF
 for <xen-devel@lists.xenproject.org>; Thu,  7 Apr 2022 10:02:19 -0400 (EDT)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso6492054fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 07:02:19 -0700 (PDT)
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
X-Inumbo-ID: 575af1c8-b67b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649340139;
	bh=SzxOtn/Gb++owqIsHpnYUSap7PATy85nOiTHURn6tdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BxWgUo00QpDTRc8D8ZPWllANon0ErLTAk+fBLjW9iiTsBHj0ze/iIXsWiVCgAGidA
	 wK5tqLa7XU484vc4jDccZLiZNDySmqugh5SYBMM2cROqsXIF6RcMhJ5Qo+1bdEq94c
	 1FC1CgpWT8qau8ZzuLXY0GXtb5nEP9Jo6NC9f2fXjvSLK1i2JoCmPkCuptZMxsyXb7
	 arSfThWaJXUo1fwsax9mclAU73N4CVrJomG6IPRcZA9Hh8XUQjp6BjyL/FJgnshWMj
	 4OHM5cRMTnkPaFcab/GHRZRxWNWoUIcS6SHipS/8SCy7SyB55CpN73YigUTmdDjmwJ
	 qEPa+N2xRiqig==
X-Gm-Message-State: AOAM5304IcJ63HH2dBwl7sNtrk7UaO4j7fa9ek93NZC6b0kiGv7D0Zv/
	1YkRZMKWNiqt6nah1Ta/qWePhMmTwLbuAMIUP58=
X-Google-Smtp-Source: ABdhPJxPq3j73QSJ1DnFSQCmRO9ypvv3D7JPl7N4nRLMQuIoKaU9odjnn/LvGa5RYfjRhUd9uT/To/Jlzlhhi4fid7U=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr6294794oap.9.1649340139116; Thu, 07 Apr
 2022 07:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <d1a7a48fa2d46c6a6cbf8f93926a8839aaba92e3.1649256753.git.tamas.lengyel@intel.com>
 <73e6b45525e1be753d3e243d42ad632bbc5690b0.1649256753.git.tamas.lengyel@intel.com>
 <9f593bdb-d95a-4705-d24a-f8767d69a09f@suse.com> <CABfawhn=-avd30QieqJ9gWsJMegRYcOV23vGvYeQcaoA-Cu-VQ@mail.gmail.com>
 <425d5e65-cf37-6098-074d-0dc1dadda8e2@suse.com>
In-Reply-To: <425d5e65-cf37-6098-074d-0dc1dadda8e2@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 7 Apr 2022 10:01:43 -0400
X-Gmail-Original-Message-ID: <CABfawhm4kH9=7anYnnQmAqFZbPbYJGGb2kxHzugp1othcTL38A@mail.gmail.com>
Message-ID: <CABfawhm4kH9=7anYnnQmAqFZbPbYJGGb2kxHzugp1othcTL38A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/monitor: Add new monitor event to catch all vmexits
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Apr 7, 2022 at 2:01 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.04.2022 20:02, Tamas K Lengyel wrote:
> > On Wed, Apr 6, 2022 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 06.04.2022 16:58, Tamas K Lengyel wrote:
> >>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>> @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >>>          }
> >>>      }
> >>>
> >>> +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> >>> +    {
> >>> +        int rc;
> >>> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> >>> +
> >>> +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
> >>> +        if ( rc < 0 )
> >>> +            goto exit_and_crash;
> >>> +        else if ( rc )
> >>> +            return;
> >>> +    }
> >>> +
> >>>      /* XXX: This looks ugly, but we need a mechanism to ensure
> >>>       * any pending vmresume has really happened
> >>>       */
> >>
> >> A few lines down from here failed VM entry is being handled? Wouldn't
> >> you want to place your code after that? And wouldn't you want to avoid
> >> invoking the monitor for e.g. EXIT_REASON_EXTERNAL_INTERRUPT,
> >> EXIT_REASON_MCE_DURING_VMENTRY, and at least the NMI sub-case of
> >> EXIT_REASON_EXCEPTION_NMI?
> >
> > No, the placement is necessary to be where it is to be able to collect
> > information about all vmexits, no matter the root cause. Failed
> > vmentry & mce during vmentry would be interesting exits to see if we
> > can induce during fuzzing from within the guest (indicating some
> > serious state corruption) while the external interrupt and nmi cases
> > are for the most part just ignored and the fuzz-case restarted, but
> > could be still interesting to collect their frequencies. So in effect,
> > we want to avoid Xen hiding any of the events from the monitoring
> > agent by handling it one way or another and just let the agent decide
> > what to do next. We most certainly want to avoid Xen crashing the VM
> > for us.
>
> Okay, I can accept this reasoning. But then don't you need to move
> your code _up_, ahead of an earlier "return" (i.e. immediately after
> IRQ enabling)?

I was considering that but that crash+return condition I don't think
is possible to actually reach. It's on a path when the CPU doesn't
have #VE support and the EPT_POINTER is not found in the altp2m list.
There is no possible way for that condition to occur AFAICT. When no
#VE is available and the guest is allowed to use VMFUNC (ie not
altp2m-external-only mode) it gets emulated and the EPT_POINTER is set
by p2m_switch_vcpu_altp2m_by_id which sanity checks that the idx being
switched to is found in the altp2m list. So the guest can't switch
itself to an invalid EPT_POINTER. When the toolstack switches altp2m
it does the same validation after pausing the domain. Again, no way to
switch to an invalid altp2m. When an altp2m view is getting destroyed
by the toolstack it errors out if there are any vCPUs still using that
view, so no way for the vCPU to be stuck with a stale altp2m view
that's now invalid.

> Also may I ask that you transform your reasoning into
> some form of a code comment?

Sure, I can do that.

Tamas

