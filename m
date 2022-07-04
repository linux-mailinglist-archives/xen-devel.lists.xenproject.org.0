Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B449D5659FE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360439.589822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O8f-0006H1-3Y; Mon, 04 Jul 2022 15:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360439.589822; Mon, 04 Jul 2022 15:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O8e-0006FF-W5; Mon, 04 Jul 2022 15:37:28 +0000
Received: by outflank-mailman (input) for mailman id 360439;
 Mon, 04 Jul 2022 15:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbiE=XJ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8O8d-0006F9-9L
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 15:37:27 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34753ffc-fbaf-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 17:37:26 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id z19so12138196edb.11
 for <xen-devel@lists.xen.org>; Mon, 04 Jul 2022 08:37:26 -0700 (PDT)
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
X-Inumbo-ID: 34753ffc-fbaf-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V821VNgVDeNTuc3xWlXE8cl0xteh2r5o2laVaFusuTQ=;
        b=c3avP+iEZ6hOt1INuILUJL21rtop0/Mv/C0zKhFmQ1MDHBNJvN+Uc0dQRMrO7CftEu
         WAMuJLr4OiNWJ9osO65a3+TeT7dosohxi6PZKyLuUpngf8Y3ZnOPjq41OtJY2esVIQnm
         aHzgRJteUSDIL3jISRXq28/jUbyBUgFCS+vij3x5NdDNpOH6tqLRxAcLUceuC+zBtLn0
         eyI9aw3wKFm5eXonKBLB1C8bXzmX9wpRYTlRBRWENYRjs05SWCLuOojJN5SrunGHRalZ
         wGNfFQdvnZ+vkmCcvb8tuUu6hsDon3/RW/HP8p+Oh2rX7U4fidPqHJWU5ZVXvsrWGUwQ
         RkFg==
X-Gm-Message-State: AJIora9Y7bTe2FMNnG5IO3gb4JgFj1rzZF59I2X3Hdi0jjo/Uh1aHp/n
	MZz4WTeQQEd1ffuQCr1Byj/1+d/2iEL6Rzu6QVAH0RiVSbY=
X-Google-Smtp-Source: AGRyM1uPNTHIGoeKcCWGStKa+L4bKU4mwP4aehiW2j0VHKI7LwjNMyn7bYUpU5aP4zCKJdVBm/Dlt914CSh5yHDYDoc=
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id
 b15-20020a056402084f00b004376293d264mr38978936edz.317.1656949045647; Mon, 04
 Jul 2022 08:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
In-Reply-To: <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 4 Jul 2022 23:37:13 +0800
Message-ID: <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 11:15 PM G.R. <firemeteor@users.sourceforge.net> wro=
te:
>
> On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.net> w=
rote:
> >
> > On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
> > > Can you paste the lspci -vvv output for any other device you are also
> > > passing through to this guest?
> > >
>
> As reminded by this request, I tried to assign this nvme device to
> another FreeBSD12 domU.
Just to clarify, this time this NVME SSD is the only device I passed to thi=
s VM.

> This time it does not fail at the VM setup stage, but the device is
> still not usable at the domU.
> The nvmecontrol command is not able to talk to the device at all:
> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
>
> The QEMU log says the following:
> 00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00)
> [00:05.0] If the device doesn't work, try enabling permissive mode
> [00:05.0] (unsafe) and if it helps report the problem to xen-devel
> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, en=
try 0)

I retried with the following:
pci=3D['05:00.0,permissive=3D1,msitranslate=3D1']
Those extra options suppressed some error logging, but still didn't
make the device usable to the domU.
The nvmecontrol command still get ABORTED result from the kernel...

The only thing remained in the QEMU file is this one:
[00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entr=
y 0)

The xl dmesg appears to be identical except this line is gone:
(XEN) d[IO]: assign (0000:05:00.0) failed (-16)
And in both case I see the following, which suggests that the MSI-X
failure is worked-around.
(XEN) d5: bind: m_gsi=3D16 g_gsi=3D36 dev=3D00.00.5 intx=3D0

What's the current situation now?

