Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57E39359A
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 20:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133653.249049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmL5g-0006Kl-Mn; Thu, 27 May 2021 18:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133653.249049; Thu, 27 May 2021 18:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmL5g-0006HE-JF; Thu, 27 May 2021 18:50:44 +0000
Received: by outflank-mailman (input) for mailman id 133653;
 Thu, 27 May 2021 18:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6G6c=KW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lmL5f-0006H8-HB
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 18:50:43 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8374b7eb-bbfb-4935-8818-f8c9c4bb03bd;
 Thu, 27 May 2021 18:50:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a5so1672538lfm.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 11:50:42 -0700 (PDT)
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
X-Inumbo-ID: 8374b7eb-bbfb-4935-8818-f8c9c4bb03bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8vkRK1ysi9oz2J8sQbxFxjgnrymhPWsDN9BwEBGs0JQ=;
        b=BJCetQx65Trk2xHWwgxIg6ZyK4iyc6qUO7CI9v2noUs43Se0eRzztX+viUzdar3h/p
         gqqLe0REmYPGmFk9fueTR/E8T1iSwEN4N0F5uJYXNW3kitm22mR90onYsHfiomzGUG1K
         aR5D65ApZ4/Gs/nqwuHg1oKgjQZHRSBItrXMyrjJc+ndq/sV654d+TEgV9wMWy/Z47MT
         vr9uaHAK3hK06WYOpda3yufF+Zo9eTwd9Gx/CC7d3kEVFmYs1af1dUFyX9Yufo3f2IGA
         OzQ7UrruvJWwwcD4QidF+1R4K9SX0dV7uxVj2zcz++e1teeVxg7XqhB2pDZdnBtuUwAW
         WkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8vkRK1ysi9oz2J8sQbxFxjgnrymhPWsDN9BwEBGs0JQ=;
        b=VVzutEQ1gWwyTbB4X868LAYoKL6Ictqo92NLcRL2GTr+eNCDGSjSpzXrmFumukvbvr
         ldg2ze7rMcXOV4njn5HaZM6h/nQSZGed4pdMR/BEvjw8hzUBzbG3wWUnlOblorDwMwhV
         gGaHNUCIzkZHOqVz5px3fFmzjM+nyC/lP1uTQZkMNwzX3dxLZ5rTi9IrMuXoKp9dVarr
         CS7yOYPMbRlhM/HaRpp/23tphDdaIxykOWubb6MTgt+nju77TnHmE0l9uKfLn32OVepx
         28CKBkK0Y7cp8Se1wDBBCrleS7frn9P0o60Ijl+7Pg9HMM8qbGjYAxL8tnkF55OtAVZ/
         nfIg==
X-Gm-Message-State: AOAM530ADeloM42LIO3paLLI0mEHCwyr6Zt8r65Z/JyOf8T1spMgLe/s
	BOEpJIheeqU8M67oZx+LNxvBWRXG8k1DfBqS4ig=
X-Google-Smtp-Source: ABdhPJwihvcy6Ob6IkrKflseRiTrKCTQNqj9LdJzCgDDvv9bqwJfzNu99sN2UTJ1qU9rRVat0G6O+xYNGFeO+pc2CvU=
X-Received: by 2002:a05:6512:38cd:: with SMTP id p13mr3114755lft.419.1622141440940;
 Thu, 27 May 2021 11:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-5-jandryuk@gmail.com>
 <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
In-Reply-To: <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 27 May 2021 14:50:29 -0400
Message-ID: <CAKf6xps4NuBxMpgCo_duWU1ZXB8x8B8uszb3uNyb6kABxUhNHA@mail.gmail.com>
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 11:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:28, Jason Andryuk wrote:
> > If HWP Energy_Performance_Preference isn't supported, the code falls
> > back to IA32_ENERGY_PERF_BIAS.  Right now, we don't check
> > CPUID.06H:ECX.SETBH[bit 3] before using that MSR.
>
> May I ask what problem there is doing so?
>
> >  The SDM reads like
> > it'll be available, and I assume it was available by the time Skylake
> > introduced HWP.
>
> The SDM documents the MSR's presence back to at least Nehalem, but ties
> it to the CPUID bit even there.

