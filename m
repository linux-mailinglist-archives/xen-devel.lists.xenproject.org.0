Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FF433559
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213094.371206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnrB-0000Rb-VO; Tue, 19 Oct 2021 12:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213094.371206; Tue, 19 Oct 2021 12:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnrB-0000Pj-SG; Tue, 19 Oct 2021 12:04:37 +0000
Received: by outflank-mailman (input) for mailman id 213094;
 Tue, 19 Oct 2021 12:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTOV=PH=gmail.com=ysaikiran1997@srs-us1.protection.inumbo.net>)
 id 1mcnrA-0000Pd-3j
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:04:36 +0000
Received: from mail-yb1-xb2d.google.com (unknown [2607:f8b0:4864:20::b2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bac3b836-899c-446b-83fc-62e6e0ad7b43;
 Tue, 19 Oct 2021 12:04:34 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id o134so1891181ybc.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Oct 2021 05:04:34 -0700 (PDT)
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
X-Inumbo-ID: bac3b836-899c-446b-83fc-62e6e0ad7b43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7zJgQhUIQrg5eCINZFMpiDcYJ3sNVsxZp8iHqFYbLzw=;
        b=js0UcFx6NyR6/ckLPQOr19y+i0VRf+uCuP0GNgOaVHa00uV3X/kHt6/Y0XYsBYNE6N
         U75FFplF7ykWyMDxYXHZEcvBDEkbSu4LaKOHDzPNrYoYCEl8Lr0FK/+3OBUMkpBKSzK4
         xWP1iAeXkuJW7Mq7Fg9Ie6mDlO49bHPLudn3dQMnR3XQyA9nMtIz/b1Ighs3je9oJv8g
         0g3YeYnjrM2tSvPT08Hiy1XLgmJEqgRADyRquunZoNlPPjdBNlPL98ZkMkeW9CB7hR4M
         97yMeUoPJCJcFaO5Zk6PYTLAxbRXOPfkehwRIaO4QreX29ADKAMWwmN75NQ15Z30xdvz
         kozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7zJgQhUIQrg5eCINZFMpiDcYJ3sNVsxZp8iHqFYbLzw=;
        b=v689kyai3lgM28Lz36VVG68Zl43nAWdCge0bOFpse0CN4Jb1p+CUW9MN+lbqKJaleP
         n2+gkwohu4Y/aD+48+Euzo6Vx6ma97e2897Q7TrmBpFkLwspsEOnRuWJrT/Lh6gfqSjq
         363vDcSA4jfIgFkB3+WDtE4TKgY4jftYfc21QrArJYQoQkC1ndZsWPY5cM806tR3hfUQ
         Y75WrqUrD+vrWQa7EVttGi7MmQ+vF8zSK5Pq2/KsEuwV3nB5y5k3M3/5yxQPkj5lKR8U
         B9fJfaGicvenyT1Uzz1vTUG8I6Oc1wjwpMBsQQBFwaALU8tcLxr9dQD+C/rh6hRu/gLS
         FewA==
X-Gm-Message-State: AOAM531s9tYIQtGjUeDjI+S10bypenYaIR2U79syF210Zzp6tglMsJpx
	1BA6o9ugsUtXaxLznj+ZnvTXAvh9oNQKodYaKTk=
X-Google-Smtp-Source: ABdhPJz0A/ZVOB3B7unfUuxoMUnJrzG9VZBv3Tr3hH8G0FccgmI1whPia2lmM+by22SG6xNpMzhYCgbKWXPuJhHUFXI=
X-Received: by 2002:a25:2610:: with SMTP id m16mr35183968ybm.508.1634645073790;
 Tue, 19 Oct 2021 05:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
 <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
 <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
 <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
 <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
 <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
 <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s>
 <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com> <alpine.DEB.2.21.2110141536090.9408@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110141536090.9408@sstabellini-ThinkPad-T480s>
From: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
Date: Tue, 19 Oct 2021 17:34:22 +0530
Message-ID: <CAEsO4uzwNHiLEZVEy90uua9YRud=Bmj=EPhzbhyk0tsEai=UQg@mail.gmail.com>
Subject: Re: Xen Booting Problem on ARM Machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	xen-devel@lists.xenproject.org, kannan@cimware.in
Content-Type: multipart/alternative; boundary="000000000000f50b8005ceb37649"

--000000000000f50b8005ceb37649
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your inputs. As you have mentioned, I tried to boot Xen directly
from EFI, thereby skipping GRUB. I made sure that kernel, xen.cfg and
ramdisk are on the first FAT partition. I still get "All 128 bootinfo
membanks exhausted error". The following link has my grub.cfg config. file
and also the snapshot of the error.

Link:
https://drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=sharing

I feel that even with EFI bootloader, there's some issue with bootinfo mem
banks and it maynot be a bug in GRUB. Let me know your thoughts on this.

Thanks in advance,

Regards,
Sai Kiran.

On Fri, Oct 15, 2021 at 4:19 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 14 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
> > On Thu, Oct 14, 2021 at 5:45 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
> >       > On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       Yes there are other ways but without serial is going to be
> difficult
> >       >       because you are not going to see anything until everything
> works.
> >       >
> >       >       How do you boot Xen and Dom0 exactly from EDK2? Are you
> using GRUB or
> >       >       loading Xen directly from the EDK2 prompt? Please provide
> as many
> >       >       details as possible so that I might be able to spot any
> errors.
> >       >
> >       > I am using GRUB to load Xen. In the GRUB menu, I see two
> options.
> >       > Option 1: Debian 11 with latest Linux Kernel
> >       > Option 2: Debian 11(with Xen hypervisor) with latest Kernel
> >       >
> >       >       Can you provide the Device Tree you are using? If you are
> not passing
> >       >       any Device Tree  binary explicitely, then it might be
> passed
> >       >       automatically from EDK2 to Linux/Xen. In that case, just
> boot from Linux
> >       >       then do the following to retrieve the Device Tree:
> >       >
> >       >       dtc -I fs -O dts /proc/device-tree > host.dts
> >       >
> >       >       Then please attach host.dts to this email thread.
> >       >
> >       > Yeah, you are right. It looks like LInux is booting from ACPI.
> In the bootloader menu, "Automatic ACPI configuration" is
> >       disabled. So, I
> >       > thought that Linux may be booting from Device Tree. I have tried
> the "dtc" command you mentioned. But it looks like there's
> >       no device-tree
> >       > under "/proc". I also tried to get DT info, from
> "/sys/firmware/devicetree/base" . But, there's no info. under devicetree
> >       folder. I am not
> >       > quite sure how to get the DT info, if the Linux is booting from
> ACPI. I am attaching .dsl files, that contain the acpi info.
> >
> >       OK, so it is pretty clear that even if "Automatic ACPI
> configuration" is
> >       disabled, it is still booting with ACPI.
> >
> >
> >       >       Also for your information it looks like Linux actually
> booted from ACPI,
> >       >       not from Device Tree, as you can see from all the "ACPI"
> messages in the
> >       >       kernel logs.
> >       >
> >       >       If you need to boot from ACPI, then you need to enable
> ACPI support in
> >       >       Xen, which is disabled by default. You can do that using
> make
> >       >       menuconfig.
> >       >
> >       > In the make menuconfig of Xen, I do not see any option to enable
> ACPI.
> >
> >       You definitely need to enable ACPI support in Xen, if you are
> booting
> >       from ACPI, otherwise nothing is going to work.
> >
> >       On the latest staging (https://gitlab.com/xen-project/xen) you can
> >       enable ACPI as follows:
> >
> >
> >       # export CROSS_COMPILE=/path/to/cross-compiler
> >       # export XEN_TARGET_ARCH=arm64
> >       # cd xen.git/xen
> >       # make menuconfig
> >       #   --> Configure UNSUPPORTED features
> >       #   --> Architecture Features --> ACPI
> >       # make
> >
> >
> > Hi
> >
> > I got the code from Gitlab and installed it, enabling ACPI support in
> Xen. As I reboot the system, I am able to see 2 options like before.
> > Option 1: Debian with latest kernel
> > Option 2 : Debian with Xen
> >
> > I have selected Option 2. I did not see any bootinfo membanks error.
> However, there is the following error in GRUB(just for a fraction of a
> > second).
> >
> > "Using modules provided by boot loader in FDT
> >   Xen 4.16-unstable (c/s Wed Oct 13 13 13:28:43 2021 -0700
> git:4cfab4425d) EFI Loader
> >   Couldn't obtain the File System Protocol Interface: ErrCode:
> 0x8000000000000002"
> >
> > I have enabled earlyprintk. I do not see any messages in the Serial.
> There seems to be some problem with the gitlab version of Xen.
>
> The error comes from xen/common/efi/boot.c:get_parent_handle
>
> Xen is booted as EFI binary and it is trying to load other binaries
> using the EFI File System Protocol Interface which is one of the EFI
> Boot Services.
>
> A wild guess is that somehow Grub is calling ExitBootServices, which
> closes all Boot Services interfaces, before executing Xen. It should not
> happen if Grub is executing Xen as EFI binary. I cannot explain how it
> is possible. It looks like a bug in Grub.
>
> Can you post the Grub config file that you are using?
>
>
> Usually before Grub there is the proper EFI bootloader, tipically EDK2.
> You should be able to boot Xen directly from the EFI bootloader too,
> from its prompt, just by executing "xen". You need to place the xen
> binary in the first FAT partition together with a xen.cfg config file as
> follows:
>
> ---
> options=console=com1 com1=115200 loglvl=all noreboot
> kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
> ramdisk=initrd-3.0.31-0.4-xen
> ---
>
> options is to specify the Xen command line.
> kernel is to specify the Linux kernel to use and its command line.
> ramdisk is to specify the Linux ramdisk.
>
> Both kernel and ramdisk needs to be on the FAT partition too.
>
>
> That way you skip Grub and you might be able to skip any related
> problems with ExitBootServices.

--000000000000f50b8005ceb37649
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks for your inputs. As you have=
=C2=A0mentioned, I tried to boot Xen directly from EFI, thereby skipping GR=
UB. I made sure that kernel, xen.cfg and ramdisk are on the first FAT parti=
tion. I still get &quot;All 128 bootinfo membanks exhausted error&quot;. Th=
e following link has my grub.cfg config. file and also the snapshot of the =
error.</div><div><br></div><div>Link:=C2=A0<a href=3D"https://drive.google.=
com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=3Dsharing">https://=
drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=3Dshar=
ing</a></div><div><br></div><div>I feel that even with EFI bootloader, ther=
e&#39;s some issue with bootinfo mem banks and it maynot be a bug in GRUB. =
Let me know your thoughts on this.</div><div><br></div><div>Thanks in advan=
ce,</div><div><br></div><div>Regards,</div><div>Sai Kiran.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct=
 15, 2021 at 4:19 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@k=
ernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 14 Oct 2021, Sai Kiran Kumar Reddy=
 Y wrote:<br>
&gt; On Thu, Oct 14, 2021 at 5:45 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, Oct 1, 2021 at 8:17 AM Stefano =
Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">=
sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yes there are=
 other ways but without serial is going to be difficult<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0because you a=
re not going to see anything until everything works.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How do you bo=
ot Xen and Dom0 exactly from EDK2? Are you using GRUB or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0loading Xen d=
irectly from the EDK2 prompt? Please provide as many<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0details as po=
ssible so that I might be able to spot any errors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am using GRUB to load Xen. In the GRU=
B menu, I see two options.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Option 1: Debian 11 with latest Linux K=
ernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Option 2: Debian 11(with Xen hypervisor=
) with latest Kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Can you provi=
de the Device Tree you are using? If you are not passing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0any Device Tr=
ee=C2=A0 binary explicitely, then it might be passed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0automatically=
 from EDK2 to Linux/Xen. In that case, just boot from Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0then do the f=
ollowing to retrieve the Device Tree:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dtc -I fs -O =
dts /proc/device-tree &gt; host.dts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Then please a=
ttach host.dts to this email thread.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Yeah, you are right. It looks like LInu=
x is booting from ACPI. In the bootloader menu, &quot;Automatic ACPI config=
uration&quot; is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disabled. So, I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; thought that Linux may be booting from =
Device Tree. I have tried the &quot;dtc&quot; command you mentioned. But it=
 looks like there&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0no device-tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; under &quot;/proc&quot;. I also tried t=
o get DT info, from &quot;/sys/firmware/devicetree/base&quot; . But, there&=
#39;s no info. under devicetree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0folder. I am not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; quite sure how to get the DT info, if t=
he Linux is booting from ACPI. I am attaching .dsl files, that contain the =
acpi info.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0OK, so it is pretty clear that even if &quot=
;Automatic ACPI configuration&quot; is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disabled, it is still booting with ACPI.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also for your=
 information it looks like Linux actually booted from ACPI,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not from Devi=
ce Tree, as you can see from all the &quot;ACPI&quot; messages in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel logs.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you need t=
o boot from ACPI, then you need to enable ACPI support in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen, which is=
 disabled by default. You can do that using make<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0menuconfig.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In the make menuconfig of Xen, I do not=
 see any option to enable ACPI.=C2=A0=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You definitely need to enable ACPI support i=
n Xen, if you are booting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from ACPI, otherwise nothing is going to wor=
k.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On the latest staging (<a href=3D"https://gi=
tlab.com/xen-project/xen" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/xen-project/xen</a>) you can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enable ACPI as follows:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# export CROSS_COMPILE=3D/path/to/cross-comp=
iler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# export XEN_TARGET_ARCH=3Darm64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# cd xen.git/xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# make menuconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0--&gt; Configure UNSUPPORTED f=
eatures<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0--&gt; Architecture Features -=
-&gt; ACPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# make<br>
&gt; <br>
&gt; <br>
&gt; Hi<br>
&gt; <br>
&gt; I got the code from Gitlab and installed it, enabling ACPI support in =
Xen. As I reboot the system, I am able to see 2 options like before.=C2=A0<=
br>
&gt; Option 1: Debian with latest kernel<br>
&gt; Option 2 : Debian with Xen<br>
&gt; <br>
&gt; I have selected Option 2. I did not see any bootinfo membanks=C2=A0err=
or. However, there is the following error in GRUB(just for a fraction of a<=
br>
&gt; second).=C2=A0<br>
&gt; <br>
&gt; &quot;Using modules provided by boot loader in FDT<br>
&gt; =C2=A0 Xen 4.16-unstable (c/s Wed Oct 13 13 13:28:43 2021 -0700 git:4c=
fab4425d) EFI Loader<br>
&gt; =C2=A0 Couldn&#39;t obtain the File System Protocol Interface: ErrCode=
: 0x8000000000000002&quot;<br>
&gt; <br>
&gt; I have enabled earlyprintk. I do not see any messages in the Serial. T=
here seems to be some problem with the gitlab version of Xen.<br>
<br>
The error comes from xen/common/efi/boot.c:get_parent_handle<br>
<br>
Xen is booted as EFI binary and it is trying to load other binaries<br>
using the EFI File System Protocol Interface which is one of the EFI<br>
Boot Services.<br>
<br>
A wild guess is that somehow Grub is calling ExitBootServices, which<br>
closes all Boot Services interfaces, before executing Xen. It should not<br=
>
happen if Grub is executing Xen as EFI binary. I cannot explain how it<br>
is possible. It looks like a bug in Grub.<br>
<br>
Can you post the Grub config file that you are using?<br>
<br>
<br>
Usually before Grub there is the proper EFI bootloader, tipically EDK2.<br>
You should be able to boot Xen directly from the EFI bootloader too,<br>
from its prompt, just by executing &quot;xen&quot;. You need to place the x=
en<br>
binary in the first FAT partition together with a xen.cfg config file as<br=
>
follows:<br>
<br>
---<br>
options=3Dconsole=3Dcom1 com1=3D115200 loglvl=3Dall noreboot<br>
kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]<br>
ramdisk=3Dinitrd-3.0.31-0.4-xen<br>
---<br>
<br>
options is to specify the Xen command line.<br>
kernel is to specify the Linux kernel to use and its command line.<br>
ramdisk is to specify the Linux ramdisk.<br>
<br>
Both kernel and ramdisk needs to be on the FAT partition too.<br>
<br>
<br>
That way you skip Grub and you might be able to skip any related<br>
problems with ExitBootServices.</blockquote></div>

--000000000000f50b8005ceb37649--

