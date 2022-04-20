Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C53508671
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 12:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309095.525140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7yx-0000Uo-It; Wed, 20 Apr 2022 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309095.525140; Wed, 20 Apr 2022 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7yx-0000Rv-F4; Wed, 20 Apr 2022 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 309095;
 Wed, 20 Apr 2022 10:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aiw3=U6=gmail.com=marco.cacre@srs-se1.protection.inumbo.net>)
 id 1nh7yw-0000Rp-6y
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 10:54:46 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492fb49d-c098-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 12:54:44 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so842503otu.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 03:54:44 -0700 (PDT)
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
X-Inumbo-ID: 492fb49d-c098-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fJbB7O5xgMBxAUNVHvYEZu+IEyvWq75AQ/22AeyydQ8=;
        b=ITcTYNtDhVrttns/UrkrjwonupiDda/sVofVaUMpCgcZ4KsIaaaT7esfF+qBLaM/wn
         0PWGUhvIf5TwqO7BQ/EAMo+SHX5DUF9qhOEncoIRHU5rSvsFEQa1DX7RUu33zDks2mlJ
         CH1mcW4khr+99fE/DrijfNwVjd+HZsndVnSshYoJm85ZGjR6G2YUW80j8oCJxO1hrF74
         mrG2xY4Mmig5jP6vd08UbKzMrUHEJtI9sh/GC6Hl+cTa3lfrpaQXT6VK8+Tne+cH3cVN
         o1UcHyiP463bthg0Zw64I2gotM2XvFKTa6igSm/Y//bG5O466IW8gCIOLQVpoBLrdPuk
         TMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fJbB7O5xgMBxAUNVHvYEZu+IEyvWq75AQ/22AeyydQ8=;
        b=dsXQtLnX5d4yn99Zm03AH24TBoGKaAAhsKvMU/HE7YCuUtKmkQlIgDWz0Wr4OATri+
         NT763OTGjnPUKZAdtpUrDECmQW6zuHe35L0n8apOpCVP8LkXFJHVELIX0ukC2RAy4rTM
         UP6yP2Ge9hyHSpPr2I/w5uhLFT+GIKLhG6OfSxHWxZ1+kZF5AeYB21NMPm851VCUsC24
         s8Wr4cAK8siOwkWMzy/c8RZWB6JCLjiLrGN7GSMNBajhTw0Qo9qk/kl91zqGxdNzxB/P
         0B3QXac0qtL+9CqdnuPeeVROKNhVLHO8Ndcr3xSUXNlzP6z2nkNVJypqlsujVsE1fU75
         YRPw==
X-Gm-Message-State: AOAM531NxIuxoWwHswV7tDTp+aEWbIAFGnd7NEeHU9svSkFiKMuNj5RE
	xLgwfi/mfbd5O//uuh5p2aWK1/puohHYKcfve9QmmntHTHI=
X-Google-Smtp-Source: ABdhPJzorug5yZhEx3mkl56tKRB0GXWXSRCyZ42akXYpDdkeGqR8WoAhnobPxnTWv4uxCk0AGBjQuuBzukbO4Eml2Sk=
X-Received: by 2002:a05:6830:1618:b0:605:4793:fac9 with SMTP id
 g24-20020a056830161800b006054793fac9mr6448926otr.48.1650452083219; Wed, 20
 Apr 2022 03:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAGHctbYx6sspA__OmKyumU+WkhzEsDpLstyhRDM9Kbc696Co7Q@mail.gmail.com>
In-Reply-To: <CAGHctbYx6sspA__OmKyumU+WkhzEsDpLstyhRDM9Kbc696Co7Q@mail.gmail.com>
From: Marco Cacre <marco.cacre@gmail.com>
Date: Wed, 20 Apr 2022 12:54:32 +0200
Message-ID: <CAGHctbZzRc3PqzTd22_NpN4VHyB3DPyHJF2BoqAgBOcVp5_4ZA@mail.gmail.com>
Subject: Re: Problem creating domU guest on arm64
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="00000000000023b72d05dd13d25a"

--00000000000023b72d05dd13d25a
Content-Type: multipart/alternative; boundary="00000000000023b72c05dd13d258"

--00000000000023b72c05dd13d258
Content-Type: text/plain; charset="UTF-8"

Hi  all,



I did several attempts but I have always problems with disk backend setup
during creation of domU domain.



The latest attempt was using deban arm64 image with this configuration:



memory = 512
name = "debian"
vcpus = 1
maxvcpus = 1

kernel = "/home/xen/vmlinuz"
ramdisk = "/home/xen/initrd.img"
disk = ["phy:/dev/loop0,xvda,rw"]
extra = "root=/dev/xvda rw console=hvc0 earlyprintk=xen"



kernel and ramdisk boot up successfully and I can attach to the domU
console, but when I try to define the disk backend with the debian rootfs
the creation of the domain fails.



rootfs is attached to loop device as follow:



losetup /dev/loop0 /home/xen/rootfs.img



I attached to this mail the verbose trace of the command xl create



Thanks a lot in advance for any kind of help

Best Regards

Marco

Il giorno ven 15 apr 2022 alle ore 12:56 Marco Cacre <marco.cacre@gmail.com>
ha scritto:

