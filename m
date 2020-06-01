Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734441EA877
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 19:39:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfoOw-0007wP-Tj; Mon, 01 Jun 2020 17:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSYU=7O=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jfoOv-0007wI-87
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 17:39:05 +0000
X-Inumbo-ID: c868509c-a42e-11ea-9947-bc764e2007e4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c868509c-a42e-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 17:39:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id f185so357484wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3L0nLA9rg9jYJ33/tCaYUBLuqLNlm/ZlH40+u3I3fhM=;
 b=blJvii5NIdN5+0Iehkx8vixVgg8MfXoB66AOXqUqBC06uRFI5b4D4Mcs68JCHCcxX4
 WbtWK+7/FLmNxtzZOEH1/WxcyaQz6BKkZKgXbLs68J4Cx7OFgMnb4FIsGL7/WeskQgHW
 OTCE1bwDv06c8YhE7OT5PkrYr1PVXVm2+nU2c6EoXz0+je/qn59O2j+1lXu1FfIPRJTI
 4ILgWdULG29gLfLpA41gc3IXu37MkhghGmKQmbWmXHBwhDcpECXrJ9h9w8l53f/n43Kw
 0I6h5R7pg9wN/V9LCL1z7U/PAAjpqkLEH6P7/h2b8l96fDth8XecMuaVaSASoG2nBWvK
 COKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3L0nLA9rg9jYJ33/tCaYUBLuqLNlm/ZlH40+u3I3fhM=;
 b=P5/4pL8CtEyM3N877yxmo+30qJvpq74LOfQHBUyqR+wgjLilElMPEuIZuMsno+EslQ
 YYO5FGziq4asQ2qyibmk+SS/GlFB8eip7U1WrPRdAAfO1HxsuMvkD1b0UwOcfkgPoFkp
 bDkoefQs6V37svubZx2eCzgVhix2+S2+ZlrIMGuNwSlnDT08SPYCFV8WgRwE8WfXO4HW
 r/HEJS9TUoCykqyQWaKoYQDIiCOIEU0HU53z7bvOduKRhyOfgA2+TiIYITKu+uOGs+Gu
 sG/HuPW9WtaOh3rTTmsrcwCvR58sOYmMcFnsY/O4N0yz//R3C+fTAyDGVRzpVURt3OW0
 IaoA==
X-Gm-Message-State: AOAM5313EOwaPQuJklgipMaytAGMgVkC6yfupTcCiXBX5cIymItoV57Z
 4NTLOMbEF2mP1EGVU3BtitkRzqJMyb6hmzd0QmA1mJM/lNQNMQ==
X-Google-Smtp-Source: ABdhPJwXhFpgMKVp4A9hNBlD6jFiBBMDG1O2ewRnDVl6GYmY6m9VXpTusHZNJknDmCMIVopy1yfX9mT/fNNQnWkrt5k=
X-Received: by 2002:a1c:6389:: with SMTP id x131mr387941wmb.90.1591033142100; 
 Mon, 01 Jun 2020 10:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
In-Reply-To: <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Mon, 1 Jun 2020 13:38:51 -0400
Message-ID: <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000042c39105a709453e"
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000042c39105a709453e
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

As requested please see log below from the eval board booting dom0, some
notes are as follows:

1. The offset that gets applied to the 32-bit address to translate it
to 36-bits is 0x7_8000_0000
2. Uboot has been setup to not change the address of the memory in the
device tree prior to launching xen, otherwise it would automatically offset
it and replace it with a 36-bit address and xen would immediately panic at
the 36-bit address for a 32-bit processor.
3. The RAM starting address placed in the device tree is 0x8000_0000, which
gets carved up by xen and replaced with 0xA000_0000 prior to booting
dom0..  I had to put in test code to have the kernel offset the 0xA000_0000
32-bit starting address to the 36-bit address needed before the kernel will
attempt to switch.  If it stays 32-bit then it will not switch over the
address space.  Note that without xen in play uboot would normally replace
the address in the device tree with the 36-bit one.
4. The dom0 kernel will boot from xen if the early_paging_init switch step
is skipped, and the low mem stays in 32-bit....but there is a problem with
the peripherals so this is not an acceptable solution.

It seems that either the kernel would need some API to tell xen that there
is going to be a change in the memory its using prior to call
early_paging_init(), or Xen would need to add the additional 36-bit
addresses during the memory bank allocation step....but recognize that they
are not actually different physical memory but just aliased to a different
address.

