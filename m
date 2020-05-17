Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC91D68DD
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 18:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaMGw-0006KW-Nn; Sun, 17 May 2020 16:36:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VT2+=67=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1jaMGv-0006KR-7X
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 16:36:17 +0000
X-Inumbo-ID: 86df0108-985c-11ea-a7cc-12813bfff9fa
Received: from sonic308-2.consmr.mail.bf2.yahoo.com (unknown [74.6.130.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86df0108-985c-11ea-a7cc-12813bfff9fa;
 Sun, 17 May 2020 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1589733375; bh=hZXtgOGZQSNtu+kLdJO7ROCPHeDnussSdNhlaJdx97E=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
 b=nkKl+w+XOZmC9ZcA6RvykvEgPrpI2janMuQr8XNHvQimaZ7X0YqELK7Nl5DCxSiXc63QjsjnVWvB05w/om/Onn1V71mebUPoqVV9l5mDau40JokH5HqBXnTlJbCI9yHDGScq0dYcKrr2DoMVyxKfBA5+6Qv5czdI/TY//4ylOEfqLlG12Z/OsOah2NcEG9PUmSPqgPMp4InVAUrRF/UO7KuAByGXfpPVb/XQ6uDdKfINAAQAtshcAQ3HB4dbU028IHf+MWFzp/pvv8tQCIN6FffTPCfQqJwREeTK7BdF7/9PUzHP9j5LQMwP0tAnmkIW5p0x81+vuAi2VK936R9ISA==
X-YMail-OSG: OkvITWgVM1n_nmREuisrM4I9Z2M7_aOJPYKws8A38nD64ZjuWi_5QMpXflBrsLO
 Fc.GJ2LQPEbDysw0DibWYN1jS84aRX31YR8MY71SCaIKNpBDfX0vvNh1rxGF6CZF_UZvqj8Yhxv0
 kAcYjibTDzn9o7uQYuE8MhqUFOEx97v0xCoPteWf3JC6mnrnYNTuycpVSCSzZ7_9L5fUnmaFcWel
 aQmtB_WHLk7cV9NVEv7dOGxoQ8l1yrqUSk.HOT5fpEikZusTzNzxWbMzQe2gTiAeojKEOSgIkdKZ
 PpkjJTfCE2tkTzTTl1eJ3SzAqwe65pf93DQOjGuyTEPgn2r7h08yNTc9PJLDKFV1fxulrkywRZRk
 9sqA1LxDeyJthtqgDIQ3NK5mZewZa_1TPoQtCMq1OrkytvCppKXisL4YdTvn7koD6iMkJkMpOjE8
 geokFFANh.y6MAQaIYM4d5hSdPO9hNbmVXJ7YwZSyA4XNH4URTSHr8Vq3KkdlxPJ4u.zaEURj1oR
 25Z7TWwLwhvIduaVpFfxg3Z5zDwpPYhV__w4mntpfGMXITFnsFP2waZhLKkHq7.YZopOIINSSF8K
 An407TemObRsYdHuRMexewHO.PAQItL0ka9HuTjzHed7JxDoLb0L_o_A0w4SfE5WAH_TArSsdZYq
 aZQlVghf83kA2gN7IZ8AVMHRrXw4mQRJlNYu.x1sUjVpmRwAOC_oY6JwrL6pC2xixPWPd.gyq6QM
 UnfccK4jtwglZCV9Pyj.NVLe8p7xL6bIScEc0y75m7oN3mocnLDKoN2ItU5zm9ktW05zH0Gs8BBy
 E.jG6ruGu_dAMsaXCCNkI2OubhnMd3bQu0voEkzppEWq3EHI.O361ke7alWWvEYKBLxb8VT0bueX
 ZfEORy43gUTQspfA5s07oLc7BSghWpg0vQCxESjGXg3gKYred7qk9Q2lyb.foJmS1IBcMFxrrlt0
 a.2F_kyq23UlnU9IxZqwE.XNM_EqqPsdljoKzH_toAqycbdMKJEZmNzJk.rmUucOrKB6buUvFk6o
 ec1HHAh.Dbr2XQpUc9U5uQPM8WDtYzO1SLMe_pM49JVS7Y22PVAXwqIXM2aVNoeKAZXVXciL56gC
 9MYG2z7rUSkai.J74NQy__ymRtW5R9EEbBFJYNZIy9Ylkfq38ahvwgzqrP_RS4mdiSwbCSq.ZpO3
 .t.BdM.AH3jHMHSCKQ6E4x53jMrcHOiE9aAqLIAIKrOSCMrNPWP7xbQU4RyOtZefwGEaPGS.M5Pl
 XuuG2gTh47IuB1Z4GrsX56ziX_54J1phlgYkPd.ciN_lQbuiH8wlDDcIRWm8h.Kdiq_dHkbKavmo
 erxnH0vpjkfy0c7ajz3LMEQX.4qi9hix2bcA8POK2Ho0xv02IugleDVL18jIYUYabSg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.bf2.yahoo.com with HTTP; Sun, 17 May 2020 16:36:15 +0000
Date: Sun, 17 May 2020 16:36:10 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: "hx242@xen.org" <hx242@xen.org>, 
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <205965483.308970.1589733370664@mail.yahoo.com>
In-Reply-To: <b73dbed41e83ee08b9ac6694a8fba76c512d2c93.camel@xen.org>
References: <1478987168.271548.1589721329818.ref@mail.yahoo.com>
 <1478987168.271548.1589721329818@mail.yahoo.com>
 <b73dbed41e83ee08b9ac6694a8fba76c512d2c93.camel@xen.org>
Subject: Re: RoCE adapters and Xen.
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_308969_429439335.1589733370662"
X-Mailer: WebService/1.1.15960 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.7.1; Android/7.1.1; NMF26F; bbc100;
 BlackBerry; BBC100-1; 5.16; 1184x720; )
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
Reply-To: "hack3rcon@yahoo.com" <hack3rcon@yahoo.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_Part_308969_429439335.1589733370662
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please see https://community.oracle.com/thread/4326908=C2=A0Migration to a =
new hypervisor is more easy than adding hardware support !!!!!!!

Sent from Yahoo Mail on Android=20
=20
  On Sun, May 17, 2020 at 8:35 PM, Hongyan Xia<hx242@xen.org> wrote:   On S=
un, 2020-05-17 at 13:15 +0000, Jason Long wrote:
> Hello,
> The Xen hypervisor doesn't support the RoCE adapters? The Oracle
> migrates to the KVM because of it.
> Why not add this feature?

I am curious. Aren't RoCE adapters just PCIe devices? If things are set
up correctly and drivers are present, I don't think Xen has any problem
supporting them.

Do you have any reference that Oracle migrates to KVM *because* Xen
cannot support RoCE? Or is it simply that Oracle is migrating to KVM in
general?

I haven't worked on RoCE before so I could be wrong.

Hongyan

 =20

------=_Part_308969_429439335.1589733370662
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please see https://community.oracle.com/thread/4326908&nbsp;<div id=3D"yMai=
l_cursorElementTracker_1589733296857">Migration to a new hypervisor is more=
 easy than adding hardware support !!!!!!!<br id=3D"yMail_cursorElementTrac=
ker_1589733077751"><br><div id=3D"ymail_android_signature"><a id=3D"ymail_a=
ndroid_signature_link" href=3D"https://go.onelink.me/107872968?pid=3DInProd=
uct&amp;c=3DGlobal_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=
=3Dym&amp;af_sub1=3DInternal&amp;af_sub2=3DGlobal_YGrowth&amp;af_sub3=3DEma=
ilSignature">Sent from Yahoo Mail on Android</a></div> <br> <blockquote sty=
le=3D"margin: 0 0 20px 0;"> <div style=3D"font-family:Roboto, sans-serif; c=
olor:#6D00F6;"> <div>On Sun, May 17, 2020 at 8:35 PM, Hongyan Xia</div><div=
>&lt;hx242@xen.org&gt; wrote:</div> </div> <div style=3D"padding: 10px 0 0 =
20px; margin: 10px 0 0 0; border-left: 1px solid #6D00F6;"> On Sun, 2020-05=
-17 at 13:15 +0000, Jason Long wrote:<div class=3D"yqt6114786521 yQTDBase" =
id=3D"yqtfd98920"><br clear=3D"none">&gt; Hello,<br clear=3D"none">&gt; The=
 Xen hypervisor doesn't support the RoCE adapters? The Oracle<br clear=3D"n=
one">&gt; migrates to the KVM because of it.<br clear=3D"none">&gt; Why not=
 add this feature?</div><br clear=3D"none"><br clear=3D"none">I am curious.=
 Aren't RoCE adapters just PCIe devices? If things are set<br clear=3D"none=
">up correctly and drivers are present, I don't think Xen has any problem<b=
r clear=3D"none">supporting them.<br clear=3D"none"><br clear=3D"none">Do y=
ou have any reference that Oracle migrates to KVM *because* Xen<br clear=3D=
"none">cannot support RoCE? Or is it simply that Oracle is migrating to KVM=
 in<br clear=3D"none">general?<br clear=3D"none"><br clear=3D"none">I haven=
't worked on RoCE before so I could be wrong.<br clear=3D"none"><br clear=
=3D"none">Hongyan<div class=3D"yqt6114786521 yQTDBase" id=3D"yqtfd05174"><b=
r clear=3D"none"><br clear=3D"none"></div> </div> </blockquote></div>
------=_Part_308969_429439335.1589733370662--

