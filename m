Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03150506192
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 03:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307677.522909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngcOe-0007lq-Ea; Tue, 19 Apr 2022 01:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307677.522909; Tue, 19 Apr 2022 01:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngcOe-0007jL-A8; Tue, 19 Apr 2022 01:11:12 +0000
Received: by outflank-mailman (input) for mailman id 307677;
 Tue, 19 Apr 2022 01:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcs0=U5=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1ngcOd-0007jF-Df
 for xen-devel@lists.xen.org; Tue, 19 Apr 2022 01:11:11 +0000
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [2607:f8b0:4864:20::d2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 986b63a3-bf7d-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 03:11:10 +0200 (CEST)
Received: by mail-io1-xd2b.google.com with SMTP id 79so7883904iou.7
 for <xen-devel@lists.xen.org>; Mon, 18 Apr 2022 18:11:09 -0700 (PDT)
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
X-Inumbo-ID: 986b63a3-bf7d-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npRBzAa9weMhje/sr00rqCUwY7iCXEij6kRS7kNmJsY=;
        b=w2E+okI2hzbkNZWAOUtk8qXj4s9ndQWv9mspXFlclJZ9xnVXCEAo1k+01IwyK4bXUQ
         7oaHuoVoFwnAwAXc3tFM65iYmeg83xiVi+WXU7C7mM2tJ07cgbeQ8nDYFkSWIHUnyOPG
         8BDXZQPu9dyu4R0SiaZzXVUeccO0BSOx7rjTsumeHf2WB+nh3j5D6KdNsZ3zYCE7S0Hl
         cubUZNFKXkSyJVG4Le/wwMNMC92edT0pGPabL+vD19TsnhbbejX5nRXbmu3JH6M8umnz
         wMxtnDxo0X2Z+s034UbBKcdLHa2YVSK0q3W18hbkE0yHbReW6T6rSMRxEi3TQsTELHI8
         gGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npRBzAa9weMhje/sr00rqCUwY7iCXEij6kRS7kNmJsY=;
        b=Bh5oxntnCEflrtgzhqNtd1AVbGXPTZTVSY4eevFRVOvQe3SYX4lGD2tTup1uCDvomv
         ulGDxefEEssAfrp5sBx3a4dv5FwjI26vHfEtWLI8YNuB2fbq+AxdoWvANDPCzPgDVj2+
         xdJHtiKTpUnEF+UvXmcHuS7LGLd+Emm/vCBmeicLyBRWT05xifhyjsW6pJvUOysVf6V4
         jaLPYQ8vuzFi03jod8RjO9C3Gn3nH+ZG4VllddK5sAnV8KiqwSd3cJCt66JojFriAATE
         ff/hk729zV+yEE9UZjfGjpv2+5taQmwvJoeSi0hMOtVpxaEdVoGmd+a0HKk+ai6raBlx
         UJ6w==
X-Gm-Message-State: AOAM531c9zyLxUHd0FhV+4TM465zF1jrcp+qmkHbFS9QcFBmCurZHR7d
	Q9+EHroVRqUYbPgF7iM7MM8YzCVi9VNI23GE3wEYNQ==
X-Google-Smtp-Source: ABdhPJzqX0yCNlbHhnLFkFVIY8mnKLvd386rn31Re56wRPFC6xFim/AR5qcxrw/l2KN0fHtavTwBGX0XTOQIAHDbWD8=
X-Received: by 2002:a05:6638:328f:b0:328:884a:c97a with SMTP id
 f15-20020a056638328f00b00328884ac97amr3060755jav.19.1650330668487; Mon, 18
 Apr 2022 18:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7> <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
In-Reply-To: <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 19 Apr 2022 06:40:57 +0530
Message-ID: <CAKohpomBcWWXxip4uvW_kmPpANobKpU2zUx2P9Z+-=PaYCoPQw@mail.gmail.com>
Subject: Re: Virtio on Xen with Rust
To: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, xen-devel@lists.xen.org, 
	rust-vmm@lists.opendev.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Mike Holmes <mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

+rust-vmm@lists.opendev.org

On Thu, 14 Apr 2022 at 14:54, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> +xen-devel
>
> On 14-04-22, 14:45, Viresh Kumar wrote:
> > Hello,
> >
> > We verified our hypervisor-agnostic Rust based vhost-user backends with Qemu
> > based setup earlier, and there was growing concern if they were truly
> > hypervisor-agnostic.
> >
> > In order to prove that, we decided to give it a try with Xen, a type-1
> > bare-metal hypervisor.
> >
> > We are happy to announce that we were able to make progress on that front and
> > have a working setup where we can test our existing Rust based backends, like
> > I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
> >
> > Key components:
> > --------------
> >
> > - Xen: https://github.com/vireshk/xen
> >
> >   Xen requires MMIO and device specific support in order to populate the
> >   required devices at the guest. This tree contains four patches on the top of
> >   mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).
> >
> > - libxen-sys: https://github.com/vireshk/libxen-sys
> >
> >   We currently depend on the userspace tools/libraries provided by Xen, like
> >   xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates provides Rust
> >   wrappers over those calls, generated automatically with help of bindgen
> >   utility in Rust, that allow us to use the installed Xen libraries. Though we
> >   plan to replace this with Rust based "oxerun" (find below) in longer run.
> >
> > - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen-ioctls
> >
> >   This is Rust based implementations for Ioctl and hypercalls to Xen. This is WIP
> >   and should eventually replace "libxen-sys" crate entirely (which are C based
> >   implementation of the same).
> >
> > - vhost-device: https://github.com/vireshk/vhost-device
> >
> >   These are Rust based vhost-user backends, maintained inside the rust-vmm
> >   project. This already contain support for I2C and RNG, while GPIO is under
> >   review. These are not required to be modified based on hypervisor and are
> >   truly hypervisor-agnostic.
> >
> >   Ideally the backends are hypervisor agnostic, as explained earlier, but
> >   because of the way Xen maps the guest memory currently, we need a minor update
> >   for the backends to work. Xen maps the memory via a kernel file
> >   /dev/xen/privcmd, which needs calls to mmap() followed by an ioctl() to make
> >   it work. For this a hack has been added to one of the rust-vmm crates,
> >   vm-virtio, which is used by vhost-user.
> >
> >   https://github.com/vireshk/vm-memory/commit/54b56c4dd7293428edbd7731c4dbe5739a288abd
> >
> >   The update to vm-memory is responsible to do ioctl() after the already present
> >   mmap().
> >
> > - vhost-user-master (WIP): https://github.com/vireshk/vhost-user-master
> >
> >   This implements the master side interface of the vhost protocol, and is like
> >   the vhost-user-backend (https://github.com/rust-vmm/vhost-user-backend) crate
> >   maintained inside the rust-vmm project, which provides similar infrastructure
> >   for the backends to use. This shall be hypervisor independent and provide APIs
> >   for the hypervisor specific implementations. This will eventually be
> >   maintained inside the rust-vmm project and used by all Rust based hypervisors.
> >
> > - xen-vhost-master (WIP): https://github.com/vireshk/xen-vhost-master
> >
> >   This is the Xen specific implementation and uses the APIs provided by
> >   "vhost-user-master", "oxerun" and "libxen-sys" crates for its functioning.
> >
> >   This is designed based on the EPAM's "virtio-disk" repository
> >   (https://github.com/xen-troops/virtio-disk/) and is pretty much similar to it.
> >
> >   One can see the analogy as:
> >
> >   Virtio-disk == "Xen-vhost-master" + "vhost-user-master" + "oxerun" + "libxen-sys" + "vhost-device".
> >
> >
> >
> > Test setup:
> > ----------
> >
> > 1. Build Xen:
> >
> >   $ ./configure --libdir=/usr/lib --build=x86_64-unknown-linux-gnu --host=aarch64-linux-gnu --disable-docs --disable-golang --disable-ocamltools --with-system-qemu=/root/qemu/build/i386-softmmu/qemu-system-i386;
> >   $ make -j9 debball CROSS_COMPILE=aarch64-linux-gnu- XEN_TARGET_ARCH=arm64
> >
> > 2. Run Xen via Qemu on X86 machine:
> >
> >   $ qemu-system-aarch64 -machine virt,virtualization=on -cpu cortex-a57 -serial mon:stdio \
> >         -device virtio-net-pci,netdev=net0 -netdev user,id=net0,hostfwd=tcp::8022-:22 \
> >         -device virtio-scsi-pci -drive file=/home/vireshk/virtio/debian-bullseye-arm64.qcow2,index=0,id=hd0,if=none,format=qcow2 -device scsi-hd,drive=hd0 \
> >         -display none -m 8192 -smp 8 -kernel /home/vireshk/virtio/xen/xen \
> >         -append "dom0_mem=5G,max:5G dom0_max_vcpus=7 loglvl=all guest_loglvl=all" \
> >         -device guest-loader,addr=0x46000000,kernel=/home/vireshk/kernel/barm64/arch/arm64/boot/Image,bootargs="root=/dev/sda2 console=hvc0 earlyprintk=xen" \
> >         -device ds1338,address=0x20     # This is required to create a virtual I2C based RTC device on Dom0.
> >
> >   This should get Dom0 up and running.
> >
> > 3. Build rust crates:
> >
> >   $ cd /root/
> >   $ git clone https://github.com/vireshk/xen-vhost-master
> >   $ cd xen-vhost-master
> >   $ cargo build
> >
> >   $ cd ../
> >   $ git clone https://github.com/vireshk/vhost-device
> >   $ cd vhost-device
> >   $ cargo build
> >
> > 4. Setup I2C based RTC device
> >
> >   $ echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device; echo 0-0020 > /sys/bus/i2c/devices/0-0020/driver/unbind
> >
> > 5. Lets run everything now
> >
> >   # Start the I2C backend in one terminal (open new terminal with "ssh
> >   # root@localhost -p8022"). This tells the I2C backend to hook up to
> >   # "/root/vi2c.sock0" socket and wait for the master to start transacting.
> >   $ /root/vhost-device/target/debug/vhost-device-i2c -s /root/vi2c.sock -c 1 -l 0:32
> >
> >   # Start the xen-vhost-master in another terminal. This provides the path of
> >   # the socket to the master side and the device to look from Xen, which is I2C
> >   # here.
> >   $ /root/xen-vhost-master/target/debug/xen-vhost-master --socket-path /root/vi2c.sock0 --name i2c
> >
> >   # Start guest in another terminal, i2c_domu.conf is attached. The guest kernel
> >   # should have Virtio related config options enabled, along with i2c-virtio
> >   # driver.
> >   $ xl create -c  i2c_domu.conf
> >
> >   # The guest should boot fine now. Once the guest is up, you can create the I2C
> >   # RTC device and use it. Following will create /dev/rtc0 in the guest, which
> >   # you can configure with 'hwclock' utility.
> >
> >   $ echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device
> >
> >
> > Hope this helps.
> >
> > --
> > viresh
>
> i2c_domu.conf
>
> > kernel="/root/Image"
> > memory=512
> > vcpus=2
> > command="console=hvc0 earlycon=xenboot"
> > name="domu"
> > i2c = [ "virtio=true, irq=1, base=1" ]
>
> --
> viresh