> Hi all,
>
> I'm facing always the same problem (described below) trying to create a
> Xen guest domain on rockpro64 (arm64).
>
> I have successfully built uboot, xen (4.14.4) and dom0 linux kernel with
> xen tool stack, these two last starting from buildroot (with linux kernel
> version 5.15.33 and xen toolstack version 4.14.4)
>
> These are the process of Xen:
>
> 177 root    /usr/sbin/xenwatchdogd 30 15
> 203 root    /usr/sbin/xenstored --pid-file /var/run/xen/xenstored.pid
> 208 root    /usr/sbin/xenconsoled --pid-file=/var/run/xen/xenconsoled.pid
> 214 root    /usr/lib/xen/bin/qemu-system-i386 -xen-domid 0 -xen-attach
> -name dom0 -nographic -M xenpv -daemonize -monitor /dev/null
> -serial/dev/nul -parallel/dev/null -pidfile/var/run/xen/qemu-dom0.pid
>
> and the drivers loaded as a module:
> # lsmod
> Module                  Size  Used by    Tainted: G
> xen_netback            65536  0
> xen_blkback            49152  0
>
> Xen and dom0 Image boot up successfully, at the end:
> ================================================
> >xl list
> Name                                        ID  Mem VCPUs State Time(s)
> Domain-0                                    0  1024    2    r-----
>  4000.3
>
> # uname -a
> Linux rockpro64 5.15.33 #3 SMP PREEMPT Fri Apr 15 11:01:37 CEST 2022
> aarch64 GNU/Linux
> ================================================
>
> when I try to create a domU domain I have problem with disk backend, I
> have made several attempts trying with different domU linux and I always
> get the following error :
>
> ================================================
> Parsing config from ./alpine_xen_domu.config
>
> libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution of
> /etc/xen/scripts/block add because of timeout
> libxl: error: libxl_create.c:1608:domcreate_launch_dm: Domain 2:unable to
> add disk devices
> libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution of
> /etc/xen/scripts/block remove because of timeout
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
> 2:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 2:Unable
> to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 2:Destruction
> of domain failed
> ================================================
>
> The last try was with alpine domU linux with the following config:
> ================================================
>
> # Alpine Linux PV DomU
> # Kernel paths for install
> kernel = "/home/xen/vmlinuz-virt"
> ramdisk = "/home/xen/initramfs-virt"
> extra="modules=loop,squashfs console=hvc0"
> # Path to HDD and iso file
> disk = [ 'format=raw, vdev=xvda, access=w, target=/data/a1.img',
>         'format=raw, vdev=xvdc, access=r, devtype=cdrom,
> target=/home/xen/alpine-virt-3.15.3-armv7.iso'  ]
> # Network configuration
> vif = ['bridge=br0']
> # DomU settings
>
> memory = 512
>
> name = "alpine-a1"
>
> vcpus = 1
>
> maxvcpus = 1
> ================================================
>
> thanks a lot in advance
> Best regards
> Marco
>

--00000000000023b72c05dd13d258
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal">Hi=C2=A0 all,<u></u><u></u></p><div=
><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoN=
ormal">I did several attempts but I have always problems with disk backend =
setup during creation of domU domain.<u></u><u></u></p></div><div><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">Th=
e latest attempt was using deban arm64 image with this configuration:<u></u=
><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div=
><div><p class=3D"MsoNormal">memory =3D 512<br>name =3D &quot;debian&quot;<=
br>vcpus =3D 1<br>maxvcpus =3D 1<u></u><u></u></p></div><div><p class=3D"Ms=
oNormal">kernel =3D &quot;/home/xen/vmlinuz&quot;<br>ramdisk =3D &quot;/hom=
e/xen/initrd.img&quot;<br>disk =3D [&quot;phy:/dev/loop0,xvda,rw&quot;]<br>=
extra =3D &quot;root=3D/dev/xvda rw console=3Dhvc0 earlyprintk=3Dxen&quot;<=
u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>=
</div><div><p class=3D"MsoNormal">kernel and ramdisk boot up successfully a=
nd I can attach to the domU console, but when I try to define the disk back=
end with the debian rootfs the creation of the domain fails.<u></u><u></u><=
/p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p =
class=3D"MsoNormal">rootfs is attached to loop device as follow:<u></u><u><=
/u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div=
><p class=3D"MsoNormal">losetup /dev/loop0 /home/xen/rootfs.img<u></u><u></=
u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div>=
<p class=3D"MsoNormal">I attached to this mail the verbose trace of the com=
mand xl create<u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=
=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">Thanks a lot in advance =
for any kind of help<u></u></p></div><div><p class=3D"MsoNormal">Best Regar=
ds<u></u><u></u></p></div><div><p class=3D"MsoNormal">Marco</p></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gio=
rno ven 15 apr 2022 alle ore 12:56 Marco Cacre &lt;<a href=3D"mailto:marco.=
cacre@gmail.com">marco.cacre@gmail.com</a>&gt; ha scritto:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi all,<br><br>=
I&#39;m facing always the same problem (described below) trying to create a=
 Xen guest domain on rockpro64 (arm64).<br><br>I have successfully built ub=
oot, xen (4.14.4) and dom0 linux kernel with xen tool stack, these two last=
 starting from buildroot (with linux kernel version 5.15.33 and xen toolsta=
ck version 4.14.4)<br><br>These are the process of Xen:<br><br>177 root =C2=
=A0 =C2=A0/usr/sbin/xenwatchdogd 30 15<br>203 root =C2=A0 =C2=A0/usr/sbin/x=
enstored --pid-file /var/run/xen/xenstored.pid<br>208 root =C2=A0 =C2=A0/us=
r/sbin/xenconsoled --pid-file=3D/var/run/xen/xenconsoled.pid<br>214 root =
=C2=A0 =C2=A0/usr/lib/xen/bin/qemu-system-i386 -xen-domid 0 -xen-attach -na=
me dom0 -nographic -M xenpv -daemonize -monitor /dev/null -serial/dev/nul -=
parallel/dev/null -pidfile/var/run/xen/qemu-dom0.pid<br><br>and the drivers=
 loaded as a module:<br># lsmod<br>Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size =C2=A0Used by =C2=A0 =C2=A0Tainted: G<b=
r>xen_netback =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A065536 =C2=A00<br>xen=
_blkback =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A049152 =C2=A00<br><br>Xen =
and dom0 Image boot up successfully, at the end:<br>=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;xl list<br>Name =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ID =C2=A0Mem =
VCPUs State Time(s)<br>Domain-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A01024 =C2=A0 =C2=A02 =C2=A0 =C2=A0r----- =C2=A0 =C2=A04000=
.3<br><br># uname -a<br>Linux rockpro64 5.15.33 #3 SMP PREEMPT Fri Apr 15 1=
1:01:37 CEST 2022 aarch64 GNU/Linux<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>when I try to create a domU domain=
 I have problem with disk backend, I have made several attempts trying with=
 different domU linux and I always get the following error :<br><br>=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Parsing =
config from ./alpine_xen_domu.config<br><br>libxl: error: libxl_aoutils.c:5=
39:async_exec_timeout: killing execution of /etc/xen/scripts/block add beca=
use of timeout<br>libxl: error: libxl_create.c:1608:domcreate_launch_dm: Do=
main 2:unable to add disk devices<br>libxl: error: libxl_aoutils.c:539:asyn=
c_exec_timeout: killing execution of /etc/xen/scripts/block remove because =
of timeout<br>libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domai=
n 2:Non-existant domain<br>libxl: error: libxl_domain.c:1136:domain_destroy=
_callback: Domain 2:Unable to destroy guest<br>libxl: error: libxl_domain.c=
:1063:domain_destroy_cb: Domain 2:Destruction of domain failed<br>=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>The las=
t try was with alpine domU linux with the following config:<br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br># Alpine L=
inux PV DomU<br># Kernel paths for install<br>kernel =3D &quot;/home/xen/vm=
linuz-virt&quot;<br>ramdisk =3D &quot;/home/xen/initramfs-virt&quot;<br>ext=
ra=3D&quot;modules=3Dloop,squashfs console=3Dhvc0&quot;<br># Path to HDD an=
d iso file<br>disk =3D [ &#39;format=3Draw, vdev=3Dxvda, access=3Dw, target=
=3D/data/a1.img&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;format=3Draw, vde=
v=3Dxvdc, access=3Dr, devtype=3Dcdrom, target=3D/home/xen/alpine-virt-3.15.=
3-armv7.iso&#39; =C2=A0]<br># Network configuration =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>vif =3D [&#39;bridge=3Dbr0=
&#39;]<br># DomU settings =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>memory =3D 512 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>name =3D &quot;alpine-a=
1&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>vc=
pus =3D 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>maxvcpus =3D 1<br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>thanks a lot in advanc=
e<br>Best regards<font color=3D"#888888"><br>Marco</font><br></div>
</blockquote></div>

--00000000000023b72c05dd13d258--
--00000000000023b72d05dd13d25a
Content-Type: text/plain; charset="US-ASCII"; name="xl_create_trace.txt"
Content-Disposition: attachment; filename="xl_create_trace.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_l27gian60>
X-Attachment-Id: f_l27gian60

IyB4bCAtdnZ2IGNyZWF0ZSAuL2xpbnV4LmNvbmZpZyAKUGFyc2luZyBjb25maWcgZnJvbSAuL2xp
bnV4LmNvbmZpZwpsaWJ4bDogZGVidWc6IGxpYnhsX2NyZWF0ZS5jOjIwMTc6ZG9fZG9tYWluX2Ny
ZWF0ZTogYW8gMHg1NWI3ODZlMjgwOiBjcmVhdGU6IGhvdz0obmlsKSBjYWxsYmFjaz0obmlsKSBw
b2xsZXI9MHg1NWI3ODZlM2QwCmxpYnhsOiBkZXRhaWw6IGxpYnhsX2NyZWF0ZS5jOjYyMjpsaWJ4
bF9fZG9tYWluX21ha2U6IHBhc3N0aHJvdWdoOiBkaXNhYmxlZApsaWJ4bDogZGVidWc6IGxpYnhs
X2FybS5jOjcxOmxpYnhsX19hcmNoX2RvbWFpbl9wcmVwYXJlX2NvbmZpZzogQ29uZmlndXJlIHRo
ZSBkb21haW4KbGlieGw6IGRlYnVnOiBsaWJ4bF9hcm0uYzo3NDpsaWJ4bF9fYXJjaF9kb21haW5f
cHJlcGFyZV9jb25maWc6ICAtIEFsbG9jYXRlIDAgU1BJcwpsaWJ4bDogZGVidWc6IGxpYnhsX2Rl
dmljZS5jOjM3OTpsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0X2JhY2tlbmQ6IERpc2sgdmRldj14dmRh
IHNwZWMuYmFja2VuZD11bmtub3duCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6NDEzOmxp
YnhsX19kZXZpY2VfZGlza19zZXRfYmFja2VuZDogRGlzayB2ZGV2PXh2ZGEsIHVzaW5nIGJhY2tl
bmQgcGh5CmxpYnhsOiBkZWJ1ZzogbGlieGxfY3JlYXRlLmM6MTI3OTppbml0aWF0ZV9kb21haW5f
Y3JlYXRlOiBEb21haW4gNjpydW5uaW5nIGJvb3Rsb2FkZXIKbGlieGw6IGRlYnVnOiBsaWJ4bF9i
b290bG9hZGVyLmM6MzM0OmxpYnhsX19ib290bG9hZGVyX3J1bjogRG9tYWluIDY6bm8gYm9vdGxv
YWRlciBjb25maWd1cmVkLCB1c2luZyB1c2VyIHN1cHBsaWVkIGtlcm5lbApsaWJ4bDogZGVidWc6
IGxpYnhsX2V2ZW50LmM6ODY0OmxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9
MHg1NWI3ODZmYTU4OiBkZXJlZ2lzdGVyIHVucmVnaXN0ZXJlZApsaWJ4bDogZGVidWc6IGxpYnhs
X3NjaGVkLmM6ODE6bGlieGxfX3NldF92Y3B1YWZmaW5pdHk6IERvbWFpbiA2Ok5ldyBzb2Z0IGFm
ZmluaXR5IGZvciB2Y3B1IDAgaGFzIHVucmVhY2hhYmxlIGNwdXMKZG9tYWluYnVpbGRlcjogZGV0
YWlsOiB4Y19kb21fYWxsb2NhdGU6IGNtZGxpbmU9InJvb3Q9L2Rldi94dmRhIHJ3IGNvbnNvbGU9
aHZjMCBlYXJseXByaW50az14ZW4iLCBmZWF0dXJlcz0iIgpkb21haW5idWlsZGVyOiBkZXRhaWw6
IHhjX2RvbV9rZXJuZWxfZmlsZTogZmlsZW5hbWU9Ii9ob21lL3hlbi92bWxpbnV6Igpkb21haW5i
dWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9tYWxsb2NfZmlsZW1hcCAgICA6IDI2ODg5IGtCCmRvbWFp
bmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX21vZHVsZV9maWxlOiBmaWxlbmFtZT0iL2hvbWUveGVu
L2luaXRyZC5pbWciCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX21hbGxvY19maWxlbWFw
ICAgIDogNDAgTUIKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fYm9vdF94ZW5faW5pdDog
dmVyIDQuMTQsIGNhcHMgeGVuLTMuMC1hYXJjaDY0IHhlbi0zLjAtYXJtdjdsIApkb21haW5idWls
ZGVyOiBkZXRhaWw6IHhjX2RvbV9yYW1iYXNlX2luaXQ6IFJBTSBzdGFydHMgYXQgNDAwMDAKZG9t
YWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fcGFyc2VfaW1hZ2U6IGNhbGxlZApkb21haW5idWls
ZGVyOiBkZXRhaWw6IHhjX2RvbV9maW5kX2xvYWRlcjogdHJ5aW5nIG11bHRpYm9vdC1iaW5hcnkg
bG9hZGVyIC4uLiAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiBsb2FkZXIgcHJvYmUgZmFpbGVkCmRv
bWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2ZpbmRfbG9hZGVyOiB0cnlpbmcgTGludXggeklt
YWdlIChBUk02NCkgbG9hZGVyIC4uLiAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiBsb2FkZXIgcHJv
YmUgT0sKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fcGFyc2VfemltYWdlNjRfa2VybmVs
OiBjYWxsZWQKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fcGFyc2VfemltYWdlNjRfa2Vy
bmVsOiB4ZW4tMy4wLWFhcmNoNjQ6IDB4NDAwMDAwMDAgLT4gMHg0MWE0Mjc4MApsaWJ4bDogZGVi
dWc6IGxpYnhsX2FybS5jOjg3MjpsaWJ4bF9fcHJlcGFyZV9kdGI6IGNvbnN0cnVjdGluZyBEVEIg
Zm9yIFhlbiB2ZXJzaW9uIDQuMTQgZ3Vlc3QKbGlieGw6IGRlYnVnOiBsaWJ4bF9hcm0uYzo4NzQ6
bGlieGxfX3ByZXBhcmVfZHRiOiAgLSB2R0lDIHZlcnNpb246IFYzCmxpYnhsOiBkZWJ1ZzogbGli
eGxfYXJtLmM6MzEyOm1ha2VfY2hvc2VuX25vZGU6IC9jaG9zZW4vYm9vdGFyZ3MgPSByb290PS9k
ZXYveHZkYSBydyBjb25zb2xlPWh2YzAgZWFybHlwcmludGs9eGVuCmxpYnhsOiBkZWJ1ZzogbGli
eGxfYXJtLmM6MzE5Om1ha2VfY2hvc2VuX25vZGU6IC9jaG9zZW4gYWRkaW5nIHBsYWNlaG9sZGVy
IGxpbnV4LGluaXRyZCBwcm9wZXJ0aWVzCmxpYnhsOiBkZWJ1ZzogbGlieGxfYXJtLmM6NDU5Om1h
a2VfbWVtb3J5X25vZGVzOiBDcmVhdGluZyBwbGFjZWhvbGRlciBub2RlIC9tZW1vcnlANDAwMDAw
MDAKbGlieGw6IGRlYnVnOiBsaWJ4bF9hcm0uYzo0NTk6bWFrZV9tZW1vcnlfbm9kZXM6IENyZWF0
aW5nIHBsYWNlaG9sZGVyIG5vZGUgL21lbW9yeUAyMDAwMDAwMDAKbGlieGw6IGRlYnVnOiBsaWJ4
bF9hcm0uYzo5NzU6bGlieGxfX3ByZXBhcmVfZHRiOiBmZHQgdG90YWwgc2l6ZSAxMzM4CmRvbWFp
bmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2RldmljZXRyZWVfbWVtOiBjYWxsZWQKbGlieGw6IGRl
YnVnOiBsaWJ4bF9hcm0uYzoxMDIwOmxpYnhsX19hcmNoX2RvbWFpbl9pbml0X2h3X2Rlc2NyaXB0
aW9uOiBHZW5lcmF0aW5nIEFDUEkgdGFibGVzIGlzIGRpc2FibGVkIGJ5IHVzZXIuCmRvbWFpbmJ1
aWxkZXI6IGRldGFpbDogeGNfZG9tX21lbV9pbml0OiBtZW0gNTEyIE1CLCBwYWdlcyAweDIwMDAw
IHBhZ2VzLCA0ayBlYWNoCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX21lbV9pbml0OiAw
eDIwMDAwIHBhZ2VzCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX2Jvb3RfbWVtX2luaXQ6
IGNhbGxlZApkb21haW5idWlsZGVyOiBkZXRhaWw6IHNldF9tb2RlOiBndWVzdCB4ZW4tMy4wLWFh
cmNoNjQsIGFkZHJlc3Mgc2l6ZSA2NApkb21haW5idWlsZGVyOiBkZXRhaWw6IHBvcHVsYXRlX2d1
ZXN0X21lbW9yeTogcG9wdWxhdGluZyBSQU0gQCAwMDAwMDAwMDQwMDAwMDAwLTAwMDAwMDAwNjAw
MDAwMDAgKDUxMk1CKQpkb21haW5idWlsZGVyOiBkZXRhaWw6IHBvcHVsYXRlX29uZV9zaXplOiBw
b3B1bGF0ZWQgMHgxMDAvMHgxMDAgZW50cmllcyB3aXRoIHNoaWZ0IDkKZG9tYWluYnVpbGRlcjog
ZGV0YWlsOiBtZW1pbml0OiBwbGFjaW5nIGJvb3QgbW9kdWxlcyBhdCAweDQ4MDAwMDAwCmRvbWFp
bmJ1aWxkZXI6IGRldGFpbDogbWVtaW5pdDogcmFtZGlzazogMHg0ODAwMDAwMCAtPiAweDRhODFm
MDAwCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogbWVtaW5pdDogZGV2aWNldHJlZTogMHg0YTgxZjAw
MCAtPiAweDRhODIwMDAwCmxpYnhsOiBkZWJ1ZzogbGlieGxfYXJtLmM6MTA4NzpsaWJ4bF9fYXJj
aF9kb21haW5fZmluYWxpc2VfaHdfZGVzY3JpcHRpb246IC9jaG9zZW4gdXBkYXRpbmcgaW5pdHJk
IHByb3BlcnRpZXMgdG8gY292ZXIgNDgwMDAwMDAtNGE4MWYwMDAKbGlieGw6IGRlYnVnOiBsaWJ4
bF9hcm0uYzoxMDU0OmZpbmFsaXNlX29uZV9ub2RlOiBQb3B1bGF0aW5nIHBsYWNlaG9sZGVyIG5v
ZGUgL21lbW9yeUA0MDAwMDAwMApsaWJ4bDogZGVidWc6IGxpYnhsX2FybS5jOjEwNDg6ZmluYWxp
c2Vfb25lX25vZGU6IE5vcHBpbmcgb3V0IHBsYWNlaG9sZGVyIG5vZGUgL21lbW9yeUAyMDAwMDAw
MDAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fYnVpbGRfaW1hZ2U6IGNhbGxlZApkb21h
aW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9tYWxsb2MgICAgICAgICAgICA6IDE1NyBrQgpkb21h
aW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9wZm5fdG9fcHRyX3JldGNvdW50OiBkb21VIG1hcHBp
bmc6IHBmbiAweDQwMDAwKzB4MWE0MyBhdCAweDdmYTA3M2MwMDAKZG9tYWluYnVpbGRlcjogZGV0
YWlsOiB4Y19kb21fYWxsb2Nfc2VnbWVudDogICBrZXJuZWwgICAgICAgOiAweDQwMDAwMDAwIC0+
IDB4NDFhNDMwMDAgIChwZm4gMHg0MDAwMCArIDB4MWE0MyBwYWdlcykKZG9tYWluYnVpbGRlcjog
ZGV0YWlsOiB4Y19kb21fbG9hZF96aW1hZ2Vfa2VybmVsOiBjYWxsZWQKZG9tYWluYnVpbGRlcjog
ZGV0YWlsOiB4Y19kb21fbG9hZF96aW1hZ2Vfa2VybmVsOiBrZXJuZWwgc2VnIDB4NDAwMDAwMDAt
MHg0MWE0MzAwMApkb21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9sb2FkX3ppbWFnZV9rZXJu
ZWw6IGNvcHkgMjc1MzUyMzIgYnl0ZXMgZnJvbSBibG9iIDB4N2ZhNDk5ZTAwMCB0byBkc3QgMHg3
ZmEwNzNjMDAwCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX21hbGxvYyAgICAgICAgICAg
IDogMjQwIGtCCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNfZG9tX3Bmbl90b19wdHJfcmV0Y291
bnQ6IGRvbVUgbWFwcGluZzogcGZuIDB4NDgwMDArMHgyODFmIGF0IDB4N2Y5ZGYxZDAwMApkb21h
aW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9hbGxvY19zZWdtZW50OiAgIG1vZHVsZTAgICAgICA6
IDB4NDgwMDAwMDAgLT4gMHg0YTgxZjAwMCAgKHBmbiAweDQ4MDAwICsgMHgyODFmIHBhZ2VzKQpk
b21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9wZm5fdG9fcHRyX3JldGNvdW50OiBkb21VIG1h
cHBpbmc6IHBmbiAweDRhODFmKzB4MSBhdCAweDdmYTY3MTUwMDAKZG9tYWluYnVpbGRlcjogZGV0
YWlsOiB4Y19kb21fYWxsb2Nfc2VnbWVudDogICBkZXZpY2V0cmVlICAgOiAweDRhODFmMDAwIC0+
IDB4NGE4MjAwMDAgIChwZm4gMHg0YTgxZiArIDB4MSBwYWdlcykKZG9tYWluYnVpbGRlcjogZGV0
YWlsOiBhbGxvY19tYWdpY19wYWdlczogY2FsbGVkCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogeGNf
ZG9tX2J1aWxkX2ltYWdlICA6IHZpcnRfYWxsb2NfZW5kIDogMHg0YTgyMDAwMApkb21haW5idWls
ZGVyOiBkZXRhaWw6IHhjX2RvbV9idWlsZF9pbWFnZSAgOiB2aXJ0X3BndGFiX2VuZCA6IDB4MApk
b21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9ib290X2ltYWdlOiBjYWxsZWQKZG9tYWluYnVp
bGRlcjogZGV0YWlsOiBib290ZWFybHk6IGRvaW5nIG5vdGhpbmcKZG9tYWluYnVpbGRlcjogZGV0
YWlsOiB4Y19kb21fY29tcGF0X2NoZWNrOiBzdXBwb3J0ZWQgZ3Vlc3QgdHlwZTogeGVuLTMuMC1h
YXJjaDY0IDw9IG1hdGNoZXMKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fY29tcGF0X2No
ZWNrOiBzdXBwb3J0ZWQgZ3Vlc3QgdHlwZTogeGVuLTMuMC1hcm12N2wKZG9tYWluYnVpbGRlcjog
ZGV0YWlsOiBzdGFydF9pbmZvX2FybTogY2FsbGVkCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogZG9t
YWluIGJ1aWxkZXIgbWVtb3J5IGZvb3RwcmludApkb21haW5idWlsZGVyOiBkZXRhaWw6ICAgIGFs
bG9jYXRlZApkb21haW5idWlsZGVyOiBkZXRhaWw6ICAgICAgIG1hbGxvYyAgICAgICAgICAgICA6
IDQwMSBrQgpkb21haW5idWlsZGVyOiBkZXRhaWw6ICAgICAgIGFub24gbW1hcCAgICAgICAgICA6
IDAgYnl0ZXMKZG9tYWluYnVpbGRlcjogZGV0YWlsOiAgICBtYXBwZWQKZG9tYWluYnVpbGRlcjog
ZGV0YWlsOiAgICAgICBmaWxlIG1tYXAgICAgICAgICAgOiA2NiBNQgpkb21haW5idWlsZGVyOiBk
ZXRhaWw6ICAgICAgIGRvbVUgbW1hcCAgICAgICAgICA6IDY2IE1CCmRvbWFpbmJ1aWxkZXI6IGRl
dGFpbDogdmNwdV9hcm02NDogY2FsbGVkCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogRFRCIDRhODFm
MDAwCmRvbWFpbmJ1aWxkZXI6IGRldGFpbDogSW5pdGlhbCBzdGF0ZSBDUFNSIDB4MWM1IFBDIDB4
NDAwMDAwMDAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiBjb21wYXRfZ250dGFiX2h2bV9zZWVkOiBk
NjogcGZuPTB4MzgwMDAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fc2V0X2dudHRhYl9l
bnRyeTogZDYgZ250WzBdIC0+IGQwIDB4MzkwMDAKZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19k
b21fc2V0X2dudHRhYl9lbnRyeTogZDYgZ250WzFdIC0+IGQwIDB4MzkwMDEKZG9tYWluYnVpbGRl
cjogZGV0YWlsOiB4Y19kb21fcmVsZWFzZTogY2FsbGVkCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2
aWNlLmM6Mzc5OmxpYnhsX19kZXZpY2VfZGlza19zZXRfYmFja2VuZDogRGlzayB2ZGV2PXh2ZGEg
c3BlYy5iYWNrZW5kPXBoeQpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6ODEzOmxpYnhsX19l
dl94c3dhdGNoX3JlZ2lzdGVyOiB3YXRjaCB3PTB4NTViNzg3NDA1MCB3cGF0aD0vbG9jYWwvZG9t
YWluLzAvYmFja2VuZC92YmQvNi81MTcxMi9zdGF0ZSB0b2tlbj0zLzA6IHJlZ2lzdGVyIHNsb3Ru
dW09MwpsaWJ4bDogZGVidWc6IGxpYnhsX2NyZWF0ZS5jOjIwNTU6ZG9fZG9tYWluX2NyZWF0ZTog
YW8gMHg1NWI3ODZlMjgwOiBpbnByb2dyZXNzOiBwb2xsZXI9MHg1NWI3ODZlM2QwLCBmbGFncz1p
CmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzo3NTA6d2F0Y2hmZF9jYWxsYmFjazogd2F0Y2gg
dz0weDU1Yjc4NzQwNTAgd3BhdGg9L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvdmJkLzYvNTE3MTIv
c3RhdGUgdG9rZW49My8wOiBldmVudCBlcGF0aD0vbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQv
Ni81MTcxMi9zdGF0ZQpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6MTA1MjpkZXZzdGF0ZV9j
YWxsYmFjazogYmFja2VuZCAvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvNi81MTcxMi9zdGF0
ZSB3YW50ZWQgc3RhdGUgMiBvawpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6ODUwOmxpYnhs
X19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9MHg1NWI3ODc0MDUwIHdwYXRoPS9sb2Nh
bC9kb21haW4vMC9iYWNrZW5kL3ZiZC82LzUxNzEyL3N0YXRlIHRva2VuPTMvMDogZGVyZWdpc3Rl
ciBzbG90bnVtPTMKbGlieGw6IGRlYnVnOiBsaWJ4bF9kZXZpY2UuYzoxMDkwOmRldmljZV9iYWNr
ZW5kX2NhbGxiYWNrOiBEb21haW4gNjpjYWxsaW5nIGRldmljZV9iYWNrZW5kX2NsZWFudXAKbGli
eGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjg2NDpsaWJ4bF9fZXZfeHN3YXRjaF9kZXJlZ2lzdGVy
OiB3YXRjaCB3PTB4NTViNzg3NDA1MDogZGVyZWdpc3RlciB1bnJlZ2lzdGVyZWQKbGlieGw6IGRl
YnVnOiBsaWJ4bF9saW51eC5jOjE5NDpsaWJ4bF9faG90cGx1Z19kaXNrOiBEb21haW4gNjpBcmdz
IGFuZCBlbnZpcm9ubWVudCByZWFkeQpsaWJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjExOTE6
ZGV2aWNlX2hvdHBsdWc6IERvbWFpbiA2OmNhbGxpbmcgaG90cGx1ZyBzY3JpcHQ6IC9ldGMveGVu
L3NjcmlwdHMvYmxvY2sgYWRkCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTE5MjpkZXZp
Y2VfaG90cGx1ZzogRG9tYWluIDY6ZXh0cmEgYXJnczoKbGlieGw6IGRlYnVnOiBsaWJ4bF9kZXZp
Y2UuYzoxMjAwOmRldmljZV9ob3RwbHVnOiBEb21haW4gNjplbnY6CmxpYnhsOiBkZWJ1ZzogbGli
eGxfZGV2aWNlLmM6MTIwNzpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6CXNjcmlwdDogL2V0Yy94
ZW4vc2NyaXB0cy9ibG9jawpsaWJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjEyMDc6ZGV2aWNl
X2hvdHBsdWc6IERvbWFpbiA2OglYRU5CVVNfVFlQRTogdmJkCmxpYnhsOiBkZWJ1ZzogbGlieGxf
ZGV2aWNlLmM6MTIwNzpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6CVhFTkJVU19QQVRIOiBiYWNr
ZW5kL3ZiZC82LzUxNzEyCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTIwNzpkZXZpY2Vf
aG90cGx1ZzogRG9tYWluIDY6CVhFTkJVU19CQVNFX1BBVEg6IGJhY2tlbmQKbGlieGw6IGRlYnVn
OiBsaWJ4bF9hb3V0aWxzLmM6NTkzOmxpYnhsX19hc3luY19leGVjX3N0YXJ0OiBmb3JraW5nIHRv
IGV4ZWN1dGU6IC9ldGMveGVuL3NjcmlwdHMvYmxvY2sgYWRkIApsaWJ4bDogZGVidWc6IGxpYnhs
X2V2ZW50LmM6NzIwOndhdGNoZmRfY2FsbGJhY2s6IHdhdGNoIGVwYXRoPS9sb2NhbC9kb21haW4v
MC9iYWNrZW5kL3ZiZC82LzUxNzEyL3N0YXRlIHRva2VuPTMvMDogZW1wdHkgc2xvdApsaWJ4bDog
ZXJyb3I6IGxpYnhsX2FvdXRpbHMuYzo1Mzk6YXN5bmNfZXhlY190aW1lb3V0OiBraWxsaW5nIGV4
ZWN1dGlvbiBvZiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrIGFkZCBiZWNhdXNlIG9mIHRpbWVvdXQK
bGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjg2NDpsaWJ4bF9fZXZfeHN3YXRjaF9kZXJlZ2lz
dGVyOiB3YXRjaCB3PTB4NTViNzg3NDE1MDogZGVyZWdpc3RlciB1bnJlZ2lzdGVyZWQKbGlieGw6
IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjg2NDpsaWJ4bF9fZXZfeHN3YXRjaF9kZXJlZ2lzdGVyOiB3
YXRjaCB3PTB4NTViNzg3NDE1MDogZGVyZWdpc3RlciB1bnJlZ2lzdGVyZWQKbGlieGw6IGVycm9y
OiBsaWJ4bF9jcmVhdGUuYzoxNjA4OmRvbWNyZWF0ZV9sYXVuY2hfZG06IERvbWFpbiA2OnVuYWJs
ZSB0byBhZGQgZGlzayBkZXZpY2VzCmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzo4NjQ6bGli
eGxfX2V2X3hzd2F0Y2hfZGVyZWdpc3Rlcjogd2F0Y2ggdz0weDU1Yjc4NzE0MDg6IGRlcmVnaXN0
ZXIgdW5yZWdpc3RlcmVkCmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzo4MTM6bGlieGxfX2V2
X3hzd2F0Y2hfcmVnaXN0ZXI6IHdhdGNoIHc9MHg1NWI3ODcyMTAwIHdwYXRoPS9sb2NhbC9kb21h
aW4vMC9iYWNrZW5kL3ZiZC82LzUxNzEyL3N0YXRlIHRva2VuPTMvMTogcmVnaXN0ZXIgc2xvdG51
bT0zCmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzo3NTA6d2F0Y2hmZF9jYWxsYmFjazogd2F0
Y2ggdz0weDU1Yjc4NzIxMDAgd3BhdGg9L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvdmJkLzYvNTE3
MTIvc3RhdGUgdG9rZW49My8xOiBldmVudCBlcGF0aD0vbG9jYWwvZG9tYWluLzAvYmFja2VuZC92
YmQvNi81MTcxMi9zdGF0ZQpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6MTA1MjpkZXZzdGF0
ZV9jYWxsYmFjazogYmFja2VuZCAvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvNi81MTcxMi9z
dGF0ZSB3YW50ZWQgc3RhdGUgNiBvawpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6ODUwOmxp
YnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9MHg1NWI3ODcyMTAwIHdwYXRoPS9s
b2NhbC9kb21haW4vMC9iYWNrZW5kL3ZiZC82LzUxNzEyL3N0YXRlIHRva2VuPTMvMTogZGVyZWdp
c3RlciBzbG90bnVtPTMKbGlieGw6IGRlYnVnOiBsaWJ4bF9kZXZpY2UuYzoxMDkwOmRldmljZV9i
YWNrZW5kX2NhbGxiYWNrOiBEb21haW4gNjpjYWxsaW5nIGRldmljZV9iYWNrZW5kX2NsZWFudXAK
bGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjg2NDpsaWJ4bF9fZXZfeHN3YXRjaF9kZXJlZ2lz
dGVyOiB3YXRjaCB3PTB4NTViNzg3MjEwMDogZGVyZWdpc3RlciB1bnJlZ2lzdGVyZWQKbGlieGw6
IGRlYnVnOiBsaWJ4bF9saW51eC5jOjE5NDpsaWJ4bF9faG90cGx1Z19kaXNrOiBEb21haW4gNjpB
cmdzIGFuZCBlbnZpcm9ubWVudCByZWFkeQpsaWJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjEx
OTE6ZGV2aWNlX2hvdHBsdWc6IERvbWFpbiA2OmNhbGxpbmcgaG90cGx1ZyBzY3JpcHQ6IC9ldGMv
eGVuL3NjcmlwdHMvYmxvY2sgcmVtb3ZlCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTE5
MjpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6ZXh0cmEgYXJnczoKbGlieGw6IGRlYnVnOiBsaWJ4
bF9kZXZpY2UuYzoxMjAwOmRldmljZV9ob3RwbHVnOiBEb21haW4gNjplbnY6CmxpYnhsOiBkZWJ1
ZzogbGlieGxfZGV2aWNlLmM6MTIwNzpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6CXNjcmlwdDog
L2V0Yy94ZW4vc2NyaXB0cy9ibG9jawpsaWJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjEyMDc6
ZGV2aWNlX2hvdHBsdWc6IERvbWFpbiA2OglYRU5CVVNfVFlQRTogdmJkCmxpYnhsOiBkZWJ1Zzog
bGlieGxfZGV2aWNlLmM6MTIwNzpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6CVhFTkJVU19QQVRI
OiBiYWNrZW5kL3ZiZC82LzUxNzEyCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTIwNzpk
ZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6CVhFTkJVU19CQVNFX1BBVEg6IGJhY2tlbmQKbGlieGw6
IGRlYnVnOiBsaWJ4bF9hb3V0aWxzLmM6NTkzOmxpYnhsX19hc3luY19leGVjX3N0YXJ0OiBmb3Jr
aW5nIHRvIGV4ZWN1dGU6IC9ldGMveGVuL3NjcmlwdHMvYmxvY2sgcmVtb3ZlIApsaWJ4bDogZGVi
dWc6IGxpYnhsX2V2ZW50LmM6ODY0OmxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNo
IHc9MHg1NWI3ODcyMjAwOiBkZXJlZ2lzdGVyIHVucmVnaXN0ZXJlZApsaWJ4bDogZGVidWc6IGxp
YnhsX2xpbnV4LmM6MjExOmxpYnhsX19nZXRfaG90cGx1Z19zY3JpcHRfaW5mbzogRG9tYWluIDY6
bnVtX2V4ZWMgMSwgbm90IHJ1bm5pbmcgaG90cGx1ZyBzY3JpcHRzCmxpYnhsOiBkZWJ1ZzogbGli
eGxfZGV2aWNlLmM6MTE3NjpkZXZpY2VfaG90cGx1ZzogRG9tYWluIDY6Tm8gaG90cGx1ZyBzY3Jp
cHQgdG8gZXhlY3V0ZQpsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6ODY0OmxpYnhsX19ldl94
c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9MHg1NWI3ODcyMjAwOiBkZXJlZ2lzdGVyIHVucmVn
aXN0ZXJlZApsaWJ4bDogZGVidWc6IGxpYnhsX2RvbWFpbi5jOjE1OTY6ZGV2aWNlc19kZXN0cm95
X2NiOiBEb21haW4gNjpGb3JrZWQgcGlkIDI0MTQ1IGZvciBkZXN0cm95IG9mIGRvbWFpbgpsaWJ4
bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6MjA2NjpsaWJ4bF9fYW9fY29tcGxldGU6IGFvIDB4NTVi
Nzg2ZTI4MDogY29tcGxldGUsIHJjPS0zCmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzoyMDM1
OmxpYnhsX19hb19fZGVzdHJveTogYW8gMHg1NWI3ODZlMjgwOiBkZXN0cm95CmxpYnhsOiBkZWJ1
ZzogbGlieGxfZG9tYWluLmM6MTA0NTpsaWJ4bF9kb21haW5fZGVzdHJveTogRG9tYWluIDY6YW8g
MHg1NWI3ODZlMjgwOiBjcmVhdGU6IGhvdz0obmlsKSBjYWxsYmFjaz0obmlsKSBwb2xsZXI9MHg1
NWI3ODZlM2QwCmxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTE4MjpsaWJ4bF9fZGVzdHJv
eV9kb21pZDogRG9tYWluIDY6Tm9uLWV4aXN0YW50IGRvbWFpbgpsaWJ4bDogZXJyb3I6IGxpYnhs
X2RvbWFpbi5jOjExMzY6ZG9tYWluX2Rlc3Ryb3lfY2FsbGJhY2s6IERvbWFpbiA2OlVuYWJsZSB0
byBkZXN0cm95IGd1ZXN0CmxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTA2Mzpkb21haW5f
ZGVzdHJveV9jYjogRG9tYWluIDY6RGVzdHJ1Y3Rpb24gb2YgZG9tYWluIGZhaWxlZApsaWJ4bDog
ZGVidWc6IGxpYnhsX2V2ZW50LmM6MjA2NjpsaWJ4bF9fYW9fY29tcGxldGU6IGFvIDB4NTViNzg2
ZTI4MDogY29tcGxldGUsIHJjPS0yMQpsaWJ4bDogZGVidWc6IGxpYnhsX2RvbWFpbi5jOjEwNTQ6
bGlieGxfZG9tYWluX2Rlc3Ryb3k6IERvbWFpbiA2OmFvIDB4NTViNzg2ZTI4MDogaW5wcm9ncmVz
czogcG9sbGVyPTB4NTViNzg2ZTNkMCwgZmxhZ3M9aWMKbGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVu
dC5jOjIwMzU6bGlieGxfX2FvX19kZXN0cm95OiBhbyAweDU1Yjc4NmUyODA6IGRlc3Ryb3kKeGVu
Y2FsbDpidWZmZXI6IGRlYnVnOiB0b3RhbCBhbGxvY2F0aW9uczoxMTcgdG90YWwgcmVsZWFzZXM6
MTE3CnhlbmNhbGw6YnVmZmVyOiBkZWJ1ZzogY3VycmVudCBhbGxvY2F0aW9uczowIG1heGltdW0g
YWxsb2NhdGlvbnM6Mwp4ZW5jYWxsOmJ1ZmZlcjogZGVidWc6IGNhY2hlIGN1cnJlbnQgc2l6ZToz
CnhlbmNhbGw6YnVmZmVyOiBkZWJ1ZzogY2FjaGUgaGl0czoxMDIgbWlzc2VzOjMgdG9vYmlnOjEy
CnhlbmNhbGw6YnVmZmVyOiBkZWJ1ZzogdG90YWwgYWxsb2NhdGlvbnM6MCB0b3RhbCByZWxlYXNl
czowCnhlbmNhbGw6YnVmZmVyOiBkZWJ1ZzogY3VycmVudCBhbGxvY2F0aW9uczowIG1heGltdW0g
YWxsb2NhdGlvbnM6MAp4ZW5jYWxsOmJ1ZmZlcjogZGVidWc6IGNhY2hlIGN1cnJlbnQgc2l6ZTow
CnhlbmNhbGw6YnVmZmVyOiBkZWJ1ZzogY2FjaGUgaGl0czowIG1pc3NlczowIHRvb2JpZzowCg==
--00000000000023b72d05dd13d25a--

