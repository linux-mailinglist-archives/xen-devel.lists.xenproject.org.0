Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE26B9C04
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509752.786157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7mL-0002SU-0l; Tue, 14 Mar 2023 16:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509752.786157; Tue, 14 Mar 2023 16:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7mK-0002Pg-Sg; Tue, 14 Mar 2023 16:45:36 +0000
Received: by outflank-mailman (input) for mailman id 509752;
 Tue, 14 Mar 2023 16:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pc7mI-0002Pa-MB
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:45:35 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2676293-c287-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 17:45:32 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap40.server.lan [172.19.172.40]) (via HTTP); Tue, 14 Mar
 2023 17:45:31 +0100
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
X-Inumbo-ID: a2676293-c287-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678812331; i=tachyon_gun@web.de;
	bh=hqSs9+vgGecSX06POa+8NSeACJGcM9cmtdjH81+/skI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=izhJK0+Fi8YCQ9iznH8VjjwSLiCtAYNfyflPlUEMMX51bCChkt2mPWp7d0JDIgDL5
	 J6+QBfxAuSphMvV+LwKJOfsK7/dCmBmsiFDQaWJR2C4u/qK/rt5+pT8PIhGLJyr9nO
	 FPzV4OeznlQFfyIvrb5jLz6LSHpVwCWqFOEPnFHcBBMWl/s5ubGeUYF5343ouNgTYo
	 uj6W8ZvpvAmNgRtMTrerfWWnN/Ks9gAig21eOXNQxOlZ59/dKBmibK9sVYb4CqmKFi
	 UHNBDtSC94FH2Ansc2WCk38uOkqDDrAgT1SCy438R86QoqICNdXXCx/gyKxGyqGdPB
	 evKtCNHmCV7pQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-720cf1eb-48bc-4eba-9e14-e9eb570b1e7f-1678812331526@3c-app-webde-bap40>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Type: multipart/mixed;
 boundary=abmob-adb2cd80-116f-4618-b871-47724293d146
Date: Tue, 14 Mar 2023 17:45:31 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:nZoJyIFwFvlbsiWTfZV/1tyHY0tYYBvtHu1zNlQ0NxzL6hIM/U6AVAH9DryH+wP1/6h2Q
 RauUSDF0bjrQdspZV4Osx3mDgESeXyVxw9wKyHSNVLTGEkoGmpQdO9sh/xOY89g5gMi8XpwGJ9ZB
 Gy9OVHnEsf6c2yWBnx8XJFhkoky/IWdhTYkH5ri6ebpnSaikqWLGecPIVSRSoQ789ibGPk1GiYHp
 DXdmVKDKGVEbSCLbYvZNPt3n3ZpmxmbRo+1HgM44VH9FWbB/NTxQB7pzK4rqPGhfrOmdE5nk0QOm
 lg=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wJnNfoM4Y+g=;QwEEqq+27lzwX0js4t3zay1dACx
 jCGpuvv+CB7heskIY2jh/3tX8KIGNDlbd/EHKvOBNNzLNbWl+PagSMU5Defx+UtebDnYrMB4x
 EL8ejOeOGkWyzoe3xtAL3QaEBdhhp2qVXAiCcDZwk74dXp6FdjsPfNSjK/hsYzz13/LdtGkiM
 6mvbp2KW2QnGugiRCt2TftdzvrxDFycMxRCY7lZ+5JJPjSrn/c0g6CRxQtamXdzz+1jR2e/Kn
 P719rhIcPrWYUpQnvbYpiCqREWMCM+y6uC/P8nnXcOP8zFmzWylyYT8DS+Id0FsVK2Okr5aVT
 qd8tr0Xts1EK2KzNp414K4f2Bc9ns/vWvvonjwuwuC/75NoqSiQSrxKtz7cWpqC3n+BcB/QwR
 No6+XnPdYb3C4pfj//H/eF1k3x2SfyyJUoPfdxOmkdsCvuNwzcluN9kjIMykhpOpu5Aqny+HE
 uM0sxfieq+R9882/47Pk7tqbEni7vDXXaCaAGKDwH7QBHQbvVaXTIgPm5vNNH0cUIB3bv0yXy
 zpiWcY88DUtO8Ze4GaUdNGmanrGPnQFrtdL7wcjjNHh3sOVD3dEzL0GPcuwlyKLJLfSgjynJZ
 afRLB1xRmPdaUstWN559mP0xWsvc4gbvzZTcJ5hhVpqGcwIpxsSL6OddLamYm/tcBtuHLfFrj
 DkCMi9BT7WJIGkV268qu0kELvswMLWFKoRmzL/7e6XOOxaljdl4nug6IYj+NJ6qQbQBRMOI8b
 g9b7zZIrxuOGl/tkNZhVxONIzBsNkkPSUj5xhkoqFRWl9iFvL1akkh0BuC3NEYcXqDFXZOZVy
 ulqJa3E7JL9GtJgOAy7f1UQA==

--abmob-adb2cd80-116f-4618-b871-47724293d146
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14.03.2023 16:37, Jan Beulich wrote:
> On 14.03.2023 15:53, Denis wrote:
> > On 14.03.2023 07:37; Jan Beulich wrote:
> >> On 14.03.2023 02:15, Denis wrote:
> >>> On 13.03.2023 10:36, Jan wrote
> >>>> On 10.03.2023 21:50, Denis wrote:
> >>>>> Should I test something else?
> >>>>
> >>>> ... there was no request for any further testing here, for the mome=
nt.
> >>>
> >>> ah...sorry, going by "Would be nice to have this confirmed forthe sy=
stem
> >>> in question, i.e. without Xen underneath Linux" I thought I could te=
st
> >>> something which might help shed some light on all of this.
> >>
> >> Well, yes, that Linux-without-Xen test would still be useful to have
> >> results from. I didn't account for this in my earlier reply because
> >> I had asked for it before already, and I did take "something else"
> >> for meaning anything that might have turned up as useful from the new
> >> data you had provided.
> >
> > What tests could I do or what info should I provide to help?
>
> Boot plain Linux (no Xen underneath) and collect the full set of kernel
> boot messages (some distros store this at /var/log/boot.msg); "full"
> meaning we want to be able to see all output regardless of log-level.

I'll attach some files from /var/log.


Denis

--abmob-adb2cd80-116f-4618-b871-47724293d146
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=devuan_var-log-debug.log

Mar 14 17:24:02 Gemini-Sector kernel: [    0.004391] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.004394] e820: remove [mem 0x000a0000-0x000fffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010417] MTRR default type: uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010419] MTRR fixed ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010420]   00000-9FFFF write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010422]   A0000-BFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010423]   C0000-C7FFF write-protect
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010425]   C8000-FFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010426] MTRR variable ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010428]   0 base 000000000000 mask FFFF80000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010430]   1 base 000080000000 mask FFFFC0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010432]   2 base 0000C0000000 mask FFFFF0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010433]   3 base 0000CFD00000 mask FFFFFFF00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010434]   4 base 0000CFE00000 mask FFFFFFE00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010436]   5 base 000100000000 mask FFFF00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010437]   6 base 000200000000 mask FFFE00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010438]   7 base 000400000000 mask FFFFE0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010440] TOM2: 0000000430000000 aka 17152M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011752] e820: update [mem 0xcfd00000-0xffffffff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033020] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033685] On node 0 totalpages: 4193418
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033687]   DMA zone: 64 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033688]   DMA zone: 21 pages reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033689]   DMA zone: 3994 pages, LIFO batch:0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033690]   DMA32 zone: 13236 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033691]   DMA32 zone: 847088 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033692]   Normal zone: 52224 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033693]   Normal zone: 3342336 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046890] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046918] ACPI: IRQ0 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046919] ACPI: IRQ9 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052718] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052720] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
Mar 14 17:24:02 Gemini-Sector kernel: [    0.119284] spurious 8259A interrupt: IRQ7.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: io port [9000, ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] Fam 10h mmconf [mem 0xe0000000-0xe00fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [a0000, bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [d0000000, dfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [f0000000, ffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [e0000000, e06fffff] ==> [e0100000, e06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: [bus 00-06] on node 0 link 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [io  0x0000-0xffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x000a0000-0x000bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xd0000000-0xdfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0700000-0xffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0100000-0xe06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x430000000-0xfcffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613815] PCI: pci_cache_line_size set to 64 bytes
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613873] e820: reserve RAM buffer [mem 0x0009b800-0x0009ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613874] e820: reserve RAM buffer [mem 0xcfcf0000-0xcfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632548] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632864] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633013] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633369] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633437] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633637] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515113]   with arguments:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515114]     /init
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]   with environment:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]     HOME=/
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515116]     TERM=linux
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515117]     BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64
Mar 14 17:24:02 Gemini-Sector kernel: [    1.609682] libata version 3.00 loaded.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610233] QUIRK: Enable AMD PLL fix
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617448] ahci 0000:00:11.0: version 3.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151645] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
Mar 14 17:24:02 Gemini-Sector kernel: [    3.487865] PM: Image not found (code -22)
--abmob-adb2cd80-116f-4618-b871-47724293d146
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=devuan_var-log-dmesg.log

