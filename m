Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC70105EBC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 03:53:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXz0d-0002wN-5Y; Fri, 22 Nov 2019 02:49:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Etr4=ZO=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iXz0b-0002wI-Ty
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 02:49:22 +0000
X-Inumbo-ID: aedbf622-0cd2-11ea-9631-bc764e2007e4
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aedbf622-0cd2-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 02:49:20 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id x21so6243903ior.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 18:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=86CKn7obrA3mNzJL/xwZsizGIF0g9KztPRAGOqVxzt4=;
 b=lZz6UBTm1RWHbSdgIw0gkR/JiRjbwzkZq4D8jF8qdaqcbgnlsn+QRFSn23DVdGDfbk
 dqExMAwlS4JkiLCuiaN4/OdsUOxPAfK1IQQ50iK8sHFR0CFxqhvhE3CpiRxTbu3nBACT
 BkSVPfvB+po5FwbTd9qJhLqVLw45LY1qnL6PtPa0+4dAngOkEEwzEsDlL728CPmTjJB/
 EJ/9t9r4LdiVxlurrIB5A1upQjImqCkYi+Tn6+KeFRrNOnT/3o49jmuYN+AahJPsVOzu
 AOkGeAfT6VfjdlAhYcF9uMn4Rb0kcKxQr2ivuFp4Z8lWqEqavzivGJwD0FHptfvc4Oqt
 NDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=86CKn7obrA3mNzJL/xwZsizGIF0g9KztPRAGOqVxzt4=;
 b=KeYD9QP9V2IqKZlJNzl+hAuAP8Fm2pAuCwQrRsi63vV9cq4hs02xJmBUnOKb/dhFWD
 hL/ey1roE/Qykxe9rOrUs3ZTsuj7O3kQSzLEB21cmMBYHYCTvdZHuudHvRX6XKvagluS
 gz+v7t+YbArZehf6CrRt9r2Z8qiKep3VquNBxbbd24bpHhX5934tAFU7KL1wFQD/VktR
 fzldajCvgzZOoby3IreeHvBihEnuWSV9+S6M7noqhOjupTlPNpNNPM+Lf/AmeXLbmxSU
 ni0gMw6CAo1FCy5+b6NHOStU7ba6GkB8vxqdQWKSCOpGI+d+GyxVdv2DaT/zpiDYa5Lu
 PjAg==
X-Gm-Message-State: APjAAAX5+O4NAgUPBHAHexB60j5r9gF0q075jqO/cHGckiyzuoqBNg3I
 gFRlBHdF6zTZr6/OdbKm3Lw=
X-Google-Smtp-Source: APXvYqznTsbdZstr6czG0GADUvSUg1fQf1ohzNbnEN0Tn6xeCKTa7Wwwa/tILxDQcgeH2+28WNyygg==
X-Received: by 2002:a6b:bbc5:: with SMTP id
 l188mr11174263iof.259.1574390960082; 
 Thu, 21 Nov 2019 18:49:20 -0800 (PST)
Received: from [100.64.72.189] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id h23sm1713049iof.11.2019.11.21.18.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 18:49:19 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <A62BCCD8-7624-4A09-AE74-86CB79F4B8BD@gmail.com>
Date: Thu, 21 Nov 2019 21:49:18 -0500
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Roman Shaposhnik <roman@zededa.com>
X-Mailer: iPad Mail (17B111)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3346701306409204979=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3346701306409204979==
Content-Type: multipart/alternative; boundary=Apple-Mail-775DED21-FC06-4491-9BE8-09FF24D5A9AA
Content-Transfer-Encoding: 7bit


--Apple-Mail-775DED21-FC06-4491-9BE8-09FF24D5A9AA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn Nov 21, 2019, at 17:11, Marek Marczykowski-G=C3=B3recki <marmare=
k@invisiblethingslab.com> wrote:
>=20
> =EF=BB=BFOn Thu, Nov 21, 2019 at 11:39:14AM -0800, Roman Shaposhnik wrote:=

>>> On Thu, Nov 21, 2019 at 9:38 AM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
>>> On 21/11/2019 17:31, Roman Shaposhnik wrote:
>>>>>> On Wed, Nov 20, 2019 at 10:06 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>>>>>>> Where do we stand with Xen 4.13 regarding blockers and related patch=
es?
>>>>>>> 1. OSStest failure regarding nested test:
>>>>>>> I'm not quite sure whether the currently debated patch of Andrew is
>>>>>>> fixing the problem. If not, do we know what is missing or how to
>>>>>>> address the issue? If yes, could we please come to an agreement?
>>>>>>> As an alternative: any thoughts about ignoring this test failure for=

>>>>>>> 4.13-RC3 (IOW: doing a force push)?
>>>>>>> 2. Ryzen/Rome failures with Windows guests:
>>>>>>> What is the currently planned way to address the problem? Who is
>>>>>>> working on that?
>>>>>>> 3. Pending patches for 4.13:
>>>>>>> Could I please have feedback which patches tagged as "for-4.13" are
>>>>>>> fixing real regressions or issues? I don't want to take any patches
>>>>>>> not fixing real problems after RC3, and I hope to be able to get a
>>>>>>> push rather sooner than later to be able to let Ian cut RC3.
>>>>>>> 4. Are there any blockers for 4.13 other than 1. and 2. (apart of an=
y
>>>>>>> pending XSAs)?
>>>>>> Any chance the efi=3Dno-rs regression can be added to the list? I und=
erstand
>>>>>> that I'm still on the hook to provide more details (I promise to do i=
t on Fri
>>>>>> when I get to my lab to actually have a serial console on all these b=
oxes).
>>>>>> At the same time this is a pretty serious regression for an entire cl=
ass of
>>>>>> devices where Xen was perfectly happy even during RC1.
>>>>> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D534f9e2=
9ce28580892b3856036b5e5cd805667cc
>>>>> has been committed.  It is in staging, but not in master yet (because
>>>>> master is blocked by my regression in 1).
>> I'll make sure to test it on Fri, but here's where I'm lost -- my
>> understanding that
>> activation of this patch requires a special build flag to be passed.

