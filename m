Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311395ECC03
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 20:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412923.656398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odF92-0001Vx-Lt; Tue, 27 Sep 2022 18:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412923.656398; Tue, 27 Sep 2022 18:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odF92-0001Sz-Ic; Tue, 27 Sep 2022 18:17:24 +0000
Received: by outflank-mailman (input) for mailman id 412923;
 Tue, 27 Sep 2022 18:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVhR=Z6=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1odF90-0001St-Dx
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 18:17:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c4e4f1-3e90-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 20:17:21 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id l14so22424917eja.7
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 11:17:21 -0700 (PDT)
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
X-Inumbo-ID: a0c4e4f1-3e90-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0R5nC5NCJpjjrmOChJBMhgB1HMUIeGH06lkH4LeIZqo=;
        b=olFC5tpgG45V99LdL/oKNCKy0WUadcLeiWvtIgjRnX526STkaRNuoqKwHcA0W3rWJQ
         zSiYzvr29mJ/WwkgmsmMK2MHCPJHeDUznVuoN8IXU07tAJBsaSWuRRtXhbvWF0y1sHzx
         AHjGTdBlr66EdPjbLbevP9YlcKyFB0yJg0n+/9IqtNLf2g/x4qxHDRwmvRiuiDpMylRu
         RCsEbGkJBCWWfyetpeBotM4TkSSRX40lRwwQneFVvvI2boACnU1ECm1L821IgAiX45Vt
         xob1Q5aSKJFbvraBGVcb64SUM4dXxAP85QM/nLvdEDB9yhDuOkB1FtYUEc3QcoeRsrgv
         QCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0R5nC5NCJpjjrmOChJBMhgB1HMUIeGH06lkH4LeIZqo=;
        b=leLbONVivlkyT/hqrTv8NjsVpwnsrHJbUNZgyH8S4a3T4VxhUiVv/p/Ja2HbJoOO04
         IWsZiCEXqjdSTQtr2gaAsjpPOonapwx8y/sHyOxUray3Nb/Hp9h/1DIe41Lb4h7t5xWE
         jFyq8XjU5LYTi4PLamhhMyAgmynJiIM0nMTcHXJ5jVg1RwGmPkJcEy8RRDYxOKHrpemG
         dsnKAettFKYDHWlRZZzXSpTA1OLTg3DdI6xgaNJXmvbe3ra41Kr8oUr9u0pa3oepdRzv
         K3sHnAwCZyMTTyNB3MufhpFwNBqGbBVdkMj0UW2mUn4zYY+6ybe6iN6Yzgo8CVuxNlSV
         wKvA==
X-Gm-Message-State: ACrzQf1E45PwGVL/9nVsgKB6/SOVM3an+armULDqocX1eycmfWVyyYDa
	MS/irXsXzSOboURMs0yLS79jCYhVJcBMEmD/g7w=
X-Google-Smtp-Source: AMsMyM6cKMuHNyPHW/zc+vfnWtQg/yyufTmkgx+JR8tQEv+0OxkshUNwQypSeFGKVgs5k2AZ2oG8LJ8B8dvJ39cgjZA=
X-Received: by 2002:a17:907:75e7:b0:77a:2378:91bb with SMTP id
 jz7-20020a17090775e700b0077a237891bbmr23917706ejc.329.1664302640788; Tue, 27
 Sep 2022 11:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
 <YytYuAcMh8WGDQTF@mattapan.m5p.com>
In-Reply-To: <YytYuAcMh8WGDQTF@mattapan.m5p.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Tue, 27 Sep 2022 23:47:09 +0530
Message-ID: <CALAP8f9+N4+Jk_hWh8XCc70g7xxbr7PTffE0By56TROOyS9rSg@mail.gmail.com>
Subject: Re: How to do display sharing between guests or bring up guests display
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000b3f8b705e9aca737"

--000000000000b3f8b705e9aca737
Content-Type: text/plain; charset="UTF-8"

Hi Elliott,

Thanks!

As per the link you shared, VNC & SDL are two ways to get GUI display up
for guests. I am going through VNC & tried SDL, added below line in
guest1.cfg file.
*vfb = [ 'sdl=1' ]*
when creating guest machine by running command "*xl create -c guest1.cfg" *then
its throwing errors:










*root@raspberrypi4-64:~/guest1# xl create -c guest1.cfgParsing config from
guest1.cfglibxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error
on QMP socket: Connection reset by peerlibxl: error:
libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
connection to QEMUlibxl: error:
libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
configs failed, rc=-26libxl: error:
libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
not start: -26libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
Model already exitedlibxl: error: libxl_domain.c:1183:libxl__destroy_domid:
Domain 3:Non-existant domainlibxl: error:
libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
guestlibxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
3:Destruction of domain failed*

It works absolutely fine & guest1 comes up if *vfb = [ 'sdl=1' ]* is not
included in the configuration file. Anything wrong with the statement
added or any other steps need to be followed for this? Looking after your
response asap.

