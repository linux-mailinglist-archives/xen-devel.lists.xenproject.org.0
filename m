Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873565BDF7F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 10:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409210.652163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaYNh-0003V2-3a; Tue, 20 Sep 2022 08:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409210.652163; Tue, 20 Sep 2022 08:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaYNg-0003Rb-WC; Tue, 20 Sep 2022 08:13:25 +0000
Received: by outflank-mailman (input) for mailman id 409210;
 Tue, 20 Sep 2022 08:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLv4=ZX=gmail.com=szewcson@srs-se1.protection.inumbo.net>)
 id 1oaYNe-0003RV-Hi
 for xen-devel@lists.xen.org; Tue, 20 Sep 2022 08:13:23 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 133ba715-38bc-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 10:13:15 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id f23so1613333plr.6
 for <xen-devel@lists.xen.org>; Tue, 20 Sep 2022 01:13:15 -0700 (PDT)
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
X-Inumbo-ID: 133ba715-38bc-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=opcyzx6BRUE4Gx/VuLLL7PZ1mjeghnOpID4J2zs2kGA=;
        b=bdyeSB/cVNAF0E5BkzrKUiTJJS1oRn0rrHI7WgQTZCybx3JnXSVhs8tHj6FxnnDlcV
         9BohFAIcBGdr8peqooACK9XpAl23jWlmCqVo47pXdqzOq50qXPgkuB/8Tx6Jfsirg3Dd
         cO1/qr7Gp5WIWaHFnCFNaA08nQ1uzNCdNSmlnyKsrjBZ+ux/gK8+B8IbY7I4qizBDHCk
         koNxvns6dh2G/pP+5uM5jU6CF0cD1+ysLrFwIhiDCTFUGAHSNGwPpwmBC1yaPyDwZmZ3
         dKUx6lJ6gW0FsnwRbjzy2c5pKozxL/zvuNqG0c2vMvUUjP2JaGEa/YHcu2zWUOErjbvv
         c1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=opcyzx6BRUE4Gx/VuLLL7PZ1mjeghnOpID4J2zs2kGA=;
        b=TJjmijIif87bPrfBKzGq/TYL9gHlMwTFRBlpCibY8HmCA9mNdUEiLRw6ZVUZBaa3lZ
         UYyxoAUZM2tAWcakE/kBoye5WIKV9dBRyJG2DpCcslQ2FlYLHNrjjz5KevdT5fwXSSLe
         RxhPyG8D9gEDt60ZPf7lYcqEGzMrzWQiTq5oATCUD4IWzXcBYkVirRM4xJWKl1zjTugl
         WYL2GEhbu/MRubdSLwsm8yx/UGxipfcSfIwttFNihxojEnvaOEwYGKYT7fghEcaBUwIm
         APn5u6OBXXSemALLNyMskrNVu1BbvK4JEd0P8pkpf/vorO/RVUK+pV8gOLMSSQWQxbes
         5YqA==
X-Gm-Message-State: ACrzQf1RApJnHegpHrMBqze+CX3ylXjIrVkV2aUZzkQgj1Gay54bou0+
	BHI+SPCBimNgfqPiYOrty42N0ZXBjs29NHKMtF/Lo+XmpkA=
X-Google-Smtp-Source: AMsMyM5XVWw0QVHVTiefnIiEq75Wh51q/wJBW/a8YP19HEUROWjRdka8sDvFX+NIM7IMDNlK/eBJno1Ogf0kaEQpyrY=
X-Received: by 2002:a17:90a:f291:b0:200:acc9:422d with SMTP id
 fs17-20020a17090af29100b00200acc9422dmr2512629pjb.21.1663661591774; Tue, 20
 Sep 2022 01:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <YyR1eUfbq9aVSVXV@Air-de-Roger> <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com>
 <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local> <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
In-Reply-To: <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
From: Adam Szewczyk <szewcson@gmail.com>
Date: Tue, 20 Sep 2022 10:12:58 +0200
Message-ID: <CAHsotThDozh7GbzCcVCN+-Gzxs2f_4LHHM-EcF3OciF7xMXTRg@mail.gmail.com>
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000344bfe05e9176609"

--000000000000344bfe05e9176609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On, log section i Qubes manager also those logs are empty, but I can attach
/var/log/xen/console/guest-openbsd-71-dm.log:
[2022-09-19 19:50:55] Logfile Opened
[2022-09-19 19:50:56] Linux version 5.10.105-xen-stubdom
(mockbuild@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422
(Red Hat 10.3.1-1), GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST
2022
[2022-09-19 19:50:56] Command line:
[2022-09-19 19:50:56] x86/fpu: Supporting XSAVE feature 0x001: 'x87
floating point registers'
[2022-09-19 19:50:56] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
registers'
[2022-09-19 19:50:56] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
registers'
[2022-09-19 19:50:56] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  25=
6
[2022-09-19 19:50:56] x86/fpu: Enabled xstate features 0x7, context size is
832 bytes, using 'standard' format.
[2022-09-19 19:50:56] Released 0 page(s)
[2022-09-19 19:50:56] BIOS-provided physical RAM map:
[2022-09-19 19:50:56] Xen: [mem 0x0000000000000000-0x000000000009ffff]
usable
[2022-09-19 19:50:56] Xen: [mem 0x00000000000a0000-0x00000000000fffff]
reserved
[2022-09-19 19:50:56] Xen: [mem 0x0000000000100000-0x0000000008ffffff]
usable
[2022-09-19 19:50:56] NX (Execute Disable) protection: active
[2022-09-19 19:50:56] Hypervisor detected: Xen PV
[2022-09-19 19:50:56] tsc: Fast TSC calibration failed
[2022-09-19 19:50:56] tsc: Detected 2591.990 MHz processor
[2022-09-19 19:50:56] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000
[2022-09-19 19:50:56] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP
 UC  UC
[2022-09-19 19:50:56] RAMDISK: [mem 0x02000000-0x03f7afff]
[2022-09-19 19:50:56] Zone ranges:
[2022-09-19 19:50:56]   DMA32    [mem 0x0000000000001000-0x0000000008ffffff=
]
[2022-09-19 19:50:56]   Normal   empty
[2022-09-19 19:50:56] Movable zone start for each node
[2022-09-19 19:50:56] Early memory node ranges
[2022-09-19 19:50:56]   node   0: [mem
0x0000000000001000-0x000000000009ffff]
[2022-09-19 19:50:56]   node   0: [mem
0x0000000000100000-0x0000000008ffffff]
[2022-09-19 19:50:56] Initmem setup node 0 [mem
0x0000000000001000-0x0000000008ffffff]
[2022-09-19 19:50:56] On node 0, zone DMA32: 1 pages in unavailable ranges
[2022-09-19 19:50:56] On node 0, zone DMA32: 96 pages in unavailable ranges
[2022-09-19 19:50:56] On node 0, zone DMA32: 28672 pages in unavailable
ranges
[2022-09-19 19:50:56] p2m virtual area at (____ptrval____), size is 200000
[2022-09-19 19:50:56] Remapped 0 page(s)
[2022-09-19 19:50:56] [mem 0x09000000-0xffffffff] available for PCI devices
[2022-09-19 19:50:56] Booting paravirtualized kernel on Xen
[2022-09-19 19:50:56] Xen version: 4.14.5 (preserve-AD)
[2022-09-19 19:50:56] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[2022-09-19 19:50:56] Built 1 zonelists, mobility grouping on.  Total
pages: 36170
[2022-09-19 19:50:56] Kernel command line: clocksource=3Dtsc
[2022-09-19 19:50:56] Dentry cache hash table entries: 32768 (order: 6,
262144 bytes, linear)
[2022-09-19 19:50:56] Inode-cache hash table entries: 16384 (order: 5,
131072 bytes, linear)
[2022-09-19 19:50:56] mem auto-init: stack:byref_all(zero), heap alloc:off,
heap free:off
[2022-09-19 19:50:56] Memory: 96968K/147068K available (6145K kernel code,
842K rwdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K
cma-reserved)
[2022-09-19 19:50:56] random: get_random_u64 called from 0xffffffff810a0f18
with crng_init=3D0
[2022-09-19 19:50:56] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1,
Nodes=3D1
[2022-09-19 19:50:56] Using NULL legacy PIC
[2022-09-19 19:50:56] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0
[2022-09-19 19:50:56] xen:events: Using FIFO-based ABI
[2022-09-19 19:50:56] printk: console [hvc0] enabled
[2022-09-19 19:50:56] clocksource: xen: mask: 0xffffffffffffffff
max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[2022-09-19 19:50:56] installing Xen timer for CPU 0
[2022-09-19 19:50:56] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x255cad98bda, max_idle_ns: 440795306906 ns
[2022-09-19 19:50:56] Calibrating delay loop (skipped), value calculated
using timer frequency.. 5183.98 BogoMIPS (lpj=3D10367960)
[2022-09-19 19:50:56] pid_max: default: 4096 minimum: 301
[2022-09-19 19:50:56] Mount-cache hash table entries: 512 (order: 0, 4096
bytes, linear)
[2022-09-19 19:50:56] Mountpoint-cache hash table entries: 512 (order: 0,
4096 bytes, linear)
[2022-09-19 19:50:56] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[2022-09-19 19:50:56] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[2022-09-19 19:50:56] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
(family: 0x6, model: 0x9e, stepping: 0xa)
[2022-09-19 19:50:56] Spectre V1 : Mitigation: usercopy/swapgs barriers and
__user pointer sanitization
[2022-09-19 19:50:56] Spectre V2 : Mitigation: Retpolines
[2022-09-19 19:50:56] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
Filling RSB on context switch
[2022-09-19 19:50:56] Spectre V2 : Enabling Restricted Speculation for
firmware calls
[2022-09-19 19:50:56] Spectre V2 : mitigation: Enabling conditional
Indirect Branch Prediction Barrier
[2022-09-19 19:50:56] Speculative Store Bypass: Mitigation: Speculative
Store Bypass disabled via prctl and seccomp
[2022-09-19 19:50:56] SRBDS: Unknown: Dependent on hypervisor status
[2022-09-19 19:50:56] MDS: Mitigation: Clear CPU buffers
[2022-09-19 19:50:56] Performance Events: unsupported p6 CPU model 158 no
PMU driver, software events only.
[2022-09-19 19:50:56] devtmpfs: initialized
[2022-09-19 19:50:56] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[2022-09-19 19:50:56] futex hash table entries: 16 (order: -4, 384 bytes,
linear)
[2022-09-19 19:50:56] NET: Registered protocol family 16
[2022-09-19 19:50:56] xen:grant_table: Grant tables using version 1 layout
[2022-09-19 19:50:56] Grant table initialized
[2022-09-19 19:50:56] PCI: setting up Xen PCI frontend stub
[2022-09-19 19:50:56] xen:balloon: Initialising balloon driver
[2022-09-19 19:50:56] usbcore: registered new interface driver usbfs
[2022-09-19 19:50:56] usbcore: registered new interface driver hub
[2022-09-19 19:50:56] usbcore: registered new device driver usb
[2022-09-19 19:50:56] PCI: System does not support PCI
[2022-09-19 19:50:56] clocksource: Switched to clocksource xen
[2022-09-19 19:50:56] NET: Registered protocol family 2
[2022-09-19 19:50:56] IP idents hash table entries: 4096 (order: 3, 32768
bytes, linear)
[2022-09-19 19:50:56] tcp_listen_portaddr_hash hash table entries: 256
(order: 0, 4096 bytes, linear)
[2022-09-19 19:50:56] TCP established hash table entries: 2048 (order: 2,
16384 bytes, linear)
[2022-09-19 19:50:56] TCP bind hash table entries: 2048 (order: 2, 16384
bytes, linear)
[2022-09-19 19:50:56] TCP: Hash tables configured (established 2048 bind
2048)
[2022-09-19 19:50:56] UDP hash table entries: 128 (order: 0, 4096 bytes,
linear)
[2022-09-19 19:50:56] UDP-Lite hash table entries: 128 (order: 0, 4096
bytes, linear)
[2022-09-19 19:50:56] NET: Registered protocol family 1
[2022-09-19 19:50:56] Unpacking initramfs...
[2022-09-19 19:50:56] Freeing initrd memory: 32236K
[2022-09-19 19:50:56] clocksource: tsc: mask: 0xffffffffffffffff
max_cycles: 0x255cad98bda, max_idle_ns: 440795306906 ns
[2022-09-19 19:50:56] clocksource: Switched to clocksource tsc
[2022-09-19 19:50:56] workingset: timestamp_bits=3D62 max_order=3D15
bucket_order=3D0
[2022-09-19 19:50:56] xen:xen_evtchn: Event-channel device installed
[2022-09-19 19:50:56] Invalid max_queues (4), will use default max: 1.
[2022-09-19 19:50:56] tun: Universal TUN/TAP device driver, 1.6
[2022-09-19 19:50:56] xen_netfront: Initialising Xen virtual ethernet drive=
r
[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 1
[2022-09-19 19:50:56] vhci_hcd: created sysfs vhci_hcd.0
[2022-09-19 19:50:56] hub 1-0:1.0: USB hub found
[2022-09-19 19:50:56] hub 1-0:1.0: 8 ports detected
[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 2
[2022-09-19 19:50:56] usb usb2: We don't know the algorithms for LPM for
this host, disabling LPM.
[2022-09-19 19:50:56] hub 2-0:1.0: USB hub found
[2022-09-19 19:50:56] hub 2-0:1.0: 8 ports detected
[2022-09-19 19:50:56] NET: Registered protocol family 17
[2022-09-19 19:50:56] sched_clock: Marking stable (273283961,
179377)->(275136085, -1672747)
[2022-09-19 19:50:56] random: fast init done
[2022-09-19 19:50:56] blkfront: xvda: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 19:50:56]  xvda: xvda4
[2022-09-19 19:50:56] blkfront: xvdb: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 19:50:56] blkfront: xvdc: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 19:50:56] Freeing unused kernel image (initmem) memory: 696K
[2022-09-19 19:50:56] Write protecting the kernel read-only data: 10240k
[2022-09-19 19:50:56] Freeing unused kernel image (text/rodata gap) memory:
2044K
[2022-09-19 19:50:56] Freeing unused kernel image (rodata/data gap) memory:
1620K
[2022-09-19 19:50:56] Run /init as init process
[2022-09-19 19:50:56] + mount -t devtmpfs none /dev
[2022-09-19 19:50:56] + mount -t sysfs /sys /sys
[2022-09-19 19:50:56] + mount -t proc /proc /proc
[2022-09-19 19:50:56] + mount -t tmpfs -o 'size=3D1m,nodev,noexec' /tmp /tm=
p
[2022-09-19 19:50:56] + mount -o remount,ro /
[2022-09-19 19:50:56] + echo 1
[2022-09-19 19:50:56] + printf '%d\n' 1073741824
[2022-09-19 19:50:56] + /bin/xenstore-read target
[2022-09-19 19:50:56] + domid=3D62
[2022-09-19 19:50:56] + xenstore-read /local/domain/62/vm
[2022-09-19 19:50:56] + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3
[2022-09-19 19:50:56] + sort
[2022-09-19 19:50:56] + xenstore-list -p
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv
[2022-09-19 19:50:56] + xenstore-read
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/002
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/003
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/004
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/007
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/008
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/012
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/013
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/016
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/017
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/018
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/021
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/022
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/026
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/027
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/030
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/031
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/032
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033
[2022-09-19 19:50:56] + dm_args=3D'-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + usb_args=3D
[2022-09-19 19:50:56] + test -e /bin/qrexec-agent
[2022-09-19 19:50:56] + usb_args=3D'-device
[2022-09-19 19:50:56] nec-usb-xhci,id=3Dxhci'
[2022-09-19 19:50:56] + mkdir -p /var/run/qubes
[2022-09-19 19:50:56] + touch /dev/mdev.log
[2022-09-19 19:50:56] + mdev -d
[2022-09-19 19:50:56] + USER=3Droot qrexec-agent
[2022-09-19 19:50:56] + sed -n '/^-soundhw/ {n;p}'
[2022-09-19 19:50:56] + echo '-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + audio_model=3D
[2022-09-19 19:50:56] + '[' -n  ]
[2022-09-19 19:50:56] + sed -n /^-qubes-net:/p
[2022-09-19 19:50:56] + echo '-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + net_args=3D
[2022-09-19 19:50:56] + sed /^-qubes-net:/d
[2022-09-19 19:50:56] + echo '-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + dm_args=3D'-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + test -e /sys/class/net/eth0
[2022-09-19 19:50:56] + echo 'No network interface named eth0.'
[2022-09-19 19:50:56] No network interface named eth0.
[2022-09-19 19:50:56] + ls -l /sys/class/net/
[2022-09-19 19:50:56] total 0
[2022-09-19 19:50:56] lrwxrwxrwx    1 root     0                0 Sep 19
17:50 .[1;36mlo.[m -> .[1;34m../../devices/virtual/net/lo.[m
[2022-09-19 19:50:56] + xenstore-read target
[2022-09-19 19:50:56] + target=3D62
[2022-09-19 19:50:56] + device_model=3Ddevice-model/62
[2022-09-19 19:50:56] + mkdir /tmp/qmp
[2022-09-19 19:50:56] + kernel=3D
[2022-09-19 19:50:56] + grep -q ^-append
[2022-09-19 19:50:56] + echo '-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + mkfifo /tmp/qmp/qemu.in /tmp/qmp/qemu.out
[2022-09-19 19:50:56] + set +x
[2022-09-19 19:50:56] Clearing kmsg buffer...
[2022-09-19 19:50:56] + set +x
[2022-09-19 19:50:56] + set +x
[2022-09-19 19:50:56] + sed 's/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/'
[2022-09-19 19:50:56] + echo '-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + dm_args=3D'-xen-domid
[2022-09-19 19:50:56] 62
[2022-09-19 19:50:56] -no-shutdown
[2022-09-19 19:50:56] -nodefaults
[2022-09-19 19:50:56] -no-user-config
[2022-09-19 19:50:56] -name
[2022-09-19 19:50:56] openbsd-71
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] VGA,vgamem_mb=3D16
[2022-09-19 19:50:56] -boot
[2022-09-19 19:50:56] order=3Ddc
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-ehci,id=3Dehci
[2022-09-19 19:50:56] -device
[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0
[2022-09-19 19:50:56] -smp
[2022-09-19 19:50:56] 2,maxcpus=3D2
[2022-09-19 19:50:56] -net
[2022-09-19 19:50:56] none
[2022-09-19 19:50:56] -display
[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 19:50:56] -machine
[2022-09-19 19:50:56] xenfv
[2022-09-19 19:50:56] -m
[2022-09-19 19:50:56] 496
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 19:50:56] -drive
[2022-09-19 19:50:56]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 19:50:56] + xenstore-read device/console/2
[2022-09-19 19:50:56] + xenstore-read device/console/1
[2022-09-19 19:50:57] + IFS=3D'
[2022-09-19 19:50:57] '
[2022-09-19 19:50:57] + set -f
[2022-09-19 19:50:57] + set +f
[2022-09-19 19:50:57] + unset IFS
[2022-09-19 19:50:57] + qemu_pid=3D171
[2022-09-19 19:50:57] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-19 19:50:57] + sleep 0.1
[2022-09-19 19:50:57] + qemu -sandbox
'on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny'
-chardev 'pipe,path=3D/tmp/qmp/qemu,id=3Dm' -mon 'chardev=3Dm,mode=3Dcontro=
l'
-chardev 'socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2' -mon
'chardev=3Dm2,mode=3Dcontrol' -xen-domid 62 -no-shutdown -nodefaults
-no-user-config -name openbsd-71 -display none -device 'VGA,vgamem_mb=3D16'
-boot 'order=3Ddc' -device 'usb-ehci,id=3Dehci' -device 'usb-tablet,bus=3De=
hci.0'
-smp '2,maxcpus=3D2' -net none -display 'qubes-gui,domid=3D0,log-level=3D0'
-machine xenfv -m 496 -drive
'file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-device 'nec-usb-xhci,id=3Dxhci'
[2022-09-19 19:50:57] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'server' deprecated
[2022-09-19 19:50:57] Please use server=3Don instead
[2022-09-19 19:50:57] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'nowait' deprecated
[2022-09-19 19:50:57] Please use wait=3Doff instead
[2022-09-19 19:50:57] random: qemu: uninitialized urandom read (16 bytes
read)
[2022-09-19 19:50:57] + tee /proc/self/fd/2
[2022-09-19 19:50:57] + echo '{"execute": "qmp_capabilities"}'
[2022-09-19 19:50:57] {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1,
"major": 6}, "package": ""}, "capabilities": ["oob"]}}

[2022-09-19 19:50:57] {"execute": "qmp_capabilities"}
[2022-09-19 19:50:57] qubes_gui/init: 573
[2022-09-19 19:50:57] qubes_gui/init: 582
[2022-09-19 19:50:57] qubes_gui/init: 584
[2022-09-19 19:50:57] qubes_gui/init[611]: version sent, waiting for xorg
conf
[2022-09-19 19:50:57] {"return": {}}

[2022-09-19 19:50:57] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-19 19:50:57] + '[' -e /proc/self/fd/4 ]
[2022-09-19 19:50:57] + '[' -e /proc/self/fd/3 ]
[2022-09-19 19:50:57] + true
[2022-09-19 19:50:57] + printf '=3D=3D=3D=3D Press enter for shell =3D=3D=
=3D=3D\n'
[2022-09-19 19:50:57] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D
[2022-09-19 19:50:57] + read
[2022-09-19 19:50:57] + vchan-socket-proxy 0 device-model/62/qmp-vchan
/tmp/qemu.qmp
[2022-09-19 19:50:57] written 110 bytes to vchan
[2022-09-19 19:50:57] written 34 bytes to vchan
[2022-09-19 19:50:57] written 34 bytes to vchan
[2022-09-19 19:50:57] qubes_gui/init[622]: got xorg conf, creating window
[2022-09-19 19:50:57] qubes_gui/init: 632
[2022-09-19 19:50:57] random: crng init done
[2022-09-19 19:50:57] configure msg, x/y 600 365 (was 0 0), w/h 720 400
[2022-09-19 20:03:09] {"timestamp": {"seconds": 1663610590, "microseconds":
147671}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-19 20:03:09] {"timestamp": {"seconds": 1663610590, "microseconds":
148655}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-19 20:25:36] Logfile Opened
[2022-09-19 20:25:36] Linux version 5.10.105-xen-stubdom
(mockbuild@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422
(Red Hat 10.3.1-1), GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST
2022
[2022-09-19 20:25:36] Command line:
[2022-09-19 20:25:36] x86/fpu: Supporting XSAVE feature 0x001: 'x87
floating point registers'
[2022-09-19 20:25:36] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
registers'
[2022-09-19 20:25:36] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
registers'
[2022-09-19 20:25:36] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  25=
6
[2022-09-19 20:25:36] x86/fpu: Enabled xstate features 0x7, context size is
832 bytes, using 'standard' format.
[2022-09-19 20:25:36] Released 0 page(s)
[2022-09-19 20:25:36] BIOS-provided physical RAM map:
[2022-09-19 20:25:36] Xen: [mem 0x0000000000000000-0x000000000009ffff]
usable
[2022-09-19 20:25:36] Xen: [mem 0x00000000000a0000-0x00000000000fffff]
reserved
[2022-09-19 20:25:36] Xen: [mem 0x0000000000100000-0x0000000008ffffff]
usable
[2022-09-19 20:25:36] NX (Execute Disable) protection: active
[2022-09-19 20:25:36] Hypervisor detected: Xen PV
[2022-09-19 20:25:36] tsc: Fast TSC calibration failed
[2022-09-19 20:25:36] tsc: Detected 2591.998 MHz processor
[2022-09-19 20:25:36] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000
[2022-09-19 20:25:36] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP
 UC  UC
[2022-09-19 20:25:36] RAMDISK: [mem 0x02000000-0x03f7afff]
[2022-09-19 20:25:36] Zone ranges:
[2022-09-19 20:25:36]   DMA32    [mem 0x0000000000001000-0x0000000008ffffff=
]
[2022-09-19 20:25:36]   Normal   empty
[2022-09-19 20:25:36] Movable zone start for each node
[2022-09-19 20:25:36] Early memory node ranges
[2022-09-19 20:25:36]   node   0: [mem
0x0000000000001000-0x000000000009ffff]
[2022-09-19 20:25:36]   node   0: [mem
0x0000000000100000-0x0000000008ffffff]
[2022-09-19 20:25:36] Initmem setup node 0 [mem
0x0000000000001000-0x0000000008ffffff]
[2022-09-19 20:25:36] On node 0, zone DMA32: 1 pages in unavailable ranges
[2022-09-19 20:25:36] On node 0, zone DMA32: 96 pages in unavailable ranges
[2022-09-19 20:25:36] On node 0, zone DMA32: 28672 pages in unavailable
ranges
[2022-09-19 20:25:36] p2m virtual area at (____ptrval____), size is 200000
[2022-09-19 20:25:36] Remapped 0 page(s)
[2022-09-19 20:25:36] [mem 0x09000000-0xffffffff] available for PCI devices
[2022-09-19 20:25:36] Booting paravirtualized kernel on Xen
[2022-09-19 20:25:36] Xen version: 4.14.5 (preserve-AD)
[2022-09-19 20:25:36] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[2022-09-19 20:25:36] Built 1 zonelists, mobility grouping on.  Total
pages: 36170
[2022-09-19 20:25:36] Kernel command line: clocksource=3Dtsc
[2022-09-19 20:25:36] Dentry cache hash table entries: 32768 (order: 6,
262144 bytes, linear)
[2022-09-19 20:25:36] Inode-cache hash table entries: 16384 (order: 5,
131072 bytes, linear)
[2022-09-19 20:25:36] mem auto-init: stack:byref_all(zero), heap alloc:off,
heap free:off
[2022-09-19 20:25:36] Memory: 96968K/147068K available (6145K kernel code,
842K rwdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K
cma-reserved)
[2022-09-19 20:25:36] random: get_random_u64 called from 0xffffffff810a0f18
with crng_init=3D0
[2022-09-19 20:25:36] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1,
Nodes=3D1
[2022-09-19 20:25:36] Using NULL legacy PIC
[2022-09-19 20:25:36] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0
[2022-09-19 20:25:36] xen:events: Using FIFO-based ABI
[2022-09-19 20:25:36] printk: console [hvc0] enabled
[2022-09-19 20:25:36] clocksource: xen: mask: 0xffffffffffffffff
max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[2022-09-19 20:25:36] installing Xen timer for CPU 0
[2022-09-19 20:25:36] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-19 20:25:36] Calibrating delay loop (skipped), value calculated
using timer frequency.. 5183.99 BogoMIPS (lpj=3D10367992)
[2022-09-19 20:25:36] pid_max: default: 4096 minimum: 301
[2022-09-19 20:25:36] Mount-cache hash table entries: 512 (order: 0, 4096
bytes, linear)
[2022-09-19 20:25:36] Mountpoint-cache hash table entries: 512 (order: 0,
4096 bytes, linear)
[2022-09-19 20:25:36] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[2022-09-19 20:25:36] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[2022-09-19 20:25:36] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
(family: 0x6, model: 0x9e, stepping: 0xa)
[2022-09-19 20:25:36] Spectre V1 : Mitigation: usercopy/swapgs barriers and
__user pointer sanitization
[2022-09-19 20:25:36] Spectre V2 : Mitigation: Retpolines
[2022-09-19 20:25:36] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
Filling RSB on context switch
[2022-09-19 20:25:36] Spectre V2 : Enabling Restricted Speculation for
firmware calls
[2022-09-19 20:25:36] Spectre V2 : mitigation: Enabling conditional
Indirect Branch Prediction Barrier
[2022-09-19 20:25:36] Speculative Store Bypass: Mitigation: Speculative
Store Bypass disabled via prctl and seccomp
[2022-09-19 20:25:36] SRBDS: Unknown: Dependent on hypervisor status
[2022-09-19 20:25:36] MDS: Mitigation: Clear CPU buffers
[2022-09-19 20:25:36] Performance Events: unsupported p6 CPU model 158 no
PMU driver, software events only.
[2022-09-19 20:25:36] devtmpfs: initialized
[2022-09-19 20:25:36] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[2022-09-19 20:25:36] futex hash table entries: 16 (order: -4, 384 bytes,
linear)
[2022-09-19 20:25:36] NET: Registered protocol family 16
[2022-09-19 20:25:36] xen:grant_table: Grant tables using version 1 layout
[2022-09-19 20:25:36] Grant table initialized
[2022-09-19 20:25:36] PCI: setting up Xen PCI frontend stub
[2022-09-19 20:25:36] xen:balloon: Initialising balloon driver
[2022-09-19 20:25:36] usbcore: registered new interface driver usbfs
[2022-09-19 20:25:36] usbcore: registered new interface driver hub
[2022-09-19 20:25:36] usbcore: registered new device driver usb
[2022-09-19 20:25:36] PCI: System does not support PCI
[2022-09-19 20:25:36] clocksource: Switched to clocksource xen
[2022-09-19 20:25:36] NET: Registered protocol family 2
[2022-09-19 20:25:36] IP idents hash table entries: 4096 (order: 3, 32768
bytes, linear)
[2022-09-19 20:25:36] tcp_listen_portaddr_hash hash table entries: 256
(order: 0, 4096 bytes, linear)
[2022-09-19 20:25:36] TCP established hash table entries: 2048 (order: 2,
16384 bytes, linear)
[2022-09-19 20:25:36] TCP bind hash table entries: 2048 (order: 2, 16384
bytes, linear)
[2022-09-19 20:25:36] TCP: Hash tables configured (established 2048 bind
2048)
[2022-09-19 20:25:36] UDP hash table entries: 128 (order: 0, 4096 bytes,
linear)
[2022-09-19 20:25:36] UDP-Lite hash table entries: 128 (order: 0, 4096
bytes, linear)
[2022-09-19 20:25:36] NET: Registered protocol family 1
[2022-09-19 20:25:36] Unpacking initramfs...
[2022-09-19 20:25:36] Freeing initrd memory: 32236K
[2022-09-19 20:25:36] clocksource: tsc: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-19 20:25:36] clocksource: Switched to clocksource tsc
[2022-09-19 20:25:36] workingset: timestamp_bits=3D62 max_order=3D15
bucket_order=3D0
[2022-09-19 20:25:36] xen:xen_evtchn: Event-channel device installed
[2022-09-19 20:25:36] Invalid max_queues (4), will use default max: 1.
[2022-09-19 20:25:36] tun: Universal TUN/TAP device driver, 1.6
[2022-09-19 20:25:36] xen_netfront: Initialising Xen virtual ethernet drive=
r
[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 1
[2022-09-19 20:25:36] vhci_hcd: created sysfs vhci_hcd.0
[2022-09-19 20:25:36] hub 1-0:1.0: USB hub found
[2022-09-19 20:25:36] hub 1-0:1.0: 8 ports detected
[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 2
[2022-09-19 20:25:36] usb usb2: We don't know the algorithms for LPM for
this host, disabling LPM.
[2022-09-19 20:25:36] hub 2-0:1.0: USB hub found
[2022-09-19 20:25:36] hub 2-0:1.0: 8 ports detected
[2022-09-19 20:25:36] NET: Registered protocol family 17
[2022-09-19 20:25:36] sched_clock: Marking stable (269302379,
234771)->(271578343, -2041193)
[2022-09-19 20:25:36] random: fast init done
[2022-09-19 20:25:36] pcifront pci-0: Installing PCI frontend
[2022-09-19 20:25:36] xen:swiotlb_xen: Warning: only able to allocate 4 MB
for software IO TLB
[2022-09-19 20:25:36] software IO TLB: mapped [mem
0x0000000003800000-0x0000000003c00000] (4MB)
[2022-09-19 20:25:36] pcifront pci-0: Creating PCI Frontend Bus 0000:00
[2022-09-19 20:25:36] pcifront pci-0: PCI host bridge to bus 0000:00
[2022-09-19 20:25:36] pci_bus 0000:00: root bus resource [io  0x0000-0xffff=
]
[2022-09-19 20:25:36] pci_bus 0000:00: root bus resource [mem
0x00000000-0x7fffffffff]
[2022-09-19 20:25:36] pci_bus 0000:00: root bus resource [bus 00-ff]
[2022-09-19 20:25:36] pci 0000:00:00.0: [10ec:8168] type 00 class 0x020000
[2022-09-19 20:25:36] pci 0000:00:00.0: reg 0x10: [io  0x3000-0x30ff]
[2022-09-19 20:25:36] pci 0000:00:00.0: reg 0x18: [mem
0xb4304000-0xb4304fff 64bit]
[2022-09-19 20:25:36] pci 0000:00:00.0: reg 0x20: [mem
0xb4300000-0xb4303fff 64bit]
[2022-09-19 20:25:36] pci 0000:00:00.0: supports D1 D2
[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/0
[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/2
[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/4
[2022-09-19 20:25:36] blkfront: xvda: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 20:25:36]  xvda: xvda4
[2022-09-19 20:25:36] blkfront: xvdb: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 20:25:36] blkfront: xvdc: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-19 20:25:36] Freeing unused kernel image (initmem) memory: 696K
[2022-09-19 20:25:36] Write protecting the kernel read-only data: 10240k
[2022-09-19 20:25:36] Freeing unused kernel image (text/rodata gap) memory:
2044K
[2022-09-19 20:25:36] Freeing unused kernel image (rodata/data gap) memory:
1620K
[2022-09-19 20:25:36] Run /init as init process
[2022-09-19 20:25:36] + mount -t devtmpfs none /dev
[2022-09-19 20:25:36] + mount -t sysfs /sys /sys
[2022-09-19 20:25:36] + mount -t proc /proc /proc
[2022-09-19 20:25:36] + mount -t tmpfs -o 'size=3D1m,nodev,noexec' /tmp /tm=
p
[2022-09-19 20:25:36] + mount -o remount,ro /
[2022-09-19 20:25:36] + echo 1
[2022-09-19 20:25:36] + printf '%d\n' 1073741824
[2022-09-19 20:25:36] + /bin/xenstore-read target
[2022-09-19 20:25:36] + domid=3D12
[2022-09-19 20:25:36] + xenstore-read /local/domain/12/vm
[2022-09-19 20:25:36] + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3
[2022-09-19 20:25:36] + sort
[2022-09-19 20:25:36] + xenstore-list -p
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv
[2022-09-19 20:25:36] + xenstore-read
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/002
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/003
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/004
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/007
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/008
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/012
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/013
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/016
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/017
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/018
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/021
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/022
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/026
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/027
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/030
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/031
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/032
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033
[2022-09-19 20:25:36] + dm_args=3D'-xen-domid
[2022-09-19 20:25:36] 12
[2022-09-19 20:25:36] -no-shutdown
[2022-09-19 20:25:36] -nodefaults
[2022-09-19 20:25:36] -no-user-config
[2022-09-19 20:25:36] -name
[2022-09-19 20:25:36] openbsd-71
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] VGA,vgamem_mb=3D16
[2022-09-19 20:25:36] -boot
[2022-09-19 20:25:36] order=3Ddc
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-ehci,id=3Dehci
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:36] -smp
[2022-09-19 20:25:36] 2,maxcpus=3D2
[2022-09-19 20:25:36] -net
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:36] -machine
[2022-09-19 20:25:36] xenfv
[2022-09-19 20:25:36] -m
[2022-09-19 20:25:36] 496
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:36] + usb_args=3D
[2022-09-19 20:25:36] + test -e /bin/qrexec-agent
[2022-09-19 20:25:36] + usb_args=3D'-device
[2022-09-19 20:25:36] nec-usb-xhci,id=3Dxhci'
[2022-09-19 20:25:36] + mkdir -p /var/run/qubes
[2022-09-19 20:25:36] + touch /dev/mdev.log
[2022-09-19 20:25:36] + USER=3Droot qrexec-agent
[2022-09-19 20:25:36] + mdev -d
[2022-09-19 20:25:36] + sed -n '/^-soundhw/ {n;p}'
[2022-09-19 20:25:36] + echo '-xen-domid
[2022-09-19 20:25:36] 12
[2022-09-19 20:25:36] -no-shutdown
[2022-09-19 20:25:36] -nodefaults
[2022-09-19 20:25:36] -no-user-config
[2022-09-19 20:25:36] -name
[2022-09-19 20:25:36] openbsd-71
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] VGA,vgamem_mb=3D16
[2022-09-19 20:25:36] -boot
[2022-09-19 20:25:36] order=3Ddc
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-ehci,id=3Dehci
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:36] -smp
[2022-09-19 20:25:36] 2,maxcpus=3D2
[2022-09-19 20:25:36] -net
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:36] -machine
[2022-09-19 20:25:36] xenfv
[2022-09-19 20:25:36] -m
[2022-09-19 20:25:36] 496
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:36] + audio_model=3D
[2022-09-19 20:25:36] + '[' -n  ]
[2022-09-19 20:25:36] + sed -n /^-qubes-net:/p
[2022-09-19 20:25:36] + echo '-xen-domid
[2022-09-19 20:25:36] 12
[2022-09-19 20:25:36] -no-shutdown
[2022-09-19 20:25:36] -nodefaults
[2022-09-19 20:25:36] -no-user-config
[2022-09-19 20:25:36] -name
[2022-09-19 20:25:36] openbsd-71
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] VGA,vgamem_mb=3D16
[2022-09-19 20:25:36] -boot
[2022-09-19 20:25:36] order=3Ddc
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-ehci,id=3Dehci
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:36] -smp
[2022-09-19 20:25:36] 2,maxcpus=3D2
[2022-09-19 20:25:36] -net
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:36] -machine
[2022-09-19 20:25:36] xenfv
[2022-09-19 20:25:36] -m
[2022-09-19 20:25:36] 496
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:36] -drive
[2022-09-19 20:25:36]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:36] + net_args=3D
[2022-09-19 20:25:36] + sed /^-qubes-net:/d
[2022-09-19 20:25:36] + echo '-xen-domid
[2022-09-19 20:25:36] 12
[2022-09-19 20:25:36] -no-shutdown
[2022-09-19 20:25:36] -nodefaults
[2022-09-19 20:25:36] -no-user-config
[2022-09-19 20:25:36] -name
[2022-09-19 20:25:36] openbsd-71
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] VGA,vgamem_mb=3D16
[2022-09-19 20:25:36] -boot
[2022-09-19 20:25:36] order=3Ddc
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-ehci,id=3Dehci
[2022-09-19 20:25:36] -device
[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:36] -smp
[2022-09-19 20:25:36] 2,maxcpus=3D2
[2022-09-19 20:25:36] -net
[2022-09-19 20:25:36] none
[2022-09-19 20:25:36] -display
[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:37] -machine
[2022-09-19 20:25:37] xenfv
[2022-09-19 20:25:37] -m
[2022-09-19 20:25:37] 496
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:37] + dm_args=3D'-xen-domid
[2022-09-19 20:25:37] 12
[2022-09-19 20:25:37] -no-shutdown
[2022-09-19 20:25:37] -nodefaults
[2022-09-19 20:25:37] -no-user-config
[2022-09-19 20:25:37] -name
[2022-09-19 20:25:37] openbsd-71
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] VGA,vgamem_mb=3D16
[2022-09-19 20:25:37] -boot
[2022-09-19 20:25:37] order=3Ddc
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-ehci,id=3Dehci
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:37] -smp
[2022-09-19 20:25:37] 2,maxcpus=3D2
[2022-09-19 20:25:37] -net
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:37] -machine
[2022-09-19 20:25:37] xenfv
[2022-09-19 20:25:37] -m
[2022-09-19 20:25:37] 496
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:37] + test -e /sys/class/net/eth0
[2022-09-19 20:25:37] + echo 'No network interface named eth0.'
[2022-09-19 20:25:37] No network interface named eth0.
[2022-09-19 20:25:37] + ls -l /sys/class/net/
[2022-09-19 20:25:37] total 0
[2022-09-19 20:25:37] lrwxrwxrwx    1 root     0                0 Sep 19
18:25 .[1;36mlo.[m -> .[1;34m../../devices/virtual/net/lo.[m
[2022-09-19 20:25:37] + xenstore-read target
[2022-09-19 20:25:37] + target=3D12
[2022-09-19 20:25:37] + device_model=3Ddevice-model/12
[2022-09-19 20:25:37] + mkdir /tmp/qmp
[2022-09-19 20:25:37] + kernel=3D
[2022-09-19 20:25:37] + grep -q ^-append
[2022-09-19 20:25:37] + echo '-xen-domid
[2022-09-19 20:25:37] 12
[2022-09-19 20:25:37] -no-shutdown
[2022-09-19 20:25:37] -nodefaults
[2022-09-19 20:25:37] -no-user-config
[2022-09-19 20:25:37] -name
[2022-09-19 20:25:37] openbsd-71
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] VGA,vgamem_mb=3D16
[2022-09-19 20:25:37] -boot
[2022-09-19 20:25:37] order=3Ddc
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-ehci,id=3Dehci
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:37] -smp
[2022-09-19 20:25:37] 2,maxcpus=3D2
[2022-09-19 20:25:37] -net
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:37] -machine
[2022-09-19 20:25:37] xenfv
[2022-09-19 20:25:37] -m
[2022-09-19 20:25:37] 496
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:37] + mkfifo /tmp/qmp/qemu.in /tmp/qmp/qemu.out
[2022-09-19 20:25:37] + set +x
[2022-09-19 20:25:37] Clearing kmsg buffer...
[2022-09-19 20:25:37] + set +x
[2022-09-19 20:25:37] + set +x
[2022-09-19 20:25:37] + sed 's/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/'
[2022-09-19 20:25:37] + echo '-xen-domid
[2022-09-19 20:25:37] 12
[2022-09-19 20:25:37] -no-shutdown
[2022-09-19 20:25:37] -nodefaults
[2022-09-19 20:25:37] -no-user-config
[2022-09-19 20:25:37] -name
[2022-09-19 20:25:37] openbsd-71
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] VGA,vgamem_mb=3D16
[2022-09-19 20:25:37] -boot
[2022-09-19 20:25:37] order=3Ddc
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-ehci,id=3Dehci
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:37] -smp
[2022-09-19 20:25:37] 2,maxcpus=3D2
[2022-09-19 20:25:37] -net
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:37] -machine
[2022-09-19 20:25:37] xenfv
[2022-09-19 20:25:37] -m
[2022-09-19 20:25:37] 496
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:37] + dm_args=3D'-xen-domid
[2022-09-19 20:25:37] 12
[2022-09-19 20:25:37] -no-shutdown
[2022-09-19 20:25:37] -nodefaults
[2022-09-19 20:25:37] -no-user-config
[2022-09-19 20:25:37] -name
[2022-09-19 20:25:37] openbsd-71
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] VGA,vgamem_mb=3D16
[2022-09-19 20:25:37] -boot
[2022-09-19 20:25:37] order=3Ddc
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-ehci,id=3Dehci
[2022-09-19 20:25:37] -device
[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0
[2022-09-19 20:25:37] -smp
[2022-09-19 20:25:37] 2,maxcpus=3D2
[2022-09-19 20:25:37] -net
[2022-09-19 20:25:37] none
[2022-09-19 20:25:37] -display
[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0
[2022-09-19 20:25:37] -machine
[2022-09-19 20:25:37] xenfv
[2022-09-19 20:25:37] -m
[2022-09-19 20:25:37] 496
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-19 20:25:37] -drive
[2022-09-19 20:25:37]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-19 20:25:37] + xenstore-read device/console/2
[2022-09-19 20:25:37] + xenstore-read device/console/1
[2022-09-19 20:25:37] + IFS=3D'
[2022-09-19 20:25:37] '
[2022-09-19 20:25:37] + set -f
[2022-09-19 20:25:37] + set +f
[2022-09-19 20:25:37] + unset IFS
[2022-09-19 20:25:37] + qemu_pid=3D130
[2022-09-19 20:25:37] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-19 20:25:37] + sleep 0.1
[2022-09-19 20:25:37] + qemu -sandbox
'on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny'
-chardev 'pipe,path=3D/tmp/qmp/qemu,id=3Dm' -mon 'chardev=3Dm,mode=3Dcontro=
l'
-chardev 'socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2' -mon
'chardev=3Dm2,mode=3Dcontrol' -xen-domid 12 -no-shutdown -nodefaults
-no-user-config -name openbsd-71 -display none -device 'VGA,vgamem_mb=3D16'
-boot 'order=3Ddc' -device 'usb-ehci,id=3Dehci' -device 'usb-tablet,bus=3De=
hci.0'
-smp '2,maxcpus=3D2' -net none -display 'qubes-gui,domid=3D0,log-level=3D0'
-machine xenfv -m 496 -drive
'file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-device 'nec-usb-xhci,id=3Dxhci'
[2022-09-19 20:25:37] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'server' deprecated
[2022-09-19 20:25:37] Please use server=3Don instead
[2022-09-19 20:25:37] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'nowait' deprecated
[2022-09-19 20:25:37] Please use wait=3Doff instead
[2022-09-19 20:25:37] + tee /proc/self/fd/2
[2022-09-19 20:25:37] + echo '{"execute": "qmp_capabilities"}'
[2022-09-19 20:25:37] random: qemu: uninitialized urandom read (16 bytes
read)
[2022-09-19 20:25:37] {"execute": "qmp_capabilities"}
[2022-09-19 20:25:37] {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1,
"major": 6}, "package": ""}, "capabilities": ["oob"]}}

