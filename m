Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE228A05C
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 14:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5410.14125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRDr6-0003dj-U1; Sat, 10 Oct 2020 12:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5410.14125; Sat, 10 Oct 2020 12:20:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRDr6-0003dK-QY; Sat, 10 Oct 2020 12:20:08 +0000
Received: by outflank-mailman (input) for mailman id 5410;
 Sat, 10 Oct 2020 12:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p5/m=DR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kRDr5-0003dF-AP
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:20:07 +0000
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05f8832b-8dc8-45f8-a304-889b28cc54cd;
 Sat, 10 Oct 2020 12:20:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=p5/m=DR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kRDr5-0003dF-AP
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:20:07 +0000
X-Inumbo-ID: 05f8832b-8dc8-45f8-a304-889b28cc54cd
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 05f8832b-8dc8-45f8-a304-889b28cc54cd;
	Sat, 10 Oct 2020 12:20:05 +0000 (UTC)
Date: Sat, 10 Oct 2020 12:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1602332404;
	bh=lsIhnCOWcS2GB63jUq+46D0wd98PJU/sk4wtEKJjRgA=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=Ey1l4XkhHwSBEVGJvuI2Emz9gNIi2omYXgLpHM1AGiD+nc493513yXQ5cd9agFZS4
	 bYK7KGtgbBuB1y3IyO1oh5ZeAVtoMuOfyRTPygWQTDFzLxe02vRPmRtBvyjr4OBcjz
	 RCPxhzXfoTNzdYQfoNeWxZNYTAhMQ/pD2TgIVyQI=
To: Trammell Hudson <hudson@trmm.net>
From: Trammell Hudson <hudson@trmm.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
Message-ID: <KEN3Xd8rbniZ349uB92E_Xej14BVyItkPHvTZ3HnlhQc1w79RbgIbkFWBcNKotWLWXBqb6VkmCdIhgzpWMd8jn77lSkLCH_gSp-ARmzMBUc=@trmm.net>
In-Reply-To: <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
References: <osstest-155612-mainreport@xen.org> <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com> <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Saturday, October 10, 2020 1:42 PM, Trammell Hudson <hudson@trmm.net> wr=
ote:
> On Friday, October 9, 2020 10:27 PM, Andrew Cooper andrew.cooper3@citrix.=
com wrote:
> > [...]
> > Looks like arm64 is crashing fairly early on boot.
> > This is probably caused by "efi: Enable booting unified
> > hypervisor/kernel/initrd images".
>
> Darn it. I'm working out how to build and boot qemu aarch64 so
> that I can figure out what is going on.

Unfortunately qemu 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.32)
doesn't replicate this crash using the command line from
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qem=
u-system-aarch64


qemu-system-aarch64 \
        -cpu cortex-a57 \
        -smp 4 -m 4096 \
        -machine virt,gic_version=3D3 \
        -machine virtualization=3Dtrue \
        -machine type=3Dvirt \
        -display none \
        -serial mon:stdio \
        -bios /usr/share/qemu-efi-aarch64/QEMU_EFI.fd \
        -drive if=3Dnone,file=3Dxenial-server-cloudimg-arm64-uefi1.img,id=
=3Dhd0 \
        -device virtio-blk-device,drive=3Dhd0 \
        -boot order=3Dd
[...]
Xen 4.15-unstable (c/s Fri Oct 2 12:30:34 2020 +0200 git:8a62dee9ce) EFI lo=
ader
Using configuration file 'BOOTAA64.cfg'
virt-gicv3.dtb: 0x000000013bebe000-0x000000013bece000
kernel: 0x000000013aecd000-0x000000013bd12200
initrd: 0x0000000138ced000-0x000000013aecc3bb
 __  __            _  _    _ ____                     _        _     _
 \ \/ /___ _ __   | || |  / | ___|    _   _ _ __  ___| |_ __ _| |__ | | ___
  \  // _ \ '_ \  | || |_ | |___ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ =
\
  /  \  __/ | | | |__   _|| |___) |__| |_| | | | \__ \ || (_| | |_) | |  __=
/
 /_/\_\___|_| |_|    |_|(_)_|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___=
|

(XEN) Xen version 4.15-unstable (hudson@) (aarch64-linux-gnu-gcc (Ubuntu/Li=
naro 7.5.0-3ubuntu1~18.04) 7.5.0) debug=3Dn  Sat Oct 10 08:42:30 CEST 2020
(XEN) Latest ChangeSet: Fri Oct 2 12:30:34 2020 +0200 git:8a62dee9ce
(XEN) Processor: 411fd070: "ARM Limited", variant: 0x1, part 0xd07, rev 0x0

[...]


It makes it all the way into the Linux kernel and user space
without crashing.  Hopefully someone with better access to ARM
hardware can help debug!

--
Trammell