Your point about inconsistent virtualized environments is something I
hadn't considered.  I will add a check, but I will make hwp disable in
that case.  While it could run just without an energy/performance
preference, HWP doesn't seem useful in that scenario.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1355,6 +1355,15 @@ Specify whether guests are to be given access to physical port 80
> >  (often used for debugging purposes), to override the DMI based
> >  detection of systems known to misbehave upon accesses to that port.
> >
> > +### hwp (x86)
> > +> `= <boolean>`
> > +
> > +> Default: `true`
> > +
> > +Specifies whether Xen uses Hardware-Controlled Performance States (HWP)
> > +on supported Intel hardware.  HWP is a Skylake+ feature which provides
> > +better CPU power management.
>
> Is there a particular reason giving this a top-level option rather
> than a sub-option of cpufreq=?

I will investigate.

Below, I'm trimming everything where I will just make the changes
according to your earlier email.

> > +    };
> > +    union hwp_request curr_req;
> > +    uint16_t activity_window;
> > +    uint8_t minimum;
> > +    uint8_t maximum;
> > +    uint8_t desired;
> > +    uint8_t energy_perf;
> > +};
> > +struct hwp_drv_data *hwp_drv_data[NR_CPUS];
>
> New NR_CPUS-dimensioned arrays need explicit justification. From
> what I get I can't see why this couldn't be per-CPU data instead.
>
> Also - static?

I followed acpi-cpufreq with the NR_CPUS array.  per-cpu makes sense
and I'll investigate.

> > +    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
> > +                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
> > +    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
> > +    {
> > +        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
> > +            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
> > +
> > +        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);
>
> Missing "else" above here?

Are unbalanced braces acceptable or must they be balanced?  Is this acceptable:
if ()
  one;
else {
  two;
  three;
}

> > +static void hdc_set_pkg_hdc_ctl(bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
>
> I'm not convinced of the need of having such log messages after
> failed rdmsr/wrmsr, but I'm definitely against them getting logged
> unconditionally. In verbose mode, maybe.

We should not fail the rdmsr if our earlier cpuid check passed.  So in
that respect these messages can be removed.  The benefit here is that
you can see which MSR failed.  If you relied on extable_fixup, you
would have to cross reference manually.  How will administors know if
hwp isn't working properly there are no messages?

For HWP in general, the SDM says to check CPUID for the availability
of MSRs.  Therefore rdmsr/wrmsr shouldn't fail.  During development, I
saw wrmsr failures when with "Valid Maximum" and other "Valid" bits
set.  I think that was because I hadn't set up the Package Request
MSR.  That has been fixed by not using those bits.  Anyway,
rdmsr/wrmsr shouldn't fail, so how much code should be put into
checking for those failures which shouldn't happen?

My sample size is 2 models of processor, so verbose reporting of
errors makes some sense during wider deployment and testing.

> > +        return;
> > +    }
> > +
> > +    msr = val ? IA32_PKG_HDC_CTL_HDC_PKG_Enable : 0;
>
> If you don't use the prior value, why did you read it? But I
> think you really mean to set/clear just bot 0.

During development I printed the initial values .  I removed the
printing before submission but not the reading.

In the SDM, It says "Bits 63:1 are reserved and must be zero", so I
intended to only write 0 or 1.  Below, you remark on not discarding
reserved bits. So you want all of these to be read-modify-write
operations?

> > +static void hdc_set_pm_ctl1(bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
> > +    {
> > +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
> > +
> > +        return;
> > +    }
> > +
> > +    msr = val ? IA32_PM_CTL1_HDC_Allow_Block : 0;
>
> Same here then, and ...
>
> > +static void hwp_fast_uncore_msrs_ctl(bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
> > +        hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL)\n");
> > +
> > +    msr = val;
>
> ... here (where you imply bit 0 instead of using a proper
> constant).
>
> Also for all three functions I'm not convinced their names are
> in good sync with their parameters being boolean.

Would you prefer something named closer to the bit names like:
hdc_set_pkg_hdc_ctl -> hdc_set_pkg_enable
hdc_set_pm_ctl1 -> hdc_set_allow_block
hwp_fast_uncore_msrs_ctl -> hwp_fast_request_enable

> > +static void hwp_read_capabilities(void *info)
> > +{
> > +    struct cpufreq_policy *policy = info;
> > +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
> > +
> > +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
> > +                policy->cpu);
> > +
> > +        return;
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
> > +
> > +        return;
> > +    }
> > +}
>
> This function doesn't indicate failure to its caller(s), so am I
> to understand that failure to read either ofthe MSRs is actually
> benign to the driver?