[2022-09-19 20:25:37] qubes_gui/init: 573
[2022-09-19 20:25:37] qubes_gui/init: 582
[2022-09-19 20:25:37] qubes_gui/init: 584
[2022-09-19 20:25:37] qubes_gui/init[611]: version sent, waiting for xorg
conf
[2022-09-19 20:25:37] {"return": {}}

[2022-09-19 20:25:37] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-19 20:25:37] + '[' -e /proc/self/fd/4 ]
[2022-09-19 20:25:37] + '[' -e /proc/self/fd/3 ]
[2022-09-19 20:25:37] + true
[2022-09-19 20:25:37] + printf '=3D=3D=3D=3D Press enter for shell =3D=3D=
=3D=3D\n'
[2022-09-19 20:25:37] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D
[2022-09-19 20:25:37] + read
[2022-09-19 20:25:37] + vchan-socket-proxy 0 device-model/12/qmp-vchan
/tmp/qemu.qmp
[2022-09-19 20:25:37] written 110 bytes to vchan
[2022-09-19 20:25:37] written 34 bytes to vchan
[2022-09-19 20:25:37] [00:06.0] xen_pt_realize: Assigning real physical
device 07:00.0 to devfn 0x30
[2022-09-19 20:25:37] [00:06.0] xen_pt_register_regions: IO region 0
registered (size=3D0x00000100 base_addr=3D0x00003000 type: 0x1)
[2022-09-19 20:25:37] [00:06.0] xen_pt_register_regions: IO region 2
registered (size=3D0x00001000 base_addr=3D0xb4304000 type: 0x4)
[2022-09-19 20:25:37] [00:06.0] xen_pt_register_regions: IO region 4
registered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x000e
mismatch! Emulated=3D0x0080, host=3D0x0000, syncing to 0x0000.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0010
mismatch! Emulated=3D0x0000, host=3D0x3001, syncing to 0x3001.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0018
mismatch! Emulated=3D0x0000, host=3D0xb4304004, syncing to 0xb4304004.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0020
mismatch! Emulated=3D0x0000, host=3D0xb4300004, syncing to 0xb4300004.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0042
mismatch! Emulated=3D0x0000, host=3D0x07c3, syncing to 0x0603.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0052
mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0074
mismatch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x007a
mismatch! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.
[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0082
mismatch! Emulated=3D0x0000, host=3D0x1011, syncing to 0x1011.
[2022-09-19 20:25:37] [00:06.0] xen_pt_pci_intx: intx=3D1
[2022-09-19 20:25:37] [00:06.0] xen_pt_realize: Real physical device
07:00.0 registered successfully
[2022-09-19 20:25:37] written 34 bytes to vchan
[2022-09-19 20:25:37] written 2048 bytes to vchan
[2022-09-19 20:25:37] written 979 bytes to vchan
[2022-09-19 20:25:37] written 110 bytes to vchan
[2022-09-19 20:25:37] written 34 bytes to vchan
[2022-09-19 20:25:37] written 34 bytes to vchan
[2022-09-19 20:25:37] qubes_gui/init[622]: got xorg conf, creating window
[2022-09-19 20:25:37] qubes_gui/init: 632
[2022-09-19 20:25:37] configure msg, x/y 640 325 (was 0 0), w/h 640 480
[2022-09-19 20:25:37] configure msg, x/y 640 325 (was 640 325), w/h 640 480
[2022-09-19 20:25:37] random: crng init done
[2022-09-19 20:25:39] qubes_gui: got unknown msg type 145, ignoring
[2022-09-19 20:25:57] [00:06.0] Write-back to unknown field 0x44
(partially) inhibited (0x0000ffff)
[2022-09-19 20:25:57] [00:06.0] If the device doesn't work, try enabling
permissive mode
[2022-09-19 20:25:57] [00:06.0] (unsafe) and if it helps report the problem
to xen-devel
[2022-09-19 20:25:57] [00:06.0] xen_pt_msgctrl_reg_write: setup MSI
(register: 81).
[2022-09-19 20:25:57] [00:06.0] xen_pt_msi_setup: MSI mapped with pirq 151.
[2022-09-19 20:25:57] [00:06.0] msi_msix_update: Updating MSI with pirq 151
gvec 0x72 gflags 0x0 (entry: 0x0)
[2022-09-19 20:27:19] qubes_gui: got unknown msg type 145, ignoring
[2022-09-19 21:48:58] {"timestamp": {"seconds": 1663616939, "microseconds":
194886}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-19 21:48:58] {"timestamp": {"seconds": 1663616939, "microseconds":
196105}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-19 21:49:00] pcifront pci-0: Rescanning PCI Frontend Bus 0000:00
[2022-09-20 09:21:32] Logfile Opened
[2022-09-20 09:21:33] Linux version 5.10.105-xen-stubdom
(mockbuild@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422
(Red Hat 10.3.1-1), GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST
2022
[2022-09-20 09:21:33] Command line:
[2022-09-20 09:21:33] x86/fpu: Supporting XSAVE feature 0x001: 'x87
floating point registers'
[2022-09-20 09:21:33] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
registers'
[2022-09-20 09:21:33] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
registers'
[2022-09-20 09:21:33] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  25=
6
[2022-09-20 09:21:33] x86/fpu: Enabled xstate features 0x7, context size is
832 bytes, using 'standard' format.
[2022-09-20 09:21:33] Released 0 page(s)
[2022-09-20 09:21:33] BIOS-provided physical RAM map:
[2022-09-20 09:21:33] Xen: [mem 0x0000000000000000-0x000000000009ffff]
usable
[2022-09-20 09:21:33] Xen: [mem 0x00000000000a0000-0x00000000000fffff]
reserved
[2022-09-20 09:21:33] Xen: [mem 0x0000000000100000-0x0000000008ffffff]
usable
[2022-09-20 09:21:33] NX (Execute Disable) protection: active
[2022-09-20 09:21:33] Hypervisor detected: Xen PV
[2022-09-20 09:21:33] tsc: Fast TSC calibration failed
[2022-09-20 09:21:33] tsc: Detected 2591.998 MHz processor
[2022-09-20 09:21:33] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000
[2022-09-20 09:21:33] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP
 UC  UC
[2022-09-20 09:21:33] RAMDISK: [mem 0x02000000-0x03f7afff]
[2022-09-20 09:21:33] Zone ranges:
[2022-09-20 09:21:33]   DMA32    [mem 0x0000000000001000-0x0000000008ffffff=
]
[2022-09-20 09:21:33]   Normal   empty
[2022-09-20 09:21:33] Movable zone start for each node
[2022-09-20 09:21:33] Early memory node ranges
[2022-09-20 09:21:33]   node   0: [mem
0x0000000000001000-0x000000000009ffff]
[2022-09-20 09:21:33]   node   0: [mem
0x0000000000100000-0x0000000008ffffff]
[2022-09-20 09:21:33] Initmem setup node 0 [mem
0x0000000000001000-0x0000000008ffffff]
[2022-09-20 09:21:33] On node 0, zone DMA32: 1 pages in unavailable ranges
[2022-09-20 09:21:33] On node 0, zone DMA32: 96 pages in unavailable ranges
[2022-09-20 09:21:33] On node 0, zone DMA32: 28672 pages in unavailable
ranges
[2022-09-20 09:21:33] p2m virtual area at (____ptrval____), size is 200000
[2022-09-20 09:21:33] Remapped 0 page(s)
[2022-09-20 09:21:33] [mem 0x09000000-0xffffffff] available for PCI devices
[2022-09-20 09:21:33] Booting paravirtualized kernel on Xen
[2022-09-20 09:21:33] Xen version: 4.14.5 (preserve-AD)
[2022-09-20 09:21:33] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[2022-09-20 09:21:33] Built 1 zonelists, mobility grouping on.  Total
pages: 36170
[2022-09-20 09:21:33] Kernel command line: clocksource=3Dtsc
[2022-09-20 09:21:33] Dentry cache hash table entries: 32768 (order: 6,
262144 bytes, linear)
[2022-09-20 09:21:33] Inode-cache hash table entries: 16384 (order: 5,
131072 bytes, linear)
[2022-09-20 09:21:33] mem auto-init: stack:byref_all(zero), heap alloc:off,
heap free:off
[2022-09-20 09:21:33] Memory: 96968K/147068K available (6145K kernel code,
842K rwdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K
cma-reserved)
[2022-09-20 09:21:33] random: get_random_u64 called from 0xffffffff810a0f18
with crng_init=3D0
[2022-09-20 09:21:33] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1,
Nodes=3D1
[2022-09-20 09:21:33] Using NULL legacy PIC
[2022-09-20 09:21:33] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0
[2022-09-20 09:21:33] xen:events: Using FIFO-based ABI
[2022-09-20 09:21:33] printk: console [hvc0] enabled
[2022-09-20 09:21:33] clocksource: xen: mask: 0xffffffffffffffff
max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[2022-09-20 09:21:33] installing Xen timer for CPU 0
[2022-09-20 09:21:33] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-20 09:21:33] Calibrating delay loop (skipped), value calculated
using timer frequency.. 5183.99 BogoMIPS (lpj=3D10367992)
[2022-09-20 09:21:33] pid_max: default: 4096 minimum: 301
[2022-09-20 09:21:33] Mount-cache hash table entries: 512 (order: 0, 4096
bytes, linear)
[2022-09-20 09:21:33] Mountpoint-cache hash table entries: 512 (order: 0,
4096 bytes, linear)
[2022-09-20 09:21:33] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[2022-09-20 09:21:33] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[2022-09-20 09:21:33] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
(family: 0x6, model: 0x9e, stepping: 0xa)
[2022-09-20 09:21:33] Spectre V1 : Mitigation: usercopy/swapgs barriers and
__user pointer sanitization
[2022-09-20 09:21:33] Spectre V2 : Mitigation: Retpolines
[2022-09-20 09:21:33] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
Filling RSB on context switch
[2022-09-20 09:21:33] Spectre V2 : Enabling Restricted Speculation for
firmware calls
[2022-09-20 09:21:33] Spectre V2 : mitigation: Enabling conditional
Indirect Branch Prediction Barrier
[2022-09-20 09:21:33] Speculative Store Bypass: Mitigation: Speculative
Store Bypass disabled via prctl and seccomp
[2022-09-20 09:21:33] SRBDS: Unknown: Dependent on hypervisor status
[2022-09-20 09:21:33] MDS: Mitigation: Clear CPU buffers
[2022-09-20 09:21:33] Performance Events: unsupported p6 CPU model 158 no
PMU driver, software events only.
[2022-09-20 09:21:33] devtmpfs: initialized
[2022-09-20 09:21:33] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[2022-09-20 09:21:33] futex hash table entries: 16 (order: -4, 384 bytes,
linear)
[2022-09-20 09:21:33] NET: Registered protocol family 16
[2022-09-20 09:21:33] xen:grant_table: Grant tables using version 1 layout
[2022-09-20 09:21:33] Grant table initialized
[2022-09-20 09:21:33] PCI: setting up Xen PCI frontend stub
[2022-09-20 09:21:33] xen:balloon: Initialising balloon driver
[2022-09-20 09:21:33] usbcore: registered new interface driver usbfs
[2022-09-20 09:21:33] usbcore: registered new interface driver hub
[2022-09-20 09:21:33] usbcore: registered new device driver usb
[2022-09-20 09:21:33] PCI: System does not support PCI
[2022-09-20 09:21:33] clocksource: Switched to clocksource xen
[2022-09-20 09:21:33] NET: Registered protocol family 2
[2022-09-20 09:21:33] IP idents hash table entries: 4096 (order: 3, 32768
bytes, linear)
[2022-09-20 09:21:33] tcp_listen_portaddr_hash hash table entries: 256
(order: 0, 4096 bytes, linear)
[2022-09-20 09:21:33] TCP established hash table entries: 2048 (order: 2,
16384 bytes, linear)
[2022-09-20 09:21:33] TCP bind hash table entries: 2048 (order: 2, 16384
bytes, linear)
[2022-09-20 09:21:33] TCP: Hash tables configured (established 2048 bind
2048)
[2022-09-20 09:21:33] UDP hash table entries: 128 (order: 0, 4096 bytes,
linear)
[2022-09-20 09:21:33] UDP-Lite hash table entries: 128 (order: 0, 4096
bytes, linear)
[2022-09-20 09:21:33] NET: Registered protocol family 1
[2022-09-20 09:21:33] Unpacking initramfs...
[2022-09-20 09:21:33] Freeing initrd memory: 32236K
[2022-09-20 09:21:33] clocksource: tsc: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-20 09:21:33] clocksource: Switched to clocksource tsc
[2022-09-20 09:21:33] workingset: timestamp_bits=3D62 max_order=3D15
bucket_order=3D0
[2022-09-20 09:21:33] xen:xen_evtchn: Event-channel device installed
[2022-09-20 09:21:33] Invalid max_queues (4), will use default max: 1.
[2022-09-20 09:21:33] random: fast init done
[2022-09-20 09:21:33] tun: Universal TUN/TAP device driver, 1.6
[2022-09-20 09:21:33] xen_netfront: Initialising Xen virtual ethernet drive=
r
[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 1
[2022-09-20 09:21:33] vhci_hcd: created sysfs vhci_hcd.0
[2022-09-20 09:21:33] hub 1-0:1.0: USB hub found
[2022-09-20 09:21:33] hub 1-0:1.0: 8 ports detected
[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 2
[2022-09-20 09:21:33] usb usb2: We don't know the algorithms for LPM for
this host, disabling LPM.
[2022-09-20 09:21:33] hub 2-0:1.0: USB hub found
[2022-09-20 09:21:33] hub 2-0:1.0: 8 ports detected
[2022-09-20 09:21:33] NET: Registered protocol family 17
[2022-09-20 09:21:33] sched_clock: Marking stable (439658149,
279138)->(442513139, -2575852)
[2022-09-20 09:21:33] pcifront pci-0: Installing PCI frontend
[2022-09-20 09:21:33] xen:swiotlb_xen: Warning: only able to allocate 4 MB
for software IO TLB
[2022-09-20 09:21:33] software IO TLB: mapped [mem
0x0000000003800000-0x0000000003c00000] (4MB)
[2022-09-20 09:21:33] pcifront pci-0: Creating PCI Frontend Bus 0000:00
[2022-09-20 09:21:33] pcifront pci-0: PCI host bridge to bus 0000:00
[2022-09-20 09:21:33] pci_bus 0000:00: root bus resource [io  0x0000-0xffff=
]
[2022-09-20 09:21:33] pci_bus 0000:00: root bus resource [mem
0x00000000-0x7fffffffff]
[2022-09-20 09:21:33] pci_bus 0000:00: root bus resource [bus 00-ff]
[2022-09-20 09:21:33] pci 0000:00:00.0: [10ec:8168] type 00 class 0x020000
[2022-09-20 09:21:33] pci 0000:00:00.0: reg 0x10: [io  0x3000-0x30ff]
[2022-09-20 09:21:33] pci 0000:00:00.0: reg 0x18: [mem
0xb4304000-0xb4304fff 64bit]
[2022-09-20 09:21:33] pci 0000:00:00.0: reg 0x20: [mem
0xb4300000-0xb4303fff 64bit]
[2022-09-20 09:21:33] pci 0000:00:00.0: supports D1 D2
[2022-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/0
[2022-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/2
[2022-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/4
[2022-09-20 09:21:33] blkfront: xvda: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 09:21:33]  xvda: xvda4
[2022-09-20 09:21:33] blkfront: xvdb: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 09:21:33] blkfront: xvdc: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 09:21:33] Freeing unused kernel image (initmem) memory: 696K
[2022-09-20 09:21:33] Write protecting the kernel read-only data: 10240k
[2022-09-20 09:21:33] Freeing unused kernel image (text/rodata gap) memory:
2044K
[2022-09-20 09:21:33] Freeing unused kernel image (rodata/data gap) memory:
1620K
[2022-09-20 09:21:33] Run /init as init process
[2022-09-20 09:21:33] + mount -t devtmpfs none /dev
[2022-09-20 09:21:33] + mount -t sysfs /sys /sys
[2022-09-20 09:21:33] + mount -t proc /proc /proc
[2022-09-20 09:21:33] + mount -t tmpfs -o 'size=3D1m,nodev,noexec' /tmp /tm=
p
[2022-09-20 09:21:33] + mount -o remount,ro /
[2022-09-20 09:21:33] + echo 1
[2022-09-20 09:21:33] + printf '%d\n' 1073741824
[2022-09-20 09:21:33] + /bin/xenstore-read target
[2022-09-20 09:21:33] + domid=3D7
[2022-09-20 09:21:33] + xenstore-read /local/domain/7/vm
[2022-09-20 09:21:33] + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3
[2022-09-20 09:21:33] + sort
[2022-09-20 09:21:33] + xenstore-list -p
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv
[2022-09-20 09:21:33] + xenstore-read
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/002
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/003
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/004
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/007
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/008
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/012
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/013
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/016
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/017
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/018
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/021
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/022
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/026
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/027
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/030
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/031
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/032
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033
[2022-09-20 09:21:33] + dm_args=3D'-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + usb_args=3D
[2022-09-20 09:21:33] + test -e /bin/qrexec-agent
[2022-09-20 09:21:33] + usb_args=3D'-device
[2022-09-20 09:21:33] nec-usb-xhci,id=3Dxhci'
[2022-09-20 09:21:33] + mkdir -p /var/run/qubes
[2022-09-20 09:21:33] + touch /dev/mdev.log
[2022-09-20 09:21:33] + mdev -d
[2022-09-20 09:21:33] + USER=3Droot qrexec-agent
[2022-09-20 09:21:33] + sed -n '/^-soundhw/ {n;p}'
[2022-09-20 09:21:33] + echo '-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + audio_model=3D
[2022-09-20 09:21:33] + '[' -n  ]
[2022-09-20 09:21:33] + sed -n /^-qubes-net:/p
[2022-09-20 09:21:33] + echo '-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + net_args=3D
[2022-09-20 09:21:33] + sed /^-qubes-net:/d
[2022-09-20 09:21:33] + echo '-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + dm_args=3D'-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + test -e /sys/class/net/eth0
[2022-09-20 09:21:33] + echo 'No network interface named eth0.'
[2022-09-20 09:21:33] No network interface named eth0.
[2022-09-20 09:21:33] + ls -l /sys/class/net/
[2022-09-20 09:21:33] total 0
[2022-09-20 09:21:33] lrwxrwxrwx    1 root     0                0 Sep 20
07:21 .[1;36mlo.[m -> .[1;34m../../devices/virtual/net/lo.[m
[2022-09-20 09:21:33] + xenstore-read target
[2022-09-20 09:21:33] + target=3D7
[2022-09-20 09:21:33] + device_model=3Ddevice-model/7
[2022-09-20 09:21:33] + mkdir /tmp/qmp
[2022-09-20 09:21:33] + kernel=3D
[2022-09-20 09:21:33] + grep -q ^-append
[2022-09-20 09:21:33] + echo '-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + mkfifo /tmp/qmp/qemu.in /tmp/qmp/qemu.out
[2022-09-20 09:21:33] + set +x
[2022-09-20 09:21:33] Clearing kmsg buffer...
[2022-09-20 09:21:33] + set +x
[2022-09-20 09:21:33] + set+ sed 's/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/'
[2022-09-20 09:21:33]  +x
[2022-09-20 09:21:33] + echo '-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + dm_args=3D'-xen-domid
[2022-09-20 09:21:33] 7
[2022-09-20 09:21:33] -no-shutdown
[2022-09-20 09:21:33] -nodefaults
[2022-09-20 09:21:33] -no-user-config
[2022-09-20 09:21:33] -name
[2022-09-20 09:21:33] openbsd-71
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] VGA,vgamem_mb=3D16
[2022-09-20 09:21:33] -boot
[2022-09-20 09:21:33] order=3Ddc
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-ehci,id=3Dehci
[2022-09-20 09:21:33] -device
[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0
[2022-09-20 09:21:33] -smp
[2022-09-20 09:21:33] 2,maxcpus=3D2
[2022-09-20 09:21:33] -net
[2022-09-20 09:21:33] none
[2022-09-20 09:21:33] -display
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 09:21:33] -machine
[2022-09-20 09:21:33] xenfv
[2022-09-20 09:21:33] -m
[2022-09-20 09:21:33] 496
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 09:21:33] -drive
[2022-09-20 09:21:33]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 09:21:33] + xenstore-read device/console/2
[2022-09-20 09:21:33] + xenstore-read device/console/1
[2022-09-20 09:21:33] + IFS=3D'
[2022-09-20 09:21:33] '
[2022-09-20 09:21:33] + set -f
[2022-09-20 09:21:33] + set +f
[2022-09-20 09:21:33] + unset IFS
[2022-09-20 09:21:33] + qemu_pid=3D72
[2022-09-20 09:21:33] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 09:21:33] + sleep 0.1
[2022-09-20 09:21:33] + qemu -sandbox+ '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 09:21:33] + sleep 0.1
[2022-09-20 09:21:34]
 'on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny'
-chardev 'pipe,path=3D/tmp/qmp/qemu,id=3Dm' -mon 'chardev=3Dm,mode=3Dcontro=
l'
-chardev 'socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2' -mon
'chardev=3Dm2,mode=3Dcontrol' -xen-domid 7 -no-shutdown -nodefaults
-no-user-config -name openbsd-71 -display none -device 'VGA,vgamem_mb=3D16'
-boot 'order=3Ddc' -device 'usb-ehci,id=3Dehci' -device 'usb-tablet,bus=3De=
hci.0'
-smp '2,maxcpus=3D2' -net none -display 'qubes-gui,domid=3D0,log-level=3D0'
-machine xenfv -m 496 -drive
'file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-device 'nec-usb-xhci,id=3Dxhci'
[2022-09-20 09:21:34] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 09:21:34] + sleep 0.1
[2022-09-20 09:21:34] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'server' deprecated
[2022-09-20 09:21:34] Please use server=3Don instead
[2022-09-20 09:21:34] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'nowait' deprecated
[2022-09-20 09:21:34] Please use wait=3Doff instead
[2022-09-20 09:21:34] + tee /proc/self/fd/2
[2022-09-20 09:21:34] + echo '{"execute": "qmp_capabilities"}'
[2022-09-20 09:21:34] {"execute": "qmp_capabilities"}
[2022-09-20 09:21:34] random: qemu: uninitialized urandom read (16 bytes
read)
[2022-09-20 09:21:34] {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1,
"major": 6}, "package": ""}, "capabilities": ["oob"]}}

[2022-09-20 09:21:34] qubes_gui/init: 573
[2022-09-20 09:21:34] qubes_gui/init: 582
[2022-09-20 09:21:34] qubes_gui/init: 584
[2022-09-20 09:21:34] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 09:21:34] + '[' -e /proc/self/fd/4 ]
[2022-09-20 09:21:34] + '[' -e /proc/self/fd/3 ]
[2022-09-20 09:21:34] + true
[2022-09-20 09:21:34] + printf '=3D=3D=3D=3D Press enter for shell =3D=3D=
=3D=3D\n'
[2022-09-20 09:21:34] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D
[2022-09-20 09:21:34] + read
[2022-09-20 09:21:34] + vchan-socket-proxy 0 device-model/7/qmp-vchan
/tmp/qemu.qmp
[2022-09-20 09:21:34] qubes_gui/init[611]: version sent, waiting for xorg
conf
[2022-09-20 09:21:34] {"return": {}}

