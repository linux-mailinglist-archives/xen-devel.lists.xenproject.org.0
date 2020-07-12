Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2B21CBDA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 00:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jukQL-0001f8-I3; Sun, 12 Jul 2020 22:26:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mbu0=AX=gmail.com=marietto2008@srs-us1.protection.inumbo.net>)
 id 1jukQJ-0001f3-P7
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 22:26:16 +0000
X-Inumbo-ID: b1fcbac0-c48e-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1fcbac0-c48e-11ea-bb8b-bc764e2007e4;
 Sun, 12 Jul 2020 22:26:14 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x9so3537017ljc.5
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2020 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DndvfLd9uyHXeaqFN4iLX+XhPAuX2eei+4DQXZwmmoQ=;
 b=R0zymY9NzRguKeF3Hh71iYc/U2gg44U2ED9YBRRZJRmSp6HN5B1RcUFk/MgGwvW1fK
 4vFCIU+tONt6FZAYODw7twB5peyobl5SMv1Bd2nqFZSjfKJ3rW0aTlDX4o+yH1LIUE7l
 A2kxb38wZI/kUAHiiiID8GOkHVx61O6Jmfwn/VD8+q6orZVpN6awdZLLAVyHpttsh9Tg
 xS1VngL3EDFMdyCiHvKa4c7zoIxe9Du9O76jkkWroUFRPlYmhWv5OD+2DcDSeuJVrSbF
 W02krBBTfbbRNCQe/vWsWwyfXktPfEWOTDbJLtZ88f0AnC/oKuC2LBkN8LRkps/85QO+
 dlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DndvfLd9uyHXeaqFN4iLX+XhPAuX2eei+4DQXZwmmoQ=;
 b=oe/K3qS0RGRBTgf+OB9QWxdbGOg2WT0ujGCQ4d39Nrd+FGkefeuHweY7ElV6VGFLnW
 L4vvWTTDD8RD9e0qMKKxArMU12Kx9P/YOBqjMEG2ZXr7IQGJfuWZm0mOyrUAKZglkClI
 EkDzl9NWARG5jzaZQ09RfSeWc9fLFozXv8vikY/77PsBkIzhxjUE3bkkngUiIdh7f/KT
 RmB+4AY7wI3jdtCJEnWhz1g9wLcmWrjaeoC+OuQt/buZ3tQjDrGKORLO/ro2Thr0YPDo
 5soBqIEz4a98nUs0KCJR4G45IAfyn3/FW9zSRyAIfT1BBlTZ05KVh4Wopr/MBD4MlrHJ
 /FQA==
X-Gm-Message-State: AOAM533RPPGMO1hGjYPFg8YzOOX6zXwNDguZChekkwornLDIr85EcR7c
 l8FomywzSheN61Kq7kiGFvIZSRdyTPt/Bwwqo3qpmxIAoTM=
X-Google-Smtp-Source: ABdhPJz1/3l/ddPsxJTHUY47v/X/GdUawWM8qnUQXFttSZgWrcpzupr58vuh/PlGeyVGwkCKb0Z3JyUeLDDGaz6Yqn4=
X-Received: by 2002:a05:651c:307:: with SMTP id
 a7mr45376729ljp.297.1594592772935; 
 Sun, 12 Jul 2020 15:26:12 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 13 Jul 2020 00:25:36 +0200
Message-ID: <CA+1FSiiQCcOnqJFJ0NM2mawZrmu5+5BQDUoAQ+-LeX3uAQozpA@mail.gmail.com>
Subject: config parsing error in disk specification: unknown value for format:
 near `hdb' in `/usr/share/ovmf/OVMF.fd,hdb,w'
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cad9a605aa460f5e"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000cad9a605aa460f5e
Content-Type: text/plain; charset="UTF-8"

Hello.

I'm a new xen user. I'm learning how works the xen hypervisor that I have
installed on ubuntu 20.04 with the command : apt install xen-hypervisor. I
want to boot the phisycal installation of windows 10 x64 bit that I have on
/dev/sdb,which belong to these partitions :


root@ziomario-I9:/etc/xen# fdisk /dev/sdb -l

Disk /dev/sdb: 465,78 GiB, 500107862016 bytes, 976773168 sectors

Disk model: Samsung SSD 860

Units: sectors of 1 * 512 = 512 bytes

Sector size (logical/physical): 512 bytes / 512 bytes

I/O size (minimum/optimal): 512 bytes / 512 bytes

Disklabel type: gpt


Dispositivo Start Fine Settori Size Tipo

/dev/sdb1 34 262177 262144 128M Microsoft reserved

/dev/sdb2 264192 1286143 1021952 499M Windows recovery environment

/dev/sdb3 1286144 1488895 202752 99M EFI System

/dev/sdb4 1488896 975591423 974102528 464,5G Microsoft basic data

/dev/sdb5 975591424 976773119 1181696 577M Windows recovery environment


I'm reading here : https://wiki.xenproject.org/wiki/OVMF


it says that if I want to enable EFI / UEFI for virtual machines I should
add this parameter bios='ovmf' and it also says :


