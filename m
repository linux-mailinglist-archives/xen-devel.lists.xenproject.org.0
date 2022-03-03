Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE34CC4B3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 19:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283640.482733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPpsb-0000dg-TB; Thu, 03 Mar 2022 18:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283640.482733; Thu, 03 Mar 2022 18:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPpsb-0000aU-Pq; Thu, 03 Mar 2022 18:08:45 +0000
Received: by outflank-mailman (input) for mailman id 283640;
 Thu, 03 Mar 2022 18:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm5B=TO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nPpsa-0000aO-H3
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 18:08:44 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63a7844-9b1c-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 19:08:43 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id d23so9885698lfv.13
 for <xen-devel@lists.xenproject.org>; Thu, 03 Mar 2022 10:08:43 -0800 (PST)
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
X-Inumbo-ID: f63a7844-9b1c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AV7uV4xMmN+TSgc8GU8aakHFWZOXbF9YXVjEQ7J9qWU=;
        b=j8KU9M8kWuio4g9Wejs9GOi+2nXp7j8le3aNllYW3cgnnQyLD2CLCZzgGM/vIuLD07
         0Fdb/ZvOvSE4uLwnYiRY1WmLx1s6N/zeiGCarkv9lq7mZ93JvBcqjcaVM9jahLhucWfL
         swlq8M8UbhrcTvbd+C1e6DXUj3RBsyxlJc0NeH9+gJJZnnDmaWHGYX/54tKtLynowCgd
         DXfwZKQ84KVJYQAyjoeA26t+HbxLqDKanlWG+9DGMepQNXYA2jAX/Y3g2ZE3UuBgN3AG
         4BVzveEROCgMOVasOAxiGjnn85u7pgyhaPpTRrwE/DUHyB6Cid5kv2SNWasOLcs2vWSu
         JSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AV7uV4xMmN+TSgc8GU8aakHFWZOXbF9YXVjEQ7J9qWU=;
        b=K4jol6xYqSasFtBVSjCyCr3arvoteWlOLdkagXEi3EyTG+tIFDiFpC3by6ABBt+VZN
         bwnlLjY+uXoqibyfwkMx1PXKy1Q/xnPGVvl1C52G/eIKoQCUEwIyGQa13Xt7DLugwXy5
         YSKQYbisYWJT2H6NBCMhyoL6pCbd0x32NmvrC+3vdlWNzjsm0iXuTnwJXYseE6XOdK3p
         RYYXkrZK0o6F9KJ/TeZCALLMI38Q7FQHUf4G2M6tnFs6/wMNm027kFBKsfD1aUrTI97J
         TPMW3jNo00WYUObSLf6+mE5q9MR78luUUpxty6JYKOg2yVtPaSX/2Tc1wb83xnMzLuZe
         hc5w==
X-Gm-Message-State: AOAM531++ClthvU5fwyBzmjPv4ZAHnreuzrjvNa4sTcFGd/Jhgpib46b
	P3MA+bXSjv+6Fe/nIdyjGd58RLmscWNkf2WfkLQ=
X-Google-Smtp-Source: ABdhPJy6abb65hcirHEm+qBcOgNMNFA6FNvqjHGZCuQGVpk01qVoqWQgw1TeVXTls6L+XUBnBPeY7AYOt7WPv2PRJUE=
X-Received: by 2002:ac2:5234:0:b0:436:e6a8:edbb with SMTP id
 i20-20020ac25234000000b00436e6a8edbbmr21798334lfl.406.1646330922816; Thu, 03
 Mar 2022 10:08:42 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it> <YiDt7fX92n6Luc2l@Air-de-Roger>
In-Reply-To: <YiDt7fX92n6Luc2l@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 3 Mar 2022 13:08:31 -0500
Message-ID: <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
Subject: Re: Network driver domain broken
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrea Stevanato <andrea.stevanato@santannapisa.it>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
> > On 03/03/2022 15:54, Andrea Stevanato wrote:
> > > Hi all,
> > >
> > > according to the conversation that I had with royger, aa67b97ed34  br=
oke the driver domain support.
> > >
> > > What I'm trying to do is to setup networking between guests using dri=
ver domain. Therefore, the guest (driver) has been started with the followi=
ng cfg.
> > >
> > > name    =3D "guest0"
> > > kernel  =3D "/media/sd-mmcblk0p1/Image"
> > > ramdisk =3D "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > extra   =3D "console=3Dhvc0 rdinit=3D/sbin/init root=3D/dev/ram0"
> > > memory  =3D 1024 vcpus   =3D 2
> > > driver_domain =3D 1
> > >
> > > On guest0 I created the bridge, assigned a static IP and started the =
udhcpd on xenbr0 interface.
> > > While the second guest has been started with the following cfg:
> > >
> > > name    =3D "guest1"
> > > kernel  =3D "/media/sd-mmcblk0p1/Image"
> > > ramdisk =3D "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > extra   =3D "console=3Dhvc0 rdinit=3D/sbin/init root=3D/dev/ram0"
> > > memory  =3D 1024 vcpus   =3D 2
> > > vcpus   =3D 2
> > > vif =3D [ 'bridge=3Dxenbr0, backend=3Dguest0' ]
> > >
> > > Follows the result of strace xl devd:
> > >
> > > # strace xl devd
> > > execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) =
=3D 0

> > > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) =3D -1 EPERM=
 (Operation not permitted)
> > > write(2, "libxl: ", 7libxl: )                  =3D 7
> > > write(2, "error: ", 7error: )                  =3D 7
> > > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:l=
ibxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) =3D 8=
7
> > > write(2, "\n", 1
> > > )                       =3D 1
> > > clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SE=
TTID|SIGCHLD, child_tidptr=3D0xffff9ee7a0e0) =3D 814
> > > wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D =
814
> > > --- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D814, =
si_uid=3D0, si_status=3D0, si_utime=3D2, si_stime=3D2} ---

xl devd is daemonizing, but strace is only following the first
process.  Use `strace xl devd -F` to prevent the daemonizing (or
`strace -f xl devd` to follow children).

> > > close(6)                                =3D 0
> > > close(5)                                =3D 0
> > > munmap(0xffff9f45f000, 4096)            =3D 0
> > > close(7)                                =3D 0
> > > close(10)                               =3D 0
> > > close(9)                                =3D 0
> > > close(8)                                =3D 0
> > > close(11)                               =3D 0
> > > close(3)                                =3D 0
> > > close(4)                                =3D 0
> > > exit_group(0)                           =3D ?
> > > +++ exited with 0 +++
> > >
> > > royger told me that it is a BUG and not an issue with my setup. There=
fore here I am.
>
> Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
> parse_global_config will prevent xl from being usable on anything
> different than the control domain (due to sysctl only available to
> privileged domains). This is an issue for 'xl devd', as it won't
> start anymore.

These look non-fatal at first glance?

Regards,
Jason