Thanks,
Dave

 Xen 4.14-unstable
(XEN) Xen version 4.14-unstable (arm-linux-gnueabihf-gcc (Linaro GCC
4.9-2015.05) 4.9.3 20150413 (prerelease)) debug=y  Mon Jun  1 10:22:11 EDT
2020
(XEN) Latest ChangeSet:
(XEN) build-id: 30ae91a06c71a885cfba2788965144999a864614
(XEN) Console output is synchronous.
(XEN) Processor: 412fc0f4: "ARM Limited", variant: 0x2, part 0xc0f, rev 0x4
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00001131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 02010555
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 20000000 01240000 02102211
(XEN)  ISA Features: 02101110 13112111 21232041 11112131 10011142 00000000
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v0.1
(XEN) SMP: Allowing 4 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 208333 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=0000000002561000
(XEN)         gic_cpu_addr=0000000002562000
(XEN)         gic_hyp_addr=0000000002564000
(XEN)         gic_vcpu_addr=0000000002566000
(XEN)         gic_maintenance_irq=25
(XEN) Using the new VGIC implementation.
(XEN) GICv2: 512 lines, 4 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Allocated console ring of 32 KiB.
(XEN) VFP implementer 0x41 architecture 4 part 0x30 variant 0xf rev 0x0
(XEN) CPU0: Guest atomics will try 2 times before pausing the domain
(XEN) Bringing up CPU1
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 3 booted.
(XEN) Brought up 4 CPUs
(XEN) I/O virtualisation disabled
(XEN) P2M: 40-bit IPA
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80003558
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) alternatives: Patching with alt table 002c2530 -> 002c2578
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000083000000
(XEN) Loading ramdisk from boot module @ 0000000088000000
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
(XEN) BANK[0] 0x000000a0000000-0x000000e0000000 (1024MB)
(XEN) Grant table range: 0x00000082000000-0x00000082040000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000083000000 to
00000000a7a00000-00000000a7f36100
(XEN) Loading d0 initrd from 0000000088000000 to
0x00000000a8200000-0x00000000abe00000
(XEN) Loading d0 DTB to 0x00000000a8000000-0x00000000a8007872
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) WARNING: SILO mode is not enabled.
(XEN) It has implications on the security of the system,
(XEN) unless the communications have been forbidden between
(XEN) untrusted domains.
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 328kB init memory.
(XEN) DOM0: [    0.000000] Booting Linux on physical CPU 0x0
(XEN) DOM0: [    0.000000] Linux version 4.19.59-g5f8c1c6121 (gcc version
8.3.0 (GNU Toolchain for the A-profile A
(XEN) DOM0: rchitecture 8.3-2019.03 (arm-rel-8.36))) #52 SMP Mon Jun 1
12:13:51 EDT 2020
(XEN) DOM0: [    0.000000] CPU: ARMv7 Processor [412fc0f4] revision 4
(ARMv7), cr=30c5387d
(XEN) DOM0: [    0.000000] CPU: div instructions available: patching
division code
(XEN) DOM0: [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT
instruction cache
(XEN) DOM0: [    0.000000] OF: fdt: Machine model: Texas Instruments
Keystone 2 Edison EVM
(XEN) DOM0: [    0.000000] bootconsole [earlycon0] enabled
(XEN) DOM0: [    0.000000] debug: ignoring loglevel setting.
(XEN) DOM0: [    0.000000] Memory policy: Data cache writealloc
(XEN) DOM0: [    0.000000] test : mem_start from dtb = 0xa0000000
(XEN) DOM0: [    0.000000] test : force the mem_start = 0x800000000
(XEN) DOM0: [    0.000000] test : note KEYSTONE_LOW_PHYS_START = 80000000,
KEYSTONE_LOW_PHYS_END = ffffffff
(XEN) DOM0: [    0.000000] test : note KEYSTONE_HIGH_PHYS_START =
800000000, KEYSTONE_HIGH_PHYS_END = bffffffff
(XEN) DOM0: [    0.000000] test : Switch physical address space to
0x820000000 (0xa0000000 + 0x780000000)
(XEN) DOM0: [    0.000000] test : inside of early_paging_init()
(XEN) traps.c:1980:d0v0 HSR=0x80000086 pc=0xa020010c gva=0xa020010c
gpa=0x0000082000310c
(XEN) traps.c:1980:d0v0 HSR=0x80000086 pc=0xffff000c gva=0xffff000c
gpa=0x0000082000700c
(XEN) traps.c:1980:d0v0 HSR=0x80000086 pc=0xffff000c gva=0xffff000c
gpa=0x0000082000700c
... last line loops indefinitely



On Mon, Jun 1, 2020 at 11:21 AM CodeWiz2280 <codewiz2280@gmail.com> wrote:

> Hi Julien,
>
> Thank you for your response.  I will try and post a log for you.  I have
> been switching back and forth between configurations and need to take a new
> one.
>
> The board has 4GB of memory. Uboot places the kernel/initramfs/dtb in the
> 0x8000_0000 region but then the kernel switches its code/data over to a
> 0x8_0000_0000 range via the pv-fixup-asm.S assembly code called from
> early_paging_init in arch/arm/mm/mmu.c.  That code is exclusive to the
> keystone in the 4.19 kernel when "CONFIG_ARM_PV_FIXUP" and "ARM_LPAE" are
> enabled in the kernel .  The upper 2GB of memory is above 0xFFFF_FFFF so
> LPAE is required.
>
> /proc/iomem looks like this without running xen after the switch and the
> kernel boots:
>
> 80000000 - 9fffffff : System RAM (boot alias)
> c8000000 - ffffffff : System RAM (boot alias)
> 800000000 - 1fffffff : System RAM
>     800008000-800dfffff : Kernel Code
>     801000000-80108ab3f : Kernel data
> 848000000-8ffffffff : System RAM
>
> I was able to duplicate this issue with a build of your latest "master"
> repository from this morning.
>
> On Mon, Jun 1, 2020 at 9:29 AM Julien Grall <julien@xen.org> wrote:
>
>> Hello,
>>
>> I have a few questions in order to understand a bit more your problem.
>>
>> On 01/06/2020 13:38, CodeWiz2280 wrote:
>> > Hello, I am using a Texas Instruments K2E Keystone Eval board with
>> Linux
>> > 4.19.59.  It has a 32-bit ARM Cortex A15 processor. There is keystone
>> > specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that executes
>> > during early_paging_init for LPAE support.  This causes the kernel to
>> > switch its running 32-bit address space to a 36-bit address space and
>> > the hypervisor traps repeatedly and stops it from booting.
>>
>> Without any log it is going to be difficult to help. Could you post the
>> hypervisor log when debug is enabled?
>>
>> >  I suspect
>> > this is because Xen only allowed for the original 32-bit memory range
>> > specified by the dom0 device tree.
>>
>> How much RAM did you give to your Dom0?
>>
>> > The 36-bit LPAE address is a fixed
>> > offset from the 32-bit address and is not physically different memory.
>>
>> I am not sure to understand this. Are you suggesting that the kernel is
>> trying to relocate itself in a different part of the physical memory?
>>
>> Can you provide more details on the fixed offset?
>>
>> >
>> > Can you suggest any way to get through this problem? I am using the
>> > master branch of xen from earlier this year.
>>
>> Can you provide the exact baseline your are using? Did make any changes
>> on top?
>>
>> > Any help is greatly
>> > appreciated.
>> Best regards,
>>
>> --
>> Julien Grall
>>
>

--00000000000042c39105a709453e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Julien,</div><di=
v><br></div><div>As requested please see log below from the eval board boot=
ing dom0, some notes are as follows:</div><div><br></div><div>1. The offset=
 that gets applied to the 32-bit address to translate it to=C2=A036-bits is=
 0x7_8000_0000</div><div>2. Uboot has been setup to not change the address =
of the memory in the device tree prior to launching xen, otherwise it would=
 automatically=C2=A0offset it and=C2=A0replace it with a=C2=A036-bit addres=
s=C2=A0and xen would immediately panic at the 36-bit address for a 32-bit p=
rocessor.</div><div>3. The RAM starting address placed in the device tree i=
s 0x8000_0000, which gets carved up by=C2=A0xen and replaced with 0xA000_00=
00 prior to booting dom0..=C2=A0 I had to put in test code to have the kern=
el offset the 0xA000_0000 32-bit starting address to the 36-bit address nee=
ded before the kernel will attempt to switch.=C2=A0 If it stays 32-bit then=
 it will not switch over the address space.=C2=A0 Note that without xen in =
play uboot would normally replace the address in the device tree with the 3=
6-bit one.</div><div>4.=C2=A0The dom0 kernel will boot from xen=C2=A0if the=
 early_paging_init switch step is skipped, and the low mem stays in 32-bit.=
...but there is a problem with the peripherals so this is not an acceptable=
 solution.</div><div><br></div><div>It seems that either the kernel would n=
eed some API to tell xen that there is going to be a change in the memory i=
ts using prior to call early_paging_init(), or Xen would need to add the ad=
ditional 36-bit addresses during the memory bank allocation step....but rec=
ognize that they are not actually different physical memory but just aliase=
d to a different address.</div><div><br></div><div>Thanks,</div><div>Dave<b=
r></div><div><br></div><div>=C2=A0Xen 4.14-unstable<br>(XEN) Xen version 4.=
14-unstable (arm-linux-gnueabihf-gcc (Linaro GCC 4.9-2015.05) 4.9.3 2015041=
3 (prerelease)) debug=3Dy=C2=A0 Mon Jun=C2=A0 1 10:22:11 EDT 2020<br>(XEN) =
Latest ChangeSet:<br>(XEN) build-id: 30ae91a06c71a885cfba2788965144999a8646=
14<br>(XEN) Console output is synchronous.<br>(XEN) Processor: 412fc0f4: &q=
uot;ARM Limited&quot;, variant: 0x2, part 0xc0f, rev 0x4<br>(XEN) 32-bit Ex=
ecution:<br>(XEN)=C2=A0=C2=A0 Processor Features: 00001131:00011011<br>(XEN=
)=C2=A0=C2=A0=C2=A0=C2=A0 Instruction Sets: AArch32 A32 Thumb Thumb-2 Thumb=
EE Jazelle<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Extensions: GenericTimer Securi=
ty<br>(XEN)=C2=A0=C2=A0 Debug Features: 02010555<br>(XEN)=C2=A0=C2=A0 Auxil=
iary Features: 00000000<br>(XEN)=C2=A0=C2=A0 Memory Model Features: 1020110=
5 20000000 01240000 02102211<br>(XEN)=C2=A0 ISA Features: 02101110 13112111=
 21232041 11112131 10011142 00000000<br>(XEN) Using SMC Calling Convention =
v1.0<br>(XEN) Using PSCI v0.1<br>(XEN) SMP: Allowing 4 CPUs<br>(XEN) Generi=
c Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 208333 KHz<br>(XEN) GICv2 i=
nitialization:<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic=
_dist_addr=3D0000000002561000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 gic_cpu_addr=3D0000000002562000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_hyp_addr=3D0000000002564000<br>(XEN)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_vcpu_addr=3D0000000002566000=
<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_maintenance_i=
rq=3D25<br>(XEN) Using the new VGIC implementation.<br>(XEN) GICv2: 512 lin=
es, 4 cpus, secure (IID 0200143b).<br>(XEN) Using scheduler: SMP Credit Sch=
eduler rev2 (credit2)<br>(XEN) Initializing Credit2 scheduler<br>(XEN)=C2=
=A0 load_precision_shift: 18<br>(XEN)=C2=A0 load_window_shift: 30<br>(XEN)=
=C2=A0 underload_balance_tolerance: 0<br>(XEN)=C2=A0 overload_balance_toler=
ance: -3<br>(XEN)=C2=A0 runqueues arrangement: socket<br>(XEN)=C2=A0 cap en=
forcement granularity: 10ms<br>(XEN) load tracking window length 1073741824=
 ns<br>(XEN) Allocated console ring of 32 KiB.<br>(XEN) VFP implementer 0x4=
1 architecture 4 part 0x30 variant 0xf rev 0x0<br>(XEN) CPU0: Guest atomics=
 will try 2 times before pausing the domain<br>(XEN) Bringing up CPU1<br>(X=
EN) CPU1: Guest atomics will try 1 times before pausing the domain<br>(XEN)=
 CPU 1 booted.<br>(XEN) Bringing up CPU2<br>(XEN) CPU2: Guest atomics will =
try 1 times before pausing the domain<br>(XEN) CPU 2 booted.<br>(XEN) Bring=
ing up CPU3<br>(XEN) CPU3: Guest atomics will try 1 times before pausing th=
e domain<br>(XEN) CPU 3 booted.<br>(XEN) Brought up 4 CPUs<br>(XEN) I/O vir=
tualisation disabled<br>(XEN) P2M: 40-bit IPA<br>(XEN) P2M: 3 levels with o=
rder-1 root, VTCR 0x80003558<br>(XEN) Scheduling granularity: cpu, 1 CPU pe=
r sched-resource<br>(XEN) Adding cpu 0 to runqueue 0<br>(XEN)=C2=A0 First c=
pu on runqueue, activating<br>(XEN) Adding cpu 1 to runqueue 0<br>(XEN) Add=
ing cpu 2 to runqueue 0<br>(XEN) Adding cpu 3 to runqueue 0<br>(XEN) altern=
atives: Patching with alt table 002c2530 -&gt; 002c2578<br>(XEN) *** LOADIN=
G DOMAIN 0 ***<br>(XEN) Loading d0 kernel from boot module @ 00000000830000=
00<br>(XEN) Loading ramdisk from boot module @ 0000000088000000<br>(XEN) Al=
locating 1:1 mappings totalling 1024MB for dom0:<br>(XEN) BANK[0] 0x000000a=
0000000-0x000000e0000000 (1024MB)<br>(XEN) Grant table range: 0x00000082000=
000-0x00000082040000<br>(XEN) Allocating PPI 16 for event channel interrupt=
<br>(XEN) Loading zImage from 0000000083000000 to 00000000a7a00000-00000000=
a7f36100<br>(XEN) Loading d0 initrd from 0000000088000000 to 0x00000000a820=
0000-0x00000000abe00000<br>(XEN) Loading d0 DTB to 0x00000000a8000000-0x000=
00000a8007872<br>(XEN) Initial low memory virq threshold set at 0x4000 page=
s.<br>(XEN) Scrubbing Free RAM in background<br>(XEN) Std. Loglevel: All<br=
>(XEN) Guest Loglevel: All<br>(XEN) ***************************************=
************<br>(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS<br>(XEN) This =
option is intended to aid debugging of Xen by ensuring<br>(XEN) that all ou=
tput is synchronously delivered on the serial line.<br>(XEN) However it can=
 introduce SIGNIFICANT latencies and affect<br>(XEN) timekeeping. It is NOT=
 recommended for production use!<br>(XEN) *********************************=
******************<br>(XEN) WARNING: SILO mode is not enabled.<br>(XEN) It =
has implications on the security of the system,<br>(XEN) unless the communi=
cations have been forbidden between<br>(XEN) untrusted domains.<br>(XEN) **=
*************************************************<br>(XEN) 3... 2... 1...<b=
r>(XEN) *** Serial input to DOM0 (type &#39;CTRL-a&#39; three times to swit=
ch input)<br>(XEN) Freed 328kB init memory.<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=
=A0 0.000000] Booting Linux on physical CPU 0x0<br>(XEN) DOM0: [=C2=A0=C2=
=A0=C2=A0 0.000000] Linux version 4.19.59-g5f8c1c6121 (gcc version 8.3.0 (G=
NU Toolchain for the A-profile A<br>(XEN) DOM0: rchitecture 8.3-2019.03 (ar=
m-rel-8.36))) #52 SMP Mon Jun 1 12:13:51 EDT 2020<br>(XEN) DOM0: [=C2=A0=C2=
=A0=C2=A0 0.000000] CPU: ARMv7 Processor [412fc0f4] revision 4 (ARMv7), cr=
=3D30c5387d<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] CPU: div instructi=
ons available: patching division code<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.=
000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache<br>=
(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] OF: fdt: Machine model: Texas Ins=
truments Keystone 2 Edison EVM<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000]=
 bootconsole [earlycon0] enabled<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.00000=
