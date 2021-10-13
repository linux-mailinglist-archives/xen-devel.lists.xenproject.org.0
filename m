Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D4042C031
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208392.364498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madUt-0002YW-Sh; Wed, 13 Oct 2021 12:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208392.364498; Wed, 13 Oct 2021 12:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madUt-0002Vj-OT; Wed, 13 Oct 2021 12:36:39 +0000
Received: by outflank-mailman (input) for mailman id 208392;
 Wed, 13 Oct 2021 12:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLgy=PB=gmail.com=ysaikiran1997@srs-us1.protection.inumbo.net>)
 id 1madUr-0002VZ-SK
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:36:37 +0000
Received: from mail-yb1-xb31.google.com (unknown [2607:f8b0:4864:20::b31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14ce58b4-38e1-4ec8-9807-e86b9205a59c;
 Wed, 13 Oct 2021 12:36:36 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id h2so5914865ybi.13
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 05:36:36 -0700 (PDT)
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
X-Inumbo-ID: 14ce58b4-38e1-4ec8-9807-e86b9205a59c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIEnGOipm0AE4dO+LlG8N5/ABREeO/sIeAK3UEXXBcI=;
        b=KC4ZHxopr+UHpgl8R+Ea30JQnUJWIS5P/RcMKCvM/CRgiEXOQCCW0Wh34pjRC+QIzw
         A/qC8MxMXf5BIcfgQJWWzTK49GUNDi9evOagcOZ8XJSh+3gecBsbqKcW4s/Lgc4Wf/70
         gRSkR46cAzxmNN1CLlNkoLfR7SMwyeFAf78em/SV5iDa76R4Eb6kZ48CdkV1HUJZZ6PO
         rfxs7Rbi5IUkZZ/yDnOKR5GpUxe+1EUHn6hUsRvdMMEjzBwFCngqzizhdwTf1FAL/bQj
         pe+lYl7unzO6YTOEqyrGUtb4C2yLps9M7JAWfl2AGYn+A5bgxupsJfnKTuGaWF4aGt0l
         Fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIEnGOipm0AE4dO+LlG8N5/ABREeO/sIeAK3UEXXBcI=;
        b=K03O/Jqm6IDF8zW+db1d59YMT9NPZLoFpzjFGEldDNEa5FYDhJE176MolvNfVI/Phw
         MD4zuJRiHvdaW3KBzPpgUAZTqYT455Mb1+FWiYuY7/WW4ixh/+l3eqiM8M5GqMyVTZty
         XaIzSplWZTfCdc+0DR0vIlB6V/yQqkP+dK6g64ZTj5pVbU2v+pnnXK5p9pCwrT7H+297
         F0UYylo64evrbZ0zcqlI2R7YDdTSSzJ9TCODVFilTQHifMbEHqzftz4HIAoKQ7qziBem
         cbz21M0XgmJyNPV3eQtdHm/+J8wAAhsSw0X5YuuQcp4znhvmNVAGAJVcEqQv0B+rzKQk
         nYYg==
X-Gm-Message-State: AOAM530S69rS2S+xYZA29gl7HZP1nWo/B9ATiWT31c3gL5arPvhmHbHO
	EkxB2PH+RfWAm8+VS0JbGcJWeEqW7U+S/bu+Ud4=
X-Google-Smtp-Source: ABdhPJzryrZtoVEU4hTta+mm78BMnzH687i5c9d3wErCt9yJqElXTcxTuLxRkMPIs6Zz2zCskJtG1aPNzz0mIfk/7Cc=
X-Received: by 2002:a25:cb03:: with SMTP id b3mr34803792ybg.138.1634128595571;
 Wed, 13 Oct 2021 05:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
 <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
 <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
 <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
 <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
 <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s> <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
In-Reply-To: <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
From: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
Date: Wed, 13 Oct 2021 18:06:23 +0530
Message-ID: <CAEsO4uxRMzTbdfLZY2MQ=e12NRC6AG4_oYKGMwhZOq4a6su-9w@mail.gmail.com>
Subject: Re: Xen Booting Problem on ARM Machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	xen-devel@lists.xenproject.org, kannan@cimware.in
Content-Type: multipart/alternative; boundary="00000000000074d75105ce3b3661"

--00000000000074d75105ce3b3661
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am resending the mail as the attachment size is more. Here is the link to
the attachments:
https://drive.google.com/drive/folders/1daloarRFaopg8vf-6Uwq-pRd9ki0EXm8?us=
p=3Dsharing


On Wed, Oct 13, 2021 at 5:30 PM Sai Kiran Kumar Reddy Y <
ysaikiran1997@gmail.com> wrote:

>
>
> On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini <sstabellini@kernel.org=
>
> wrote:
>
>> Yes there are other ways but without serial is going to be difficult
>> because you are not going to see anything until everything works.
>>
>> How do you boot Xen and Dom0 exactly from EDK2? Are you using GRUB or
>> loading Xen directly from the EDK2 prompt? Please provide as many
>> details as possible so that I might be able to spot any errors.
>>
>  I am using GRUB to load Xen. In the GRUB menu, I see two options.
Option 1: Debian 11 with latest Linux Kernel
Option 2: Debian 11(with Xen hypervisor) with latest Kernel

>
>
>> Can you provide the Device Tree you are using? If you are not passing
>> any Device Tree  binary explicitely, then it might be passed
>> automatically from EDK2 to Linux/Xen. In that case, just boot from Linux
>> then do the following to retrieve the Device Tree:
>>
>> dtc -I fs -O dts /proc/device-tree > host.dts
>>
>> Then please attach host.dts to this email thread.
>>
>> Yeah, you are right. It looks like LInux is booting from ACPI. In the
bootloader menu, "Automatic ACPI configuration" is disabled. So, I thought
that Linux may be booting from Device Tree. I have tried the "dtc" command
you mentioned. But it looks like there's no device-tree under "/proc". I
also tried to get DT info, from "/sys/firmware/devicetree/base" . But,
there's no info. under devicetree folder. I am not quite sure how to get
the DT info, if the Linux is booting from ACPI. I am attaching .dsl files,
that contain the acpi info.

>
>> Also for your information it looks like Linux actually booted from ACPI,
>> not from Device Tree, as you can see from all the "ACPI" messages in the
>> kernel logs.
>>
>> If you need to boot from ACPI, then you need to enable ACPI support in
>> Xen, which is disabled by default. You can do that using make
>> menuconfig.
>>
>>  In the make menuconfig of Xen, I do not see any option to enable ACPI.

>
>> On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>> > Hi,
>> > Sorry about the delay. We have been trying to access the serial of the
>> machine. Tried with couple of JTAG connectors. There's still no
>> > debug messages on the serial. Is there any other way of figuring this
>> out?
>> >
>> > On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       Something is off. When you enabled earlyprintk in Xen, you shoul=
d
>> see
>> >       something like this at boot time:
>> >       https://marc.info/?l=3Dxen-devel&m=3D158829968025334
>> >
>> >       All the Xen logs starting with "(XEN)" on the serial. Do you hav=
e
>> access
>> >       to the serial of the machine? Without it, it is going to be hard
>> to
>> >       debug.
>> >
>> >
>> >       On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>> >       > In the folder "/var/log", there's a file called "xen", which i=
s
>> empty. As far as the boot logs are concerned, I don't see any
>> >       debug
>> >       > messages related to xen. I am attaching the log files,
>> "kern.txt" and "boot.txt"
>> >       >
>> >       > On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       >       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>> >       >       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <
>> julien@xen.org> wrote:
>> >       >       >
>> >       >       >
>> >       >       >       On 08/09/2021 11:43, Sai Kiran wrote:
>> >       >       >       > Hello,
>> >       >       >
>> >       >       >       Hi,
>> >       >       >
>> >       >       >       Thank you for the report. Moving the discussion
>> back to xen-devel
>> >       >       >       because this looks like a potential issue in the
>> UEFI stub in Xen.
>> >       >       >
>> >       >       >       > I have Xen-4.15.0 on an ARM Machine, with
>> Debian 11 installed on it.
>> >       >       >
>> >       >       >       Would you be able to give more details on the Ar=
m
>> machine you are using?
>> >       >       >       Also, are you using ACPI or DT to boot?
>> >       >       >
>> >       >       >
>> >       >       >    Sai >> DT . ACPI configuration is disabled in Boot
>> settings
>> >       >       >
>> >       >       >       >  I
>> >       >       >       > am able to do =E2=80=9Cmake world=E2=80=9D and=
 =E2=80=9Cmake install=E2=80=9D,
>> after =E2=80=9C./configure=E2=80=9D, as
>> >       >       >       > specified in README file. When I reboot the
>> system, I get the following
>> >       >       >       > message:
>> >       >       >       >
>> >       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>> >       >       >       >
>> >       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>> >       >       >
>> >       >       >       Hmmm... This means that you have more than 128
>> memory regions described
>> >       >       >       in the EFI memory map. That's quite a lot.
>> >       >       >
>> >       >       >       Although, this should be harmless as it means Xe=
n
>> will not use the extra
>> >       >       >       memory banks.
>> >       >       >
>> >       >       >       >
>> >       >       >       > Cannot exit boot services: ErrCode:
>> 0x8000000000000002
>> >       >       >
>> >       >       >       This means EFI_INVALID_PARAMETER. We have code t=
o
>> retry because AFAICT
>> >       >       >       ExitBootServices() may sometime fails (I have
>> CCed Jan may have more
>> >       >       >       idea what's happening).
>> >       >       >
>> >       >       >       Would you be able to provide more details on the
>> UEFI firmware you are
>> >       >       >       using? Is it EDK2 or U-boot?
>> >       >       >
>> >       >       > Sai >>  EDK2
>> >       >       >       Also, do you know if Linux is boot on the same
>> system?
>> >       >       >
>> >       >       > Sai >> Yes
>> >       >       >       However, AFAICT, the error message would not
>> prevent Xen to continue
>> >       >       >       booting. So you may get stuck later in the boot
>> process.
>> >       >       >
>> >       >       >       My suggestion would be to enable earlyprintk for
>> your platform. You can
>> >       >       >       setup it up from the menuconfig in "Debugging
>> Options".
>> >       >       >
>> >       >       > Sai >> Yes, I have enabled earlyprintk.
>> >       >       > I tried changing NR_MEM_BANKS(in
>> xen/include/asm-arm/setup.h) value to 256, from 128. The error message i=
s
>> no longer
>> >       seen,
>> >       >       but the device
>> >       >       > is stuck in the boot process.
>> >       >
>> >       >       Could you please post the boot logs now that you enabled
>> earlyprintk?
>> >       >       Ideally not a camera picture but a textual copy/paste
>> from the target
>> >       >       serial?
>> >       >
>> >       >       Earlyprintk is pretty verbose, we should be able to
>> figure out where it
>> >       >       gets stuck.
>> >       >
>> >       >
>> >       >
>> >
>> >
>> >
>
>

--00000000000074d75105ce3b3661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am resending the mail =
as the attachment size is more. Here is the link to the attachments: <a hre=
f=3D"https://drive.google.com/drive/folders/1daloarRFaopg8vf-6Uwq-pRd9ki0EX=
m8?usp=3Dsharing">https://drive.google.com/drive/folders/1daloarRFaopg8vf-6=
Uwq-pRd9ki0EXm8?usp=3Dsharing</a></div><div><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 5:3=
0 PM Sai Kiran Kumar Reddy Y &lt;<a href=3D"mailto:ysaikiran1997@gmail.com"=
>ysaikiran1997@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1=
, 2021 at 8:17 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Yes there are other ways bu=
t without serial is going to be difficult<br>
because you are not going to see anything until everything works.<br>
<br>
How do you boot Xen and Dom0 exactly from EDK2? Are you using GRUB or<br>
loading Xen directly from the EDK2 prompt? Please provide as many<br>
details as possible so that I might be able to spot any errors.<br></blockq=
uote><div></div></div></div></blockquote><div>=C2=A0I am using GRUB to load=
 Xen. In the GRUB menu, I see two options. <br></div><div>Option 1: Debian =
11 with latest Linux Kernel</div><div>Option 2: Debian 11(with Xen hypervis=
or) with latest Kernel</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Can you provide the Device Tree you are using? If you are not passing<br>
any Device Tree=C2=A0 binary explicitely, then it might be passed<br>
automatically from EDK2 to Linux/Xen. In that case, just boot from Linux<br=
>
then do the following to retrieve the Device Tree:<br>
<br>
dtc -I fs -O dts /proc/device-tree &gt; host.dts<br>
<br>
Then please attach host.dts to this email thread.<br>
<br></blockquote><div></div></div></div></blockquote><div>Yeah, you are rig=
ht. It looks like LInux is booting from ACPI. In the bootloader menu, &quot=
;Automatic ACPI configuration&quot; is disabled. So, I thought that Linux m=
ay be booting from Device Tree. I have tried the &quot;dtc&quot; command yo=
u mentioned. But it looks like there&#39;s no device-tree under &quot;/proc=
&quot;. I also tried to get DT info, from &quot;/sys/firmware/devicetree/ba=
se&quot; . But, there&#39;s no info. under devicetree folder. I am not quit=
e sure how to get the DT info, if the Linux is booting from ACPI. I am atta=
ching .dsl files, that contain the acpi info.<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also for your information it looks like Linux actually booted from ACPI,<br=
>
not from Device Tree, as you can see from all the &quot;ACPI&quot; messages=
 in the<br>
kernel logs.<br>
<br>
If you need to boot from ACPI, then you need to enable ACPI support in<br>
Xen, which is disabled by default. You can do that using make<br>
menuconfig.<br>
<br></blockquote><div></div></div></div></blockquote><div>=C2=A0In the make=
 menuconfig of Xen, I do not see any option to enable ACPI.=C2=A0=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt; Hi,<br>
&gt; Sorry about the delay. We have been trying to access the serial of the=
 machine. Tried with couple of JTAG connectors. There&#39;s still no<br>
&gt; debug messages on the serial. Is there any other way of figuring this =
out?<br>
&gt; <br>
&gt; On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini &lt;<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Something is off. When you enabled earlyprin=
tk in Xen, you should see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0something like this at boot time:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://marc.info/?l=3Dxen-devel&=
amp;m=3D158829968025334" rel=3D"noreferrer" target=3D"_blank">https://marc.=
info/?l=3Dxen-devel&amp;m=3D158829968025334</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0All the Xen logs starting with &quot;(XEN)&q=
uot; on the serial. Do you have access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to the serial of the machine? Without it, it=
 is going to be hard to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debug.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In the folder &quot;/var/log&quot;, the=
re&#39;s a file called &quot;xen&quot;, which is empty. As far as the boot =
logs are=C2=A0concerned, I don&#39;t see any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; messages related to xen. I am attaching=
 the log files, &quot;kern.txt&quot; and &quot;boot.txt&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, Sep 14, 2021 at 3:08 AM Stefano=
 Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 13 Se=
p 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, =
Sep 10, 2021 at 7:30 PM Julien Grall &lt;<a href=3D"mailto:julien@xen.org" =
target=3D"_blank">julien@xen.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0On 08/09/2021 11:43, Sai Kiran wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Thank you for the report. Moving the discussion back to=
 xen-devel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0because this looks like a potential issue in the UEFI s=
tub in Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; I have Xen-4.15.0 on an ARM Machine, with Debian 1=
1 installed on it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Would you be able to give more details on the Arm machi=
ne you are using?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Also, are you using ACPI or DT to boot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0Sai &gt;&gt; DT . ACPI configuration is disabled in Boot settings=C2=
=A0 =C2=A0=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; am able to do =E2=80=9Cmake world=E2=80=9D and =E2=
=80=9Cmake install=E2=80=9D, after =E2=80=9C./configure=E2=80=9D, as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; specified in README file. When I reboot the system=
, I get the following<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Warning: All 128 bootinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Warning: All 128 bootinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Hmmm... This means that you have more than 128 memory r=
egions described<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0in the EFI memory map. That&#39;s quite a lot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Although, this should be harmless as it means Xen will =
not use the extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0memory banks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Cannot exit boot services: ErrCode: 0x800000000000=
0002<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0This means EFI_INVALID_PARAMETER. We have code to retry=
 because AFAICT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0ExitBootServices() may sometime fails (I have CCed Jan =
may have more<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0idea what&#39;s happening).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Would you be able to provide more details on the UEFI f=
irmware you are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0using? Is it EDK2 or U-boot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;=
&gt;=C2=A0 EDK2=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Also, do you know if Linux is boot on the same system?<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;=
&gt; Yes=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0However, AFAICT, the error message would not prevent Xe=
n to continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0booting. So you may get stuck later in the boot process=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0My suggestion would be to enable earlyprintk for your p=
latform. You can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0setup it up from the menuconfig in &quot;Debugging Opti=
ons&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;=
&gt; Yes, I have enabled earlyprintk.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I tried =
changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 12=
8. The error message is no longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but the devic=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; is stuck=
 in the boot process.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Could you ple=
ase post the boot logs now that you enabled earlyprintk?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Ideally not a=
 camera picture but a textual copy/paste from the target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0serial?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Earlyprintk i=
s pretty verbose, we should be able to figure out where it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gets stuck.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div></div>
</blockquote></div></div>

--00000000000074d75105ce3b3661--

