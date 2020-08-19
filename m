Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1E24A9B5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 00:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8WvD-0002aR-HU; Wed, 19 Aug 2020 22:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xTrz=B5=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8WvC-0002aM-FO
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 22:51:06 +0000
X-Inumbo-ID: 8e839edf-b545-4352-a949-1a0f83bc6cf6
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e839edf-b545-4352-a949-1a0f83bc6cf6;
 Wed, 19 Aug 2020 22:51:03 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id p4so45480qkf.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2020 15:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pTIYB9UWgQi6JmpS03uJwrjFt7N0qlqXilFRjum1REk=;
 b=isDsk2dQWkXkESb9GtEO61dUMrVaxGHPT8iMtcmBCqyTlFCHqf8sCt8OzyIK/RzOkk
 aALgIYUaLVyYsaRexoCZ3kP3zQPHUCIA6pWOvw8BLQSt9dgtKwZCPJIqLD008eMga5mZ
 cIP3BfdKRUtN2WA1juItAR1mcah9kl90qGHwGk0UQLU1bKN+oApUWWgWKKbyzoBvdICS
 vyAZT9gN0uVL04iusZwTwMlk+5l8wzeSgftYJMbDrcxdZhGjJZXqX1D1+62maKUwDXSF
 RrHrMIcAdt0VmTvlaTjlgTFSq4PsxcdKSdVX/5026+B9zO07SslCLv1YSYpHGuz5D3Cp
 9C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pTIYB9UWgQi6JmpS03uJwrjFt7N0qlqXilFRjum1REk=;
 b=jGkUXCu5b80XTI1WVQC81B/rP0FH1N7yBLyooyvLJqLfRV/2PZCWh7Qt0ZuEwUots6
 jzdIyPwYtw+S6+cNjAr/P1hA+KmMT8/MC92TjcZQI/QG0tW8jNxIbTDKHosGMOlVSfD0
 f4aH6KvY9L5jrGtYPihGwyFMq5exAJ/5m6RDcqGLuxFcoeVpyAxzBMUoI4MBcdCQs7um
 znGCOm0z153E2OkAwVRLdsEH8dLeV1G3nAIVh6ib8aX+129UFkryEdPCOu4RoHvbkD/3
 sFWqRp6fs/orwN+XcuG+H/Vs+rW/lqM9PIJ10JsvfgFfoZnJgNKh8T51mphOujulyaFZ
 sEIQ==
X-Gm-Message-State: AOAM532p4nt0cn+sVNQw4YT1Xg/5aWNno0hRIi7SKPKSJ1JWKIiBcc+l
 kq8iR0Wzw4MefYaMkHEZRlNqO6sK1G++gi+BNcvSUasQAunN+A==
X-Google-Smtp-Source: ABdhPJxGMeVlGMpH9/C2Aah7ZpAK4bZcIPNXfaRKwPoEZegO0huMim6g3ljF5iqPmjMyOEgp3Lm6iM+Ey2VJj05+PEI=
X-Received: by 2002:a37:9f48:: with SMTP id i69mr209522qke.267.1597877462534; 
 Wed, 19 Aug 2020 15:51:02 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 19 Aug 2020 15:50:51 -0700
Message-ID: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
Subject: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="0000000000008ca1dd05ad42d6a0"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000008ca1dd05ad42d6a0
Content-Type: text/plain; charset="UTF-8"

 Hi!

below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
without efi=no-rs. Please let me know if I can provide any additional
information.

One interesting point is that even though Xen tries to reboot the box in 5
seconds
it simply freezes it completely.

Thanks,
Roman.

