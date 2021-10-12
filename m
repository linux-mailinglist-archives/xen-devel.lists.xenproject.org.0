Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4942AF96
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207719.363622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQ4v-0004vC-Rx; Tue, 12 Oct 2021 22:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207719.363622; Tue, 12 Oct 2021 22:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQ4v-0004ro-Ov; Tue, 12 Oct 2021 22:16:57 +0000
Received: by outflank-mailman (input) for mailman id 207719;
 Tue, 12 Oct 2021 22:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maQ4t-0004ri-Pb
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:16:55 +0000
Received: from mail-il1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90d86e1-578c-4872-ba9c-1eb57b31c0b7;
 Tue, 12 Oct 2021 22:16:54 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id w10so582321ilc.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 15:16:54 -0700 (PDT)
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
X-Inumbo-ID: c90d86e1-578c-4872-ba9c-1eb57b31c0b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y8u6sewFGmQKbqoBjnukgKcLj682SKmRME9UMPO/81M=;
        b=VYSVkTvcP+E9CsRNrYmxxDr6MLfsQD8gETS5VVB5I4OIVU9CGooSRhXF/x4hDtcJiT
         lqSjsig6RDb9tL/+pSskI46HDTv1zNoxjQcMm/ze1Gti7BuPM3Tn5/mgKpcaFpPtd9yL
         J43uJJT05sT1IO3xz/cSeRsieDSTPY6VyOWLwTZlu5Ad1IFDExzvLB4tNAP+AXLl9g4R
         SmBrj7XVWU/R1tmMhOLbsc56mrobQOix5Ff2c7Ny/N3WJ15WEO4CKtgwd7P4IfVdmyDa
         Kuo1zFwgXZI99kp/EumCKHY0gOx8jnC5WwapPlZXrNxgRLFsoeEZlETAFFAYZbL8nDqF
         H7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y8u6sewFGmQKbqoBjnukgKcLj682SKmRME9UMPO/81M=;
        b=Zj0mOVAD2j7vXwcj4aO40u+/W7J1X7SbFCjBRlpfPbrWt2/D67oEoSVafokCeX1/zj
         TlSblW4dvvm1MzU2tIvqwMPRzNio7tiCNJ/DA1Kwkusm4p1Xrus4Jo1PMbLcPpiAuaFd
         FIpfrdHtDqAqOt1D15PSTt0w5SOJ+mdBRk0NkUVZcz29du92fpjZGkAzVijsCV7iOitb
         SXInWg9uoxPMXMPO0h4jBteIht+TQ8CfxWXgapIlFuP9itpE6VYCHN7mY3/XlcM6YZxD
         sUl5IKe6tadeEV65uCbKSb0iSCuQvIhRObkFJphaR7eHn5hhVNCt6ZOxkEDRdM4YxJrU
         pCyA==
X-Gm-Message-State: AOAM5301SV4bi7hmsKCxgQu0+wpsoasj4RDaxWzVXC/r5dMYmG1xqI1p
	aBRcX5l0LjgvzJBzlp7M2MGjDEAMaVY6Ewhg3hk=
X-Google-Smtp-Source: ABdhPJz+pKBr8sJq+4PBGCrNMJ/2fChUgJjSegxseimlZl17yEiWjK8esp2u2bbu1fEv9gzbOOLOx0dCej2kJJyrcNo=
X-Received: by 2002:a05:6e02:1885:: with SMTP id o5mr4525636ilu.221.1634077013816;
 Tue, 12 Oct 2021 15:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:16:27 +1000