0] debug: ignoring loglevel setting.<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.0=
00000] Memory policy: Data cache writealloc<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=
=A0 0.000000] test : mem_start from dtb =3D 0xa0000000<br>(XEN) DOM0: [=C2=
=A0=C2=A0=C2=A0 0.000000] test : force the mem_start =3D 0x800000000<br>(XE=
N) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] test : note KEYSTONE_LOW_PHYS_START =
=3D 80000000, KEYSTONE_LOW_PHYS_END =3D ffffffff<br>(XEN) DOM0: [=C2=A0=C2=
=A0=C2=A0 0.000000] test : note KEYSTONE_HIGH_PHYS_START =3D 800000000, KEY=
STONE_HIGH_PHYS_END =3D bffffffff<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.0000=
00] test : Switch physical address space to 0x820000000 (0xa0000000 + 0x780=
000000)<br>(XEN) DOM0: [=C2=A0=C2=A0=C2=A0 0.000000] test : inside of early=
_paging_init()<br>(XEN) traps.c:1980:d0v0 HSR=3D0x80000086 pc=3D0xa020010c =
gva=3D0xa020010c gpa=3D0x0000082000310c<br>(XEN) traps.c:1980:d0v0 HSR=3D0x=
80000086 pc=3D0xffff000c gva=3D0xffff000c gpa=3D0x0000082000700c<br>(XEN) t=
raps.c:1980:d0v0 HSR=3D0x80000086 pc=3D0xffff000c gva=3D0xffff000c gpa=3D0x=
0000082000700c<br>... last line loops indefinitely<span></span></div><div><=
br></div><div><br></div></div></div></div><br><div class=3D"gmail_quote"><d=
iv class=3D"gmail_attr" dir=3D"ltr">On Mon, Jun 1, 2020 at 11:21 AM CodeWiz=
2280 &lt;<a href=3D"mailto:codewiz2280@gmail.com">codewiz2280@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-le=
ft-width:1px;border-left-style:solid"><div dir=3D"ltr"><div>Hi Julien,</div=
><div><br></div><div>Thank you for your response.=C2=A0 I will try and post=
 a log for you.=C2=A0 I have been switching back and forth between configur=
