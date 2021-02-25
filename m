Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3A32491F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 04:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89578.168824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF6z3-00041O-EO; Thu, 25 Feb 2021 03:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89578.168824; Thu, 25 Feb 2021 03:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF6z3-00040z-BJ; Thu, 25 Feb 2021 03:06:33 +0000
Received: by outflank-mailman (input) for mailman id 89578;
 Thu, 25 Feb 2021 03:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSAw=H3=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lF6z1-00040u-ME
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 03:06:31 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2e68272-1894-4762-a4be-1e13466ee263;
 Thu, 25 Feb 2021 03:06:29 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 204so4391038qke.11
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 19:06:29 -0800 (PST)
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
X-Inumbo-ID: a2e68272-1894-4762-a4be-1e13466ee263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ai1cUfVdonYiS+yKckY6wyi52bQ7eo+jWsOtCYDe1hY=;
        b=BwaTq2psWKWHEGCiWWdHJzqA8HIcJbXLCAh3yIBNOn1tQIMhDAYMidqZPisookO/1u
         pBmPSEXEtoB5AxX9foCM+nLGa//usa+mpA7N7QZm4/QaPNp7Et9jT2zABWdYi5aS0oEU
         Va4O95H7QYIX6XdgPmUtMAt5aswyCQqgTziItvDX6dMXmqCZ6wEw8J33Ai4QjVRvARfN
         8dAn2naQfHkCFWmJ4E46vgS8g8pkJ6q9w7dd3nwUHqwrOHK+6lB/2KcalUOMsx3n3oDq
         71Q8jZsZp9cPjTH62MGMql+YWkxIDPbCwCk0ahOR9n04J1pAj5d5F5kEVv4roVddunei
         9WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ai1cUfVdonYiS+yKckY6wyi52bQ7eo+jWsOtCYDe1hY=;
        b=pefxBuY7GWn7fJjhn2vArY948GGA4V3rujxfKCk8zsywdFrZz7/YLuIrjSr+BOThF4
         oKyTAR6P7TYfIB7fbhjLE/+tyIfhluiCpQpZ+hvKPJthJp7EECG3OMKi+hKPzR5BVCe1
         6WIK73poqAW1Xze1eyHr5MxAg0/nU3FvOZ2FjjKFrT/KMtL8AUFQjDIBACjd0y1tsXmV
         8OyjhTvrrXZnY3aUhpY6BhBjn/jyYNFIloyDR75Q4FZ3rRg5TQpSw9LDdsA4P/4SRYy/
         upO+Mz8NALfstY0wvaX/DY6wuuMElNkSfd5eE4ShfY1UNC/LPSXbWc+A1bE/xMx0o/pW
         6vpg==
X-Gm-Message-State: AOAM532n1FXeKC/2hUe+mHW6q9tCw1HQ6ogA3DoZWcY0XQscg9nxfymV
	JKtOlDbNqSzlH8og+ObE/jIW1UZJFTm5t1COxIUD+g==
X-Google-Smtp-Source: ABdhPJyTRfFjefFavK3uGJQ1vHwPumrW4MminednwFrKaNwrlTS1n6t1ULZCj1iO4z3RDkAO5+tjp1QR/RSjkrqNs+A=
X-Received: by 2002:a05:620a:22f:: with SMTP id u15mr1008834qkm.22.1614222389433;
 Wed, 24 Feb 2021 19:06:29 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com> <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com> <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
In-Reply-To: <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 24 Feb 2021 19:06:25 -0800
Message-ID: <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=BCrgen!

sorry for the belated reply -- I wanted to externalize the VM before I
do -- but let me at least reply to you:

On Tue, Feb 23, 2021 at 5:17 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
>
> On 18.02.21 06:21, Roman Shaposhnik wrote:
> > On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com
> > <mailto:jgross@suse.com>> wrote:
> >
> >     On 17.02.21 09:12, Roman Shaposhnik wrote:
> >      > Hi J=C3=BCrgen, thanks for taking a look at this. A few comments=
 below:
> >      >
> >      > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross@s=
use.com
> >     <mailto:jgross@suse.com>> wrote:
> >      >>
> >      >> On 16.02.21 21:34, Stefano Stabellini wrote:
> >      >>> + x86 maintainers
> >      >>>
> >      >>> It looks like the tlbflush is getting stuck?
> >      >>
> >      >> I have seen this case multiple times on customer systems now, b=
ut
> >      >> reproducing it reliably seems to be very hard.
> >      >
> >      > It is reliably reproducible under my workload but it take a long=
 time
