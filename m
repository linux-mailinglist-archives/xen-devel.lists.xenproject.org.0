Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UONTFMUqcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:48:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF767803
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211038.1522581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viv2k-0004yB-Hq; Thu, 22 Jan 2026 13:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211038.1522581; Thu, 22 Jan 2026 13:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viv2k-0004vt-EI; Thu, 22 Jan 2026 13:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1211038;
 Thu, 22 Jan 2026 13:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FI3N=73=bounce.vates.tech=bounce-md_30504962.69722a98.v1-60ebe441a5b84f7b906ad5121b15d0da@srs-se1.protection.inumbo.net>)
 id 1viv2i-0004vn-FT
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:48:12 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc47dae6-f798-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 14:48:09 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dxj7X1X9FzK5vkCS
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 13:48:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 60ebe441a5b84f7b906ad5121b15d0da; Thu, 22 Jan 2026 13:48:08 +0000
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
X-Inumbo-ID: fc47dae6-f798-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769089688; x=1769359688;
	bh=hTDH/bCW4NxcGMHCphf3VXFB1sPxgz5d+CFEu1tvX44=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p/O7GpaCI4Wp5r3cz+6BNdcMlpvIDIAxsziyasfFelyFn8gVx8hZF+69+Tw6zKhxR
	 63hTCHwlu2NQBja7kbVHrjSfE0+bmi9Oa6sCKPc7A+IJOgCquUs93S5CwhY3Kul8pM
	 cXWx1XNG8A+Uei+bywhlrMT99ixBu0qZwhBNLXosVUhkEaXLx3tRgCjgqselZzmjqc
	 MMzbgOITGmhOeeOwdmurbQAaT7UY5moDyS0vWa33Jpp45WC93pESNQbDVFQRyvsV1y
	 V7jrDzFia8dlSGyJp7b/Ov+7Bs7VkGLGj3yRjOiBEx3eSUaDtszQeayELgOQr8z54y
	 WXrusHfCnkLiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769089688; x=1769350188; i=julian.vetter@vates.tech;
	bh=hTDH/bCW4NxcGMHCphf3VXFB1sPxgz5d+CFEu1tvX44=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gDQEOgXGqk9Hbw02Ilaf4Xg08WF3WFUdika+tOR5ESBC+s6ZTbchDw3pkdWK/Zc0W
	 P9Ro2Bv/c/YRgi43VvcSDfT+sS7ezMRdov5A/cxvHMcsXoXp5bjAjo6dIxqRuN0zbu
	 jeRa2xqLxyxYkoxB7Q0b6G39ZLZr+uIB3ptXV0ACv7jQEOg/4eTJWomEvH4jNwvBKH
	 GnanaUchFrksN4dXfv844IFMNHNHeRSuQmPOguIcCss1WzruQyu2niKxfFyz/ygsPd
	 rrOCLOnIuLELA4XlKb7MpXk+0ILDXeDJx2PsoQJECzir4Wx+ub+JKSYNT4oBwoUWJk
	 f4+lzUuQVaOUg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Move=20NX=20handling=20to=20a=20dedicated=20place?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769089686711
Message-Id: <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Jan Beulich" <jbeulich@suse.com>
References: <20260115151658.3725784-1-julian.vetter@vates.tech> <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com> <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech> <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
In-Reply-To: <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.60ebe441a5b84f7b906ad5121b15d0da?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 13:48:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7FBF767803
X-Rspamd-Action: no action

