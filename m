Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35E1FA565
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl05f-0000I0-LA; Tue, 16 Jun 2020 01:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FxI/=75=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jl05e-0000Hv-FR
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:08:38 +0000
X-Inumbo-ID: e84bc304-af6d-11ea-8496-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e84bc304-af6d-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 01:08:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w3so17719152qkb.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6EGHYhhX27oghi/u6jTNeekj6ThDyQW5OLIHAJ60l30=;
 b=KjFcpR3Hd2vywRYBhi8MkeG4C0iplM1KcBXN97Y6Cs1mzTfYdWsRjfXcU1ExsRvmuq
 eA55t550Q4KxsF2GSWPVQrEJDMkbnEEio7zn4dP1OteN9Tm17kn9yL1JC1+oK8woPXOc
 hkKDs0+9buhBGubpWXe9id2Kv5hxSaOPp8RFm0HDXZAldoq9Bz6xODvCLfHJARvmGait
 IqY/vDNvFzwXsMcGXGjWsgpPqR3kLh7j8L0FQ58naW41R8msbkb0+JyfwnQHiqTeiHLB
 1jBqddvksZcfvq4hf2WuObX1WNdGLm5IPKawOfF0LPByWyaRjf7tzm+InB0vQL0p15LS
 tOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6EGHYhhX27oghi/u6jTNeekj6ThDyQW5OLIHAJ60l30=;
 b=IM+rbHG2bO5DmnViX3NLBEfLDW9UkxAwbD3gXpa6yqMWWLL9WeWpufk/iod2J/wGLz
 w+BZvmrxSXtteXugkuyh+cWOzfHR+faQT5xklWx6TruefUf/F7znjcrYsgpPNFxVBTrf
 +HsKW7g81S3VjXgEDbFBgZaReV0m/1H+HgNwXmkZtbAZRQ8zVAr2DlUdP041wGkXBvGe
 glWlAGUSAae206LLDr3syhpmS9p4fFun6+FOPTIJIFdMEcvcIhQC14J+eh6RH4lp2bcg
 +gWMUnVnKusU0mr2gCUHiwpKtetjh02PZZkFMW7F11WfS+XTrY7tioZapm9Lqq7nunIa
 ZyEg==
X-Gm-Message-State: AOAM53221t0vsvHTGsAMEuDVDWNkTiZdanPpoRJH68IfZuCbEp3PoUt+
 AKXZ2cMKNam8vZSLaftS7EL8p/9siSBl8HGXgvFMhw==
X-Google-Smtp-Source: ABdhPJxHo7CoMhuzau2RYJk6MLsqySFriSf7zk6ftOZU90tSb/xcnzyr+M234Rjv0h2BBIPbklfXWw9Gm3011jPmHgY=
X-Received: by 2002:a37:8c04:: with SMTP id o4mr1140747qkd.270.1592269716738; 
 Mon, 15 Jun 2020 18:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <alpine.DEB.2.21.2006151802470.9074@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006151802470.9074@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 15 Jun 2020 18:08:25 -0700
Message-ID: <CAMmSBy-oX33D2PTS0aju2YXR37bXuy5xKEwM_f+HZYe86mFp-A@mail.gmail.com>
Subject: Re: [RFC XEN PATCH 00/23] xen: beginning support for RISC-V
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Dan Robertson <dan@dlrobertson.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 6:03 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Any updates? I am looking forward to this :-)

At the risk of flooding the list with +1s -- I'm also very much
looking forward to it!

Thanks,
Roman.