> >      > (~3 days of the workload running in the lab).
> >
> >     This is by far the best reproduction rate I have seen up to now.
> >
> >     The next best reproducer seems to be a huge installation with sever=
al
> >     hundred hosts and thousands of VMs with about 1 crash each week.
> >
> >      >
> >      >> I suspected fifo events to be blamed, but just yesterday I've b=
een
> >      >> informed of another case with fifo events disabled in the guest=
.
> >      >>
> >      >> One common pattern seems to be that up to now I have seen this
> >     effect
> >      >> only on systems with Intel Gold cpus. Can it be confirmed to be=
 true
> >      >> in this case, too?
> >      >
> >      > I am pretty sure mine isn't -- I can get you full CPU specs if
> >     that's useful.
> >
> >     Just the output of "grep model /proc/cpuinfo" should be enough.
> >
> >
> > processor: 3
> > vendor_id: GenuineIntel
> > cpu family: 6
> > model: 77
> > model name: Intel(R) Atom(TM) CPU  C2550  @ 2.40GHz
> > stepping: 8
> > microcode: 0x12d
> > cpu MHz: 1200.070
> > cache size: 1024 KB
> > physical id: 0
> > siblings: 4
> > core id: 3
> > cpu cores: 4
> > apicid: 6
> > initial apicid: 6
> > fpu: yes
> > fpu_exception: yes
> > cpuid level: 11
> > wp: yes
> > flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t
> > pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp
> > lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
> > nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx es=
t
> > tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer
> > aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp
> > tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm ida
> > arat md_clear
> > vmx flags: vnmi preemption_timer invvpid ept_x_only flexpriority
> > tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
> > bugs: cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
> > bogomips: 4800.19
> > clflush size: 64
> > cache_alignment: 64
> > address sizes: 36 bits physical, 48 bits virtual
> > power management:
> >
> >      >
> >      >> In case anybody has a reproducer (either in a guest or dom0) wi=
th a
> >      >> setup where a diagnostic kernel can be used, I'd be _very_
> >     interested!
> >      >
> >      > I can easily add things to Dom0 and DomU. Whether that will
> >     disrupt the
> >      > experiment is, of course, another matter. Still please let me
> >     know what
> >      > would be helpful to do.
> >
> >     Is there a chance to switch to an upstream kernel in the guest? I'd=
 like
> >     to add some diagnostic code to the kernel and creating the patches =
will
> >     be easier this way.
> >
> >
> > That's a bit tough -- the VM is based on stock Ubuntu and if I upgrade
> > the kernel I'll have fiddle with a lot things to make workload
> > functional again.
> >
> > However, I can install debug kernel (from Ubuntu, etc. etc.)
> >
> > Of course, if patching the kernel is the only way to make progress --
> > lets try that -- please let me know.
>
> I have found a nice upstream patch, which - with some modifications - I
> plan to give our customer as a workaround.
>
> The patch is for kernel 4.12, but chances are good it will apply to a
> 4.15 kernel, too.

I'm slightly confused about this patch -- it seems to me that it needs
to be applied to the guest kernel, correct?

If that's the case -- the challenge I have is that I need to re-build
the Canonical (Ubuntu) distro kernel with this patch -- this seems
a bit daunting at first (I mean -- I'm pretty good at rebuilding kernels
I just never do it with the vendor ones ;-)).

So... if there's anyone here who has any suggestions on how to do that
-- I'd appreciate pointers.

> I have been able to gather some more data.
>
> I have contacted the author of the upstream kernel patch I've been using
> for our customer (and that helped, by the way).
>
> It seems as if the problem is occurring when running as a guest at least
> under Xen, KVM, and VMWare, and there have been reports of bare metal
> cases, too. Hunting this bug is going on for several years now, the
> patch author is at it since 8 months.
>
> So we can rule out a Xen problem.
>
> Finding the root cause is still important, of course, and your setup
> seems to have the best reproduction rate up to now.
>
> So any help would really be appreciated.
>
> Is the VM self contained? Would it be possible to start it e.g. on a
> test system on my side? If yes, would you be allowed to pass it on to
> me?

I'm working on externalizing the VM in a way that doesn't disclose anything
about the customer workload. I'm almost there -- sans my question about
the vendor kernel rebuild. I plan to make that VM available this week.

Goes without saying, but I would really appreciate your help in chasing thi=
s.

Thanks,
Roman.