They really shouldn't fail since the CPUID check passed during
initialization.  If you can't read/write MSRs, something is broken and
the driver cannot function.  The machine would still run, but HWP
would be uncontrollable.  How much care should be given to
"impossible" situations?

> > +    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
> > +
> > +        return;
> > +    }
> > +
> > +    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
> > +    if ( val != IA32_PM_ENABLE_HWP_ENABLE )
> > +    {
> > +        val = IA32_PM_ENABLE_HWP_ENABLE;
>
> You should neither depend on reserved bits being zero, nor discard any
> non-zero value here, I think.

Ok.

> > +static void hwp_write_request(void *info)
> > +{
> > +    struct cpufreq_policy *policy = info;
> > +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
> > +    union hwp_request hwp_req = data->curr_req;
> > +
> > +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
>
> ITYM
>
>     BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw));
>
> here?

Originally, I wanted this to live next to the union definition.
However, BUILD_BUG_ON needs to live in a function, so I placed it here
where it is used.

I'd prefer
    BUILD_BUG_ON(sizeof(hwp_req) != sizeof(uint64_t))

to make the comparison to 64bit, the size of the MSR, explicit.

> > +    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
> > +    {
> > +        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n",
> > +                policy->cpu, hwp_req.raw);
> > +        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);
>
> What if this one fails, too? data->curr_req.raw then pretty certainly
> ends up stale.

It would be stale, but I think this is unlikely.  rdmsr should not
fail given our earlier CPUID checks.  wrmsr could fail if you set
something wrong.  During testing I set some of the valid
"Maximum/Minimum" bits (now unused) that cause wrmsr to fault when
some other MSR (maybe IA32_HWP_REQUEST_PKG) wasn't set.

> > +    policy->governor = &hwp_cpufreq_governor;
> > +
> > +    data = xzalloc(typeof(*data));
>
> Commonly we specify the type explicitly in such cases, rather than using
> typeof(). I will admit though that I'm not entirely certain which one's
> better. But consistency across the code base is perhaps preferable for
> the time being.

I thought typeof(*data) is always preferable since it will always be
the matching type.  I can change it, but I feel like it's a step
backwards.

> > +    if ( !data )
> > +        return -ENOMEM;
>
> Is it correct to have set the governor before this error check?

I will re-order.

> > +    hwp_drv_data[cpu] = data;
> > +
> > +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> > +
> > +    data->minimum = data->hw_lowest;
> > +    data->maximum = data->hw_highest;
> > +    data->desired = 0; /* default to HW autonomous */
> > +    if ( feature_hwp_energy_perf )
> > +        data->energy_perf = 0x80;
> > +    else
> > +        data->energy_perf = 7;
>
> Where's this 7 coming from? (You do mention the 0x80 at least in the
> description.)

When HWP energy performance preference is unavailable, it falls back
to IA32_ENERGY_PERF_BIAS with a 0-15 range.  Per the SDM Vol3 14.3.4,
"A value of 7 roughly translates into a hint to balance performance
with energy consumption."  I will add a comment.

> > --- a/xen/include/asm-x86/msr-index.h
> > +++ b/xen/include/asm-x86/msr-index.h
> > +#define MSR_IA32_HWP_CAPABILITIES           0x00000771
> > +#define MSR_IA32_HWP_REQUEST                0x00000774
> > +
> >  #define MSR_PASID                           0x00000d93
> >  #define  PASID_PASID_MASK                   0x000fffff
> >  #define  PASID_VALID                        (_AC(1, ULL) << 31)
> >
> > +#define MSR_IA32_PKG_HDC_CTL                0x00000db0
> > +#define  IA32_PKG_HDC_CTL_HDC_PKG_Enable    (_AC(1, ULL) <<  0)
>
> I don't think "HDC" twice is helpful?

I took the MSR name "IA32_PKG_HDC_CTL" and bit name "HDC_PKG_Enable"
from the SDM.  I intentionally left the case to match the SDM.

> Also please use all upper case names (actually also for the
> CPUID constants higher up).

Again, I took them straight from the SDM.

I will make them all upper case and switch
IA32_PKG_HDC_CTL_HDC_PKG_Enable to IA32_PKG_HDC_CTL_PKG_Enable.

Regards,
Jason

