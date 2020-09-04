Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334D25E392
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 00:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEJmN-0000QO-Fb; Fri, 04 Sep 2020 22:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLG5=CN=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kEJmK-0000QH-MN
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 22:01:53 +0000
X-Inumbo-ID: a5de7737-a9e0-46b7-bbe4-5ea563acbce5
Received: from sonic313-14.consmr.mail.bf2.yahoo.com (unknown [74.6.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5de7737-a9e0-46b7-bbe4-5ea563acbce5;
 Fri, 04 Sep 2020 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1599256911; bh=hALqEim00LiT2vVl9in+LnwxON6vnGk6XQPj278hvI4=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=VFul/iFVhY9X0yfu356BGswW/ARBZAsX8M/oNFRn1+uyEWsvl8bkVKX04o1shj6RuzDkArl9TSoJYfBAEpMw3JKvYQoUZMtrdaaWvGcz2o+ih9RwXgcgML9Em4gyxBMNaRCKYCCsakd/4Q43KtxrpBqTbFAbmKfCcRSN9IeTL2JWZGYNOCqTNvDLDe5USF6p/xM0txnbaVbxlTaBC5WqftbsM7kdL1jR9gch2yvhNN4zVWVUEfWlaSvg4hPCNA2G7cM1Ef0u809IxQACeCwWaC5XWce/eK1lUXjtJcvBjC9VJymqqW6GKRqDa9i67cUGt0xR1+F90HnW/1EIzLM8VA==
X-YMail-OSG: 8smDe4IVM1m0PrF5232eEBxMtGTLs_XdFCONHPkkJUBx6AnWlmmB2D2SP7Ht_bI
 hzJBgHQ5QkkAjdPhwnqARr6evWxOOV14jy8bNNGI1grjo0lcab9JS.wCAPZ.9puxdD5T1Tolu4At
 _NLhsPYtBigp7F7WEVFP9Z9oeYdGuPonjYy7HaUC6A0.M._KY1_RgSGG7Eaa5YHi6_2GqLvMD_E2
 _z4eNXFaO2g3lh5bvAnNtxZYmdhGzbdCgVfyoEYkW7BGkYpcIPaohZb8nld0Gs7TnzHfsDAExiS9
 _ZdnuO5U2rUGY78v5BiT6AZQeVMrp_CXBSFni4.vlufBPPDAWJ8p7xoKVtn1JTExA6ir7V.AK0Yk
 GIRnQDBBaYK9besIFIzOm8v.5iBV6vSkDCgDzTTMpN4d3vCfZp.DlQbK97EqP_rf34nBKZSx4N6A
 R833BvpJzspMNO0mp9tPU2T1X3P.lOHJrFxHFNH3dnqnsaaRHk91Pdkkbq4BAOxGgdfQjRzZxjXu
 pBaCVw4yZrxnTcgGCHJfel8rhdtbzQn2UiTBGJj7k5qNTLkWE1GZna3Uq1Bn6qJA2WxSl3JZjunh
 lk6H_0oaqrUbX44dHf9b1OMjcC_X6fSMBWhh.XpUAHZCOlMgWTn4CuuM5Q.yiiFsKM5lEL8Zagb3
 _DTjo7SHBNMgNdJ8Q5l7uGNzqbYXp1bDhJI1BjN3vT2wGDscDQIbZoqpDqBsxVaxp25phQ64YEYh
 DyBdwXv3PWc8UoGIt9hji6CKyhJOroNG4Xv7LC4cRmVoa2BBcpFcHLn__koWwCOp2xQsn2G6witF
 HXs9NZWB1rxtn9XVvO0rYWsWv7pGXdzmQs1Utpb4GW.xjHVM1tdm3P.c3Vqh3adHyuje.x.Jy2oJ
 sTF_Vdyl6SUUxNOuQXZnD19K3Wm27SC3clzeUv.gQKXvOA6YJo5LA.jZBoS80TKJcOjYdoIlNPwo
 7cwkHu5z4bItjGqbO.6YO_5uDmP2QOVpYC9XJdE6KwBMBmmjBPlEM2_m0GfHye9sniV_GfGGn5E_
 f4dox9kgbbLfc2QZVc8UtFEQ3RJVr4tCofw1tQWIyCvVDibgQFbYzS59XzpAr60UiHejSkBwtN8n
 vsCuSb8HCcI5J9.JsJLbyrgQxyOuC.C2tbO7i1M.pbGeAOO37t2RUi2n1Z2dYKpdk1muvrRESSDK
 sk01jODHpNPyoc1g6HUwCA1upApHwx0t285QLWrGsW33upT2b982ALRBWnK2fXiA3snJDXRMHaPk
 Ck92S9By3zyYb8Y5el.VlL7zq7Cqx_RCtZY0UPausdijKYay0lvtAHbXaV4vvmiry1s4gr9lUXBE
 .4C9XIBTVMWZ40WQuCbWogcKqLZ7w5EFuOxvgxMUeY5bDwig5WA.jXx6qD_09l844TGgxaZkUWAv
 IyjJBCpcgXx6ox4w8nvktl6eQ4ubUn09Vs1TxlGjifGcKy0QGTskGKs3_Ba5YFHnUNSVHuz_VqJv
 nF4Rzz.jxmpzV9nJ4WZQDKIfUG72G1mO5sc5pH.RDYeMJvlaMel2qRcQ5CJc2AHfNv1wBa7SIpck
 PYis-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.bf2.yahoo.com with HTTP; Fri, 4 Sep 2020 22:01:51 +0000
Date: Fri, 4 Sep 2020 22:01:42 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Ian Jackson <iwj@xenproject.org>,  <xen-devel@lists.xenproject.org>
Cc: <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <806680552.2537432.1599256902267@mail.yahoo.com>
In-Reply-To: <20200904160034.11456-1-iwj@xenproject.org>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
Subject: Re: [PATCH] minios: Revert recent change and revert to working minios
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2537431_1660376120.1599256902265"
X-Mailer: WebService/1.1.16565 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.10.5; Android/7.1.1; NMF26F; bbc100;
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
Reply-To: Jason Long <hack3rcon@yahoo.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_Part_2537431_1660376120.1599256902265
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,Can anyone tell me about the goal and features of Mini-OS?

Sent from Yahoo Mail on Android=20
=20
  On Fri, Sep 4, 2020 at 8:31 PM, Ian Jackson<iwj@xenproject.org> wrote:   =
Currently, xen.git#staging does not build in many environments because
of issues with minios master.=C2=A0 This regression was introduced in an
uncontrolled manner by an update to mini-os.git#master.

This is because in e013e8514389 "config: use mini-os master for
unstable" we switched to tracking minios master in an uncontrolled
manner.=C2=A0 At the time we thought it was unlikely that minios changes
would break the Xen build.=C2=A0 This turns out to have been overly
optimistic.

Xen currently uses unstable internal interfaces of minios.=C2=A0 Until this
can be sorted out, internal changes to minios can require lockstep
changes in Xen.

All this means that "config: use mini-os master for unstable" was
wrong.=C2=A0 We should undo it.=C2=A0 Instead, we go back to the previous
situation: xen.git names a specific minios commit.

This scheme is the model used for qemu-xen-traditional.

That nailed commit must be updated manually, to have xen.git pick up
changes from minios.=C2=A0 If the minios changes require changes in xen.git
too, to avoid breaking the Xen build, they can be made freely in
minios without adverse consequences.=C2=A0 When the minios commitid is
updated in xen.git, the corresponding changes to the actual source
files in xen.git should be bundled together.

For example, when minios is fixed, 8d990807ec2c "stubdom/grub: update
init_netfront() call for mini-os" will need to be reapplied, folded
into the same commit as updates MINIOS_UPSTREAM_REVISION.=C2=A0 For now
that commit must be reverted as we are going back to a previous
version of minios.

This reverts commit 8d990807ec2cde3061222a5ed2df62aba78bace9.
This reverts commit e013e8514389b739153016349e49f5a78e34ddf0.

CC: Jan Beulich <jbeulich@suse.com>
CC: Costin Lupu <costin.lupu@cs.pub.ro>
CC: Wei Liu <wl@xen.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Config.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-
 stubdom/grub/mini-os.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8269503f73..db434ee2c6 100644
--- a/Config.mk
+++ b/Config.mk
@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?=3D git://xenbits.xen.org/mini-os.=
git
 endif
 OVMF_UPSTREAM_REVISION ?=3D a3741780fe3535e19e02efa869a7cac481891129
 QEMU_UPSTREAM_REVISION ?=3D master
-MINIOS_UPSTREAM_REVISION ?=3D master
+MINIOS_UPSTREAM_REVISION ?=3D 0b4b7897e08b967a09bed2028a79fabff82342dd
=20
 SEABIOS_UPSTREAM_REVISION ?=3D rel-1.14.0
=20
diff --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c
index b33dbf02fb..4fc052a255 100644
--- a/stubdom/grub/mini-os.c
+++ b/stubdom/grub/mini-os.c
@@ -291,6 +291,8 @@ struct netfront_dev *net_dev;
 int
 minios_probe (struct nic *nic)
 {
+=C2=A0 =C2=A0 char *ip;
+
=C2=A0 =C2=A0 if (net_dev)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;
=20
@@ -298,7 +300,7 @@ minios_probe (struct nic *nic)
=C2=A0 =C2=A0 grub_memset ((char *) arptable, 0,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_ARP * si=
zeof (struct arptable_t));
=20
-=C2=A0 =C2=A0 net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, =
NULL, NULL, NULL);
+=C2=A0 =C2=A0 net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, =
&ip);
=C2=A0 =C2=A0 if (!net_dev)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
=20
--=20
2.20.1


 =20

------=_Part_2537431_1660376120.1599256902265
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,<div id=3D"yMail_cursorElementTracker_1599256835812">Can anyone tell =
me about the goal and features of Mini-OS?<br id=3D"yMail_cursorElementTrac=
ker_1599256821473"><br><div id=3D"ymail_android_signature"><a id=3D"ymail_a=
ndroid_signature_link" href=3D"https://go.onelink.me/107872968?pid=3DInProd=
uct&amp;c=3DGlobal_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=
=3Dym&amp;af_sub1=3DInternal&amp;af_sub2=3DGlobal_YGrowth&amp;af_sub3=3DEma=
ilSignature">Sent from Yahoo Mail on Android</a></div> <br> <blockquote sty=
le=3D"margin: 0 0 20px 0;"> <div style=3D"font-family:Roboto, sans-serif; c=
olor:#6D00F6;"> <div>On Fri, Sep 4, 2020 at 8:31 PM, Ian Jackson</div><div>=
&lt;iwj@xenproject.org&gt; wrote:</div> </div> <div style=3D"padding: 10px =
0 0 20px; margin: 10px 0 0 0; border-left: 1px solid #6D00F6;"> <div dir=3D=
"ltr">Currently, xen.git#staging does not build in many environments becaus=
e<br></div><div dir=3D"ltr">of issues with minios master.&nbsp; This regres=
sion was introduced in an<br></div><div dir=3D"ltr">uncontrolled manner by =
an update to mini-os.git#master.<br></div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">This is because in e013e8514389 "config: use mini-os master for<=
br></div><div dir=3D"ltr">unstable" we switched to tracking minios master i=
n an uncontrolled<br></div><div dir=3D"ltr">manner.&nbsp; At the time we th=
ought it was unlikely that minios changes<br></div><div dir=3D"ltr">would b=
reak the Xen build.&nbsp; This turns out to have been overly<br></div><div =
dir=3D"ltr">optimistic.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
">Xen currently uses unstable internal interfaces of minios.&nbsp; Until th=
is<br></div><div dir=3D"ltr">can be sorted out, internal changes to minios =
can require lockstep<br></div><div dir=3D"ltr">changes in Xen.<br></div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr">All this means that "config: use m=
ini-os master for unstable" was<br></div><div dir=3D"ltr">wrong.&nbsp; We s=
hould undo it.&nbsp; Instead, we go back to the previous<br></div><div dir=
=3D"ltr">situation: xen.git names a specific minios commit.<br></div><div d=
ir=3D"ltr"><br></div><div dir=3D"ltr">This scheme is the model used for qem=
u-xen-traditional.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Tha=
t nailed commit must be updated manually, to have xen.git pick up<br></div>=
<div dir=3D"ltr">changes from minios.&nbsp; If the minios changes require c=
hanges in xen.git<br></div><div dir=3D"ltr">too, to avoid breaking the Xen =
build, they can be made freely in<br></div><div dir=3D"ltr">minios without =
adverse consequences.&nbsp; When the minios commitid is<br></div><div dir=
=3D"ltr">updated in xen.git, the corresponding changes to the actual source=
<br></div><div dir=3D"ltr">files in xen.git should be bundled together.<br>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">For example, when minios =
is fixed, 8d990807ec2c "stubdom/grub: update<br></div><div dir=3D"ltr">init=
_netfront() call for mini-os" will need to be reapplied, folded<br></div><d=
iv dir=3D"ltr">into the same commit as updates MINIOS_UPSTREAM_REVISION.&nb=
sp; For now<br></div><div dir=3D"ltr">that commit must be reverted as we ar=
e going back to a previous<br></div><div dir=3D"ltr">version of minios.<br>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">This reverts commit 8d990=
807ec2cde3061222a5ed2df62aba78bace9.<br></div><div dir=3D"ltr">This reverts=
 commit e013e8514389b739153016349e49f5a78e34ddf0.<br></div><div dir=3D"ltr"=
><br></div><div dir=3D"ltr">CC: Jan Beulich &lt;<a ymailto=3D"mailto:jbeuli=
ch@suse.com" href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt;<br=
></div><div dir=3D"ltr">CC: Costin Lupu &lt;<a ymailto=3D"mailto:costin.lup=
u@cs.pub.ro" href=3D"mailto:costin.lupu@cs.pub.ro">costin.lupu@cs.pub.ro</a=
>&gt;<br></div><div dir=3D"ltr">CC: Wei Liu &lt;<a ymailto=3D"mailto:wl@xen=
.org" href=3D"mailto:wl@xen.org">wl@xen.org</a>&gt;<br></div><div dir=3D"lt=
r">CC: Samuel Thibault &lt;<a ymailto=3D"mailto:samuel.thibault@ens-lyon.or=
g" href=3D"mailto:samuel.thibault@ens-lyon.org">samuel.thibault@ens-lyon.or=
g</a>&gt;<br></div><div dir=3D"ltr">Signed-off-by: Ian Jackson &lt;<a ymail=
to=3D"mailto:iwj@xenproject.org" href=3D"mailto:iwj@xenproject.org">iwj@xen=
project.org</a>&gt;<br></div><div dir=3D"ltr">---<br></div><div dir=3D"ltr"=
> Config.mk&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br></div=
><div dir=3D"ltr"> stubdom/grub/mini-os.c | 4 +++-<br></div><div dir=3D"ltr=
"> 2 files changed, 4 insertions(+), 2 deletions(-)<br></div><div dir=3D"lt=
r"><br></div><div dir=3D"ltr">diff --git a/Config.mk b/Config.mk<br></div><=
div dir=3D"ltr">index 8269503f73..db434ee2c6 100644<br></div><div dir=3D"lt=
r">--- a/Config.mk<br></div><div dir=3D"ltr">+++ b/Config.mk<br></div><div =
dir=3D"ltr">@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?=3D git://xenbits.xen.=
org/mini-os.git<br></div><div dir=3D"ltr"> endif<br></div><div dir=3D"ltr">=
 OVMF_UPSTREAM_REVISION ?=3D a3741780fe3535e19e02efa869a7cac481891129<br></=
div><div dir=3D"ltr"> QEMU_UPSTREAM_REVISION ?=3D master<br></div><div dir=
=3D"ltr">-MINIOS_UPSTREAM_REVISION ?=3D master<br></div><div dir=3D"ltr">+M=
INIOS_UPSTREAM_REVISION ?=3D 0b4b7897e08b967a09bed2028a79fabff82342dd<br></=
div><div dir=3D"ltr"> <br></div><div dir=3D"ltr"> SEABIOS_UPSTREAM_REVISION=
 ?=3D rel-1.14.0<br></div><div dir=3D"ltr"> <br></div><div dir=3D"ltr">diff=
 --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c<br></div><div dir=
=3D"ltr">index b33dbf02fb..4fc052a255 100644<br></div><div dir=3D"ltr">--- =
a/stubdom/grub/mini-os.c<br></div><div dir=3D"ltr">+++ b/stubdom/grub/mini-=
os.c<br></div><div dir=3D"ltr">@@ -291,6 +291,8 @@ struct netfront_dev *net=
_dev;<br></div><div dir=3D"ltr"> int<br></div><div dir=3D"ltr"> minios_prob=
e (struct nic *nic)<br></div><div dir=3D"ltr"> {<br></div><div dir=3D"ltr">=
+&nbsp; &nbsp; char *ip;<br></div><div dir=3D"ltr">+<br></div><div dir=3D"l=
tr">&nbsp; &nbsp;  if (net_dev)<br></div><div dir=3D"ltr">&nbsp; &nbsp; &nb=
sp; &nbsp;  return 1;<br></div><div dir=3D"ltr"> <br></div><div dir=3D"ltr"=
>@@ -298,7 +300,7 @@ minios_probe (struct nic *nic)<br></div><div dir=3D"lt=
r">&nbsp; &nbsp;  grub_memset ((char *) arptable, 0,<br></div><div dir=3D"l=
tr">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MAX_ARP =
* sizeof (struct arptable_t));<br></div><div dir=3D"ltr"> <br></div><div di=
r=3D"ltr">-&nbsp; &nbsp; net_dev =3D init_netfront(NULL, (void*) -1, nic-&g=
t;node_addr, NULL, NULL, NULL);<br></div><div dir=3D"ltr">+&nbsp; &nbsp; ne=
t_dev =3D init_netfront(NULL, (void*) -1, nic-&gt;node_addr, &amp;ip);<br><=
/div><div dir=3D"ltr">&nbsp; &nbsp;  if (!net_dev)<br></div><div dir=3D"ltr=
">&nbsp; &nbsp; &nbsp; &nbsp;  return 0;<br></div><div dir=3D"ltr"> <br></d=
iv><div dir=3D"ltr">-- <br></div><div dir=3D"ltr">2.20.1<br></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr"><br></div> </div> </blockquote></div>
------=_Part_2537431_1660376120.1599256902265--

