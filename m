Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5B7E7E0D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630693.983802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1V4t-0003nj-Qo; Fri, 10 Nov 2023 17:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630693.983802; Fri, 10 Nov 2023 17:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1V4t-0003lT-OH; Fri, 10 Nov 2023 17:13:55 +0000
Received: by outflank-mailman (input) for mailman id 630693;
 Fri, 10 Nov 2023 17:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQp4=GX=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1r1V4s-0003k6-Bt
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 17:13:54 +0000
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 858fe123-7fec-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 18:13:53 +0100 (CET)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5bd306f86a8so1752176a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 09:13:53 -0800 (PST)
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
X-Inumbo-ID: 858fe123-7fec-11ee-98da-6d05b1d4d9a1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699636431; x=1700241231;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVi8oTH9zuAkT0OVs00wtfUSou3jOH0w/CTAuMn80J0=;
        b=WK7d/dnLYIyyFciCXItNb1VEnGQ5JR5zHOh6JKTU/xJxM86+Yo3fqv7Wq6wGQ/kajb
         HamxoZOdvs8rvNav2SioZCs3LrGSZeXU+qGzwWeLO9QNdTNGu66RIgpAPAOjRwBeyfEn
         TvHX/aLPOprefCa+tjZ42D9ik/5Es3gMWJkvzW4RSpMeEfcqMPizyM8eAaJsw34Hzs6h
         BDb84fKOmIvk90J/Rn5XuGsjep5DYAeH/qNSTGBE7RHYoWmfwfu+1KP2oeI+aqls1iI4
         H7V82r/4LIMMTZSxW4cU5qCffVvNXo1aQVDatpH/0780or5KfKqM3capt9kApKFtcQuf
         1bBA==
X-Gm-Message-State: AOJu0YxqQoTx18R8oVnMOmD5oecZB5oITifsZljTiDNe12aqzQXWF0bp
	5bIVERNW9KH5zxyJu4xbHYzvkkPIrDoitqOKIkN6ASyB90c=
X-Google-Smtp-Source: AGHT+IG/2BdV8wUptp38EtEZApMenGiiFiVQ2DGv9NI9RBH5FGUbS+juhLxUY6Q6CtUE6VooiVVvJWTAedt1sWwj5Xw=
X-Received: by 2002:a17:90b:4b84:b0:27e:1ea0:c6fc with SMTP id
 lr4-20020a17090b4b8400b0027e1ea0c6fcmr5365595pjb.6.1699636431319; Fri, 10 Nov
 2023 09:13:51 -0800 (PST)
MIME-Version: 1.0
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sat, 11 Nov 2023 01:13:39 +0800
Message-ID: <CAKhsbWYxEjkccdVWhnJdkjdR7zBZ9OjywLfuSC9DDALO2iwXMg@mail.gmail.com>
Subject: Booting HVM domU through OVMF failed with assertion `rsdp_paddr != 0`
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying out to boot domU through UEFI path but so far made very
little progress.
I'm currently on a self-built XEN 4.16.1 hypervisor version without
the --enable-ovmf configuration. I attempted a dirty build to generate
the ovmf.bin firmware. The build succeeds but chery-picking the
firmware does not give me a working UEFI domU. The VNC simply stays
blank forever. I could not collect any debug log from it.

I also tried the ovmf package coming with the Debian package but it's
even worse -- it prevents the domU creation if I point the firmware to
it.

The one that looks more promising is the one that I extract from a
Fedora edk2-ovmf-xen package. This one gives me an VNC screen saying
"Guest has not initialized the display". But luckily I finally got
something useful from the debug log.

As shown in the quoted log below, OVMF complains about the RSDP
address not available.
Any idea what is happening here?

Note that I'm with a self-built XEN binary without --enable-ovmf, plus
external built ovmf binary. I'm not sure if this combo is supposed to
work. I'm building a clean XEN 4.17.2 with --enable-ovmf now for a
comparison.

Thanks,
Rui

OVMF debug log:
...
Loading PEIM at 0x000008347C0 EntryPoint=0x00000836849 XenPlatformPei.efi
Platform PEIM Loaded
CMOS:
00: 33 00 30 00 23 00 05 10 11 23 26 02 00 80 00 00
10: 00 00 00 00 06 80 02 FF FF 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: FF FF 20 00 00 EF 00 20 00 00 00 00 00 04 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 0F 00 00 03
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
QemuFwCfgProbe: Supported 0, DMA 0
Detected Xen version 4.16
ASSERT /builddir/build/BUILD/edk2-819cfc6b42a6/OvmfPkg/XenPlatformPei/Xen.c(210):
HVMStartInfo->rsdp_paddr != 0

domU config:
name = 'newwin10'
type="hvm"
vcpus = '4'
cpus = "0-4"
memory = '4096'
boot = 'n'
firmware='/usr/lib/xen/boot/OVMF.fd'
device_model_args_hvm = [
  # Debug OVMF
  '-chardev', 'file,id=debugcon,path=/var/log/xen/ovmf.log,',
  '-device', 'isa-debugcon,iobase=0x402,chardev=debugcon',
]
vif = [ 'mac=00:18:3E:51:48:4C,bridge=xenbr0,model=e1000' ]
on_poweroff = 'destroy'
on_reboot = 'restart'
on_crash = 'destroy'
xen_platform_pci='1'
viridian='defaults'
vga="stdvga"
localtime='1'
usbdevice='tablet'
vnc='1'
vnclisten = '0.0.0.0'
serial='pty'