On 1/19/26 20:01, Andrew Cooper wrote:
> On 19/01/2026 10:34 am, Julian Vetter wrote:
>> On 1/15/26 4:50 PM, Andrew Cooper wrote:
>>> On 15/01/2026 3:17 pm, Julian Vetter wrote:
>>>> +{
>>>> +    uint64_t misc_enable;
>>>> +    uint32_t eax, ebx, ecx, edx;
>>>> +
>>>> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
>>>> +    {
>>>> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
>>>> +        cpuid(0, &eax, &ebx, &ecx, &edx);
>>>> +        if ( ebx =3D=3D X86_VENDOR_INTEL_EBX &&
>>>> +             ecx =3D=3D X86_VENDOR_INTEL_ECX &&
>>>> +             edx =3D=3D X86_VENDOR_INTEL_EDX )
>>>> +        {
>>>> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
>>>> +            {
>>>> +                misc_enable &=3D ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>>> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>> +
>>>> +                /* Re-read CPUID after having cleared XD_DISABLE */
>>>> +                boot_cpu_data.x86_capability[FEATURESET_e1d] =3D cpui=
d_edx(0x80000001U);
>>>> +
>>>> +                /* Adjust misc_enable_off for secondary startup and w=
akeup code */
>>>> +                bootsym(trampoline_misc_enable_off) |=3D MSR_IA32_MIS=
C_ENABLE_XD_DISABLE;
>>>> +                printk(KERN_INFO "re-enabled NX (Execute Disable) pro=
tection\n");
>>>> +            }
>>>> +        }
>>>> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
>>> The BIOS is only hiding the CPUID bit.=C2=A0 It's not blocking the use =
of NX.
>> Yes, you're right.
>>> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
>>> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
>>> regular CPUID.=C2=A0 This is a little more tricky to arrange because it=
 needs
>>> doing on each CPU, not just the BSP.
>> Ok, yes, I have modified the AMD side to use MSR_K8_EXT_FEATURE_MASK to
>> "unhide" it.
> 
> Great.=C2=A0 And contrary to the other thread, this really must modify th=
e
> mask MSRs rather than use setup_force_cpu_cap(), because we still need
> it to be visible to PV guest kernels which can't see Xen's choice of
> setup_force_cpu_cap().
> 
>>
>>>> +    }
>>>> +
>>>> +    /* Enable EFER.NXE only if NX is available */
>>>> +    if ( boot_cpu_has(X86_FEATURE_NX) )
>>>> +    {
>>>> +        if ( !(read_efer() & EFER_NXE) )
>>>> +            write_efer(read_efer() | EFER_NXE);
>>>> +
>>>> +        /* Adjust trampoline_efer for secondary startup and wakeup co=
de */
>>>> +        bootsym(trampoline_efer) |=3D EFER_NXE;
>>>> +    }
>>>> +
>>>> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_N=
X) )
>>>> +        panic("This build of Xen requires NX support\n");
>>>> +}
>>>> +
>>>>    /* How much of the directmap is prebuilt at compile time. */
>>>>    #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>>>>    
>>>> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void=
)
>>>>        rdmsrl(MSR_EFER, this_cpu(efer));
>>>>        asm volatile ( "mov %%cr4,%0" : "=3Dr" (info->cr4) );
>>>>    
>>>> +    nx_init();
>>>> +
>>>>        /* Enable NMIs.  Our loader (e.g. Tboot) may have left them dis=
abled. */
>>>>        enable_nmis();
>>>>    
>>> This is too early, as can be seen by the need to make a cpuid() call
>>> rather than using boot_cpu_data.
>>>
>>> The cleanup I wanted to do was to create/rework early_cpu_init() to get
>>> things in a better order, so the panic() could go at the end here.=C2=
=A0 The
>>> current split we've got of early/regular CPU init was inherited from
>>> Linux and can be collapsed substantially.
>> I have tried to add the logic into the early_init_{intel,amd}()
>> functions. But it seems this is already too late in the boot chain. This
>> is why I put into an extra function which is called earlier. Because it
>> seems there are already pages with PAGE_NX being used on the way to
>> early_init_{intel,amd}(). Because when I put my code into
>> early_init_intel I get a fault and a reboot. What do you suggest?
> 
> Have you got the backtrace available?

Yes. Here it is. Although I saw before when enabling 
'CONFIG_MICROCODE_LOADING' it faults even earlier, somewhere in 
'find_cpio_data()', but with the same EC =3D 0x0009 (Protection violation, 
Reserved bit violation).