ations and need to take a new one.</div><div><br></div><div>The board has 4=
GB of memory. Uboot places the kernel/initramfs/dtb in the 0x8000_0000 regi=
on but then the kernel switches its code/data over to a 0x8_0000_0000 range=
 via the pv-fixup-asm.S assembly code called from early_paging_init in arch=
/arm/mm/mmu.c.=C2=A0 That code is exclusive to the keystone in the 4.19 ker=
nel when &quot;CONFIG_ARM_PV_FIXUP&quot; and &quot;ARM_LPAE&quot; are enabl=
ed in the kernel .=C2=A0 The upper 2GB of memory is above 0xFFFF_FFFF so LP=
AE is required.=C2=A0</div><div><br></div><div>/proc/iomem looks like this =
without running xen after the switch and the kernel boots:</div><div><br></=
div><div>80000000 - 9fffffff : System RAM (boot alias)</div><div>c8000000 -=
 ffffffff : System RAM (boot alias)</div><div>800000000 - 1fffffff : System=
 RAM</div><div>=C2=A0 =C2=A0 800008000-800dfffff : Kernel Code</div><div>=
=C2=A0 =C2=A0 801000000-80108ab3f : Kernel data</div><div>848000000-8ffffff=
ff : System RAM</div><div><br></div><div>I was able to duplicate this issue=
 with a build of your latest &quot;master&quot; repository from this mornin=
