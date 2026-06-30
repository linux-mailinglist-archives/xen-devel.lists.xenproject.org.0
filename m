Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J4lgBCwFRGpdnQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 20:04:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7396E715F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 20:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=3mdeb.com header.s=ovhmo3617313-selector1 header.b=XUa1KSj+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1349340.1607181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wecoE-0001vX-A4; Tue, 30 Jun 2026 18:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349340.1607181; Tue, 30 Jun 2026 18:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wecoE-0001tA-78; Tue, 30 Jun 2026 18:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1349340;
 Tue, 30 Jun 2026 18:03:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wecoC-0001t4-62
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:03:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wecoB-008c80-Fl
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 20:03:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a4404f9-e002-0a2a0a5209dd-0a2a450bc79e-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 20:03:43 +0200
Received: from [87.98.172.75] (helo=4.mo560.mail-out.ovh.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a4404fe-ac48-0a2a450b0019-5762ac4ba4a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 20:03:43 +0200
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.37.17])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4gqWH236t2z9wDB
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:03:42 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-r7h7k (unknown [10.110.168.247])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 24BB2C003A;
 Tue, 30 Jun 2026 18:03:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-7d8d68f679-r7h7k with ESMTPSA
 id E7TpOPwERGochhsAyNhEQA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 30 Jun 2026 18:03:41 +0000
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
X-OVh-ClientIp:176.111.183.249
Date: Tue, 30 Jun 2026 21:03:33 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 15/22] x86/smpboot.c: TXT AP bringup
Message-ID: <akQE9VcTsIhqo-Ni@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <bca9943d4ffb37531ec8facac09e85996bc2acb7.1748611041.git.sergii.dmytruk@3mdeb.com>
 <e88825f2-2055-4dae-a15f-d0b94cec51c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e88825f2-2055-4dae-a15f-d0b94cec51c4@suse.com>
x-ovh-tracer-id: 359725020621120988
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEq/3EnavgXUveOny/3E93XBtnu1T9+8pscZ6HCk01XzjIS/Sti7Nvydd9cTp42i/Gltu94j9ZlQClclY9RZvae8R4tuIUv36omhdf/vkk5iXqkFTTyQZKueQ58OxWmXNfi4lG+Z0O+xb6Xpx95jV066OeGCTQwYddqk/a66391NV8Nk9marXSj2WK/453jiFX9HVkMFT8469tFmZGWRYOgaEWt8NVpNfZpzSWJPrc0XPGn3Q8popNoTSWwEtY1rE8cYE725YNqiZm/FUqcMmdkMJRgFvko8zAYVtKyZYEuO+l3Q7N/+o1EQkwM1uKIPQvMyWHrqEtPAmY8OvKiYVGKYnRDr/ha7wE4UajXl2ygoFAOnJfs0IkP0csd/iJiUP/nI/3wJYYvCuc0KvoUd9lVsP9givJnW+QlTpBdaYjuVBk+GepLroqycUvJBY1jdxDl2BfmhQ0DlaRs7heLRr6IYmk8ZcHQ+CAXcnPbYK7X9/jxHYX63T1WVO0lsbmDxHBtqAFYGOYn8wKy+K9lhwAwfifATgauYWOQZ48fwiIWN8mZ3WbmadtRq+r8KNpinUruyvLV7izTLMC3AbnUuO7T0YbbhoJjYrH5JN6ecQNv7JUviIdYGe90L2QRWj3VG/ZzqxfclxX2GRf9Bqgk0GEUlrHW+072Irq0a4sK7viarQ
DKIM-Signature: a=rsa-sha256; bh=+dxSktRP/4x10ho7TzsjQysJPVrjl8rK8rljbYc7x8o=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782842622; v=1;
 b=XUa1KSj+B/hpbca/8UCbayYIBK5soG7kODtsFpoT8OJWO2h5r+MwNJQc+ZUxZt1ZiwRvdCDm
 3Vdqep3QE/IjgSFP+LNCd4K+Tk+YiK4Fu/ET0Ik6ESpbXRa3w+zZiTl0EQrqz9cBJ2j24kfIK11
 0/r3tfjuMVY6/SiZA+UpyF41xv/xrA0BBOJkeBmCMmGiS28M8tc1EnQudghejilz12nOgq08Wzc
 sfW1BI30yZgjGKU94gLPBgAcyz9fVvURKEr5xZZoeAkfjjtsbuXfbaQokQdjq7gEmE4pSpZB+6p
 tMTDakMBrBsf1o/cztfwP9P2xluNPRs9GGJcFns4fP5ug==
