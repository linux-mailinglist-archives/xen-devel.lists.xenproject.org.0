Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A848E9B9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 13:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257615.442771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8LQA-0005YO-5S; Fri, 14 Jan 2022 12:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257615.442771; Fri, 14 Jan 2022 12:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8LQA-0005VW-2D; Fri, 14 Jan 2022 12:11:06 +0000
Received: by outflank-mailman (input) for mailman id 257615;
 Fri, 14 Jan 2022 12:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jE+k=R6=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n8LQ8-0005VQ-GH
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 12:11:04 +0000
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [2a00:1450:4864:20::142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0af7953e-7533-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 13:11:03 +0100 (CET)
Received: by mail-lf1-x142.google.com with SMTP id x7so29578673lfu.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 04:11:03 -0800 (PST)
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
X-Inumbo-ID: 0af7953e-7533-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9HSPfpZR8+pMVUv3RXOaz8/KH5DGW8dXNoDKn7sNBzY=;
        b=ivaw3k3D8lseOBTTV6IZWPjPephoywjQF0ZMKccC8LbD1n7TpGQuspjGEtZm8ThW1m
         /y8rwvtoKGgcmmJE9iRYzBOpot1QUSFuFZZNlgw+g7BNE9S005ZoxioHvhNm4XYCflJY
         UiygjZigqncfVarc67ULmx/xf0KhFDdQnlHArkYQ16yTEanMqtdeZgLcAEm11hwjd4yv
         I3vM1FHjdQxmveEQifKckhUyRrrGmc20jtq4GtteUd+5aAXo6XnvFi1JEotQsP7KhPl9
         4SGuTLLTLcmPoEbzymvLNPV1e1eMbnAas1Pj4Y9PvBW3vceFvPWHKFJwaPcoVVvJDcet
         ibTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9HSPfpZR8+pMVUv3RXOaz8/KH5DGW8dXNoDKn7sNBzY=;
        b=419y825BlTWritxYWRBkG5Es5aZ9yFA4KugcG9Q5s3DgLKS3J3bjC9Mx4ldru+hOqo
         wSJeKqF5QK6fNHZ+Ihq+bLLSKTD3yy5qy50DAYV6cRTo1e/eCiskhgXcR/CQV9dwBMFs
         NjDfiLAWDugZ+8xl4kBg9SkJdktcI3WHQQrzsF57hO9MyviLSAdJOBmuMNVONBQvuOJr
         50H7QyI/kDyWe357B+4ImGTEMJk2ysk3s1ihwphqkmt/3NbTrknflr2LvaDeBqZqLqzR
         0NbMPkui88xA5bdXSCfJxiilNkiScrKF91tCn4oQcbYDddihC3FaNhFj2Rjy0rvFYFrW
         RvKw==
X-Gm-Message-State: AOAM530V4VawACbqivFqrXPMxUmVSV7P0uQvxYaWZn7uuH+ZyItlGW+n
	hGbL3TgmLJwD+Y/dkeTpUso82WWeSVORB92/Qc0=
X-Google-Smtp-Source: ABdhPJxAjZ98hHwq9qIz7u16/cquKwEfy+P8d05ZMbqDsNxis4gCEXRFjZ6sKUu65Hu/3VHJLt97cLIF9EDY42ku/xs=
X-Received: by 2002:a05:6512:2314:: with SMTP id o20mr6955282lfu.257.1642162262611;
 Fri, 14 Jan 2022 04:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20211228041423.2231598-1-gengdongjiu1@gmail.com>
 <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
 <CABSBigRyDr4GstZjwJVrM64f57PZKL_Dmq0N+BiKYW3fuXxWYg@mail.gmail.com>
 <alpine.DEB.2.22.394.2201121054570.19362@ubuntu-linux-20-04-desktop> <CABSBigS0+FfzH1K1CyJ=DQgn3QJm=kQd3BEaZjs7dex9sEBnzQ@mail.gmail.com>
In-Reply-To: <CABSBigS0+FfzH1K1CyJ=DQgn3QJm=kQd3BEaZjs7dex9sEBnzQ@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Fri, 14 Jan 2022 20:10:50 +0800
Message-ID: <CABSBigQ-1Ok7Se4zHahGccVaVLuWzZgU3UhwXvm4d6jyGROuTw@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=8813=E6=
=97=A5=E5=91=A8=E5=9B=9B 11:47=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi, Stefano
>     Thanks for this reply.
>
> Stefano Stabellini <sstabellini@kernel.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=
=8813=E6=97=A5=E5=91=A8=E5=9B=9B 09:52=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 12 Jan 2022, Dongjiu Geng wrote:
> > > > > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platfo=
rms/Kconfig
> > > > > index c93a6b2756..925f6ef8da 100644
> > > > > --- a/xen/arch/arm/platforms/Kconfig
> > > > > +++ b/xen/arch/arm/platforms/Kconfig
> > > > > @@ -15,7 +15,7 @@ config ALL_PLAT
> > > > >  config QEMU
> > > > >         bool "QEMU aarch virt machine support"
> > > > >         depends on ARM_64
> > > > > -       select GICV3
> > > > > +       select GICv3 if !NEW_VGIC
> > > >
> > > > There was an open question in v2. In general, it is better to wait
> > > > until the discussion is closed or you mention it after ---. This
> > > > avoids being lost.
> > >
> > > Sorry for the noise, Stefano,  do you have any suggestion for this
> > > patch?  thanks a lot.
> >
> > Looking back at v2, the original open question I think was:
> >
> >
> > > While writing a proposal for the commit message, I remembered that th=
e
> > > goal of CONFIG_QEMU was to select all the required drivers to be able=
 to
> > > boot Xen on QEMU.
> > >
> > > AFAICT, if you start from tiny64_defconfig, you would not have GICv3
> > > selected. So we would technically break users of QEMU with GICv3.
> > >
> > > I am not entirely sure how to approach it. I can think of 2 options:
> > >
> > >   1) Use 'select GICv3 if !NEW_VGIC'
> > >   2) Add a specific platform for QEMU new vGIC
> > >
> > > I have the feeling that 1) will result to same unmet dependency issue=
.
> > > Stefano any opinions?
> >
> > I think it would be better to avoid introducing one more QEMU platform
> > if we can. The current patch as a bug, it should be:
> >
> > select GICV3 if !NEW_VGIC
> >
> > note "GICV3" instead of "GICv3".
> >
> >
> > But unfortunately it doesn't work:
> >
> > arch/arm/Kconfig:52:error: recursive dependency detected!
> > arch/arm/Kconfig:52:    symbol NEW_VGIC depends on GICV3
> > arch/arm/Kconfig:36:    symbol GICV3 is selected by NEW_VGIC
> > For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > subsection "Kconfig recursive dependency limitations"
> >
> >
> > If QEMU supports GICv2 virtualization since v3.1.0, which is from 2018,
> > then maybe the easiest way to solve the problem is simply to remove
> > "select GICV3" from QEMU as it is not an hard requirement any longer.
> > However, it is true that existing users of tiny64_defconfig and QEMU
> > would get a different behavior.
> >
> > I don't think it is a problem but if you guys think it is, then the onl=
y
> > option is to introduce a new QEMU platform like "QEMU_GREATER_3.1.0"
> > which doesn't select GICV3 (it only selects HAS_PL011) because it is no=
t
> > a requirement anymore.
>
> Yes,  this is my original patch V1's modification which does not select G=
ICV3
>
> >
> > Or we could have:
> >
> > QEMU
> >     bool "QEMU aarch virt machine support >=3D v3.1.0"
> >     depends on ARM_64
> >     select HAS_PL011
> >
> > QEMU_LEGACY
> >     bool "QEMU aarch virt machine support < v3.1.0"
> >     depends on ARM_64
> >     select GICV3
> >         select HAS_PL011
>
> Thanks for the suggestion,  I can make the modification below if you
> think it is ok.
> Hi Julien and Stefano, waiting for your confirmation .
>
>
> commit 2b5749fc4e0769df9cfc55795e0dbb453000a9c9 (HEAD -> master_submit)
> Author: Dongjiu Geng <gengdongjiu1@gmail.com>
> Date:   Thu Jan 13 11:30:33 2022 +0800
>
>     xen/arm: Allow QEMU platform to be built with GICv2
>
>     It turns out that QEMU has been supporting GICv2 virtualization since
>     v3.1.0. so remove the dependencies on GICv3. If we want to use GICv3,
>     we can select the QEMU_LEGACY configuration.
>
>     Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kcon=
fig
> index c93a6b2756..41e82a42ee 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -13,7 +13,15 @@ config ALL_PLAT
>         automatically select any of the related drivers.
>
>  config QEMU
> -       bool "QEMU aarch virt machine support"
> +       bool "QEMU aarch virt machine support >=3D v3.1.0"
> +       depends on ARM_64
> +       select HAS_PL011
> +       ---help---
> +       Enable all the required drivers for QEMU aarch64 virt emulated
> +       machine.
> +
> +config QEMU_LEGACY
> +       bool "QEMU aarch virt machine support < v3.1.0"
>         depends on ARM_64
>         select GICV3
>         select HAS_PL011

If there is no objection, I will submit the patch.