[2022-09-20 09:21:34] written 110 bytes to vchan
[2022-09-20 09:21:34] written 34 bytes to vchan
[2022-09-20 09:21:34] [00:06.0] xen_pt_realize: Assigning real physical
device 07:00.0 to devfn 0x30
[2022-09-20 09:21:34] [00:06.0] xen_pt_register_regions: IO region 0
registered (size=3D0x00000100 base_addr=3D0x00003000 type: 0x1)
[2022-09-20 09:21:34] [00:06.0] xen_pt_register_regions: IO region 2
registered (size=3D0x00001000 base_addr=3D0xb4304000 type: 0x4)
[2022-09-20 09:21:34] [00:06.0] xen_pt_register_regions: IO region 4
registered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x000e
mismatch! Emulated=3D0x0080, host=3D0x0000, syncing to 0x0000.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0010
mismatch! Emulated=3D0x0000, host=3D0x3001, syncing to 0x3001.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0018
mismatch! Emulated=3D0x0000, host=3D0xb4304004, syncing to 0xb4304004.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0020
mismatch! Emulated=3D0x0000, host=3D0xb4300004, syncing to 0xb4300004.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0042
mismatch! Emulated=3D0x0000, host=3D0x07c3, syncing to 0x0603.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0052
mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0074
mismatch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x007a
mismatch! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.
[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0082
mismatch! Emulated=3D0x0000, host=3D0x1011, syncing to 0x1011.
[2022-09-20 09:21:34] [00:06.0] xen_pt_pci_intx: intx=3D1
[2022-09-20 09:21:34] [00:06.0] xen_pt_realize: Real physical device
07:00.0 registered successfully
[2022-09-20 09:21:34] written 34 bytes to vchan
[2022-09-20 09:21:34] written 2048 bytes to vchan
[2022-09-20 09:21:34] written 979 bytes to vchan
[2022-09-20 09:21:34] written 110 bytes to vchan
[2022-09-20 09:21:34] written 34 bytes to vchan
[2022-09-20 09:21:34] written 34 bytes to vchan
[2022-09-20 09:21:34] qubes_gui/init[622]: got xorg conf, creating window
[2022-09-20 09:21:34] qubes_gui/init: 632
[2022-09-20 09:21:34] configure msg, x/y 640 325 (was 0 0), w/h 640 480
[2022-09-20 09:21:34] configure msg, x/y 640 325 (was 640 325), w/h 640 480
[2022-09-20 09:21:35] random: crng init done
[2022-09-20 09:21:58] [00:06.0] Write-back to unknown field 0x44
(partially) inhibited (0x0000ffff)
[2022-09-20 09:21:58] [00:06.0] If the device doesn't work, try enabling
permissive mode
[2022-09-20 09:21:58] [00:06.0] (unsafe) and if it helps report the problem
to xen-devel
[2022-09-20 09:21:58] [00:06.0] xen_pt_msgctrl_reg_write: setup MSI
(register: 81).
[2022-09-20 09:21:58] [00:06.0] xen_pt_msi_setup: MSI mapped with pirq 151.
[2022-09-20 09:21:58] [00:06.0] msi_msix_update: Updating MSI with pirq 151
gvec 0x72 gflags 0x0 (entry: 0x0)
[2022-09-20 09:31:19] qubes_gui: got unknown msg type 145, ignoring
[2022-09-20 09:33:54] qubes_gui: got unknown msg type 145, ignoring
[2022-09-20 09:42:36] {"timestamp": {"seconds": 1663659756, "microseconds":
783476}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-20 09:42:36] {"timestamp": {"seconds": 1663659756, "microseconds":
784673}, "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}=
}

[2022-09-20 09:42:38] pcifront pci-0: Rescanning PCI Frontend Bus 0000:00
[2022-09-20 10:08:20] Logfile Opened
[2022-09-20 10:08:20] Linux version 5.10.105-xen-stubdom
(mockbuild@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422
(Red Hat 10.3.1-1), GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST
2022
[2022-09-20 10:08:20] Command line:
[2022-09-20 10:08:20] x86/fpu: Supporting XSAVE feature 0x001: 'x87
floating point registers'
[2022-09-20 10:08:20] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
registers'
[2022-09-20 10:08:20] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
registers'
[2022-09-20 10:08:20] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  25=
6
[2022-09-20 10:08:20] x86/fpu: Enabled xstate features 0x7, context size is
832 bytes, using 'standard' format.
[2022-09-20 10:08:20] Released 0 page(s)
[2022-09-20 10:08:20] BIOS-provided physical RAM map:
[2022-09-20 10:08:20] Xen: [mem 0x0000000000000000-0x000000000009ffff]
usable
[2022-09-20 10:08:20] Xen: [mem 0x00000000000a0000-0x00000000000fffff]
reserved
[2022-09-20 10:08:20] Xen: [mem 0x0000000000100000-0x0000000008ffffff]
usable
[2022-09-20 10:08:20] NX (Execute Disable) protection: active
[2022-09-20 10:08:20] Hypervisor detected: Xen PV
[2022-09-20 10:08:20] tsc: Fast TSC calibration failed
[2022-09-20 10:08:20] tsc: Detected 2591.998 MHz processor
[2022-09-20 10:08:20] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000
[2022-09-20 10:08:20] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP
 UC  UC
[2022-09-20 10:08:20] RAMDISK: [mem 0x02000000-0x03f7afff]
[2022-09-20 10:08:20] Zone ranges:
[2022-09-20 10:08:20]   DMA32    [mem 0x0000000000001000-0x0000000008ffffff=
]
[2022-09-20 10:08:20]   Normal   empty
[2022-09-20 10:08:20] Movable zone start for each node
[2022-09-20 10:08:20] Early memory node ranges
[2022-09-20 10:08:20]   node   0: [mem
0x0000000000001000-0x000000000009ffff]
[2022-09-20 10:08:20]   node   0: [mem
0x0000000000100000-0x0000000008ffffff]
[2022-09-20 10:08:20] Initmem setup node 0 [mem
0x0000000000001000-0x0000000008ffffff]
[2022-09-20 10:08:20] On node 0, zone DMA32: 1 pages in unavailable ranges
[2022-09-20 10:08:20] On node 0, zone DMA32: 96 pages in unavailable ranges
[2022-09-20 10:08:20] On node 0, zone DMA32: 28672 pages in unavailable
ranges
[2022-09-20 10:08:20] p2m virtual area at (____ptrval____), size is 200000
[2022-09-20 10:08:20] Remapped 0 page(s)
[2022-09-20 10:08:20] [mem 0x09000000-0xffffffff] available for PCI devices
[2022-09-20 10:08:20] Booting paravirtualized kernel on Xen
[2022-09-20 10:08:20] Xen version: 4.14.5 (preserve-AD)
[2022-09-20 10:08:20] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[2022-09-20 10:08:20] Built 1 zonelists, mobility grouping on.  Total
pages: 36170
[2022-09-20 10:08:20] Kernel command line: clocksource=3Dtsc
[2022-09-20 10:08:20] Dentry cache hash table entries: 32768 (order: 6,
262144 bytes, linear)
[2022-09-20 10:08:20] Inode-cache hash table entries: 16384 (order: 5,
131072 bytes, linear)
[2022-09-20 10:08:20] mem auto-init: stack:byref_all(zero), heap alloc:off,
heap free:off
[2022-09-20 10:08:20] Memory: 96968K/147068K available (6145K kernel code,
842K rwdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K
cma-reserved)
[2022-09-20 10:08:20] random: get_random_u64 called from 0xffffffff810a0f18
with crng_init=3D0
[2022-09-20 10:08:20] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1,
Nodes=3D1
[2022-09-20 10:08:20] Using NULL legacy PIC
[2022-09-20 10:08:20] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0
[2022-09-20 10:08:20] xen:events: Using FIFO-based ABI
[2022-09-20 10:08:20] printk: console [hvc0] enabled
[2022-09-20 10:08:20] clocksource: xen: mask: 0xffffffffffffffff
max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[2022-09-20 10:08:20] installing Xen timer for CPU 0
[2022-09-20 10:08:20] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-20 10:08:20] Calibrating delay loop (skipped), value calculated
using timer frequency.. 5183.99 BogoMIPS (lpj=3D10367992)
[2022-09-20 10:08:20] pid_max: default: 4096 minimum: 301
[2022-09-20 10:08:20] Mount-cache hash table entries: 512 (order: 0, 4096
bytes, linear)
[2022-09-20 10:08:20] Mountpoint-cache hash table entries: 512 (order: 0,
4096 bytes, linear)
[2022-09-20 10:08:20] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[2022-09-20 10:08:20] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[2022-09-20 10:08:20] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
(family: 0x6, model: 0x9e, stepping: 0xa)
[2022-09-20 10:08:20] Spectre V1 : Mitigation: usercopy/swapgs barriers and
__user pointer sanitization
[2022-09-20 10:08:20] Spectre V2 : Mitigation: Retpolines
[2022-09-20 10:08:20] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
Filling RSB on context switch
[2022-09-20 10:08:20] Spectre V2 : Enabling Restricted Speculation for
firmware calls
[2022-09-20 10:08:20] Spectre V2 : mitigation: Enabling conditional
Indirect Branch Prediction Barrier
[2022-09-20 10:08:20] Speculative Store Bypass: Mitigation: Speculative
Store Bypass disabled via prctl and seccomp
[2022-09-20 10:08:20] SRBDS: Unknown: Dependent on hypervisor status
[2022-09-20 10:08:20] MDS: Mitigation: Clear CPU buffers
[2022-09-20 10:08:20] Performance Events: unsupported p6 CPU model 158 no
PMU driver, software events only.
[2022-09-20 10:08:20] devtmpfs: initialized
[2022-09-20 10:08:20] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[2022-09-20 10:08:20] futex hash table entries: 16 (order: -4, 384 bytes,
linear)
[2022-09-20 10:08:20] NET: Registered protocol family 16
[2022-09-20 10:08:20] xen:grant_table: Grant tables using version 1 layout
[2022-09-20 10:08:20] Grant table initialized
[2022-09-20 10:08:20] PCI: setting up Xen PCI frontend stub
[2022-09-20 10:08:20] xen:balloon: Initialising balloon driver
[2022-09-20 10:08:20] usbcore: registered new interface driver usbfs
[2022-09-20 10:08:20] usbcore: registered new interface driver hub
[2022-09-20 10:08:20] usbcore: registered new device driver usb
[2022-09-20 10:08:20] PCI: System does not support PCI
[2022-09-20 10:08:20] clocksource: Switched to clocksource xen
[2022-09-20 10:08:20] NET: Registered protocol family 2
[2022-09-20 10:08:20] IP idents hash table entries: 4096 (order: 3, 32768
bytes, linear)
[2022-09-20 10:08:20] tcp_listen_portaddr_hash hash table entries: 256
(order: 0, 4096 bytes, linear)
[2022-09-20 10:08:20] TCP established hash table entries: 2048 (order: 2,
16384 bytes, linear)
[2022-09-20 10:08:20] TCP bind hash table entries: 2048 (order: 2, 16384
bytes, linear)
[2022-09-20 10:08:20] TCP: Hash tables configured (established 2048 bind
2048)
[2022-09-20 10:08:20] UDP hash table entries: 128 (order: 0, 4096 bytes,
linear)
[2022-09-20 10:08:20] UDP-Lite hash table entries: 128 (order: 0, 4096
bytes, linear)
[2022-09-20 10:08:20] NET: Registered protocol family 1
[2022-09-20 10:08:20] Unpacking initramfs...
[2022-09-20 10:08:20] Freeing initrd memory: 32236K
[2022-09-20 10:08:20] clocksource: tsc: mask: 0xffffffffffffffff
max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[2022-09-20 10:08:20] clocksource: Switched to clocksource tsc
[2022-09-20 10:08:20] workingset: timestamp_bits=3D62 max_order=3D15
bucket_order=3D0
[2022-09-20 10:08:20] xen:xen_evtchn: Event-channel device installed
[2022-09-20 10:08:20] Invalid max_queues (4), will use default max: 1.
[2022-09-20 10:08:21] random: fast init done
[2022-09-20 10:08:21] tun: Universal TUN/TAP device driver, 1.6
[2022-09-20 10:08:21] xen_netfront: Initialising Xen virtual ethernet drive=
r
[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 1
[2022-09-20 10:08:21] vhci_hcd: created sysfs vhci_hcd.0
[2022-09-20 10:08:21] hub 1-0:1.0: USB hub found
[2022-09-20 10:08:21] hub 1-0:1.0: 8 ports detected
[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: new USB bus registered, assigned
bus number 2
[2022-09-20 10:08:21] usb usb2: We don't know the algorithms for LPM for
this host, disabling LPM.
[2022-09-20 10:08:21] hub 2-0:1.0: USB hub found
[2022-09-20 10:08:21] hub 2-0:1.0: 8 ports detected
[2022-09-20 10:08:21] NET: Registered protocol family 17
[2022-09-20 10:08:21] sched_clock: Marking stable (312462849,
188928)->(314330248, -1678471)
[2022-09-20 10:08:21] pcifront pci-0: Installing PCI frontend
[2022-09-20 10:08:21] xen:swiotlb_xen: Warning: only able to allocate 4 MB
for software IO TLB
[2022-09-20 10:08:21] software IO TLB: mapped [mem
0x0000000003800000-0x0000000003c00000] (4MB)
[2022-09-20 10:08:21] pcifront pci-0: Creating PCI Frontend Bus 0000:00
[2022-09-20 10:08:21] pcifront pci-0: PCI host bridge to bus 0000:00
[2022-09-20 10:08:21] pci_bus 0000:00: root bus resource [io  0x0000-0xffff=
]
[2022-09-20 10:08:21] pci_bus 0000:00: root bus resource [mem
0x00000000-0x7fffffffff]
[2022-09-20 10:08:21] pci_bus 0000:00: root bus resource [bus 00-ff]
[2022-09-20 10:08:21] pci 0000:00:00.0: [10ec:8168] type 00 class 0x020000
[2022-09-20 10:08:21] pci 0000:00:00.0: reg 0x10: [io  0x3000-0x30ff]
[2022-09-20 10:08:21] pci 0000:00:00.0: reg 0x18: [mem
0xb4304000-0xb4304fff 64bit]
[2022-09-20 10:08:21] pci 0000:00:00.0: reg 0x20: [mem
0xb4300000-0xb4303fff 64bit]
[2022-09-20 10:08:21] pci 0000:00:00.0: supports D1 D2
[2022-09-20 10:08:21] pcifront pci-0: claiming resource 0000:00:00.0/0
[2022-09-20 10:08:21] pcifront pci-0: claiming resource 0000:00:00.0/2
[2022-09-20 10:08:21] pcifront pci-0: claiming resource 0000:00:00.0/4
[2022-09-20 10:08:21] blkfront: xvda: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 10:08:21]  xvda: xvda4
[2022-09-20 10:08:21] blkfront: xvdb: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 10:08:21] blkfront: xvdc: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled;
[2022-09-20 10:08:21] Freeing unused kernel image (initmem) memory: 696K
[2022-09-20 10:08:21] Write protecting the kernel read-only data: 10240k
[2022-09-20 10:08:21] Freeing unused kernel image (text/rodata gap) memory:
2044K
[2022-09-20 10:08:21] Freeing unused kernel image (rodata/data gap) memory:
1620K
[2022-09-20 10:08:21] Run /init as init process
[2022-09-20 10:08:21] + mount -t devtmpfs none /dev
[2022-09-20 10:08:21] + mount -t sysfs /sys /sys
[2022-09-20 10:08:21] + mount -t proc /proc /proc
[2022-09-20 10:08:21] + mount -t tmpfs -o 'size=3D1m,nodev,noexec' /tmp /tm=
p
[2022-09-20 10:08:21] + mount -o remount,ro /
[2022-09-20 10:08:21] + echo 1
[2022-09-20 10:08:21] + printf '%d\n' 1073741824
[2022-09-20 10:08:21] + /bin/xenstore-read target
[2022-09-20 10:08:21] + domid=3D19
[2022-09-20 10:08:21] + xenstore-read /local/domain/19/vm
[2022-09-20 10:08:21] + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3
[2022-09-20 10:08:21] + sort
[2022-09-20 10:08:21] + xenstore-list -p
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv
[2022-09-20 10:08:21] + xenstore-read
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/002
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/003
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/004
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/007
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/008
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/012
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/013
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/016
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/017
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/018
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/021
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/022
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/026
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/027
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/030
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/031
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/032
/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033
[2022-09-20 10:08:21] + dm_args=3D'-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + usb_args=3D
[2022-09-20 10:08:21] + test -e /bin/qrexec-agent
[2022-09-20 10:08:21] + usb_args=3D'-device
[2022-09-20 10:08:21] nec-usb-xhci,id=3Dxhci'
[2022-09-20 10:08:21] + mkdir -p /var/run/qubes
[2022-09-20 10:08:21] + touch /dev/mdev.log
[2022-09-20 10:08:21] + USER=3Droot qrexec-agent
[2022-09-20 10:08:21] + mdev -d
[2022-09-20 10:08:21] + sed -n '/^-soundhw/ {n;p}'
[2022-09-20 10:08:21] + echo '-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + audio_model=3D
[2022-09-20 10:08:21] + '[' -n  ]
[2022-09-20 10:08:21] + sed -n /^-qubes-net:/p
[2022-09-20 10:08:21] + echo '-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + net_args=3D
[2022-09-20 10:08:21] + sed /^-qubes-net:/d
[2022-09-20 10:08:21] + echo '-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + dm_args=3D'-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + test -e /sys/class/net/eth0
[2022-09-20 10:08:21] + echo 'No network interface named eth0.'
[2022-09-20 10:08:21] No network interface named eth0.
[2022-09-20 10:08:21] + ls -l /sys/class/net/
[2022-09-20 10:08:21] total 0
[2022-09-20 10:08:21] lrwxrwxrwx    1 root     0                0 Sep 20
08:08 .[1;36mlo.[m -> .[1;34m../../devices/virtual/net/lo.[m
[2022-09-20 10:08:21] + xenstore-read target
[2022-09-20 10:08:21] + target=3D19
[2022-09-20 10:08:21] + device_model=3Ddevice-model/19
[2022-09-20 10:08:21] + mkdir /tmp/qmp
[2022-09-20 10:08:21] + kernel=3D
[2022-09-20 10:08:21] + grep -q ^-append
[2022-09-20 10:08:21] + echo '-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + mkfifo /tmp/qmp/qemu.in /tmp/qmp/qemu.out
[2022-09-20 10:08:21] + set +x
[2022-09-20 10:08:21] Clearing kmsg buffer...
[2022-09-20 10:08:21] + set +x
[2022-09-20 10:08:21] + set +x
[2022-09-20 10:08:21] + sed 's/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/'
[2022-09-20 10:08:21] + echo '-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + dm_args=3D'-xen-domid
[2022-09-20 10:08:21] 19
[2022-09-20 10:08:21] -no-shutdown
[2022-09-20 10:08:21] -nodefaults
[2022-09-20 10:08:21] -no-user-config
[2022-09-20 10:08:21] -name
[2022-09-20 10:08:21] openbsd-71
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] VGA,vgamem_mb=3D16
[2022-09-20 10:08:21] -boot
[2022-09-20 10:08:21] order=3Ddc
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-ehci,id=3Dehci
[2022-09-20 10:08:21] -device
[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0
[2022-09-20 10:08:21] -smp
[2022-09-20 10:08:21] 2,maxcpus=3D2
[2022-09-20 10:08:21] -net
[2022-09-20 10:08:21] none
[2022-09-20 10:08:21] -display
[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0
[2022-09-20 10:08:21] -machine
[2022-09-20 10:08:21] xenfv
[2022-09-20 10:08:21] -m
[2022-09-20 10:08:21] 496
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback
[2022-09-20 10:08:21] -drive
[2022-09-20 10:08:21]
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback'
[2022-09-20 10:08:21] + xenstore-read device/console/2
[2022-09-20 10:08:21] + xenstore-read device/console/1
[2022-09-20 10:08:21] + IFS=3D'
[2022-09-20 10:08:21] '
[2022-09-20 10:08:21] + set -f
[2022-09-20 10:08:21] + set +f
[2022-09-20 10:08:21] + unset IFS
[2022-09-20 10:08:21] + qemu_pid=3D148
[2022-09-20 10:08:21] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 10:08:21] + sleep 0.1
[2022-09-20 10:08:21] + qemu -sandbox
'on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny'
-chardev 'pipe,path=3D/tmp/qmp/qemu,id=3Dm' -mon 'chardev=3Dm,mode=3Dcontro=
l'
-chardev 'socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2' -mon
'chardev=3Dm2,mode=3Dcontrol' -xen-domid 19 -no-shutdown -nodefaults
-no-user-config -name openbsd-71 -display none -device 'VGA,vgamem_mb=3D16'
-boot 'order=3Ddc' -device 'usb-ehci,id=3Dehci' -device 'usb-tablet,bus=3De=
hci.0'
-smp '2,maxcpus=3D2' -net none -display 'qubes-gui,domid=3D0,log-level=3D0'
-machine xenfv -m 496 -drive
'file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-drive
'file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cach=
e=3Dwriteback'
-device 'nec-usb-xhci,id=3Dxhci'
[2022-09-20 10:08:21] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'server' deprecated
[2022-09-20 10:08:21] Please use server=3Don instead
[2022-09-20 10:08:21] qemu: -chardev
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean
option 'nowait' deprecated
[2022-09-20 10:08:21] Please use wait=3Doff instead
[2022-09-20 10:08:21] + tee /proc/self/fd/2
[2022-09-20 10:08:21] random: qemu: uninitialized urandom read (16 bytes
read)
[2022-09-20 10:08:21] + echo '{"execute": "qmp_capabilities"}'
[2022-09-20 10:08:21] {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1,
"major": 6}, "package": ""}, "capabilities": ["oob"]}}

[2022-09-20 10:08:21] {"execute": "qmp_capabilities"}
[2022-09-20 10:08:21] qubes_gui/init: 573
[2022-09-20 10:08:21] qubes_gui/init: 582
[2022-09-20 10:08:21] qubes_gui/init: 584
[2022-09-20 10:08:21] qubes_gui/init[611]: version sent, waiting for xorg
conf
[2022-09-20 10:08:21] {"return": {}}

[2022-09-20 10:08:21] + '[' '!' -e /tmp/qemu.qmp ]
[2022-09-20 10:08:21] + '[' -e /proc/self/fd/4 ]
[2022-09-20 10:08:21] + '[' -e /proc/self/fd/3 ]
[2022-09-20 10:08:21] + true
[2022-09-20 10:08:21] + printf '=3D=3D=3D=3D Press enter for shell =3D=3D=
=3D=3D\n'
[2022-09-20 10:08:21] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D
[2022-09-20 10:08:21] + read
[2022-09-20 10:08:21] + vchan-socket-proxy 0 device-model/19/qmp-vchan
/tmp/qemu.qmp
[2022-09-20 10:08:21] written 110 bytes to vchan
[2022-09-20 10:08:21] written 34 bytes to vchan
[2022-09-20 10:08:22] [00:06.0] xen_pt_realize: Assigning real physical
device 07:00.0 to devfn 0x30
[2022-09-20 10:08:22] [00:06.0] xen_pt_register_regions: IO region 0
registered (size=3D0x00000100 base_addr=3D0x00003000 type: 0x1)
[2022-09-20 10:08:22] [00:06.0] xen_pt_register_regions: IO region 2
registered (size=3D0x00001000 base_addr=3D0xb4304000 type: 0x4)
[2022-09-20 10:08:22] [00:06.0] xen_pt_register_regions: IO region 4
registered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x000e
mismatch! Emulated=3D0x0080, host=3D0x0000, syncing to 0x0000.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0010
mismatch! Emulated=3D0x0000, host=3D0x3001, syncing to 0x3001.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0018
mismatch! Emulated=3D0x0000, host=3D0xb4304004, syncing to 0xb4304004.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0020
mismatch! Emulated=3D0x0000, host=3D0xb4300004, syncing to 0xb4300004.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0042
mismatch! Emulated=3D0x0000, host=3D0x07c3, syncing to 0x0603.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0052
mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0074
mismatch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x007a
mismatch! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.
[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0082
mismatch! Emulated=3D0x0000, host=3D0x1011, syncing to 0x1011.
[2022-09-20 10:08:22] [00:06.0] xen_pt_pci_intx: intx=3D1
[2022-09-20 10:08:22] [00:06.0] xen_pt_realize: Real physical device
07:00.0 registered successfully
[2022-09-20 10:08:22] written 34 bytes to vchan
[2022-09-20 10:08:22] written 2048 bytes to vchan
[2022-09-20 10:08:22] written 979 bytes to vchan
[2022-09-20 10:08:22] written 110 bytes to vchan
[2022-09-20 10:08:22] written 34 bytes to vchan
[2022-09-20 10:08:22] written 34 bytes to vchan
[2022-09-20 10:08:22] qubes_gui/init[622]: got xorg conf, creating window
[2022-09-20 10:08:22] qubes_gui/init: 632
[2022-09-20 10:08:22] configure msg, x/y 640 325 (was 0 0), w/h 640 480
[2022-09-20 10:08:23] random: crng init done
[2022-09-20 10:08:43] [00:06.0] Write-back to unknown field 0x44
(partially) inhibited (0x0000ffff)
[2022-09-20 10:08:43] [00:06.0] If the device doesn't work, try enabling
permissive mode
[2022-09-20 10:08:43] [00:06.0] (unsafe) and if it helps report the problem
to xen-devel
[2022-09-20 10:08:43] [00:06.0] xen_pt_msgctrl_reg_write: setup MSI
(register: 81).
[2022-09-20 10:08:43] [00:06.0] xen_pt_msi_setup: MSI mapped with pirq 151.
[2022-09-20 10:08:43] [00:06.0] msi_msix_update: Updating MSI with pirq 151
gvec 0x72 gflags 0x0 (entry: 0x0)

BR Adam




wt., 20 wrz 2022 o 09:41 Adam Szewczyk <szewcson@gmail.com> napisa=C5=82(a)=
:

> (XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
>> (XEN) parameter "no-real-mode" unknown!
>>  Xen 4.14.5
>> (XEN) Xen version 4.14.5 (mockbuild@[unknown]) (gcc (GCC) 10.3.1
>> 20210422 (Red Hat 10.3.1-1)) debug=3Dn  Wed Aug 24 00:00:00 UTC 2022
>> (XEN) Latest ChangeSet:
>> (XEN) Bootloader: GRUB 2.04
>> (XEN) Command line: placeholder console=3Dnone dom0_mem=3Dmin:1024M
>> dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_frames=3D2048
>> gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
>> (XEN) Xen image load base address: 0x9c200000
>> (XEN) Video information:
>> (XEN)  VGA is graphics mode 1920x1080, 32 bpp
>> (XEN) Disc information:
>> (XEN)  Found 0 MBR signatures
>> (XEN)  Found 2 EDD information structures
>> (XEN) EFI RAM map:
>> (XEN)  [0000000000000000, 000000000009efff] (usable)
>> (XEN)  [000000000009f000, 00000000000fffff] (reserved)
>> (XEN)  [0000000000100000, 0000000086466fff] (usable)
>> (XEN)  [0000000086467000, 0000000086d66fff] (reserved)
>> (XEN)  [0000000086d67000, 000000009cf7dfff] (usable)
>> (XEN)  [000000009cf7e000, 000000009e49dfff] (reserved)
>> (XEN)  [000000009e49e000, 000000009eb8dfff] (ACPI NVS)
>> (XEN)  [000000009eb8e000, 000000009ec0dfff] (ACPI data)
>> (XEN)  [000000009ec0e000, 000000009ec0efff] (usable)
>> (XEN)  [000000009ec0f000, 000000009fffffff] (reserved)
>> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
>> (XEN)  [00000000fe000000, 00000000fe010fff] (reserved)
>> (XEN)  [00000000fed10000, 00000000fed19fff] (reserved)
>> (XEN)  [00000000fed84000, 00000000fed84fff] (reserved)
>> (XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
>> (XEN)  [00000000ff600000, 00000000ffffffff] (reserved)
>> (XEN)  [0000000100000000, 000000085dffffff] (usable)
>> (XEN) ACPI: RSDP 9EC0D014, 0024 (r2 LENOVO)
>> (XEN) ACPI: XSDT 9EBEE188, 00FC (r1 LENOVO CB-01           1
>> 1000013)
>> (XEN) ACPI: FACP 9EBF1000, 010C (r5 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: DSDT 9EBBD000, 2FF34 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: FACS 9EB0D000, 0040
>> (XEN) ACPI: UEFI 9EC0C000, 0236 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EC0A000, 1B1C (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EC06000, 31D0 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: UEFI 9EC05000, 0042 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EC04000, 045A (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EC03000, 0046 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: TPM2 9EC02000, 0034 (r3 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: POAT 9EC01000, 0055 (r3 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBFC000, 44B6 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: LPIT 9EBFB000, 0094 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: WSMT 9EBFA000, 0028 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBF9000, 0C2F (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: DBGP 9EBF8000, 0034 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: DBG2 9EBF7000, 0061 (r0 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBF6000, 0896 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBF3000, 2F89 (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: ASF! 9EBF2000, 00A5 (r32 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: HPET 9EBF0000, 0038 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: APIC 9EBEF000, 012C (r3 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: MCFG 9EBED000, 003C (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBBA000, 2BBF (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: DMAR 9EBB9000, 0070 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBB6000, 2B68 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: SSDT 9EBB5000, 004C (r2 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: FPDT 9EBB4000, 0044 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) ACPI: BGRT 9EBB3000, 0038 (r1 LENOVO CB-01           1 ACPI
>>  40000)
>> (XEN) System RAM: 32678MB (33462392kB)
>> (XEN) Domain heap initialised
>> (XEN) ACPI: 32/64X FACS address mismatch in FADT -
>> 9eb0d000/0000000000000000, using 32
>> (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
>> (XEN) Enabling APIC mode:  Phys.  Using 1 I/O APICs
>> (XEN) Switched to APIC driver x2apic_cluster
>> (XEN) CPU0: TSC: ratio: 216 / 2
>> (XEN) CPU0: bus: 100 MHz base: 2600 MHz max: 4500 MHz
>> (XEN) CPU0: 800 ... 2600 MHz
>> (XEN) xstate: size: 0x440 and states: 0x1f
>> (XEN) Speculative mitigation facilities:
>> (XEN)   Hardware hints: RSBA
>> (XEN)   Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR
>> SRBDS_CTRL
>> (XEN)   Compiled-in support: INDIRECT_THUNK
>> (XEN)   Xen settings: BTI-Thunk JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-,
>> Other: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
>> (XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe
>> address 8000000000
>> (XEN)   Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
>> (XEN)   Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU MD_CLEAR
>> (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
>> (XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
>> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
>> (XEN) Initializing Credit2 scheduler
>> (XEN) Disabling HPET for being unreliable
>> (XEN) Platform timer is 3.580MHz ACPI PM Timer
>> (XEN) Detected 2591.999 MHz processor.
>> (XEN) Unknown cachability for MFNs 0xa0-0xff
>> (XEN) Unknown cachability for MFNs 0x9f000-0x9ffff
>> (XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
>> (XEN) Intel VT-d Snoop Control enabled.
>> (XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
>> (XEN) Intel VT-d Queued Invalidation enabled.
>> (XEN) Intel VT-d Interrupt Remapping enabled.
>> (XEN) Intel VT-d Posted Interrupt not enabled.
>> (XEN) Intel VT-d Shared EPT tables enabled.
>> (XEN) I/O virtualisation enabled
>> (XEN)  - Dom0 mode: Relaxed
>> (XEN) Interrupt remapping enabled
>> (XEN) Enabled directed EOI with ioapic_ack_old on!
>> (XEN) ENABLING IO-APIC IRQs
>> (XEN)  -> Using old ACK method
>> (XEN) Allocated console ring of 32 KiB.
>> (XEN) VMX: Supported advanced features:
>> (XEN)  - APIC MMIO access virtualisation
>> (XEN)  - APIC TPR shadow
>> (XEN)  - Extended Page Tables (EPT)
>> (XEN)  - Virtual-Processor Identifiers (VPID)
>> (XEN)  - Virtual NMI
>> (XEN)  - MSR direct-access bitmap
>> (XEN)  - Unrestricted Guest
>> (XEN)  - VM Functions
>> (XEN)  - Virtualisation Exceptions
>> (XEN)  - Page Modification Logging
>> (XEN) HVM: ASIDs enabled.
>> (XEN) HVM: VMX enabled
>> (XEN) HVM: Hardware Assisted Paging (HAP) detected
>> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
>> (XEN) Brought up 6 CPUs
>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>> (XEN) Dom0 has maximum 952 PIRQs
>> (XEN)  Xen  kernel: 64-bit, lsb, compat32
>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
>> (XEN) PHYSICAL MEMORY ARRANGEMENT:
>> (XEN)  Dom0 alloc.:   0000000838000000->0000000840000000 (1007932 pages
>> to be allocated)
>> (XEN)  Init. ramdisk: 000000085c13c000->000000085dffff1d
>> (XEN) VIRTUAL MEMORY ARRANGEMENT:
>> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>> (XEN)  Init. ramdisk: 0000000000000000->0000000000000000
>> (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
>> (XEN)  Start info:    ffffffff84000000->ffffffff840004b8
>> (XEN)  Xenstore ring: 0000000000000000->0000000000000000
>> (XEN)  Console ring:  0000000000000000->0000000000000000
>> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>> (XEN)  Boot stack:    ffffffff84026000->ffffffff84027000
>> (XEN)  TOTAL:         ffffffff80000000->ffffffff84400000
>> (XEN)  ENTRY ADDRESS: ffffffff830fb1c0
>> (XEN) Dom0 has maximum 6 VCPUs
>> (XEN) Initial low memory virq threshold set at 0x4000 pages.
>> (XEN) Scrubbing Free RAM in background
>> (XEN) Std. Loglevel: Errors and warnings
>> (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch inpu=
t)
>> (XEN) Freed 580kB init memory
>> (XEN) MSI information:
>> (XEN)  IOMMU  120 vec=3D30 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D1/  /?
>> (XEN)  MSI    121 vec=3Dc8 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D0/  /?
>> (XEN)  MSI    122 vec=3Dd0 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D0/  /?
>> (XEN)  MSI    123 vec=3De0 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D0/  /?
>> (XEN)  MSI    124 vec=3D31 lowest  edge   assert  log lowest dest=3D0000=
0040
>> mask=3D0/  /?
>> (XEN)  MSI-X  125 vec=3D51 lowest  edge   assert  log lowest dest=3D0000=
0040
>> mask=3D1/  /0
>> (XEN)  MSI-X  126 vec=3D59 lowest  edge   assert  log lowest dest=3D0000=
0004
>> mask=3D1/  /0
>> (XEN)  MSI-X  127 vec=3D61 lowest  edge   assert  log lowest dest=3D0000=
0040
>> mask=3D1/  /0
>> (XEN)  MSI-X  128 vec=3D69 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D1/  /0
>> (XEN)  MSI-X  129 vec=3D71 lowest  edge   assert  log lowest dest=3D0000=
0010
>> mask=3D1/  /0
>> (XEN)  MSI-X  130 vec=3D79 lowest  edge   assert  log lowest dest=3D0000=
0040
>> mask=3D1/  /0
>> (XEN)  MSI-X  131 vec=3D81 lowest  edge   assert  log lowest dest=3D0000=
0001
>> mask=3D1/  /0
>> (XEN)  MSI    132 vec=3Dd9 lowest  edge   assert  log lowest dest=3D0000=
0100
>> mask=3D0/  /?
>> (XEN)  MSI    133 vec=3Dc9 lowest  edge   assert  log lowest dest=3D0000=
0004
>> mask=3D0/  /?
>> (XEN)  MSI    134 vec=3D99 lowest  edge   assert  log lowest dest=3D0000=
0100
>> mask=3D0/  /?
>> (XEN)  MSI    135 vec=3Da9 lowest  edge   assert  log lowest dest=3D0000=
0555
>> mask=3D0/  /?
>> (XEN)  MSI    136 vec=3Db1 lowest  edge   assert  log lowest dest=3D0000=
0010
>> mask=3D0/  /?
>> (XEN)  MSI    137 vec=3Db9 lowest  edge   assert  log lowest dest=3D0000=
0010
>> mask=3D0/  /?
>> (XEN)  MSI    138 vec=3Dd1 lowest  edge   assert  log lowest dest=3D0000=
0100
>> mask=3D0/  /?
>> (XEN) IRQ information:
>> (XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=3D000 aff:{0}/{0}
>> time.c#timer_interrupt()
>> (XEN)    IRQ:   1 vec:39 IO-APIC-edge    status=3D034 aff:{8}/{0-11}
>> in-flight=3D0 d0:  1(---)
>> (XEN)    IRQ:   3 vec:40 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:   4 vec:48 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:   5 vec:50 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:   6 vec:58 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:   7 vec:60 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:   8 vec:68 IO-APIC-edge    status=3D030 aff:{0}/{0}
>> in-flight=3D0 d0:  8(---)
>> (XEN)    IRQ:   9 vec:b0 IO-APIC-level   status=3D030 aff:{8}/{0-11}
>> in-flight=3D0 d0:  9(---)
>> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0}
>> mapped, unbound
>> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
>> in-flight=3D0 d0: 14(---)
>> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped=
,
>> unbound
>> (XEN)    IRQ:  16 vec:b8 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>> in-flight=3D0 d0: 16(---),d3: 16(-M-)
>> (XEN)    IRQ:  17 vec:d8 IO-APIC-level   status=3D010 aff:{10}/{0-11}
>> in-flight=3D2 d0: 17(P-M),d7: 17(-MM)
>> (XEN)    IRQ:  18 vec:c0 IO-APIC-level   status=3D030 aff:{8}/{0-11}
>> in-flight=3D0 d0: 18(---),d3: 18(-M-)
>> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
>> mapped, unbound
>> (XEN)    IRQ:  20 vec:e8 IO-APIC-level   status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0: 20(---)
>> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{4}/{0-11}
>> in-flight=3D0 d0: 83(---)
>> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
>> iommu.c#iommu_page_fault()
>> (XEN)    IRQ: 121 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0:951(---)
>> (XEN)    IRQ: 122 vec:d0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0:950(---)
>> (XEN)    IRQ: 123 vec:e0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0:949(---)
>> (XEN)    IRQ: 124 vec:31 PCI-MSI         status=3D030 aff:{6}/{0-11}
>> in-flight=3D0 d0:948(---)
>> (XEN)    IRQ: 125 vec:51 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>> in-flight=3D0 d0:947(---)
>> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D010 aff:{2}/{0-11}
>> in-flight=3D0 d0:946(---)
>> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>> in-flight=3D0 d0:945(---)
>> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0:944(---)
>> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>> in-flight=3D0 d0:943(---)
>> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>> in-flight=3D0 d0:942(---)
>> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
>> in-flight=3D0 d0:941(---)
>> (XEN)    IRQ: 132 vec:d9 PCI-MSI         status=3D030 aff:{8}/{0-11}
>> in-flight=3D0 d7:151(-M-)
>> (XEN)    IRQ: 133 vec:c9 PCI-MSI         status=3D030 aff:{2}/{0-11}
>> in-flight=3D0 d3:151(---)
>> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D030 aff:{8}/{0-11}
>> in-flight=3D0 d0:938(---)
>> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
>> mapped, unbound
>> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
>> in-flight=3D0 d0:936(---)
>> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{4}/{0-11}
>> in-flight=3D0 d0:935(---)
>> (XEN)    IRQ: 138 vec:d1 PCI-MSI         status=3D010 aff:{8}/{0-11}
>> in-flight=3D0 d3:150(---)
>> (XEN) Direct vector information:
>> (XEN)    0x22 -> irq_move_cleanup_interrupt()
>> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
>> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
>> (XEN)    0xf9 -> pmu_apic_interrupt()
>> (XEN)    0xfa -> apic_timer_interrupt()
>> (XEN)    0xfb -> call_function_interrupt()
>> (XEN)    0xfc -> event_check_interrupt()
>> (XEN)    0xfd -> invalidate_interrupt()
>> (XEN)    0xfe -> error_interrupt()
>> (XEN)    0xff -> spurious_interrupt()
>> (XEN) IO-APIC interrupt information:
>> (XEN)     IRQ  0 Vec240:
>> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  1 Vec 57:
>> (XEN)       Apic 0x00, Pin  1: vec=3D39 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000100
>> (XEN)     IRQ  3 Vec 64:
>> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  4 Vec 72:
>> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  5 Vec 80:
>> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  6 Vec 88:
>> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  7 Vec 96:
>> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  8 Vec104:
>> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ  9 Vec176:
>> (XEN)       Apic 0x00, Pin  9: vec=3Db0 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000100
>> (XEN)     IRQ 10 Vec120:
>> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ 11 Vec136:
>> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ 12 Vec144:
>> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ 13 Vec152:
>> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
>> (XEN)     IRQ 14 Vec160:
>> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>> (XEN)     IRQ 15 Vec168:
>> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>> (XEN)     IRQ 16 Vec184:
>> (XEN)       Apic 0x00, Pin 16: vec=3Db8 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>> (XEN)     IRQ 17 Vec216:
>> (XEN)       Apic 0x00, Pin 17: vec=3Dd8 delivery=3DLoPri dest=3DL status=
=3D1
>> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000400
>> (XEN)     IRQ 18 Vec192:
>> (XEN)       Apic 0x00, Pin 18: vec=3Dc0 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000100
>> (XEN)     IRQ 19 Vec161:
>> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
>> (XEN)     IRQ 20 Vec232:
>> (XEN)       Apic 0x00, Pin 20: vec=3De8 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>> (XEN)     IRQ 83 Vec 65:
>> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL status=
=3D0
>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000010
>
>
>  Name                                        ID   Mem VCPUs State Time(s)
>> Domain-0                                     0  4080     6     r-----
>> 288.6
>> sys-usb                                      3   284     2     -b----
>>  20.5
>> sys-usb-dm                                   4   144     1     -b----
>>   3.5
>> openbsd-71                                   7   511     2     -b----
>>  63.0
>> openbsd-71-dm                                8   144     1     -b----
>>  14.0
>>
>
> How I can enable install this debug hypervisor? I have problems finding
> anything about it.
>
> I don't have logs with qemu in the name, instead I have gmp-proxy logs.
> But their all looks empty.
>
> BR Adam
>
> pon., 19 wrz 2022 o 11:21 Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> napisa=C5=82(a):
>
>> On Fri, Sep 16, 2022 at 05:08:59PM +0200, Adam Szewczyk wrote:
>> > Sorry, I always forgot that default answer is "answer" to not "answer =
to
>> > all".
>> >
>> > My xl dmesg after calling those debug-keys is:
>>
>> Trimming the trace:
>>
>> > (XEN) MSI information:
>>
>> > (XEN)  MSI    125 vec=3D72 lowest  edge   assert  log lowest dest=3D00=
000100
>> > mask=3D0/  /?
>>
>> > (XEN)  MSI    138 vec=3D62 lowest  edge   assert  log lowest dest=3D00=
000001
>> > mask=3D0/  /?
>> > (XEN)  MSI    139 vec=3D6a lowest  edge   assert  log lowest dest=3D00=
000010
>> > mask=3D0/  /?
>>
>> > (XEN) IRQ information:
>>
>> > (XEN)    IRQ: 125 vec:72 PCI-MSI         status=3D030 aff:{8}/{0-11}
>> > in-flight=3D0 d94:151(-M-)
>>
>> > (XEN)    IRQ: 138 vec:62 PCI-MSI         status=3D030 aff:{0}/{0-11}
>> > in-flight=3D0 d92:151(---)
>> > (XEN)    IRQ: 139 vec:6a PCI-MSI         status=3D010 aff:{4}/{0-11}
>> > in-flight=3D0 d92:150(---)
>>
>> Was domain with ID 94 your OpenBSD box? There's another domain with
>> passthrough devices (ID 92).
>>
>> If your OpenBSD domain is the one with ID 94 it seems like the
>> interrupt source is masked, so no interrupts will be injected to the
>> guest.  That however might be just the response from the guest after
>> seeing that the interrupt source is not behaving correctly.
>>
>> Are yuo using a debug hypervisor? If not it would be helpful to do so,
>> in order to maybe get more information on `xl dmesg`.
>>
>> Can you also paste the QEMU log for the OpeNSD domain?  Those logs are
>> in /var/log/xen/qemu-dm-<domain name>.log, on most distros, not sure
>> if QubesOS puts them at the same place.
>>
>> Regards, Roger.
>>
>

--000000000000344bfe05e9176609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On, log section i Qubes manager also those logs are e=
mpty, but I can attach /var/log/xen/console/guest-openbsd-71-dm.log:</div><=
div>[2022-09-19 19:50:55] Logfile Opened<br>[2022-09-19 19:50:56] Linux ver=
sion 5.10.105-xen-stubdom (mockbuild@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc=
 (GCC) 10.3.1 20210422 (Red Hat 10.3.1-1), GNU ld version 2.34-6.fc32) #1 F=
ri Apr 22 17:53:39 CEST 2022<br>[2022-09-19 19:50:56] Command line: <br>[20=
22-09-19 19:50:56] x86/fpu: Supporting XSAVE feature 0x001: &#39;x87 floati=
ng point registers&#39;<br>[2022-09-19 19:50:56] x86/fpu: Supporting XSAVE =
feature 0x002: &#39;SSE registers&#39;<br>[2022-09-19 19:50:56] x86/fpu: Su=
pporting XSAVE feature 0x004: &#39;AVX registers&#39;<br>[2022-09-19 19:50:=
56] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_sizes[2]: =C2=A0256<br>[20=
22-09-19 19:50:56] x86/fpu: Enabled xstate features 0x7, context size is 83=
2 bytes, using &#39;standard&#39; format.<br>[2022-09-19 19:50:56] Released=
 0 page(s)<br>[2022-09-19 19:50:56] BIOS-provided physical RAM map:<br>[202=
2-09-19 19:50:56] Xen: [mem 0x0000000000000000-0x000000000009ffff] usable<b=
r>[2022-09-19 19:50:56] Xen: [mem 0x00000000000a0000-0x00000000000fffff] re=
served<br>[2022-09-19 19:50:56] Xen: [mem 0x0000000000100000-0x0000000008ff=
ffff] usable<br>[2022-09-19 19:50:56] NX (Execute Disable) protection: acti=
ve<br>[2022-09-19 19:50:56] Hypervisor detected: Xen PV<br>[2022-09-19 19:5=
0:56] tsc: Fast TSC calibration failed<br>[2022-09-19 19:50:56] tsc: Detect=
ed 2591.990 MHz processor<br>[2022-09-19 19:50:56] last_pfn =3D 0x9000 max_=
arch_pfn =3D 0x400000000<br>[2022-09-19 19:50:56] x86/PAT: Configuration [0=
-7]: WB =C2=A0WT =C2=A0UC- UC =C2=A0WC =C2=A0WP =C2=A0UC =C2=A0UC =C2=A0<br=
>[2022-09-19 19:50:56] RAMDISK: [mem 0x02000000-0x03f7afff]<br>[2022-09-19 =
19:50:56] Zone ranges:<br>[2022-09-19 19:50:56] =C2=A0 DMA32 =C2=A0 =C2=A0[=
mem 0x0000000000001000-0x0000000008ffffff]<br>[2022-09-19 19:50:56] =C2=A0 =
Normal =C2=A0 empty<br>[2022-09-19 19:50:56] Movable zone start for each no=
de<br>[2022-09-19 19:50:56] Early memory node ranges<br>[2022-09-19 19:50:5=
6] =C2=A0 node =C2=A0 0: [mem 0x0000000000001000-0x000000000009ffff]<br>[20=
22-09-19 19:50:56] =C2=A0 node =C2=A0 0: [mem 0x0000000000100000-0x00000000=
08ffffff]<br>[2022-09-19 19:50:56] Initmem setup node 0 [mem 0x000000000000=
1000-0x0000000008ffffff]<br>[2022-09-19 19:50:56] On node 0, zone DMA32: 1 =
pages in unavailable ranges<br>[2022-09-19 19:50:56] On node 0, zone DMA32:=
 96 pages in unavailable ranges<br>[2022-09-19 19:50:56] On node 0, zone DM=
A32: 28672 pages in unavailable ranges<br>[2022-09-19 19:50:56] p2m virtual=
 area at (____ptrval____), size is 200000<br>[2022-09-19 19:50:56] Remapped=
 0 page(s)<br>[2022-09-19 19:50:56] [mem 0x09000000-0xffffffff] available f=
or PCI devices<br>[2022-09-19 19:50:56] Booting paravirtualized kernel on X=
en<br>[2022-09-19 19:50:56] Xen version: 4.14.5 (preserve-AD)<br>[2022-09-1=
9 19:50:56] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 7645519600211568 ns<br>[2022-09-19 19:50:56] Built 1 z=
onelists, mobility grouping on.=C2=A0 Total pages: 36170<br>[2022-09-19 19:=
50:56] Kernel command line: clocksource=3Dtsc <br>[2022-09-19 19:50:56] Den=
try cache hash table entries: 32768 (order: 6, 262144 bytes, linear)<br>[20=
22-09-19 19:50:56] Inode-cache hash table entries: 16384 (order: 5, 131072 =
bytes, linear)<br>[2022-09-19 19:50:56] mem auto-init: stack:byref_all(zero=
), heap alloc:off, heap free:off<br>[2022-09-19 19:50:56] Memory: 96968K/14=
7068K available (6145K kernel code, 842K rwdata, 428K rodata, 696K init, 47=
6K bss, 49848K reserved, 0K cma-reserved)<br>[2022-09-19 19:50:56] random: =
get_random_u64 called from 0xffffffff810a0f18 with crng_init=3D0<br>[2022-0=
9-19 19:50:56] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1<br>[2022-09-19 19:50:56] Using NULL legacy PIC<br>[2022-09-19 19:5=
0:56] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0<br>[2022-09-19 19:50=
:56] xen:events: Using FIFO-based ABI<br>[2022-09-19 19:50:56] printk: cons=
ole [hvc0] enabled<br>[2022-09-19 19:50:56] clocksource: xen: mask: 0xfffff=
fffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns<br>[202=
2-09-19 19:50:56] installing Xen timer for CPU 0<br>[2022-09-19 19:50:56] c=
locksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x255cad98bda, =
max_idle_ns: 440795306906 ns<br>[2022-09-19 19:50:56] Calibrating delay loo=
p (skipped), value calculated using timer frequency.. 5183.98 BogoMIPS (lpj=
=3D10367960)<br>[2022-09-19 19:50:56] pid_max: default: 4096 minimum: 301<b=
r>[2022-09-19 19:50:56] Mount-cache hash table entries: 512 (order: 0, 4096=
 bytes, linear)<br>[2022-09-19 19:50:56] Mountpoint-cache hash table entrie=
s: 512 (order: 0, 4096 bytes, linear)<br>[2022-09-19 19:50:56] Last level i=
TLB entries: 4KB 64, 2MB 8, 4MB 8<br>[2022-09-19 19:50:56] Last level dTLB =
entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4<br>[2022-09-19 19:50:56] CPU: Intel(R)=
 Core(TM) i7-9750H CPU @ 2.60GHz (family: 0x6, model: 0x9e, stepping: 0xa)<=
br>[2022-09-19 19:50:56] Spectre V1 : Mitigation: usercopy/swapgs barriers =
and __user pointer sanitization<br>[2022-09-19 19:50:56] Spectre V2 : Mitig=
ation: Retpolines<br>[2022-09-19 19:50:56] Spectre V2 : Spectre v2 / Spectr=
eRSB mitigation: Filling RSB on context switch<br>[2022-09-19 19:50:56] Spe=
ctre V2 : Enabling Restricted Speculation for firmware calls<br>[2022-09-19=
 19:50:56] Spectre V2 : mitigation: Enabling conditional Indirect Branch Pr=
ediction Barrier<br>[2022-09-19 19:50:56] Speculative Store Bypass: Mitigat=
ion: Speculative Store Bypass disabled via prctl and seccomp<br>[2022-09-19=
 19:50:56] SRBDS: Unknown: Dependent on hypervisor status<br>[2022-09-19 19=
:50:56] MDS: Mitigation: Clear CPU buffers<br>[2022-09-19 19:50:56] Perform=
ance Events: unsupported p6 CPU model 158 no PMU driver, software events on=
ly.<br>[2022-09-19 19:50:56] devtmpfs: initialized<br>[2022-09-19 19:50:56]=
 clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns=
: 7645041785100000 ns<br>[2022-09-19 19:50:56] futex hash table entries: 16=
 (order: -4, 384 bytes, linear)<br>[2022-09-19 19:50:56] NET: Registered pr=
otocol family 16<br>[2022-09-19 19:50:56] xen:grant_table: Grant tables usi=
ng version 1 layout<br>[2022-09-19 19:50:56] Grant table initialized<br>[20=
22-09-19 19:50:56] PCI: setting up Xen PCI frontend stub<br>[2022-09-19 19:=
50:56] xen:balloon: Initialising balloon driver<br>[2022-09-19 19:50:56] us=
bcore: registered new interface driver usbfs<br>[2022-09-19 19:50:56] usbco=
re: registered new interface driver hub<br>[2022-09-19 19:50:56] usbcore: r=
egistered new device driver usb<br>[2022-09-19 19:50:56] PCI: System does n=
ot support PCI<br>[2022-09-19 19:50:56] clocksource: Switched to clocksourc=
e xen<br>[2022-09-19 19:50:56] NET: Registered protocol family 2<br>[2022-0=
9-19 19:50:56] IP idents hash table entries: 4096 (order: 3, 32768 bytes, l=
inear)<br>[2022-09-19 19:50:56] tcp_listen_portaddr_hash hash table entries=
: 256 (order: 0, 4096 bytes, linear)<br>[2022-09-19 19:50:56] TCP establish=
ed hash table entries: 2048 (order: 2, 16384 bytes, linear)<br>[2022-09-19 =
19:50:56] TCP bind hash table entries: 2048 (order: 2, 16384 bytes, linear)=
<br>[2022-09-19 19:50:56] TCP: Hash tables configured (established 2048 bin=
d 2048)<br>[2022-09-19 19:50:56] UDP hash table entries: 128 (order: 0, 409=
6 bytes, linear)<br>[2022-09-19 19:50:56] UDP-Lite hash table entries: 128 =
(order: 0, 4096 bytes, linear)<br>[2022-09-19 19:50:56] NET: Registered pro=
tocol family 1<br>[2022-09-19 19:50:56] Unpacking initramfs...<br>[2022-09-=
19 19:50:56] Freeing initrd memory: 32236K<br>[2022-09-19 19:50:56] clockso=
urce: tsc: mask: 0xffffffffffffffff max_cycles: 0x255cad98bda, max_idle_ns:=
 440795306906 ns<br>[2022-09-19 19:50:56] clocksource: Switched to clocksou=
rce tsc<br>[2022-09-19 19:50:56] workingset: timestamp_bits=3D62 max_order=
=3D15 bucket_order=3D0<br>[2022-09-19 19:50:56] xen:xen_evtchn: Event-chann=
el device installed<br>[2022-09-19 19:50:56] Invalid max_queues (4), will u=
se default max: 1.<br>[2022-09-19 19:50:56] tun: Universal TUN/TAP device d=
river, 1.6<br>[2022-09-19 19:50:56] xen_netfront: Initialising Xen virtual =
ethernet driver<br>[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: USB/IP Virtua=
l Host Controller<br>[2022-09-19 19:50:56] vhci_hcd vhci_hcd.0: new USB bus=
 registered, assigned bus number 1<br>[2022-09-19 19:50:56] vhci_hcd: creat=
ed sysfs vhci_hcd.0<br>[2022-09-19 19:50:56] hub 1-0:1.0: USB hub found<br>=
[2022-09-19 19:50:56] hub 1-0:1.0: 8 ports detected<br>[2022-09-19 19:50:56=
] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller<br>[2022-09-19 19:50:=
56] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 2<br>[=
2022-09-19 19:50:56] usb usb2: We don&#39;t know the algorithms for LPM for=
 this host, disabling LPM.<br>[2022-09-19 19:50:56] hub 2-0:1.0: USB hub fo=
und<br>[2022-09-19 19:50:56] hub 2-0:1.0: 8 ports detected<br>[2022-09-19 1=
9:50:56] NET: Registered protocol family 17<br>[2022-09-19 19:50:56] sched_=
clock: Marking stable (273283961, 179377)-&gt;(275136085, -1672747)<br>[202=
2-09-19 19:50:56] random: fast init done<br>[2022-09-19 19:50:56] blkfront:=
 xvda: flush diskcache: enabled; persistent grants: enabled; indirect descr=
iptors: enabled;<br>[2022-09-19 19:50:56] =C2=A0xvda: xvda4<br>[2022-09-19 =
19:50:56] blkfront: xvdb: flush diskcache: enabled; persistent grants: enab=
led; indirect descriptors: enabled;<br>[2022-09-19 19:50:56] blkfront: xvdc=
: flush diskcache: enabled; persistent grants: enabled; indirect descriptor=
s: enabled;<br>[2022-09-19 19:50:56] Freeing unused kernel image (initmem) =
memory: 696K<br>[2022-09-19 19:50:56] Write protecting the kernel read-only=
 data: 10240k<br>[2022-09-19 19:50:56] Freeing unused kernel image (text/ro=
data gap) memory: 2044K<br>[2022-09-19 19:50:56] Freeing unused kernel imag=
e (rodata/data gap) memory: 1620K<br>[2022-09-19 19:50:56] Run /init as ini=
t process<br>[2022-09-19 19:50:56] + mount -t devtmpfs none /dev<br>[2022-0=
9-19 19:50:56] + mount -t sysfs /sys /sys<br>[2022-09-19 19:50:56] + mount =
-t proc /proc /proc<br>[2022-09-19 19:50:56] + mount -t tmpfs -o &#39;size=
=3D1m,nodev,noexec&#39; /tmp /tmp<br>[2022-09-19 19:50:56] + mount -o remou=
nt,ro /<br>[2022-09-19 19:50:56] + echo 1<br>[2022-09-19 19:50:56] + printf=
 &#39;%d\n&#39; 1073741824<br>[2022-09-19 19:50:56] + /bin/xenstore-read ta=
rget<br>[2022-09-19 19:50:56] + domid=3D62<br>[2022-09-19 19:50:56] + xenst=
ore-read /local/domain/62/vm<br>[2022-09-19 19:50:56] + vm_path=3D/vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3<br>[2022-09-19 19:50:56] + sort<br>[2022-09=
-19 19:50:56] + xenstore-list -p /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/i=
mage/dm-argv<br>[2022-09-19 19:50:56] + xenstore-read /vm/53ce9bfa-8c06-458=
7-9b52-dcccd76169b3/image/dm-argv/001 /vm/53ce9bfa-8c06-4587-9b52-dcccd7616=
9b3/image/dm-argv/002 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-arg=
v/003 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/004 /vm/53ce9b=
fa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005 /vm/53ce9bfa-8c06-4587-9b5=
2-dcccd76169b3/image/dm-argv/006 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/i=
mage/dm-argv/007 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/008=
 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009 /vm/53ce9bfa-8c=
06-4587-9b52-dcccd76169b3/image/dm-argv/010 /vm/53ce9bfa-8c06-4587-9b52-dcc=
cd76169b3/image/dm-argv/011 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/=
dm-argv/012 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/013 /vm/=
53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014 /vm/53ce9bfa-8c06-45=
87-9b52-dcccd76169b3/image/dm-argv/015 /vm/53ce9bfa-8c06-4587-9b52-dcccd761=
69b3/image/dm-argv/016 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-ar=
gv/017 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/018 /vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019 /vm/53ce9bfa-8c06-4587-9b=
52-dcccd76169b3/image/dm-argv/020 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/=
image/dm-argv/021 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/02=
2 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023 /vm/53ce9bfa-8=
c06-4587-9b52-dcccd76169b3/image/dm-argv/024 /vm/53ce9bfa-8c06-4587-9b52-dc=
ccd76169b3/image/dm-argv/025 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image=
/dm-argv/026 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/027 /vm=
/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028 /vm/53ce9bfa-8c06-4=
587-9b52-dcccd76169b3/image/dm-argv/029 /vm/53ce9bfa-8c06-4587-9b52-dcccd76=
169b3/image/dm-argv/030 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-a=
rgv/031 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/032 /vm/53ce=
9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033<br>[2022-09-19 19:50:56]=
 + dm_args=3D&#39;-xen-domid<br>[2022-09-19 19:50:56] 62<br>[2022-09-19 19:=
50:56] -no-shutdown<br>[2022-09-19 19:50:56] -nodefaults<br>[2022-09-19 19:=
50:56] -no-user-config<br>[2022-09-19 19:50:56] -name<br>[2022-09-19 19:50:=
56] openbsd-71<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] n=
one<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] VGA,vgamem_mb=
=3D16<br>[2022-09-19 19:50:56] -boot<br>[2022-09-19 19:50:56] order=3Ddc<br=
>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-ehci,id=3Dehci<=
br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-tablet,bus=3D=
ehci.0<br>[2022-09-19 19:50:56] -smp<br>[2022-09-19 19:50:56] 2,maxcpus=3D2=
<br>[2022-09-19 19:50:56] -net<br>[2022-09-19 19:50:56] none<br>[2022-09-19=
 19:50:56] -display<br>[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=
=3D0<br>[2022-09-19 19:50:56] -machine<br>[2022-09-19 19:50:56] xenfv<br>[2=
022-09-19 19:50:56] -m<br>[2022-09-19 19:50:56] 496<br>[2022-09-19 19:50:56=
] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvda,if=3Dide,index=3D0,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -dr=
ive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddi=
sk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -drive<b=
r>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,fo=
rmat=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-19 19:50:56] + usb_ar=
gs=3D<br>[2022-09-19 19:50:56] + test -e /bin/qrexec-agent<br>[2022-09-19 1=
9:50:56] + usb_args=3D&#39;-device<br>[2022-09-19 19:50:56] nec-usb-xhci,id=
=3Dxhci&#39;<br>[2022-09-19 19:50:56] + mkdir -p /var/run/qubes<br>[2022-09=
-19 19:50:56] + touch /dev/mdev.log<br>[2022-09-19 19:50:56] + mdev -d<br>[=
2022-09-19 19:50:56] + USER=3Droot qrexec-agent<br>[2022-09-19 19:50:56] + =
sed -n &#39;/^-soundhw/ {n;p}&#39;<br>[2022-09-19 19:50:56] + echo &#39;-xe=
n-domid<br>[2022-09-19 19:50:56] 62<br>[2022-09-19 19:50:56] -no-shutdown<b=
r>[2022-09-19 19:50:56] -nodefaults<br>[2022-09-19 19:50:56] -no-user-confi=
g<br>[2022-09-19 19:50:56] -name<br>[2022-09-19 19:50:56] openbsd-71<br>[20=
22-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] none<br>[2022-09-19 19=
:50:56] -device<br>[2022-09-19 19:50:56] VGA,vgamem_mb=3D16<br>[2022-09-19 =
19:50:56] -boot<br>[2022-09-19 19:50:56] order=3Ddc<br>[2022-09-19 19:50:56=
] -device<br>[2022-09-19 19:50:56] usb-ehci,id=3Dehci<br>[2022-09-19 19:50:=
56] -device<br>[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.0<br>[2022-09-19=
 19:50:56] -smp<br>[2022-09-19 19:50:56] 2,maxcpus=3D2<br>[2022-09-19 19:50=
:56] -net<br>[2022-09-19 19:50:56] none<br>[2022-09-19 19:50:56] -display<b=
r>[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 19=
:50:56] -machine<br>[2022-09-19 19:50:56] xenfv<br>[2022-09-19 19:50:56] -m=
<br>[2022-09-19 19:50:56] 496<br>[2022-09-19 19:50:56] -drive<br>[2022-09-1=
9 19:50:56] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_=
device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:=
50:56] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_devic=
e,cache=3Dwriteback<br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56=
] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cac=
he=3Dwriteback&#39;<br>[2022-09-19 19:50:56] + audio_model=3D<br>[2022-09-1=
9 19:50:56] + &#39;[&#39; -n =C2=A0]<br>[2022-09-19 19:50:56] + sed -n /^-q=
ubes-net:/p<br>[2022-09-19 19:50:56] + echo &#39;-xen-domid<br>[2022-09-19 =
19:50:56] 62<br>[2022-09-19 19:50:56] -no-shutdown<br>[2022-09-19 19:50:56]=
 -nodefaults<br>[2022-09-19 19:50:56] -no-user-config<br>[2022-09-19 19:50:=
56] -name<br>[2022-09-19 19:50:56] openbsd-71<br>[2022-09-19 19:50:56] -dis=
play<br>[2022-09-19 19:50:56] none<br>[2022-09-19 19:50:56] -device<br>[202=
2-09-19 19:50:56] VGA,vgamem_mb=3D16<br>[2022-09-19 19:50:56] -boot<br>[202=
2-09-19 19:50:56] order=3Ddc<br>[2022-09-19 19:50:56] -device<br>[2022-09-1=
9 19:50:56] usb-ehci,id=3Dehci<br>[2022-09-19 19:50:56] -device<br>[2022-09=
-19 19:50:56] usb-tablet,bus=3Dehci.0<br>[2022-09-19 19:50:56] -smp<br>[202=
2-09-19 19:50:56] 2,maxcpus=3D2<br>[2022-09-19 19:50:56] -net<br>[2022-09-1=
9 19:50:56] none<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56]=
 qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 19:50:56] -machine<br>[20=
22-09-19 19:50:56] xenfv<br>[2022-09-19 19:50:56] -m<br>[2022-09-19 19:50:5=
6] 496<br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev=
/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwritebac=
k<br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb=
,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>=
[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=
=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<b=
r>[2022-09-19 19:50:56] + net_args=3D<br>[2022-09-19 19:50:56] + sed /^-qub=
es-net:/d<br>[2022-09-19 19:50:56] + echo &#39;-xen-domid<br>[2022-09-19 19=
:50:56] 62<br>[2022-09-19 19:50:56] -no-shutdown<br>[2022-09-19 19:50:56] -=
nodefaults<br>[2022-09-19 19:50:56] -no-user-config<br>[2022-09-19 19:50:56=
] -name<br>[2022-09-19 19:50:56] openbsd-71<br>[2022-09-19 19:50:56] -displ=
ay<br>[2022-09-19 19:50:56] none<br>[2022-09-19 19:50:56] -device<br>[2022-=
09-19 19:50:56] VGA,vgamem_mb=3D16<br>[2022-09-19 19:50:56] -boot<br>[2022-=
09-19 19:50:56] order=3Ddc<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 =
19:50:56] usb-ehci,id=3Dehci<br>[2022-09-19 19:50:56] -device<br>[2022-09-1=
9 19:50:56] usb-tablet,bus=3Dehci.0<br>[2022-09-19 19:50:56] -smp<br>[2022-=
09-19 19:50:56] 2,maxcpus=3D2<br>[2022-09-19 19:50:56] -net<br>[2022-09-19 =
19:50:56] none<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] q=
ubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 19:50:56] -machine<br>[2022=
-09-19 19:50:56] xenfv<br>[2022-09-19 19:50:56] -m<br>[2022-09-19 19:50:56]=
 496<br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/x=
vda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<=
br>[2022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb,i=
f=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2=
022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=3Di=
de,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2=
022-09-19 19:50:56] + dm_args=3D&#39;-xen-domid<br>[2022-09-19 19:50:56] 62=
<br>[2022-09-19 19:50:56] -no-shutdown<br>[2022-09-19 19:50:56] -nodefaults=
<br>[2022-09-19 19:50:56] -no-user-config<br>[2022-09-19 19:50:56] -name<br=
>[2022-09-19 19:50:56] openbsd-71<br>[2022-09-19 19:50:56] -display<br>[202=
2-09-19 19:50:56] none<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:5=
0:56] VGA,vgamem_mb=3D16<br>[2022-09-19 19:50:56] -boot<br>[2022-09-19 19:5=
0:56] order=3Ddc<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] =
usb-ehci,id=3Dehci<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56=
] usb-tablet,bus=3Dehci.0<br>[2022-09-19 19:50:56] -smp<br>[2022-09-19 19:5=
0:56] 2,maxcpus=3D2<br>[2022-09-19 19:50:56] -net<br>[2022-09-19 19:50:56] =
none<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] qubes-gui,d=
omid=3D0,log-level=3D0<br>[2022-09-19 19:50:56] -machine<br>[2022-09-19 19:=
50:56] xenfv<br>[2022-09-19 19:50:56] -m<br>[2022-09-19 19:50:56] 496<br>[2=
022-09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvda,if=3Di=
de,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-0=
9-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb,if=3Dide,in=
dex=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 =
19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=3Dide,index=
=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-1=
9 19:50:56] + test -e /sys/class/net/eth0<br>[2022-09-19 19:50:56] + echo &=
#39;No network interface named eth0.&#39;<br>[2022-09-19 19:50:56] No netwo=
rk interface named eth0.<br>[2022-09-19 19:50:56] + ls -l /sys/class/net/<b=
r>[2022-09-19 19:50:56] total 0<br>[2022-09-19 19:50:56] lrwxrwxrwx =C2=A0 =
=C2=A01 root =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 Sep 19 17:50 .[1;36mlo.[m -&gt; .[1;34m../../devices/virtual/ne=
t/lo.[m<br>[2022-09-19 19:50:56] + xenstore-read target<br>[2022-09-19 19:5=
0:56] + target=3D62<br>[2022-09-19 19:50:56] + device_model=3Ddevice-model/=
62<br>[2022-09-19 19:50:56] + mkdir /tmp/qmp<br>[2022-09-19 19:50:56] + ker=
nel=3D<br>[2022-09-19 19:50:56] + grep -q ^-append<br>[2022-09-19 19:50:56]=
 + echo &#39;-xen-domid<br>[2022-09-19 19:50:56] 62<br>[2022-09-19 19:50:56=
] -no-shutdown<br>[2022-09-19 19:50:56] -nodefaults<br>[2022-09-19 19:50:56=
] -no-user-config<br>[2022-09-19 19:50:56] -name<br>[2022-09-19 19:50:56] o=
penbsd-71<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] none<b=
r>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] VGA,vgamem_mb=3D16=
<br>[2022-09-19 19:50:56] -boot<br>[2022-09-19 19:50:56] order=3Ddc<br>[202=
2-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-ehci,id=3Dehci<br>[2=
022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-tablet,bus=3Dehci.=
0<br>[2022-09-19 19:50:56] -smp<br>[2022-09-19 19:50:56] 2,maxcpus=3D2<br>[=
2022-09-19 19:50:56] -net<br>[2022-09-19 19:50:56] none<br>[2022-09-19 19:5=
0:56] -display<br>[2022-09-19 19:50:56] qubes-gui,domid=3D0,log-level=3D0<b=
r>[2022-09-19 19:50:56] -machine<br>[2022-09-19 19:50:56] xenfv<br>[2022-09=
-19 19:50:56] -m<br>[2022-09-19 19:50:56] 496<br>[2022-09-19 19:50:56] -dri=
ve<br>[2022-09-19 19:50:56] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddis=
k,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -drive<br=
>[2022-09-19 19:50:56] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,for=
mat=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -drive<br>[202=
2-09-19 19:50:56] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=
=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-19 19:50:56] + mkfifo /tm=
p/qmp/<a href=3D"http://qemu.in">qemu.in</a> /tmp/qmp/qemu.out<br>[2022-09-=
19 19:50:56] + set +x<br>[2022-09-19 19:50:56] Clearing kmsg buffer...<br>[=
2022-09-19 19:50:56] + set +x<br>[2022-09-19 19:50:56] + set +x<br>[2022-09=
-19 19:50:56] + sed &#39;s/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/&#39;<br>[20=
22-09-19 19:50:56] + echo &#39;-xen-domid<br>[2022-09-19 19:50:56] 62<br>[2=
022-09-19 19:50:56] -no-shutdown<br>[2022-09-19 19:50:56] -nodefaults<br>[2=
022-09-19 19:50:56] -no-user-config<br>[2022-09-19 19:50:56] -name<br>[2022=
-09-19 19:50:56] openbsd-71<br>[2022-09-19 19:50:56] -display<br>[2022-09-1=
9 19:50:56] none<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] =
VGA,vgamem_mb=3D16<br>[2022-09-19 19:50:56] -boot<br>[2022-09-19 19:50:56] =
order=3Ddc<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-eh=
ci,id=3Dehci<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-=
tablet,bus=3Dehci.0<br>[2022-09-19 19:50:56] -smp<br>[2022-09-19 19:50:56] =
2,maxcpus=3D2<br>[2022-09-19 19:50:56] -net<br>[2022-09-19 19:50:56] none<b=
r>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] qubes-gui,domid=
=3D0,log-level=3D0<br>[2022-09-19 19:50:56] -machine<br>[2022-09-19 19:50:5=
6] xenfv<br>[2022-09-19 19:50:56] -m<br>[2022-09-19 19:50:56] 496<br>[2022-=
09-19 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvda,if=3Dide,i=
ndex=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19=
 19:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb,if=3Dide,index=
=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:=
50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=3Dide,index=3D2,=
media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-19 19:=
50:56] + dm_args=3D&#39;-xen-domid<br>[2022-09-19 19:50:56] 62<br>[2022-09-=
19 19:50:56] -no-shutdown<br>[2022-09-19 19:50:56] -nodefaults<br>[2022-09-=
19 19:50:56] -no-user-config<br>[2022-09-19 19:50:56] -name<br>[2022-09-19 =
19:50:56] openbsd-71<br>[2022-09-19 19:50:56] -display<br>[2022-09-19 19:50=
:56] none<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] VGA,vga=
mem_mb=3D16<br>[2022-09-19 19:50:56] -boot<br>[2022-09-19 19:50:56] order=
=3Ddc<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-ehci,id=
=3Dehci<br>[2022-09-19 19:50:56] -device<br>[2022-09-19 19:50:56] usb-table=
t,bus=3Dehci.0<br>[2022-09-19 19:50:56] -smp<br>[2022-09-19 19:50:56] 2,max=
cpus=3D2<br>[2022-09-19 19:50:56] -net<br>[2022-09-19 19:50:56] none<br>[20=
22-09-19 19:50:56] -display<br>[2022-09-19 19:50:56] qubes-gui,domid=3D0,lo=
g-level=3D0<br>[2022-09-19 19:50:56] -machine<br>[2022-09-19 19:50:56] xenf=
v<br>[2022-09-19 19:50:56] -m<br>[2022-09-19 19:50:56] 496<br>[2022-09-19 1=
9:50:56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvda,if=3Dide,index=3D=
0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:=
56] -drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdb,if=3Dide,index=3D1,med=
ia=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 19:50:56] -=
drive<br>[2022-09-19 19:50:56] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3D=
disk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-19 19:50:56] +=
 xenstore-read device/console/2<br>[2022-09-19 19:50:56] + xenstore-read de=
