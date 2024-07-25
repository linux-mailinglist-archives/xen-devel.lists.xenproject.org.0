Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52893C885
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 20:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765095.1175676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3eG-0004J2-5M; Thu, 25 Jul 2024 18:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765095.1175676; Thu, 25 Jul 2024 18:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3eG-0004Ge-24; Thu, 25 Jul 2024 18:57:08 +0000
Received: by outflank-mailman (input) for mailman id 765095;
 Thu, 25 Jul 2024 18:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDAE=OZ=byiq.org=techguru@srs-se1.protection.inumbo.net>)
 id 1sX3eA-0004GW-Ob
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 18:57:07 +0000
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch
 [83.166.143.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac697eaf-4ab7-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 20:57:00 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WVKqv5ZBkzqNk;
 Thu, 25 Jul 2024 20:56:59 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WVKqt6zSLzW6L; Thu, 25 Jul 2024 20:56:58 +0200 (CEST)
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
X-Inumbo-ID: ac697eaf-4ab7-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=byiq.org;
	s=20191114; t=1721933819;
	bh=BRruTllybKIIf3F/b0lHofkv4WQ2TL5jHRPMDfFiy5M=;
	h=Date:Subject:From:Reply-To:To:Cc:References:In-Reply-To:From;
	b=KjwEwEtawkqBhufkLOwXenWwrhJcdeR6FtSVoJeJWGsQrxbW09GIPutAWPUcodPrN
	 1Y4xePjiuogn5XYMSNrjdCDNK8hXSD9W5oKeDbHrJz068oHRxnRErrBpR7utITG3Ko
	 SWkt2ptciYxNOswqYmmNWoRFIvbj0qSvKSaotonI=
Message-ID: <99c8f34c61b59a16edb0fd11d214267e@mail.infomaniak.com>
Date: Thu, 25 Jul 2024 20:56:58 +0200
Subject: Re: Xen for Apple Silicon (M1 and beyond)
From: Techguru <techguru@byiq.org>
Reply-To: Techguru <techguru@byiq.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="_=_swift_1721933818_e06b5c8fb8646690b380d5680f631849_=_"
X-WS-User-Origin: eyJpdiI6ImlHSkt6eHlPMDBPeVJKSFN0WHZNQ1E9PSIsInZhbHVlIjoicG9wbWR2Z0N2UGxkM2RRUzhWRlIzZz09IiwibWFjIjoiMjdmMjIwMWNkZjQxNjY3MjM1ODYxOWVmMDE2MjllZGJhNDIwY2Q3OTViYTcwOTllOGUzZjgxOGRjOTI3NjExZiIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6ImZlc3lnOStTaXNpZWV6N0ZLdDBuVUE9PSIsInZhbHVlIjoiVTBtM1JweVdqNWdVZHYvNUFYS1lxdz09IiwibWFjIjoiNDAyODk4OGYyZTA2NjA0NzQyOTgyYzk1NTNlYjMzYjAwYWY0NmVkMmYxZTk4Y2E0NDIwNmY3NWQzYzE2Y2YwZCIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.725)
References: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
 <alpine.DEB.2.22.394.2407241309170.4857@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2407241309170.4857@ubuntu-linux-20-04-desktop>
X-Infomaniak-Routing: alpha


--_=_swift_1721933818_e06b5c8fb8646690b380d5680f631849_=_
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A bit about Apple Silicon M1(2,3,4) architecture, SoC and motherboard.
(A=
FAIK)

There are no EFI assumptions nor contracts, and no EFI firmware.=


Between those 4 generations of silicon, there are about 80 different=

roles "SoC cores/components" can play, each with its own signed Apple
=
Firmware.

Most of those SoC cores/functions have nothing to do with th=
e
traditional ARM compute cores.

At least one of those SoC cores is =
actually an x86 processor core (on
models which support HDMI), running x8=
6 firmware.

Many of the other non-compute cores (Networking, USC (A-C)=
,
Thunderbolt ... yada yada) are various size Arm cores running an Apple=