[    0.000000] Linux version 5.10.0-21-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.162-1 (2023-01-21)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009b7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cfceffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cfcf0000-0x00000000cfcf0fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cfcf1000-0x00000000cfcfffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000cfd00000-0x00000000cfdfffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000042fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. GA-890FXA-UD5/GA-890FXA-UD5, BIOS F6 11/24/2010
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2611.619 MHz processor
[    0.004391] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.004394] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.010357] AGP: No AGP bridge found
[    0.010414] last_pfn = 0x430000 max_arch_pfn = 0x400000000
[    0.010417] MTRR default type: uncachable
[    0.010419] MTRR fixed ranges enabled:
[    0.010420]   00000-9FFFF write-back
[    0.010422]   A0000-BFFFF uncachable
[    0.010423]   C0000-C7FFF write-protect
[    0.010425]   C8000-FFFFF uncachable
[    0.010426] MTRR variable ranges enabled:
[    0.010428]   0 base 000000000000 mask FFFF80000000 write-back
[    0.010430]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.010432]   2 base 0000C0000000 mask FFFFF0000000 write-back
[    0.010433]   3 base 0000CFD00000 mask FFFFFFF00000 uncachable
[    0.010434]   4 base 0000CFE00000 mask FFFFFFE00000 uncachable
[    0.010436]   5 base 000100000000 mask FFFF00000000 write-back
[    0.010437]   6 base 000200000000 mask FFFE00000000 write-back
[    0.010438]   7 base 000400000000 mask FFFFE0000000 write-back
[    0.010440] TOM2: 0000000430000000 aka 17152M
[    0.011670] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.011752] e820: update [mem 0xcfd00000-0xffffffff] usable ==> reserved
[    0.011760] last_pfn = 0xcfcf0 max_arch_pfn = 0x400000000
[    0.013968] found SMP MP-table at [mem 0x000f46f0-0x000f46ff]
[    0.032578] Using GB pages for direct mapping
[    0.032935] RAMDISK: [mem 0x34525000-0x36289fff]
[    0.032939] ACPI: Early table checksum verification disabled
[    0.032943] ACPI: RSDP 0x00000000000F6100 000014 (v00 GBT   )
[    0.032948] ACPI: RSDT 0x00000000CFCF1000 000044 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
[    0.032955] ACPI: FACP 0x00000000CFCF1080 000074 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
[    0.032961] ACPI: DSDT 0x00000000CFCF1100 007BE3 (v01 GBT    GBTUACPI 00001000 MSFT 03000000)
[    0.032965] ACPI: FACS 0x00000000CFCF0000 000040
[    0.032968] ACPI: SSDT 0x00000000CFCF8DC0 00088C (v01 PTLTD  POWERNOW 00000001  LTP 00000001)
[    0.032972] ACPI: HPET 0x00000000CFCF9680 000038 (v01 GBT    GBTUACPI 42302E31 GBTU 00000098)
[    0.032977] ACPI: MCFG 0x00000000CFCF96C0 00003C (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
[    0.032980] ACPI: MATS 0x00000000CFCF9700 000034 (v01 GBT             00000000      00000000)
[    0.032984] ACPI: TAMG 0x00000000CFCF9770 000202 (v01 GBT    GBT   B0 5455312E BG?? 53450101)
[    0.032989] ACPI: APIC 0x00000000CFCF8D00 0000BC (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
[    0.032993] ACPI: IVRS 0x00000000CFCF99F0 0000C0 (v01 AMD    RD890S   00202031 AMD  00000000)
[    0.032997] ACPI: Reserving FACP table memory at [mem 0xcfcf1080-0xcfcf10f3]
[    0.032998] ACPI: Reserving DSDT table memory at [mem 0xcfcf1100-0xcfcf8ce2]
[    0.032999] ACPI: Reserving FACS table memory at [mem 0xcfcf0000-0xcfcf003f]
[    0.033001] ACPI: Reserving SSDT table memory at [mem 0xcfcf8dc0-0xcfcf964b]
[    0.033002] ACPI: Reserving HPET table memory at [mem 0xcfcf9680-0xcfcf96b7]
[    0.033003] ACPI: Reserving MCFG table memory at [mem 0xcfcf96c0-0xcfcf96fb]
[    0.033004] ACPI: Reserving MATS table memory at [mem 0xcfcf9700-0xcfcf9733]
[    0.033005] ACPI: Reserving TAMG table memory at [mem 0xcfcf9770-0xcfcf9971]
[    0.033006] ACPI: Reserving APIC table memory at [mem 0xcfcf8d00-0xcfcf8dbb]
[    0.033007] ACPI: Reserving IVRS table memory at [mem 0xcfcf99f0-0xcfcf9aaf]
[    0.033020] ACPI: Local APIC address 0xfee00000
[    0.033068] Scanning NUMA topology in Northbridge 24
[    0.033078] No NUMA configuration found
[    0.033080] Faking a node at [mem 0x0000000000000000-0x000000042fffffff]
[    0.033091] NODE_DATA(0) allocated [mem 0x42ffd6000-0x42fffffff]
[    0.033663] Zone ranges:
[    0.033664]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.033666]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.033668]   Normal   [mem 0x0000000100000000-0x000000042fffffff]
[    0.033670]   Device   empty
[    0.033671] Movable zone start for each node
[    0.033676] Early memory node ranges
[    0.033677]   node   0: [mem 0x0000000000001000-0x000000000009afff]
[    0.033679]   node   0: [mem 0x0000000000100000-0x00000000cfceffff]
[    0.033680]   node   0: [mem 0x0000000100000000-0x000000042fffffff]
[    0.033683] Initmem setup node 0 [mem 0x0000000000001000-0x000000042fffffff]
[    0.033685] On node 0 totalpages: 4193418
[    0.033687]   DMA zone: 64 pages used for memmap
[    0.033688]   DMA zone: 21 pages reserved
[    0.033689]   DMA zone: 3994 pages, LIFO batch:0
[    0.033690]   DMA32 zone: 13236 pages used for memmap
[    0.033691]   DMA32 zone: 847088 pages, LIFO batch:63
[    0.033692]   Normal zone: 52224 pages used for memmap
[    0.033693]   Normal zone: 3342336 pages, LIFO batch:63
[    0.033697] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.033749] On node 0, zone DMA: 101 pages in unavailable ranges
[    0.046702] On node 0, zone Normal: 784 pages in unavailable ranges
[    0.046887] ACPI: PM-Timer IO Port: 0x808
[    0.046890] ACPI: Local APIC address 0xfee00000
[    0.046896] ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
[    0.046897] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
[    0.046898] ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
[    0.046899] ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
[    0.046901] ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
[    0.046902] ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
[    0.046903] ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
[    0.046904] ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
[    0.046912] IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
[    0.046914] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.046916] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.046918] ACPI: IRQ0 used by override.
[    0.046919] ACPI: IRQ9 used by override.
[    0.046921] Using ACPI (MADT) for SMP configuration information
[    0.046923] ACPI: HPET id: 0x10b9a201 base: 0xfed00000
[    0.046927] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
[    0.046943] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.046945] PM: hibernation: Registered nosave memory: [mem 0x0009b000-0x0009ffff]
[    0.046946] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
[    0.046947] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
[    0.046949] PM: hibernation: Registered nosave memory: [mem 0xcfcf0000-0xcfcf0fff]
[    0.046950] PM: hibernation: Registered nosave memory: [mem 0xcfcf1000-0xcfcfffff]
[    0.046951] PM: hibernation: Registered nosave memory: [mem 0xcfd00000-0xcfdfffff]
[    0.046952] PM: hibernation: Registered nosave memory: [mem 0xcfe00000-0xdfffffff]
[    0.046953] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.046954] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfebfffff]
[    0.046955] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xffffffff]
[    0.046957] [mem 0xcfe00000-0xdfffffff] available for PCI devices
[    0.046958] Booting paravirtualized kernel on bare hardware
[    0.046961] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.052012] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.052712] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
[    0.052718] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
[    0.052720] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
[    0.052756] Built 1 zonelists, mobility grouping on.  Total pages: 4127873
[    0.052757] Policy zone: Normal
[    0.052758] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
[    0.055863] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.057394] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.057432] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.069788] AGP: Checking aperture...
[    0.075746] AGP: No AGP bridge found
[    0.075750] AGP: Node 0: aperture [bus addr 0x7fe000000-0x7ffffffff] (32MB)
[    0.075751] Aperture beyond 4GB. Ignoring.
[    0.075752] AGP: Your BIOS doesn't leave an aperture memory hole
[    0.075752] AGP: Please enable the IOMMU option in the BIOS setup
[    0.075753] AGP: This costs you 64MB of RAM
[    0.075757] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff] (65536KB)
[    0.075759] PM: hibernation: Registered nosave memory: [mem 0xc4000000-0xc7ffffff]
[    0.096999] Memory: 3373884K/16773672K available (12295K kernel code, 2537K rwdata, 7560K rodata, 2660K init, 5468K bss, 487536K reserved, 0K cma-reserved)
[    0.097354] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.097375] ftrace: allocating 36545 entries in 143 pages
[    0.112697] ftrace: allocated 143 pages with 5 groups
[    0.112882] rcu: Hierarchical RCU implementation.
[    0.112884] rcu:     RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.112885]  Rude variant of Tasks RCU enabled.
[    0.112886]  Tracing variant of Tasks RCU enabled.
[    0.112887] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.112888] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.118935] NR_IRQS: 524544, nr_irqs: 488, preallocated irqs: 16
[    0.119284] spurious 8259A interrupt: IRQ7.
[    0.121215] Console: colour VGA+ 80x25
[    0.121232] printk: console [tty0] enabled
[    0.121256] ACPI: Core revision 20200925
[    0.121377] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.121392] APIC: Switch to symmetric I/O mode setup
[    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
[    0.121495] AMD-Vi: Disabling interrupt remapping
[    0.121937] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.141395] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x25a51c371bd, max_idle_ns: 440795253524 ns
[    0.141398] Calibrating delay loop (skipped), value calculated using timer frequency.. 5223.23 BogoMIPS (lpj=10446476)
[    0.141402] pid_max: default: 32768 minimum: 301
[    0.141482] LSM: Security Framework initializing
[    0.141502] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.141546] AppArmor: AppArmor initialized
[    0.141548] TOMOYO Linux initialized
[    0.141634] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.141687] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.142043] LVT offset 0 assigned for vector 0xf9
[    0.142048] process: using AMD E400 aware idle routine
[    0.142050] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    0.142051] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    0.142054] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.142056] Spectre V2 : Mitigation: Retpolines
[    0.142057] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.142058] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.150749] Freeing SMP alternatives memory: 32K
[    0.153405] process: System has AMD C1E enabled
[    0.265118] process: Switch to broadcast mode on CPU0
[    0.265124] smpboot: CPU0: AMD Phenom(tm) II X4 910e Processor (family: 0x10, model: 0x4, stepping: 0x3)
[    0.265328] Performance Events: AMD PMU driver.
[    0.265333] ... version:                0
[    0.265333] ... bit width:              48
[    0.265334] ... generic registers:      4
[    0.265335] ... value mask:             0000ffffffffffff
[    0.265336] ... max period:             00007fffffffffff
[    0.265337] ... fixed-purpose events:   0
[    0.265338] ... event mask:             000000000000000f
[    0.265396] rcu: Hierarchical SRCU implementation.
[    0.265396] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.265396] smp: Bringing up secondary CPUs ...
[    0.265396] x86: Booting SMP configuration:
[    0.265396] .... node  #0, CPUs:      #1
[    0.006140] __common_interrupt: 1.55 No irq handler for vector
[    0.006140] process: Switch to broadcast mode on CPU1
[    0.265396]  #2
[    0.006140] __common_interrupt: 2.55 No irq handler for vector
[    0.006140] process: Switch to broadcast mode on CPU2
[    0.267876]  #3
[    0.006140] __common_interrupt: 3.55 No irq handler for vector
[    0.006140] process: Switch to broadcast mode on CPU3
[    0.269466] smp: Brought up 1 node, 4 CPUs
[    0.269466] smpboot: Max logical packages: 2
[    0.269466] smpboot: Total of 4 processors activated (20892.95 BogoMIPS)
[    0.305057] node 0 deferred pages initialised in 28ms
[    0.305964] devtmpfs: initialized
[    0.305964] x86/mm: Memory block size: 128MB
[    0.307219] PM: Registering ACPI NVS region [mem 0xcfcf0000-0xcfcf0fff] (4096 bytes)
[    0.307219] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.307219] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.307219] pinctrl core: initialized pinctrl subsystem
[    0.307219] NET: Registered protocol family 16
[    0.307219] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
[    0.309513] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.309923] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.309936] audit: initializing netlink subsys (disabled)
[    0.309955] audit: type=2000 audit(1678811032.188:1): state=initialized audit_enabled=0 res=1
[    0.309955] thermal_sys: Registered thermal governor 'fair_share'
[    0.309955] thermal_sys: Registered thermal governor 'bang_bang'
[    0.309955] thermal_sys: Registered thermal governor 'step_wise'
[    0.309955] thermal_sys: Registered thermal governor 'user_space'
[    0.309955] thermal_sys: Registered thermal governor 'power_allocator'
[    0.309955] cpuidle: using governor ladder
[    0.309955] cpuidle: using governor menu
[    0.309955] node 0 link 0: io port [9000, ffff]
[    0.309955] TOM: 00000000d0000000 aka 3328M
[    0.309955] Fam 10h mmconf [mem 0xe0000000-0xe00fffff]
[    0.309955] node 0 link 0: mmio [a0000, bffff]
[    0.309955] node 0 link 0: mmio [d0000000, dfffffff]
[    0.309955] node 0 link 0: mmio [f0000000, ffffffff]
[    0.309955] node 0 link 0: mmio [e0000000, e06fffff] ==> [e0100000, e06fffff]
[    0.309955] TOM2: 0000000430000000 aka 17152M
[    0.309955] bus: [bus 00-06] on node 0 link 0
[    0.309955] bus: 00 [io  0x0000-0xffff]
[    0.309955] bus: 00 [mem 0x000a0000-0x000bffff]
[    0.309955] bus: 00 [mem 0xd0000000-0xdfffffff]
[    0.309955] bus: 00 [mem 0xe0700000-0xffffffff]
[    0.309955] bus: 00 [mem 0xe0100000-0xe06fffff]
[    0.309955] bus: 00 [mem 0x430000000-0xfcffffffff]
[    0.309955] ACPI: bus type PCI registered
[    0.309955] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.309955] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.309955] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.309955] PCI: Using configuration type 1 for base access
[    0.309955] mtrr: your CPUs had inconsistent variable MTRR settings
[    0.309955] mtrr: probably your BIOS does not setup all CPUs.
[    0.309955] mtrr: corrected configuration.
[    0.310909] Kprobes globally optimized
[    0.310920] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.310920] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.554293] ACPI: Added _OSI(Module Device)
[    0.554293] ACPI: Added _OSI(Processor Device)
[    0.554293] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.554293] ACPI: Added _OSI(Processor Aggregator Device)
[    0.554293] ACPI: Added _OSI(Linux-Dell-Video)
[    0.554293] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.554293] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.561249] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
[    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
[    0.565721] ACPI: Interpreter enabled
[    0.565742] ACPI: (supports S0 S3 S4 S5)
[    0.565744] ACPI: Using IOAPIC for interrupt routing
[    0.565779] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.565930] ACPI: Enabled 9 GPEs in block 00 to 1F
[    0.571332] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.571338] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.571605] PCI host bridge to bus 0000:00
[    0.571608] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.571609] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.571611] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.571612] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
[    0.571614] pci_bus 0000:00: root bus resource [mem 0xcff00000-0xfebfffff window]
[    0.571615] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.571628] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
[    0.571637] pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
[    0.571748] pci 0000:00:00.2: [1002:5a23] type 00 class 0x080600
[    0.571857] pci 0000:00:02.0: [1002:5a16] type 01 class 0x060400
[    0.571873] pci 0000:00:02.0: enabling Extended Tags
[    0.571897] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
[    0.572009] pci 0000:00:05.0: [1002:5a19] type 01 class 0x060400
[    0.572024] pci 0000:00:05.0: enabling Extended Tags
[    0.572047] pci 0000:00:05.0: PME# supported from D0 D3hot D3cold
[    0.572158] pci 0000:00:06.0: [1002:5a1a] type 01 class 0x060400
[    0.572173] pci 0000:00:06.0: enabling Extended Tags
[    0.572195] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.572303] pci 0000:00:07.0: [1002:5a1b] type 01 class 0x060400
[    0.572318] pci 0000:00:07.0: enabling Extended Tags
[    0.572340] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.572452] pci 0000:00:0d.0: [1002:5a1e] type 01 class 0x060400
[    0.572467] pci 0000:00:0d.0: enabling Extended Tags
[    0.572488] pci 0000:00:0d.0: PME# supported from D0 D3hot D3cold
[    0.572611] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
[    0.572623] pci 0000:00:11.0: reg 0x10: [io  0xff00-0xff07]
[    0.572630] pci 0000:00:11.0: reg 0x14: [io  0xfe00-0xfe03]
[    0.572637] pci 0000:00:11.0: reg 0x18: [io  0xfd00-0xfd07]
[    0.572643] pci 0000:00:11.0: reg 0x1c: [io  0xfc00-0xfc03]
[    0.572650] pci 0000:00:11.0: reg 0x20: [io  0xfb00-0xfb0f]
[    0.572657] pci 0000:00:11.0: reg 0x24: [mem 0xfdfff000-0xfdfff3ff]
[    0.572783] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
[    0.572795] pci 0000:00:12.0: reg 0x10: [mem 0xfdffe000-0xfdffefff]
[    0.572938] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
[    0.572950] pci 0000:00:12.2: reg 0x10: [mem 0xfdffd000-0xfdffd0ff]
[    0.573008] pci 0000:00:12.2: supports D1 D2
[    0.573009] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
[    0.573112] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
[    0.573124] pci 0000:00:13.0: reg 0x10: [mem 0xfdffc000-0xfdffcfff]
[    0.573262] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
[    0.573274] pci 0000:00:13.2: reg 0x10: [mem 0xfdffb000-0xfdffb0ff]
[    0.573332] pci 0000:00:13.2: supports D1 D2
[    0.573333] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
[    0.573452] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
[    0.573591] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
[    0.573732] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
[    0.573864] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
[    0.573876] pci 0000:00:14.5: reg 0x10: [mem 0xfdffa000-0xfdffafff]
[    0.574012] pci 0000:00:16.0: [1002:4397] type 00 class 0x0c0310
[    0.574024] pci 0000:00:16.0: reg 0x10: [mem 0xfdff9000-0xfdff9fff]
[    0.574162] pci 0000:00:16.2: [1002:4396] type 00 class 0x0c0320
[    0.574174] pci 0000:00:16.2: reg 0x10: [mem 0xfdff8000-0xfdff80ff]
[    0.574232] pci 0000:00:16.2: supports D1 D2
[    0.574233] pci 0000:00:16.2: PME# supported from D0 D1 D2 D3hot
[    0.574334] pci 0000:00:18.0: [1022:1200] type 00 class 0x060000
[    0.574415] pci 0000:00:18.1: [1022:1201] type 00 class 0x060000
[    0.574493] pci 0000:00:18.2: [1022:1202] type 00 class 0x060000
[    0.574570] pci 0000:00:18.3: [1022:1203] type 00 class 0x060000
[    0.574650] pci 0000:00:18.4: [1022:1204] type 00 class 0x060000
[    0.574780] pci 0000:01:00.0: [1002:68f9] type 00 class 0x030000
[    0.574793] pci 0000:01:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.574801] pci 0000:01:00.0: reg 0x18: [mem 0xfddc0000-0xfdddffff 64bit]
[    0.574807] pci 0000:01:00.0: reg 0x20: [io  0xee00-0xeeff]
[    0.574818] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.574822] pci 0000:01:00.0: enabling Extended Tags
[    0.574858] pci 0000:01:00.0: supports D1 D2
[    0.574941] pci 0000:01:00.1: [1002:aa68] type 00 class 0x040300
[    0.574953] pci 0000:01:00.1: reg 0x10: [mem 0xfddfc000-0xfddfffff 64bit]
[    0.574980] pci 0000:01:00.1: enabling Extended Tags
[    0.575015] pci 0000:01:00.1: supports D1 D2
[    0.585431] pci 0000:00:02.0: PCI bridge to [bus 01]
[    0.585435] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[    0.585437] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
[    0.585440] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.585485] pci 0000:00:05.0: PCI bridge to [bus 02]
[    0.585488] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
[    0.585490] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
[    0.585492] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
[    0.585517] pci 0000:00:06.0: PCI bridge to [bus 03]
[    0.585520] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
[    0.585521] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
[    0.585524] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
[    0.585570] pci 0000:04:00.0: [10ec:8168] type 00 class 0x020000
[    0.585585] pci 0000:04:00.0: reg 0x10: [io  0xbe00-0xbeff]
[    0.585604] pci 0000:04:00.0: reg 0x18: [mem 0xfd5ff000-0xfd5fffff 64bit pref]
[    0.585615] pci 0000:04:00.0: reg 0x20: [mem 0xfd5f8000-0xfd5fbfff 64bit pref]
[    0.585624] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.585694] pci 0000:04:00.0: supports D1 D2
[    0.585696] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.597434] pci 0000:00:07.0: PCI bridge to [bus 04]
[    0.597438] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
[    0.597440] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
[    0.597443] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
[    0.597494] pci 0000:05:00.0: [8086:150e] type 00 class 0x020000
[    0.597506] pci 0000:05:00.0: reg 0x10: [mem 0xfd280000-0xfd2fffff]
[    0.597523] pci 0000:05:00.0: reg 0x1c: [mem 0xfd4fc000-0xfd4fffff]
[    0.597597] pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
[    0.597683] pci 0000:05:00.1: [8086:150e] type 00 class 0x020000
[    0.597695] pci 0000:05:00.1: reg 0x10: [mem 0xfd380000-0xfd3fffff]
[    0.597712] pci 0000:05:00.1: reg 0x1c: [mem 0xfd4f8000-0xfd4fbfff]
[    0.597778] pci 0000:05:00.1: PME# supported from D0 D3hot D3cold
[    0.597845] pci 0000:05:00.2: [8086:150e] type 00 class 0x020000
[    0.597856] pci 0000:05:00.2: reg 0x10: [mem 0xfd400000-0xfd47ffff]
[    0.597873] pci 0000:05:00.2: reg 0x1c: [mem 0xfd4f4000-0xfd4f7fff]
[    0.597938] pci 0000:05:00.2: PME# supported from D0 D3hot D3cold
[    0.598007] pci 0000:05:00.3: [8086:150e] type 00 class 0x020000
[    0.598019] pci 0000:05:00.3: reg 0x10: [mem 0xfd300000-0xfd37ffff]
[    0.598036] pci 0000:05:00.3: reg 0x1c: [mem 0xfd4f0000-0xfd4f3fff]
[    0.598101] pci 0000:05:00.3: PME# supported from D0 D3hot D3cold
[    0.609431] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    0.609435] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
[    0.609437] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
[    0.609439] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.609450] pci_bus 0000:06: extended config space not accessible
[    0.609488] pci 0000:06:06.0: [1102:0004] type 00 class 0x040100
[    0.609505] pci 0000:06:06.0: reg 0x10: [io  0x9f00-0x9f3f]
[    0.609584] pci 0000:06:06.0: supports D1 D2
[    0.609645] pci 0000:06:06.1: [1102:7003] type 00 class 0x098000
[    0.609661] pci 0000:06:06.1: reg 0x10: [io  0x9e00-0x9e07]
[    0.609736] pci 0000:06:06.1: supports D1 D2
[    0.609779] pci 0000:06:06.2: [1102:4001] type 00 class 0x0c0010
[    0.609797] pci 0000:06:06.2: reg 0x10: [mem 0xfd8ff000-0xfd8ff7ff]
[    0.609807] pci 0000:06:06.2: reg 0x14: [mem 0xfd8f8000-0xfd8fbfff]
[    0.609882] pci 0000:06:06.2: supports D1 D2
[    0.609883] pci 0000:06:06.2: PME# supported from D0 D1 D2 D3hot
[    0.609958] pci 0000:00:14.4: PCI bridge to [bus 06] (subtractive decode)
[    0.609961] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
[    0.609964] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
[    0.609967] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
[    0.609969] pci 0000:00:14.4:   bridge window [io  0x0000-0x0cf7 window] (subtractive decode)
[    0.609970] pci 0000:00:14.4:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
[    0.609971] pci 0000:00:14.4:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
[    0.609973] pci 0000:00:14.4:   bridge window [mem 0x000c0000-0x000dffff window] (subtractive decode)
[    0.609974] pci 0000:00:14.4:   bridge window [mem 0xcff00000-0xfebfffff window] (subtractive decode)
[    0.610238] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 11) *0
[    0.610288] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 11) *0
[    0.610335] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11) *0
[    0.610380] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 11) *0
[    0.610425] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11) *0
[    0.610470] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11) *0
[    0.610515] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 6 7 10 11) *0
[    0.610560] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11) *0
[    0.611146] iommu: Default domain type: Translated
[    0.611174] pci 0000:01:00.0: vgaarb: setting as boot VGA device
[    0.611174] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.611174] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.611174] vgaarb: loaded
[    0.611174] EDAC MC: Ver: 3.0.0
[    0.611174] NetLabel: Initializing
[    0.611174] NetLabel:  domain hash size = 128
[    0.611174] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.611174] NetLabel:  unlabeled traffic allowed by default
[    0.611174] PCI: Using ACPI for IRQ routing
[    0.613815] PCI: pci_cache_line_size set to 64 bytes
[    0.613873] e820: reserve RAM buffer [mem 0x0009b800-0x0009ffff]
[    0.613874] e820: reserve RAM buffer [mem 0xcfcf0000-0xcfffffff]
[    0.613898] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.613902] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.617401] clocksource: Switched to clocksource tsc-early
[    0.632217] VFS: Disk quotas dquot_6.6.0
[    0.632240] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.632400] AppArmor: AppArmor Filesystem Enabled
[    0.632419] pnp: PnP ACPI init
[    0.632538] system 00:00: [io  0x04d0-0x04d1] has been reserved
[    0.632540] system 00:00: [io  0x0220-0x0225] has been reserved
[    0.632542] system 00:00: [io  0x0290-0x0294] has been reserved
[    0.632548] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.632794] pnp 00:01: disabling [mem 0x00000000-0x00000fff window] because it overlaps 0000:01:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
[    0.632798] pnp 00:01: disabling [mem 0x00000000-0x00000fff window disabled] because it overlaps 0000:04:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
[    0.632830] system 00:01: [io  0x0900-0x091f] has been reserved
[    0.632832] system 00:01: [io  0x0228-0x022f] has been reserved
[    0.632833] system 00:01: [io  0x040b] has been reserved
[    0.632835] system 00:01: [io  0x04d6] has been reserved
[    0.632837] system 00:01: [io  0x0c00-0x0c01] has been reserved
[    0.632838] system 00:01: [io  0x0c14] has been reserved
[    0.632840] system 00:01: [io  0x0c50-0x0c52] has been reserved
[    0.632841] system 00:01: [io  0x0c6c-0x0c6d] has been reserved
[    0.632846] system 00:01: [io  0x0c6f] has been reserved
[    0.632848] system 00:01: [io  0x0cd0-0x0cd1] has been reserved
[    0.632849] system 00:01: [io  0x0cd2-0x0cd3] has been reserved
[    0.632851] system 00:01: [io  0x0cd4-0x0cdf] has been reserved
[    0.632852] system 00:01: [io  0x0800-0x08fe] has been reserved
[    0.632853] system 00:01: [io  0x0a10-0x0a17] has been reserved
[    0.632855] system 00:01: [io  0x0b00-0x0b0f] has been reserved
[    0.632856] system 00:01: [io  0x0b10-0x0b1f] has been reserved
[    0.632858] system 00:01: [io  0x0b20-0x0b3f] has been reserved
[    0.632860] system 00:01: [mem 0xfee00400-0xfee00fff window] has been reserved
[    0.632864] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.633013] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.633369] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.633433] system 00:04: [mem 0xe0000000-0xefffffff] has been reserved
[    0.633437] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.633615] system 00:05: [mem 0x000d4200-0x000d7fff] has been reserved
[    0.633617] system 00:05: [mem 0x000f0000-0x000f7fff] could not be reserved
[    0.633618] system 00:05: [mem 0x000f8000-0x000fbfff] could not be reserved
[    0.633620] system 00:05: [mem 0x000fc000-0x000fffff] could not be reserved
[    0.633621] system 00:05: [mem 0xcfcf0000-0xcfcfffff] could not be reserved
[    0.633623] system 00:05: [mem 0xffff0000-0xffffffff] has been reserved
[    0.633624] system 00:05: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.633626] system 00:05: [mem 0x00100000-0xcfceffff] could not be reserved
[    0.633627] system 00:05: [mem 0xcfd00000-0xcfdfffff] has been reserved
[    0.633629] system 00:05: [mem 0xcfe00000-0xcfefffff] could not be reserved
[    0.633630] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.633632] system 00:05: [mem 0xfee00000-0xfee00fff] could not be reserved
[    0.633634] system 00:05: [mem 0xfff80000-0xfffeffff] has been reserved
[    0.633637] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.633656] pnp: PnP ACPI: found 6 devices
[    0.640014] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.640113] NET: Registered protocol family 2
[    0.640541] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.642670] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.642986] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.643422] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.643632] TCP: Hash tables configured (established 131072 bind 65536)
[    0.643767] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.643884] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.644004] NET: Registered protocol family 1
[    0.644010] NET: Registered protocol family 44
[    0.644034] pci 0000:01:00.0: BAR 6: assigned [mem 0xfdd00000-0xfdd1ffff pref]
[    0.644037] pci 0000:00:02.0: PCI bridge to [bus 01]
[    0.644039] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[    0.644042] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
[    0.644044] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.644046] pci 0000:00:05.0: PCI bridge to [bus 02]
[    0.644048] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
[    0.644050] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
[    0.644052] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
[    0.644054] pci 0000:00:06.0: PCI bridge to [bus 03]
[    0.644056] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
[    0.644058] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
[    0.644059] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
[    0.644063] pci 0000:04:00.0: BAR 6: assigned [mem 0xfd600000-0xfd61ffff pref]
[    0.644064] pci 0000:00:07.0: PCI bridge to [bus 04]
[    0.644066] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
[    0.644068] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
[    0.644070] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
[    0.644073] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    0.644075] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
[    0.644077] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
[    0.644078] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.644082] pci 0000:00:14.4: PCI bridge to [bus 06]
[    0.644084] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
[    0.644088] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
[    0.644091] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
[    0.644097] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.644098] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.644100] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.644101] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff window]
[    0.644102] pci_bus 0000:00: resource 8 [mem 0xcff00000-0xfebfffff window]
[    0.644104] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.644105] pci_bus 0000:01: resource 1 [mem 0xfdd00000-0xfddfffff]
[    0.644106] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.644107] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
[    0.644109] pci_bus 0000:02: resource 1 [mem 0xfdc00000-0xfdcfffff]
[    0.644110] pci_bus 0000:02: resource 2 [mem 0xfdb00000-0xfdbfffff 64bit pref]
[    0.644111] pci_bus 0000:03: resource 0 [io  0xc000-0xcfff]
[    0.644113] pci_bus 0000:03: resource 1 [mem 0xfda00000-0xfdafffff]
[    0.644114] pci_bus 0000:03: resource 2 [mem 0xfd900000-0xfd9fffff 64bit pref]
[    0.644115] pci_bus 0000:04: resource 0 [io  0xb000-0xbfff]
[    0.644116] pci_bus 0000:04: resource 1 [mem 0xfd600000-0xfd6fffff]
[    0.644117] pci_bus 0000:04: resource 2 [mem 0xfd500000-0xfd5fffff 64bit pref]
[    0.644119] pci_bus 0000:05: resource 0 [io  0xa000-0xafff]
[    0.644120] pci_bus 0000:05: resource 1 [mem 0xfd200000-0xfd4fffff]
[    0.644121] pci_bus 0000:05: resource 2 [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.644123] pci_bus 0000:06: resource 0 [io  0x9000-0x9fff]
[    0.644124] pci_bus 0000:06: resource 1 [mem 0xfd800000-0xfd8fffff]
[    0.644125] pci_bus 0000:06: resource 2 [mem 0xfd700000-0xfd7fffff pref]
[    0.644126] pci_bus 0000:06: resource 4 [io  0x0000-0x0cf7 window]
[    0.644128] pci_bus 0000:06: resource 5 [io  0x0d00-0xffff window]
[    0.644129] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.644130] pci_bus 0000:06: resource 7 [mem 0x000c0000-0x000dffff window]
[    0.644132] pci_bus 0000:06: resource 8 [mem 0xcff00000-0xfebfffff window]
[    0.663040] pci 0000:00:12.0: quirk_usb_early_handoff+0x0/0x710 took 18397 usecs
[    0.683023] pci 0000:00:13.0: quirk_usb_early_handoff+0x0/0x710 took 19279 usecs
[    0.703029] pci 0000:00:14.5: quirk_usb_early_handoff+0x0/0x710 took 19300 usecs
[    0.723025] pci 0000:00:16.0: quirk_usb_early_handoff+0x0/0x710 took 19517 usecs
[    0.723275] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.723304] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    0.723331] PCI: CLS 64 bytes, default 64
[    0.723430] Trying to unpack rootfs image as initramfs...
[    1.274645] Freeing initrd memory: 30100K
[    1.323361] pci 0000:00:00.2: can't derive routing for PCI INT A
[    1.323364] pci 0000:00:00.2: PCI INT A: no GSI
[    1.323400] pci 0000:00:00.0: Adding to iommu group 0
[    1.323417] pci 0000:00:02.0: Adding to iommu group 1
[    1.323430] pci 0000:00:05.0: Adding to iommu group 2
[    1.323442] pci 0000:00:06.0: Adding to iommu group 3
[    1.323454] pci 0000:00:07.0: Adding to iommu group 4
[    1.323469] pci 0000:00:0d.0: Adding to iommu group 5
[    1.323481] pci 0000:00:11.0: Adding to iommu group 6
[    1.323502] pci 0000:00:12.0: Adding to iommu group 7
[    1.323514] pci 0000:00:12.2: Adding to iommu group 7
[    1.323536] pci 0000:00:13.0: Adding to iommu group 8
[    1.323553] pci 0000:00:13.2: Adding to iommu group 8
[    1.323567] pci 0000:00:14.0: Adding to iommu group 9
[    1.323580] pci 0000:00:14.3: Adding to iommu group 10
[    1.323592] pci 0000:00:14.4: Adding to iommu group 11
[    1.323607] pci 0000:00:14.5: Adding to iommu group 12
[    1.323629] pci 0000:00:16.0: Adding to iommu group 13
[    1.323642] pci 0000:00:16.2: Adding to iommu group 13
[    1.323665] pci 0000:01:00.0: Adding to iommu group 14
[    1.323679] pci 0000:01:00.1: Adding to iommu group 14
[    1.323695] pci 0000:04:00.0: Adding to iommu group 15
[    1.323708] pci 0000:05:00.0: Adding to iommu group 16
[    1.323725] pci 0000:05:00.1: Adding to iommu group 17
[    1.323738] pci 0000:05:00.2: Adding to iommu group 18
[    1.323754] pci 0000:05:00.3: Adding to iommu group 19
[    1.323759] pci 0000:06:06.0: Adding to iommu group 11
[    1.323764] pci 0000:06:06.1: Adding to iommu group 11
[    1.323769] pci 0000:06:06.2: Adding to iommu group 11
[    1.374655] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    1.374808] AMD-Vi: Lazy IO/TLB flushing enabled
[    1.376691] LVT offset 1 assigned for vector 0x400
[    1.376700] LVT offset 1 assigned
[    1.376789] perf: AMD IBS detected (0x0000001f)
[    1.377276] Initialise system trusted keyrings
[    1.377294] Key type blacklist registered
[    1.377376] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    1.378991] zbud: loaded
[    1.379249] integrity: Platform Keyring initialized
[    1.379251] Key type asymmetric registered
[    1.379252] Asymmetric key parser 'x509' registered
[    1.379260] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    1.379341] io scheduler mq-deadline registered
[    1.380954] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.380982] ACPI: ACPI: processor limited to max C-state 1
[    1.381391] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.381817] Linux agpgart interface v0.103
[    1.381851] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
[    1.382205] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.382206] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.382343] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.382449] mousedev: PS/2 mouse device common for all mice
[    1.382486] rtc_cmos 00:02: RTC can wake from S4
[    1.382662] rtc_cmos 00:02: registered as rtc0
[    1.382699] rtc_cmos 00:02: setting system clock to 2023-03-14T16:23:53 UTC (1678811033)
[    1.382720] rtc_cmos 00:02: alarms up to one month, 242 bytes nvram, hpet irqs
[    1.382777] ledtrig-cpu: registered to indicate activity on CPUs
[    1.383267] NET: Registered protocol family 10
[    1.391668] Segment Routing with IPv6
[    1.391689] mip6: Mobile IPv6
[    1.391692] NET: Registered protocol family 17
[    1.391737] mpls_gso: MPLS GSO support
[    1.392035] microcode: CPU0: patch_level=0x010000c8
[    1.392040] microcode: CPU1: patch_level=0x010000c8
[    1.392047] microcode: CPU2: patch_level=0x010000c8
[    1.392054] microcode: CPU3: patch_level=0x010000c8
[    1.392059] microcode: Microcode Update Driver: v2.2.
[    1.392062] IPI shorthand broadcast: enabled
[    1.392071] sched_clock: Marking stable (1389838946, 2140900)->(1422316128, -30336282)
[    1.392154] registered taskstats version 1
[    1.392157] Loading compiled-in X.509 certificates
[    1.401265] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.447842] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[    1.447864] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: 14011249c2675ea8e5148542202005810584b25f'
[    1.447905] zswap: loaded using pool lzo/zbud
[    1.448114] Key type .fscrypt registered
[    1.448116] Key type fscrypt-provisioning registered
[    1.448175] AppArmor: AppArmor sha1 policy hashing enabled
[    1.449987] Freeing unused decrypted memory: 2036K
[    1.450721] Freeing unused kernel image (initmem) memory: 2660K
[    1.469469] Write protecting the kernel read-only data: 22528k
[    1.470176] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    1.470379] Freeing unused kernel image (rodata/data gap) memory: 632K
[    1.515106] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.515112] Run /init as init process
[    1.515113]   with arguments:
[    1.515114]     /init
[    1.515115]   with environment:
[    1.515115]     HOME=/
[    1.515116]     TERM=linux
[    1.515117]     BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64
[    1.532926] udevd[108]: starting version 3.2.9
[    1.533140] random: udevd: uninitialized urandom read (16 bytes read)
[    1.533168] random: udevd: uninitialized urandom read (16 bytes read)
[    1.533180] random: udevd: uninitialized urandom read (16 bytes read)
[    1.534183] udevd[109]: starting eudev-3.2.9
[    1.553338] pps_core: LinuxPPS API ver. 1 registered
[    1.553340] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.554870] PTP clock support registered
[    1.555897] dca service started, version 1.12.1
[    1.565535] r8169 0000:04:00.0: can't disable ASPM; OS doesn't have ASPM control
[    1.568866] r8169 0000:04:00.0 eth0: RTL8168d/8111d, 1c:6f:65:92:d2:20, XID 283, IRQ 30
[    1.568869] r8169 0000:04:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    1.569230] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.569232] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.581800] SCSI subsystem initialized
[    1.601059] ACPI: bus type USB registered
[    1.601094] usbcore: registered new interface driver usbfs
[    1.601104] usbcore: registered new interface driver hub
[    1.601117] usbcore: registered new device driver usb
[    1.605621] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.608635] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.608731] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SOR1) (20200925/utaddress-204)
[    1.608736] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    1.609682] libata version 3.00 loaded.
[    1.609903] ehci-pci: EHCI PCI platform driver
[    1.610233] QUIRK: Enable AMD PLL fix
[    1.610260] ehci-pci 0000:00:12.2: EHCI Host Controller
[    1.610268] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus number 1
[    1.610273] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    1.610280] ehci-pci 0000:00:12.2: debug port 1
[    1.610325] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdffd000
[    1.617448] ahci 0000:00:11.0: version 3.0
[    1.617720] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
[    1.617723] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pmp pio slum part
[    1.618930] scsi host0: ahci
[    1.619410] scsi host1: ahci
[    1.625419] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
[    1.625524] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
[    1.625525] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.625527] usb usb1: Product: EHCI Host Controller
[    1.625528] usb usb1: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    1.625529] usb usb1: SerialNumber: 0000:00:12.2
[    1.625607] scsi host2: ahci
[    1.625753] hub 1-0:1.0: USB hub found
[    1.625761] hub 1-0:1.0: 5 ports detected
[    1.626117] ehci-pci 0000:00:13.2: EHCI Host Controller
[    1.626124] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2
[    1.626127] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    1.626135] ehci-pci 0000:00:13.2: debug port 1
[    1.626171] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdffb000
[    1.626208] scsi host3: ahci
[    1.626365] scsi host4: ahci
[    1.626527] scsi host5: ahci
[    1.626595] ata1: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff100 irq 40
[    1.626598] ata2: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff180 irq 40
[    1.626600] ata3: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff200 irq 40
[    1.626602] ata4: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff280 irq 40
[    1.626603] ata5: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff300 irq 40
[    1.626605] ata6: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff380 irq 40
[    1.637947] igb 0000:05:00.0: added PHC on eth1
[    1.637949] igb 0000:05:00.0: Intel(R) Gigabit Ethernet Network Connection
[    1.637951] igb 0000:05:00.0: eth1: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:44
[    1.637953] igb 0000:05:00.0: eth1: PBA No: Unknown
[    1.637954] igb 0000:05:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[    1.645461] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
[    1.645559] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
[    1.645561] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.645563] usb usb2: Product: EHCI Host Controller
[    1.645564] usb usb2: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    1.645565] usb usb2: SerialNumber: 0000:00:13.2
[    1.645684] hub 2-0:1.0: USB hub found
[    1.645692] hub 2-0:1.0: 5 ports detected
[    1.646052] ehci-pci 0000:00:16.2: EHCI Host Controller
[    1.646057] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus number 3
[    1.646061] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    1.646068] ehci-pci 0000:00:16.2: debug port 1
[    1.646102] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdff8000
[    1.665457] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
[    1.665507] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
[    1.665509] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.665510] usb usb3: Product: EHCI Host Controller
[    1.665511] usb usb3: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    1.665512] usb usb3: SerialNumber: 0000:00:16.2
[    1.665630] hub 3-0:1.0: USB hub found
[    1.665638] hub 3-0:1.0: 4 ports detected
[    1.677492] firewire_ohci 0000:06:06.2: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x2
[    1.690559] igb 0000:05:00.1: added PHC on eth2
[    1.690561] igb 0000:05:00.1: Intel(R) Gigabit Ethernet Network Connection
[    1.690563] igb 0000:05:00.1: eth2: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:45
[    1.690565] igb 0000:05:00.1: eth2: PBA No: Unknown
[    1.690566] igb 0000:05:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[    1.741908] igb 0000:05:00.2: added PHC on eth3
[    1.741910] igb 0000:05:00.2: Intel(R) Gigabit Ethernet Network Connection
[    1.741911] igb 0000:05:00.2: eth3: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:46
[    1.741913] igb 0000:05:00.2: eth3: PBA No: Unknown
[    1.741915] igb 0000:05:00.2: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[    1.793900] igb 0000:05:00.3: added PHC on eth4
[    1.793902] igb 0000:05:00.3: Intel(R) Gigabit Ethernet Network Connection
[    1.793904] igb 0000:05:00.3: eth4: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:47
[    1.793906] igb 0000:05:00.3: eth4: PBA No: Unknown
[    1.793907] igb 0000:05:00.3: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[    1.940751] ata6: SATA link down (SStatus 0 SControl 300)
[    1.940776] ata1: SATA link down (SStatus 0 SControl 300)
[    1.940802] ata4: SATA link down (SStatus 0 SControl 300)
[    1.940828] ata2: SATA link down (SStatus 0 SControl 300)
[    1.940876] ata3: SATA link down (SStatus 0 SControl 300)
[    2.101468] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    2.102222] ata5.00: supports DRM functions and may not be fully accessible
[    2.102250] ata5.00: ATA-10: CT2000MX500SSD1, M3CR045, max UDMA/133
[    2.102252] ata5.00: 3907029168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    2.102844] ata5.00: supports DRM functions and may not be fully accessible
[    2.103341] ata5.00: configured for UDMA/133
[    2.103475] scsi 4:0:0:0: Direct-Access     ATA      CT2000MX500SSD1  045  PQ: 0 ANSI: 5
[    2.104637] ohci-pci: OHCI PCI platform driver
[    2.105086] ohci-pci 0000:00:12.0: OHCI PCI host controller
[    2.105094] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 4
[    2.105132] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdffe000
[    2.151609] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
[    2.151611] sd 4:0:0:0: [sda] 4096-byte physical blocks
[    2.151642] sd 4:0:0:0: [sda] Write Protect is off
[    2.151645] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.151673] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.165520] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
[    2.165522] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.165524] usb usb4: Product: OHCI PCI host controller
[    2.165525] usb usb4: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.165526] usb usb4: SerialNumber: 0000:00:12.0
[    2.165654] hub 4-0:1.0: USB hub found
[    2.165663] hub 4-0:1.0: 5 ports detected
[    2.166024] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    2.166030] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus number 5
[    2.166053] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdffc000
[    2.178084]  sda: sda1 sda2 sda3 sda4
[    2.193787] sd 4:0:0:0: [sda] supports TCG Opal
[    2.193789] sd 4:0:0:0: [sda] Attached SCSI disk
[    2.196077] sd 4:0:0:0: Attached scsi generic sg0 type 0
[    2.201515] firewire_core 0000:06:06.2: created device fw0: GUID 00023c009103cf43, S400
[    2.229494] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
[    2.229497] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.229498] usb usb5: Product: OHCI PCI host controller
[    2.229500] usb usb5: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.229501] usb usb5: SerialNumber: 0000:00:13.0
[    2.229564] device-mapper: uevent: version 1.0.3
[    2.229648] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[    2.229681] hub 5-0:1.0: USB hub found
[    2.229691] hub 5-0:1.0: 5 ports detected
[    2.230191] ohci-pci 0000:00:14.5: OHCI PCI host controller
[    2.230199] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus number 6
[    2.230228] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdffa000
[    2.293492] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
[    2.293496] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.293497] usb usb6: Product: OHCI PCI host controller
[    2.293499] usb usb6: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.293500] usb usb6: SerialNumber: 0000:00:14.5
[    2.293642] hub 6-0:1.0: USB hub found
[    2.293650] hub 6-0:1.0: 2 ports detected
[    2.293993] ohci-pci 0000:00:16.0: OHCI PCI host controller
[    2.294000] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus number 7
[    2.294025] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdff9000
[    2.357488] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
[    2.357491] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.357492] usb usb7: Product: OHCI PCI host controller
[    2.357493] usb usb7: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.357494] usb usb7: SerialNumber: 0000:00:16.0
[    2.357619] hub 7-0:1.0: USB hub found
[    2.357627] hub 7-0:1.0: 4 ports detected
[    2.393457] tsc: Refined TSC clocksource calibration: 2611.834 MHz
[    2.393473] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x25a5e752d40, max_idle_ns: 440795227132 ns
[    2.393492] clocksource: Switched to clocksource tsc
[    2.837454] usb 4-4: new full-speed USB device number 2 using ohci-pci
[    3.038516] usb 4-4: New USB device found, idVendor=046d, idProduct=c52e, bcdDevice=23.01
[    3.038519] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.038520] usb 4-4: Product: USB Receiver
[    3.038522] usb 4-4: Manufacturer: Logitech
[    3.038987] random: udevd: uninitialized urandom read (16 bytes read)
[    3.049147] hid: raw HID events driver (C) Jiri Kosina
[    3.060819] usbcore: registered new interface driver usbhid
[    3.060820] usbhid: USB HID core driver
[    3.062288] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.0/0003:046D:C52E.0001/input/input1
[    3.121629] hid-generic 0003:046D:C52E.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:12.0-4/input0
[    3.122030] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input2
[    3.122125] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input3
[    3.181500] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input4
[    3.181597] hid-generic 0003:046D:C52E.0002: input,hiddev0,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:12.0-4/input1
[    3.487865] PM: Image not found (code -22)
[    3.683029] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[    3.724796] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[    3.891404] udevd[414]: starting version 3.2.9
[    3.895967] random: udevd: uninitialized urandom read (16 bytes read)
[    3.896231] random: udevd: uninitialized urandom read (16 bytes read)
[    3.904873] udevd[415]: starting eudev-3.2.9
[    3.939518] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input7
[    3.939547] ACPI: Power Button [PWRB]
[    3.939612] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input8
[    3.940773] acpi_cpufreq: overriding BIOS provided _PSD data
[    3.957643] ACPI: Power Button [PWRF]
[    4.054242] random: lvm: uninitialized urandom read (4 bytes read)
[    4.064338] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    4.064442] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
[    4.080231] gameport gameport0: EMU10K1 is pci0000:06:06.1/gameport0, io 0x9e00, speed 792kHz
[    4.080383] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    4.121889] input: PC Speaker as /devices/platform/pcspkr/input/input9
[    4.122636] [drm] radeon kernel modesetting enabled.
[    4.123178] [drm:radeon_pci_probe [radeon]] *ERROR* radeon kernel modesetting for R600 or later requires firmware installed
[    4.123221] See https://wiki.debian.org/Firmware for information about missing firmware
[    4.127927] snd_emu10k1 0000:06:06.0: non-passthrough IOMMU detected, widening DMA allocations
[    4.132854] snd_emu10k1 0000:06:06.0: Installing spdif_bug patch: SB Audigy 2 Platinum [SB0240P]
[    4.199226] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:02.0/0000:01:00.1/sound/card1/input10
[    4.213240] kvm: Nested Virtualization enabled
[    4.213248] SVM: kvm: Nested Paging enabled
[    4.233228] MCE: In-kernel MCE decoding enabled.
[    4.235765] EDAC amd64: F10h detected (node 0).
[    4.235787] EDAC amd64: Node 0: DRAM ECC disabled.
[    4.301999] EDAC amd64: F10h detected (node 0).
[    4.302021] EDAC amd64: Node 0: DRAM ECC disabled.
[    4.349890] EDAC amd64: F10h detected (node 0).
[    4.349912] EDAC amd64: Node 0: DRAM ECC disabled.
[    4.381846] EDAC amd64: F10h detected (node 0).
[    4.381865] EDAC amd64: Node 0: DRAM ECC disabled.
[    7.339055] random: lvm: uninitialized urandom read (4 bytes read)
[    7.441477] Adding 1952764k swap on /dev/sda2.  Priority:-2 extents:1 across:1952764k SSFS
[    7.456939] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
[    7.740641] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: errors=remount-ro
[    7.821597] random: dd: uninitialized urandom read (32 bytes read)
[    7.878778] r8169 0000:04:00.0: firmware: direct-loading firmware rtl_nic/rtl8168d-2.fw
[    7.878787] r8169 0000:04:00.0: Unable to load firmware rtl_nic/rtl8168d-2.fw (-22)
[    7.879675] RTL8211B Gigabit Ethernet r8169-0-400:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-0-400:00, irq=IGNORE)
[    7.948422] r8169 0000:04:00.0 eth0: Link is Down
[    8.013168] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[    8.018315] xenbr0: port 1(eth0) entered blocking state
[    8.018317] xenbr0: port 1(eth0) entered disabled state
[    8.018393] device eth0 entered promiscuous mode
[    9.958500] r8169 0000:04:00.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[    9.958525] xenbr0: port 1(eth0) entered blocking state
[    9.958532] xenbr0: port 1(eth0) entered forwarding state
[   10.344586] random: dbus-uuidgen: uninitialized urandom read (12 bytes read)
[   11.901410] random: crng init done
[   11.901413] random: 12 urandom warning(s) missed due to ratelimiting
--abmob-adb2cd80-116f-4618-b871-47724293d146
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=devuan_var-log-kern.log

Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] Linux version 5.10.0-21-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.162-1 (2023-01-21)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] x86/fpu: x87 FPU will use FXSAVE
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-provided physical RAM map:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009b7ff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x000000000009f800-0x000000000009ffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cfceffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfcf0000-0x00000000cfcf0fff] ACPI NVS
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfcf1000-0x00000000cfcfffff] ACPI data
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfd00000-0x00000000cfdfffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000042fffffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] NX (Execute Disable) protection: active
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] SMBIOS 2.4 present.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] DMI: Gigabyte Technology Co., Ltd. GA-890FXA-UD5/GA-890FXA-UD5, BIOS F6 11/24/2010
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] tsc: Fast TSC calibration using PIT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] tsc: Detected 2611.619 MHz processor
Mar 14 17:24:02 Gemini-Sector kernel: [    0.004391] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.004394] e820: remove [mem 0x000a0000-0x000fffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010357] AGP: No AGP bridge found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010414] last_pfn = 0x430000 max_arch_pfn = 0x400000000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010417] MTRR default type: uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010419] MTRR fixed ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010420]   00000-9FFFF write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010422]   A0000-BFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010423]   C0000-C7FFF write-protect
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010425]   C8000-FFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010426] MTRR variable ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010428]   0 base 000000000000 mask FFFF80000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010430]   1 base 000080000000 mask FFFFC0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010432]   2 base 0000C0000000 mask FFFFF0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010433]   3 base 0000CFD00000 mask FFFFFFF00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010434]   4 base 0000CFE00000 mask FFFFFFE00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010436]   5 base 000100000000 mask FFFF00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010437]   6 base 000200000000 mask FFFE00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010438]   7 base 000400000000 mask FFFFE0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010440] TOM2: 0000000430000000 aka 17152M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011670] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011752] e820: update [mem 0xcfd00000-0xffffffff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011760] last_pfn = 0xcfcf0 max_arch_pfn = 0x400000000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.013968] found SMP MP-table at [mem 0x000f46f0-0x000f46ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032578] Using GB pages for direct mapping
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032935] RAMDISK: [mem 0x34525000-0x36289fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032939] ACPI: Early table checksum verification disabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032943] ACPI: RSDP 0x00000000000F6100 000014 (v00 GBT   )
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032948] ACPI: RSDT 0x00000000CFCF1000 000044 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032955] ACPI: FACP 0x00000000CFCF1080 000074 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032961] ACPI: DSDT 0x00000000CFCF1100 007BE3 (v01 GBT    GBTUACPI 00001000 MSFT 03000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032965] ACPI: FACS 0x00000000CFCF0000 000040
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032968] ACPI: SSDT 0x00000000CFCF8DC0 00088C (v01 PTLTD  POWERNOW 00000001  LTP 00000001)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032972] ACPI: HPET 0x00000000CFCF9680 000038 (v01 GBT    GBTUACPI 42302E31 GBTU 00000098)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032977] ACPI: MCFG 0x00000000CFCF96C0 00003C (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032980] ACPI: MATS 0x00000000CFCF9700 000034 (v01 GBT             00000000      00000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032984] ACPI: TAMG 0x00000000CFCF9770 000202 (v01 GBT    GBT   B0 5455312E BG?? 53450101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032989] ACPI: APIC 0x00000000CFCF8D00 0000BC (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032993] ACPI: IVRS 0x00000000CFCF99F0 0000C0 (v01 AMD    RD890S   00202031 AMD  00000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032997] ACPI: Reserving FACP table memory at [mem 0xcfcf1080-0xcfcf10f3]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032998] ACPI: Reserving DSDT table memory at [mem 0xcfcf1100-0xcfcf8ce2]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032999] ACPI: Reserving FACS table memory at [mem 0xcfcf0000-0xcfcf003f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033001] ACPI: Reserving SSDT table memory at [mem 0xcfcf8dc0-0xcfcf964b]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033002] ACPI: Reserving HPET table memory at [mem 0xcfcf9680-0xcfcf96b7]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033003] ACPI: Reserving MCFG table memory at [mem 0xcfcf96c0-0xcfcf96fb]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033004] ACPI: Reserving MATS table memory at [mem 0xcfcf9700-0xcfcf9733]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033005] ACPI: Reserving TAMG table memory at [mem 0xcfcf9770-0xcfcf9971]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033006] ACPI: Reserving APIC table memory at [mem 0xcfcf8d00-0xcfcf8dbb]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033007] ACPI: Reserving IVRS table memory at [mem 0xcfcf99f0-0xcfcf9aaf]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033020] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033068] Scanning NUMA topology in Northbridge 24
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033078] No NUMA configuration found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033080] Faking a node at [mem 0x0000000000000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033091] NODE_DATA(0) allocated [mem 0x42ffd6000-0x42fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033663] Zone ranges:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033664]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033666]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033668]   Normal   [mem 0x0000000100000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033670]   Device   empty
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033671] Movable zone start for each node
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033676] Early memory node ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033677]   node   0: [mem 0x0000000000001000-0x000000000009afff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033679]   node   0: [mem 0x0000000000100000-0x00000000cfceffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033680]   node   0: [mem 0x0000000100000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033683] Initmem setup node 0 [mem 0x0000000000001000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033685] On node 0 totalpages: 4193418
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033687]   DMA zone: 64 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033688]   DMA zone: 21 pages reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033689]   DMA zone: 3994 pages, LIFO batch:0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033690]   DMA32 zone: 13236 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033691]   DMA32 zone: 847088 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033692]   Normal zone: 52224 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033693]   Normal zone: 3342336 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033697] On node 0, zone DMA: 1 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033749] On node 0, zone DMA: 101 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046702] On node 0, zone Normal: 784 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046887] ACPI: PM-Timer IO Port: 0x808
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046890] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046896] ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046897] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046898] ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046899] ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046901] ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046902] ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046903] ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046904] ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046912] IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046914] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046916] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046918] ACPI: IRQ0 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046919] ACPI: IRQ9 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046921] Using ACPI (MADT) for SMP configuration information
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046923] ACPI: HPET id: 0x10b9a201 base: 0xfed00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046927] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046943] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046945] PM: hibernation: Registered nosave memory: [mem 0x0009b000-0x0009ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046946] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046947] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046949] PM: hibernation: Registered nosave memory: [mem 0xcfcf0000-0xcfcf0fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046950] PM: hibernation: Registered nosave memory: [mem 0xcfcf1000-0xcfcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046951] PM: hibernation: Registered nosave memory: [mem 0xcfd00000-0xcfdfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046952] PM: hibernation: Registered nosave memory: [mem 0xcfe00000-0xdfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046953] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046954] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfebfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046955] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046957] [mem 0xcfe00000-0xdfffffff] available for PCI devices
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046958] Booting paravirtualized kernel on bare hardware
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046961] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052012] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052712] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052718] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052720] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052756] Built 1 zonelists, mobility grouping on.  Total pages: 4127873
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052757] Policy zone: Normal
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052758] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
Mar 14 17:24:02 Gemini-Sector kernel: [    0.055863] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.057394] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.057432] mem auto-init: stack:off, heap alloc:on, heap free:off
Mar 14 17:24:02 Gemini-Sector kernel: [    0.069788] AGP: Checking aperture...
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075746] AGP: No AGP bridge found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075750] AGP: Node 0: aperture [bus addr 0x7fe000000-0x7ffffffff] (32MB)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075751] Aperture beyond 4GB. Ignoring.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075752] AGP: Your BIOS doesn't leave an aperture memory hole
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075752] AGP: Please enable the IOMMU option in the BIOS setup
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075753] AGP: This costs you 64MB of RAM
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075757] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff] (65536KB)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075759] PM: hibernation: Registered nosave memory: [mem 0xc4000000-0xc7ffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.096999] Memory: 3373884K/16773672K available (12295K kernel code, 2537K rwdata, 7560K rodata, 2660K init, 5468K bss, 487536K reserved, 0K cma-reserved)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.097354] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.097375] ftrace: allocating 36545 entries in 143 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112697] ftrace: allocated 143 pages with 5 groups
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112882] rcu: Hierarchical RCU implementation.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112884] rcu:       RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112885]    Rude variant of Tasks RCU enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112886]    Tracing variant of Tasks RCU enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112887] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112888] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
Mar 14 17:24:02 Gemini-Sector kernel: [    0.118935] NR_IRQS: 524544, nr_irqs: 488, preallocated irqs: 16
Mar 14 17:24:02 Gemini-Sector kernel: [    0.119284] spurious 8259A interrupt: IRQ7.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121215] Console: colour VGA+ 80x25
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121232] printk: console [tty0] enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121256] ACPI: Core revision 20200925
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121377] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121392] APIC: Switch to symmetric I/O mode setup
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121495] AMD-Vi: Disabling interrupt remapping
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121937] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141395] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x25a51c371bd, max_idle_ns: 440795253524 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141398] Calibrating delay loop (skipped), value calculated using timer frequency.. 5223.23 BogoMIPS (lpj=10446476)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141402] pid_max: default: 32768 minimum: 301
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141482] LSM: Security Framework initializing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141502] Yama: disabled by default; enable with sysctl kernel.yama.*
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141546] AppArmor: AppArmor initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141548] TOMOYO Linux initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141634] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141687] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142043] LVT offset 0 assigned for vector 0xf9
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142048] process: using AMD E400 aware idle routine
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142050] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142051] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142054] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142056] Spectre V2 : Mitigation: Retpolines
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142057] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142058] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.150749] Freeing SMP alternatives memory: 32K
Mar 14 17:24:02 Gemini-Sector kernel: [    0.153405] process: System has AMD C1E enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265118] process: Switch to broadcast mode on CPU0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265124] smpboot: CPU0: AMD Phenom(tm) II X4 910e Processor (family: 0x10, model: 0x4, stepping: 0x3)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265328] Performance Events: AMD PMU driver.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265333] ... version:                0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265333] ... bit width:              48
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265334] ... generic registers:      4
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265335] ... value mask:             0000ffffffffffff
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265336] ... max period:             00007fffffffffff
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265337] ... fixed-purpose events:   0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265338] ... event mask:             000000000000000f
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] rcu: Hierarchical SRCU implementation.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] smp: Bringing up secondary CPUs ...
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] x86: Booting SMP configuration:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] .... node  #0, CPUs:      #1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 1.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396]  #2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 2.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.267876]  #3
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 3.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU3
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smp: Brought up 1 node, 4 CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smpboot: Max logical packages: 2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smpboot: Total of 4 processors activated (20892.95 BogoMIPS)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305057] node 0 deferred pages initialised in 28ms
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305964] devtmpfs: initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305964] x86/mm: Memory block size: 128MB
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] PM: Registering ACPI NVS region [mem 0xcfcf0000-0xcfcf0fff] (4096 bytes)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] pinctrl core: initialized pinctrl subsystem
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] NET: Registered protocol family 16
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309513] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309923] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309936] audit: initializing netlink subsys (disabled)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] audit: type=2000 audit(1678811032.188:1): state=initialized audit_enabled=0 res=1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'fair_share'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'bang_bang'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'step_wise'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'user_space'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'power_allocator'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] cpuidle: using governor ladder
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] cpuidle: using governor menu
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: io port [9000, ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] TOM: 00000000d0000000 aka 3328M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] Fam 10h mmconf [mem 0xe0000000-0xe00fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [a0000, bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [d0000000, dfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [f0000000, ffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [e0000000, e06fffff] ==> [e0100000, e06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] TOM2: 0000000430000000 aka 17152M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: [bus 00-06] on node 0 link 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [io  0x0000-0xffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x000a0000-0x000bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xd0000000-0xdfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0700000-0xffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0100000-0xe06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x430000000-0xfcffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] ACPI: bus type PCI registered
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: Using configuration type 1 for base access
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: your CPUs had inconsistent variable MTRR settings
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: probably your BIOS does not setup all CPUs.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: corrected configuration.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310909] Kprobes globally optimized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310920] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310920] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Module Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Processor Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(3.0 _SCP Extensions)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Processor Aggregator Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-Dell-Video)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI: 2 ACPI AML tables successfully acquired and loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565721] ACPI: Interpreter enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565742] ACPI: (supports S0 S3 S4 S5)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565744] ACPI: Using IOAPIC for interrupt routing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565779] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565930] ACPI: Enabled 9 GPEs in block 00 to 1F
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571332] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571338] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571605] PCI host bridge to bus 0000:00
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571608] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571609] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571611] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571612] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571614] pci_bus 0000:00: root bus resource [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571615] pci_bus 0000:00: root bus resource [bus 00-ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571628] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571637] pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571748] pci 0000:00:00.2: [1002:5a23] type 00 class 0x080600
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571857] pci 0000:00:02.0: [1002:5a16] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571873] pci 0000:00:02.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571897] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572009] pci 0000:00:05.0: [1002:5a19] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572024] pci 0000:00:05.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572047] pci 0000:00:05.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572158] pci 0000:00:06.0: [1002:5a1a] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572173] pci 0000:00:06.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572195] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572303] pci 0000:00:07.0: [1002:5a1b] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572318] pci 0000:00:07.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572340] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572452] pci 0000:00:0d.0: [1002:5a1e] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572467] pci 0000:00:0d.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572488] pci 0000:00:0d.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572611] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572623] pci 0000:00:11.0: reg 0x10: [io  0xff00-0xff07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572630] pci 0000:00:11.0: reg 0x14: [io  0xfe00-0xfe03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572637] pci 0000:00:11.0: reg 0x18: [io  0xfd00-0xfd07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572643] pci 0000:00:11.0: reg 0x1c: [io  0xfc00-0xfc03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572650] pci 0000:00:11.0: reg 0x20: [io  0xfb00-0xfb0f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572657] pci 0000:00:11.0: reg 0x24: [mem 0xfdfff000-0xfdfff3ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572783] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572795] pci 0000:00:12.0: reg 0x10: [mem 0xfdffe000-0xfdffefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572938] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572950] pci 0000:00:12.2: reg 0x10: [mem 0xfdffd000-0xfdffd0ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573008] pci 0000:00:12.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573009] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573112] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573124] pci 0000:00:13.0: reg 0x10: [mem 0xfdffc000-0xfdffcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573262] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573274] pci 0000:00:13.2: reg 0x10: [mem 0xfdffb000-0xfdffb0ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573332] pci 0000:00:13.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573333] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573452] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573591] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573732] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573864] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573876] pci 0000:00:14.5: reg 0x10: [mem 0xfdffa000-0xfdffafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574012] pci 0000:00:16.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574024] pci 0000:00:16.0: reg 0x10: [mem 0xfdff9000-0xfdff9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574162] pci 0000:00:16.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574174] pci 0000:00:16.2: reg 0x10: [mem 0xfdff8000-0xfdff80ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574232] pci 0000:00:16.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574233] pci 0000:00:16.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574334] pci 0000:00:18.0: [1022:1200] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574415] pci 0000:00:18.1: [1022:1201] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574493] pci 0000:00:18.2: [1022:1202] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574570] pci 0000:00:18.3: [1022:1203] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574650] pci 0000:00:18.4: [1022:1204] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574780] pci 0000:01:00.0: [1002:68f9] type 00 class 0x030000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574793] pci 0000:01:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574801] pci 0000:01:00.0: reg 0x18: [mem 0xfddc0000-0xfdddffff 64bit]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574807] pci 0000:01:00.0: reg 0x20: [io  0xee00-0xeeff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574818] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574822] pci 0000:01:00.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574858] pci 0000:01:00.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574941] pci 0000:01:00.1: [1002:aa68] type 00 class 0x040300
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574953] pci 0000:01:00.1: reg 0x10: [mem 0xfddfc000-0xfddfffff 64bit]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574980] pci 0000:01:00.1: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.575015] pci 0000:01:00.1: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585431] pci 0000:00:02.0: PCI bridge to [bus 01]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585435] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585437] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585440] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585485] pci 0000:00:05.0: PCI bridge to [bus 02]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585488] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585490] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585492] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585517] pci 0000:00:06.0: PCI bridge to [bus 03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585520] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585521] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585524] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585570] pci 0000:04:00.0: [10ec:8168] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585585] pci 0000:04:00.0: reg 0x10: [io  0xbe00-0xbeff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585604] pci 0000:04:00.0: reg 0x18: [mem 0xfd5ff000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585615] pci 0000:04:00.0: reg 0x20: [mem 0xfd5f8000-0xfd5fbfff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585624] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585694] pci 0000:04:00.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585696] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597434] pci 0000:00:07.0: PCI bridge to [bus 04]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597438] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597440] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597443] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597494] pci 0000:05:00.0: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597506] pci 0000:05:00.0: reg 0x10: [mem 0xfd280000-0xfd2fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597523] pci 0000:05:00.0: reg 0x1c: [mem 0xfd4fc000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597597] pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597683] pci 0000:05:00.1: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597695] pci 0000:05:00.1: reg 0x10: [mem 0xfd380000-0xfd3fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597712] pci 0000:05:00.1: reg 0x1c: [mem 0xfd4f8000-0xfd4fbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597778] pci 0000:05:00.1: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597845] pci 0000:05:00.2: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597856] pci 0000:05:00.2: reg 0x10: [mem 0xfd400000-0xfd47ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597873] pci 0000:05:00.2: reg 0x1c: [mem 0xfd4f4000-0xfd4f7fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597938] pci 0000:05:00.2: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598007] pci 0000:05:00.3: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598019] pci 0000:05:00.3: reg 0x10: [mem 0xfd300000-0xfd37ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598036] pci 0000:05:00.3: reg 0x1c: [mem 0xfd4f0000-0xfd4f3fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598101] pci 0000:05:00.3: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609431] pci 0000:00:0d.0: PCI bridge to [bus 05]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609435] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609437] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609439] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609450] pci_bus 0000:06: extended config space not accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609488] pci 0000:06:06.0: [1102:0004] type 00 class 0x040100
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609505] pci 0000:06:06.0: reg 0x10: [io  0x9f00-0x9f3f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609584] pci 0000:06:06.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609645] pci 0000:06:06.1: [1102:7003] type 00 class 0x098000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609661] pci 0000:06:06.1: reg 0x10: [io  0x9e00-0x9e07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609736] pci 0000:06:06.1: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609779] pci 0000:06:06.2: [1102:4001] type 00 class 0x0c0010
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609797] pci 0000:06:06.2: reg 0x10: [mem 0xfd8ff000-0xfd8ff7ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609807] pci 0000:06:06.2: reg 0x14: [mem 0xfd8f8000-0xfd8fbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609882] pci 0000:06:06.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609883] pci 0000:06:06.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609958] pci 0000:00:14.4: PCI bridge to [bus 06] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609961] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609964] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609967] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609969] pci 0000:00:14.4:   bridge window [io  0x0000-0x0cf7 window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609970] pci 0000:00:14.4:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609971] pci 0000:00:14.4:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609973] pci 0000:00:14.4:   bridge window [mem 0x000c0000-0x000dffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609974] pci 0000:00:14.4:   bridge window [mem 0xcff00000-0xfebfffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610238] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610288] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610335] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610380] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610425] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610470] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610515] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610560] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611146] iommu: Default domain type: Translated
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: setting as boot VGA device
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: bridge control possible
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] vgaarb: loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] EDAC MC: Ver: 3.0.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel: Initializing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  domain hash size = 128
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  unlabeled traffic allowed by default
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] PCI: Using ACPI for IRQ routing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613815] PCI: pci_cache_line_size set to 64 bytes
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613873] e820: reserve RAM buffer [mem 0x0009b800-0x0009ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613874] e820: reserve RAM buffer [mem 0xcfcf0000-0xcfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613898] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613902] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
Mar 14 17:24:02 Gemini-Sector kernel: [    0.617401] clocksource: Switched to clocksource tsc-early
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632217] VFS: Disk quotas dquot_6.6.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632240] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632400] AppArmor: AppArmor Filesystem Enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632419] pnp: PnP ACPI init
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632538] system 00:00: [io  0x04d0-0x04d1] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632540] system 00:00: [io  0x0220-0x0225] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632542] system 00:00: [io  0x0290-0x0294] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632548] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632794] pnp 00:01: disabling [mem 0x00000000-0x00000fff window] because it overlaps 0000:01:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632798] pnp 00:01: disabling [mem 0x00000000-0x00000fff window disabled] because it overlaps 0000:04:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632830] system 00:01: [io  0x0900-0x091f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632832] system 00:01: [io  0x0228-0x022f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632833] system 00:01: [io  0x040b] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632835] system 00:01: [io  0x04d6] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632837] system 00:01: [io  0x0c00-0x0c01] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632838] system 00:01: [io  0x0c14] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632840] system 00:01: [io  0x0c50-0x0c52] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632841] system 00:01: [io  0x0c6c-0x0c6d] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632846] system 00:01: [io  0x0c6f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632848] system 00:01: [io  0x0cd0-0x0cd1] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632849] system 00:01: [io  0x0cd2-0x0cd3] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632851] system 00:01: [io  0x0cd4-0x0cdf] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632852] system 00:01: [io  0x0800-0x08fe] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632853] system 00:01: [io  0x0a10-0x0a17] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632855] system 00:01: [io  0x0b00-0x0b0f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632856] system 00:01: [io  0x0b10-0x0b1f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632858] system 00:01: [io  0x0b20-0x0b3f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632860] system 00:01: [mem 0xfee00400-0xfee00fff window] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632864] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633013] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633369] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633433] system 00:04: [mem 0xe0000000-0xefffffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633437] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633615] system 00:05: [mem 0x000d4200-0x000d7fff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633617] system 00:05: [mem 0x000f0000-0x000f7fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633618] system 00:05: [mem 0x000f8000-0x000fbfff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633620] system 00:05: [mem 0x000fc000-0x000fffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633621] system 00:05: [mem 0xcfcf0000-0xcfcfffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633623] system 00:05: [mem 0xffff0000-0xffffffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633624] system 00:05: [mem 0x00000000-0x0009ffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633626] system 00:05: [mem 0x00100000-0xcfceffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633627] system 00:05: [mem 0xcfd00000-0xcfdfffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633629] system 00:05: [mem 0xcfe00000-0xcfefffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633630] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633632] system 00:05: [mem 0xfee00000-0xfee00fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633634] system 00:05: [mem 0xfff80000-0xfffeffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633637] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633656] pnp: PnP ACPI: found 6 devices
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640014] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640113] NET: Registered protocol family 2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640541] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.642670] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.642986] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643422] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643632] TCP: Hash tables configured (established 131072 bind 65536)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643767] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643884] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644004] NET: Registered protocol family 1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644010] NET: Registered protocol family 44
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644034] pci 0000:01:00.0: BAR 6: assigned [mem 0xfdd00000-0xfdd1ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644037] pci 0000:00:02.0: PCI bridge to [bus 01]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644039] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644042] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644044] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644046] pci 0000:00:05.0: PCI bridge to [bus 02]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644048] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644050] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644052] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644054] pci 0000:00:06.0: PCI bridge to [bus 03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644056] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644058] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644059] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644063] pci 0000:04:00.0: BAR 6: assigned [mem 0xfd600000-0xfd61ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644064] pci 0000:00:07.0: PCI bridge to [bus 04]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644066] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644068] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644070] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644073] pci 0000:00:0d.0: PCI bridge to [bus 05]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644075] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644077] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644078] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644082] pci 0000:00:14.4: PCI bridge to [bus 06]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644084] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644088] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644091] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644097] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644098] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644100] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644101] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644102] pci_bus 0000:00: resource 8 [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644104] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644105] pci_bus 0000:01: resource 1 [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644106] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644107] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644109] pci_bus 0000:02: resource 1 [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644110] pci_bus 0000:02: resource 2 [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644111] pci_bus 0000:03: resource 0 [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644113] pci_bus 0000:03: resource 1 [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644114] pci_bus 0000:03: resource 2 [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644115] pci_bus 0000:04: resource 0 [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644116] pci_bus 0000:04: resource 1 [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644117] pci_bus 0000:04: resource 2 [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644119] pci_bus 0000:05: resource 0 [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644120] pci_bus 0000:05: resource 1 [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644121] pci_bus 0000:05: resource 2 [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644123] pci_bus 0000:06: resource 0 [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644124] pci_bus 0000:06: resource 1 [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644125] pci_bus 0000:06: resource 2 [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644126] pci_bus 0000:06: resource 4 [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644128] pci_bus 0000:06: resource 5 [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644129] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644130] pci_bus 0000:06: resource 7 [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644132] pci_bus 0000:06: resource 8 [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.663040] pci 0000:00:12.0: quirk_usb_early_handoff+0x0/0x710 took 18397 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.683023] pci 0000:00:13.0: quirk_usb_early_handoff+0x0/0x710 took 19279 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.703029] pci 0000:00:14.5: quirk_usb_early_handoff+0x0/0x710 took 19300 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723025] pci 0000:00:16.0: quirk_usb_early_handoff+0x0/0x710 took 19517 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723275] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723304] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723331] PCI: CLS 64 bytes, default 64
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723430] Trying to unpack rootfs image as initramfs...
Mar 14 17:24:02 Gemini-Sector kernel: [    1.274645] Freeing initrd memory: 30100K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323361] pci 0000:00:00.2: can't derive routing for PCI INT A
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323364] pci 0000:00:00.2: PCI INT A: no GSI
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323400] pci 0000:00:00.0: Adding to iommu group 0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323417] pci 0000:00:02.0: Adding to iommu group 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323430] pci 0000:00:05.0: Adding to iommu group 2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323442] pci 0000:00:06.0: Adding to iommu group 3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323454] pci 0000:00:07.0: Adding to iommu group 4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323469] pci 0000:00:0d.0: Adding to iommu group 5
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323481] pci 0000:00:11.0: Adding to iommu group 6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323502] pci 0000:00:12.0: Adding to iommu group 7
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323514] pci 0000:00:12.2: Adding to iommu group 7
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323536] pci 0000:00:13.0: Adding to iommu group 8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323553] pci 0000:00:13.2: Adding to iommu group 8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323567] pci 0000:00:14.0: Adding to iommu group 9
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323580] pci 0000:00:14.3: Adding to iommu group 10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323592] pci 0000:00:14.4: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323607] pci 0000:00:14.5: Adding to iommu group 12
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323629] pci 0000:00:16.0: Adding to iommu group 13
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323642] pci 0000:00:16.2: Adding to iommu group 13
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323665] pci 0000:01:00.0: Adding to iommu group 14
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323679] pci 0000:01:00.1: Adding to iommu group 14
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323695] pci 0000:04:00.0: Adding to iommu group 15
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323708] pci 0000:05:00.0: Adding to iommu group 16
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323725] pci 0000:05:00.1: Adding to iommu group 17
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323738] pci 0000:05:00.2: Adding to iommu group 18
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323754] pci 0000:05:00.3: Adding to iommu group 19
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323759] pci 0000:06:06.0: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323764] pci 0000:06:06.1: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323769] pci 0000:06:06.2: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.374655] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.374808] AMD-Vi: Lazy IO/TLB flushing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376691] LVT offset 1 assigned for vector 0x400
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376700] LVT offset 1 assigned
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376789] perf: AMD IBS detected (0x0000001f)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377276] Initialise system trusted keyrings
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377294] Key type blacklist registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377376] workingset: timestamp_bits=36 max_order=22 bucket_order=0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.378991] zbud: loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379249] integrity: Platform Keyring initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379251] Key type asymmetric registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379252] Asymmetric key parser 'x509' registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379260] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379341] io scheduler mq-deadline registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.380954] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.380982] ACPI: ACPI: processor limited to max C-state 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381391] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381817] Linux agpgart interface v0.103
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381851] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382205] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382206] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382343] serio: i8042 KBD port at 0x60,0x64 irq 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382449] mousedev: PS/2 mouse device common for all mice
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382486] rtc_cmos 00:02: RTC can wake from S4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382662] rtc_cmos 00:02: registered as rtc0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382699] rtc_cmos 00:02: setting system clock to 2023-03-14T16:23:53 UTC (1678811033)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382720] rtc_cmos 00:02: alarms up to one month, 242 bytes nvram, hpet irqs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382777] ledtrig-cpu: registered to indicate activity on CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.383267] NET: Registered protocol family 10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391668] Segment Routing with IPv6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391689] mip6: Mobile IPv6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391692] NET: Registered protocol family 17
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391737] mpls_gso: MPLS GSO support
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392035] microcode: CPU0: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392040] microcode: CPU1: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392047] microcode: CPU2: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392054] microcode: CPU3: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392059] microcode: Microcode Update Driver: v2.2.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392062] IPI shorthand broadcast: enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392071] sched_clock: Marking stable (1389838946, 2140900)->(1422316128, -30336282)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392154] registered taskstats version 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392157] Loading compiled-in X.509 certificates
Mar 14 17:24:02 Gemini-Sector kernel: [    1.401265] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447842] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447864] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: 14011249c2675ea8e5148542202005810584b25f'
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447905] zswap: loaded using pool lzo/zbud
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448114] Key type .fscrypt registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448116] Key type fscrypt-provisioning registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448175] AppArmor: AppArmor sha1 policy hashing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.449987] Freeing unused decrypted memory: 2036K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.450721] Freeing unused kernel image (initmem) memory: 2660K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.469469] Write protecting the kernel read-only data: 22528k
Mar 14 17:24:02 Gemini-Sector kernel: [    1.470176] Freeing unused kernel image (text/rodata gap) memory: 2040K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.470379] Freeing unused kernel image (rodata/data gap) memory: 632K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515106] x86/mm: Checked W+X mappings: passed, no W+X pages found.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515112] Run /init as init process
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515113]   with arguments:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515114]     /init
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]   with environment:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]     HOME=/
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515116]     TERM=linux
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515117]     BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533140] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533168] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533180] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.553338] pps_core: LinuxPPS API ver. 1 registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.553340] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Mar 14 17:24:02 Gemini-Sector kernel: [    1.554870] PTP clock support registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.555897] dca service started, version 1.12.1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.565535] r8169 0000:04:00.0: can't disable ASPM; OS doesn't have ASPM control
Mar 14 17:24:02 Gemini-Sector kernel: [    1.568866] r8169 0000:04:00.0 eth0: RTL8168d/8111d, 1c:6f:65:92:d2:20, XID 283, IRQ 30
Mar 14 17:24:02 Gemini-Sector kernel: [    1.568869] r8169 0000:04:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
Mar 14 17:24:02 Gemini-Sector kernel: [    1.569230] igb: Intel(R) Gigabit Ethernet Network Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.569232] igb: Copyright (c) 2007-2014 Intel Corporation.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.581800] SCSI subsystem initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601059] ACPI: bus type USB registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601094] usbcore: registered new interface driver usbfs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601104] usbcore: registered new interface driver hub
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601117] usbcore: registered new device driver usb
Mar 14 17:24:02 Gemini-Sector kernel: [    1.605621] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608635] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608731] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SOR1) (20200925/utaddress-204)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608736] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.609682] libata version 3.00 loaded.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.609903] ehci-pci: EHCI PCI platform driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610233] QUIRK: Enable AMD PLL fix
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610260] ehci-pci 0000:00:12.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610268] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus number 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610273] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610280] ehci-pci 0000:00:12.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610325] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdffd000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617448] ahci 0000:00:11.0: version 3.0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617720] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617723] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pmp pio slum part
Mar 14 17:24:02 Gemini-Sector kernel: [    1.618930] scsi host0: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.619410] scsi host1: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625419] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625524] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625525] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625527] usb usb1: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625528] usb usb1: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625529] usb usb1: SerialNumber: 0000:00:12.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625607] scsi host2: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625753] hub 1-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625761] hub 1-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626117] ehci-pci 0000:00:13.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626124] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626127] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626135] ehci-pci 0000:00:13.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626171] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdffb000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626208] scsi host3: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626365] scsi host4: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626527] scsi host5: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626595] ata1: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff100 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626598] ata2: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff180 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626600] ata3: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff200 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626602] ata4: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff280 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626603] ata5: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff300 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626605] ata6: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff380 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637947] igb 0000:05:00.0: added PHC on eth1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637949] igb 0000:05:00.0: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637951] igb 0000:05:00.0: eth1: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:44
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637953] igb 0000:05:00.0: eth1: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637954] igb 0000:05:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645461] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645559] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645561] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645563] usb usb2: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645564] usb usb2: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645565] usb usb2: SerialNumber: 0000:00:13.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645684] hub 2-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645692] hub 2-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646052] ehci-pci 0000:00:16.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646057] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus number 3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646061] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646068] ehci-pci 0000:00:16.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646102] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdff8000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665457] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665507] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665509] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665510] usb usb3: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665511] usb usb3: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665512] usb usb3: SerialNumber: 0000:00:16.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665630] hub 3-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665638] hub 3-0:1.0: 4 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.677492] firewire_ohci 0000:06:06.2: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690559] igb 0000:05:00.1: added PHC on eth2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690561] igb 0000:05:00.1: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690563] igb 0000:05:00.1: eth2: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:45
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690565] igb 0000:05:00.1: eth2: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690566] igb 0000:05:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741908] igb 0000:05:00.2: added PHC on eth3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741910] igb 0000:05:00.2: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741911] igb 0000:05:00.2: eth3: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:46
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741913] igb 0000:05:00.2: eth3: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741915] igb 0000:05:00.2: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793900] igb 0000:05:00.3: added PHC on eth4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793902] igb 0000:05:00.3: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793904] igb 0000:05:00.3: eth4: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:47
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793906] igb 0000:05:00.3: eth4: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793907] igb 0000:05:00.3: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940751] ata6: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940776] ata1: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940802] ata4: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940828] ata2: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940876] ata3: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.101468] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102222] ata5.00: supports DRM functions and may not be fully accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102250] ata5.00: ATA-10: CT2000MX500SSD1, M3CR045, max UDMA/133
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102252] ata5.00: 3907029168 sectors, multi 1: LBA48 NCQ (depth 32), AA
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102844] ata5.00: supports DRM functions and may not be fully accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    2.103341] ata5.00: configured for UDMA/133
Mar 14 17:24:02 Gemini-Sector kernel: [    2.103475] scsi 4:0:0:0: Direct-Access     ATA      CT2000MX500SSD1  045  PQ: 0 ANSI: 5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.104637] ohci-pci: OHCI PCI platform driver
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105086] ohci-pci 0000:00:12.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105094] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 4
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105132] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdffe000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151609] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151611] sd 4:0:0:0: [sda] 4096-byte physical blocks
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151642] sd 4:0:0:0: [sda] Write Protect is off
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151645] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151673] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165520] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165522] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165524] usb usb4: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165525] usb usb4: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165526] usb usb4: SerialNumber: 0000:00:12.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165654] hub 4-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165663] hub 4-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166024] ohci-pci 0000:00:13.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166030] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus number 5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166053] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdffc000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.178084]  sda: sda1 sda2 sda3 sda4
Mar 14 17:24:02 Gemini-Sector kernel: [    2.193787] sd 4:0:0:0: [sda] supports TCG Opal
Mar 14 17:24:02 Gemini-Sector kernel: [    2.193789] sd 4:0:0:0: [sda] Attached SCSI disk
Mar 14 17:24:02 Gemini-Sector kernel: [    2.196077] sd 4:0:0:0: Attached scsi generic sg0 type 0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.201515] firewire_core 0000:06:06.2: created device fw0: GUID 00023c009103cf43, S400
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229494] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229497] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229498] usb usb5: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229500] usb usb5: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229501] usb usb5: SerialNumber: 0000:00:13.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229564] device-mapper: uevent: version 1.0.3
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229648] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229681] hub 5-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229691] hub 5-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230191] ohci-pci 0000:00:14.5: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230199] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus number 6
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230228] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdffa000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293492] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293496] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293497] usb usb6: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293499] usb usb6: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293500] usb usb6: SerialNumber: 0000:00:14.5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293642] hub 6-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293650] hub 6-0:1.0: 2 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293993] ohci-pci 0000:00:16.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.294000] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus number 7
Mar 14 17:24:02 Gemini-Sector kernel: [    2.294025] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdff9000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357488] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357491] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357492] usb usb7: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357493] usb usb7: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357494] usb usb7: SerialNumber: 0000:00:16.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357619] hub 7-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357627] hub 7-0:1.0: 4 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393457] tsc: Refined TSC clocksource calibration: 2611.834 MHz
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393473] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x25a5e752d40, max_idle_ns: 440795227132 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393492] clocksource: Switched to clocksource tsc
Mar 14 17:24:02 Gemini-Sector kernel: [    2.837454] usb 4-4: new full-speed USB device number 2 using ohci-pci
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038516] usb 4-4: New USB device found, idVendor=046d, idProduct=c52e, bcdDevice=23.01
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038519] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038520] usb 4-4: Product: USB Receiver
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038522] usb 4-4: Manufacturer: Logitech
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038987] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.049147] hid: raw HID events driver (C) Jiri Kosina
Mar 14 17:24:02 Gemini-Sector kernel: [    3.060819] usbcore: registered new interface driver usbhid
Mar 14 17:24:02 Gemini-Sector kernel: [    3.060820] usbhid: USB HID core driver
Mar 14 17:24:02 Gemini-Sector kernel: [    3.062288] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.0/0003:046D:C52E.0001/input/input1
Mar 14 17:24:02 Gemini-Sector kernel: [    3.121629] hid-generic 0003:046D:C52E.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:12.0-4/input0
Mar 14 17:24:02 Gemini-Sector kernel: [    3.122030] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input2
Mar 14 17:24:02 Gemini-Sector kernel: [    3.122125] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input3
Mar 14 17:24:02 Gemini-Sector kernel: [    3.181500] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input4
Mar 14 17:24:02 Gemini-Sector kernel: [    3.181597] hid-generic 0003:046D:C52E.0002: input,hiddev0,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:12.0-4/input1
Mar 14 17:24:02 Gemini-Sector kernel: [    3.487865] PM: Image not found (code -22)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.683029] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.724796] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
Mar 14 17:24:02 Gemini-Sector kernel: [    3.895967] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.896231] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939518] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input7
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939547] ACPI: Power Button [PWRB]
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939612] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input8
Mar 14 17:24:02 Gemini-Sector kernel: [    3.940773] acpi_cpufreq: overriding BIOS provided _PSD data
Mar 14 17:24:02 Gemini-Sector kernel: [    3.957643] ACPI: Power Button [PWRF]
Mar 14 17:24:02 Gemini-Sector kernel: [    4.054242] random: lvm: uninitialized urandom read (4 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    4.064338] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    4.064442] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
Mar 14 17:24:02 Gemini-Sector kernel: [    4.080231] gameport gameport0: EMU10K1 is pci0000:06:06.1/gameport0, io 0x9e00, speed 792kHz
Mar 14 17:24:02 Gemini-Sector kernel: [    4.080383] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
Mar 14 17:24:02 Gemini-Sector kernel: [    4.121889] input: PC Speaker as /devices/platform/pcspkr/input/input9
Mar 14 17:24:02 Gemini-Sector kernel: [    4.122636] [drm] radeon kernel modesetting enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.123178] [drm:radeon_pci_probe [radeon]] *ERROR* radeon kernel modesetting for R600 or later requires firmware installed
Mar 14 17:24:02 Gemini-Sector kernel: [    4.123221] See https://wiki.debian.org/Firmware for information about missing firmware
Mar 14 17:24:02 Gemini-Sector kernel: [    4.127927] snd_emu10k1 0000:06:06.0: non-passthrough IOMMU detected, widening DMA allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    4.132854] snd_emu10k1 0000:06:06.0: Installing spdif_bug patch: SB Audigy 2 Platinum [SB0240P]
Mar 14 17:24:02 Gemini-Sector kernel: [    4.199226] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:02.0/0000:01:00.1/sound/card1/input10
Mar 14 17:24:02 Gemini-Sector kernel: [    4.213240] kvm: Nested Virtualization enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    4.213248] SVM: kvm: Nested Paging enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    4.233228] MCE: In-kernel MCE decoding enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.235765] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.235787] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.301999] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.302021] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.349890] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.349912] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.381846] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.381865] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    7.339055] random: lvm: uninitialized urandom read (4 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.441477] Adding 1952764k swap on /dev/sda2.  Priority:-2 extents:1 across:1952764k SSFS
Mar 14 17:24:02 Gemini-Sector kernel: [    7.456939] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
Mar 14 17:24:02 Gemini-Sector kernel: [    7.740641] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: errors=remount-ro
Mar 14 17:24:02 Gemini-Sector kernel: [    7.821597] random: dd: uninitialized urandom read (32 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.878778] r8169 0000:04:00.0: firmware: direct-loading firmware rtl_nic/rtl8168d-2.fw
Mar 14 17:24:02 Gemini-Sector kernel: [    7.878787] r8169 0000:04:00.0: Unable to load firmware rtl_nic/rtl8168d-2.fw (-22)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.879675] RTL8211B Gigabit Ethernet r8169-0-400:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-0-400:00, irq=IGNORE)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.948422] r8169 0000:04:00.0 eth0: Link is Down
Mar 14 17:24:02 Gemini-Sector kernel: [    8.013168] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018315] xenbr0: port 1(eth0) entered blocking state
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018317] xenbr0: port 1(eth0) entered disabled state
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018393] device eth0 entered promiscuous mode
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958500] r8169 0000:04:00.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958525] xenbr0: port 1(eth0) entered blocking state
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958532] xenbr0: port 1(eth0) entered forwarding state
Mar 14 17:24:02 Gemini-Sector kernel: [   10.344586] random: dbus-uuidgen: uninitialized urandom read (12 bytes read)
Mar 14 17:24:03 Gemini-Sector kernel: [   11.901410] random: crng init done
Mar 14 17:24:03 Gemini-Sector kernel: [   11.901413] random: 12 urandom warning(s) missed due to ratelimiting
--abmob-adb2cd80-116f-4618-b871-47724293d146
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=devuan_var-log-syslog.log