vice/console/1<br>[2022-09-19 19:50:57] + IFS=3D&#39;<br>[2022-09-19 19:50:=
57] &#39;<br>[2022-09-19 19:50:57] + set -f<br>[2022-09-19 19:50:57] + set =
+f<br>[2022-09-19 19:50:57] + unset IFS<br>[2022-09-19 19:50:57] + qemu_pid=
=3D171<br>[2022-09-19 19:50:57] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp =
]<br>[2022-09-19 19:50:57] + sleep 0.1<br>[2022-09-19 19:50:57] + qemu -san=
dbox &#39;on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resource=
control=3Ddeny&#39; -chardev &#39;pipe,path=3D/tmp/qmp/qemu,id=3Dm&#39; -mo=
n &#39;chardev=3Dm,mode=3Dcontrol&#39; -chardev &#39;socket,server,nowait,p=
ath=3D/tmp/qemu.qmp,id=3Dm2&#39; -mon &#39;chardev=3Dm2,mode=3Dcontrol&#39;=
 -xen-domid 62 -no-shutdown -nodefaults -no-user-config -name openbsd-71 -d=
isplay none -device &#39;VGA,vgamem_mb=3D16&#39; -boot &#39;order=3Ddc&#39;=
 -device &#39;usb-ehci,id=3Dehci&#39; -device &#39;usb-tablet,bus=3Dehci.0&=
#39; -smp &#39;2,maxcpus=3D2&#39; -net none -display &#39;qubes-gui,domid=
=3D0,log-level=3D0&#39; -machine xenfv -m 496 -drive &#39;file=3D/dev/xvda,=
if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;=
 -drive &#39;file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost=
_device,cache=3Dwriteback&#39; -drive &#39;file=3D/dev/xvdc,if=3Dide,index=
=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39; -device &#39;=
nec-usb-xhci,id=3Dxhci&#39;<br>[2022-09-19 19:50:57] qemu: -chardev socket,=
server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boolean opt=
ion &#39;server&#39; deprecated<br>[2022-09-19 19:50:57] Please use server=
=3Don instead<br>[2022-09-19 19:50:57] qemu: -chardev socket,server,nowait,=
path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boolean option &#39;nowai=
t&#39; deprecated<br>[2022-09-19 19:50:57] Please use wait=3Doff instead<br=
>[2022-09-19 19:50:57] random: qemu: uninitialized urandom read (16 bytes r=
ead)<br>[2022-09-19 19:50:57] + tee /proc/self/fd/2<br>[2022-09-19 19:50:57=
] + echo &#39;{&quot;execute&quot;: &quot;qmp_capabilities&quot;}&#39;<br>[=
2022-09-19 19:50:57] {&quot;QMP&quot;: {&quot;version&quot;: {&quot;qemu&qu=
ot;: {&quot;micro&quot;: 0, &quot;minor&quot;: 1, &quot;major&quot;: 6}, &q=
uot;package&quot;: &quot;&quot;}, &quot;capabilities&quot;: [&quot;oob&quot=
;]}}<br><br>[2022-09-19 19:50:57] {&quot;execute&quot;: &quot;qmp_capabilit=
ies&quot;}<br>[2022-09-19 19:50:57] qubes_gui/init: 573<br>[2022-09-19 19:5=
0:57] qubes_gui/init: 582<br>[2022-09-19 19:50:57] qubes_gui/init: 584<br>[=
2022-09-19 19:50:57] qubes_gui/init[611]: version sent, waiting for xorg co=
nf<br>[2022-09-19 19:50:57] {&quot;return&quot;: {}}<br><br>[2022-09-19 19:=
50:57] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<br>[2022-09-19 19:50:57=
] + &#39;[&#39; -e /proc/self/fd/4 ]<br>[2022-09-19 19:50:57] + &#39;[&#39;=
 -e /proc/self/fd/3 ]<br>[2022-09-19 19:50:57] + true<br>[2022-09-19 19:50:=
57] + printf &#39;=3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D\n&#39;<br=
>[2022-09-19 19:50:57] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D<br>[=
2022-09-19 19:50:57] + read<br>[2022-09-19 19:50:57] + vchan-socket-proxy 0=
 device-model/62/qmp-vchan /tmp/qemu.qmp<br>[2022-09-19 19:50:57] written 1=