RTOS Variant of L4 microkernel.

Each of those, again, has its own A=
pple Signed firmware which is
paired with a particular Darwin kernel rele=
ase.

One point of friction is that there is no stable ABI spec for eac=
h of
the firmware modules. =C2=A0 Apple reserves the right to completely =
change
the firmware's

interface with the paired Darwin kernel.

=
It is perhaps best to think of the SoC and related motherboard
hardware a=
s a "compute cluster" rather than a single von-neuman
machine.

I cou=
ld be wrong about a lot of the above, and invite corrections with
citatio=
ns.

>=C2=A0For=C2=A0this,=C2=A0do=C2=A0you=C2=A0know=C2=A0if=C2=A04K=
=C2=A0pages=C2=A0are=C2=A0supported=C2=A0(in=C2=A0addition=C2=A0to=C2=A016K=
)?=C2=A0It
>=C2=A0
>=C2=A0would=C2=A0be=C2=A0a=C2=A0lot=C2=A0easier=
=C2=A0to=C2=A0keep=C2=A0running=C2=A0Xen=C2=A0using=C2=A04K=C2=A0pages=
=C2=A0and=C2=A0run=C2=A0guests
>=C2=A0
>=C2=A0on=C2=A0top=C2=A0of=C2=
=A0Xen=C2=A0which=C2=A0use=C2=A016K=C2=A0pages.=C2=A0In=C2=A0the=C2=A0past,=
=C2=A0we=C2=A0had=C2=A0Linux=C2=A0using=C2=A064K
>=C2=A0
>=C2=A0pages=
=C2=A0running=C2=A0on=C2=A0top=C2=A0of=C2=A0Xen=C2=A0using=C2=A04K=C2=A0pag=
es=C2=A0for=C2=A0example.

Given the state of all of the _other_ SoC co=
res running L4 RTOS, I
have reservations about running with anything othe=
r than 16k native
pages. =C2=A0Will have to

investigate what options=
, if any, are available for keeping 16k pages
for existing firmware, whil=
e presenting 4k pages to guest OS.

However, both Rosetta and Docker ap=
pear to run 4k guests just fine, so
not sure how many pushups they are do=
ing in the process.

TBD

>>=C2=A0=C2=A0device=C2=A0trees;
>=
=C2=A0
>=C2=A0You=C2=A0might=C2=A0be=C2=A0able=C2=A0to=C2=A0use=C2=A0the=
=C2=A0device=C2=A0tree=C2=A0which=C2=A0is=C2=A0used=C2=A0to=C2=A0boot=C2=
=A0Linux
>=C2=A0on
>=C2=A0
>=C2=A0Apple=C2=A0silicon

Yes, the As=
ahi team has done some wizard level heavy lifting in that
area. =C2=A0If =
I recall correctly, their model is let apple boot loader
load the apple s=
igned firmware, pass off to the Asahi boot kernel,
=C2=A0then present an =
EFI compatible DT and driver surface on top of that
for boot-essential dr=
ivers. =C2=A0They also have a fairly nifty
lightweight hypervisor that as=
sists with debug and ultimately does
boot via u-boot -> grub -> linux in =
the current incarnation

>=C2=A0