Xen 4.14.0
(XEN) Xen version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=n  Sat Jul 25
23:45:43 UTC 2020
(XEN) Latest ChangeSet:
(XEN) Bootloader: GRUB 2.03
(XEN) Command line: com1=115200,8n1 console=com1 dom0_mem=1024M,max:1024M
dom0_max_vcpus=1 dom0_vcpus_pin
(XEN) Xen image load base address: 0x71000000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000003efff] (usable)
(XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
(XEN)  [0000000000040000, 000000000009ffff] (usable)
(XEN)  [0000000000100000, 000000001fffffff] (usable)
(XEN)  [0000000020000000, 00000000200fffff] (reserved)
(XEN)  [0000000020100000, 0000000076ccafff] (usable)
(XEN)  [0000000076ccb000, 0000000076d42fff] (reserved)
(XEN)  [0000000076d43000, 0000000076d53fff] (ACPI data)
(XEN)  [0000000076d54000, 00000000772ddfff] (ACPI NVS)
(XEN)  [00000000772de000, 00000000775f4fff] (reserved)
(XEN)  [00000000775f5000, 00000000775f5fff] (usable)
(XEN)  [00000000775f6000, 0000000077637fff] (reserved)
(XEN)  [0000000077638000, 00000000789e4fff] (usable)
(XEN)  [00000000789e5000, 0000000078ff9fff] (reserved)
(XEN)  [0000000078ffa000, 0000000078ffffff] (usable)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
(XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
(XEN)  [00000000fed03000, 00000000fed03fff] (reserved)
(XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
(XEN)  [00000000fed0c000, 00000000fed0ffff] (reserved)
(XEN)  [00000000fed1c000, 00000000fed1cfff] (reserved)
(XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
(XEN)  [00000000fef00000, 00000000feffffff] (reserved)
(XEN)  [00000000ff900000, 00000000ffffffff] (reserved)
(XEN) System RAM: 1919MB (1965176kB)
(XEN) ACPI: RSDP 76D46000, 0024 (r2   DELL)
(XEN) ACPI: XSDT 76D46088, 0094 (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FACP 76D52560, 010C (r5   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: DSDT 76D461B0, C3AF (r2   DELL     AS09  1072009 INTL 20120913)
(XEN) ACPI: FACS 772DDE80, 0040
(XEN) ACPI: APIC 76D52670, 0068 (r3   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FPDT 76D526D8, 0044 (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FIDT 76D52720, 009C (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: MCFG 76D527C0, 003C (r1   DELL     AS09  1072009 MSFT       97)
(XEN) ACPI: LPIT 76D52800, 0104 (r1   DELL     AS09        3 VLV2  100000D)
(XEN) ACPI: HPET 76D52908, 0038 (r1   DELL     AS09  1072009 AMI.        5)
(XEN) ACPI: SSDT 76D52940, 0763 (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: SSDT 76D530A8, 0290 (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: SSDT 76D53338, 017A (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: UEFI 76D534B8, 0042 (r1   DELL     AS09        0             0)
(XEN) ACPI: CSRT 76D53500, 014C (r0   DELL     AS09        5 INTL 20120624)
(XEN) ACPI: TPM2 76D53650, 0034 (r3        Tpm2Tabl        1 AMI         0)
(XEN) ACPI: SSDT 76D53688, 00C9 (r1   MSFT  RHPROXY        1 INTL 20120913)
(XEN) Domain heap initialised
(XEN) ACPI: 32/64X FACS address mismatch in FADT -
772dde80/0000000000000000, using 32
(XEN) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-86
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) CPU0: 400..1000 MHz
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk N/A, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1333.397 MHz processor.
(XEN) Unknown cachability for MFNs 0xff900-0xfffff
(XEN) I/O virtualisation disabled
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ----[ Xen-4.14.0  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000088411fe8   rbx: ffff82d04047fb48   rcx: ffff82d04047fa60
(XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
(XEN) rbp: ffff82d04047fc00   rsp: ffff82d04047fa38   r8:  ffff82d04047fb48
(XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
(XEN) r12: ffff82d04047fc60   r13: 0000000000000040   r14: 00000000775ce2c0
(XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
(XEN) cr3: 00000000711d1000   cr2: 00000000ff900020
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
(XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10
17 eb
(XEN) Xen stack trace from rsp=ffff82d04047fa38:
(XEN)    00000000775ddb8e 00000000775e4d58 0000000040470880 0000000000001698
(XEN)    4630002800000001 00000000ff900000 0000000000020000 00000000ff91fff0
(XEN)    00000000ff912057 00000000ff900060 0000000007f70020 0000000000000000
(XEN)    0000000077739001 ffff82d0403be10a ffff82d040597760 ffff82d040597394
(XEN)    ffff82d040377940 00000000ffffffff 0000000000000400 ffff82d04047fc60
(XEN)    00000000775e2e73 00000000775da608 ffff82d04047fc70 0000000000000000
(XEN)    0000000000000000 ffff82d04036e81f 00000000775e2ead ffff82d04036e81f
(XEN)    ffff82d04036e82b 8000000000000003 0000000000000000 0000000000000000
(XEN)    00000000775ddd88 00000000775da610 0000000000000000 ffff82d04047fc70
(XEN)    ffff82d04036e82b ffff82d04047fc60 ffff82d04047fbf8 ffff82d04031eaca
(XEN)    0000000000000000 ffff82d04047fd00 ffff82d040597360 0000000000000430
(XEN)    ffff82d040462080 0000000000000200 ffff82d04058860c ffff82d04047fc70
(XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
(XEN)    0000000000000000 ffff82d04047fc60 0000000000000000 0000000000000000
(XEN)    00000000775d0798 ffff82d04047fc90 0000000000000000 0000000000002022
(XEN)    ffff82d04047fca8 ffff82d04047fc60 000000007146d000 0000000079000000
(XEN)    0000000000000206 ffff82d0405886a0 ffff82d040471278 0000000000000000
(XEN)    ffff82d0402014cb ffff82d04036e81f ffff82d04047fca0 0000000000000003
(XEN)    ffff82d04047fcf0 0000000000000000 0000000000000000 ff001900010107dc
(XEN)    0000000000000000 000000007146d000 0000000079000000 ffff82d040462080
(XEN) Xen call trace:
(XEN)    [<00000000775e0d21>] R 00000000775e0d21
(XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
(XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
(XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
(XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
(XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
(XEN)    [<ffff82d04031eaca>] S do_IRQ+0x2da/0x6d0
(XEN)    [<ffff82d0402014cb>] S efi_get_time+0x6b/0xb0
(XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
(XEN)    [<ffff82d04033e8ed>] S arch/x86/time.c#get_cmos_time+0x1cd/0x290
(XEN)    [<ffff82d04033e8ed>] S arch/x86/time.c#get_cmos_time+0x1cd/0x290
(XEN)    [<ffff82d0403fa48a>] S setup_boot_APIC_clock+0x13a/0x300
(XEN)    [<ffff82d04040888b>] S init_xen_time+0x2b/0x90
(XEN)    [<ffff82d040405037>] S __start_xen+0x23e7/0x2bf0
(XEN)    [<ffff82d0402000ef>] S __high_start+0x4f/0x60
(XEN)
(XEN) Pagetable walk from 00000000ff900020:
(XEN)  L4[0x000] = 00000000711d0063 ffffffffffffffff
(XEN)  L3[0x003] = 0000000071468063 ffffffffffffffff
(XEN)  L2[0x1fc] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 00000000ff900020
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

--0000000000008ca1dd05ad42d6a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>=C2=A0Hi!</div><div=
><br></div><div>below you can see a trace of Xen 4.14.0 failing on=C2=A0Del=
l IoT Gateway 3001</div><div>without efi=3Dno-rs. Please let me know if I c=
an provide=C2=A0any additional information.</div><div><br></div><div>One in=
teresting point is that even though Xen tries to reboot the box in 5 second=
s</div><div>it simply freezes it completely.</div><div><br></div><div>Thank=
s,</div><div>Roman.</div><div><br></div><div>Xen 4.14.0</div><div>(XEN) Xen=
 version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=3Dn =C2=A0Sat Jul 25 2=
3:45:43 UTC 2020</div><div>(XEN) Latest ChangeSet:</div><div>(XEN) Bootload=
er: GRUB 2.03</div><div>(XEN) Command line: com1=3D115200,8n1 console=3Dcom=
1 dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpus_pin</div><div>(X=
EN) Xen image load base address: 0x71000000</div><div>(XEN) Video informati=
on:</div><div>(XEN) =C2=A0VGA is text mode 80x25, font 8x16</div><div>(XEN)=
 Disc information:</div><div>(XEN) =C2=A0Found 0 MBR signatures</div><div>(=
XEN) =C2=A0Found 1 EDD information structures</div><div>(XEN) EFI RAM map:<=
/div><div>(XEN) =C2=A0[0000000000000000, 000000000003efff] (usable)</div><d=
iv>(XEN) =C2=A0[000000000003f000, 000000000003ffff] (ACPI NVS)</div><div>(X=
EN) =C2=A0[0000000000040000, 000000000009ffff] (usable)</div><div>(XEN) =C2=
=A0[0000000000100000, 000000001fffffff] (usable)</div><div>(XEN) =C2=A0[000=
0000020000000, 00000000200fffff] (reserved)</div><div>(XEN) =C2=A0[00000000=
20100000, 0000000076ccafff] (usable)</div><div>(XEN) =C2=A0[0000000076ccb00=
0, 0000000076d42fff] (reserved)</div><div>(XEN) =C2=A0[0000000076d43000, 00=
00000076d53fff] (ACPI data)</div><div>(XEN) =C2=A0[0000000076d54000, 000000=
00772ddfff] (ACPI NVS)</div><div>(XEN) =C2=A0[00000000772de000, 00000000775=
f4fff] (reserved)</div><div>(XEN) =C2=A0[00000000775f5000, 00000000775f5fff=
] (usable)</div><div>(XEN) =C2=A0[00000000775f6000, 0000000077637fff] (rese=
rved)</div><div>(XEN) =C2=A0[0000000077638000, 00000000789e4fff] (usable)</=
div><div>(XEN) =C2=A0[00000000789e5000, 0000000078ff9fff] (reserved)</div><=
div>(XEN) =C2=A0[0000000078ffa000, 0000000078ffffff] (usable)</div><div>(XE=
N) =C2=A0[00000000e0000000, 00000000efffffff] (reserved)</div><div>(XEN) =
=C2=A0[00000000fec00000, 00000000fec00fff] (reserved)</div><div>(XEN) =C2=
=A0[00000000fed01000, 00000000fed01fff] (reserved)</div><div>(XEN) =C2=A0[0=
0000000fed03000, 00000000fed03fff] (reserved)</div><div>(XEN) =C2=A0[000000=
00fed08000, 00000000fed08fff] (reserved)</div><div>(XEN) =C2=A0[00000000fed=
0c000, 00000000fed0ffff] (reserved)</div><div>(XEN) =C2=A0[00000000fed1c000=
, 00000000fed1cfff] (reserved)</div><div>(XEN) =C2=A0[00000000fee00000, 000=
00000fee00fff] (reserved)</div><div>(XEN) =C2=A0[00000000fef00000, 00000000=
feffffff] (reserved)</div><div>(XEN) =C2=A0[00000000ff900000, 00000000fffff=
fff] (reserved)</div><div>(XEN) System RAM: 1919MB (1965176kB)</div><div>(X=
EN) ACPI: RSDP 76D46000, 0024 (r2 =C2=A0 DELL)</div><div>(XEN) ACPI: XSDT 7=
6D46088, 0094 (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A01072009 AMI =C2=A0 =
=C2=A0 10013)</div><div>(XEN) ACPI: FACP 76D52560, 010C (r5 =C2=A0 DELL =C2=
=A0 =C2=A0 AS09 =C2=A01072009 AMI =C2=A0 =C2=A0 10013)</div><div>(XEN) ACPI=
: DSDT 76D461B0, C3AF (r2 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A01072009 INTL=
 20120913)</div><div>(XEN) ACPI: FACS 772DDE80, 0040</div><div>(XEN) ACPI: =
APIC 76D52670, 0068 (r3 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A01072009 AMI =
=C2=A0 =C2=A0 10013)</div><div>(XEN) ACPI: FPDT 76D526D8, 0044 (r1 =C2=A0 D=
ELL =C2=A0 =C2=A0 AS09 =C2=A01072009 AMI =C2=A0 =C2=A0 10013)</div><div>(XE=
N) ACPI: FIDT 76D52720, 009C (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A010720=
09 AMI =C2=A0 =C2=A0 10013)</div><div>(XEN) ACPI: MCFG 76D527C0, 003C (r1 =
=C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A01072009 MSFT =C2=A0 =C2=A0 =C2=A0 97)<=
/div><div>(XEN) ACPI: LPIT 76D52800, 0104 (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS0=
9 =C2=A0 =C2=A0 =C2=A0 =C2=A03 VLV2 =C2=A0100000D)</div><div>(XEN) ACPI: HP=
ET 76D52908, 0038 (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A01072009 AMI. =C2=
=A0 =C2=A0 =C2=A0 =C2=A05)</div><div>(XEN) ACPI: SSDT 76D52940, 0763 (r1 =
=C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A0 =C2=A0 3000 INTL 20061109)</div><div>=
(XEN) ACPI: SSDT 76D530A8, 0290 (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A0 =
=C2=A0 3000 INTL 20061109)</div><div>(XEN) ACPI: SSDT 76D53338, 017A (r1 =
=C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A0 =C2=A0 3000 INTL 20061109)</div><div>=
(XEN) ACPI: UEFI 76D534B8, 0042 (r1 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0)</div><di=
v>(XEN) ACPI: CSRT 76D53500, 014C (r0 =C2=A0 DELL =C2=A0 =C2=A0 AS09 =C2=A0=
 =C2=A0 =C2=A0 =C2=A05 INTL 20120624)</div><div>(XEN) ACPI: TPM2 76D53650, =
0034 (r3 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tpm2Tabl =C2=A0 =C2=A0 =C2=A0 =C2=A01 A=
MI =C2=A0 =C2=A0 =C2=A0 =C2=A0 0)</div><div>(XEN) ACPI: SSDT 76D53688, 00C9=
 (r1 =C2=A0 MSFT =C2=A0RHPROXY =C2=A0 =C2=A0 =C2=A0 =C2=A01 INTL 20120913)<=
/div><div>(XEN) Domain heap initialised</div><div>(XEN) ACPI: 32/64X FACS a=
ddress mismatch in FADT - 772dde80/0000000000000000, using 32</div><div>(XE=
N) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-86</div><div=
>(XEN) Enabling APIC mode: =C2=A0Flat.=C2=A0 Using 1 I/O APICs</div><div>(X=
EN) CPU0: 400..1000 MHz</div><div>(XEN) Speculative mitigation facilities:<=
/div><div>(XEN) =C2=A0 Hardware features:</div><div>(XEN) =C2=A0 Compiled-i=
n support: SHADOW_PAGING</div><div>(XEN) =C2=A0 Xen settings: BTI-Thunk N/A=
, SPEC_CTRL: No, Other: BRANCH_HARDEN</div><div>(XEN) =C2=A0 Support for HV=
M VMs: RSB</div><div>(XEN) =C2=A0 Support for PV VMs: RSB</div><div>(XEN) =
=C2=A0 XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)</di=
v><div>(XEN) =C2=A0 PV L1TF shadowing: Dom0 disabled, DomU disabled</div><d=
iv>(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)</div><div>(XE=
N) Initializing Credit2 scheduler</div><div>(XEN) Disabling HPET for being =
unreliable</div><div>(XEN) Platform timer is 3.580MHz ACPI PM Timer</div><d=
iv>(XEN) Detected 1333.397 MHz processor.</div><div>(XEN) Unknown cachabili=
ty for MFNs 0xff900-0xfffff</div><div>(XEN) I/O virtualisation disabled</di=
v><div>(XEN) ENABLING IO-APIC IRQs</div><div>(XEN) =C2=A0-&gt; Using new AC=
K method</div><div>(XEN) ----[ Xen-4.14.0 =C2=A0x86_64 =C2=A0debug=3Dn =C2=
=A0 Not tainted ]----</div><div>(XEN) CPU: =C2=A0 =C2=A00</div><div>(XEN) R=
IP: =C2=A0 =C2=A0e008:[&lt;00000000775e0d21&gt;] 00000000775e0d21</div><div=
>(XEN) RFLAGS: 0000000000010046 =C2=A0 CONTEXT: hypervisor</div><div>(XEN) =
rax: 0000000088411fe8 =C2=A0 rbx: ffff82d04047fb48 =C2=A0 rcx: ffff82d04047=
fa60</div><div>(XEN) rdx: 00000000ff900000 =C2=A0 rsi: 00000000ff900000 =C2=
=A0 rdi: 00000000775e4d58</div><div>(XEN) rbp: ffff82d04047fc00 =C2=A0 rsp:=
 ffff82d04047fa38 =C2=A0 r8: =C2=A0ffff82d04047fb48</div><div>(XEN) r9: =C2=
=A00000000000000000 =C2=A0 r10: 00000000ff920000 =C2=A0 r11: 00000000000200=
00</div><div>(XEN) r12: ffff82d04047fc60 =C2=A0 r13: 0000000000000040 =C2=
=A0 r14: 00000000775ce2c0</div><div>(XEN) r15: 00000000775cf9e8 =C2=A0 cr0:=
 0000000080050033 =C2=A0 cr4: 00000000001006e0</div><div>(XEN) cr3: 0000000=
0711d1000 =C2=A0 cr2: 00000000ff900020</div><div>(XEN) fsb: 000000000000000=
0 =C2=A0 gsb: 0000000000000000 =C2=A0 gss: 0000000000000000</div><div>(XEN)=
 ds: 0000 =C2=A0 es: 0000 =C2=A0 fs: 0000 =C2=A0 gs: 0000 =C2=A0 ss: 0000 =
=C2=A0 cs: e008</div><div>(XEN) Xen code around &lt;00000000775e0d21&gt; (0=
0000000775e0d21):</div><div>(XEN) =C2=A08b 11 45 33 c9 49 8b d8 &lt;4c&gt; =
39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10 17 eb</div><div>(XEN) Xen stack trac=
e from rsp=3Dffff82d04047fa38:</div><div>(XEN) =C2=A0 =C2=A000000000775ddb8=
e 00000000775e4d58 0000000040470880 0000000000001698</div><div>(XEN) =C2=A0=
 =C2=A04630002800000001 00000000ff900000 0000000000020000 00000000ff91fff0<=
/div><div>(XEN) =C2=A0 =C2=A000000000ff912057 00000000ff900060 0000000007f7=
0020 0000000000000000</div><div>(XEN) =C2=A0 =C2=A00000000077739001 ffff82d=
0403be10a ffff82d040597760 ffff82d040597394</div><div>(XEN) =C2=A0 =C2=A0ff=
ff82d040377940 00000000ffffffff 0000000000000400 ffff82d04047fc60</div><div=
>(XEN) =C2=A0 =C2=A000000000775e2e73 00000000775da608 ffff82d04047fc70 0000=
000000000000</div><div>(XEN) =C2=A0 =C2=A00000000000000000 ffff82d04036e81f=
 00000000775e2ead ffff82d04036e81f</div><div>(XEN) =C2=A0 =C2=A0ffff82d0403=
6e82b 8000000000000003 0000000000000000 0000000000000000</div><div>(XEN) =
=C2=A0 =C2=A000000000775ddd88 00000000775da610 0000000000000000 ffff82d0404=
7fc70</div><div>(XEN) =C2=A0 =C2=A0ffff82d04036e82b ffff82d04047fc60 ffff82=
d04047fbf8 ffff82d04031eaca</div><div>(XEN) =C2=A0 =C2=A00000000000000000 f=
fff82d04047fd00 ffff82d040597360 0000000000000430</div><div>(XEN) =C2=A0 =
=C2=A0ffff82d040462080 0000000000000200 ffff82d04058860c ffff82d04047fc70</=
div><div>(XEN) =C2=A0 =C2=A000000000775de841 00000000775cf9e8 00000000775d0=
3b5 00000000775ce2c0</div><div>(XEN) =C2=A0 =C2=A00000000000000000 ffff82d0=
4047fc60 0000000000000000 0000000000000000</div><div>(XEN) =C2=A0 =C2=A0000=
00000775d0798 ffff82d04047fc90 0000000000000000 0000000000002022</div><div>=
(XEN) =C2=A0 =C2=A0ffff82d04047fca8 ffff82d04047fc60 000000007146d000 00000=
00079000000</div><div>(XEN) =C2=A0 =C2=A00000000000000206 ffff82d0405886a0 =
ffff82d040471278 0000000000000000</div><div>(XEN) =C2=A0 =C2=A0ffff82d04020=
14cb ffff82d04036e81f ffff82d04047fca0 0000000000000003</div><div>(XEN) =C2=
=A0 =C2=A0ffff82d04047fcf0 0000000000000000 0000000000000000 ff001900010107=
dc</div><div>(XEN) =C2=A0 =C2=A00000000000000000 000000007146d000 000000007=
9000000 ffff82d040462080</div><div>(XEN) Xen call trace:</div><div>(XEN) =
=C2=A0 =C2=A0[&lt;00000000775e0d21&gt;] R 00000000775e0d21</div><div>(XEN) =
=C2=A0 =C2=A0[&lt;00000000775ddb8e&gt;] S 00000000775ddb8e</div><div>(XEN) =
=C2=A0 =C2=A0[&lt;ffff82d04036e81f&gt;] S common_interrupt+0x8f/0x120</div>=
<div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04036e81f&gt;] S common_interrupt+0x8f/=
0x120</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04036e82b&gt;] S common_inte=
rrupt+0x9b/0x120</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04036e82b&gt;] S =
common_interrupt+0x9b/0x120</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04031e=
aca&gt;] S do_IRQ+0x2da/0x6d0</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0402=
014cb&gt;] S efi_get_time+0x6b/0xb0</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff8=
2d04036e81f&gt;] S common_interrupt+0x8f/0x120</div><div>(XEN) =C2=A0 =C2=
=A0[&lt;ffff82d04033e8ed&gt;] S arch/x86/time.c#get_cmos_time+0x1cd/0x290</=
div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04033e8ed&gt;] S arch/x86/time.c#ge=
t_cmos_time+0x1cd/0x290</div><div>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0403fa48a&=
gt;] S setup_boot_APIC_clock+0x13a/0x300</div><div>(XEN) =C2=A0 =C2=A0[&lt;=
ffff82d04040888b&gt;] S init_xen_time+0x2b/0x90</div><div>(XEN) =C2=A0 =C2=
=A0[&lt;ffff82d040405037&gt;] S __start_xen+0x23e7/0x2bf0</div><div>(XEN) =
=C2=A0 =C2=A0[&lt;ffff82d0402000ef&gt;] S __high_start+0x4f/0x60</div><div>=
(XEN)</div><div>(XEN) Pagetable walk from 00000000ff900020:</div><div>(XEN)=
 =C2=A0L4[0x000] =3D 00000000711d0063 ffffffffffffffff</div><div>(XEN) =C2=
=A0L3[0x003] =3D 0000000071468063 ffffffffffffffff</div><div>(XEN) =C2=A0L2=
[0x1fc] =3D 0000000000000000 ffffffffffffffff</div><div>(XEN)</div><div>(XE=
N) ****************************************</div><div>(XEN) Panic on CPU 0:=
</div><div>(XEN) FATAL PAGE FAULT</div><div>(XEN) [error_code=3D0000]</div>=
<div>(XEN) Faulting linear address: 00000000ff900020</div><div>(XEN) ******=
**********************************</div><div>(XEN)</div><div>(XEN) Reboot i=
n five seconds...</div></div></div></div>

--0000000000008ca1dd05ad42d6a0--