# This is a disk image with EFI guest installed, you can also use live CD
if you prefer.

disk = [ '/data/s0-efi.qcow2,qcow2,hda,w' ]


So,according with my situation,I created a cfg file like this :


builder = 'hvm'

bios='ovmf'

vif = [ 'type=ioemu, bridge=xenbr0' ]

memory = 8192

name = "windows-10" # domain prefix name

disk = [ '/usr/share/ovmf/OVMF.fd,hdb,w' ]

boot = "c"

vcpus = 6 # number of cpu's to assignsdl=1

stdvga = 0

serial = 'pty'

usbdevice = 'tablet' # Required for USB mouse

on_poweroff = 'destroy'

on_reboot   = 'destroy'

on_crash    = 'preserve'

device_model_args_hvm = [

# Debug OVMF

'-chardev', 'file,id=debugcon,path=/etc/xen/ovmf.log,',

'-device', 'isa-debugcon,iobase=0x402,chardev=debugcon',

]



but it gives the following error :


xenwin.cfg: config parsing error in disk specification: unknown value for
format: near \hdb' in \/usr/share/ovmf/OVMF.fd,hdb,w'\``


do u know where is the error ?

-- 
Mario.

--000000000000cad9a605aa460f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.<br><br>I&#39;m a new xen user. I&#39;m learning how=
 works the xen hypervisor that I have installed on ubuntu 20.04 with the co=
mmand : apt install xen-hypervisor. I want to boot the phisycal installatio=
n of windows 10 x64 bit that I have on /dev/sdb,which belong to these parti=
tions :<br><br><br>root@ziomario-I9:/etc/xen# fdisk /dev/sdb -l<br><br>Disk=
 /dev/sdb: 465,78 GiB, 500107862016 bytes, 976773168 sectors<br><br>Disk mo=
del: Samsung SSD 860<br><br>Units: sectors of 1 * 512 =3D 512 bytes<br><br>=
Sector size (logical/physical): 512 bytes / 512 bytes<br><br>I/O size (mini=
mum/optimal): 512 bytes / 512 bytes<br><br>Disklabel type: gpt<br><br><br>D=
ispositivo Start Fine Settori Size Tipo<br><br>/dev/sdb1 34 262177 262144 1=
28M Microsoft reserved<br><br>/dev/sdb2 264192 1286143 1021952 499M Windows=
 recovery environment<br><br>/dev/sdb3 1286144 1488895 202752 99M EFI Syste=
m<br><br>/dev/sdb4 1488896 975591423 974102528 464,5G Microsoft basic data<=
br><br>/dev/sdb5 975591424 976773119 1181696 577M Windows recovery environm=
ent<br><br><br>I&#39;m reading here : <a href=3D"https://wiki.xenproject.or=
g/wiki/OVMF">https://wiki.xenproject.org/wiki/OVMF</a><br><br><br>it says t=
hat if I want to enable EFI / UEFI for virtual machines I should add this p=
arameter bios=3D&#39;ovmf&#39; and it also says :<br><br><br># This is a di=
sk image with EFI guest installed, you can also use live CD if you prefer.<=
br><br>disk =3D [ &#39;/data/s0-efi.qcow2,qcow2,hda,w&#39; ]<br><br><br>So,=
according with my situation,I created a cfg file like this :<br><br><br>bui=
lder =3D &#39;hvm&#39;<br><br>bios=3D&#39;ovmf&#39;<br><br>vif =3D [ &#39;t=
ype=3Dioemu, bridge=3Dxenbr0&#39; ]<br><br>memory =3D 8192<br><br>name =3D =
&quot;windows-10&quot; # domain prefix name<br><br>disk =3D [ &#39;/usr/sha=
re/ovmf/OVMF.fd,hdb,w&#39; ]<br><br>boot =3D &quot;c&quot;<br><br>vcpus =3D=
 6 # number of cpu&#39;s to assignsdl=3D1<br><br>stdvga =3D 0<br><br>serial=
 =3D &#39;pty&#39;<br><br>usbdevice =3D &#39;tablet&#39; # Required for USB=
 mouse<br><br>on_poweroff =3D &#39;destroy&#39;<br><br>on_reboot =C2=A0 =3D=
 &#39;destroy&#39;<br><br>on_crash =C2=A0 =C2=A0=3D &#39;preserve&#39;<br><=
br>device_model_args_hvm =3D [<br><br># Debug OVMF<br><br>&#39;-chardev&#39=
;, &#39;file,id=3Ddebugcon,path=3D/etc/xen/ovmf.log,&#39;,<br><br>&#39;-dev=
ice&#39;, &#39;isa-debugcon,iobase=3D0x402,chardev=3Ddebugcon&#39;,<br><br>=
]<br><br><br><br>but it gives the following error :<br><br><br>xenwin.cfg: =
config parsing error in disk specification: unknown value for format: near =
\hdb&#39; in \/usr/share/ovmf/OVMF.fd,hdb,w&#39;\``<br><br><br>do u know wh=
ere is the error ?<br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature">Mario.<br></div></div>

--000000000000cad9a605aa460f5e--