g.</div></div><br><div class=3D"gmail_quote"><div class=3D"gmail_attr" dir=
=3D"ltr">On Mon, Jun 1, 2020 at 9:29 AM Julien Grall &lt;<a href=3D"mailto:=
julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-l=
eft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-lef=
t-style:solid">Hello,<br>
<br>
I have a few questions in order to understand a bit more your problem.<br>
<br>
On 01/06/2020 13:38, CodeWiz2280 wrote:<br>
&gt; Hello, I am using a Texas Instruments K2E Keystone Eval board with Lin=
ux <br>
&gt; 4.19.59.=C2=A0 It has a 32-bit ARM Cortex A15 processor. There is keys=
tone <br>
&gt; specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that execute=
s <br>
&gt; during early_paging_init for LPAE support.=C2=A0 This causes the kerne=
l to <br>
&gt; switch its running 32-bit address space to a 36-bit address space and =
<br>
&gt; the hypervisor traps repeatedly and stops it from booting.<br>
<br>
Without any log it is going to be difficult to help. Could you post the <br=
>
hypervisor log when debug is enabled?<br>
<br>
&gt;=C2=A0 I suspect <br>
&gt; this is because Xen only allowed for the original 32-bit memory range =
<br>
&gt; specified by the dom0 device tree.<br>
<br>
How much RAM did you give to your Dom0?<br>
<br>
&gt; The 36-bit LPAE address is a fixed <br>
&gt; offset from the 32-bit address and is not physically different memory.=
<br>
<br>
I am not sure to understand this. Are you suggesting that the kernel is <br=
>
trying to relocate itself in a different part of the physical memory?<br>
<br>
Can you provide more details on the fixed offset?<br>
<br>
&gt;=C2=A0 <br>
&gt; Can you suggest any way to get through this problem? I am using the <b=
r>
&gt; master branch of xen from earlier this year.=C2=A0 <br>
<br>
Can you provide the exact baseline your are using? Did make any changes <br=
>
on top?<br>
<br>
&gt; Any help is greatly <br>
&gt; appreciated.<br>
Best regards,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>
</blockquote></div>

--00000000000042c39105a709453e--