>
>
> On Tue, 21 Jan 2020, Bobby Eshleman wrote:
> > Hey everybody,
> >
> > This is an RFC patchset for the very beginnings of adding RISC-V support
> > to Xen.  This RFC is really just to start a dialogue about supporting
> > RISC-V and align with the Xen project and community before going
> > further.  For that reason, it is very rough and very incomplete.
> >
> > My name is Bobby Eshleman, I'm a software engineer at
> > Star Lab / Wind River on the ARM team, mostly having worked in the Linux
> > kernel.  I've also been involved a good amount with Xen on ARM here,
> > mostly dealing with tooling, deployment, and testing.  A lot of this
> > patchset is heavily inspired by the Xen/ARM source code (particularly
> > the early setup up code).
> >
> > Currently, this patchset really only sets up virtual memory for Xen and
> > initializes UART to enable print output.  None of RISC-V's
> > virtualization support has been implemented yet, although that is the
> > next road to start going down.  Many functions only contain dummy
> > implementations.  Many shortcuts have been taken and TODO's have been
> > left accordingly.  It is very, very rough.  Be forewarned: you are quite
> > likely to see some ungainly code here (despite my efforts to clean it up
> > before sending this patchset out).  My intent with this RFC is to align
> > early and gauge interest, as opposed to presenting a totally complete
> > patchset.
> >
> > Because the ARM and RISC-V use cases will likely bear resemblance, the
> > RISC-V port should probably respect the design considerations that have
> > been laid out and respected by Xen on ARM for dom0less, safety
> > certification, etc...  My inclination has been to initially target or
> > prioritize dom0less (without excluding dom0full) and use the ARM
> > dom0less implementation as a model to follow.  I'd love feedback on this
> > point and on how the Xen project might envision a RISC-V implementation.
> >
> > This patchset has _some_ code for future support for 32-bit, but
> > currently my focus is on 64-bit.
> >
> > Again, this is a very, very rough and totally incomplete patchset.  My
> > goal here is just to gauge community interest, begin discussing what Xen
> > on RISC-V may look like, receive feedback, and see if I'm heading in the
> > right direction.
> >
> > My big questions are:
> >       Does the Xen project have interest in RISC-V?
> >       What can be done to make the RISC-V port as upstreamable as
> >               possible?
> >       Any major pitfalls?
> >
> > It would be great to hear all of your feedback.
> >
> > Alistair Francis (20):
> >   HACK: OE Build changes
> >   HACK: Makefile: Don't build Xen tools
> >   riscv: makefiles and Kconfig
> >   riscv: Add riscv to tools/libxc header files
> >   riscv: Add asm-offsets.c
> >   riscv: Add delay.c
> >   riscv: Add domain.c
> >   riscv: Add domctl.c
> >   riscv: Add guestcopy.c
> >   riscv: Add time.c
> >   riscv: Add smp.c
> >   riscv: Add shutdown.c
> >   riscv: Add traps.c
> >   riscv: Add irq.c
> >   riscv: Add vm_event.c
> >   riscv: Add p2m.c
> >   riscv: Add the lib directory
> >   riscv: Add smpboot.c
> >   riscv: Add percpu.c
> >   riscv: Add sysctl.c
> >
> > Bobby Eshleman (3):
> >   riscv: header files
> >   riscv: early setup code
> >   riscv: Add iommu.c
> >
> >  Makefile                                 |  13 +-
> >  config/StdGNU.mk                         |  12 +-
> >  config/riscv64.mk                        |   7 +
> >  tools/configure                          |  32 +-
> >  tools/firmware/Makefile                  |  12 +-
> >  tools/libxc/include/xenctrl.h            |   7 +
> >  tools/libxc/xc_core.h                    |   2 +
> >  tools/libxc/xc_core_riscv.h              |  57 ++
> >  xen/Makefile                             |   2 +-
> >  xen/Rules.mk                             |   2 +-
> >  xen/arch/Kconfig                         |   1 +
> >  xen/arch/riscv/Kconfig                   |  36 +
> >  xen/arch/riscv/Makefile                  |  62 ++
> >  xen/arch/riscv/Rules.mk                  |  55 ++
> >  xen/arch/riscv/asm-offsets.c             |  38 +
> >  xen/arch/riscv/configs/riscv32_defconfig |   0
> >  xen/arch/riscv/configs/riscv64_defconfig |   0
> >  xen/arch/riscv/delay.c                   | 114 +++
> >  xen/arch/riscv/domain.c                  | 273 +++++++
> >  xen/arch/riscv/domctl.c                  |  53 ++
> >  xen/arch/riscv/guestcopy.c               | 158 ++++
> >  xen/arch/riscv/head.S                    | 180 +++++
> >  xen/arch/riscv/irq.c                     | 107 +++
> >  xen/arch/riscv/lib/Makefile              |   1 +
> >  xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++
> >  xen/arch/riscv/mm.c                      | 925 +++++++++++++++++++++++
> >  xen/arch/riscv/p2m.c                     | 261 +++++++
> >  xen/arch/riscv/percpu.c                  |  84 ++
> >  xen/arch/riscv/platforms/Kconfig         |  31 +
> >  xen/arch/riscv/setup.c                   | 122 +++
> >  xen/arch/riscv/shutdown.c                |  24 +
> >  xen/arch/riscv/smp.c                     |  41 +
> >  xen/arch/riscv/smpboot.c                 | 114 +++
> >  xen/arch/riscv/sysctl.c                  |  31 +
> >  xen/arch/riscv/time.c                    |  74 ++
> >  xen/arch/riscv/traps.c                   |  56 ++
> >  xen/arch/riscv/vm_event.c                |  42 +
> >  xen/arch/riscv/xen.lds.S                 | 262 +++++++
> >  xen/drivers/passthrough/Makefile         |   1 +
> >  xen/drivers/passthrough/riscv/Makefile   |   1 +
> >  xen/drivers/passthrough/riscv/iommu.c    |  74 ++
> >  xen/include/asm-riscv/altp2m.h           |  39 +
> >  xen/include/asm-riscv/asm.h              |  76 ++
> >  xen/include/asm-riscv/atomic.h           | 249 ++++++
> >  xen/include/asm-riscv/bitops.h           | 331 ++++++++
> >  xen/include/asm-riscv/bug.h              |  59 ++
> >  xen/include/asm-riscv/byteorder.h        |  16 +
> >  xen/include/asm-riscv/cache.h            |  24 +
> >  xen/include/asm-riscv/cmpxchg.h          | 382 ++++++++++
> >  xen/include/asm-riscv/config.h           | 203 +++++
> >  xen/include/asm-riscv/csr.h              | 117 +++
> >  xen/include/asm-riscv/current.h          |  50 ++
> >  xen/include/asm-riscv/debugger.h         |  15 +
> >  xen/include/asm-riscv/delay.h            |  28 +
> >  xen/include/asm-riscv/desc.h             |  12 +
> >  xen/include/asm-riscv/device.h           |  15 +
> >  xen/include/asm-riscv/div64.h            |  23 +
> >  xen/include/asm-riscv/domain.h           |  85 +++
> >  xen/include/asm-riscv/event.h            |  42 +
> >  xen/include/asm-riscv/fence.h            |  12 +
> >  xen/include/asm-riscv/flushtlb.h         |  56 ++
> >  xen/include/asm-riscv/grant_table.h      |  93 +++
> >  xen/include/asm-riscv/guest_access.h     | 164 ++++
> >  xen/include/asm-riscv/guest_atomics.h    |  62 ++
> >  xen/include/asm-riscv/hardirq.h          |  27 +
> >  xen/include/asm-riscv/hypercall.h        |  12 +
> >  xen/include/asm-riscv/init.h             |  42 +
> >  xen/include/asm-riscv/io.h               | 283 +++++++
> >  xen/include/asm-riscv/iocap.h            |  16 +
> >  xen/include/asm-riscv/iommu.h            |  49 ++
> >  xen/include/asm-riscv/irq.h              |  58 ++
> >  xen/include/asm-riscv/mem_access.h       |  35 +
> >  xen/include/asm-riscv/mm.h               | 308 ++++++++
> >  xen/include/asm-riscv/monitor.h          |  65 ++
> >  xen/include/asm-riscv/nospec.h           |  25 +
> >  xen/include/asm-riscv/numa.h             |  41 +
> >  xen/include/asm-riscv/p2m.h              | 410 ++++++++++
> >  xen/include/asm-riscv/page.h             | 327 ++++++++
> >  xen/include/asm-riscv/paging.h           |  16 +
> >  xen/include/asm-riscv/pci.h              |  31 +
> >  xen/include/asm-riscv/percpu.h           |  34 +
> >  xen/include/asm-riscv/pgtable-bits.h     |  53 ++
> >  xen/include/asm-riscv/processor.h        |  60 ++
> >  xen/include/asm-riscv/random.h           |   9 +
> >  xen/include/asm-riscv/regs.h             |  42 +
> >  xen/include/asm-riscv/riscv_encoding.h   | 682 +++++++++++++++++
> >  xen/include/asm-riscv/setup.h            |  16 +
> >  xen/include/asm-riscv/smp.h              |  50 ++
> >  xen/include/asm-riscv/softirq.h          |  16 +
> >  xen/include/asm-riscv/spinlock.h         |  13 +
> >  xen/include/asm-riscv/string.h           |  28 +
> >  xen/include/asm-riscv/sysregs.h          |  14 +
> >  xen/include/asm-riscv/system.h           |  96 +++
> >  xen/include/asm-riscv/time.h             |  60 ++
> >  xen/include/asm-riscv/trace.h            |  12 +
> >  xen/include/asm-riscv/types.h            |  73 ++
> >  xen/include/asm-riscv/vm_event.h         |  61 ++
> >  xen/include/asm-riscv/xenoprof.h         |  12 +
> >  xen/include/public/arch-riscv.h          | 181 +++++
> >  xen/include/public/arch-riscv/hvm/save.h |  39 +
> >  xen/include/public/hvm/save.h            |   2 +
> >  xen/include/public/pmu.h                 |   2 +
> >  xen/include/public/xen.h                 |   2 +
> >  103 files changed, 9064 insertions(+), 42 deletions(-)
> >  create mode 100644 config/riscv64.mk
> >  create mode 100644 tools/libxc/xc_core_riscv.h
> >  create mode 100644 xen/arch/riscv/Kconfig
> >  create mode 100644 xen/arch/riscv/Makefile
> >  create mode 100644 xen/arch/riscv/Rules.mk
> >  create mode 100644 xen/arch/riscv/asm-offsets.c
> >  create mode 100644 xen/arch/riscv/configs/riscv32_defconfig
> >  create mode 100644 xen/arch/riscv/configs/riscv64_defconfig
> >  create mode 100644 xen/arch/riscv/delay.c
> >  create mode 100644 xen/arch/riscv/domain.c
> >  create mode 100644 xen/arch/riscv/domctl.c
> >  create mode 100644 xen/arch/riscv/guestcopy.c
> >  create mode 100644 xen/arch/riscv/head.S
> >  create mode 100644 xen/arch/riscv/irq.c
> >  create mode 100644 xen/arch/riscv/lib/Makefile
> >  create mode 100644 xen/arch/riscv/lib/find_next_bit.c
> >  create mode 100644 xen/arch/riscv/mm.c
> >  create mode 100644 xen/arch/riscv/p2m.c
> >  create mode 100644 xen/arch/riscv/percpu.c
> >  create mode 100644 xen/arch/riscv/platforms/Kconfig
> >  create mode 100644 xen/arch/riscv/setup.c
> >  create mode 100644 xen/arch/riscv/shutdown.c
> >  create mode 100644 xen/arch/riscv/smp.c
> >  create mode 100644 xen/arch/riscv/smpboot.c
> >  create mode 100644 xen/arch/riscv/sysctl.c
> >  create mode 100644 xen/arch/riscv/time.c
> >  create mode 100644 xen/arch/riscv/traps.c
> >  create mode 100644 xen/arch/riscv/vm_event.c
> >  create mode 100644 xen/arch/riscv/xen.lds.S
> >  create mode 100644 xen/drivers/passthrough/riscv/Makefile
> >  create mode 100644 xen/drivers/passthrough/riscv/iommu.c
> >  create mode 100644 xen/include/asm-riscv/altp2m.h
> >  create mode 100644 xen/include/asm-riscv/asm.h
> >  create mode 100644 xen/include/asm-riscv/atomic.h
> >  create mode 100644 xen/include/asm-riscv/bitops.h
> >  create mode 100644 xen/include/asm-riscv/bug.h
> >  create mode 100644 xen/include/asm-riscv/byteorder.h
> >  create mode 100644 xen/include/asm-riscv/cache.h
> >  create mode 100644 xen/include/asm-riscv/cmpxchg.h
> >  create mode 100644 xen/include/asm-riscv/config.h
> >  create mode 100644 xen/include/asm-riscv/csr.h
> >  create mode 100644 xen/include/asm-riscv/current.h
> >  create mode 100644 xen/include/asm-riscv/debugger.h
> >  create mode 100644 xen/include/asm-riscv/delay.h
> >  create mode 100644 xen/include/asm-riscv/desc.h
> >  create mode 100644 xen/include/asm-riscv/device.h
> >  create mode 100644 xen/include/asm-riscv/div64.h
> >  create mode 100644 xen/include/asm-riscv/domain.h
> >  create mode 100644 xen/include/asm-riscv/event.h
> >  create mode 100644 xen/include/asm-riscv/fence.h
> >  create mode 100644 xen/include/asm-riscv/flushtlb.h
> >  create mode 100644 xen/include/asm-riscv/grant_table.h
> >  create mode 100644 xen/include/asm-riscv/guest_access.h
> >  create mode 100644 xen/include/asm-riscv/guest_atomics.h
> >  create mode 100644 xen/include/asm-riscv/hardirq.h
> >  create mode 100644 xen/include/asm-riscv/hypercall.h
> >  create mode 100644 xen/include/asm-riscv/init.h
> >  create mode 100644 xen/include/asm-riscv/io.h
> >  create mode 100644 xen/include/asm-riscv/iocap.h
> >  create mode 100644 xen/include/asm-riscv/iommu.h
> >  create mode 100644 xen/include/asm-riscv/irq.h
> >  create mode 100644 xen/include/asm-riscv/mem_access.h
> >  create mode 100644 xen/include/asm-riscv/mm.h
> >  create mode 100644 xen/include/asm-riscv/monitor.h
> >  create mode 100644 xen/include/asm-riscv/nospec.h
> >  create mode 100644 xen/include/asm-riscv/numa.h
> >  create mode 100644 xen/include/asm-riscv/p2m.h
> >  create mode 100644 xen/include/asm-riscv/page.h
> >  create mode 100644 xen/include/asm-riscv/paging.h
> >  create mode 100644 xen/include/asm-riscv/pci.h
> >  create mode 100644 xen/include/asm-riscv/percpu.h
> >  create mode 100644 xen/include/asm-riscv/pgtable-bits.h
> >  create mode 100644 xen/include/asm-riscv/processor.h
> >  create mode 100644 xen/include/asm-riscv/random.h
> >  create mode 100644 xen/include/asm-riscv/regs.h
> >  create mode 100644 xen/include/asm-riscv/riscv_encoding.h
> >  create mode 100644 xen/include/asm-riscv/setup.h
> >  create mode 100644 xen/include/asm-riscv/smp.h
> >  create mode 100644 xen/include/asm-riscv/softirq.h
> >  create mode 100644 xen/include/asm-riscv/spinlock.h
> >  create mode 100644 xen/include/asm-riscv/string.h
> >  create mode 100644 xen/include/asm-riscv/sysregs.h
> >  create mode 100644 xen/include/asm-riscv/system.h
> >  create mode 100644 xen/include/asm-riscv/time.h
> >  create mode 100644 xen/include/asm-riscv/trace.h
> >  create mode 100644 xen/include/asm-riscv/types.h
> >  create mode 100644 xen/include/asm-riscv/vm_event.h
> >  create mode 100644 xen/include/asm-riscv/xenoprof.h
> >  create mode 100644 xen/include/public/arch-riscv.h
> >  create mode 100644 xen/include/public/arch-riscv/hvm/save.h
> >
> > --
> > 2.25.0
> >
> > The source code can be found on github:
> >       https://github.com/beshleman/xen/tree/port-to-risc-v
> >
> > The patchset only targets the QEMU virt board and it is tested on
> > Alistair Francis's patchset for QEMU with RISC-V hypervisor extensions
> > v0.5, found here:
> >       https://github.com/alistair23/qemu/tree/mainline/alistair/riscv-hyp-ext-v0.5.next
> >
> > QEMU is built with:
> >       git clone --single-branch --branch mainline/alistair/riscv-hyp-ext-v0.5.next \
> >               https://github.com/alistair23/qemu.git
> >         cd qemu
> >         mkdir build && cd build
> >         ../configure --target-list=riscv64-softmmu
> >       make -j$(nproc) && make install
> >
> > The bootloader used is the standard OpenSBI, built with the command:
> >       CROSS_COMPILE=riscv64-unknown-linux-gnu- PLATFORM=qemu/virt FW_PAYLOAD_PATH=../xen/xen/xen make
> >
> > Xen/RISC-V is built with:
> >       XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-unknown-linux-gnu- make build
> >
> > Xen may be ran with the following command:
> >       qemu-system-riscv64 -cpu rv64,x-h=true -M virt -m 512M -display none \
> >               -serial stdio -kernel \
> >               opensbi/build/platform/qemu/virt/firmware/fw_payload.elf
> >
> > Also, shoutout to Alistair Francis (from Western Digital) for getting
> > the ball rolling and doing a ton of the groundwork with
> > Makefile/Kconfig, a ton of the RISC-V specific header files, and also
> > the QEMU RISC-V H extension support, and Dan Robertson (a colleague of
> > mine at Star Lab) for help in forward porting a number of patches that
> > were out-of-sync with upstream.
> >
> >
> > Thanks,
> > Bobby Eshleman
> >
>