Message-ID: <CAKmqyKMUvtRPCp=FJMHcMdsECfJ_fRHBi4dA2N3gtqmPHspNJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:22 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> The goal of this work is to bring dynamic machine creation to QEMU:
> we want to setup a machine without compiling a specific machine C
> code. It would ease supporting highly configurable platforms (for
> example resulting from an automated design flow). The requirements
> for such configuration include begin able to specify the number of
> cores, available peripherals, emmory mapping, IRQ mapping, etc.
>
> This series focuses on the first step: populating a machine with
> devices during its creation. We propose patches to support this
> using QMP commands. This is a working set of patches and improves
> over the earlier rfc (posted in May):
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
>
> Although it is working and could be merged, it is tag as an RFC:
> we probably need to discuss the conditions for allowing a device to
> be created at an early stage. Patches 6, 10 and 13, 15 and 16 depend
> on such conditions and are subject to change. Other patches are
> unrelated to this point.
>
> We address several issues in this series. They are detailed below.
>
> ## 1. Stoping QEMU to populate the machine with devices
>
> QEMU goes through several steps (called _machine phases_) when
> creating the machine: 'no-machine', 'machine-created',
> 'accel-created', 'initialized', and finally 'ready'. At 'ready'
> phase, QEMU is ready to start (see Paolo's page
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence for
> more details).
>
> Using the -preconfig CLI option, QEMU can be stopped today during
> the 'accel-created' phase. Then the 'x-exit-preconfig' QMP command
> triggers QEMU moving forwards to the completion of the machine
> creation ('ready' phase).
>
> The devices are created during the 'initialized' phase.
> In this phase the machine init() method has been executed and thus
> machine properties have been handled. Although the sysbus exists and
> the machine may have been populated by the init(),
> _machine_init_done_ notifiers have not been called yet. At this point
> we can add more devices to a machine.
>
> We propose to add 2 QMP commands:
> + The 'query-machine-phase' command would return the current machine
>   phase.
> + The 'x-machine-init' command would advance the machine phase to
>   'initialized'. 'x-exit-preconfig' could then still be used to
>   advance to the last phase.
>
> ## 2. Adding devices
>
> Right now, the user can create devices in 2 ways: using '-device' CLI
> option or 'device_add' QMP command. Both are executed after the
> machine is ready: such devices are hot-plugged. We propose to allow
> 'device_add' QMP command to be used during the 'initialized' phase.
>
> In this series, we keep the constraint that the device must be
> 'user-creatable' (this is a device class flag). We do not see any
> reason why a device the user can hot-plug could not be created at an
> earlier stage.
>
> This part is still RFC because, as Peter mentioned it (in this thread
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01933.html),
> we may want additional or distinct conditions for:
> + device we can hot-plug
> + device we can add in '-preconfig' (cold-plug)
> We are open to suggestions. We could for example add a
> 'preconfig-creatable' or 'init-creatable' flag to device class, which
> can identify a set of devices we can create this way.
>
> The main addition is how we handle the case of sysbus devices. Sysbus
> devices are particular because unlike, for example, pci devices, you
> have to manually handle the memory mapping and interrupts wiring. So
> right now, a sysbus device is dynamically creatable (using -device
> CLI option or device_add QMP command) only if:
> + it is 'user_creatable' (like any other device),
> + and it is in the current machine sysbus device allow list.
>
> In this series, we propose to relax the second constraint during the
> earlier phases of machine creation so that when using -preconfig we
> can create any 'user-creatable' sysbus device. When the machine
> progresses to the 'ready' phase, sysbus devices creation will come
> back to the legacy behavior: it will be possible only based on the
> per-machine authorization basis.
>
> For sysbus devices, wiring interrupts is not a problem as we can use
> the 'qom-set' QMP command, but memory mapping is.
>
> ## 3. Memory mapping
>
> There is no point allowing the creation sysbus devices if we cannot
> map them onto the memory bus (the 'sysbus').
>
> As far as we know, right now, there is no way to add memory mapping
> for sysbus device using QMP commands. We propose a 'x-sysbus-mmio-map'
> command to do this. This command would only be allowed during the
> 'initialized' phase when using -preconfig.
>
> ## 4. Working example
>
> The last patches of the series add and modify devices in order to
> build a working machine starting from the 'none' machine.
>
> We add a new sysbus device modeling a simple memory (ram or rom). We
> also set 'user-creatable' flag of some sysbus devices. These are
> trivial patches, but they depends on the conditions we choose to allow
> creating devices with -preconfig. Therefore, there is really no need
> to review them until we settled on the device conditions first.
>
> With these devices (memory, ibex_uart, ibex_plic) we can dynamically
> configure a part (we did not add the timer, but we could) the
> opentitan machine very easily and run firmwares which demonstrates
> interrupts and memory-mapping are working.
>
> We use the existing qmp-shell script to issue machine devices
> from a qmp commands script file which contains qmp commands listed in
> a file.
>
> The following qmp commands add some memories, an interrupt controller
> and an uart with an interrupt.
>
> cat > opentitan.qmp <<EOF
> x-machine-init
>
> # ROM 0x00008000
> device_add        driver=sysbus-memory id=rom size=0x4000 readonly=true
> x-sysbus-mmio-map device=rom addr=32768
>
> # FLASH 0x20000000
> device_add        driver=sysbus-memory id=flash size=0x80000 readonly=true
> x-sysbus-mmio-map device=flash addr=536870912
>
> # RAM 0x10000000
> device_add        driver=sysbus-memory id=ram size=0x10000
> x-sysbus-mmio-map device=ram addr=268435456
>
> # PLIC 0x41010000
> device_add        driver=ibex-plic id=plic
> x-sysbus-mmio-map device=plic addr=1090584576
>
> # UART 0x40000000
> device_add        driver=ibex-uart id=uart chardev=serial0
> x-sysbus-mmio-map device=uart addr=1073741824
> qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
>
> x-exit-preconfig
> EOF
>
> We've put the opentitan.qmp and a firmware opentitan-echo.elf here
> (among some other qmp machine files we are working on):
> https://github.com/GreenSocs/qemu-qmp-machines

I am unable to access this repo, maybe it's not public?

Alistair