--_=_swift_1721933818_e06b5c8fb8646690b380d5680f631849_=_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, =
sans-serif; font-size: 14px">A bit about Apple Silicon M1(2,3,4) architectu=
re, SoC and motherboard. (AFAIK)<br></div><div style=3D"font-family: 'Helve=
tica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><br></div><div s=
tyle=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-s=
ize: 14px">There are no EFI assumptions nor contracts, and no EFI firmware.=
<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sa=
ns-serif; font-size: 14px">Between those 4 generations of silicon, there ar=
e about 80 different roles "SoC cores/components" can play, each with its o=
wn signed Apple Firmware.<br></div><div style=3D"font-family: 'Helvetica Ne=
ue', Helvetica, Arial, sans-serif; font-size: 14px">Most of those SoC cores=
/functions have nothing to do with the traditional ARM compute cores.<br></=
div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-ser=
if; font-size: 14px">At least one of those SoC cores is actually an x86 pro=
cessor core (on models which support HDMI), running x86 firmware.<br></div>=
<div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; =
font-size: 14px">Many of the other non-compute cores (Networking, USC (A-C)=
, Thunderbolt ... yada yada) are various size Arm cores running an Apple RT=
OS Variant of L4 microkernel.<br></div><div style=3D"font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif; font-size: 14px">Each of those, agai=
n, has its own Apple Signed firmware which is paired with a particular Darw=
in kernel release.<br></div><div style=3D"font-family: 'Helvetica Neue', He=
lvetica, Arial, sans-serif; font-size: 14px">One point of friction is that =
there is no stable ABI spec for each of the firmware modules. &nbsp; Apple =
reserves the right to completely change the firmware's<br></div><div style=
=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:=
 14px">interface with the paired Darwin kernel.<br></div><div style=3D"font=
-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><=
br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, san=
s-serif; font-size: 14px">It is perhaps best to think of the SoC and relate=
d motherboard hardware as a "compute cluster" rather than a single von-neum=
an machine.<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">I could be=
 wrong about a lot of the above, and invite corrections with citations.<br>=
</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-s=
erif; font-size: 14px"><br></div><div class=3D"ik_mail_quote answerContentM=
essage"><blockquote class=3D"ws-ng-quote"><pre style=3D"white-space: normal=
;"><div>For this, do you know if 4K pages are supported (in addition to 16K=
)? It<br></div><div>would be a lot easier to keep running Xen using 4K page=
s and run guests<br></div><div>on top of Xen which use 16K pages. In the pa=
st, we had Linux using 64K<br></div><div>pages running on top of Xen using =
4K pages for example.<br></div></pre></blockquote></div><div style=3D"font-=
family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">Gi=
ven the state of all of the _other_ SoC cores running L4 RTOS, I have reser=
vations about running with anything other than 16k native pages. &nbsp;Will=
 have to<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, A=
rial, sans-serif; font-size: 14px">investigate what options, if any, are av=
ailable for keeping 16k pages for existing firmware, while presenting 4k pa=
ges to guest OS.<br></div><div style=3D"font-family: 'Helvetica Neue', Helv=
etica, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">Howev=
er, both Rosetta and Docker appear to run 4k  guests just fine, so not sure=
 how many pushups they are doing in the process.<br></div><div style=3D"fon=
t-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">=
<br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sa=
ns-serif; font-size: 14px">TBD</div><div class=3D"ik_mail_quote answerConte=
ntMessage"><blockquote class=3D"ws-ng-quote"><pre style=3D"white-space: nor=
mal;"><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-s=
erif; font-size: 14px"><br></div><blockquote class=3D"ws-ng-quote">  device=
 trees;<br></blockquote><div> <br></div><div>You might be able to use the d=
evice tree which is used to boot Linux on<br></div><div>Apple silicon<br></=
div></pre></blockquote></div><div style=3D"font-family: 'Helvetica Neue', H=
elvetica, Arial, sans-serif; font-size: 14px">Yes, the Asahi team has done =
some wizard level heavy lifting in that area. &nbsp;If I recall correctly, =
their model is let apple boot loader load the apple signed firmware, pass o=
ff to the Asahi boot kernel, &nbsp;then present an EFI compatible DT and dr=
iver surface on top of that for boot-essential drivers. &nbsp;They also hav=
e a fairly nifty lightweight hypervisor that assists with debug and ultimat=
ely does boot via u-boot -&gt; grub -&gt; linux in the current incarnation<=
br></div><div class=3D"ik_mail_quote answerContentMessage"><blockquote clas=
s=3D"ws-ng-quote"><pre style=3D"white-space: normal;"><div><br></div></pre>=
</blockquote></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, =
Arial, sans-serif; font-size: 14px"><br></div></body></html>


--_=_swift_1721933818_e06b5c8fb8646690b380d5680f631849_=_--


