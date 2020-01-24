Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB48148F75
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 21:42:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv5im-0007HX-2O; Fri, 24 Jan 2020 20:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4CoJ=3N=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iv5ik-0007HS-21
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 20:38:26 +0000
X-Inumbo-ID: 7301a3c4-3ee9-11ea-aecd-bc764e2007e4
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (unknown [66.163.184.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7301a3c4-3ee9-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579898296; bh=v2P5HDhhV/7nkTFrc8PD5l5WfVIJ7QUaKV/7u+bQagc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=MM8qVoFBXp/bB/1tbeqw4i1vd/geF7+AWLN3IiWuyITXb1NL0JfTGj4vY7UdFAjOOaZ2Q6J7VQsN69z2Xbml/IS3VACM4Z9ZXzIY7SvGVOpSF/1WU8ZsOZ+EwafE5EC8mNGiCpJreWszLLJlBWB9tr1rDGFnvRWU2QrPUUQP5ciibU6ZcwU0V/HjpDUdnGKjTGam07yQVl1WYSQXxn8HxtPMKO1KnceVuYe4vcXVBHe4qK7nZEt9zfhH9W1YhzIFwFuP8vJ3uqTuBmoikKX4vOVUrLbk60f15vrWZY8K6LoArOComya4AQnvaaMCvyqSf9zJGbRvxgKbPkCXWg8b2A==
X-YMail-OSG: f0Tfc7UVM1mrqfe_PQE5lxvsvwQoWPTzCbFW7c3edQcy26ngoZ32sWr.Wh8EH_T
 UlSXoBr6Lf_vo.X7tkKqDyTe0hw.kI5xR1Cr7yqGMT9QZD_Pa6jzCp6B1_DxkJT9lsgDhEzXNCIk
 9zk_ZEMBcL3COSLX8wz9EHS45gMntZMRvqsW99KMD_3v6s9lKif.Duwrr_4XF.BsyjFV6wu9wWsS
 35NIFo0qgYI81u7qzHF_W28HLKz7JOvfAJBveBLPTC7nAq0tVcGqqpw7bW2DCcSUHzW1diDEOi8t
 qG9vG1EirWIUrdRtlv3poVFGFiamRaqtu6uJYfMQDEnCgVGoB27Dxuh269qA7F_6TCs8w6hiNqoN
 njz82Kssyjb2KoxanZNquv3e9jp9RwhQJXhptJ_tZj6C7g_JZjmIOfyXh73cK48iHHj_TyEKgNa6
 jOIK6aT5n6Ext5LN38jaoKdeeahZfjRJcUX._YVeQc2Bqu4E7csMSSIlrxg_6.RF_xrt_6eX1ZmG
 M4zZ0Q3PWxDBcHrxIBu5NOyHPvzEK55nb9QGwjQurx8mDkBCwS5hPM5Y7zfV09Ye3GnDXpekyzTW
 wOqQSD.Dz9A69n97v7JoWXA.Pi3lY4AJmtlCfXTgCN.3_jrXc4C_QEffqHTZEjCrVxA9JX8aFo2Z
 6txeeA8j1U2VtLTGpDIZv3ouixxz3YDqkwfLEdFOhwqO54u.THR4CCUv5_ZUiczZOPPfYTbIPR.E
 LSgWAXuQfAudWsu2yvSJ9U.F_GA1Lx_I0pXviC5rTBpkxhS2OiTgP4ePNHjE8K7cEeNQPDvZFH2y
 HN3DS1MFi9c__4gwfcqlckp4TWbsLW64hChPR923bOrfz_2pEXpRWQzwHmhPQrkEBW0SLS7bGxt.
 idx4_w79L.MsiLLme_HIXUKuURZyiivS_rUagd3.Z9IU1O80SaWrdVZ9flikjAtMXBxb_V5gp5AS
 BHo7I1lnNyzGapIIiVdC.SYZt4OYZJch2nC20C7k82QCH3cNtLprGz0xeSymtC0CUPsF_9GP4NQ1
 V20LCyIkzg.xA_Us5CMN0dMU3KDUzcdaVKGX7wmfN3b4aHbPMrrRJT4yLAg1fp9wAwBx2PrW28de
 lh0qZCov7nLI6rA2dvUarArLWlFf30BfHmhkoeh.tf6JnUYq_wlo_L10u5XHIoWSluUHaSSVDUjV
 iR.Uj.WVAnCaz2_uqBUlsE456SDQajkE4OooeRe09KNOz83ZUfys7R39wIDpkgXyhDuDIFZvg7yP
 DZT0aabJd0NdwPGHUy8.fIE5QB4ox8eVSme7bUC5G6QC1k6efGnEQNQriR1kILWDg1BiHQG4pfaI
 YtDqFm5_GBwgIYgY6nlwBS_Zpoft7HE3ork8eZ_5IyLo9x2c-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Fri, 24 Jan 2020 20:38:16 +0000
Date: Fri, 24 Jan 2020 20:38:11 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <1300692217.17055.1579898291701@mail.yahoo.com>
In-Reply-To: <20200123231107.GI1314@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200123231107.GI1314@mail-itl>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15116 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0462605587954946532=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0462605587954946532==
Content-Type: multipart/alternative; 
	boundary="----=_Part_17054_462598706.1579898291699"
Content-Length: 5306

------=_Part_17054_462598706.1579898291699
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Marek,
Thanks for the config files.
Regards,Mehrab

    On Thursday, January 23, 2020, 6:11:12 PM EST, Marek Marczykowski-G=C3=
=B3recki <marmarek@invisiblethingslab.com> wrote: =20
=20
 On Thu, Jan 23, 2020 at 10:36:34PM +0000, tosher 1 wrote:
>=20
>=20
> I wasn't able to make the HVM driver domain work even with the latest Xen=
 version which is 4.14. I see the 'xendriverdomain' executable in the /etc/=
init.d/ directory, but it doesn't seem to be running in the background.=20
>=20
> On the other hand, I see the official "Qubes OS Architecture" document (h=
ttps://www.qubes-os.org/attachment/wiki/QubesArchitecture/arch-spec-0.3.pdf=
) defines the driver domain as the following.
>=20
> "A driver domain is an unprivileged PV-domain that has been securely gran=
ted access to certain PCI device (e.g. the network card or disk controller)=
 using Intel VT-d." - Page 12
>=20
> Moreover, section 6.1 reads "The network domain is granted direct access =
to the networking hardware, e.g. the WiFi or ethernet card. Besides, it is =
a regular unprivileged PV domain."
>=20
> Maybe you guys later moved to the HVM driver domain from PV. Would you pl=
ease share the Xen config you use for the network driver domain?

Yes, that PDF is quite outdated, we use HVM now.

As for the configs, as said before, we use libvirt, with some extra
patches, so the config won't be directly useful for you. I'm attaching
both libvirt XML for the driver domain, and also converted to XL (using
virsh domxml-to-native), may be inaccurate.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing? =20
------=_Part_17054_462598706.1579898291699
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpca2ac98byahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Marek,</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Tha=
nks for the config files.</div><div dir=3D"ltr" data-setdir=3D"false"><br><=
/div><div dir=3D"ltr" data-setdir=3D"false">Regards,</div><div dir=3D"ltr" =
data-setdir=3D"false">Mehrab<br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_0506991406" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Thursday, January 23, 2020, 6:11:12 PM EST, Marek Ma=
rczykowski-G=C3=B3recki &lt;marmarek@invisiblethingslab.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div>On Thu, Jan 23, 2020 at 10:36:34PM +0000, tosher 1 wro=
te:<div class=3D"yqt4849414112" id=3D"yqtfd08833"><br clear=3D"none">&gt; <=
br clear=3D"none">&gt; <br clear=3D"none">&gt; I wasn't able to make the HV=
M driver domain work even with the latest Xen version which is 4.14. I see =
the 'xendriverdomain' executable in the /etc/init.d/ directory, but it does=
n't seem to be running in the background. <br clear=3D"none">&gt; <br clear=
=3D"none">&gt; On the other hand, I see the official "Qubes OS Architecture=
" document (<a shape=3D"rect" href=3D"https://www.qubes-os.org/attachment/w=
iki/QubesArchitecture/arch-spec-0.3.pdf" target=3D"_blank">https://www.qube=
s-os.org/attachment/wiki/QubesArchitecture/arch-spec-0.3.pdf</a>) defines t=
he driver domain as the following.<br clear=3D"none">&gt; <br clear=3D"none=
">&gt; "A driver domain is an unprivileged PV-domain that has been securely=
 granted access to certain PCI device (e.g. the network card or disk contro=
ller) using Intel VT-d." - Page 12<br clear=3D"none">&gt; <br clear=3D"none=
">&gt; Moreover, section 6.1 reads "The network domain is granted direct ac=
cess to the networking hardware, e.g. the WiFi or ethernet card. Besides, i=
t is a regular unprivileged PV domain."<br clear=3D"none">&gt; <br clear=3D=
"none">&gt; Maybe you guys later moved to the HVM driver domain from PV. Wo=
uld you please share the Xen config you use for the network driver domain?<=
/div><br clear=3D"none"><br clear=3D"none">Yes, that PDF is quite outdated,=
 we use HVM now.<br clear=3D"none"><br clear=3D"none">As for the configs, a=
s said before, we use libvirt, with some extra<br clear=3D"none">patches, s=
o the config won't be directly useful for you. I'm attaching<br clear=3D"no=
ne">both libvirt XML for the driver domain, and also converted to XL (using=
<br clear=3D"none">virsh domxml-to-native), may be inaccurate.<br clear=3D"=
none"><br clear=3D"none">-- <br clear=3D"none">Best Regards,<br clear=3D"no=
ne">Marek Marczykowski-G=C3=B3recki<br clear=3D"none">Invisible Things Lab<=
br clear=3D"none">A: Because it messes up the order in which people normall=
y read text.<br clear=3D"none">Q: Why is top-posting such a bad thing?</div=
>
            </div>
        </div></body></html>
------=_Part_17054_462598706.1579898291699--


--===============0462605587954946532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0462605587954946532==--

