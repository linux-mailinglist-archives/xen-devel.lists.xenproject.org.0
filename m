Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC47E35F0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 16:47:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNeMi-0002Xl-W1; Thu, 24 Oct 2019 14:45:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j0Y2=YR=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iNeMh-0002Xg-DO
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 14:45:27 +0000
X-Inumbo-ID: ea7436e4-f66c-11e9-bbab-bc764e2007e4
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea7436e4-f66c-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 14:45:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id a2so15293133pfo.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmyFr5bPnw7KCnLEXgg65kLyYUG+4H1qmVd1jz9Eaj8=;
 b=qrY/iK/i0yaT8zM5Xi42z5xCY9qKtLjZtgwYtBp+KeDXzSBCgz8O06LQCwzdzQCRTt
 6r0oAF5z7WDQSs5OyOF2LA+h7xe9H1vt/Re0z2EGyJv237lpUwXqPQMiO3sOUTfA+B4C
 Duxapq49OqEsKtI7r8fFu4rPgvhR0sm8FqSR8eq9DcViFu7W7ZHI+uOmSUFroJudL53A
 JYsZCDguNnAKH51ZDAimonygZUCt9ed9NibsRh0F6CzK8QDAEz3LfGjtr2iVgsZjBdLz
 IQcuR5hCkS/lPRO99WYjVqM7H25Vny4OnH6wEQ+xOJZzZKLpzUhYSgDhBLqIEwJbqZvT
 c1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmyFr5bPnw7KCnLEXgg65kLyYUG+4H1qmVd1jz9Eaj8=;
 b=KBKlEjTnSmG0pv8SD1XKZb7i64bbF8/nqd81lf8ofu/mw7gREAvUPEJRIrqmzpujut
 O5avu6aehThXOFCX0cyp39/90MyLzKgQqJl6r2WN49Fkv0JAC6VhqSF3kcSl40gl1BwA
 zgtBsgmj8hJOMDDrIF7FLN2K5TX6jIjkKr9YHgOu9GUekoaFdgtaUWkh233l10ANxlIB
 A9bvqojC824xVbFjY38+VDCgyCszXyl/wN1i7pvCBIIcwyW77k0W+89rZo6zEBEbqNQ7
 VVEBC6omBm/ZONRPOZIS3cTG4J2l7EwPE6unggMLeg1qxZmD6ErxRMsLSj4xyvKx+962
 Qfww==
X-Gm-Message-State: APjAAAU5sQMXhH3DcrKh1gPxL8oSac+shLXixx0yDgKAlW9oTWmtJrVU
 zQlaYwFe8fi/uEDUlrO/H+FhUHIGW4xCSXrUT5byDrGtyBQdMg==
X-Google-Smtp-Source: APXvYqwBCcANJObR6j2+VwqyK86DvZiE5w0bnkL9M2nXP17qgcR0ky1Ag19GirTcpAjz9wTzav4lP4c3YyB1zNuwHZA=
X-Received: by 2002:a62:b405:: with SMTP id h5mr18084647pfn.234.1571928325485; 
 Thu, 24 Oct 2019 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <1571918276.2606.0@crc.id.au>
In-Reply-To: <1571918276.2606.0@crc.id.au>
From: Paul Durrant <pdurrant@gmail.com>
Date: Thu, 24 Oct 2019 15:45:14 +0100
Message-ID: <CACCGGhBUx6AHfF2wJkQ3=M2OVDuLgR+Q4WBLCJE3Rb7-r3fRRQ@mail.gmail.com>
To: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0439668467106106986=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0439668467106106986==
Content-Type: multipart/alternative; boundary="00000000000073fab00595a91530"

--00000000000073fab00595a91530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not much clue in the logs. The crash params are weird though... certainly
not matching the doc. (
https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/bug-chec=
k-0xac--hal-memory-allocation)
but then again they are not always to be believed.
There are some odd looking IOMMU faults in there too.

 Paul

On Thu, 24 Oct 2019 at 13:01, Steven Haigh <netwiz@crc.id.au> wrote:

> Hi all,
>
> I've managed to get the git master version of Xen on this affected
> system and tries to boot a Windows Server 2016 system. It crashes as
> per normal.
>
> I managed to get these logs, but I'm not quite sure what else to do to
> debug this issue further.
>
> Suggestions welcome.
>
> The boot log in /var/log/xen/ shows:
> Waiting for domain soti.vm (domid 4) to die [pid 9174]
> Domain 4 has shut down, reason code 3 0x3
> Action for shutdown reason code 3 is destroy
> Domain 4 needs to be cleaned up: destroying the domain
> Done. Exiting now
>
> For some reason I'm not getting any serial output - so I'll have to
> take a look at that tomorrow - but if you need anything further, please
> let me know and I'll see what I can turn up.
>
> Windows config file:
>
> type =3D "hvm"
> name =3D "$vmname.vm"
> viridian =3D 1
> #viridian =3D ['base']
> memory =3D 8192
> vcpus =3D 4
> vif =3D ['bridge=3Dbr51, mac=3D00:16:3E:64:CC:A0']
> #disk =3D [ '/dev/vg_hosting/$vmname.vm,raw,xvda,rw',
> 'file:/root/SW_DVD9_NTRL_Windows_Svrs_2016_English_2_Std_DC_FPP_OEM_X21-2=
2567.ISO,hdc:cdrom,r'
>
> ]
> disk =3D [ '/dev/vg_hosting/$vmname.vm,raw,hda,rw' ]
> boot =3D 'cd'
> vnc =3D 2
> vnclisten =3D "0.0.0.0"
> #vncpasswd =3D ''
>
> ## Set the clock to localtime - not UTC...
> localtime =3D 1
>
> ## Fix the mouse cursor for VNC usage
> usbdevice =3D 'tablet'
>
> ## Lower CPU prio that other VMs...
> cpu_weight =3D 128
>
> on_poweroff =3D 'destroy'
> on_reboot =3D 'destroy'
> on_crash =3D 'destroy'
>
> Steven Haigh
>
> =F0=9F=93=A7 netwiz@crc.id.au     =F0=9F=92=BB https://www.crc.id.au
> =F0=9F=93=9E +613 9001 6090       =F0=9F=93=B1 +614 1293 5897
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000073fab00595a91530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e">Not much clue in the logs. The crash params are weird though... certainl=
y not matching the doc. (<a href=3D"https://docs.microsoft.com/en-us/window=
s-hardware/drivers/debugger/bug-check-0xac--hal-memory-allocation" style=3D=
"font-family:Arial,Helvetica,sans-serif">https://docs.microsoft.com/en-us/w=
indows-hardware/drivers/debugger/bug-check-0xac--hal-memory-allocation</a>)=
 but then again they are not always to be believed.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-family:monospace">There are some odd looki=
ng IOMMU faults in there too.</div><div class=3D"gmail_default" style=3D"fo=
nt-family:monospace"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace">=C2=A0Paul</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 24 Oct 2019 at 13:01, Steven Haigh=
 &lt;<a href=3D"mailto:netwiz@crc.id.au">netwiz@crc.id.au</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
I&#39;ve managed to get the git master version of Xen on this affected <br>
system and tries to boot a Windows Server 2016 system. It crashes as <br>
per normal.<br>
<br>
I managed to get these logs, but I&#39;m not quite sure what else to do to =
<br>
debug this issue further.<br>
<br>
Suggestions welcome.<br>
<br>
The boot log in /var/log/xen/ shows:<br>
Waiting for domain soti.vm (domid 4) to die [pid 9174]<br>
Domain 4 has shut down, reason code 3 0x3<br>
Action for shutdown reason code 3 is destroy<br>
Domain 4 needs to be cleaned up: destroying the domain<br>
Done. Exiting now<br>
<br>
For some reason I&#39;m not getting any serial output - so I&#39;ll have to=
 <br>
take a look at that tomorrow - but if you need anything further, please <br=
>
let me know and I&#39;ll see what I can turn up.<br>
<br>
Windows config file:<br>
<br>
type =3D &quot;hvm&quot;<br>
name =3D &quot;$vmname.vm&quot;<br>
viridian =3D 1<br>
#viridian =3D [&#39;base&#39;]<br>
memory =3D 8192<br>
vcpus =3D 4<br>
vif =3D [&#39;bridge=3Dbr51, mac=3D00:16:3E:64:CC:A0&#39;]<br>
#disk =3D [ &#39;/dev/vg_hosting/$vmname.vm,raw,xvda,rw&#39;, <br>
&#39;file:/root/SW_DVD9_NTRL_Windows_Svrs_2016_English_2_Std_DC_FPP_OEM_X21=
-22567.ISO,hdc:cdrom,r&#39; <br>
]<br>
disk =3D [ &#39;/dev/vg_hosting/$vmname.vm,raw,hda,rw&#39; ]<br>
boot =3D &#39;cd&#39;<br>
vnc =3D 2<br>
vnclisten =3D &quot;0.0.0.0&quot;<br>
#vncpasswd =3D &#39;&#39;<br>
<br>
## Set the clock to localtime - not UTC...<br>
localtime =3D 1<br>
<br>
## Fix the mouse cursor for VNC usage<br>
usbdevice =3D &#39;tablet&#39;<br>
<br>
## Lower CPU prio that other VMs...<br>
cpu_weight =3D 128<br>
<br>
on_poweroff =3D &#39;destroy&#39;<br>
on_reboot =3D &#39;destroy&#39;<br>
on_crash =3D &#39;destroy&#39;<br>
<br>
Steven Haigh<br>
<br>
=F0=9F=93=A7 <a href=3D"mailto:netwiz@crc.id.au" target=3D"_blank">netwiz@c=
rc.id.au</a>=C2=A0 =C2=A0 =C2=A0=F0=9F=92=BB <a href=3D"https://www.crc.id.=
au" rel=3D"noreferrer" target=3D"_blank">https://www.crc.id.au</a><br>
=F0=9F=93=9E +613 9001 6090=C2=A0 =C2=A0 =C2=A0 =C2=A0=F0=9F=93=B1 +614 129=
3 5897<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--00000000000073fab00595a91530--


--===============0439668467106106986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0439668467106106986==--