............................................................................Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] Linux version 5.10.0-21-amd64 (debian-kernel@lists.debian.org
) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.162-1 (2023-01-21)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] x86/fpu: x87 FPU will use FXSAVE
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-provided physical RAM map:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009b7ff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x000000000009f800-0x000000000009ffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cfceffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfcf0000-0x00000000cfcf0fff] ACPI NVS
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfcf1000-0x00000000cfcfffff] ACPI data
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfd00000-0x00000000cfdfffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000042fffffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] NX (Execute Disable) protection: active
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] SMBIOS 2.4 present.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] DMI: Gigabyte Technology Co., Ltd. GA-890FXA-UD5/GA-890FXA-UD5, BIOS F6 11/24/2010
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] tsc: Fast TSC calibration using PIT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.000000] tsc: Detected 2611.619 MHz processor
Mar 14 17:24:02 Gemini-Sector kernel: [    0.004391] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.004394] e820: remove [mem 0x000a0000-0x000fffff] usable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010357] AGP: No AGP bridge found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010414] last_pfn = 0x430000 max_arch_pfn = 0x400000000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010417] MTRR default type: uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010419] MTRR fixed ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010420]   00000-9FFFF write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010422]   A0000-BFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010423]   C0000-C7FFF write-protect
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010425]   C8000-FFFFF uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010426] MTRR variable ranges enabled:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010428]   0 base 000000000000 mask FFFF80000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010430]   1 base 000080000000 mask FFFFC0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010432]   2 base 0000C0000000 mask FFFFF0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010433]   3 base 0000CFD00000 mask FFFFFFF00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010434]   4 base 0000CFE00000 mask FFFFFFE00000 uncachable
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010436]   5 base 000100000000 mask FFFF00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010437]   6 base 000200000000 mask FFFE00000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010438]   7 base 000400000000 mask FFFFE0000000 write-back
Mar 14 17:24:02 Gemini-Sector kernel: [    0.010440] TOM2: 0000000430000000 aka 17152M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011670] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011752] e820: update [mem 0xcfd00000-0xffffffff] usable ==> reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.011760] last_pfn = 0xcfcf0 max_arch_pfn = 0x400000000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.013968] found SMP MP-table at [mem 0x000f46f0-0x000f46ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032578] Using GB pages for direct mapping
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032935] RAMDISK: [mem 0x34525000-0x36289fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032939] ACPI: Early table checksum verification disabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032943] ACPI: RSDP 0x00000000000F6100 000014 (v00 GBT   )
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032948] ACPI: RSDT 0x00000000CFCF1000 000044 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032955] ACPI: FACP 0x00000000CFCF1080 000074 (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032961] ACPI: DSDT 0x00000000CFCF1100 007BE3 (v01 GBT    GBTUACPI 00001000 MSFT 03000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032965] ACPI: FACS 0x00000000CFCF0000 000040
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032968] ACPI: SSDT 0x00000000CFCF8DC0 00088C (v01 PTLTD  POWERNOW 00000001  LTP 00000001)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032972] ACPI: HPET 0x00000000CFCF9680 000038 (v01 GBT    GBTUACPI 42302E31 GBTU 00000098)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032977] ACPI: MCFG 0x00000000CFCF96C0 00003C (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032980] ACPI: MATS 0x00000000CFCF9700 000034 (v01 GBT             00000000      00000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032984] ACPI: TAMG 0x00000000CFCF9770 000202 (v01 GBT    GBT   B0 5455312E BG?? 53450101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032989] ACPI: APIC 0x00000000CFCF8D00 0000BC (v01 GBT    GBTUACPI 42302E31 GBTU 01010101)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032993] ACPI: IVRS 0x00000000CFCF99F0 0000C0 (v01 AMD    RD890S   00202031 AMD  00000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032997] ACPI: Reserving FACP table memory at [mem 0xcfcf1080-0xcfcf10f3]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032998] ACPI: Reserving DSDT table memory at [mem 0xcfcf1100-0xcfcf8ce2]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.032999] ACPI: Reserving FACS table memory at [mem 0xcfcf0000-0xcfcf003f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033001] ACPI: Reserving SSDT table memory at [mem 0xcfcf8dc0-0xcfcf964b]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033002] ACPI: Reserving HPET table memory at [mem 0xcfcf9680-0xcfcf96b7]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033003] ACPI: Reserving MCFG table memory at [mem 0xcfcf96c0-0xcfcf96fb]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033004] ACPI: Reserving MATS table memory at [mem 0xcfcf9700-0xcfcf9733]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033005] ACPI: Reserving TAMG table memory at [mem 0xcfcf9770-0xcfcf9971]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033006] ACPI: Reserving APIC table memory at [mem 0xcfcf8d00-0xcfcf8dbb]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033007] ACPI: Reserving IVRS table memory at [mem 0xcfcf99f0-0xcfcf9aaf]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033020] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033068] Scanning NUMA topology in Northbridge 24
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033078] No NUMA configuration found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033080] Faking a node at [mem 0x0000000000000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033091] NODE_DATA(0) allocated [mem 0x42ffd6000-0x42fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033663] Zone ranges:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033664]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033666]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033668]   Normal   [mem 0x0000000100000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033670]   Device   empty
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033671] Movable zone start for each node
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033676] Early memory node ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033677]   node   0: [mem 0x0000000000001000-0x000000000009afff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033679]   node   0: [mem 0x0000000000100000-0x00000000cfceffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033680]   node   0: [mem 0x0000000100000000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033683] Initmem setup node 0 [mem 0x0000000000001000-0x000000042fffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033685] On node 0 totalpages: 4193418
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033687]   DMA zone: 64 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033688]   DMA zone: 21 pages reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033689]   DMA zone: 3994 pages, LIFO batch:0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033690]   DMA32 zone: 13236 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033691]   DMA32 zone: 847088 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033692]   Normal zone: 52224 pages used for memmap
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033693]   Normal zone: 3342336 pages, LIFO batch:63
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033697] On node 0, zone DMA: 1 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.033749] On node 0, zone DMA: 101 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046702] On node 0, zone Normal: 784 pages in unavailable ranges
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046887] ACPI: PM-Timer IO Port: 0x808
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046890] ACPI: Local APIC address 0xfee00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046896] ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046897] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046898] ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046899] ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046901] ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046902] ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046903] ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046904] ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046912] IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046914] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046916] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046918] ACPI: IRQ0 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046919] ACPI: IRQ9 used by override.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046921] Using ACPI (MADT) for SMP configuration information
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046923] ACPI: HPET id: 0x10b9a201 base: 0xfed00000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046927] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046943] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046945] PM: hibernation: Registered nosave memory: [mem 0x0009b000-0x0009ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046946] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046947] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046949] PM: hibernation: Registered nosave memory: [mem 0xcfcf0000-0xcfcf0fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046950] PM: hibernation: Registered nosave memory: [mem 0xcfcf1000-0xcfcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046951] PM: hibernation: Registered nosave memory: [mem 0xcfd00000-0xcfdfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046952] PM: hibernation: Registered nosave memory: [mem 0xcfe00000-0xdfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046953] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046954] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfebfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046955] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046957] [mem 0xcfe00000-0xdfffffff] available for PCI devices
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046958] Booting paravirtualized kernel on bare hardware
Mar 14 17:24:02 Gemini-Sector kernel: [    0.046961] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052012] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052712] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052718] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052720] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052756] Built 1 zonelists, mobility grouping on.  Total pages: 4127873
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052757] Policy zone: Normal
Mar 14 17:24:02 Gemini-Sector kernel: [    0.052758] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64 root=UUID=36792c57-a8bc-4264-93a9-6b9485700770 ro quiet
Mar 14 17:24:02 Gemini-Sector kernel: [    0.055863] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.057394] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.057432] mem auto-init: stack:off, heap alloc:on, heap free:off
Mar 14 17:24:02 Gemini-Sector kernel: [    0.069788] AGP: Checking aperture...
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075746] AGP: No AGP bridge found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075750] AGP: Node 0: aperture [bus addr 0x7fe000000-0x7ffffffff] (32MB)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075751] Aperture beyond 4GB. Ignoring.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075752] AGP: Your BIOS doesn't leave an aperture memory hole
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075752] AGP: Please enable the IOMMU option in the BIOS setup
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075753] AGP: This costs you 64MB of RAM
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075757] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff] (65536KB)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.075759] PM: hibernation: Registered nosave memory: [mem 0xc4000000-0xc7ffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.096999] Memory: 3373884K/16773672K available (12295K kernel code, 2537K rwdata, 7560K rodata, 2660K init, 5468K bss, 487536K reserved, 0K cma-res
erved)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.097354] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.097375] ftrace: allocating 36545 entries in 143 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112697] ftrace: allocated 143 pages with 5 groups
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112882] rcu: Hierarchical RCU implementation.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112884] rcu:       RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112885]    Rude variant of Tasks RCU enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112886]    Tracing variant of Tasks RCU enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112887] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.112888] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
Mar 14 17:24:02 Gemini-Sector kernel: [    0.118935] NR_IRQS: 524544, nr_irqs: 488, preallocated irqs: 16
Mar 14 17:24:02 Gemini-Sector kernel: [    0.119284] spurious 8259A interrupt: IRQ7.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121215] Console: colour VGA+ 80x25
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121232] printk: console [tty0] enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121256] ACPI: Core revision 20200925
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121377] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121392] APIC: Switch to symmetric I/O mode setup
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121495] AMD-Vi: Disabling interrupt remapping
Mar 14 17:24:02 Gemini-Sector kernel: [    0.121937] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141395] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x25a51c371bd, max_idle_ns: 440795253524 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141398] Calibrating delay loop (skipped), value calculated using timer frequency.. 5223.23 BogoMIPS (lpj=10446476)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141402] pid_max: default: 32768 minimum: 301
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141482] LSM: Security Framework initializing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141502] Yama: disabled by default; enable with sysctl kernel.yama.*
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141546] AppArmor: AppArmor initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141548] TOMOYO Linux initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141634] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.141687] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142043] LVT offset 0 assigned for vector 0xf9
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142048] process: using AMD E400 aware idle routine
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142050] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142051] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142054] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142056] Spectre V2 : Mitigation: Retpolines
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142057] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Mar 14 17:24:02 Gemini-Sector kernel: [    0.142058] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
Mar 14 17:24:02 Gemini-Sector kernel: [    0.150749] Freeing SMP alternatives memory: 32K
Mar 14 17:24:02 Gemini-Sector kernel: [    0.153405] process: System has AMD C1E enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265118] process: Switch to broadcast mode on CPU0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265124] smpboot: CPU0: AMD Phenom(tm) II X4 910e Processor (family: 0x10, model: 0x4, stepping: 0x3)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265328] Performance Events: AMD PMU driver.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265333] ... version:                0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265333] ... bit width:              48
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265334] ... generic registers:      4
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265335] ... value mask:             0000ffffffffffff
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265336] ... max period:             00007fffffffffff
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265337] ... fixed-purpose events:   0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265338] ... event mask:             000000000000000f
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] rcu: Hierarchical SRCU implementation.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] smp: Bringing up secondary CPUs ...
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] x86: Booting SMP configuration:
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396] .... node  #0, CPUs:      #1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 1.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.265396]  #2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 2.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.267876]  #3
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] __common_interrupt: 3.55 No irq handler for vector
Mar 14 17:24:02 Gemini-Sector kernel: [    0.006140] process: Switch to broadcast mode on CPU3
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smp: Brought up 1 node, 4 CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smpboot: Max logical packages: 2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.269466] smpboot: Total of 4 processors activated (20892.95 BogoMIPS)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305057] node 0 deferred pages initialised in 28ms
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305964] devtmpfs: initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.305964] x86/mm: Memory block size: 128MB
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] PM: Registering ACPI NVS region [mem 0xcfcf0000-0xcfcf0fff] (4096 bytes)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] pinctrl core: initialized pinctrl subsystem
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] NET: Registered protocol family 16
Mar 14 17:24:02 Gemini-Sector kernel: [    0.307219] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309513] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309923] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309936] audit: initializing netlink subsys (disabled)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] audit: type=2000 audit(1678811032.188:1): state=initialized audit_enabled=0 res=1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'fair_share'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'bang_bang'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'step_wise'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'user_space'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] thermal_sys: Registered thermal governor 'power_allocator'
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] cpuidle: using governor ladder
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] cpuidle: using governor menu
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: io port [9000, ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] TOM: 00000000d0000000 aka 3328M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] Fam 10h mmconf [mem 0xe0000000-0xe00fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [a0000, bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [d0000000, dfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [f0000000, ffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] node 0 link 0: mmio [e0000000, e06fffff] ==> [e0100000, e06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] TOM2: 0000000430000000 aka 17152M
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: [bus 00-06] on node 0 link 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [io  0x0000-0xffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x000a0000-0x000bffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xd0000000-0xdfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0700000-0xffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0xe0100000-0xe06fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] bus: 00 [mem 0x430000000-0xfcffffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] ACPI: bus type PCI registered
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] PCI: Using configuration type 1 for base access
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: your CPUs had inconsistent variable MTRR settings
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: probably your BIOS does not setup all CPUs.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.309955] mtrr: corrected configuration.
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310909] Kprobes globally optimized
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310920] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.310920] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Module Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Processor Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(3.0 _SCP Extensions)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Processor Aggregator Device)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-Dell-Video)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.554293] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI: 2 ACPI AML tables successfully acquired and loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKB (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKC (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKD (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.561249] ACPI Error: AE_NOT_FOUND, While resolving a named reference package element - LNKA (20200925/dspkginit-438)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565721] ACPI: Interpreter enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565742] ACPI: (supports S0 S3 S4 S5)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565744] ACPI: Using IOAPIC for interrupt routing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565779] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Mar 14 17:24:02 Gemini-Sector kernel: [    0.565930] ACPI: Enabled 9 GPEs in block 00 to 1F
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571332] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571338] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571605] PCI host bridge to bus 0000:00
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571608] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571609] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571611] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571612] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571614] pci_bus 0000:00: root bus resource [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571615] pci_bus 0000:00: root bus resource [bus 00-ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571628] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571637] pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571748] pci 0000:00:00.2: [1002:5a23] type 00 class 0x080600
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571857] pci 0000:00:02.0: [1002:5a16] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571873] pci 0000:00:02.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.571897] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572009] pci 0000:00:05.0: [1002:5a19] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572024] pci 0000:00:05.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572047] pci 0000:00:05.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572158] pci 0000:00:06.0: [1002:5a1a] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572173] pci 0000:00:06.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572195] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572303] pci 0000:00:07.0: [1002:5a1b] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572318] pci 0000:00:07.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572340] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572452] pci 0000:00:0d.0: [1002:5a1e] type 01 class 0x060400
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572467] pci 0000:00:0d.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572488] pci 0000:00:0d.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572611] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572623] pci 0000:00:11.0: reg 0x10: [io  0xff00-0xff07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572630] pci 0000:00:11.0: reg 0x14: [io  0xfe00-0xfe03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572637] pci 0000:00:11.0: reg 0x18: [io  0xfd00-0xfd07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572643] pci 0000:00:11.0: reg 0x1c: [io  0xfc00-0xfc03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572650] pci 0000:00:11.0: reg 0x20: [io  0xfb00-0xfb0f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572657] pci 0000:00:11.0: reg 0x24: [mem 0xfdfff000-0xfdfff3ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572783] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572795] pci 0000:00:12.0: reg 0x10: [mem 0xfdffe000-0xfdffefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572938] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.572950] pci 0000:00:12.2: reg 0x10: [mem 0xfdffd000-0xfdffd0ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573008] pci 0000:00:12.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573009] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573112] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573124] pci 0000:00:13.0: reg 0x10: [mem 0xfdffc000-0xfdffcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573262] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573274] pci 0000:00:13.2: reg 0x10: [mem 0xfdffb000-0xfdffb0ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573332] pci 0000:00:13.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573333] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573452] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573591] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573732] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573864] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.573876] pci 0000:00:14.5: reg 0x10: [mem 0xfdffa000-0xfdffafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574012] pci 0000:00:16.0: [1002:4397] type 00 class 0x0c0310
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574024] pci 0000:00:16.0: reg 0x10: [mem 0xfdff9000-0xfdff9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574162] pci 0000:00:16.2: [1002:4396] type 00 class 0x0c0320
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574174] pci 0000:00:16.2: reg 0x10: [mem 0xfdff8000-0xfdff80ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574232] pci 0000:00:16.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574233] pci 0000:00:16.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574334] pci 0000:00:18.0: [1022:1200] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574415] pci 0000:00:18.1: [1022:1201] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574493] pci 0000:00:18.2: [1022:1202] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574570] pci 0000:00:18.3: [1022:1203] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574650] pci 0000:00:18.4: [1022:1204] type 00 class 0x060000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574780] pci 0000:01:00.0: [1002:68f9] type 00 class 0x030000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574793] pci 0000:01:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574801] pci 0000:01:00.0: reg 0x18: [mem 0xfddc0000-0xfdddffff 64bit]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574807] pci 0000:01:00.0: reg 0x20: [io  0xee00-0xeeff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574818] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574822] pci 0000:01:00.0: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574858] pci 0000:01:00.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574941] pci 0000:01:00.1: [1002:aa68] type 00 class 0x040300
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574953] pci 0000:01:00.1: reg 0x10: [mem 0xfddfc000-0xfddfffff 64bit]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.574980] pci 0000:01:00.1: enabling Extended Tags
Mar 14 17:24:02 Gemini-Sector kernel: [    0.575015] pci 0000:01:00.1: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585431] pci 0000:00:02.0: PCI bridge to [bus 01]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585435] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585437] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585440] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585485] pci 0000:00:05.0: PCI bridge to [bus 02]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585488] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585490] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585492] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585517] pci 0000:00:06.0: PCI bridge to [bus 03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585520] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585521] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585524] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585570] pci 0000:04:00.0: [10ec:8168] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585585] pci 0000:04:00.0: reg 0x10: [io  0xbe00-0xbeff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585604] pci 0000:04:00.0: reg 0x18: [mem 0xfd5ff000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585615] pci 0000:04:00.0: reg 0x20: [mem 0xfd5f8000-0xfd5fbfff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585624] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585694] pci 0000:04:00.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.585696] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597434] pci 0000:00:07.0: PCI bridge to [bus 04]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597438] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597440] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597443] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597494] pci 0000:05:00.0: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597506] pci 0000:05:00.0: reg 0x10: [mem 0xfd280000-0xfd2fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597523] pci 0000:05:00.0: reg 0x1c: [mem 0xfd4fc000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597597] pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597683] pci 0000:05:00.1: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597695] pci 0000:05:00.1: reg 0x10: [mem 0xfd380000-0xfd3fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597712] pci 0000:05:00.1: reg 0x1c: [mem 0xfd4f8000-0xfd4fbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597778] pci 0000:05:00.1: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597845] pci 0000:05:00.2: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597856] pci 0000:05:00.2: reg 0x10: [mem 0xfd400000-0xfd47ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597873] pci 0000:05:00.2: reg 0x1c: [mem 0xfd4f4000-0xfd4f7fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.597938] pci 0000:05:00.2: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598007] pci 0000:05:00.3: [8086:150e] type 00 class 0x020000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598019] pci 0000:05:00.3: reg 0x10: [mem 0xfd300000-0xfd37ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598036] pci 0000:05:00.3: reg 0x1c: [mem 0xfd4f0000-0xfd4f3fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.598101] pci 0000:05:00.3: PME# supported from D0 D3hot D3cold
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609431] pci 0000:00:0d.0: PCI bridge to [bus 05]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609435] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609437] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609439] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609450] pci_bus 0000:06: extended config space not accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609488] pci 0000:06:06.0: [1102:0004] type 00 class 0x040100
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609505] pci 0000:06:06.0: reg 0x10: [io  0x9f00-0x9f3f]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609584] pci 0000:06:06.0: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609645] pci 0000:06:06.1: [1102:7003] type 00 class 0x098000
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609661] pci 0000:06:06.1: reg 0x10: [io  0x9e00-0x9e07]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609736] pci 0000:06:06.1: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609779] pci 0000:06:06.2: [1102:4001] type 00 class 0x0c0010
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609797] pci 0000:06:06.2: reg 0x10: [mem 0xfd8ff000-0xfd8ff7ff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609807] pci 0000:06:06.2: reg 0x14: [mem 0xfd8f8000-0xfd8fbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609882] pci 0000:06:06.2: supports D1 D2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609883] pci 0000:06:06.2: PME# supported from D0 D1 D2 D3hot
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609958] pci 0000:00:14.4: PCI bridge to [bus 06] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609961] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609964] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609967] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609969] pci 0000:00:14.4:   bridge window [io  0x0000-0x0cf7 window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609970] pci 0000:00:14.4:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609971] pci 0000:00:14.4:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609973] pci 0000:00:14.4:   bridge window [mem 0x000c0000-0x000dffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.609974] pci 0000:00:14.4:   bridge window [mem 0xcff00000-0xfebfffff window] (subtractive decode)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610238] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610288] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610335] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610380] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610425] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610470] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610515] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.610560] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11) *0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611146] iommu: Default domain type: Translated
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: setting as boot VGA device
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] pci 0000:01:00.0: vgaarb: bridge control possible
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] vgaarb: loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] EDAC MC: Ver: 3.0.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel: Initializing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  domain hash size = 128
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] NetLabel:  unlabeled traffic allowed by default
Mar 14 17:24:02 Gemini-Sector kernel: [    0.611174] PCI: Using ACPI for IRQ routing
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613815] PCI: pci_cache_line_size set to 64 bytes
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613873] e820: reserve RAM buffer [mem 0x0009b800-0x0009ffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613874] e820: reserve RAM buffer [mem 0xcfcf0000-0xcfffffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613898] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.613902] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
Mar 14 17:24:02 Gemini-Sector kernel: [    0.617401] clocksource: Switched to clocksource tsc-early
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632217] VFS: Disk quotas dquot_6.6.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632240] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632400] AppArmor: AppArmor Filesystem Enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632419] pnp: PnP ACPI init
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632538] system 00:00: [io  0x04d0-0x04d1] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632540] system 00:00: [io  0x0220-0x0225] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632542] system 00:00: [io  0x0290-0x0294] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632548] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632794] pnp 00:01: disabling [mem 0x00000000-0x00000fff window] because it overlaps 0000:01:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632798] pnp 00:01: disabling [mem 0x00000000-0x00000fff window disabled] because it overlaps 0000:04:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632830] system 00:01: [io  0x0900-0x091f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632832] system 00:01: [io  0x0228-0x022f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632833] system 00:01: [io  0x040b] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632835] system 00:01: [io  0x04d6] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632837] system 00:01: [io  0x0c00-0x0c01] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632838] system 00:01: [io  0x0c14] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632840] system 00:01: [io  0x0c50-0x0c52] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632841] system 00:01: [io  0x0c6c-0x0c6d] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632846] system 00:01: [io  0x0c6f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632848] system 00:01: [io  0x0cd0-0x0cd1] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632849] system 00:01: [io  0x0cd2-0x0cd3] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632851] system 00:01: [io  0x0cd4-0x0cdf] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632852] system 00:01: [io  0x0800-0x08fe] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632853] system 00:01: [io  0x0a10-0x0a17] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632855] system 00:01: [io  0x0b00-0x0b0f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632856] system 00:01: [io  0x0b10-0x0b1f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632858] system 00:01: [io  0x0b20-0x0b3f] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632860] system 00:01: [mem 0xfee00400-0xfee00fff window] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.632864] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633013] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633369] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633433] system 00:04: [mem 0xe0000000-0xefffffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633437] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633615] system 00:05: [mem 0x000d4200-0x000d7fff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633617] system 00:05: [mem 0x000f0000-0x000f7fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633618] system 00:05: [mem 0x000f8000-0x000fbfff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633620] system 00:05: [mem 0x000fc000-0x000fffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633621] system 00:05: [mem 0xcfcf0000-0xcfcfffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633623] system 00:05: [mem 0xffff0000-0xffffffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633624] system 00:05: [mem 0x00000000-0x0009ffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633626] system 00:05: [mem 0x00100000-0xcfceffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633627] system 00:05: [mem 0xcfd00000-0xcfdfffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633629] system 00:05: [mem 0xcfe00000-0xcfefffff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633630] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633632] system 00:05: [mem 0xfee00000-0xfee00fff] could not be reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633634] system 00:05: [mem 0xfff80000-0xfffeffff] has been reserved
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633637] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.633656] pnp: PnP ACPI: found 6 devices
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640014] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640113] NET: Registered protocol family 2
Mar 14 17:24:02 Gemini-Sector kernel: [    0.640541] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.642670] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.642986] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643422] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643632] TCP: Hash tables configured (established 131072 bind 65536)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643767] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.643884] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644004] NET: Registered protocol family 1
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644010] NET: Registered protocol family 44
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644034] pci 0000:01:00.0: BAR 6: assigned [mem 0xfdd00000-0xfdd1ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644037] pci 0000:00:02.0: PCI bridge to [bus 01]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644039] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644042] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644044] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644046] pci 0000:00:05.0: PCI bridge to [bus 02]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644048] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644050] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644052] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644054] pci 0000:00:06.0: PCI bridge to [bus 03]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644056] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644058] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644059] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644063] pci 0000:04:00.0: BAR 6: assigned [mem 0xfd600000-0xfd61ffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644064] pci 0000:00:07.0: PCI bridge to [bus 04]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644066] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644068] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644070] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644073] pci 0000:00:0d.0: PCI bridge to [bus 05]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644075] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644077] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644078] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644082] pci 0000:00:14.4: PCI bridge to [bus 06]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644084] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644088] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644091] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644097] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644098] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644100] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644101] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644102] pci_bus 0000:00: resource 8 [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644104] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644105] pci_bus 0000:01: resource 1 [mem 0xfdd00000-0xfddfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644106] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644107] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644109] pci_bus 0000:02: resource 1 [mem 0xfdc00000-0xfdcfffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644110] pci_bus 0000:02: resource 2 [mem 0xfdb00000-0xfdbfffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644111] pci_bus 0000:03: resource 0 [io  0xc000-0xcfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644113] pci_bus 0000:03: resource 1 [mem 0xfda00000-0xfdafffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644114] pci_bus 0000:03: resource 2 [mem 0xfd900000-0xfd9fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644115] pci_bus 0000:04: resource 0 [io  0xb000-0xbfff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644116] pci_bus 0000:04: resource 1 [mem 0xfd600000-0xfd6fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644117] pci_bus 0000:04: resource 2 [mem 0xfd500000-0xfd5fffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644119] pci_bus 0000:05: resource 0 [io  0xa000-0xafff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644120] pci_bus 0000:05: resource 1 [mem 0xfd200000-0xfd4fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644121] pci_bus 0000:05: resource 2 [mem 0xfde00000-0xfdefffff 64bit pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644123] pci_bus 0000:06: resource 0 [io  0x9000-0x9fff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644124] pci_bus 0000:06: resource 1 [mem 0xfd800000-0xfd8fffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644125] pci_bus 0000:06: resource 2 [mem 0xfd700000-0xfd7fffff pref]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644126] pci_bus 0000:06: resource 4 [io  0x0000-0x0cf7 window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644128] pci_bus 0000:06: resource 5 [io  0x0d00-0xffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644129] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644130] pci_bus 0000:06: resource 7 [mem 0x000c0000-0x000dffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.644132] pci_bus 0000:06: resource 8 [mem 0xcff00000-0xfebfffff window]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.663040] pci 0000:00:12.0: quirk_usb_early_handoff+0x0/0x710 took 18397 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.683023] pci 0000:00:13.0: quirk_usb_early_handoff+0x0/0x710 took 19279 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.703029] pci 0000:00:14.5: quirk_usb_early_handoff+0x0/0x710 took 19300 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723025] pci 0000:00:16.0: quirk_usb_early_handoff+0x0/0x710 took 19517 usecs
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723275] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723304] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723331] PCI: CLS 64 bytes, default 64
Mar 14 17:24:02 Gemini-Sector kernel: [    0.723430] Trying to unpack rootfs image as initramfs...
Mar 14 17:24:02 Gemini-Sector kernel: [    1.274645] Freeing initrd memory: 30100K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323361] pci 0000:00:00.2: can't derive routing for PCI INT A
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323364] pci 0000:00:00.2: PCI INT A: no GSI
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323400] pci 0000:00:00.0: Adding to iommu group 0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323417] pci 0000:00:02.0: Adding to iommu group 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323430] pci 0000:00:05.0: Adding to iommu group 2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323442] pci 0000:00:06.0: Adding to iommu group 3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323454] pci 0000:00:07.0: Adding to iommu group 4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323469] pci 0000:00:0d.0: Adding to iommu group 5
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323481] pci 0000:00:11.0: Adding to iommu group 6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323502] pci 0000:00:12.0: Adding to iommu group 7
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323514] pci 0000:00:12.2: Adding to iommu group 7
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323536] pci 0000:00:13.0: Adding to iommu group 8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323553] pci 0000:00:13.2: Adding to iommu group 8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323567] pci 0000:00:14.0: Adding to iommu group 9
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323580] pci 0000:00:14.3: Adding to iommu group 10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323592] pci 0000:00:14.4: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323607] pci 0000:00:14.5: Adding to iommu group 12
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323629] pci 0000:00:16.0: Adding to iommu group 13
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323642] pci 0000:00:16.2: Adding to iommu group 13
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323665] pci 0000:01:00.0: Adding to iommu group 14
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323679] pci 0000:01:00.1: Adding to iommu group 14
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323695] pci 0000:04:00.0: Adding to iommu group 15
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323708] pci 0000:05:00.0: Adding to iommu group 16
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323725] pci 0000:05:00.1: Adding to iommu group 17
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323738] pci 0000:05:00.2: Adding to iommu group 18
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323754] pci 0000:05:00.3: Adding to iommu group 19
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323759] pci 0000:06:06.0: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323764] pci 0000:06:06.1: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.323769] pci 0000:06:06.2: Adding to iommu group 11
Mar 14 17:24:02 Gemini-Sector kernel: [    1.374655] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.374808] AMD-Vi: Lazy IO/TLB flushing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376691] LVT offset 1 assigned for vector 0x400
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376700] LVT offset 1 assigned
Mar 14 17:24:02 Gemini-Sector kernel: [    1.376789] perf: AMD IBS detected (0x0000001f)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377276] Initialise system trusted keyrings
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377294] Key type blacklist registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.377376] workingset: timestamp_bits=36 max_order=22 bucket_order=0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.378991] zbud: loaded
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379249] integrity: Platform Keyring initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379251] Key type asymmetric registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379252] Asymmetric key parser 'x509' registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379260] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.379341] io scheduler mq-deadline registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.380954] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.380982] ACPI: ACPI: processor limited to max C-state 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381391] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381817] Linux agpgart interface v0.103
Mar 14 17:24:02 Gemini-Sector kernel: [    1.381851] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382205] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382206] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382343] serio: i8042 KBD port at 0x60,0x64 irq 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382449] mousedev: PS/2 mouse device common for all mice
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382486] rtc_cmos 00:02: RTC can wake from S4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382662] rtc_cmos 00:02: registered as rtc0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382699] rtc_cmos 00:02: setting system clock to 2023-03-14T16:23:53 UTC (1678811033)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382720] rtc_cmos 00:02: alarms up to one month, 242 bytes nvram, hpet irqs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.382777] ledtrig-cpu: registered to indicate activity on CPUs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.383267] NET: Registered protocol family 10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391668] Segment Routing with IPv6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391689] mip6: Mobile IPv6
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391692] NET: Registered protocol family 17
Mar 14 17:24:02 Gemini-Sector kernel: [    1.391737] mpls_gso: MPLS GSO support
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392035] microcode: CPU0: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392040] microcode: CPU1: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392047] microcode: CPU2: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392054] microcode: CPU3: patch_level=0x010000c8
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392059] microcode: Microcode Update Driver: v2.2.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392062] IPI shorthand broadcast: enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392071] sched_clock: Marking stable (1389838946, 2140900)->(1422316128, -30336282)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392154] registered taskstats version 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.392157] Loading compiled-in X.509 certificates
Mar 14 17:24:02 Gemini-Sector kernel: [    1.401265] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447842] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447864] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: 14011249c2675ea8e5148542202005810584b25f'
Mar 14 17:24:02 Gemini-Sector kernel: [    1.447905] zswap: loaded using pool lzo/zbud
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448114] Key type .fscrypt registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448116] Key type fscrypt-provisioning registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.448175] AppArmor: AppArmor sha1 policy hashing enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    1.449987] Freeing unused decrypted memory: 2036K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.450721] Freeing unused kernel image (initmem) memory: 2660K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.469469] Write protecting the kernel read-only data: 22528k
Mar 14 17:24:02 Gemini-Sector kernel: [    1.470176] Freeing unused kernel image (text/rodata gap) memory: 2040K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.470379] Freeing unused kernel image (rodata/data gap) memory: 632K
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515106] x86/mm: Checked W+X mappings: passed, no W+X pages found.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515112] Run /init as init process
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515113]   with arguments:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515114]     /init
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]   with environment:
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515115]     HOME=/
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515116]     TERM=linux
Mar 14 17:24:02 Gemini-Sector kernel: [    1.515117]     BOOT_IMAGE=/boot/vmlinuz-5.10.0-21-amd64
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533140] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533168] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.533180] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.553338] pps_core: LinuxPPS API ver. 1 registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.553340] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Mar 14 17:24:02 Gemini-Sector kernel: [    1.554870] PTP clock support registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.555897] dca service started, version 1.12.1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.565535] r8169 0000:04:00.0: can't disable ASPM; OS doesn't have ASPM control
Mar 14 17:24:02 Gemini-Sector kernel: [    1.568866] r8169 0000:04:00.0 eth0: RTL8168d/8111d, 1c:6f:65:92:d2:20, XID 283, IRQ 30
Mar 14 17:24:02 Gemini-Sector kernel: [    1.568869] r8169 0000:04:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
Mar 14 17:24:02 Gemini-Sector kernel: [    1.569230] igb: Intel(R) Gigabit Ethernet Network Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.569232] igb: Copyright (c) 2007-2014 Intel Corporation.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.581800] SCSI subsystem initialized
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601059] ACPI: bus type USB registered
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601094] usbcore: registered new interface driver usbfs
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601104] usbcore: registered new interface driver hub
Mar 14 17:24:02 Gemini-Sector kernel: [    1.601117] usbcore: registered new device driver usb
Mar 14 17:24:02 Gemini-Sector kernel: [    1.605621] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608635] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608731] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SOR1)
(20200925/utaddress-204)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.608736] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.609682] libata version 3.00 loaded.
Mar 14 17:24:02 Gemini-Sector kernel: [    1.609903] ehci-pci: EHCI PCI platform driver
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610233] QUIRK: Enable AMD PLL fix
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610260] ehci-pci 0000:00:12.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610268] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus number 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610273] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610280] ehci-pci 0000:00:12.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.610325] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdffd000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617448] ahci 0000:00:11.0: version 3.0
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617720] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
Mar 14 17:24:02 Gemini-Sector kernel: [    1.617723] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pmp pio slum part
Mar 14 17:24:02 Gemini-Sector kernel: [    1.618930] scsi host0: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.619410] scsi host1: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625419] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625524] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625525] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625527] usb usb1: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625528] usb usb1: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625529] usb usb1: SerialNumber: 0000:00:12.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625607] scsi host2: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625753] hub 1-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.625761] hub 1-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626117] ehci-pci 0000:00:13.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626124] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626127] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626135] ehci-pci 0000:00:13.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626171] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdffb000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626208] scsi host3: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626365] scsi host4: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626527] scsi host5: ahci
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626595] ata1: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff100 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626598] ata2: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff180 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626600] ata3: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff200 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626602] ata4: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff280 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626603] ata5: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff300 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.626605] ata6: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff380 irq 40
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637947] igb 0000:05:00.0: added PHC on eth1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637949] igb 0000:05:00.0: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637951] igb 0000:05:00.0: eth1: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:44
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637953] igb 0000:05:00.0: eth1: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.637954] igb 0000:05:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645461] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645559] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645561] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645563] usb usb2: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645564] usb usb2: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645565] usb usb2: SerialNumber: 0000:00:13.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645684] hub 2-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.645692] hub 2-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646052] ehci-pci 0000:00:16.2: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646057] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus number 3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646061] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646068] ehci-pci 0000:00:16.2: debug port 1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.646102] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdff8000
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665457] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665507] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665509] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665510] usb usb3: Product: EHCI Host Controller
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665511] usb usb3: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665512] usb usb3: SerialNumber: 0000:00:16.2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665630] hub 3-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    1.665638] hub 3-0:1.0: 4 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    1.677492] firewire_ohci 0000:06:06.2: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690559] igb 0000:05:00.1: added PHC on eth2
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690561] igb 0000:05:00.1: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690563] igb 0000:05:00.1: eth2: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:45
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690565] igb 0000:05:00.1: eth2: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.690566] igb 0000:05:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741908] igb 0000:05:00.2: added PHC on eth3
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741910] igb 0000:05:00.2: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741911] igb 0000:05:00.2: eth3: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:46
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741913] igb 0000:05:00.2: eth3: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.741915] igb 0000:05:00.2: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793900] igb 0000:05:00.3: added PHC on eth4
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793902] igb 0000:05:00.3: Intel(R) Gigabit Ethernet Network Connection
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793904] igb 0000:05:00.3: eth4: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b:44:47
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793906] igb 0000:05:00.3: eth4: PBA No: Unknown
Mar 14 17:24:02 Gemini-Sector kernel: [    1.793907] igb 0000:05:00.3: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940751] ata6: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940776] ata1: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940802] ata4: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940828] ata2: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    1.940876] ata3: SATA link down (SStatus 0 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.101468] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102222] ata5.00: supports DRM functions and may not be fully accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102250] ata5.00: ATA-10: CT2000MX500SSD1, M3CR045, max UDMA/133
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102252] ata5.00: 3907029168 sectors, multi 1: LBA48 NCQ (depth 32), AA
Mar 14 17:24:02 Gemini-Sector kernel: [    2.102844] ata5.00: supports DRM functions and may not be fully accessible
Mar 14 17:24:02 Gemini-Sector kernel: [    2.103341] ata5.00: configured for UDMA/133
Mar 14 17:24:02 Gemini-Sector kernel: [    2.103475] scsi 4:0:0:0: Direct-Access     ATA      CT2000MX500SSD1  045  PQ: 0 ANSI: 5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.104637] ohci-pci: OHCI PCI platform driver
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105086] ohci-pci 0000:00:12.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105094] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 4
Mar 14 17:24:02 Gemini-Sector kernel: [    2.105132] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdffe000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151609] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151611] sd 4:0:0:0: [sda] 4096-byte physical blocks
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151642] sd 4:0:0:0: [sda] Write Protect is off
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151645] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
Mar 14 17:24:02 Gemini-Sector kernel: [    2.151673] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165520] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165522] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165524] usb usb4: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165525] usb usb4: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165526] usb usb4: SerialNumber: 0000:00:12.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165654] hub 4-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.165663] hub 4-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166024] ohci-pci 0000:00:13.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166030] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus number 5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.166053] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdffc000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.178084]  sda: sda1 sda2 sda3 sda4
Mar 14 17:24:02 Gemini-Sector kernel: [    2.193787] sd 4:0:0:0: [sda] supports TCG Opal
Mar 14 17:24:02 Gemini-Sector kernel: [    2.193789] sd 4:0:0:0: [sda] Attached SCSI disk
Mar 14 17:24:02 Gemini-Sector kernel: [    2.196077] sd 4:0:0:0: Attached scsi generic sg0 type 0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.201515] firewire_core 0000:06:06.2: created device fw0: GUID 00023c009103cf43, S400
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229494] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229497] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229498] usb usb5: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229500] usb usb5: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229501] usb usb5: SerialNumber: 0000:00:13.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229564] device-mapper: uevent: version 1.0.3
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229648] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229681] hub 5-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.229691] hub 5-0:1.0: 5 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230191] ohci-pci 0000:00:14.5: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230199] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus number 6
Mar 14 17:24:02 Gemini-Sector kernel: [    2.230228] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdffa000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293492] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293496] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293497] usb usb6: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293499] usb usb6: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293500] usb usb6: SerialNumber: 0000:00:14.5
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293642] hub 6-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293650] hub 6-0:1.0: 2 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.293993] ohci-pci 0000:00:16.0: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.294000] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus number 7
Mar 14 17:24:02 Gemini-Sector kernel: [    2.294025] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdff9000
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357488] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.10
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357491] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357492] usb usb7: Product: OHCI PCI host controller
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357493] usb usb7: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357494] usb usb7: SerialNumber: 0000:00:16.0
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357619] hub 7-0:1.0: USB hub found
Mar 14 17:24:02 Gemini-Sector kernel: [    2.357627] hub 7-0:1.0: 4 ports detected
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393457] tsc: Refined TSC clocksource calibration: 2611.834 MHz
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393473] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x25a5e752d40, max_idle_ns: 440795227132 ns
Mar 14 17:24:02 Gemini-Sector kernel: [    2.393492] clocksource: Switched to clocksource tsc
Mar 14 17:24:02 Gemini-Sector kernel: [    2.837454] usb 4-4: new full-speed USB device number 2 using ohci-pci
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038516] usb 4-4: New USB device found, idVendor=046d, idProduct=c52e, bcdDevice=23.01
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038519] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038520] usb 4-4: Product: USB Receiver
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038522] usb 4-4: Manufacturer: Logitech
Mar 14 17:24:02 Gemini-Sector kernel: [    3.038987] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.049147] hid: raw HID events driver (C) Jiri Kosina
Mar 14 17:24:02 Gemini-Sector kernel: [    3.060819] usbcore: registered new interface driver usbhid
Mar 14 17:24:02 Gemini-Sector kernel: [    3.060820] usbhid: USB HID core driver
Mar 14 17:24:02 Gemini-Sector kernel: [    3.062288] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.0/0003:046D:C52E.0001/input/input1
Mar 14 17:24:02 Gemini-Sector kernel: [    3.121629] hid-generic 0003:046D:C52E.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:12.0-4/input0
Mar 14 17:24:02 Gemini-Sector kernel: [    3.122030] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input2
Mar 14 17:24:02 Gemini-Sector kernel: [    3.122125] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input3
Mar 14 17:24:02 Gemini-Sector kernel: [    3.181500] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input4
Mar 14 17:24:02 Gemini-Sector kernel: [    3.181597] hid-generic 0003:046D:C52E.0002: input,hiddev0,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:12.0-4/input1
Mar 14 17:24:02 Gemini-Sector kernel: [    3.487865] PM: Image not found (code -22)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.683029] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.724796] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
Mar 14 17:24:02 Gemini-Sector kernel: [    3.895967] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.896231] random: udevd: uninitialized urandom read (16 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939518] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input7
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939547] ACPI: Power Button [PWRB]
Mar 14 17:24:02 Gemini-Sector kernel: [    3.939612] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input8
Mar 14 17:24:02 Gemini-Sector kernel: [    3.940773] acpi_cpufreq: overriding BIOS provided _PSD data
Mar 14 17:24:02 Gemini-Sector kernel: [    3.957643] ACPI: Power Button [PWRF]
Mar 14 17:24:02 Gemini-Sector kernel: [    4.054242] random: lvm: uninitialized urandom read (4 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    4.064338] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Mar 14 17:24:02 Gemini-Sector kernel: [    4.064442] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
Mar 14 17:24:02 Gemini-Sector kernel: [    4.080231] gameport gameport0: EMU10K1 is pci0000:06:06.1/gameport0, io 0x9e00, speed 792kHz
Mar 14 17:24:02 Gemini-Sector kernel: [    4.080383] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
Mar 14 17:24:02 Gemini-Sector kernel: [    4.121889] input: PC Speaker as /devices/platform/pcspkr/input/input9
Mar 14 17:24:02 Gemini-Sector kernel: [    4.122636] [drm] radeon kernel modesetting enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.123178] [drm:radeon_pci_probe [radeon]] *ERROR* radeon kernel modesetting for R600 or later requires firmware installed
Mar 14 17:24:02 Gemini-Sector kernel: [    4.123221] See https://wiki.debian.org/Firmware for information about missing firmware
Mar 14 17:24:02 Gemini-Sector kernel: [    4.127927] snd_emu10k1 0000:06:06.0: non-passthrough IOMMU detected, widening DMA allocations
Mar 14 17:24:02 Gemini-Sector kernel: [    4.132854] snd_emu10k1 0000:06:06.0: Installing spdif_bug patch: SB Audigy 2 Platinum [SB0240P]
Mar 14 17:24:02 Gemini-Sector kernel: [    4.199226] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:02.0/0000:01:00.1/sound/card1/input10
Mar 14 17:24:02 Gemini-Sector kernel: [    4.213240] kvm: Nested Virtualization enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    4.213248] SVM: kvm: Nested Paging enabled
Mar 14 17:24:02 Gemini-Sector kernel: [    4.233228] MCE: In-kernel MCE decoding enabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.235765] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.235787] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.301999] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.302021] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.349890] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.349912] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    4.381846] EDAC amd64: F10h detected (node 0).
Mar 14 17:24:02 Gemini-Sector kernel: [    4.381865] EDAC amd64: Node 0: DRAM ECC disabled.
Mar 14 17:24:02 Gemini-Sector kernel: [    7.339055] random: lvm: uninitialized urandom read (4 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.441477] Adding 1952764k swap on /dev/sda2.  Priority:-2 extents:1 across:1952764k SSFS
Mar 14 17:24:02 Gemini-Sector kernel: [    7.456939] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
Mar 14 17:24:02 Gemini-Sector kernel: [    7.740641] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: errors=remount-ro
Mar 14 17:24:02 Gemini-Sector kernel: [    7.821597] random: dd: uninitialized urandom read (32 bytes read)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.878778] r8169 0000:04:00.0: firmware: direct-loading firmware rtl_nic/rtl8168d-2.fw
Mar 14 17:24:02 Gemini-Sector kernel: [    7.878787] r8169 0000:04:00.0: Unable to load firmware rtl_nic/rtl8168d-2.fw (-22)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.879675] RTL8211B Gigabit Ethernet r8169-0-400:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-0-400:00, irq=IGNORE)
Mar 14 17:24:02 Gemini-Sector kernel: [    7.948422] r8169 0000:04:00.0 eth0: Link is Down
Mar 14 17:24:02 Gemini-Sector kernel: [    8.013168] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018315] xenbr0: port 1(eth0) entered blocking state
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018317] xenbr0: port 1(eth0) entered disabled state
Mar 14 17:24:02 Gemini-Sector kernel: [    8.018393] device eth0 entered promiscuous mode
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958500] r8169 0000:04:00.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958525] xenbr0: port 1(eth0) entered blocking state
Mar 14 17:24:02 Gemini-Sector kernel: [    9.958532] xenbr0: port 1(eth0) entered forwarding state
Mar 14 17:24:02 Gemini-Sector kernel: [   10.344586] random: dbus-uuidgen: uninitialized urandom read (12 bytes read)
Mar 14 17:24:02 Gemini-Sector cron[1386]: (CRON) INFO (pidfile fd = 3)
Mar 14 17:24:02 Gemini-Sector cron[1391]: (CRON) STARTUP (fork ok)
Mar 14 17:24:02 Gemini-Sector cron[1391]: (CRON) INFO (Running @reboot jobs)
Mar 14 17:24:03 Gemini-Sector rsyslogd: [origin software="rsyslogd" swVersion="8.2102.0" x-pid="1337" x-info="https://www.rsyslog.com"] start
Mar 14 17:24:03 Gemini-Sector kernel: [   11.901410] random: crng init done
Mar 14 17:24:03 Gemini-Sector kernel: [   11.901413] random: 12 urandom warning(s) missed due to ratelimiting
--abmob-adb2cd80-116f-4618-b871-47724293d146--