10 bytes to vchan<br>[2022-09-19 19:50:57] written 34 bytes to vchan<br>[20=
22-09-19 19:50:57] written 34 bytes to vchan<br>[2022-09-19 19:50:57] qubes=
_gui/init[622]: got xorg conf, creating window<br>[2022-09-19 19:50:57] qub=
es_gui/init: 632<br>[2022-09-19 19:50:57] random: crng init done<br>[2022-0=
9-19 19:50:57] configure msg, x/y 600 365 (was 0 0), w/h 720 400<br>[2022-0=
9-19 20:03:09] {&quot;timestamp&quot;: {&quot;seconds&quot;: 1663610590, &q=
uot;microseconds&quot;: 147671}, &quot;event&quot;: &quot;RESET&quot;, &quo=
t;data&quot;: {&quot;guest&quot;: true, &quot;reason&quot;: &quot;guest-res=
et&quot;}}<br><br>[2022-09-19 20:03:09] {&quot;timestamp&quot;: {&quot;seco=
nds&quot;: 1663610590, &quot;microseconds&quot;: 148655}, &quot;event&quot;=
: &quot;RESET&quot;, &quot;data&quot;: {&quot;guest&quot;: true, &quot;reas=
on&quot;: &quot;guest-reset&quot;}}<br><br>[2022-09-19 20:25:36] Logfile Op=
ened<br>[2022-09-19 20:25:36] Linux version 5.10.105-xen-stubdom (mockbuild=
@0c9ad8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422 (Red Hat 10.3=
.1-1), GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST 2022<br>[202=
2-09-19 20:25:36] Command line: <br>[2022-09-19 20:25:36] x86/fpu: Supporti=
ng XSAVE feature 0x001: &#39;x87 floating point registers&#39;<br>[2022-09-=
19 20:25:36] x86/fpu: Supporting XSAVE feature 0x002: &#39;SSE registers&#3=
9;<br>[2022-09-19 20:25:36] x86/fpu: Supporting XSAVE feature 0x004: &#39;A=
VX registers&#39;<br>[2022-09-19 20:25:36] x86/fpu: xstate_offset[2]: =C2=
=A0576, xstate_sizes[2]: =C2=A0256<br>[2022-09-19 20:25:36] x86/fpu: Enable=
d xstate features 0x7, context size is 832 bytes, using &#39;standard&#39; =
format.<br>[2022-09-19 20:25:36] Released 0 page(s)<br>[2022-09-19 20:25:36=
] BIOS-provided physical RAM map:<br>[2022-09-19 20:25:36] Xen: [mem 0x0000=
000000000000-0x000000000009ffff] usable<br>[2022-09-19 20:25:36] Xen: [mem =
0x00000000000a0000-0x00000000000fffff] reserved<br>[2022-09-19 20:25:36] Xe=
n: [mem 0x0000000000100000-0x0000000008ffffff] usable<br>[2022-09-19 20:25:=
36] NX (Execute Disable) protection: active<br>[2022-09-19 20:25:36] Hyperv=
isor detected: Xen PV<br>[2022-09-19 20:25:36] tsc: Fast TSC calibration fa=
iled<br>[2022-09-19 20:25:36] tsc: Detected 2591.998 MHz processor<br>[2022=
-09-19 20:25:36] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000<br>[2022-=
09-19 20:25:36] x86/PAT: Configuration [0-7]: WB =C2=A0WT =C2=A0UC- UC =C2=
=A0WC =C2=A0WP =C2=A0UC =C2=A0UC =C2=A0<br>[2022-09-19 20:25:36] RAMDISK: [=
mem 0x02000000-0x03f7afff]<br>[2022-09-19 20:25:36] Zone ranges:<br>[2022-0=
9-19 20:25:36] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x0000000000001000-0x00000000=
08ffffff]<br>[2022-09-19 20:25:36] =C2=A0 Normal =C2=A0 empty<br>[2022-09-1=
9 20:25:36] Movable zone start for each node<br>[2022-09-19 20:25:36] Early=
 memory node ranges<br>[2022-09-19 20:25:36] =C2=A0 node =C2=A0 0: [mem 0x0=
000000000001000-0x000000000009ffff]<br>[2022-09-19 20:25:36] =C2=A0 node =
=C2=A0 0: [mem 0x0000000000100000-0x0000000008ffffff]<br>[2022-09-19 20:25:=
36] Initmem setup node 0 [mem 0x0000000000001000-0x0000000008ffffff]<br>[20=
22-09-19 20:25:36] On node 0, zone DMA32: 1 pages in unavailable ranges<br>=
[2022-09-19 20:25:36] On node 0, zone DMA32: 96 pages in unavailable ranges=
<br>[2022-09-19 20:25:36] On node 0, zone DMA32: 28672 pages in unavailable=
 ranges<br>[2022-09-19 20:25:36] p2m virtual area at (____ptrval____), size=
 is 200000<br>[2022-09-19 20:25:36] Remapped 0 page(s)<br>[2022-09-19 20:25=
:36] [mem 0x09000000-0xffffffff] available for PCI devices<br>[2022-09-19 2=
0:25:36] Booting paravirtualized kernel on Xen<br>[2022-09-19 20:25:36] Xen=
 version: 4.14.5 (preserve-AD)<br>[2022-09-19 20:25:36] clocksource: refine=
d-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600=
211568 ns<br>[2022-09-19 20:25:36] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 36170<br>[2022-09-19 20:25:36] Kernel command line: clo=
cksource=3Dtsc <br>[2022-09-19 20:25:36] Dentry cache hash table entries: 3=
2768 (order: 6, 262144 bytes, linear)<br>[2022-09-19 20:25:36] Inode-cache =
hash table entries: 16384 (order: 5, 131072 bytes, linear)<br>[2022-09-19 2=
0:25:36] mem auto-init: stack:byref_all(zero), heap alloc:off, heap free:of=
f<br>[2022-09-19 20:25:36] Memory: 96968K/147068K available (6145K kernel c=
ode, 842K rwdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K cma=
-reserved)<br>[2022-09-19 20:25:36] random: get_random_u64 called from 0xff=
ffffff810a0f18 with crng_init=3D0<br>[2022-09-19 20:25:36] SLUB: HWalign=3D=
64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1<br>[2022-09-19 20:25:3=
6] Using NULL legacy PIC<br>[2022-09-19 20:25:36] NR_IRQS: 4352, nr_irqs: 2=
4, preallocated irqs: 0<br>[2022-09-19 20:25:36] xen:events: Using FIFO-bas=
ed ABI<br>[2022-09-19 20:25:36] printk: console [hvc0] enabled<br>[2022-09-=
19 20:25:36] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42=
e4dffb, max_idle_ns: 881590591483 ns<br>[2022-09-19 20:25:36] installing Xe=
n timer for CPU 0<br>[2022-09-19 20:25:36] clocksource: tsc-early: mask: 0x=
ffffffffffffffff max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns<br=
>[2022-09-19 20:25:36] Calibrating delay loop (skipped), value calculated u=
sing timer frequency.. 5183.99 BogoMIPS (lpj=3D10367992)<br>[2022-09-19 20:=
25:36] pid_max: default: 4096 minimum: 301<br>[2022-09-19 20:25:36] Mount-c=
ache hash table entries: 512 (order: 0, 4096 bytes, linear)<br>[2022-09-19 =
20:25:36] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, l=
inear)<br>[2022-09-19 20:25:36] Last level iTLB entries: 4KB 64, 2MB 8, 4MB=
 8<br>[2022-09-19 20:25:36] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, =
1GB 4<br>[2022-09-19 20:25:36] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GH=
z (family: 0x6, model: 0x9e, stepping: 0xa)<br>[2022-09-19 20:25:36] Spectr=
e V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization=
<br>[2022-09-19 20:25:36] Spectre V2 : Mitigation: Retpolines<br>[2022-09-1=
9 20:25:36] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on=
 context switch<br>[2022-09-19 20:25:36] Spectre V2 : Enabling Restricted S=
peculation for firmware calls<br>[2022-09-19 20:25:36] Spectre V2 : mitigat=
ion: Enabling conditional Indirect Branch Prediction Barrier<br>[2022-09-19=
 20:25:36] Speculative Store Bypass: Mitigation: Speculative Store Bypass d=
isabled via prctl and seccomp<br>[2022-09-19 20:25:36] SRBDS: Unknown: Depe=
ndent on hypervisor status<br>[2022-09-19 20:25:36] MDS: Mitigation: Clear =
CPU buffers<br>[2022-09-19 20:25:36] Performance Events: unsupported p6 CPU=
 model 158 no PMU driver, software events only.<br>[2022-09-19 20:25:36] de=
vtmpfs: initialized<br>[2022-09-19 20:25:36] clocksource: jiffies: mask: 0x=
ffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[2022-=
09-19 20:25:36] futex hash table entries: 16 (order: -4, 384 bytes, linear)=
<br>[2022-09-19 20:25:36] NET: Registered protocol family 16<br>[2022-09-19=
 20:25:36] xen:grant_table: Grant tables using version 1 layout<br>[2022-09=
-19 20:25:36] Grant table initialized<br>[2022-09-19 20:25:36] PCI: setting=
 up Xen PCI frontend stub<br>[2022-09-19 20:25:36] xen:balloon: Initialisin=
g balloon driver<br>[2022-09-19 20:25:36] usbcore: registered new interface=
 driver usbfs<br>[2022-09-19 20:25:36] usbcore: registered new interface dr=
iver hub<br>[2022-09-19 20:25:36] usbcore: registered new device driver usb=
<br>[2022-09-19 20:25:36] PCI: System does not support PCI<br>[2022-09-19 2=
0:25:36] clocksource: Switched to clocksource xen<br>[2022-09-19 20:25:36] =
NET: Registered protocol family 2<br>[2022-09-19 20:25:36] IP idents hash t=
able entries: 4096 (order: 3, 32768 bytes, linear)<br>[2022-09-19 20:25:36]=
 tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, li=
near)<br>[2022-09-19 20:25:36] TCP established hash table entries: 2048 (or=
der: 2, 16384 bytes, linear)<br>[2022-09-19 20:25:36] TCP bind hash table e=
ntries: 2048 (order: 2, 16384 bytes, linear)<br>[2022-09-19 20:25:36] TCP: =
Hash tables configured (established 2048 bind 2048)<br>[2022-09-19 20:25:36=
] UDP hash table entries: 128 (order: 0, 4096 bytes, linear)<br>[2022-09-19=
 20:25:36] UDP-Lite hash table entries: 128 (order: 0, 4096 bytes, linear)<=
br>[2022-09-19 20:25:36] NET: Registered protocol family 1<br>[2022-09-19 2=
0:25:36] Unpacking initramfs...<br>[2022-09-19 20:25:36] Freeing initrd mem=
ory: 32236K<br>[2022-09-19 20:25:36] clocksource: tsc: mask: 0xffffffffffff=
ffff max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns<br>[2022-09-19=
 20:25:36] clocksource: Switched to clocksource tsc<br>[2022-09-19 20:25:36=
] workingset: timestamp_bits=3D62 max_order=3D15 bucket_order=3D0<br>[2022-=
09-19 20:25:36] xen:xen_evtchn: Event-channel device installed<br>[2022-09-=
19 20:25:36] Invalid max_queues (4), will use default max: 1.<br>[2022-09-1=
9 20:25:36] tun: Universal TUN/TAP device driver, 1.6<br>[2022-09-19 20:25:=
36] xen_netfront: Initialising Xen virtual ethernet driver<br>[2022-09-19 2=
0:25:36] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller<br>[2022-09-19=
 20:25:36] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number=
 1<br>[2022-09-19 20:25:36] vhci_hcd: created sysfs vhci_hcd.0<br>[2022-09-=
19 20:25:36] hub 1-0:1.0: USB hub found<br>[2022-09-19 20:25:36] hub 1-0:1.=
0: 8 ports detected<br>[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: USB/IP Vi=
rtual Host Controller<br>[2022-09-19 20:25:36] vhci_hcd vhci_hcd.0: new USB=
 bus registered, assigned bus number 2<br>[2022-09-19 20:25:36] usb usb2: W=
e don&#39;t know the algorithms for LPM for this host, disabling LPM.<br>[2=
022-09-19 20:25:36] hub 2-0:1.0: USB hub found<br>[2022-09-19 20:25:36] hub=
 2-0:1.0: 8 ports detected<br>[2022-09-19 20:25:36] NET: Registered protoco=
l family 17<br>[2022-09-19 20:25:36] sched_clock: Marking stable (269302379=
, 234771)-&gt;(271578343, -2041193)<br>[2022-09-19 20:25:36] random: fast i=
nit done<br>[2022-09-19 20:25:36] pcifront pci-0: Installing PCI frontend<b=
r>[2022-09-19 20:25:36] xen:swiotlb_xen: Warning: only able to allocate 4 M=
B for software IO TLB<br>[2022-09-19 20:25:36] software IO TLB: mapped [mem=
 0x0000000003800000-0x0000000003c00000] (4MB)<br>[2022-09-19 20:25:36] pcif=
ront pci-0: Creating PCI Frontend Bus 0000:00<br>[2022-09-19 20:25:36] pcif=
ront pci-0: PCI host bridge to bus 0000:00<br>[2022-09-19 20:25:36] pci_bus=
 0000:00: root bus resource [io =C2=A00x0000-0xffff]<br>[2022-09-19 20:25:3=
6] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]<br>[202=
2-09-19 20:25:36] pci_bus 0000:00: root bus resource [bus 00-ff]<br>[2022-0=
9-19 20:25:36] pci 0000:00:00.0: [10ec:8168] type 00 class 0x020000<br>[202=
2-09-19 20:25:36] pci 0000:00:00.0: reg 0x10: [io =C2=A00x3000-0x30ff]<br>[=
2022-09-19 20:25:36] pci 0000:00:00.0: reg 0x18: [mem 0xb4304000-0xb4304fff=
 64bit]<br>[2022-09-19 20:25:36] pci 0000:00:00.0: reg 0x20: [mem 0xb430000=
0-0xb4303fff 64bit]<br>[2022-09-19 20:25:36] pci 0000:00:00.0: supports D1 =
D2<br>[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/=
0<br>[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/2=
<br>[2022-09-19 20:25:36] pcifront pci-0: claiming resource 0000:00:00.0/4<=
br>[2022-09-19 20:25:36] blkfront: xvda: flush diskcache: enabled; persiste=
nt grants: enabled; indirect descriptors: enabled;<br>[2022-09-19 20:25:36]=
 =C2=A0xvda: xvda4<br>[2022-09-19 20:25:36] blkfront: xvdb: flush diskcache=
: enabled; persistent grants: enabled; indirect descriptors: enabled;<br>[2=
022-09-19 20:25:36] blkfront: xvdc: flush diskcache: enabled; persistent gr=
ants: enabled; indirect descriptors: enabled;<br>[2022-09-19 20:25:36] Free=
ing unused kernel image (initmem) memory: 696K<br>[2022-09-19 20:25:36] Wri=
te protecting the kernel read-only data: 10240k<br>[2022-09-19 20:25:36] Fr=
eeing unused kernel image (text/rodata gap) memory: 2044K<br>[2022-09-19 20=
:25:36] Freeing unused kernel image (rodata/data gap) memory: 1620K<br>[202=
2-09-19 20:25:36] Run /init as init process<br>[2022-09-19 20:25:36] + moun=
t -t devtmpfs none /dev<br>[2022-09-19 20:25:36] + mount -t sysfs /sys /sys=
<br>[2022-09-19 20:25:36] + mount -t proc /proc /proc<br>[2022-09-19 20:25:=
36] + mount -t tmpfs -o &#39;size=3D1m,nodev,noexec&#39; /tmp /tmp<br>[2022=
-09-19 20:25:36] + mount -o remount,ro /<br>[2022-09-19 20:25:36] + echo 1<=
br>[2022-09-19 20:25:36] + printf &#39;%d\n&#39; 1073741824<br>[2022-09-19 =
20:25:36] + /bin/xenstore-read target<br>[2022-09-19 20:25:36] + domid=3D12=
<br>[2022-09-19 20:25:36] + xenstore-read /local/domain/12/vm<br>[2022-09-1=
9 20:25:36] + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3<br>[2022-0=
9-19 20:25:36] + sort<br>[2022-09-19 20:25:36] + xenstore-list -p /vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv<br>[2022-09-19 20:25:36] + xe=
nstore-read /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001 /vm/=
53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/002 /vm/53ce9bfa-8c06-45=
87-9b52-dcccd76169b3/image/dm-argv/003 /vm/53ce9bfa-8c06-4587-9b52-dcccd761=
69b3/image/dm-argv/004 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-ar=
gv/005 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006 /vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/007 /vm/53ce9bfa-8c06-4587-9b=
52-dcccd76169b3/image/dm-argv/008 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/=
image/dm-argv/009 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/01=
0 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011 /vm/53ce9bfa-8=
c06-4587-9b52-dcccd76169b3/image/dm-argv/012 /vm/53ce9bfa-8c06-4587-9b52-dc=
ccd76169b3/image/dm-argv/013 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image=
/dm-argv/014 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015 /vm=
/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/016 /vm/53ce9bfa-8c06-4=
587-9b52-dcccd76169b3/image/dm-argv/017 /vm/53ce9bfa-8c06-4587-9b52-dcccd76=
169b3/image/dm-argv/018 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-a=
rgv/019 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020 /vm/53ce=
9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/021 /vm/53ce9bfa-8c06-4587-9=
b52-dcccd76169b3/image/dm-argv/022 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3=
/image/dm-argv/023 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/0=
24 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025 /vm/53ce9bfa-=
8c06-4587-9b52-dcccd76169b3/image/dm-argv/026 /vm/53ce9bfa-8c06-4587-9b52-d=
cccd76169b3/image/dm-argv/027 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/imag=
e/dm-argv/028 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029 /v=
m/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/030 /vm/53ce9bfa-8c06-=
4587-9b52-dcccd76169b3/image/dm-argv/031 /vm/53ce9bfa-8c06-4587-9b52-dcccd7=
6169b3/image/dm-argv/032 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-=
argv/033<br>[2022-09-19 20:25:36] + dm_args=3D&#39;-xen-domid<br>[2022-09-1=
9 20:25:36] 12<br>[2022-09-19 20:25:36] -no-shutdown<br>[2022-09-19 20:25:3=
6] -nodefaults<br>[2022-09-19 20:25:36] -no-user-config<br>[2022-09-19 20:2=
5:36] -name<br>[2022-09-19 20:25:36] openbsd-71<br>[2022-09-19 20:25:36] -d=
isplay<br>[2022-09-19 20:25:36] none<br>[2022-09-19 20:25:36] -device<br>[2=
022-09-19 20:25:36] VGA,vgamem_mb=3D16<br>[2022-09-19 20:25:36] -boot<br>[2=
022-09-19 20:25:36] order=3Ddc<br>[2022-09-19 20:25:36] -device<br>[2022-09=
-19 20:25:36] usb-ehci,id=3Dehci<br>[2022-09-19 20:25:36] -device<br>[2022-=
09-19 20:25:36] usb-tablet,bus=3Dehci.0<br>[2022-09-19 20:25:36] -smp<br>[2=
022-09-19 20:25:36] 2,maxcpus=3D2<br>[2022-09-19 20:25:36] -net<br>[2022-09=
-19 20:25:36] none<br>[2022-09-19 20:25:36] -display<br>[2022-09-19 20:25:3=
6] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 20:25:36] -machine<br>[=
2022-09-19 20:25:36] xenfv<br>[2022-09-19 20:25:36] -m<br>[2022-09-19 20:25=
:36] 496<br>[2022-09-19 20:25:36] -drive<br>[2022-09-19 20:25:36] file=3D/d=
ev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteb=
ack<br>[2022-09-19 20:25:36] -drive<br>[2022-09-19 20:25:36] file=3D/dev/xv=
db,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<b=
r>[2022-09-19 20:25:36] -drive<br>[2022-09-19 20:25:36] file=3D/dev/xvdc,if=
=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<b=
r>[2022-09-19 20:25:36] + usb_args=3D<br>[2022-09-19 20:25:36] + test -e /b=
in/qrexec-agent<br>[2022-09-19 20:25:36] + usb_args=3D&#39;-device<br>[2022=
-09-19 20:25:36] nec-usb-xhci,id=3Dxhci&#39;<br>[2022-09-19 20:25:36] + mkd=
ir -p /var/run/qubes<br>[2022-09-19 20:25:36] + touch /dev/mdev.log<br>[202=
2-09-19 20:25:36] + USER=3Droot qrexec-agent<br>[2022-09-19 20:25:36] + mde=
v -d<br>[2022-09-19 20:25:36] + sed -n &#39;/^-soundhw/ {n;p}&#39;<br>[2022=
-09-19 20:25:36] + echo &#39;-xen-domid<br>[2022-09-19 20:25:36] 12<br>[202=
2-09-19 20:25:36] -no-shutdown<br>[2022-09-19 20:25:36] -nodefaults<br>[202=
2-09-19 20:25:36] -no-user-config<br>[2022-09-19 20:25:36] -name<br>[2022-0=
9-19 20:25:36] openbsd-71<br>[2022-09-19 20:25:36] -display<br>[2022-09-19 =
20:25:36] none<br>[2022-09-19 20:25:36] -device<br>[2022-09-19 20:25:36] VG=
A,vgamem_mb=3D16<br>[2022-09-19 20:25:36] -boot<br>[2022-09-19 20:25:36] or=
der=3Ddc<br>[2022-09-19 20:25:36] -device<br>[2022-09-19 20:25:36] usb-ehci=
,id=3Dehci<br>[2022-09-19 20:25:36] -device<br>[2022-09-19 20:25:36] usb-ta=
blet,bus=3Dehci.0<br>[2022-09-19 20:25:36] -smp<br>[2022-09-19 20:25:36] 2,=
maxcpus=3D2<br>[2022-09-19 20:25:36] -net<br>[2022-09-19 20:25:36] none<br>=
[2022-09-19 20:25:36] -display<br>[2022-09-19 20:25:36] qubes-gui,domid=3D0=
,log-level=3D0<br>[2022-09-19 20:25:36] -machine<br>[2022-09-19 20:25:36] x=
enfv<br>[2022-09-19 20:25:36] -m<br>[2022-09-19 20:25:36] 496<br>[2022-09-1=
9 20:25:36] -drive<br>[2022-09-19 20:25:36] file=3D/dev/xvda,if=3Dide,index=
=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 20:=
25:36] -drive<br>[2022-09-19 20:25:36] file=3D/dev/xvdb,if=3Dide,index=3D1,=
media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 20:25:36=
] -drive<br>[2022-09-19 20:25:36] file=3D/dev/xvdc,if=3Dide,index=3D2,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-19 20:25:36=
] + audio_model=3D<br>[2022-09-19 20:25:36] + &#39;[&#39; -n =C2=A0]<br>[20=
22-09-19 20:25:36] + sed -n /^-qubes-net:/p<br>[2022-09-19 20:25:36] + echo=
 &#39;-xen-domid<br>[2022-09-19 20:25:36] 12<br>[2022-09-19 20:25:36] -no-s=
hutdown<br>[2022-09-19 20:25:36] -nodefaults<br>[2022-09-19 20:25:36] -no-u=
ser-config<br>[2022-09-19 20:25:36] -name<br>[2022-09-19 20:25:36] openbsd-=
71<br>[2022-09-19 20:25:36] -display<br>[2022-09-19 20:25:36] none<br>[2022=
-09-19 20:25:36] -device<br>[2022-09-19 20:25:36] VGA,vgamem_mb=3D16<br>[20=
22-09-19 20:25:36] -boot<br>[2022-09-19 20:25:36] order=3Ddc<br>[2022-09-19=
 20:25:36] -device<br>[2022-09-19 20:25:36] usb-ehci,id=3Dehci<br>[2022-09-=
19 20:25:36] -device<br>[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0<br>[2=
022-09-19 20:25:36] -smp<br>[2022-09-19 20:25:36] 2,maxcpus=3D2<br>[2022-09=
-19 20:25:36] -net<br>[2022-09-19 20:25:36] none<br>[2022-09-19 20:25:36] -=
display<br>[2022-09-19 20:25:36] qubes-gui,domid=3D0,log-level=3D0<br>[2022=
-09-19 20:25:36] -machine<br>[2022-09-19 20:25:36] xenfv<br>[2022-09-19 20:=
25:36] -m<br>[2022-09-19 20:25:36] 496<br>[2022-09-19 20:25:36] -drive<br>[=
2022-09-19 20:25:36] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,forma=
t=3Dhost_device,cache=3Dwriteback<br>[2022-09-19 20:25:36] -drive<br>[2022-=
09-19 20:25:36] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dh=
ost_device,cache=3Dwriteback<br>[2022-09-19 20:25:36] -drive<br>[2022-09-19=
 20:25:36] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_d=
evice,cache=3Dwriteback&#39;<br>[2022-09-19 20:25:36] + net_args=3D<br>[202=
2-09-19 20:25:36] + sed /^-qubes-net:/d<br>[2022-09-19 20:25:36] + echo &#3=
9;-xen-domid<br>[2022-09-19 20:25:36] 12<br>[2022-09-19 20:25:36] -no-shutd=
own<br>[2022-09-19 20:25:36] -nodefaults<br>[2022-09-19 20:25:36] -no-user-=
config<br>[2022-09-19 20:25:36] -name<br>[2022-09-19 20:25:36] openbsd-71<b=
r>[2022-09-19 20:25:36] -display<br>[2022-09-19 20:25:36] none<br>[2022-09-=
19 20:25:36] -device<br>[2022-09-19 20:25:36] VGA,vgamem_mb=3D16<br>[2022-0=
9-19 20:25:36] -boot<br>[2022-09-19 20:25:36] order=3Ddc<br>[2022-09-19 20:=
25:36] -device<br>[2022-09-19 20:25:36] usb-ehci,id=3Dehci<br>[2022-09-19 2=
0:25:36] -device<br>[2022-09-19 20:25:36] usb-tablet,bus=3Dehci.0<br>[2022-=
09-19 20:25:36] -smp<br>[2022-09-19 20:25:36] 2,maxcpus=3D2<br>[2022-09-19 =
20:25:36] -net<br>[2022-09-19 20:25:36] none<br>[2022-09-19 20:25:36] -disp=
lay<br>[2022-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-=
19 20:25:37] -machine<br>[2022-09-19 20:25:37] xenfv<br>[2022-09-19 20:25:3=
7] -m<br>[2022-09-19 20:25:37] 496<br>[2022-09-19 20:25:37] -drive<br>[2022=
-09-19 20:25:37] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3D=
host_device,cache=3Dwriteback<br>[2022-09-19 20:25:37] -drive<br>[2022-09-1=
9 20:25:37] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_=
device,cache=3Dwriteback<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:=
25:37] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_devic=
e,cache=3Dwriteback&#39;<br>[2022-09-19 20:25:37] + dm_args=3D&#39;-xen-dom=
id<br>[2022-09-19 20:25:37] 12<br>[2022-09-19 20:25:37] -no-shutdown<br>[20=
22-09-19 20:25:37] -nodefaults<br>[2022-09-19 20:25:37] -no-user-config<br>=
[2022-09-19 20:25:37] -name<br>[2022-09-19 20:25:37] openbsd-71<br>[2022-09=
-19 20:25:37] -display<br>[2022-09-19 20:25:37] none<br>[2022-09-19 20:25:3=
7] -device<br>[2022-09-19 20:25:37] VGA,vgamem_mb=3D16<br>[2022-09-19 20:25=
:37] -boot<br>[2022-09-19 20:25:37] order=3Ddc<br>[2022-09-19 20:25:37] -de=
vice<br>[2022-09-19 20:25:37] usb-ehci,id=3Dehci<br>[2022-09-19 20:25:37] -=
device<br>[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0<br>[2022-09-19 20:2=
5:37] -smp<br>[2022-09-19 20:25:37] 2,maxcpus=3D2<br>[2022-09-19 20:25:37] =
-net<br>[2022-09-19 20:25:37] none<br>[2022-09-19 20:25:37] -display<br>[20=
22-09-19 20:25:37] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 20:25:3=
7] -machine<br>[2022-09-19 20:25:37] xenfv<br>[2022-09-19 20:25:37] -m<br>[=
2022-09-19 20:25:37] 496<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:=
25:37] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_devic=
e,cache=3Dwriteback<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37=
] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cac=
he=3Dwriteback<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] fil=
e=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3D=
writeback&#39;<br>[2022-09-19 20:25:37] + test -e /sys/class/net/eth0<br>[2=
022-09-19 20:25:37] + echo &#39;No network interface named eth0.&#39;<br>[2=
022-09-19 20:25:37] No network interface named eth0.<br>[2022-09-19 20:25:3=
7] + ls -l /sys/class/net/<br>[2022-09-19 20:25:37] total 0<br>[2022-09-19 =
20:25:37] lrwxrwxrwx =C2=A0 =C2=A01 root =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 Sep 19 18:25 .[1;36mlo.[m -&gt; .[1=
;34m../../devices/virtual/net/lo.[m<br>[2022-09-19 20:25:37] + xenstore-rea=
d target<br>[2022-09-19 20:25:37] + target=3D12<br>[2022-09-19 20:25:37] + =
device_model=3Ddevice-model/12<br>[2022-09-19 20:25:37] + mkdir /tmp/qmp<br=
>[2022-09-19 20:25:37] + kernel=3D<br>[2022-09-19 20:25:37] + grep -q ^-app=
end<br>[2022-09-19 20:25:37] + echo &#39;-xen-domid<br>[2022-09-19 20:25:37=
] 12<br>[2022-09-19 20:25:37] -no-shutdown<br>[2022-09-19 20:25:37] -nodefa=
ults<br>[2022-09-19 20:25:37] -no-user-config<br>[2022-09-19 20:25:37] -nam=
e<br>[2022-09-19 20:25:37] openbsd-71<br>[2022-09-19 20:25:37] -display<br>=
[2022-09-19 20:25:37] none<br>[2022-09-19 20:25:37] -device<br>[2022-09-19 =
20:25:37] VGA,vgamem_mb=3D16<br>[2022-09-19 20:25:37] -boot<br>[2022-09-19 =
20:25:37] order=3Ddc<br>[2022-09-19 20:25:37] -device<br>[2022-09-19 20:25:=
37] usb-ehci,id=3Dehci<br>[2022-09-19 20:25:37] -device<br>[2022-09-19 20:2=
5:37] usb-tablet,bus=3Dehci.0<br>[2022-09-19 20:25:37] -smp<br>[2022-09-19 =
20:25:37] 2,maxcpus=3D2<br>[2022-09-19 20:25:37] -net<br>[2022-09-19 20:25:=
37] none<br>[2022-09-19 20:25:37] -display<br>[2022-09-19 20:25:37] qubes-g=
ui,domid=3D0,log-level=3D0<br>[2022-09-19 20:25:37] -machine<br>[2022-09-19=
 20:25:37] xenfv<br>[2022-09-19 20:25:37] -m<br>[2022-09-19 20:25:37] 496<b=
r>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/xvda,if=
=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[20=
22-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/xvdb,if=3Did=
e,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09=
-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/xvdc,if=3Dide,ind=
ex=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09=
-19 20:25:37] + mkfifo /tmp/qmp/<a href=3D"http://qemu.in">qemu.in</a> /tmp=
/qmp/qemu.out<br>[2022-09-19 20:25:37] + set +x<br>[2022-09-19 20:25:37] Cl=
earing kmsg buffer...<br>[2022-09-19 20:25:37] + set +x<br>[2022-09-19 20:2=
5:37] + set +x<br>[2022-09-19 20:25:37] + sed &#39;s/\$STUBDOM_RESTORE_INCO=
MING_ARG/fd:3/&#39;<br>[2022-09-19 20:25:37] + echo &#39;-xen-domid<br>[202=
2-09-19 20:25:37] 12<br>[2022-09-19 20:25:37] -no-shutdown<br>[2022-09-19 2=
0:25:37] -nodefaults<br>[2022-09-19 20:25:37] -no-user-config<br>[2022-09-1=
9 20:25:37] -name<br>[2022-09-19 20:25:37] openbsd-71<br>[2022-09-19 20:25:=
37] -display<br>[2022-09-19 20:25:37] none<br>[2022-09-19 20:25:37] -device=
<br>[2022-09-19 20:25:37] VGA,vgamem_mb=3D16<br>[2022-09-19 20:25:37] -boot=
<br>[2022-09-19 20:25:37] order=3Ddc<br>[2022-09-19 20:25:37] -device<br>[2=
022-09-19 20:25:37] usb-ehci,id=3Dehci<br>[2022-09-19 20:25:37] -device<br>=
[2022-09-19 20:25:37] usb-tablet,bus=3Dehci.0<br>[2022-09-19 20:25:37] -smp=
<br>[2022-09-19 20:25:37] 2,maxcpus=3D2<br>[2022-09-19 20:25:37] -net<br>[2=
022-09-19 20:25:37] none<br>[2022-09-19 20:25:37] -display<br>[2022-09-19 2=
0:25:37] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 20:25:37] -machin=
e<br>[2022-09-19 20:25:37] xenfv<br>[2022-09-19 20:25:37] -m<br>[2022-09-19=
 20:25:37] 496<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] fil=
e=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3D=
writeback<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/=
dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwrite=
back<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/x=
vdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&=
#39;<br>[2022-09-19 20:25:37] + dm_args=3D&#39;-xen-domid<br>[2022-09-19 20=
:25:37] 12<br>[2022-09-19 20:25:37] -no-shutdown<br>[2022-09-19 20:25:37] -=
nodefaults<br>[2022-09-19 20:25:37] -no-user-config<br>[2022-09-19 20:25:37=
] -name<br>[2022-09-19 20:25:37] openbsd-71<br>[2022-09-19 20:25:37] -displ=
ay<br>[2022-09-19 20:25:37] none<br>[2022-09-19 20:25:37] -device<br>[2022-=
09-19 20:25:37] VGA,vgamem_mb=3D16<br>[2022-09-19 20:25:37] -boot<br>[2022-=
09-19 20:25:37] order=3Ddc<br>[2022-09-19 20:25:37] -device<br>[2022-09-19 =
20:25:37] usb-ehci,id=3Dehci<br>[2022-09-19 20:25:37] -device<br>[2022-09-1=
9 20:25:37] usb-tablet,bus=3Dehci.0<br>[2022-09-19 20:25:37] -smp<br>[2022-=
09-19 20:25:37] 2,maxcpus=3D2<br>[2022-09-19 20:25:37] -net<br>[2022-09-19 =
20:25:37] none<br>[2022-09-19 20:25:37] -display<br>[2022-09-19 20:25:37] q=
ubes-gui,domid=3D0,log-level=3D0<br>[2022-09-19 20:25:37] -machine<br>[2022=
-09-19 20:25:37] xenfv<br>[2022-09-19 20:25:37] -m<br>[2022-09-19 20:25:37]=
 496<br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/x=
vda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<=
br>[2022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/xvdb,i=
f=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2=
022-09-19 20:25:37] -drive<br>[2022-09-19 20:25:37] file=3D/dev/xvdc,if=3Di=
de,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2=
022-09-19 20:25:37] + xenstore-read device/console/2<br>[2022-09-19 20:25:3=
7] + xenstore-read device/console/1<br>[2022-09-19 20:25:37] + IFS=3D&#39;<=
br>[2022-09-19 20:25:37] &#39;<br>[2022-09-19 20:25:37] + set -f<br>[2022-0=
9-19 20:25:37] + set +f<br>[2022-09-19 20:25:37] + unset IFS<br>[2022-09-19=
 20:25:37] + qemu_pid=3D130<br>[2022-09-19 20:25:37] + &#39;[&#39; &#39;!&#=
39; -e /tmp/qemu.qmp ]<br>[2022-09-19 20:25:37] + sleep 0.1<br>[2022-09-19 =
20:25:37] + qemu -sandbox &#39;on,obsolete=3Ddeny,elevateprivileges=3Ddeny,=
spawn=3Ddeny,resourcecontrol=3Ddeny&#39; -chardev &#39;pipe,path=3D/tmp/qmp=
/qemu,id=3Dm&#39; -mon &#39;chardev=3Dm,mode=3Dcontrol&#39; -chardev &#39;s=
ocket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2&#39; -mon &#39;chardev=3Dm=
2,mode=3Dcontrol&#39; -xen-domid 12 -no-shutdown -nodefaults -no-user-confi=
g -name openbsd-71 -display none -device &#39;VGA,vgamem_mb=3D16&#39; -boot=
 &#39;order=3Ddc&#39; -device &#39;usb-ehci,id=3Dehci&#39; -device &#39;usb=