Draft doc for the Xen 4.13 improvement:
https://wiki.xen.org/wiki/Xen_EFI#Compatibility_of_UEFI_Host_Firmware.2C_Xen=
_and_UEFI_Runtime_Services

Corrections and compatibility test reports would be welcome.

Rich

>> Which means,
>> we're still very much in a regresses state when it comes to building
>> out-of-the-box,
>> no?
>=20
> No, there are two thing:
> 1. A bug triggered by efi=3Dno-rs flag - fixed in the above commit
> 2. A second commit making efi=3Dno-rs unnecessary on some machines - this
> is what require build flag (CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy).

--Apple-Mail-775DED21-FC06-4491-9BE8-09FF24D5A9AA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BFOn Nov 21, 2019, a=
t 17:11, Marek Marczykowski-G=C3=B3recki &lt;marmarek@invisiblethingslab.com=
&gt; wrote:<div dir=3D"ltr"><div dir=3D"ltr"><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>=EF=BB=BFOn Thu, No=
v 21, 2019 at 11:39:14AM -0800, Roman Shaposhnik wrote:</span><br></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>On Thu, Nov 21, 2019 at 9:38 AM Andrew Cooper &lt;andrew.cooper3@=
citrix.com&gt; wrote:</span><br></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>On 21/11/2019 17:31, Roman Shaposhnik wrote:</span><br></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>On Wed, Nov 20, 2019 at 10:06 PM J=C3=BCrgen G=
ro=C3=9F &lt;jgross@suse.com&gt; wrote:</span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>Where do we stand with Xen 4.13 regarding blockers and related p=
atches?</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>1. OSStest f=
ailure regarding nested test:</span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> I'm not quite sure whether the currently debated patch of Andr=
ew is</span><br></blockquote></blockquote></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> fixing the=
 problem. If not, do we know what is missing or how to</span><br></blockquot=
e></blockquote></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> address the issue? If yes, could we p=
lease come to an agreement?</span><br></blockquote></blockquote></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> As an alternative: any thoughts about ignoring this test failu=
re for</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> 4.13-RC3 (=
IOW: doing a force push)?</span><br></blockquote></blockquote></blockquote><=
/blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>2. Ryzen/Rome failures with Windows guests:</span><br></blockquot=
e></blockquote></blockquote></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> What is the currently planned way to=
 address the problem? Who is</span><br></blockquote></blockquote></blockquot=
e></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> working on that?</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>3. Pending patches for 4.13:</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span> Could I please have feedback which patches tagge=
d as "for-4.13" are</span><br></blockquote></blockquote></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span> fixing real regressions or issues? I don't want to take any patches</s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span> not fixing real p=
roblems after RC3, and I hope to be able to get a</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span> push rather sooner than later to be able=
 to let Ian cut RC3.</span><br></blockquote></blockquote></blockquote></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>4. Are there any blockers for 4.13 other than 1. and 2. (apart of any<=
/span><br></blockquote></blockquote></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> pending XSAs)?=
</span><br></blockquote></blockquote></blockquote></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>Any chance the efi=3Dno-rs regression ca=
n be added to the list? I understand</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>that I'm still on=
 the hook to provide more details (I promise to do it on Fri</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>when I get to my lab to actually have a serial console on all these b=
oxes).</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>At the same time this is a pretty serious regre=
ssion for an entire class of</span><br></blockquote></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>devices where Xen was per=
fectly happy even during RC1.</span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dco=
mmitdiff;h=3D534f9e29ce28580892b3856036b5e5cd805667cc</span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>has been committed. &nbsp;It is in stag=
ing, but not in master yet (because</span><br></blockquote></blockquote></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>master is blocked by my regression in 1).</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>I'll make sure to test it on Fri, b=
ut here's where I'm lost -- my</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>understanding that</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>activation of this patch requires a special build flag to be passe=
d.</span><br></blockquote></blockquote><span></span><br><span>Draft doc for t=
he Xen 4.13 improvement:</span></div><div dir=3D"ltr"><a href=3D"https://wik=
i.xen.org/wiki/Xen_EFI#Compatibility_of_UEFI_Host_Firmware.2C_Xen_and_UEFI_R=
untime_Services">https://wiki.xen.org/wiki/Xen_EFI#Compatibility_of_UEFI_Hos=
t_Firmware.2C_Xen_and_UEFI_Runtime_Services</a></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">Corrections and compatibility test reports would be wel=
come.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Rich</div><div dir=3D=
"ltr"><span></span><br><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>Which means,</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>we're still very much in a regresses sta=
te when it comes to building</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>out-of-the-box,</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>no?</span><br></blockquote></blockquote><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>No, there are two t=
hing:</span><br></blockquote><blockquote type=3D"cite"><span>1. A bug trigge=
red by efi=3Dno-rs flag - fixed in the above commit</span><br></blockquote><=
blockquote type=3D"cite"><span>2. A second commit making efi=3Dno-rs unneces=
sary on some machines - this</span><br></blockquote><blockquote type=3D"cite=
"><span>is what require build flag (CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy).=
</span></blockquote></div></div></div></body></html>=

--Apple-Mail-775DED21-FC06-4491-9BE8-09FF24D5A9AA--


--===============3346701306409204979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3346701306409204979==--