Regards,
Vipul Kumar

On Thu, Sep 22, 2022 at 12:03 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:

> On Wed, Sep 21, 2022 at 10:54:55PM +0530, Vipul Suneja wrote:
> > Now I have built a custom image with GUI & ported it as a guest2(DOMU2),
> > guest2 came up as a console & couldn't see the GUI screen(Display screen
> > connected to rpi4 via HDMI) coming up.
> >
> > Can you please guide me on display sharing or how to bring up guests
> > display?
>
> This has already been answered in several locations.  The first place to
> ask for help with the RP4 is their own forums.  Turns out the topic is
> well known:
>
> https://forums.raspberrypi.com/viewtopic.php?t=232323#p1775083
>
> (huh, their forum moved to the raspberrypi.com domain; they really need
> an entry for Xen in their other OSes area)
>
>
> --
> (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>
>

--000000000000b3f8b705e9aca737
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Elliott,<div><br></div><div>Thanks!</div><div><br></div=
><div>As per the link you shared, VNC &amp; SDL are two ways to get GUI dis=
play up for guests. I am going through VNC &amp; tried SDL, added below lin=
e in guest1.cfg file.</div><div><b>vfb =3D [ &#39;sdl=3D1&#39; ]</b></div><=
div>when creating guest machine by running command &quot;<b>xl create -c gu=
est1.cfg&quot;=C2=A0</b>then its throwing errors:</div><div><br></div><div>=
<b><i>root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg<br>Parsing con=
fig from guest1.cfg<br>libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: D=
omain 3:error on QMP socket: Connection reset by peer<br>libxl: error: libx=
l_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP conne=
ction to QEMU<br>libxl: error: libxl_dm.c:3351:device_model_postconfig_done=
: Domain 3:Post DM startup configs failed, rc=3D-26<br>libxl: error: libxl_=
create.c:1867:domcreate_devmodel_started: Domain 3:device model did not sta=
rt: -26<br>libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Mo=
del already exited<br>libxl: error: libxl_domain.c:1183:libxl__destroy_domi=
d: Domain 3:Non-existant domain<br>libxl: error: libxl_domain.c:1137:domain=
_destroy_callback: Domain 3:Unable to destroy guest<br>libxl: error: libxl_=
domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed</i><=
/b><br></div><div><b><i><br></i></b></div><div>It works absolutely fine &am=
p; guest1 comes up if=C2=A0<b>vfb =3D [ &#39;sdl=3D1&#39; ]</b>=C2=A0is not=
 included in the configuration file. Anything wrong with the statement=C2=
=A0</div><div>added or any other steps need to be followed for this? Lookin=
g after your response asap.</div><div><br></div><div>Regards,</div><div>Vip=
ul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 22, 2022 at 12:03 AM Elliott Mitchell &lt;<a hr=
ef=3D"mailto:ehem%2Bxen@m5p.com">ehem+xen@m5p.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 21, 2022 at 10=
:54:55PM +0530, Vipul Suneja wrote:<br>
&gt; Now I have built a custom image with GUI &amp; ported it as a guest2(D=
OMU2),<br>
&gt; guest2 came up as a console &amp; couldn&#39;t see the GUI screen(Disp=
lay screen<br>
&gt; connected to rpi4 via HDMI) coming up.<br>
&gt; <br>
&gt; Can you please guide me on display sharing or how to bring up guests<b=
r>
&gt; display?<br>
<br>
This has already been answered in several locations.=C2=A0 The first place =
to<br>
ask for help with the RP4 is their own forums.=C2=A0 Turns out the topic is=
<br>
well known:<br>
<br>
<a href=3D"https://forums.raspberrypi.com/viewtopic.php?t=3D232323#p1775083=
" rel=3D"noreferrer" target=3D"_blank">https://forums.raspberrypi.com/viewt=
opic.php?t=3D232323#p1775083</a><br>
<br>
(huh, their forum moved to the <a href=3D"http://raspberrypi.com" rel=3D"no=
referrer" target=3D"_blank">raspberrypi.com</a> domain; they really need<br=
>
an entry for Xen in their other OSes area)<br>
<br>
<br>
-- <br>
(\___(\___(\______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --=3D&gt; 8-) EHM &lt;=
=3D--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ______/)___/)___/)<br>
=C2=A0\BS (=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mail=
to:ehem%2Bsigmsg@m5p.com" target=3D"_blank">ehem+sigmsg@m5p.com</a>=C2=A0 P=
GP 87145445=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 )=C2=A0 =C2=A0/=
<br>
=C2=A0 \_CS\=C2=A0 =C2=A0|=C2=A0 _____=C2=A0 -O #include &lt;stddisclaimer.=
h&gt; O-=C2=A0 =C2=A0_____=C2=A0 |=C2=A0 =C2=A0/=C2=A0 _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
</blockquote></div>

--000000000000b3f8b705e9aca737--