-tablet,bus=3Dehci.0&#39; -smp &#39;2,maxcpus=3D2&#39; -net none -display &=
#39;qubes-gui,domid=3D0,log-level=3D0&#39; -machine xenfv -m 496 -drive &#3=
9;file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cac=
he=3Dwriteback&#39; -drive &#39;file=3D/dev/xvdb,if=3Dide,index=3D1,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39; -drive &#39;file=3D/dev=
/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwritebac=
k&#39; -device &#39;nec-usb-xhci,id=3Dxhci&#39;<br>[2022-09-19 20:25:37] qe=
mu: -chardev socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: sh=
ort-form boolean option &#39;server&#39; deprecated<br>[2022-09-19 20:25:37=
] Please use server=3Don instead<br>[2022-09-19 20:25:37] qemu: -chardev so=
cket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boolea=
n option &#39;nowait&#39; deprecated<br>[2022-09-19 20:25:37] Please use wa=
it=3Doff instead<br>[2022-09-19 20:25:37] + tee /proc/self/fd/2<br>[2022-09=
-19 20:25:37] + echo &#39;{&quot;execute&quot;: &quot;qmp_capabilities&quot=
;}&#39;<br>[2022-09-19 20:25:37] random: qemu: uninitialized urandom read (=
16 bytes read)<br>[2022-09-19 20:25:37] {&quot;execute&quot;: &quot;qmp_cap=
abilities&quot;}<br>[2022-09-19 20:25:37] {&quot;QMP&quot;: {&quot;version&=
quot;: {&quot;qemu&quot;: {&quot;micro&quot;: 0, &quot;minor&quot;: 1, &quo=
t;major&quot;: 6}, &quot;package&quot;: &quot;&quot;}, &quot;capabilities&q=
uot;: [&quot;oob&quot;]}}<br><br>[2022-09-19 20:25:37] qubes_gui/init: 573<=
br>[2022-09-19 20:25:37] qubes_gui/init: 582<br>[2022-09-19 20:25:37] qubes=
_gui/init: 584<br>[2022-09-19 20:25:37] qubes_gui/init[611]: version sent, =
waiting for xorg conf<br>[2022-09-19 20:25:37] {&quot;return&quot;: {}}<br>=
<br>[2022-09-19 20:25:37] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<br>[=
2022-09-19 20:25:37] + &#39;[&#39; -e /proc/self/fd/4 ]<br>[2022-09-19 20:2=
5:37] + &#39;[&#39; -e /proc/self/fd/3 ]<br>[2022-09-19 20:25:37] + true<br=
>[2022-09-19 20:25:37] + printf &#39;=3D=3D=3D=3D Press enter for shell =3D=
=3D=3D=3D\n&#39;<br>[2022-09-19 20:25:37] =3D=3D=3D=3D Press enter for shel=
l =3D=3D=3D=3D<br>[2022-09-19 20:25:37] + read<br>[2022-09-19 20:25:37] + v=
chan-socket-proxy 0 device-model/12/qmp-vchan /tmp/qemu.qmp<br>[2022-09-19 =
20:25:37] written 110 bytes to vchan<br>[2022-09-19 20:25:37] written 34 by=
tes to vchan<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_realize: Assigning r=
eal physical device 07:00.0 to devfn 0x30<br>[2022-09-19 20:25:37] [00:06.0=
] xen_pt_register_regions: IO region 0 registered (size=3D0x00000100 base_a=
ddr=3D0x00003000 type: 0x1)<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_regis=
ter_regions: IO region 2 registered (size=3D0x00001000 base_addr=3D0xb43040=
00 type: 0x4)<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_register_regions: I=
O region 4 registered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)<=
br>[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x000e mi=
smatch! Emulated=3D0x0080, host=3D0x0000, syncing to 0x0000.<br>[2022-09-19=
 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0010 mismatch! Emulat=
ed=3D0x0000, host=3D0x3001, syncing to 0x3001.<br>[2022-09-19 20:25:37] [00=
:06.0] xen_pt_config_reg_init: Offset 0x0018 mismatch! Emulated=3D0x0000, h=
ost=3D0xb4304004, syncing to 0xb4304004.<br>[2022-09-19 20:25:37] [00:06.0]=
 xen_pt_config_reg_init: Offset 0x0020 mismatch! Emulated=3D0x0000, host=3D=
0xb4300004, syncing to 0xb4300004.<br>[2022-09-19 20:25:37] [00:06.0] xen_p=
t_config_reg_init: Offset 0x0042 mismatch! Emulated=3D0x0000, host=3D0x07c3=
, syncing to 0x0603.<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_i=
nit: Offset 0x0052 mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0=
x0080.<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x=
0074 mismatch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.<b=
r>[2022-09-19 20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x007a mis=
match! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.<br>[2022-09-19 =
20:25:37] [00:06.0] xen_pt_config_reg_init: Offset 0x0082 mismatch! Emulate=
d=3D0x0000, host=3D0x1011, syncing to 0x1011.<br>[2022-09-19 20:25:37] [00:=
06.0] xen_pt_pci_intx: intx=3D1<br>[2022-09-19 20:25:37] [00:06.0] xen_pt_r=
ealize: Real physical device 07:00.0 registered successfully<br>[2022-09-19=
 20:25:37] written 34 bytes to vchan<br>[2022-09-19 20:25:37] written 2048 =
bytes to vchan<br>[2022-09-19 20:25:37] written 979 bytes to vchan<br>[2022=
-09-19 20:25:37] written 110 bytes to vchan<br>[2022-09-19 20:25:37] writte=
n 34 bytes to vchan<br>[2022-09-19 20:25:37] written 34 bytes to vchan<br>[=
2022-09-19 20:25:37] qubes_gui/init[622]: got xorg conf, creating window<br=
>[2022-09-19 20:25:37] qubes_gui/init: 632<br>[2022-09-19 20:25:37] configu=
re msg, x/y 640 325 (was 0 0), w/h 640 480<br>[2022-09-19 20:25:37] configu=
re msg, x/y 640 325 (was 640 325), w/h 640 480<br>[2022-09-19 20:25:37] ran=
dom: crng init done<br>[2022-09-19 20:25:39] qubes_gui: got unknown msg typ=
e 145, ignoring<br>[2022-09-19 20:25:57] [00:06.0] Write-back to unknown fi=
eld 0x44 (partially) inhibited (0x0000ffff)<br>[2022-09-19 20:25:57] [00:06=
.0] If the device doesn&#39;t work, try enabling permissive mode<br>[2022-0=
9-19 20:25:57] [00:06.0] (unsafe) and if it helps report the problem to xen=
-devel<br>[2022-09-19 20:25:57] [00:06.0] xen_pt_msgctrl_reg_write: setup M=
SI (register: 81).<br>[2022-09-19 20:25:57] [00:06.0] xen_pt_msi_setup: MSI=
 mapped with pirq 151.<br>[2022-09-19 20:25:57] [00:06.0] msi_msix_update: =
Updating MSI with pirq 151 gvec 0x72 gflags 0x0 (entry: 0x0)<br>[2022-09-19=
 20:27:19] qubes_gui: got unknown msg type 145, ignoring<br>[2022-09-19 21:=
48:58] {&quot;timestamp&quot;: {&quot;seconds&quot;: 1663616939, &quot;micr=
oseconds&quot;: 194886}, &quot;event&quot;: &quot;RESET&quot;, &quot;data&q=
uot;: {&quot;guest&quot;: true, &quot;reason&quot;: &quot;guest-reset&quot;=
}}<br><br>[2022-09-19 21:48:58] {&quot;timestamp&quot;: {&quot;seconds&quot=
;: 1663616939, &quot;microseconds&quot;: 196105}, &quot;event&quot;: &quot;=
RESET&quot;, &quot;data&quot;: {&quot;guest&quot;: true, &quot;reason&quot;=
: &quot;guest-reset&quot;}}<br><br>[2022-09-19 21:49:00] pcifront pci-0: Re=
scanning PCI Frontend Bus 0000:00<br>[2022-09-20 09:21:32] Logfile Opened<b=
r>[2022-09-20 09:21:33] Linux version 5.10.105-xen-stubdom (mockbuild@0c9ad=
8f2058f40c49bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422 (Red Hat 10.3.1-1),=
 GNU ld version 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST 2022<br>[2022-09-2=
0 09:21:33] Command line: <br>[2022-09-20 09:21:33] x86/fpu: Supporting XSA=
VE feature 0x001: &#39;x87 floating point registers&#39;<br>[2022-09-20 09:=
21:33] x86/fpu: Supporting XSAVE feature 0x002: &#39;SSE registers&#39;<br>=
[2022-09-20 09:21:33] x86/fpu: Supporting XSAVE feature 0x004: &#39;AVX reg=
isters&#39;<br>[2022-09-20 09:21:33] x86/fpu: xstate_offset[2]: =C2=A0576, =
xstate_sizes[2]: =C2=A0256<br>[2022-09-20 09:21:33] x86/fpu: Enabled xstate=
 features 0x7, context size is 832 bytes, using &#39;standard&#39; format.<=
br>[2022-09-20 09:21:33] Released 0 page(s)<br>[2022-09-20 09:21:33] BIOS-p=
rovided physical RAM map:<br>[2022-09-20 09:21:33] Xen: [mem 0x000000000000=
0000-0x000000000009ffff] usable<br>[2022-09-20 09:21:33] Xen: [mem 0x000000=
00000a0000-0x00000000000fffff] reserved<br>[2022-09-20 09:21:33] Xen: [mem =
0x0000000000100000-0x0000000008ffffff] usable<br>[2022-09-20 09:21:33] NX (=
Execute Disable) protection: active<br>[2022-09-20 09:21:33] Hypervisor det=
ected: Xen PV<br>[2022-09-20 09:21:33] tsc: Fast TSC calibration failed<br>=
[2022-09-20 09:21:33] tsc: Detected 2591.998 MHz processor<br>[2022-09-20 0=
9:21:33] last_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000<br>[2022-09-20 09=
:21:33] x86/PAT: Configuration [0-7]: WB =C2=A0WT =C2=A0UC- UC =C2=A0WC =C2=
=A0WP =C2=A0UC =C2=A0UC =C2=A0<br>[2022-09-20 09:21:33] RAMDISK: [mem 0x020=
00000-0x03f7afff]<br>[2022-09-20 09:21:33] Zone ranges:<br>[2022-09-20 09:2=
1:33] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x0000000000001000-0x0000000008ffffff]=
<br>[2022-09-20 09:21:33] =C2=A0 Normal =C2=A0 empty<br>[2022-09-20 09:21:3=
3] Movable zone start for each node<br>[2022-09-20 09:21:33] Early memory n=
ode ranges<br>[2022-09-20 09:21:33] =C2=A0 node =C2=A0 0: [mem 0x0000000000=
001000-0x000000000009ffff]<br>[2022-09-20 09:21:33] =C2=A0 node =C2=A0 0: [=
mem 0x0000000000100000-0x0000000008ffffff]<br>[2022-09-20 09:21:33] Initmem=
 setup node 0 [mem 0x0000000000001000-0x0000000008ffffff]<br>[2022-09-20 09=
:21:33] On node 0, zone DMA32: 1 pages in unavailable ranges<br>[2022-09-20=
 09:21:33] On node 0, zone DMA32: 96 pages in unavailable ranges<br>[2022-0=
9-20 09:21:33] On node 0, zone DMA32: 28672 pages in unavailable ranges<br>=
[2022-09-20 09:21:33] p2m virtual area at (____ptrval____), size is 200000<=
br>[2022-09-20 09:21:33] Remapped 0 page(s)<br>[2022-09-20 09:21:33] [mem 0=
x09000000-0xffffffff] available for PCI devices<br>[2022-09-20 09:21:33] Bo=
oting paravirtualized kernel on Xen<br>[2022-09-20 09:21:33] Xen version: 4=
.14.5 (preserve-AD)<br>[2022-09-20 09:21:33] clocksource: refined-jiffies: =
mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns<b=
r>[2022-09-20 09:21:33] Built 1 zonelists, mobility grouping on.=C2=A0 Tota=
l pages: 36170<br>[2022-09-20 09:21:33] Kernel command line: clocksource=3D=
tsc <br>[2022-09-20 09:21:33] Dentry cache hash table entries: 32768 (order=
: 6, 262144 bytes, linear)<br>[2022-09-20 09:21:33] Inode-cache hash table =
entries: 16384 (order: 5, 131072 bytes, linear)<br>[2022-09-20 09:21:33] me=
m auto-init: stack:byref_all(zero), heap alloc:off, heap free:off<br>[2022-=
09-20 09:21:33] Memory: 96968K/147068K available (6145K kernel code, 842K r=
wdata, 428K rodata, 696K init, 476K bss, 49848K reserved, 0K cma-reserved)<=
br>[2022-09-20 09:21:33] random: get_random_u64 called from 0xffffffff810a0=
f18 with crng_init=3D0<br>[2022-09-20 09:21:33] SLUB: HWalign=3D64, Order=
=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1<br>[2022-09-20 09:21:33] Using =
NULL legacy PIC<br>[2022-09-20 09:21:33] NR_IRQS: 4352, nr_irqs: 24, preall=
ocated irqs: 0<br>[2022-09-20 09:21:33] xen:events: Using FIFO-based ABI<br=
>[2022-09-20 09:21:33] printk: console [hvc0] enabled<br>[2022-09-20 09:21:=
33] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, m=
ax_idle_ns: 881590591483 ns<br>[2022-09-20 09:21:33] installing Xen timer f=
or CPU 0<br>[2022-09-20 09:21:33] clocksource: tsc-early: mask: 0xfffffffff=
fffffff max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns<br>[2022-09=
-20 09:21:33] Calibrating delay loop (skipped), value calculated using time=
r frequency.. 5183.99 BogoMIPS (lpj=3D10367992)<br>[2022-09-20 09:21:33] pi=
d_max: default: 4096 minimum: 301<br>[2022-09-20 09:21:33] Mount-cache hash=
 table entries: 512 (order: 0, 4096 bytes, linear)<br>[2022-09-20 09:21:33]=
 Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)<br=
>[2022-09-20 09:21:33] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8<br>[20=
22-09-20 09:21:33] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4<br>=
[2022-09-20 09:21:33] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz (family=
: 0x6, model: 0x9e, stepping: 0xa)<br>[2022-09-20 09:21:33] Spectre V1 : Mi=
tigation: usercopy/swapgs barriers and __user pointer sanitization<br>[2022=
-09-20 09:21:33] Spectre V2 : Mitigation: Retpolines<br>[2022-09-20 09:21:3=
3] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context =
switch<br>[2022-09-20 09:21:33] Spectre V2 : Enabling Restricted Speculatio=
n for firmware calls<br>[2022-09-20 09:21:33] Spectre V2 : mitigation: Enab=
ling conditional Indirect Branch Prediction Barrier<br>[2022-09-20 09:21:33=
] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled v=
ia prctl and seccomp<br>[2022-09-20 09:21:33] SRBDS: Unknown: Dependent on =
hypervisor status<br>[2022-09-20 09:21:33] MDS: Mitigation: Clear CPU buffe=
rs<br>[2022-09-20 09:21:33] Performance Events: unsupported p6 CPU model 15=
8 no PMU driver, software events only.<br>[2022-09-20 09:21:33] devtmpfs: i=
nitialized<br>[2022-09-20 09:21:33] clocksource: jiffies: mask: 0xffffffff =
max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[2022-09-20 09:=
21:33] futex hash table entries: 16 (order: -4, 384 bytes, linear)<br>[2022=
-09-20 09:21:33] NET: Registered protocol family 16<br>[2022-09-20 09:21:33=
] xen:grant_table: Grant tables using version 1 layout<br>[2022-09-20 09:21=
:33] Grant table initialized<br>[2022-09-20 09:21:33] PCI: setting up Xen P=
CI frontend stub<br>[2022-09-20 09:21:33] xen:balloon: Initialising balloon=
 driver<br>[2022-09-20 09:21:33] usbcore: registered new interface driver u=
sbfs<br>[2022-09-20 09:21:33] usbcore: registered new interface driver hub<=
br>[2022-09-20 09:21:33] usbcore: registered new device driver usb<br>[2022=
-09-20 09:21:33] PCI: System does not support PCI<br>[2022-09-20 09:21:33] =
clocksource: Switched to clocksource xen<br>[2022-09-20 09:21:33] NET: Regi=
stered protocol family 2<br>[2022-09-20 09:21:33] IP idents hash table entr=
ies: 4096 (order: 3, 32768 bytes, linear)<br>[2022-09-20 09:21:33] tcp_list=
en_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)<br>=
[2022-09-20 09:21:33] TCP established hash table entries: 2048 (order: 2, 1=
6384 bytes, linear)<br>[2022-09-20 09:21:33] TCP bind hash table entries: 2=
048 (order: 2, 16384 bytes, linear)<br>[2022-09-20 09:21:33] TCP: Hash tabl=
es configured (established 2048 bind 2048)<br>[2022-09-20 09:21:33] UDP has=
h table entries: 128 (order: 0, 4096 bytes, linear)<br>[2022-09-20 09:21:33=
] UDP-Lite hash table entries: 128 (order: 0, 4096 bytes, linear)<br>[2022-=
09-20 09:21:33] NET: Registered protocol family 1<br>[2022-09-20 09:21:33] =
Unpacking initramfs...<br>[2022-09-20 09:21:33] Freeing initrd memory: 3223=
6K<br>[2022-09-20 09:21:33] clocksource: tsc: mask: 0xffffffffffffffff max_=
cycles: 0x255cb518234, max_idle_ns: 440795279333 ns<br>[2022-09-20 09:21:33=
] clocksource: Switched to clocksource tsc<br>[2022-09-20 09:21:33] working=
set: timestamp_bits=3D62 max_order=3D15 bucket_order=3D0<br>[2022-09-20 09:=
21:33] xen:xen_evtchn: Event-channel device installed<br>[2022-09-20 09:21:=
33] Invalid max_queues (4), will use default max: 1.<br>[2022-09-20 09:21:3=
3] random: fast init done<br>[2022-09-20 09:21:33] tun: Universal TUN/TAP d=
evice driver, 1.6<br>[2022-09-20 09:21:33] xen_netfront: Initialising Xen v=
irtual ethernet driver<br>[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: USB/IP=
 Virtual Host Controller<br>[2022-09-20 09:21:33] vhci_hcd vhci_hcd.0: new =
USB bus registered, assigned bus number 1<br>[2022-09-20 09:21:33] vhci_hcd=
: created sysfs vhci_hcd.0<br>[2022-09-20 09:21:33] hub 1-0:1.0: USB hub fo=
und<br>[2022-09-20 09:21:33] hub 1-0:1.0: 8 ports detected<br>[2022-09-20 0=
9:21:33] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller<br>[2022-09-20=
 09:21:33] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number=
 2<br>[2022-09-20 09:21:33] usb usb2: We don&#39;t know the algorithms for =
LPM for this host, disabling LPM.<br>[2022-09-20 09:21:33] hub 2-0:1.0: USB=
 hub found<br>[2022-09-20 09:21:33] hub 2-0:1.0: 8 ports detected<br>[2022-=
09-20 09:21:33] NET: Registered protocol family 17<br>[2022-09-20 09:21:33]=
 sched_clock: Marking stable (439658149, 279138)-&gt;(442513139, -2575852)<=
br>[2022-09-20 09:21:33] pcifront pci-0: Installing PCI frontend<br>[2022-0=
9-20 09:21:33] xen:swiotlb_xen: Warning: only able to allocate 4 MB for sof=
tware IO TLB<br>[2022-09-20 09:21:33] software IO TLB: mapped [mem 0x000000=
0003800000-0x0000000003c00000] (4MB)<br>[2022-09-20 09:21:33] pcifront pci-=
0: Creating PCI Frontend Bus 0000:00<br>[2022-09-20 09:21:33] pcifront pci-=
0: PCI host bridge to bus 0000:00<br>[2022-09-20 09:21:33] pci_bus 0000:00:=
 root bus resource [io =C2=A00x0000-0xffff]<br>[2022-09-20 09:21:33] pci_bu=
s 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]<br>[2022-09-20 0=
9:21:33] pci_bus 0000:00: root bus resource [bus 00-ff]<br>[2022-09-20 09:2=
1:33] pci 0000:00:00.0: [10ec:8168] type 00 class 0x020000<br>[2022-09-20 0=
9:21:33] pci 0000:00:00.0: reg 0x10: [io =C2=A00x3000-0x30ff]<br>[2022-09-2=
0 09:21:33] pci 0000:00:00.0: reg 0x18: [mem 0xb4304000-0xb4304fff 64bit]<b=
r>[2022-09-20 09:21:33] pci 0000:00:00.0: reg 0x20: [mem 0xb4300000-0xb4303=
fff 64bit]<br>[2022-09-20 09:21:33] pci 0000:00:00.0: supports D1 D2<br>[20=
22-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/0<br>[202=
2-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/2<br>[2022=
-09-20 09:21:33] pcifront pci-0: claiming resource 0000:00:00.0/4<br>[2022-=
09-20 09:21:33] blkfront: xvda: flush diskcache: enabled; persistent grants=
: enabled; indirect descriptors: enabled;<br>[2022-09-20 09:21:33] =C2=A0xv=
da: xvda4<br>[2022-09-20 09:21:33] blkfront: xvdb: flush diskcache: enabled=
; persistent grants: enabled; indirect descriptors: enabled;<br>[2022-09-20=
 09:21:33] blkfront: xvdc: flush diskcache: enabled; persistent grants: ena=
bled; indirect descriptors: enabled;<br>[2022-09-20 09:21:33] Freeing unuse=
d kernel image (initmem) memory: 696K<br>[2022-09-20 09:21:33] Write protec=
ting the kernel read-only data: 10240k<br>[2022-09-20 09:21:33] Freeing unu=
sed kernel image (text/rodata gap) memory: 2044K<br>[2022-09-20 09:21:33] F=
reeing unused kernel image (rodata/data gap) memory: 1620K<br>[2022-09-20 0=
9:21:33] Run /init as init process<br>[2022-09-20 09:21:33] + mount -t devt=
mpfs none /dev<br>[2022-09-20 09:21:33] + mount -t sysfs /sys /sys<br>[2022=
-09-20 09:21:33] + mount -t proc /proc /proc<br>[2022-09-20 09:21:33] + mou=
nt -t tmpfs -o &#39;size=3D1m,nodev,noexec&#39; /tmp /tmp<br>[2022-09-20 09=
:21:33] + mount -o remount,ro /<br>[2022-09-20 09:21:33] + echo 1<br>[2022-=
09-20 09:21:33] + printf &#39;%d\n&#39; 1073741824<br>[2022-09-20 09:21:33]=
 + /bin/xenstore-read target<br>[2022-09-20 09:21:33] + domid=3D7<br>[2022-=
09-20 09:21:33] + xenstore-read /local/domain/7/vm<br>[2022-09-20 09:21:33]=
 + vm_path=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3<br>[2022-09-20 09:21:=
33] + sort<br>[2022-09-20 09:21:33] + xenstore-list -p /vm/53ce9bfa-8c06-45=
87-9b52-dcccd76169b3/image/dm-argv<br>[2022-09-20 09:21:33] + xenstore-read=
 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001 /vm/53ce9bfa-8c=
06-4587-9b52-dcccd76169b3/image/dm-argv/002 /vm/53ce9bfa-8c06-4587-9b52-dcc=
cd76169b3/image/dm-argv/003 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/=
dm-argv/004 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005 /vm/=
53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/006 /vm/53ce9bfa-8c06-45=
87-9b52-dcccd76169b3/image/dm-argv/007 /vm/53ce9bfa-8c06-4587-9b52-dcccd761=
69b3/image/dm-argv/008 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-ar=
gv/009 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010 /vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/011 /vm/53ce9bfa-8c06-4587-9b=
52-dcccd76169b3/image/dm-argv/012 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/=
image/dm-argv/013 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/01=
4 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015 /vm/53ce9bfa-8=
c06-4587-9b52-dcccd76169b3/image/dm-argv/016 /vm/53ce9bfa-8c06-4587-9b52-dc=
ccd76169b3/image/dm-argv/017 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image=
/dm-argv/018 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019 /vm=
/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/020 /vm/53ce9bfa-8c06-4=
587-9b52-dcccd76169b3/image/dm-argv/021 /vm/53ce9bfa-8c06-4587-9b52-dcccd76=
169b3/image/dm-argv/022 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-a=
rgv/023 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024 /vm/53ce=
9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/025 /vm/53ce9bfa-8c06-4587-9=
b52-dcccd76169b3/image/dm-argv/026 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3=
/image/dm-argv/027 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/0=
28 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029 /vm/53ce9bfa-=
8c06-4587-9b52-dcccd76169b3/image/dm-argv/030 /vm/53ce9bfa-8c06-4587-9b52-d=
cccd76169b3/image/dm-argv/031 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/imag=
e/dm-argv/032 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033<br=
>[2022-09-20 09:21:33] + dm_args=3D&#39;-xen-domid<br>[2022-09-20 09:21:33]=
 7<br>[2022-09-20 09:21:33] -no-shutdown<br>[2022-09-20 09:21:33] -nodefaul=
ts<br>[2022-09-20 09:21:33] -no-user-config<br>[2022-09-20 09:21:33] -name<=
br>[2022-09-20 09:21:33] openbsd-71<br>[2022-09-20 09:21:33] -display<br>[2=
022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09=
:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09:21:33] -boot<br>[2022-09-20 09=
:21:33] order=3Ddc<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33=
] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:=
33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 09:21:33] -smp<br>[2022-09-20 09=
:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:33] -net<br>[2022-09-20 09:21:33=
] none<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09:21:33] qubes-gui=
,domid=3D0,log-level=3D0<br>[2022-09-20 09:21:33] -machine<br>[2022-09-20 0=
9:21:33] xenfv<br>[2022-09-20 09:21:33] -m<br>[2022-09-20 09:21:33] 496<br>=
[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvda,if=
=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[20=
22-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdb,if=3Did=
e,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09=
-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdc,if=3Dide,ind=
ex=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09=
-20 09:21:33] + usb_args=3D<br>[2022-09-20 09:21:33] + test -e /bin/qrexec-=
agent<br>[2022-09-20 09:21:33] + usb_args=3D&#39;-device<br>[2022-09-20 09:=
21:33] nec-usb-xhci,id=3Dxhci&#39;<br>[2022-09-20 09:21:33] + mkdir -p /var=
/run/qubes<br>[2022-09-20 09:21:33] + touch /dev/mdev.log<br>[2022-09-20 09=
:21:33] + mdev -d<br>[2022-09-20 09:21:33] + USER=3Droot qrexec-agent<br>[2=
022-09-20 09:21:33] + sed -n &#39;/^-soundhw/ {n;p}&#39;<br>[2022-09-20 09:=
21:33] + echo &#39;-xen-domid<br>[2022-09-20 09:21:33] 7<br>[2022-09-20 09:=
21:33] -no-shutdown<br>[2022-09-20 09:21:33] -nodefaults<br>[2022-09-20 09:=
21:33] -no-user-config<br>[2022-09-20 09:21:33] -name<br>[2022-09-20 09:21:=
33] openbsd-71<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09:21:33] n=
one<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] VGA,vgamem_mb=
=3D16<br>[2022-09-20 09:21:33] -boot<br>[2022-09-20 09:21:33] order=3Ddc<br=
>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] usb-ehci,id=3Dehci<=
br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] usb-tablet,bus=3D=
ehci.0<br>[2022-09-20 09:21:33] -smp<br>[2022-09-20 09:21:33] 2,maxcpus=3D2=
<br>[2022-09-20 09:21:33] -net<br>[2022-09-20 09:21:33] none<br>[2022-09-20=
 09:21:33] -display<br>[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=
=3D0<br>[2022-09-20 09:21:33] -machine<br>[2022-09-20 09:21:33] xenfv<br>[2=
022-09-20 09:21:33] -m<br>[2022-09-20 09:21:33] 496<br>[2022-09-20 09:21:33=
] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvda,if=3Dide,index=3D0,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 09:21:33] -dr=
ive<br>[2022-09-20 09:21:33] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddi=
sk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 09:21:33] -drive<b=
r>[2022-09-20 09:21:33] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,fo=
rmat=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-20 09:21:33] + audio_=
model=3D<br>[2022-09-20 09:21:33] + &#39;[&#39; -n =C2=A0]<br>[2022-09-20 0=
9:21:33] + sed -n /^-qubes-net:/p<br>[2022-09-20 09:21:33] + echo &#39;-xen=
-domid<br>[2022-09-20 09:21:33] 7<br>[2022-09-20 09:21:33] -no-shutdown<br>=
[2022-09-20 09:21:33] -nodefaults<br>[2022-09-20 09:21:33] -no-user-config<=
br>[2022-09-20 09:21:33] -name<br>[2022-09-20 09:21:33] openbsd-71<br>[2022=
-09-20 09:21:33] -display<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:2=
1:33] -device<br>[2022-09-20 09:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09=
:21:33] -boot<br>[2022-09-20 09:21:33] order=3Ddc<br>[2022-09-20 09:21:33] =
-device<br>[2022-09-20 09:21:33] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33=
] -device<br>[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 0=
9:21:33] -smp<br>[2022-09-20 09:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:3=
3] -net<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -display<br>=
[2022-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 09:2=
1:33] -machine<br>[2022-09-20 09:21:33] xenfv<br>[2022-09-20 09:21:33] -m<b=
r>[2022-09-20 09:21:33] 496<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 =
09:21:33] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_de=
vice,cache=3Dwriteback<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21=
:33] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,=
cache=3Dwriteback<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] =
file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback&#39;<br>[2022-09-20 09:21:33] + net_args=3D<br>[2022-09-20 09:=
21:33] + sed /^-qubes-net:/d<br>[2022-09-20 09:21:33] + echo &#39;-xen-domi=
d<br>[2022-09-20 09:21:33] 7<br>[2022-09-20 09:21:33] -no-shutdown<br>[2022=
-09-20 09:21:33] -nodefaults<br>[2022-09-20 09:21:33] -no-user-config<br>[2=
022-09-20 09:21:33] -name<br>[2022-09-20 09:21:33] openbsd-71<br>[2022-09-2=
0 09:21:33] -display<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33]=
 -device<br>[2022-09-20 09:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09:21:3=
3] -boot<br>[2022-09-20 09:21:33] order=3Ddc<br>[2022-09-20 09:21:33] -devi=
ce<br>[2022-09-20 09:21:33] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33] -de=
vice<br>[2022-09-20 09:21:33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 09:21:=
33] -smp<br>[2022-09-20 09:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:33] -n=
et<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -display<br>[2022=
-09-20 09:21:33] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 09:21:33]=
 -machine<br>[2022-09-20 09:21:33] xenfv<br>[2022-09-20 09:21:33] -m<br>[20=
22-09-20 09:21:33] 496<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21=
:33] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,=
cache=3Dwriteback<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] =
file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=
=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dw=
riteback&#39;<br>[2022-09-20 09:21:33] + dm_args=3D&#39;-xen-domid<br>[2022=
-09-20 09:21:33] 7<br>[2022-09-20 09:21:33] -no-shutdown<br>[2022-09-20 09:=
21:33] -nodefaults<br>[2022-09-20 09:21:33] -no-user-config<br>[2022-09-20 =
09:21:33] -name<br>[2022-09-20 09:21:33] openbsd-71<br>[2022-09-20 09:21:33=
] -display<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -device<b=
r>[2022-09-20 09:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09:21:33] -boot<b=
r>[2022-09-20 09:21:33] order=3Ddc<br>[2022-09-20 09:21:33] -device<br>[202=
2-09-20 09:21:33] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33] -device<br>[2=
022-09-20 09:21:33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 09:21:33] -smp<b=
r>[2022-09-20 09:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:33] -net<br>[202=
2-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09:=
21:33] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 09:21:33] -machine<=
br>[2022-09-20 09:21:33] xenfv<br>[2022-09-20 09:21:33] -m<br>[2022-09-20 0=
9:21:33] 496<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=
=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dw=
riteback<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/d=
ev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteb=
ack<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xv=
dc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#=
39;<br>[2022-09-20 09:21:33] + test -e /sys/class/net/eth0<br>[2022-09-20 0=
9:21:33] + echo &#39;No network interface named eth0.&#39;<br>[2022-09-20 0=
9:21:33] No network interface named eth0.<br>[2022-09-20 09:21:33] + ls -l =
/sys/class/net/<br>[2022-09-20 09:21:33] total 0<br>[2022-09-20 09:21:33] l=
rwxrwxrwx =C2=A0 =C2=A01 root =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 Sep 20 07:21 .[1;36mlo.[m -&gt; .[1;34m../../d=
evices/virtual/net/lo.[m<br>[2022-09-20 09:21:33] + xenstore-read target<br=
>[2022-09-20 09:21:33] + target=3D7<br>[2022-09-20 09:21:33] + device_model=
=3Ddevice-model/7<br>[2022-09-20 09:21:33] + mkdir /tmp/qmp<br>[2022-09-20 =
09:21:33] + kernel=3D<br>[2022-09-20 09:21:33] + grep -q ^-append<br>[2022-=
09-20 09:21:33] + echo &#39;-xen-domid<br>[2022-09-20 09:21:33] 7<br>[2022-=
09-20 09:21:33] -no-shutdown<br>[2022-09-20 09:21:33] -nodefaults<br>[2022-=
09-20 09:21:33] -no-user-config<br>[2022-09-20 09:21:33] -name<br>[2022-09-=
20 09:21:33] openbsd-71<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09=
:21:33] none<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] VGA,=
vgamem_mb=3D16<br>[2022-09-20 09:21:33] -boot<br>[2022-09-20 09:21:33] orde=
r=3Ddc<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] usb-ehci,i=
d=3Dehci<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:33] usb-tabl=
et,bus=3Dehci.0<br>[2022-09-20 09:21:33] -smp<br>[2022-09-20 09:21:33] 2,ma=
xcpus=3D2<br>[2022-09-20 09:21:33] -net<br>[2022-09-20 09:21:33] none<br>[2=
022-09-20 09:21:33] -display<br>[2022-09-20 09:21:33] qubes-gui,domid=3D0,l=
og-level=3D0<br>[2022-09-20 09:21:33] -machine<br>[2022-09-20 09:21:33] xen=
fv<br>[2022-09-20 09:21:33] -m<br>[2022-09-20 09:21:33] 496<br>[2022-09-20 =
09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvda,if=3Dide,index=
=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 09:=
21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdb,if=3Dide,index=3D1,=
media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 09:21:33=
] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdc,if=3Dide,index=3D2,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-20 09:21:33=
] + mkfifo /tmp/qmp/<a href=3D"http://qemu.in">qemu.in</a> /tmp/qmp/qemu.ou=
t<br>[2022-09-20 09:21:33] + set +x<br>[2022-09-20 09:21:33] Clearing kmsg =
buffer...<br>[2022-09-20 09:21:33] + set +x<br>[2022-09-20 09:21:33] + set+=
 sed &#39;s/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/&#39;<br>[2022-09-20 09:21:=