Xen 4.22-unstable
(XEN) Xen version 4.22-unstable (julian@work) (gcc (Debian 15.2.0-12) 
15.2.0) debug=3Dy Thu Jan 22 14:28:58 CET 2026
(XEN) Latest ChangeSet: Tue Jan 13 16:50:12 2026 +0100 git:ce886ef641
(XEN) build-id: 2e72a4b08fca3ae0f0ed9af0dd3a5de947a966d0
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 55 (0x37), Stepping 8 
(raw 00030678)
(XEN) BSP microcode revision: 0x00000836
(XEN) Bootloader: GRUB 2.12
(XEN) Command line: dom0_mem=3D1232M,max:1232M watchdog ucode=3Dscan 
dom0_max_vcpus=3D1-1 com1=3D115200,8n1 console=3Dcom1
(XEN) Xen image load base address: 0xb5800000
(XEN) Video information:
(XEN)  VGA is graphics mode 800x600, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000003efff] (usable)
(XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
(XEN)  [0000000000040000, 000000000009ffff] (usable)
(XEN)  [0000000000100000, 000000001effffff] (usable)
(XEN)  [000000001f000000, 000000001f0fffff] (reserved)
(XEN)  [000000001f100000, 000000001fffffff] (usable)
(XEN)  [0000000020000000, 00000000200fffff] (reserved)
(XEN)  [0000000020100000, 00000000b9377fff] (usable)
(XEN)  [00000000b9378000, 00000000b93a7fff] (reserved)
(XEN)  [00000000b93a8000, 00000000b94bdfff] (usable)
(XEN)  [00000000b94be000, 00000000b98d6fff] (ACPI NVS)
(XEN)  [00000000b98d7000, 00000000b9bb0fff] (reserved)
(XEN)  [00000000b9bb1000, 00000000b9bb1fff] (usable)
(XEN)  [00000000b9bb2000, 00000000b9bf3fff] (reserved)
(XEN)  [00000000b9bf4000, 00000000b9d6dfff] (usable)
(XEN)  [00000000b9d6e000, 00000000b9ff9fff] (reserved)
(XEN)  [00000000b9ffa000, 00000000b9ffffff] (usable)
(XEN)  [00000000e00f8000, 00000000e00f8fff] (reserved)
(XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
(XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
(XEN)  [00000000ffb00000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000013fffffff] (usable)
(XEN) Early fatal page fault at e008:ffff82d0403b38e0 
(cr2=3D0000000001100202, ec=3D0009)
(XEN) ----[ Xen-4.22-unstable  x86_64  debug=3Dy  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d0403b38e0>] memcmp+0x20/0x46
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000001100000   rcx: 0000000000000000
(XEN) rdx: 0000000000000004   rsi: ffff82d0404a0d23   rdi: 0000000001100202
(XEN) rbp: ffff82d040497d88   rsp: ffff82d040497d78   r8:  0000000000000016
(XEN) r9:  ffff82d04061a180   r10: ffff82d04061a188   r11: 0000000000000010
(XEN) r12: 0000000001100000   r13: 0000000000000001   r14: ffff82d0404d2b80
(XEN) r15: ffff82d040462750   cr0: 0000000080050033   cr4: 00000000000000a0
(XEN) cr3: 00000000b5d0e000   cr2: 0000000001100202
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0403b38e0> (memcmp+0x20/0x46):
(XEN)  0f 1f 84 00 00 00 00 00 <0f> b6 04 0f 44 0f b6 04 0e 44 29 c0 75 
13 48 83
(XEN) Xen stack trace from rsp=3Dffff82d040497d78:
(XEN)    ffff82d040483f79 0000000000696630 ffff82d040497db0 ffff82d040483fd=
2
(XEN)    0000000000696630 ffff82d040200000 0000000000000001 ffff82d040497ef=
8
(XEN)    ffff82d04047c4ac 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    ffff82d04062c6d8 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000140000 0000000000000000 000000000000000=
1
(XEN)    0000000000000000 0000000000000000 ffff82d040497f08 ffff82d0404d2b8=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000800000000 000000010000006e 000000000000000=
3
(XEN)    00000000000002f8 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000099f30ba0 0000000099feeda7 0000000000000000 ffff82d040497ff=
f
(XEN)    00000000b9cf3920 ffff82d0402043e8 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000e01000000000 0000000000000000 000000000000000=
0
(XEN)    00000000000000a0 0000000000000000 0000000000000000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d0403b38e0>] R memcmp+0x20/0x46
(XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
(XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
(XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
(XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
(XEN)
(XEN) Pagetable walk from 0000000001100202:
(XEN)  L4[0x000] =3D 00000000b5c9d063 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL TRAP: vec 14, #PF[0009] IN INTERRUPT CONTEXT
(XEN) ****************************************


> 
> It's probably easiest if I prototype the split I'd like to see, and you
> integrate with that.
> 
> ~Andrew



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



