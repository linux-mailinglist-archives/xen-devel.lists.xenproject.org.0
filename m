Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48D5EF9ED
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 18:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413866.657811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odwA1-00031p-D2; Thu, 29 Sep 2022 16:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413866.657811; Thu, 29 Sep 2022 16:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odwA1-0002zh-A3; Thu, 29 Sep 2022 16:13:17 +0000
Received: by outflank-mailman (input) for mailman id 413866;
 Thu, 29 Sep 2022 16:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOe8=2A=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1odwA0-0002zb-9z
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 16:13:16 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f168445-4011-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 18:13:14 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id c30so2655591edn.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Sep 2022 09:13:14 -0700 (PDT)
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
X-Inumbo-ID: 9f168445-4011-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=flhFeICuQT8/y+9AVAFFUYd5hifnxYkJzhAO79vKcmg=;
        b=EhY8JIY2vNyhwun3cvL+gwk4TrnS7fE6wyz6JcP7/jDMYo6WAeulvPvh/B41SbrsN/
         dy1H78vZh/fKYgMpQiK+5nTh1T7+/5xmzAdEzEBvpFpeI5KXta1HriQGlxgeq4uRxcFb
         xm05bxX/1bOn4PTSTu6RTdUOEZY1QgdWvvCVCSyPKS3wph+OjISkizrlmTNOQCkfOpoa
         Ets3BpRX9bmJeHJaP1SgQ41lIGXcEkKpb5LasChk7F64ivMgXg0HG36oVcOkEVelK90e
         MAnU3J5Pg20sAnB6NVtPrRhkE+aQzTTpijBsSWnsnnr8JzumCM4piFXDgbgUFuxZnVWI
         6PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=flhFeICuQT8/y+9AVAFFUYd5hifnxYkJzhAO79vKcmg=;
        b=uVKzQdbQJn2qp9L+C+uTWkPIBoHjbtX/YQEK6fZJSHASujlZC/hNRtF4VWWbqugoGA
         p5ZY7WKh0CWBZjVu2+YvnL0l25LJ8iiegjNnc4e4mwRLX92Av/TcGjAZLGDp/r5LgRtN
         j6cLukVwz5NgndnR+q4HPKaSEayoV9jD0UyUE7kDIqhjyh2DnR7Qe0YE9HP0V4uo10JC
         z1asnQ5HaJKetFbDHk0OCfew/KiqYBht2vq9KPk+NPwm+VW6FcXwxgFaLioVHFEY32Hh
         W9Z9XvAQJy2XQLpk6Ygs4axn5rhtAIXYiAcgPJSZ00lcXU+L2I+AxONqCSVK10LSXnzD
         q7Ag==
X-Gm-Message-State: ACrzQf1Qhwx7R6QFLw2ijpIwXxQRFPzUJ9B1LRRMDry2lxGvgslvpuMN
	2z2g/4sSiF4GN62pS75Iu2vlPQpnb5cf0+Sc3ms=
X-Google-Smtp-Source: AMsMyM54iankNpI//+Sl0NdaWe4qDjetwyVTsrK9LCND5wGNFoiqaKM2Q7SvxkKkNPy9hQMykurk6zytYdx4eBUXju8=
X-Received: by 2002:a05:6402:5188:b0:452:5395:a271 with SMTP id
 q8-20020a056402518800b004525395a271mr4099193edd.383.1664467994131; Thu, 29
 Sep 2022 09:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
 <YytYuAcMh8WGDQTF@mattapan.m5p.com> <CALAP8f9+N4+Jk_hWh8XCc70g7xxbr7PTffE0By56TROOyS9rSg@mail.gmail.com>
In-Reply-To: <CALAP8f9+N4+Jk_hWh8XCc70g7xxbr7PTffE0By56TROOyS9rSg@mail.gmail.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Thu, 29 Sep 2022 21:43:02 +0530
Message-ID: <CALAP8f8_TiDa4t9WbXtCf2erKwSv04y3HVv6ohKoU=geJwrp5Q@mail.gmail.com>
Subject: Re: How to do display sharing between guests or bring up guests display
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="00000000000087bfc605e9d327bc"

--00000000000087bfc605e9d327bc
Content-Type: text/plain; charset="UTF-8"

Hi Elliott,

Thanks!

Any input from your side on this issue will be really helpful.
Looking forward to hearing from you asap.

Regards,
Vipul Kumar

On Tue, Sep 27, 2022 at 11:47 PM Vipul Suneja <vsuneja63@gmail.com> wrote:

> Hi Elliott,
>
> Thanks!
>
> As per the link you shared, VNC & SDL are two ways to get GUI display up
> for guests. I am going through VNC & tried SDL, added below line in
> guest1.cfg file.
> *vfb = [ 'sdl=1' ]*
> when creating guest machine by running command "*xl create -c
> guest1.cfg" *then its throwing errors:
>
>
>
>
>
>
>
>
>
>
> *root@raspberrypi4-64:~/guest1# xl create -c guest1.cfgParsing config from
> guest1.cfglibxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error
> on QMP socket: Connection reset by peerlibxl: error:
> libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
> connection to QEMUlibxl: error:
> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
> configs failed, rc=-26libxl: error:
> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
> not start: -26libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
> Model already exitedlibxl: error: libxl_domain.c:1183:libxl__destroy_domid:
> Domain 3:Non-existant domainlibxl: error:
> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
> guestlibxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 3:Destruction of domain failed*
>
> It works absolutely fine & guest1 comes up if *vfb = [ 'sdl=1' ]* is not
> included in the configuration file. Anything wrong with the statement
> added or any other steps need to be followed for this? Looking after your
> response asap.
>
> Regards,
> Vipul Kumar
>
> On Thu, Sep 22, 2022 at 12:03 AM Elliott Mitchell <ehem+xen@m5p.com>
> wrote:
>
>> On Wed, Sep 21, 2022 at 10:54:55PM +0530, Vipul Suneja wrote:
>> > Now I have built a custom image with GUI & ported it as a guest2(DOMU2),
>> > guest2 came up as a console & couldn't see the GUI screen(Display screen
>> > connected to rpi4 via HDMI) coming up.
>> >
>> > Can you please guide me on display sharing or how to bring up guests
>> > display?
>>
>> This has already been answered in several locations.  The first place to
>> ask for help with the RP4 is their own forums.  Turns out the topic is
>> well known:
>>
>> https://forums.raspberrypi.com/viewtopic.php?t=232323#p1775083
>>
>> (huh, their forum moved to the raspberrypi.com domain; they really need
>> an entry for Xen in their other OSes area)
>>
>>
>> --
>> (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
>> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>>
>>
>>

--00000000000087bfc605e9d327bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Elliott,<div><br></div><div>Thanks!</div><div><br></div=
><div>Any input from your side on this issue will be really helpful. Lookin=
g=C2=A0forward to hearing from you asap.</div><div><br></div><div>Regards,<=
/div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022 at 11:47 PM Vipul Suneja &l=
t;<a href=3D"mailto:vsuneja63@gmail.com" target=3D"_blank">vsuneja63@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hi Elliott,<div><br></div><div>Thanks!</div><div><br></=
div><div>As per the link you shared, VNC &amp; SDL are two ways to get GUI =
display up for guests. I am going through VNC &amp; tried SDL, added below =
line in guest1.cfg file.</div><div><b>vfb =3D [ &#39;sdl=3D1&#39; ]</b></di=
v><div>when creating guest machine by running command &quot;<b>xl create -c=
 guest1.cfg&quot;=C2=A0</b>then its throwing errors:</div><div><br></div><d=
iv><b><i>root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg<br>Parsing =
config from guest1.cfg<br>libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback=
: Domain 3:error on QMP socket: Connection reset by peer<br>libxl: error: l=
ibxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP co=
nnection to QEMU<br>libxl: error: libxl_dm.c:3351:device_model_postconfig_d=
one: Domain 3:Post DM startup configs failed, rc=3D-26<br>libxl: error: lib=
xl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did not =
start: -26<br>libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device=
 Model already exited<br>libxl: error: libxl_domain.c:1183:libxl__destroy_d=
omid: Domain 3:Non-existant domain<br>libxl: error: libxl_domain.c:1137:dom=
ain_destroy_callback: Domain 3:Unable to destroy guest<br>libxl: error: lib=
xl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed</=
i></b><br></div><div><b><i><br></i></b></div><div>It works absolutely fine =
&amp; guest1 comes up if=C2=A0<b>vfb =3D [ &#39;sdl=3D1&#39; ]</b>=C2=A0is =
not included in the configuration file. Anything wrong with the statement=
=C2=A0</div><div>added or any other steps need to be followed for this? Loo=
king after your response asap.</div><div><br></div><div>Regards,</div><div>=
Vipul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Sep 22, 2022 at 12:03 AM Elliott Mitchell &lt;<a h=
ref=3D"mailto:ehem%2Bxen@m5p.com" target=3D"_blank">ehem+xen@m5p.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 Sep 21, 2022 at 10:54:55PM +0530, Vipul Suneja wrote:<br>
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
</blockquote></div>

--00000000000087bfc605e9d327bc--