33] =C2=A0+x<br>[2022-09-20 09:21:33] + echo &#39;-xen-domid<br>[2022-09-20=
 09:21:33] 7<br>[2022-09-20 09:21:33] -no-shutdown<br>[2022-09-20 09:21:33]=
 -nodefaults<br>[2022-09-20 09:21:33] -no-user-config<br>[2022-09-20 09:21:=
33] -name<br>[2022-09-20 09:21:33] openbsd-71<br>[2022-09-20 09:21:33] -dis=
play<br>[2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -device<br>[202=
2-09-20 09:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09:21:33] -boot<br>[202=
2-09-20 09:21:33] order=3Ddc<br>[2022-09-20 09:21:33] -device<br>[2022-09-2=
0 09:21:33] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33] -device<br>[2022-09=
-20 09:21:33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 09:21:33] -smp<br>[202=
2-09-20 09:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:33] -net<br>[2022-09-2=
0 09:21:33] none<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09:21:33]=
 qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 09:21:33] -machine<br>[20=
22-09-20 09:21:33] xenfv<br>[2022-09-20 09:21:33] -m<br>[2022-09-20 09:21:3=
3] 496<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev=
/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwritebac=
k<br>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdb=
,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>=
[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdc,if=
=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<b=
r>[2022-09-20 09:21:33] + dm_args=3D&#39;-xen-domid<br>[2022-09-20 09:21:33=
] 7<br>[2022-09-20 09:21:33] -no-shutdown<br>[2022-09-20 09:21:33] -nodefau=
lts<br>[2022-09-20 09:21:33] -no-user-config<br>[2022-09-20 09:21:33] -name=
<br>[2022-09-20 09:21:33] openbsd-71<br>[2022-09-20 09:21:33] -display<br>[=
2022-09-20 09:21:33] none<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 0=
9:21:33] VGA,vgamem_mb=3D16<br>[2022-09-20 09:21:33] -boot<br>[2022-09-20 0=
9:21:33] order=3Ddc<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21:3=
3] usb-ehci,id=3Dehci<br>[2022-09-20 09:21:33] -device<br>[2022-09-20 09:21=
:33] usb-tablet,bus=3Dehci.0<br>[2022-09-20 09:21:33] -smp<br>[2022-09-20 0=
9:21:33] 2,maxcpus=3D2<br>[2022-09-20 09:21:33] -net<br>[2022-09-20 09:21:3=
3] none<br>[2022-09-20 09:21:33] -display<br>[2022-09-20 09:21:33] qubes-gu=
i,domid=3D0,log-level=3D0<br>[2022-09-20 09:21:33] -machine<br>[2022-09-20 =
09:21:33] xenfv<br>[2022-09-20 09:21:33] -m<br>[2022-09-20 09:21:33] 496<br=
>[2022-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvda,if=
=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[20=
22-09-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdb,if=3Did=
e,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09=
-20 09:21:33] -drive<br>[2022-09-20 09:21:33] file=3D/dev/xvdc,if=3Dide,ind=
ex=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09=
-20 09:21:33] + xenstore-read device/console/2<br>[2022-09-20 09:21:33] + x=
enstore-read device/console/1<br>[2022-09-20 09:21:33] + IFS=3D&#39;<br>[20=
22-09-20 09:21:33] &#39;<br>[2022-09-20 09:21:33] + set -f<br>[2022-09-20 0=
9:21:33] + set +f<br>[2022-09-20 09:21:33] + unset IFS<br>[2022-09-20 09:21=
:33] + qemu_pid=3D72<br>[2022-09-20 09:21:33] + &#39;[&#39; &#39;!&#39; -e =
/tmp/qemu.qmp ]<br>[2022-09-20 09:21:33] + sleep 0.1<br>[2022-09-20 09:21:3=
3] + qemu -sandbox+ &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<br>[2022-09-=
20 09:21:33] + sleep 0.1<br>[2022-09-20 09:21:34] =C2=A0&#39;on,obsolete=3D=
deny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3Ddeny&#39; -cha=
rdev &#39;pipe,path=3D/tmp/qmp/qemu,id=3Dm&#39; -mon &#39;chardev=3Dm,mode=
=3Dcontrol&#39; -chardev &#39;socket,server,nowait,path=3D/tmp/qemu.qmp,id=
=3Dm2&#39; -mon &#39;chardev=3Dm2,mode=3Dcontrol&#39; -xen-domid 7 -no-shut=
down -nodefaults -no-user-config -name openbsd-71 -display none -device &#3=
9;VGA,vgamem_mb=3D16&#39; -boot &#39;order=3Ddc&#39; -device &#39;usb-ehci,=
id=3Dehci&#39; -device &#39;usb-tablet,bus=3Dehci.0&#39; -smp &#39;2,maxcpu=
s=3D2&#39; -net none -display &#39;qubes-gui,domid=3D0,log-level=3D0&#39; -=
machine xenfv -m 496 -drive &#39;file=3D/dev/xvda,if=3Dide,index=3D0,media=
=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39; -drive &#39;file=3D/dev=
/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwritebac=
k&#39; -drive &#39;file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=
=3Dhost_device,cache=3Dwriteback&#39; -device &#39;nec-usb-xhci,id=3Dxhci&#=
39;<br>[2022-09-20 09:21:34] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<b=
r>[2022-09-20 09:21:34] + sleep 0.1<br>[2022-09-20 09:21:34] qemu: -chardev=
 socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boo=
lean option &#39;server&#39; deprecated<br>[2022-09-20 09:21:34] Please use=
 server=3Don instead<br>[2022-09-20 09:21:34] qemu: -chardev socket,server,=
nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boolean option &#3=
9;nowait&#39; deprecated<br>[2022-09-20 09:21:34] Please use wait=3Doff ins=
tead<br>[2022-09-20 09:21:34] + tee /proc/self/fd/2<br>[2022-09-20 09:21:34=
] + echo &#39;{&quot;execute&quot;: &quot;qmp_capabilities&quot;}&#39;<br>[=
2022-09-20 09:21:34] {&quot;execute&quot;: &quot;qmp_capabilities&quot;}<br=
>[2022-09-20 09:21:34] random: qemu: uninitialized urandom read (16 bytes r=
ead)<br>[2022-09-20 09:21:34] {&quot;QMP&quot;: {&quot;version&quot;: {&quo=
t;qemu&quot;: {&quot;micro&quot;: 0, &quot;minor&quot;: 1, &quot;major&quot=
;: 6}, &quot;package&quot;: &quot;&quot;}, &quot;capabilities&quot;: [&quot=
;oob&quot;]}}<br><br>[2022-09-20 09:21:34] qubes_gui/init: 573<br>[2022-09-=
20 09:21:34] qubes_gui/init: 582<br>[2022-09-20 09:21:34] qubes_gui/init: 5=
84<br>[2022-09-20 09:21:34] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<br=
>[2022-09-20 09:21:34] + &#39;[&#39; -e /proc/self/fd/4 ]<br>[2022-09-20 09=
:21:34] + &#39;[&#39; -e /proc/self/fd/3 ]<br>[2022-09-20 09:21:34] + true<=
br>[2022-09-20 09:21:34] + printf &#39;=3D=3D=3D=3D Press enter for shell =
=3D=3D=3D=3D\n&#39;<br>[2022-09-20 09:21:34] =3D=3D=3D=3D Press enter for s=
hell =3D=3D=3D=3D<br>[2022-09-20 09:21:34] + read<br>[2022-09-20 09:21:34] =
+ vchan-socket-proxy 0 device-model/7/qmp-vchan /tmp/qemu.qmp<br>[2022-09-2=
0 09:21:34] qubes_gui/init[611]: version sent, waiting for xorg conf<br>[20=
22-09-20 09:21:34] {&quot;return&quot;: {}}<br><br>[2022-09-20 09:21:34] wr=
itten 110 bytes to vchan<br>[2022-09-20 09:21:34] written 34 bytes to vchan=
<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_realize: Assigning real physical=
 device 07:00.0 to devfn 0x30<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_reg=
ister_regions: IO region 0 registered (size=3D0x00000100 base_addr=3D0x0000=
3000 type: 0x1)<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_register_regions:=
 IO region 2 registered (size=3D0x00001000 base_addr=3D0xb4304000 type: 0x4=
)<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_register_regions: IO region 4 r=
egistered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)<br>[2022-09-=
20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x000e mismatch! Emul=
ated=3D0x0080, host=3D0x0000, syncing to 0x0000.<br>[2022-09-20 09:21:34] [=
00:06.0] xen_pt_config_reg_init: Offset 0x0010 mismatch! Emulated=3D0x0000,=
 host=3D0x3001, syncing to 0x3001.<br>[2022-09-20 09:21:34] [00:06.0] xen_p=
t_config_reg_init: Offset 0x0018 mismatch! Emulated=3D0x0000, host=3D0xb430=
4004, syncing to 0xb4304004.<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_conf=
ig_reg_init: Offset 0x0020 mismatch! Emulated=3D0x0000, host=3D0xb4300004, =
syncing to 0xb4300004.<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg=
_init: Offset 0x0042 mismatch! Emulated=3D0x0000, host=3D0x07c3, syncing to=
 0x0603.<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset =
0x0052 mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.<br>[2=
022-09-20 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x0074 mismatc=
h! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.<br>[2022-09-2=
0 09:21:34] [00:06.0] xen_pt_config_reg_init: Offset 0x007a mismatch! Emula=
ted=3D0x0000, host=3D0x0010, syncing to 0x0010.<br>[2022-09-20 09:21:34] [0=
0:06.0] xen_pt_config_reg_init: Offset 0x0082 mismatch! Emulated=3D0x0000, =
host=3D0x1011, syncing to 0x1011.<br>[2022-09-20 09:21:34] [00:06.0] xen_pt=
_pci_intx: intx=3D1<br>[2022-09-20 09:21:34] [00:06.0] xen_pt_realize: Real=
 physical device 07:00.0 registered successfully<br>[2022-09-20 09:21:34] w=
ritten 34 bytes to vchan<br>[2022-09-20 09:21:34] written 2048 bytes to vch=
an<br>[2022-09-20 09:21:34] written 979 bytes to vchan<br>[2022-09-20 09:21=
:34] written 110 bytes to vchan<br>[2022-09-20 09:21:34] written 34 bytes t=
o vchan<br>[2022-09-20 09:21:34] written 34 bytes to vchan<br>[2022-09-20 0=
9:21:34] qubes_gui/init[622]: got xorg conf, creating window<br>[2022-09-20=
 09:21:34] qubes_gui/init: 632<br>[2022-09-20 09:21:34] configure msg, x/y =
640 325 (was 0 0), w/h 640 480<br>[2022-09-20 09:21:34] configure msg, x/y =
640 325 (was 640 325), w/h 640 480<br>[2022-09-20 09:21:35] random: crng in=
it done<br>[2022-09-20 09:21:58] [00:06.0] Write-back to unknown field 0x44=
 (partially) inhibited (0x0000ffff)<br>[2022-09-20 09:21:58] [00:06.0] If t=
he device doesn&#39;t work, try enabling permissive mode<br>[2022-09-20 09:=
21:58] [00:06.0] (unsafe) and if it helps report the problem to xen-devel<b=
r>[2022-09-20 09:21:58] [00:06.0] xen_pt_msgctrl_reg_write: setup MSI (regi=
ster: 81).<br>[2022-09-20 09:21:58] [00:06.0] xen_pt_msi_setup: MSI mapped =
with pirq 151.<br>[2022-09-20 09:21:58] [00:06.0] msi_msix_update: Updating=
 MSI with pirq 151 gvec 0x72 gflags 0x0 (entry: 0x0)<br>[2022-09-20 09:31:1=
9] qubes_gui: got unknown msg type 145, ignoring<br>[2022-09-20 09:33:54] q=
ubes_gui: got unknown msg type 145, ignoring<br>[2022-09-20 09:42:36] {&quo=
t;timestamp&quot;: {&quot;seconds&quot;: 1663659756, &quot;microseconds&quo=
t;: 783476}, &quot;event&quot;: &quot;RESET&quot;, &quot;data&quot;: {&quot=
;guest&quot;: true, &quot;reason&quot;: &quot;guest-reset&quot;}}<br><br>[2=
022-09-20 09:42:36] {&quot;timestamp&quot;: {&quot;seconds&quot;: 166365975=
6, &quot;microseconds&quot;: 784673}, &quot;event&quot;: &quot;RESET&quot;,=
 &quot;data&quot;: {&quot;guest&quot;: true, &quot;reason&quot;: &quot;gues=
t-reset&quot;}}<br><br>[2022-09-20 09:42:38] pcifront pci-0: Rescanning PCI=
 Frontend Bus 0000:00<br>[2022-09-20 10:08:20] Logfile Opened<br>[2022-09-2=
0 10:08:20] Linux version 5.10.105-xen-stubdom (mockbuild@0c9ad8f2058f40c49=
bc934dcc2ea73c7) (gcc (GCC) 10.3.1 20210422 (Red Hat 10.3.1-1), GNU ld vers=
ion 2.34-6.fc32) #1 Fri Apr 22 17:53:39 CEST 2022<br>[2022-09-20 10:08:20] =
Command line: <br>[2022-09-20 10:08:20] x86/fpu: Supporting XSAVE feature 0=
x001: &#39;x87 floating point registers&#39;<br>[2022-09-20 10:08:20] x86/f=
pu: Supporting XSAVE feature 0x002: &#39;SSE registers&#39;<br>[2022-09-20 =
10:08:20] x86/fpu: Supporting XSAVE feature 0x004: &#39;AVX registers&#39;<=
br>[2022-09-20 10:08:20] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_sizes=
[2]: =C2=A0256<br>[2022-09-20 10:08:20] x86/fpu: Enabled xstate features 0x=
7, context size is 832 bytes, using &#39;standard&#39; format.<br>[2022-09-=
20 10:08:20] Released 0 page(s)<br>[2022-09-20 10:08:20] BIOS-provided phys=
ical RAM map:<br>[2022-09-20 10:08:20] Xen: [mem 0x0000000000000000-0x00000=
0000009ffff] usable<br>[2022-09-20 10:08:20] Xen: [mem 0x00000000000a0000-0=
x00000000000fffff] reserved<br>[2022-09-20 10:08:20] Xen: [mem 0x0000000000=
100000-0x0000000008ffffff] usable<br>[2022-09-20 10:08:20] NX (Execute Disa=
ble) protection: active<br>[2022-09-20 10:08:20] Hypervisor detected: Xen P=
V<br>[2022-09-20 10:08:20] tsc: Fast TSC calibration failed<br>[2022-09-20 =
10:08:20] tsc: Detected 2591.998 MHz processor<br>[2022-09-20 10:08:20] las=
t_pfn =3D 0x9000 max_arch_pfn =3D 0x400000000<br>[2022-09-20 10:08:20] x86/=
PAT: Configuration [0-7]: WB =C2=A0WT =C2=A0UC- UC =C2=A0WC =C2=A0WP =C2=A0=
UC =C2=A0UC =C2=A0<br>[2022-09-20 10:08:20] RAMDISK: [mem 0x02000000-0x03f7=
afff]<br>[2022-09-20 10:08:20] Zone ranges:<br>[2022-09-20 10:08:20] =C2=A0=
 DMA32 =C2=A0 =C2=A0[mem 0x0000000000001000-0x0000000008ffffff]<br>[2022-09=
-20 10:08:20] =C2=A0 Normal =C2=A0 empty<br>[2022-09-20 10:08:20] Movable z=
one start for each node<br>[2022-09-20 10:08:20] Early memory node ranges<b=
r>[2022-09-20 10:08:20] =C2=A0 node =C2=A0 0: [mem 0x0000000000001000-0x000=
000000009ffff]<br>[2022-09-20 10:08:20] =C2=A0 node =C2=A0 0: [mem 0x000000=
0000100000-0x0000000008ffffff]<br>[2022-09-20 10:08:20] Initmem setup node =
0 [mem 0x0000000000001000-0x0000000008ffffff]<br>[2022-09-20 10:08:20] On n=
ode 0, zone DMA32: 1 pages in unavailable ranges<br>[2022-09-20 10:08:20] O=
n node 0, zone DMA32: 96 pages in unavailable ranges<br>[2022-09-20 10:08:2=
0] On node 0, zone DMA32: 28672 pages in unavailable ranges<br>[2022-09-20 =
10:08:20] p2m virtual area at (____ptrval____), size is 200000<br>[2022-09-=
20 10:08:20] Remapped 0 page(s)<br>[2022-09-20 10:08:20] [mem 0x09000000-0x=
ffffffff] available for PCI devices<br>[2022-09-20 10:08:20] Booting paravi=
rtualized kernel on Xen<br>[2022-09-20 10:08:20] Xen version: 4.14.5 (prese=
rve-AD)<br>[2022-09-20 10:08:20] clocksource: refined-jiffies: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns<br>[2022-09-2=
0 10:08:20] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 361=
70<br>[2022-09-20 10:08:20] Kernel command line: clocksource=3Dtsc <br>[202=
2-09-20 10:08:20] Dentry cache hash table entries: 32768 (order: 6, 262144 =
bytes, linear)<br>[2022-09-20 10:08:20] Inode-cache hash table entries: 163=
84 (order: 5, 131072 bytes, linear)<br>[2022-09-20 10:08:20] mem auto-init:=
 stack:byref_all(zero), heap alloc:off, heap free:off<br>[2022-09-20 10:08:=
20] Memory: 96968K/147068K available (6145K kernel code, 842K rwdata, 428K =
rodata, 696K init, 476K bss, 49848K reserved, 0K cma-reserved)<br>[2022-09-=
20 10:08:20] random: get_random_u64 called from 0xffffffff810a0f18 with crn=
g_init=3D0<br>[2022-09-20 10:08:20] SLUB: HWalign=3D64, Order=3D0-3, MinObj=
ects=3D0, CPUs=3D1, Nodes=3D1<br>[2022-09-20 10:08:20] Using NULL legacy PI=
C<br>[2022-09-20 10:08:20] NR_IRQS: 4352, nr_irqs: 24, preallocated irqs: 0=
<br>[2022-09-20 10:08:20] xen:events: Using FIFO-based ABI<br>[2022-09-20 1=
0:08:20] printk: console [hvc0] enabled<br>[2022-09-20 10:08:20] clocksourc=
e: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 88=
1590591483 ns<br>[2022-09-20 10:08:20] installing Xen timer for CPU 0<br>[2=
022-09-20 10:08:20] clocksource: tsc-early: mask: 0xffffffffffffffff max_cy=
cles: 0x255cb518234, max_idle_ns: 440795279333 ns<br>[2022-09-20 10:08:20] =
Calibrating delay loop (skipped), value calculated using timer frequency.. =
5183.99 BogoMIPS (lpj=3D10367992)<br>[2022-09-20 10:08:20] pid_max: default=
: 4096 minimum: 301<br>[2022-09-20 10:08:20] Mount-cache hash table entries=
: 512 (order: 0, 4096 bytes, linear)<br>[2022-09-20 10:08:20] Mountpoint-ca=
che hash table entries: 512 (order: 0, 4096 bytes, linear)<br>[2022-09-20 1=
0:08:20] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8<br>[2022-09-20 10:08=
:20] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4<br>[2022-09-20 10=
:08:20] CPU: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz (family: 0x6, model: =
0x9e, stepping: 0xa)<br>[2022-09-20 10:08:20] Spectre V1 : Mitigation: user=
copy/swapgs barriers and __user pointer sanitization<br>[2022-09-20 10:08:2=
0] Spectre V2 : Mitigation: Retpolines<br>[2022-09-20 10:08:20] Spectre V2 =
: Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch<br>[202=
2-09-20 10:08:20] Spectre V2 : Enabling Restricted Speculation for firmware=
 calls<br>[2022-09-20 10:08:20] Spectre V2 : mitigation: Enabling condition=
al Indirect Branch Prediction Barrier<br>[2022-09-20 10:08:20] Speculative =
Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and s=
eccomp<br>[2022-09-20 10:08:20] SRBDS: Unknown: Dependent on hypervisor sta=
tus<br>[2022-09-20 10:08:20] MDS: Mitigation: Clear CPU buffers<br>[2022-09=
-20 10:08:20] Performance Events: unsupported p6 CPU model 158 no PMU drive=
r, software events only.<br>[2022-09-20 10:08:20] devtmpfs: initialized<br>=
[2022-09-20 10:08:20] clocksource: jiffies: mask: 0xffffffff max_cycles: 0x=
ffffffff, max_idle_ns: 7645041785100000 ns<br>[2022-09-20 10:08:20] futex h=
ash table entries: 16 (order: -4, 384 bytes, linear)<br>[2022-09-20 10:08:2=
0] NET: Registered protocol family 16<br>[2022-09-20 10:08:20] xen:grant_ta=
ble: Grant tables using version 1 layout<br>[2022-09-20 10:08:20] Grant tab=
le initialized<br>[2022-09-20 10:08:20] PCI: setting up Xen PCI frontend st=
ub<br>[2022-09-20 10:08:20] xen:balloon: Initialising balloon driver<br>[20=
22-09-20 10:08:20] usbcore: registered new interface driver usbfs<br>[2022-=
09-20 10:08:20] usbcore: registered new interface driver hub<br>[2022-09-20=
 10:08:20] usbcore: registered new device driver usb<br>[2022-09-20 10:08:2=
0] PCI: System does not support PCI<br>[2022-09-20 10:08:20] clocksource: S=
witched to clocksource xen<br>[2022-09-20 10:08:20] NET: Registered protoco=
l family 2<br>[2022-09-20 10:08:20] IP idents hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)<br>[2022-09-20 10:08:20] tcp_listen_portaddr_ha=
sh hash table entries: 256 (order: 0, 4096 bytes, linear)<br>[2022-09-20 10=
:08:20] TCP established hash table entries: 2048 (order: 2, 16384 bytes, li=
near)<br>[2022-09-20 10:08:20] TCP bind hash table entries: 2048 (order: 2,=
 16384 bytes, linear)<br>[2022-09-20 10:08:20] TCP: Hash tables configured =
(established 2048 bind 2048)<br>[2022-09-20 10:08:20] UDP hash table entrie=
s: 128 (order: 0, 4096 bytes, linear)<br>[2022-09-20 10:08:20] UDP-Lite has=
h table entries: 128 (order: 0, 4096 bytes, linear)<br>[2022-09-20 10:08:20=
] NET: Registered protocol family 1<br>[2022-09-20 10:08:20] Unpacking init=
ramfs...<br>[2022-09-20 10:08:20] Freeing initrd memory: 32236K<br>[2022-09=
-20 10:08:20] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x255c=
b518234, max_idle_ns: 440795279333 ns<br>[2022-09-20 10:08:20] clocksource:=
 Switched to clocksource tsc<br>[2022-09-20 10:08:20] workingset: timestamp=
_bits=3D62 max_order=3D15 bucket_order=3D0<br>[2022-09-20 10:08:20] xen:xen=
_evtchn: Event-channel device installed<br>[2022-09-20 10:08:20] Invalid ma=
x_queues (4), will use default max: 1.<br>[2022-09-20 10:08:21] random: fas=
t init done<br>[2022-09-20 10:08:21] tun: Universal TUN/TAP device driver, =
1.6<br>[2022-09-20 10:08:21] xen_netfront: Initialising Xen virtual etherne=
t driver<br>[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: USB/IP Virtual Host =
Controller<br>[2022-09-20 10:08:21] vhci_hcd vhci_hcd.0: new USB bus regist=
ered, assigned bus number 1<br>[2022-09-20 10:08:21] vhci_hcd: created sysf=
s vhci_hcd.0<br>[2022-09-20 10:08:21] hub 1-0:1.0: USB hub found<br>[2022-0=
9-20 10:08:21] hub 1-0:1.0: 8 ports detected<br>[2022-09-20 10:08:21] vhci_=
hcd vhci_hcd.0: USB/IP Virtual Host Controller<br>[2022-09-20 10:08:21] vhc=
i_hcd vhci_hcd.0: new USB bus registered, assigned bus number 2<br>[2022-09=
-20 10:08:21] usb usb2: We don&#39;t know the algorithms for LPM for this h=
ost, disabling LPM.<br>[2022-09-20 10:08:21] hub 2-0:1.0: USB hub found<br>=
[2022-09-20 10:08:21] hub 2-0:1.0: 8 ports detected<br>[2022-09-20 10:08:21=
] NET: Registered protocol family 17<br>[2022-09-20 10:08:21] sched_clock: =
Marking stable (312462849, 188928)-&gt;(314330248, -1678471)<br>[2022-09-20=
 10:08:21] pcifront pci-0: Installing PCI frontend<br>[2022-09-20 10:08:21]=
 xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB<b=
r>[2022-09-20 10:08:21] software IO TLB: mapped [mem 0x0000000003800000-0x0=
000000003c00000] (4MB)<br>[2022-09-20 10:08:21] pcifront pci-0: Creating PC=
I Frontend Bus 0000:00<br>[2022-09-20 10:08:21] pcifront pci-0: PCI host br=
idge to bus 0000:00<br>[2022-09-20 10:08:21] pci_bus 0000:00: root bus reso=
urce [io =C2=A00x0000-0xffff]<br>[2022-09-20 10:08:21] pci_bus 0000:00: roo=
t bus resource [mem 0x00000000-0x7fffffffff]<br>[2022-09-20 10:08:21] pci_b=
us 0000:00: root bus resource [bus 00-ff]<br>[2022-09-20 10:08:21] pci 0000=
:00:00.0: [10ec:8168] type 00 class 0x020000<br>[2022-09-20 10:08:21] pci 0=
000:00:00.0: reg 0x10: [io =C2=A00x3000-0x30ff]<br>[2022-09-20 10:08:21] pc=
i 0000:00:00.0: reg 0x18: [mem 0xb4304000-0xb4304fff 64bit]<br>[2022-09-20 =
10:08:21] pci 0000:00:00.0: reg 0x20: [mem 0xb4300000-0xb4303fff 64bit]<br>=
[2022-09-20 10:08:21] pci 0000:00:00.0: supports D1 D2<br>[2022-09-20 10:08=
:21] pcifront pci-0: claiming resource 0000:00:00.0/0<br>[2022-09-20 10:08:=
21] pcifront pci-0: claiming resource 0000:00:00.0/2<br>[2022-09-20 10:08:2=
1] pcifront pci-0: claiming resource 0000:00:00.0/4<br>[2022-09-20 10:08:21=
] blkfront: xvda: flush diskcache: enabled; persistent grants: enabled; ind=
irect descriptors: enabled;<br>[2022-09-20 10:08:21] =C2=A0xvda: xvda4<br>[=
2022-09-20 10:08:21] blkfront: xvdb: flush diskcache: enabled; persistent g=
rants: enabled; indirect descriptors: enabled;<br>[2022-09-20 10:08:21] blk=
front: xvdc: flush diskcache: enabled; persistent grants: enabled; indirect=
 descriptors: enabled;<br>[2022-09-20 10:08:21] Freeing unused kernel image=
 (initmem) memory: 696K<br>[2022-09-20 10:08:21] Write protecting the kerne=
l read-only data: 10240k<br>[2022-09-20 10:08:21] Freeing unused kernel ima=
ge (text/rodata gap) memory: 2044K<br>[2022-09-20 10:08:21] Freeing unused =
kernel image (rodata/data gap) memory: 1620K<br>[2022-09-20 10:08:21] Run /=
init as init process<br>[2022-09-20 10:08:21] + mount -t devtmpfs none /dev=
<br>[2022-09-20 10:08:21] + mount -t sysfs /sys /sys<br>[2022-09-20 10:08:2=
1] + mount -t proc /proc /proc<br>[2022-09-20 10:08:21] + mount -t tmpfs -o=
 &#39;size=3D1m,nodev,noexec&#39; /tmp /tmp<br>[2022-09-20 10:08:21] + moun=
t -o remount,ro /<br>[2022-09-20 10:08:21] + echo 1<br>[2022-09-20 10:08:21=
] + printf &#39;%d\n&#39; 1073741824<br>[2022-09-20 10:08:21] + /bin/xensto=
re-read target<br>[2022-09-20 10:08:21] + domid=3D19<br>[2022-09-20 10:08:2=
1] + xenstore-read /local/domain/19/vm<br>[2022-09-20 10:08:21] + vm_path=
=3D/vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3<br>[2022-09-20 10:08:21] + sort=
<br>[2022-09-20 10:08:21] + xenstore-list -p /vm/53ce9bfa-8c06-4587-9b52-dc=
ccd76169b3/image/dm-argv<br>[2022-09-20 10:08:21] + xenstore-read /vm/53ce9=
bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/001 /vm/53ce9bfa-8c06-4587-9b=
52-dcccd76169b3/image/dm-argv/002 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/=
image/dm-argv/003 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/00=
4 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/005 /vm/53ce9bfa-8=
c06-4587-9b52-dcccd76169b3/image/dm-argv/006 /vm/53ce9bfa-8c06-4587-9b52-dc=
ccd76169b3/image/dm-argv/007 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image=
/dm-argv/008 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/009 /vm=
/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/010 /vm/53ce9bfa-8c06-4=
587-9b52-dcccd76169b3/image/dm-argv/011 /vm/53ce9bfa-8c06-4587-9b52-dcccd76=
169b3/image/dm-argv/012 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-a=
rgv/013 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/014 /vm/53ce=
9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/015 /vm/53ce9bfa-8c06-4587-9=
b52-dcccd76169b3/image/dm-argv/016 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3=
/image/dm-argv/017 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/0=
18 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/019 /vm/53ce9bfa-=
8c06-4587-9b52-dcccd76169b3/image/dm-argv/020 /vm/53ce9bfa-8c06-4587-9b52-d=
cccd76169b3/image/dm-argv/021 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/imag=
e/dm-argv/022 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/023 /v=
m/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/024 /vm/53ce9bfa-8c06-=
4587-9b52-dcccd76169b3/image/dm-argv/025 /vm/53ce9bfa-8c06-4587-9b52-dcccd7=
6169b3/image/dm-argv/026 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-=
argv/027 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/028 /vm/53c=
e9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/029 /vm/53ce9bfa-8c06-4587-=
9b52-dcccd76169b3/image/dm-argv/030 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b=
3/image/dm-argv/031 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/=
032 /vm/53ce9bfa-8c06-4587-9b52-dcccd76169b3/image/dm-argv/033<br>[2022-09-=
20 10:08:21] + dm_args=3D&#39;-xen-domid<br>[2022-09-20 10:08:21] 19<br>[20=
22-09-20 10:08:21] -no-shutdown<br>[2022-09-20 10:08:21] -nodefaults<br>[20=
22-09-20 10:08:21] -no-user-config<br>[2022-09-20 10:08:21] -name<br>[2022-=
09-20 10:08:21] openbsd-71<br>[2022-09-20 10:08:21] -display<br>[2022-09-20=
 10:08:21] none<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] V=
GA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] -boot<br>[2022-09-20 10:08:21] o=
rder=3Ddc<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-ehc=
i,id=3Dehci<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-t=
ablet,bus=3Dehci.0<br>[2022-09-20 10:08:21] -smp<br>[2022-09-20 10:08:21] 2=
,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<br>[2022-09-20 10:08:21] none<br=
>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08:21] qubes-gui,domid=3D=
0,log-level=3D0<br>[2022-09-20 10:08:21] -machine<br>[2022-09-20 10:08:21] =
xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-09-20 10:08:21] 496<br>[2022-09-=
20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvda,if=3Dide,inde=
x=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10=
:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdb,if=3Dide,index=3D1=
,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:08:2=
1] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdc,if=3Dide,index=3D2,medi=
a=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-20 10:08:2=
1] + usb_args=3D<br>[2022-09-20 10:08:21] + test -e /bin/qrexec-agent<br>[2=
022-09-20 10:08:21] + usb_args=3D&#39;-device<br>[2022-09-20 10:08:21] nec-=
usb-xhci,id=3Dxhci&#39;<br>[2022-09-20 10:08:21] + mkdir -p /var/run/qubes<=
br>[2022-09-20 10:08:21] + touch /dev/mdev.log<br>[2022-09-20 10:08:21] + U=
SER=3Droot qrexec-agent<br>[2022-09-20 10:08:21] + mdev -d<br>[2022-09-20 1=
0:08:21] + sed -n &#39;/^-soundhw/ {n;p}&#39;<br>[2022-09-20 10:08:21] + ec=
ho &#39;-xen-domid<br>[2022-09-20 10:08:21] 19<br>[2022-09-20 10:08:21] -no=
-shutdown<br>[2022-09-20 10:08:21] -nodefaults<br>[2022-09-20 10:08:21] -no=
-user-config<br>[2022-09-20 10:08:21] -name<br>[2022-09-20 10:08:21] openbs=
d-71<br>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08:21] none<br>[20=
22-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] VGA,vgamem_mb=3D16<br>[=
2022-09-20 10:08:21] -boot<br>[2022-09-20 10:08:21] order=3Ddc<br>[2022-09-=
20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-ehci,id=3Dehci<br>[2022-0=
9-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0<br>=
[2022-09-20 10:08:21] -smp<br>[2022-09-20 10:08:21] 2,maxcpus=3D2<br>[2022-=
09-20 10:08:21] -net<br>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21]=
 -display<br>[2022-09-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0<br>[20=
22-09-20 10:08:21] -machine<br>[2022-09-20 10:08:21] xenfv<br>[2022-09-20 1=
0:08:21] -m<br>[2022-09-20 10:08:21] 496<br>[2022-09-20 10:08:21] -drive<br=
>[2022-09-20 10:08:21] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,for=
mat=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:08:21] -drive<br>[202=
2-09-20 10:08:21] file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=
=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:08:21] -drive<br>[2022-0=
9-20 10:08:21] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dho=
st_device,cache=3Dwriteback&#39;<br>[2022-09-20 10:08:21] + audio_model=3D<=
br>[2022-09-20 10:08:21] + &#39;[&#39; -n =C2=A0]<br>[2022-09-20 10:08:21] =
+ sed -n /^-qubes-net:/p<br>[2022-09-20 10:08:21] + echo &#39;-xen-domid<br=
>[2022-09-20 10:08:21] 19<br>[2022-09-20 10:08:21] -no-shutdown<br>[2022-09=
-20 10:08:21] -nodefaults<br>[2022-09-20 10:08:21] -no-user-config<br>[2022=
-09-20 10:08:21] -name<br>[2022-09-20 10:08:21] openbsd-71<br>[2022-09-20 1=
0:08:21] -display<br>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -d=
evice<br>[2022-09-20 10:08:21] VGA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] =
-boot<br>[2022-09-20 10:08:21] order=3Ddc<br>[2022-09-20 10:08:21] -device<=
br>[2022-09-20 10:08:21] usb-ehci,id=3Dehci<br>[2022-09-20 10:08:21] -devic=
e<br>[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0<br>[2022-09-20 10:08:21]=
 -smp<br>[2022-09-20 10:08:21] 2,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<=
br>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -display<br>[2022-09=
-20 10:08:21] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 10:08:21] -m=
achine<br>[2022-09-20 10:08:21] xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-=
09-20 10:08:21] 496<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21=
] file=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cac=
he=3Dwriteback<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] fil=
e=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3D=
writeback<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/=
dev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwrite=
back&#39;<br>[2022-09-20 10:08:21] + net_args=3D<br>[2022-09-20 10:08:21] +=
 sed /^-qubes-net:/d<br>[2022-09-20 10:08:21] + echo &#39;-xen-domid<br>[20=
22-09-20 10:08:21] 19<br>[2022-09-20 10:08:21] -no-shutdown<br>[2022-09-20 =
10:08:21] -nodefaults<br>[2022-09-20 10:08:21] -no-user-config<br>[2022-09-=
20 10:08:21] -name<br>[2022-09-20 10:08:21] openbsd-71<br>[2022-09-20 10:08=
:21] -display<br>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -devic=
e<br>[2022-09-20 10:08:21] VGA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] -boo=
t<br>[2022-09-20 10:08:21] order=3Ddc<br>[2022-09-20 10:08:21] -device<br>[=
2022-09-20 10:08:21] usb-ehci,id=3Dehci<br>[2022-09-20 10:08:21] -device<br=
>[2022-09-20 10:08:21] usb-tablet,bus=3Dehci.0<br>[2022-09-20 10:08:21] -sm=
p<br>[2022-09-20 10:08:21] 2,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<br>[=
2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -display<br>[2022-09-20 =
10:08:21] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 10:08:21] -machi=
ne<br>[2022-09-20 10:08:21] xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-09-2=
0 10:08:21] 496<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] fi=
le=3D/dev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=
=3Dwriteback<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=
=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dw=
riteback<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/d=
ev/xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteb=
ack&#39;<br>[2022-09-20 10:08:21] + dm_args=3D&#39;-xen-domid<br>[2022-09-2=
0 10:08:21] 19<br>[2022-09-20 10:08:21] -no-shutdown<br>[2022-09-20 10:08:2=
1] -nodefaults<br>[2022-09-20 10:08:21] -no-user-config<br>[2022-09-20 10:0=
8:21] -name<br>[2022-09-20 10:08:21] openbsd-71<br>[2022-09-20 10:08:21] -d=
isplay<br>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -device<br>[2=
022-09-20 10:08:21] VGA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] -boot<br>[2=
022-09-20 10:08:21] order=3Ddc<br>[2022-09-20 10:08:21] -device<br>[2022-09=
-20 10:08:21] usb-ehci,id=3Dehci<br>[2022-09-20 10:08:21] -device<br>[2022-=
09-20 10:08:21] usb-tablet,bus=3Dehci.0<br>[2022-09-20 10:08:21] -smp<br>[2=
022-09-20 10:08:21] 2,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<br>[2022-09=
-20 10:08:21] none<br>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08:2=
1] qubes-gui,domid=3D0,log-level=3D0<br>[2022-09-20 10:08:21] -machine<br>[=
2022-09-20 10:08:21] xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-09-20 10:08=
:21] 496<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/d=
ev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteb=
ack<br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xv=
db,if=3Dide,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<b=
r>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdc,if=
=3Dide,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<b=
r>[2022-09-20 10:08:21] + test -e /sys/class/net/eth0<br>[2022-09-20 10:08:=
21] + echo &#39;No network interface named eth0.&#39;<br>[2022-09-20 10:08:=
21] No network interface named eth0.<br>[2022-09-20 10:08:21] + ls -l /sys/=
class/net/<br>[2022-09-20 10:08:21] total 0<br>[2022-09-20 10:08:21] lrwxrw=
xrwx =C2=A0 =C2=A01 root =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 Sep 20 08:08 .[1;36mlo.[m -&gt; .[1;34m../../devices=
/virtual/net/lo.[m<br>[2022-09-20 10:08:21] + xenstore-read target<br>[2022=
-09-20 10:08:21] + target=3D19<br>[2022-09-20 10:08:21] + device_model=3Dde=
vice-model/19<br>[2022-09-20 10:08:21] + mkdir /tmp/qmp<br>[2022-09-20 10:0=
8:21] + kernel=3D<br>[2022-09-20 10:08:21] + grep -q ^-append<br>[2022-09-2=
0 10:08:21] + echo &#39;-xen-domid<br>[2022-09-20 10:08:21] 19<br>[2022-09-=
20 10:08:21] -no-shutdown<br>[2022-09-20 10:08:21] -nodefaults<br>[2022-09-=
20 10:08:21] -no-user-config<br>[2022-09-20 10:08:21] -name<br>[2022-09-20 =
10:08:21] openbsd-71<br>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08=
:21] none<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] VGA,vga=
mem_mb=3D16<br>[2022-09-20 10:08:21] -boot<br>[2022-09-20 10:08:21] order=
=3Ddc<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-ehci,id=
=3Dehci<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-table=
t,bus=3Dehci.0<br>[2022-09-20 10:08:21] -smp<br>[2022-09-20 10:08:21] 2,max=
cpus=3D2<br>[2022-09-20 10:08:21] -net<br>[2022-09-20 10:08:21] none<br>[20=
22-09-20 10:08:21] -display<br>[2022-09-20 10:08:21] qubes-gui,domid=3D0,lo=
g-level=3D0<br>[2022-09-20 10:08:21] -machine<br>[2022-09-20 10:08:21] xenf=
v<br>[2022-09-20 10:08:21] -m<br>[2022-09-20 10:08:21] 496<br>[2022-09-20 1=
0:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvda,if=3Dide,index=3D=
0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:08:=
21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdb,if=3Dide,index=3D1,med=
ia=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:08:21] -=
drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdc,if=3Dide,index=3D2,media=3D=
disk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-20 10:08:21] +=
 mkfifo /tmp/qmp/<a href=3D"http://qemu.in">qemu.in</a> /tmp/qmp/qemu.out<b=
