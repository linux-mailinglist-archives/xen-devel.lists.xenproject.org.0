Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3857F84F4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 20:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640913.999718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6cGQ-0006uI-SA; Fri, 24 Nov 2023 19:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640913.999718; Fri, 24 Nov 2023 19:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6cGQ-0006rv-PT; Fri, 24 Nov 2023 19:54:58 +0000
Received: by outflank-mailman (input) for mailman id 640913;
 Fri, 24 Nov 2023 19:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jxba=HF=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1r6cGO-0006rp-Jk
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 19:54:57 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56579fef-8b03-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 20:54:54 +0100 (CET)
Received: from neowutran.ovh (unknown [10.200.200.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 1A03461314;
 Fri, 24 Nov 2023 19:54:51 +0000 (UTC)
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
X-Inumbo-ID: 56579fef-8b03-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1700855691; bh=JCGEcbnOg+lqAGVtLpKvJmG6Ie60g2ZLlxgrqWy2uq4=;
	h=Date:From:To:Cc:Subject:References;
	b=qdx0G55evm7upEtMtCg1DnnmToL3y7iouglADneIfWHvoS46iA1lapQvtEPBVtukA
	 3QbgGw/EJu6ilcoIOO2KiP3pjpoent6yNIv1blqfVnKaLFZ0QHItCcVekdXkfC9rt6
	 xGaMV8qszcb0FNP/W9pRieU5zjBbpeR2M9oraJr/+DXPhzvNey6L+2mMuQCK1StpnN
	 bTIbOY+1HSkSKlmoUZXBH1nYic95aoB7HSCkcByMZM5KOvjDY5+eQtRtA/lbXMPtxs
	 j/QltwknhUsfFd6kj5IZmBFZTJLGdWBaFeeV7d+e8h0kKhV56TwvIG7IraKPj5z+RV
	 1zd5KJ6Qb365+xlrY9My55eCwHfQtjMzFxprEx532ATmycqddYPtIYQ4Q+4JvFanRX
	 vgq8tFqHsPJG19wirZRpT3YVN994GslwM72/VKrSEpn6zaL+A25hvGR9PBfbJR6YIt
	 DBwHbuQeCOBVAUZc5uvNUpsMRLzQt0FCaQ7w+woL2nLFu0SjKqv39wWctA6dFupw+b
	 KvYnsWfJVJipWPypvPoDLEJWsw1dCXswk9io6GRLdJU1SQIg8v7yYhe2ivkfhb9Y9O
	 ODG6I3z1h7SWRUYJy0s6gxf0Dlm6okVoYEMP1Ov6JH1bGFvo0F6unvBQdB62WFKAR9
	 Ape2WbtCBQ4N4XHoMkIi02FA=
Date: Fri, 24 Nov 2023 20:54:35 +0100
From: Neowutran <xen@neowutran.ovh>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Henry Wang <Henry.Wang@arm.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <x4qzfuqkkebjkdfmhw6rvdhrn2ewa6ghjtjqd7xevnuylfahh7@pjratinsg76a>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

Content-D 
isposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>

On 2023-11-18 11:11, Andrew Cooper wrote:
> On 18/11/2023 3:04 am, Elliott Mitchell wrote:
> > On Fri, Nov 17, 2023 at 11:12:37AM +0100, Neowutran wrote:
> >> On 2023-11-07 11:11, Elliott Mitchell wrote:
> >>> On Mon, Oct 30, 2023 at 04:27:22PM +01
> >>>> On Mon, Oct 30, 2023 at 07:50:27AM -0700, Elliott Mitchell wrote:
> >>>>> On Tue, Oct 24, 2023 at 03:51:50PM +0200, Roger Pau Monne wrote:
> >>>>>> diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
> >>>>>> index 707deef98c27..15632cc7332e 100644
> >>>>>> --- a/xen/arch/x86/genapic/x2apic.c
> >>>>>> +++ b/xen/arch/x86/genapic/x2apic.c
> >>>>>> @@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> >>>>>>  static int8_t __initdata x2apic_phys = -1;
> >>>>>>  boolean_param("x2apic_phys", x2apic_phys);
> >>>>>>  
> >>>>>> +enum {
> >>>>>> +   unset, physical, cluster, mixed
> >>>>>> +} static __initdata x2 
apic_mode = unset;
> >>>>>> +
> >>>>>> +static int __init parse_x2apic_mode(const char *s)
> >>>>>> +{
> >>>>>> +    if ( !cmdline_strcmp(s, "physical") )
> >>>>>> +        x2apic_mode = physical;
> >>>>>> +    else if ( !cmdline_strcmp(s, "cluster") )
> >>>>>> +        x2apic_mode = cluster;
> >>>>>> +    else if ( !cmdline_strcmp(s, "mixed") )
> >>>>>> +   
> >>>>>> +    else
> >>>>>> +        return EINVAL;
> >>>>>> +
> >>>>>> +    return 0;
> >>>>>> +}
> >>>>>> +custom_param("x2apic-mode", parse_x2apic_mode);
> >>>>>> +
> >>>>>>  const struct genapic *__init apic_x2apic_probe(void)
> >>>>>>  {
> >>>>>> -    if ( x2apic_phys < 0 )
> >>>>>> +    /* x2apic-mode option has preference over x2apic_phys. */
> >>>>>> +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
> >>>>>> +        x2apic_mode = x2apic_phys ? physical : cluster;
> >>>>>> +
> >>>>>> +    if ( x2apic_mode == unset )
> >>>>>>      {
> >>>>>> -        /*
> >>>>>> -         * Force physical mode if there's no (full) interrupt remapping support:
 
> >>>>>> -         * The ID in clustered mode requires a 32 bit destination field due to
> >>>>>> -         * the usage of the high 16 bits to hold the cluster ID.
> >>>>>> -         */
> >>>>>> -        x2apic_phys = iommu_intremap != iommu_intremap_full ||
> >>>>>> -                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
> >>>>>> -        
> >>>>>> -    }
> >>>>>> -    else if ( !x2apic_phys )
> >>>>>> -        switch ( iommu_intremap )
> >>>>>> +        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
> >>>>>>          {
> >>>>> Could this explain the issues with recent AMD processors/motherboards?
> >>>>>
> >>>>> Mainly the firmware had been setting this flag, but Xen was previously
> >>>>> ignoring it?
> >>>> No, not unless you pass {no-}x2apic_phys={false,0} on the Xen command
> >>>> line to force logical (clustered) destination mode.
> >>>>
> >>>>> As such Xen had been attempting to use cluster mode on an
> >>>>> x2APIC where that mode was broken for physical interrupts?
> >>>> No 
, not realy, x2apic_phys was already forced to true if
> >>>> acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL is set on the FADT (I
> >>>> just delete that line in this same chunk and move it here).
> >>> Okay, that was from a quick look at the patch.  Given the symptoms and
> >>> workaround with recent AMD motherboards, this looked
> >>>
> >>> In that case it might be a bug in what AMD is providing to motherboard
> >>> manufacturers.  Mainly this bit MUST be set, but AMD's implementation
> >>> leaves it unset.
> >>>
> >>> Could also be if the setup is done correctly the bit can be cleared, but
> >>> multiple motherboard manufacturers are breaking this.  Perhaps the steps
> >>> are fragile and AMD needed to provide better guidance.
> >>>
> >>>
> >>> Neowutran, are you still setup to and interested in doing
> >>> experimentation/testing with Xen on your AMD computer?  Would you be up
> >>> for trying the patch here:
> >>>
> >>> https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw
>  
>>>
> >>> I have a suspicion this *might* fix the x2APIC issue everyone has been
> >>> seeing.
> >>>
> >>> How plausible would it be to release this as a bugfix/workaround on 4.17?
> >>> I'm expecting a "no", but figured I should ask given how widespread the
> >>> issue is.
> >> I just applied the patch on my setup ( https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw ) 
> >> It seems to fix the x2APIC issue I was having. 
> >>
> >> I only did some quick tests: 
> >>
> >> I tried all the differents values in my bios for the X2APIC settings. 
> >> Now the system successfully boot in all the cases, without needing
> >> manual override of the x2apic_phys/x2apic_mode parameter in boot commandline .
> > In light of this issue effecting a large number of people with recent
> > hardware, I formally request the patch
> > "x86/x2apic: introduce a mixed physical/cluster mode" be considered for
> > backport release on the 4.17 and 4.18 branches.
> >
> > (I'm unsure whether it is realistic  
for a 4.17 update, but I figure I
> > should ask)
> 
> This is an unreasonable ask.
> 
> I believe you when you say there is (or at least was) an x2apic bug (or
> bugs), but not once did you provide the logging requested, nor engage
> usefully with us in debugging.
> 
> And despite this, we (Roger, Jan and myself) found, fixed and backported
> 3 x2apic bugs.
> 
> Now you come along guessing alone at x2apic in a patch name that it
> fixes your problem, on a patch which is not a bugfix - it's a
> performance optimisation.


------

> Neowutran, thankyou for looking into the patch, but I'm afraid that
> doesn't confirm that this patch fixed an issue either.  If it really did
> make a difference, then you'll see a difference in behaviour using each
> of the 3 new x2apic-mode= options.
> 
> Please could you take your single up-to-date build of Xen, put the BIOS
> settings back to whatever was causing you problems originally, and
> describe what happens when booting each of
> x2apic-mode={physical,cluster,mixed}? 


Hi, 
I did some more tests and research, indeed this patch improved/solved my specific case. 

Starting point: 

I am using Xen version 4.17.2 (exactly this source https://github.com/QubesOS/qubes-vmm-xen).
In the bios (a Asus motherboard), I configured the "local apic" parameter to "X2APIC".
For Xen, I did not set the parameter "x2apic-mode" nor the parameter "x2apic_phys". 

Case 1:
I tryied to boot just like that, result: system is unusuably slow

Case 2:
Then, I applied a backport of the patch  
https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw 
to the original Xen version of QubesOS and I recompiled. 
(https://github.com/neowutran/qubes-vmm-xen/blob/x2apic3/X2APIC.patch)
Result: it work, the system is usable. 

Case 3:
Then, I applied the patch https://github.com/xen-project/xen/commit/26a449ce32cef33f2cb50602be19fcc0c4223ba9
to the original Xen version of QubesOS and I recompiled.
(https://github.com/neowutran/qubes-vmm-xen/blob/x2apic4/X2APIC.patch)
Result: system is  
unusuably slow. 


In "Case 2", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_mixed". 
In "Case 3", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_cluster". 


-------------------
If you want / need, details for the function "apic_x2apic_probe":

Known "input" value:

"CONFIG_X2APIC_PHYSICAL" is not defined
"iommu_intremap == iommu_intremap_off" = false
"acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL" -> 0
"acpi_gbl_FADT.flags" = 247205 (in decimal)
"CONFIG_X2APIC_PHYSICAL" is not defined
"CONFIG_X2APIC_MIXED" is defined, because it is the default choice
"x2apic_mode" = 0
"x2apic_phys" = -1



Trace log (I did some call "printk" to trace what was going on)
Case 2:
(XEN) NEOWUTRAN: X2APIC_MODE: 0 
(XEN) NEOWUTRAN: X2APIC_PHYS: -1 
(XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
(XEN) NEOWUTRAN IOMMU_INTREMAP: different 
(XEN) Neowutran: PASSE 2 
(XEN) Neowutran: PASSE 4 
(XEN) NEOWUTRAN: X2APIC_MODE: 3 
(XEN) Neowutran: PASSE 7 
(XEN) NEOWUTRAN: X2APIC_MODE: 3 
 
(XEN) NEOWUTRAN: X2APIC_PHYS: -1 
(XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
(XEN) NEOWUTRAN IOMMU_INTREMAP: different 

Case 3:
(XEN) NEOWUTRAN2: X2APIC_PHYS: -1 
(XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
(XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
(XEN) Neowutran2: Passe 1 
(XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
(XEN) Neowutran2: Passe 6 
(XEN) Neowutran2: Passe 7 
(XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
(XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
(XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
(XEN) Neowutran2: Passe 2 
(XEN) Neowutran2: Passe 4 
(XEN) Neowutran2: Passe 7



If you require the full logs, I could publish the full logs somewhere.
----------------------

( However I do not understand if the root issue is a buggy motherboard, a
bug in xen, or if the parameter "X2APIC_PHYSICAL" should have been set
by the QubesOS project, or something else)
 
> Thankyou,
> 
> ~Andrew

Thanks you, 
Neowutran
 