X-purgate-ID: tlsNG-42698a/1782842623-40B4D220-97E6F476/0/0
X-purgate-type: clean
X-purgate-size: 3547
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[3mdeb.com:s=ovhmo3617313-selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:trenchboot-devel@googlegroups.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[3mdeb.com];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3mdeb.com:dkim,3mdeb.com:from_mime];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[3mdeb.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7396E715F

On Thu, Jan 22, 2026 at 05:41:10PM +0100, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > @@ -154,6 +164,13 @@ gdt_48:
> >          .quad   0x00cf93000000ffff /* 0x0018: ring 0 data */
> >          .quad   0x00009b000000ffff /* 0x0020: real-mode code @ BOOT_TRAMPOLINE */
> >          .quad   0x000093000000ffff /* 0x0028: real-mode data @ BOOT_TRAMPOLINE */
> > +        /*
> > +         * Intel TXT requires these two in exact order. This isn't compatible
> > +         * with order required by syscall, so we have duplicated entries...
> > +         * If order ever changes, update selector numbers in asm/intel-txt.h.
> > +         */
> > +        .quad   0x00cf9b000000ffff /* 0x0030: ring 0 code, 32-bit mode */
> > +        .quad   0x00cf93000000ffff /* 0x0038: ring 0 data */
>
> Especially since the corresponding #define-s sit ...
>
> > --- a/xen/arch/x86/include/asm/intel-txt.h
> > +++ b/xen/arch/x86/include/asm/intel-txt.h
> > @@ -91,6 +91,9 @@
> >
> >  #define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
> >
> > +#define TXT_AP_BOOT_CS                  0x0030
> > +#define TXT_AP_BOOT_DS                  0x0038
>
> ... entirely elsewhere, I think at least the comments above want to mention
> these names. (Even better would be to not hard-code these numbers, or to
> use the numbers to establish the offsets in trampoline_gdt.)

Will export position of those entries from assembly and compute CS
selector in C.

> > @@ -321,6 +323,29 @@ void asmlinkage start_secondary(void)
> >      struct cpu_info *info = get_cpu_info();
> >      unsigned int cpu = smp_processor_id();
> >
> > +    if ( ap_boot_method == AP_BOOT_TXT ) {
>
> Style nit (also again later): Brace on its own line please.

Right.

> > +        uint64_t misc_enable;
> > +        uint32_t my_apicid;
> > +        struct txt_sinit_mle_data *sinit_mle =
> > +              txt_sinit_mle_data_start(__va(txt_read(TXTCR_HEAP_BASE)));
> > +
> > +        /* TXT released us with MONITOR disabled in IA32_MISC_ENABLE. */
> > +        rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> > +        wrmsrl(MSR_IA32_MISC_ENABLE,
> > +               misc_enable | MSR_IA32_MISC_ENABLE_MONITOR_ENABLE);
> > +
> > +        /* get_apic_id() reads from x2APIC if it thinks it is enabled. */
> > +        x2apic_ap_setup();
> > +        my_apicid = get_apic_id();
>
> Despite the comment putting the call to x2apic_ap_setup() here looks rather
> arbitrary. Also you do nothing about the other call from smp_callin(). Surely
> the function better wouldn't be called twice?

This code is now called from assembly before start_secondary() and it
receives APIC ID as an argument, so there is no get_apic_id() or
x2apic_ap_setup().

> > +        while ( my_apicid != x86_cpu_to_apicid[cpu] ) {
> > +            asm volatile ("monitor; xor %0,%0; mwait"
> > +                          :: "a"(__va(sinit_mle->rlp_wakeup_addr)), "c"(0),
>
> You alter %0, so it can't be just an input.

`monitor` and `mwait` are now done separately to be able to check
whether condition is satisfied between them.

> > +                          "d"(0) : "memory");
> > +            cpu = smp_processor_id();
>
> What purpose does this serve?
>
> Jan

I think `cpu` wasn't necessarily correct at this point because AP could
get here before BSP set up its structure.  As above, this is also gone
in the new version (the old one stopped working after some upstream
changes related to CPU init).

Regards