r>[2022-09-20 10:08:21] + set +x<br>[2022-09-20 10:08:21] Clearing kmsg buf=
fer...<br>[2022-09-20 10:08:21] + set +x<br>[2022-09-20 10:08:21] + set +x<=
br>[2022-09-20 10:08:21] + sed &#39;s/\$STUBDOM_RESTORE_INCOMING_ARG/fd:3/&=
#39;<br>[2022-09-20 10:08:21] + echo &#39;-xen-domid<br>[2022-09-20 10:08:2=
1] 19<br>[2022-09-20 10:08:21] -no-shutdown<br>[2022-09-20 10:08:21] -nodef=
aults<br>[2022-09-20 10:08:21] -no-user-config<br>[2022-09-20 10:08:21] -na=
me<br>[2022-09-20 10:08:21] openbsd-71<br>[2022-09-20 10:08:21] -display<br=
>[2022-09-20 10:08:21] none<br>[2022-09-20 10:08:21] -device<br>[2022-09-20=
 10:08:21] VGA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] -boot<br>[2022-09-20=
 10:08:21] order=3Ddc<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08=
:21] usb-ehci,id=3Dehci<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:=
08:21] usb-tablet,bus=3Dehci.0<br>[2022-09-20 10:08:21] -smp<br>[2022-09-20=
 10:08:21] 2,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<br>[2022-09-20 10:08=
:21] none<br>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08:21] qubes-=
gui,domid=3D0,log-level=3D0<br>[2022-09-20 10:08:21] -machine<br>[2022-09-2=
0 10:08:21] xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-09-20 10:08:21] 496<=
br>[2022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvda,i=
f=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2=
022-09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdb,if=3Di=
de,index=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-0=
9-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdc,if=3Dide,in=
dex=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-0=
9-20 10:08:21] + dm_args=3D&#39;-xen-domid<br>[2022-09-20 10:08:21] 19<br>[=
2022-09-20 10:08:21] -no-shutdown<br>[2022-09-20 10:08:21] -nodefaults<br>[=
2022-09-20 10:08:21] -no-user-config<br>[2022-09-20 10:08:21] -name<br>[202=
2-09-20 10:08:21] openbsd-71<br>[2022-09-20 10:08:21] -display<br>[2022-09-=
20 10:08:21] none<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21]=
 VGA,vgamem_mb=3D16<br>[2022-09-20 10:08:21] -boot<br>[2022-09-20 10:08:21]=
 order=3Ddc<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb-e=
hci,id=3Dehci<br>[2022-09-20 10:08:21] -device<br>[2022-09-20 10:08:21] usb=
-tablet,bus=3Dehci.0<br>[2022-09-20 10:08:21] -smp<br>[2022-09-20 10:08:21]=
 2,maxcpus=3D2<br>[2022-09-20 10:08:21] -net<br>[2022-09-20 10:08:21] none<=
br>[2022-09-20 10:08:21] -display<br>[2022-09-20 10:08:21] qubes-gui,domid=
=3D0,log-level=3D0<br>[2022-09-20 10:08:21] -machine<br>[2022-09-20 10:08:2=
1] xenfv<br>[2022-09-20 10:08:21] -m<br>[2022-09-20 10:08:21] 496<br>[2022-=
09-20 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvda,if=3Dide,i=
ndex=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20=
 10:08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdb,if=3Dide,index=
=3D1,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback<br>[2022-09-20 10:=
08:21] -drive<br>[2022-09-20 10:08:21] file=3D/dev/xvdc,if=3Dide,index=3D2,=
media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39;<br>[2022-09-20 10:=
08:21] + xenstore-read device/console/2<br>[2022-09-20 10:08:21] + xenstore=
-read device/console/1<br>[2022-09-20 10:08:21] + IFS=3D&#39;<br>[2022-09-2=
0 10:08:21] &#39;<br>[2022-09-20 10:08:21] + set -f<br>[2022-09-20 10:08:21=
] + set +f<br>[2022-09-20 10:08:21] + unset IFS<br>[2022-09-20 10:08:21] + =
qemu_pid=3D148<br>[2022-09-20 10:08:21] + &#39;[&#39; &#39;!&#39; -e /tmp/q=
emu.qmp ]<br>[2022-09-20 10:08:21] + sleep 0.1<br>[2022-09-20 10:08:21] + q=
emu -sandbox &#39;on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,=
resourcecontrol=3Ddeny&#39; -chardev &#39;pipe,path=3D/tmp/qmp/qemu,id=3Dm&=
#39; -mon &#39;chardev=3Dm,mode=3Dcontrol&#39; -chardev &#39;socket,server,=
nowait,path=3D/tmp/qemu.qmp,id=3Dm2&#39; -mon &#39;chardev=3Dm2,mode=3Dcont=
rol&#39; -xen-domid 19 -no-shutdown -nodefaults -no-user-config -name openb=
sd-71 -display none -device &#39;VGA,vgamem_mb=3D16&#39; -boot &#39;order=
=3Ddc&#39; -device &#39;usb-ehci,id=3Dehci&#39; -device &#39;usb-tablet,bus=
=3Dehci.0&#39; -smp &#39;2,maxcpus=3D2&#39; -net none -display &#39;qubes-g=
ui,domid=3D0,log-level=3D0&#39; -machine xenfv -m 496 -drive &#39;file=3D/d=
ev/xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Dhost_device,cache=3Dwriteb=
ack&#39; -drive &#39;file=3D/dev/xvdb,if=3Dide,index=3D1,media=3Ddisk,forma=
t=3Dhost_device,cache=3Dwriteback&#39; -drive &#39;file=3D/dev/xvdc,if=3Did=
e,index=3D2,media=3Ddisk,format=3Dhost_device,cache=3Dwriteback&#39; -devic=
e &#39;nec-usb-xhci,id=3Dxhci&#39;<br>[2022-09-20 10:08:21] qemu: -chardev =
socket,server,nowait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form bool=
ean option &#39;server&#39; deprecated<br>[2022-09-20 10:08:21] Please use =
server=3Don instead<br>[2022-09-20 10:08:21] qemu: -chardev socket,server,n=
owait,path=3D/tmp/qemu.qmp,id=3Dm2: warning: short-form boolean option &#39=
;nowait&#39; deprecated<br>[2022-09-20 10:08:21] Please use wait=3Doff inst=
ead<br>[2022-09-20 10:08:21] + tee /proc/self/fd/2<br>[2022-09-20 10:08:21]=
 random: qemu: uninitialized urandom read (16 bytes read)<br>[2022-09-20 10=
:08:21] + echo &#39;{&quot;execute&quot;: &quot;qmp_capabilities&quot;}&#39=
;<br>[2022-09-20 10:08:21] {&quot;QMP&quot;: {&quot;version&quot;: {&quot;q=
emu&quot;: {&quot;micro&quot;: 0, &quot;minor&quot;: 1, &quot;major&quot;: =
6}, &quot;package&quot;: &quot;&quot;}, &quot;capabilities&quot;: [&quot;oo=
b&quot;]}}<br><br>[2022-09-20 10:08:21] {&quot;execute&quot;: &quot;qmp_cap=
abilities&quot;}<br>[2022-09-20 10:08:21] qubes_gui/init: 573<br>[2022-09-2=
0 10:08:21] qubes_gui/init: 582<br>[2022-09-20 10:08:21] qubes_gui/init: 58=
4<br>[2022-09-20 10:08:21] qubes_gui/init[611]: version sent, waiting for x=
org conf<br>[2022-09-20 10:08:21] {&quot;return&quot;: {}}<br><br>[2022-09-=
20 10:08:21] + &#39;[&#39; &#39;!&#39; -e /tmp/qemu.qmp ]<br>[2022-09-20 10=
:08:21] + &#39;[&#39; -e /proc/self/fd/4 ]<br>[2022-09-20 10:08:21] + &#39;=
[&#39; -e /proc/self/fd/3 ]<br>[2022-09-20 10:08:21] + true<br>[2022-09-20 =
10:08:21] + printf &#39;=3D=3D=3D=3D Press enter for shell =3D=3D=3D=3D\n&#=
39;<br>[2022-09-20 10:08:21] =3D=3D=3D=3D Press enter for shell =3D=3D=3D=
=3D<br>[2022-09-20 10:08:21] + read<br>[2022-09-20 10:08:21] + vchan-socket=
-proxy 0 device-model/19/qmp-vchan /tmp/qemu.qmp<br>[2022-09-20 10:08:21] w=
ritten 110 bytes to vchan<br>[2022-09-20 10:08:21] written 34 bytes to vcha=
n<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_realize: Assigning real physica=
l device 07:00.0 to devfn 0x30<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_re=
gister_regions: IO region 0 registered (size=3D0x00000100 base_addr=3D0x000=
03000 type: 0x1)<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_register_regions=
: IO region 2 registered (size=3D0x00001000 base_addr=3D0xb4304000 type: 0x=
4)<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_register_regions: IO region 4 =
registered (size=3D0x00004000 base_addr=3D0xb4300000 type: 0x4)<br>[2022-09=
-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x000e mismatch! Emu=
lated=3D0x0080, host=3D0x0000, syncing to 0x0000.<br>[2022-09-20 10:08:22] =
[00:06.0] xen_pt_config_reg_init: Offset 0x0010 mismatch! Emulated=3D0x0000=
, host=3D0x3001, syncing to 0x3001.<br>[2022-09-20 10:08:22] [00:06.0] xen_=
pt_config_reg_init: Offset 0x0018 mismatch! Emulated=3D0x0000, host=3D0xb43=
04004, syncing to 0xb4304004.<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_con=
fig_reg_init: Offset 0x0020 mismatch! Emulated=3D0x0000, host=3D0xb4300004,=
 syncing to 0xb4300004.<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_config_re=
g_init: Offset 0x0042 mismatch! Emulated=3D0x0000, host=3D0x07c3, syncing t=
o 0x0603.<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset=
 0x0052 mismatch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.<br>[=
2022-09-20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x0074 mismat=
ch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.<br>[2022-09-=
20 10:08:22] [00:06.0] xen_pt_config_reg_init: Offset 0x007a mismatch! Emul=
ated=3D0x0000, host=3D0x0010, syncing to 0x0010.<br>[2022-09-20 10:08:22] [=
00:06.0] xen_pt_config_reg_init: Offset 0x0082 mismatch! Emulated=3D0x0000,=
 host=3D0x1011, syncing to 0x1011.<br>[2022-09-20 10:08:22] [00:06.0] xen_p=
t_pci_intx: intx=3D1<br>[2022-09-20 10:08:22] [00:06.0] xen_pt_realize: Rea=
l physical device 07:00.0 registered successfully<br>[2022-09-20 10:08:22] =
written 34 bytes to vchan<br>[2022-09-20 10:08:22] written 2048 bytes to vc=
han<br>[2022-09-20 10:08:22] written 979 bytes to vchan<br>[2022-09-20 10:0=
8:22] written 110 bytes to vchan<br>[2022-09-20 10:08:22] written 34 bytes =
to vchan<br>[2022-09-20 10:08:22] written 34 bytes to vchan<br>[2022-09-20 =
10:08:22] qubes_gui/init[622]: got xorg conf, creating window<br>[2022-09-2=
0 10:08:22] qubes_gui/init: 632<br>[2022-09-20 10:08:22] configure msg, x/y=
 640 325 (was 0 0), w/h 640 480<br>[2022-09-20 10:08:23] random: crng init =
done<br>[2022-09-20 10:08:43] [00:06.0] Write-back to unknown field 0x44 (p=
artially) inhibited (0x0000ffff)<br>[2022-09-20 10:08:43] [00:06.0] If the =
device doesn&#39;t work, try enabling permissive mode<br>[2022-09-20 10:08:=
43] [00:06.0] (unsafe) and if it helps report the problem to xen-devel<br>[=
2022-09-20 10:08:43] [00:06.0] xen_pt_msgctrl_reg_write: setup MSI (registe=
r: 81).<br>[2022-09-20 10:08:43] [00:06.0] xen_pt_msi_setup: MSI mapped wit=
h pirq 151.<br>[2022-09-20 10:08:43] [00:06.0] msi_msix_update: Updating MS=
I with pirq 151 gvec 0x72 gflags 0x0 (entry: 0x0)</div><div><br></div><div>=
BR Adam<br></div><div><br></div><div><br></div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">wt., 20 wrz 2=
022 o 09:41=C2=A0Adam Szewczyk &lt;<a href=3D"mailto:szewcson@gmail.com">sz=
ewcson@gmail.com</a>&gt; napisa=C5=82(a):<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dun=
priv-mmio<br>(XEN) parameter &quot;no-real-mode&quot; unknown!<br>=C2=A0Xen=
 4.14.5<br>(XEN) Xen version 4.14.5 (mockbuild@[unknown]) (gcc (GCC) 10.3.1=
 20210422 (Red Hat 10.3.1-1)) debug=3Dn =C2=A0Wed Aug 24 00:00:00 UTC 2022<=
br>(XEN) Latest ChangeSet: <br>(XEN) Bootloader: GRUB 2.04<br>(XEN) Command=
 line: placeholder console=3Dnone dom0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M=
 ucode=3Dscan smt=3Doff gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=
=3D4096 no-real-mode edd=3Doff<br>(XEN) Xen image load base address: 0x9c20=
0000<br>(XEN) Video information:<br>(XEN) =C2=A0VGA is graphics mode 1920x1=
080, 32 bpp<br>(XEN) Disc information:<br>(XEN) =C2=A0Found 0 MBR signature=
s<br>(XEN) =C2=A0Found 2 EDD information structures<br>(XEN) EFI RAM map:<b=
r>(XEN) =C2=A0[0000000000000000, 000000000009efff] (usable)<br>(XEN) =C2=A0=
[000000000009f000, 00000000000fffff] (reserved)<br>(XEN) =C2=A0[00000000001=
00000, 0000000086466fff] (usable)<br>(XEN) =C2=A0[0000000086467000, 0000000=
086d66fff] (reserved)<br>(XEN) =C2=A0[0000000086d67000, 000000009cf7dfff] (=
usable)<br>(XEN) =C2=A0[000000009cf7e000, 000000009e49dfff] (reserved)<br>(=
XEN) =C2=A0[000000009e49e000, 000000009eb8dfff] (ACPI NVS)<br>(XEN) =C2=A0[=
000000009eb8e000, 000000009ec0dfff] (ACPI data)<br>(XEN) =C2=A0[000000009ec=
0e000, 000000009ec0efff] (usable)<br>(XEN) =C2=A0[000000009ec0f000, 0000000=
09fffffff] (reserved)<br>(XEN) =C2=A0[00000000e0000000, 00000000efffffff] (=
reserved)<br>(XEN) =C2=A0[00000000fe000000, 00000000fe010fff] (reserved)<br=
>(XEN) =C2=A0[00000000fed10000, 00000000fed19fff] (reserved)<br>(XEN) =C2=
=A0[00000000fed84000, 00000000fed84fff] (reserved)<br>(XEN) =C2=A0[00000000=
fee00000, 00000000fee00fff] (reserved)<br>(XEN) =C2=A0[00000000ff600000, 00=
000000ffffffff] (reserved)<br>(XEN) =C2=A0[0000000100000000, 000000085dffff=
ff] (usable)<br>(XEN) ACPI: RSDP 9EC0D014, 0024 (r2 LENOVO)<br>(XEN) ACPI: =
XSDT 9EBEE188, 00FC (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =
=C2=A0 =C2=A0 =C2=A0 1000013)<br>(XEN) ACPI: FACP 9EBF1000, 010C (r5 LENOVO=
 CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XE=
N) ACPI: DSDT 9EBBD000, 2FF34 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: FACS 9EB0D000, 0040<br>(XE=
N) ACPI: UEFI 9EC0C000, 0236 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EC0A000, 1B1C (r2 LE=
NOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br=
>(XEN) ACPI: SSDT 9EC06000, 31D0 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: UEFI 9EC05000, 0042 (r=
1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000=
)<br>(XEN) ACPI: SSDT 9EC04000, 045A (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EC03000, 0046=
 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040=
000)<br>(XEN) ACPI: TPM2 9EC02000, 0034 (r3 LENOVO CB-01 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: POAT 9EC01000, =
0055 (r3 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=
=A040000)<br>(XEN) ACPI: SSDT 9EBFC000, 44B6 (r2 LENOVO CB-01 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: LPIT 9EBFB0=
00, 0094 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =
=C2=A040000)<br>(XEN) ACPI: WSMT 9EBFA000, 0028 (r1 LENOVO CB-01 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EB=
F9000, 0C2F (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=
=A0 =C2=A040000)<br>(XEN) ACPI: DBGP 9EBF8000, 0034 (r1 LENOVO CB-01 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: DBG2=
 9EBF7000, 0061 (r0 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =
=C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBF6000, 0896 (r2 LENOVO CB-01 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: S=
SDT 9EBF3000, 2F89 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 AC=
PI =C2=A0 =C2=A040000)<br>(XEN) ACPI: ASF! 9EBF2000, 00A5 (r32 LENOVO CB-01=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACP=
I: HPET 9EBF0000, 0038 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: APIC 9EBEF000, 012C (r3 LENOVO CB=
-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) =
ACPI: MCFG 9EBED000, 003C (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBBA000, 2BBF (r2 LENOV=
O CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(X=
EN) ACPI: DMAR 9EBB9000, 0070 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBB6000, 2B68 (r1 LE=
NOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br=
>(XEN) ACPI: SSDT 9EBB5000, 004C (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: FPDT 9EBB4000, 0044 (r=
1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000=
)<br>(XEN) ACPI: BGRT 9EBB3000, 0038 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) System RAM: 32678MB (3346=
2392kB)<br>(XEN) Domain heap initialised<br>(XEN) ACPI: 32/64X FACS address=
 mismatch in FADT - 9eb0d000/0000000000000000, using 32<br>(XEN) IOAPIC[0]:=
 apic_id 2, version 32, address 0xfec00000, GSI 0-119<br>(XEN) Enabling API=
C mode: =C2=A0Phys.=C2=A0 Using 1 I/O APICs<br>(XEN) Switched to APIC drive=
r x2apic_cluster<br>(XEN) CPU0: TSC: ratio: 216 / 2<br>(XEN) CPU0: bus: 100=
 MHz base: 2600 MHz max: 4500 MHz<br>(XEN) CPU0: 800 ... 2600 MHz<br>(XEN) =
xstate: size: 0x440 and states: 0x1f<br>(XEN) Speculative mitigation facili=
ties:<br>(XEN) =C2=A0 Hardware hints: RSBA<br>(XEN) =C2=A0 Hardware feature=
s: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRBDS_CTRL<br>(XEN) =C2=A0 Compi=
led-in support: INDIRECT_THUNK<br>(XEN) =C2=A0 Xen settings: BTI-Thunk JMP,=
 SPEC_CTRL: IBRS+ STIBP+ SSBD-, Other: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW B=
RANCH_HARDEN<br>(XEN) =C2=A0 L1TF: believed vulnerable, maxphysaddr L1D 46,=
 CPUID 39, Safe address 8000000000<br>(XEN) =C2=A0 Support for HVM VMs: MSR=
_SPEC_CTRL RSB EAGER_FPU MD_CLEAR<br>(XEN) =C2=A0 Support for PV VMs: MSR_S=
PEC_CTRL EAGER_FPU MD_CLEAR<br>(XEN) =C2=A0 XPTI (64-bit PV only): Dom0 ena=
bled, DomU enabled (with PCID)<br>(XEN) =C2=A0 PV L1TF shadowing: Dom0 disa=
bled, DomU enabled<br>(XEN) Using scheduler: SMP Credit Scheduler rev2 (cre=
dit2)<br>(XEN) Initializing Credit2 scheduler<br>(XEN) Disabling HPET for b=
eing unreliable<br>(XEN) Platform timer is 3.580MHz ACPI PM Timer<br>(XEN) =
Detected 2591.999 MHz processor.<br>(XEN) Unknown cachability for MFNs 0xa0=
-0xff<br>(XEN) Unknown cachability for MFNs 0x9f000-0x9ffff<br>(XEN) Intel =
VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB<br>(XEN) Intel VT-d Snoop =
Control enabled.<br>(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.<br>(=
XEN) Intel VT-d Queued Invalidation enabled.<br>(XEN) Intel VT-d Interrupt =
Remapping enabled.<br>(XEN) Intel VT-d Posted Interrupt not enabled.<br>(XE=
N) Intel VT-d Shared EPT tables enabled.<br>(XEN) I/O virtualisation enable=
d<br>(XEN) =C2=A0- Dom0 mode: Relaxed<br>(XEN) Interrupt remapping enabled<=
br>(XEN) Enabled directed EOI with ioapic_ack_old on!<br>(XEN) ENABLING IO-=
APIC IRQs<br>(XEN) =C2=A0-&gt; Using old ACK method<br>(XEN) Allocated cons=
ole ring of 32 KiB.<br>(XEN) VMX: Supported advanced features:<br>(XEN) =C2=
=A0- APIC MMIO access virtualisation<br>(XEN) =C2=A0- APIC TPR shadow<br>(X=
EN) =C2=A0- Extended Page Tables (EPT)<br>(XEN) =C2=A0- Virtual-Processor I=
dentifiers (VPID)<br>(XEN) =C2=A0- Virtual NMI<br>(XEN) =C2=A0- MSR direct-=
access bitmap<br>(XEN) =C2=A0- Unrestricted Guest<br>(XEN) =C2=A0- VM Funct=
ions<br>(XEN) =C2=A0- Virtualisation Exceptions<br>(XEN) =C2=A0- Page Modif=
ication Logging<br>(XEN) HVM: ASIDs enabled.<br>(XEN) HVM: VMX enabled<br>(=
XEN) HVM: Hardware Assisted Paging (HAP) detected<br>(XEN) HVM: HAP page si=
zes: 4kB, 2MB, 1GB<br>(XEN) Brought up 6 CPUs<br>(XEN) Scheduling granulari=
ty: cpu, 1 CPU per sched-resource<br>(XEN) Dom0 has maximum 952 PIRQs<br>(X=
EN) =C2=A0Xen =C2=A0kernel: 64-bit, lsb, compat32<br>(XEN) =C2=A0Dom0 kerne=
l: 64-bit, PAE, lsb, paddr 0x1000000 -&gt; 0x4000000<br>(XEN) PHYSICAL MEMO=
RY ARRANGEMENT:<br>(XEN) =C2=A0Dom0 alloc.: =C2=A0 0000000838000000-&gt;000=
0000840000000 (1007932 pages to be allocated)<br>(XEN) =C2=A0Init. ramdisk:=
 000000085c13c000-&gt;000000085dffff1d<br>(XEN) VIRTUAL MEMORY ARRANGEMENT:=
<br>(XEN) =C2=A0Loaded kernel: ffffffff81000000-&gt;ffffffff84000000<br>(XE=
N) =C2=A0Init. ramdisk: 0000000000000000-&gt;0000000000000000<br>(XEN) =C2=
=A0Phys-Mach map: 0000008000000000-&gt;0000008000800000<br>(XEN) =C2=A0Star=
t info: =C2=A0 =C2=A0ffffffff84000000-&gt;ffffffff840004b8<br>(XEN) =C2=A0X=
enstore ring: 0000000000000000-&gt;0000000000000000<br>(XEN) =C2=A0Console =
ring: =C2=A00000000000000000-&gt;0000000000000000<br>(XEN) =C2=A0Page table=
s: =C2=A0 ffffffff84001000-&gt;ffffffff84026000<br>(XEN) =C2=A0Boot stack: =
=C2=A0 =C2=A0ffffffff84026000-&gt;ffffffff84027000<br>(XEN) =C2=A0TOTAL: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ffffffff80000000-&gt;ffffffff84400000<br>(XEN) =
=C2=A0ENTRY ADDRESS: ffffffff830fb1c0<br>(XEN) Dom0 has maximum 6 VCPUs<br>=
(XEN) Initial low memory virq threshold set at 0x4000 pages.<br>(XEN) Scrub=
bing Free RAM in background<br>(XEN) Std. Loglevel: Errors and warnings<br>=
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)<br>(XEN) =
*** Serial input to DOM0 (type &#39;CTRL-a&#39; three times to switch input=
)<br>(XEN) Freed 580kB init memory<br>(XEN) MSI information:<br>(XEN) =C2=
=A0IOMMU =C2=A0120 vec=3D30 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowes=
t dest=3D00000001 mask=3D1/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0121 ve=
c=3Dc8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mas=
k=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0122 vec=3Dd0 lowest =C2=A0e=
dge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(X=
EN) =C2=A0MSI =C2=A0 =C2=A0123 vec=3De0 lowest =C2=A0edge =C2=A0 assert =C2=
=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =
=C2=A0124 vec=3D31 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000040 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI-X =C2=A0125 vec=3D51 lowest =
=C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000040 mask=3D1/ =C2=A0/=
0<br>(XEN) =C2=A0MSI-X =C2=A0126 vec=3D59 lowest =C2=A0edge =C2=A0 assert =
=C2=A0log lowest dest=3D00000004 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =
=C2=A0127 vec=3D61 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0128 vec=3D69 lowest =
=C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D1/ =C2=A0/=
0<br>(XEN) =C2=A0MSI-X =C2=A0129 vec=3D71 lowest =C2=A0edge =C2=A0 assert =
=C2=A0log lowest dest=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =
=C2=A0130 vec=3D79 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0131 vec=3D81 lowest =
=C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D1/ =C2=A0/=
0<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0132 vec=3Dd9 lowest =C2=A0edge =C2=A0 ass=
ert =C2=A0log lowest dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =
=C2=A0 =C2=A0133 vec=3Dc9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest =
dest=3D00000004 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0134 vec=
=3D99 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=
=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0135 vec=3Da9 lowest =C2=A0ed=
ge =C2=A0 assert =C2=A0log lowest dest=3D00000555 mask=3D0/ =C2=A0/?<br>(XE=
N) =C2=A0MSI =C2=A0 =C2=A0136 vec=3Db1 lowest =C2=A0edge =C2=A0 assert =C2=
=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =
=C2=A0137 vec=3Db9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0138 vec=3Dd1 lo=
west =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D0/ =
=C2=A0/?<br>(XEN) IRQ information:<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 0 vec:=
f0 IO-APIC-edge =C2=A0 =C2=A0status=3D000 aff:{0}/{0} time.c#timer_interrup=
t()<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 1 vec:39 IO-APIC-edge =C2=A0 =C2=A0st=
atus=3D034 aff:{8}/{0-11} in-flight=3D0 d0: =C2=A01(---)<br>(XEN) =C2=A0 =
=C2=A0IRQ: =C2=A0 3 vec:40 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{=
0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 4 vec:48 IO-APIC-edge =
=C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=
=A0IRQ: =C2=A0 5 vec:50 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} =
mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 6 vec:58 IO-APIC-edge =C2=
=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A0 7 vec:60 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 8 vec:68 IO-APIC-edge =C2=A0 =
=C2=A0status=3D030 aff:{0}/{0} in-flight=3D0 d0: =C2=A08(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: =C2=A0 9 vec:b0 IO-APIC-level =C2=A0 status=3D030 aff:{8}/{0=
-11} in-flight=3D0 d0: =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A010 vec=
:78 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(=
XEN) =C2=A0 =C2=A0IRQ: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0status=3D0=
02 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012 vec:90 I=
O-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=3D002 af=
f:{0-15}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 vec:a0 IO-=
APIC-level =C2=A0 status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(---)<br>(XE=
N) =C2=A0 =C2=A0IRQ: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0status=3D002=
 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 vec:b8 IO-=
APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16(---),d3:=
 16(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A017 vec:d8 IO-APIC-level =C2=A0 st=
atus=3D010 aff:{10}/{0-11} in-flight=3D2 d0: 17(P-M),d7: 17(-MM)<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A018 vec:c0 IO-APIC-level =C2=A0 status=3D030 aff:{8}=
/{0-11} in-flight=3D0 d0: 18(---),d3: 18(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A019 vec:a1 IO-APIC-level =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped,=
 unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A020 vec:e8 IO-APIC-level =C2=A0 st=
atus=3D030 aff:{0}/{0-11} in-flight=3D0 d0: 20(---)<br>(XEN) =C2=A0 =C2=A0I=
RQ: =C2=A083 vec:41 IO-APIC-level =C2=A0 status=3D030 aff:{4}/{0-11} in-fli=
ght=3D0 d0: 83(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec:30 DMA_MSI =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 status=3D000 aff:{0-15}/{0} iommu.c#iommu_page_fault()=
<br>(XEN) =C2=A0 =C2=A0IRQ: 121 vec:c8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:951(---)<br>(XEN) =C2=A0 =C2=
=A0IRQ: 122 vec:d0 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d0:950(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 123 vec:e0 PCI=
-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 =
d0:949(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 124 vec:31 PCI-MSI =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:948(---)<br>(XEN) =
=C2=A0 =C2=A0IRQ: 125 vec:51 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 af=
f:{6}/{0-11} in-flight=3D0 d0:947(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 126 vec:5=
9 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D010 aff:{2}/{0-11} in-flight=3D0 =
d0:946(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 127 vec:61 PCI-MSI/-X =C2=A0 =C2=A0 =
=C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:945(---)<br>(XEN) =C2=A0=
 =C2=A0IRQ: 128 vec:69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{0}/=
{0-11} in-flight=3D0 d0:944(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 129 vec:71 PCI-=
MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:943=
(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 130 vec:79 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0=
status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:942(---)<br>(XEN) =C2=A0 =C2=
=A0IRQ: 131 vec:81 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{0}/{0-1=
1} in-flight=3D0 d0:941(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 132 vec:d9 PCI-MSI =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=3D0 d7:15=
1(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: 133 vec:c9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d3:151(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 134 vec:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 =
aff:{8}/{0-11} in-flight=3D0 d0:938(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 135 vec=
:a9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D002 aff:{0-15}/{0-11} mapp=
ed, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: 136 vec:b1 PCI-MSI =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:936(---)<br>(XEN) =
=C2=A0 =C2=A0IRQ: 137 vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D0=
30 aff:{4}/{0-11} in-flight=3D0 d0:935(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 138 =
vec:d1 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D010 aff:{8}/{0-11} in-f=
light=3D0 d3:150(---)<br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =
=C2=A00x22 -&gt; irq_move_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&=
gt; mce_intel.c#cmci_interrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel=
.c#intel_thermal_interrupt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_inte=
rrupt()<br>(XEN) =C2=A0 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =
=C2=A0 =C2=A00xfb -&gt; call_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xf=
c -&gt; event_check_interrupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate=
_interrupt()<br>(XEN) =C2=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =
=C2=A0 =C2=A00xff -&gt; spurious_interrupt()<br>(XEN) IO-APIC interrupt inf=
ormation:<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0=
 =C2=A0 Apic 0x00, Pin =C2=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=
=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A01 Vec 57:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A01: vec=3D39 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000100<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec=
 64:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_i=
d:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin =C2=A04: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A05 Vec 80:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A05: vec=3D50 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec=
 88:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_i=
d:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin =C2=A07: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A08 Vec104:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A08: vec=3D68 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec=
176:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A09: vec=3Db0 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_i=
d:00000100<br>(XEN) =C2=A0 =C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=
=A0 Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL status=3D0 polari=
ty=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IR=
Q 11 Vec136:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 pol=
arity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0=
 IRQ 13 Vec152:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 d=
elivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 =
dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0=
 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =
=C2=A0 IRQ 15 Vec168:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=
=3Da8 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec184:<br>(XEN) =C2=
=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 16: vec=3Db8 delivery=3DLoPri dest=3DL sta=
tus=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =
=C2=A0 =C2=A0 IRQ 17 Vec216:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 1=
7: vec=3Dd8 delivery=3DLoPri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=
=3DL mask=3D0 dest_id:00000400<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec192:<br>(XE=
N) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 18: vec=3Dc0 delivery=3DLoPri dest=
=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000100<br>=
(XEN) =C2=A0 =C2=A0 IRQ 19 Vec161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00,=
 Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0=
 trig=3DL mask=3D1 dest_id:00000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec232:<b=
r>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 20: vec=3De8 delivery=3DLoPri d=
est=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<=
br>(XEN) =C2=A0 =C2=A0 IRQ 83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x=
00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=
=3D0 trig=3DL mask=3D0 dest_id:00000010</blockquote><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div>=C2=A0Name =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ID =C2=A0 Mem VCPUs	State	T=
ime(s)<br>Domain-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=
=A04080 =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 r----- =C2=A0 =C2=A0 288.6<br>sys-usb=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =C2=A0 284 =C2=
=A0 =C2=A0 2 =C2=A0 =C2=A0 -b---- =C2=A0 =C2=A0 =C2=A020.5<br>sys-usb-dm =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0 144 =C2=A0 =C2=A0 1 =
=C2=A0 =C2=A0 -b---- =C2=A0 =C2=A0 =C2=A0 3.5<br>openbsd-71 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 =C2=A0 511 =C2=A0 =C2=A0 2 =C2=A0 =C2=A0 =
-b---- =C2=A0 =C2=A0 =C2=A063.0<br>openbsd-71-dm =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A08 =C2=A0 144 =C2=A0 =C2=A0 1 =C2=A0 =C2=A0 -b---- =C2=A0 =C2=
=A0 =C2=A014.0</div></blockquote><div><br></div><div>How I can enable insta=
ll this debug hypervisor? I have problems finding anything about it.</div><=
div><br></div><div>I don&#39;t have logs with qemu in the name, instead I h=
ave gmp-proxy logs. But their all looks empty.</div><div><br></div><div>BR =
Adam<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">pon., 19 wrz 2022 o 11:21=C2=A0Roger Pau Monn=C3=A9 &lt;<a =
href=3D"mailto:roger.pau@citrix.com" target=3D"_blank">roger.pau@citrix.com=
</a>&gt; napisa=C5=82(a):<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Sep 16, 2022 at 05:08:59PM +0200, Adam Szewczyk wrote:<b=
r>
&gt; Sorry, I always forgot that default answer is &quot;answer&quot; to no=
t &quot;answer to<br>
&gt; all&quot;.<br>
&gt; <br>
&gt; My xl dmesg after calling those debug-keys is:<br>
<br>
Trimming the trace:<br>
<br>
&gt; (XEN) MSI information:<br>
<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 125 vec=3D72 lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000100<br>
&gt; mask=3D0/=C2=A0 /?<br>
<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 138 vec=3D62 lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000001<br>
&gt; mask=3D0/=C2=A0 /?<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 139 vec=3D6a lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000010<br>
&gt; mask=3D0/=C2=A0 /?<br>
<br>
&gt; (XEN) IRQ information:<br>
<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 125 vec:72 PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D030 aff:{8}/{0-11}<br>
&gt; in-flight=3D0 d94:151(-M-)<br>
<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 138 vec:62 PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D030 aff:{0}/{0-11}<br>
&gt; in-flight=3D0 d92:151(---)<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 139 vec:6a PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D010 aff:{4}/{0-11}<br>
&gt; in-flight=3D0 d92:150(---)<br>
<br>
Was domain with ID 94 your OpenBSD box? There&#39;s another domain with<br>
passthrough devices (ID 92).<br>
<br>
If your OpenBSD domain is the one with ID 94 it seems like the<br>
interrupt source is masked, so no interrupts will be injected to the<br>
guest.=C2=A0 That however might be just the response from the guest after<b=
r>
seeing that the interrupt source is not behaving correctly.<br>
<br>
Are yuo using a debug hypervisor? If not it would be helpful to do so,<br>
in order to maybe get more information on `xl dmesg`.<br>
<br>
Can you also paste the QEMU log for the OpeNSD domain?=C2=A0 Those logs are=
<br>
in /var/log/xen/qemu-dm-&lt;domain name&gt;.log, on most distros, not sure<=
br>
if QubesOS puts them at the same place.<br>
<br>
Regards, Roger.<br>
</blockquote></div>
</blockquote></div>

--000000000000344bfe05e9176609--

