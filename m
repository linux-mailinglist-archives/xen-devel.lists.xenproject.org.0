Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426326CE28
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 23:13:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIejk-0005zD-5T; Wed, 16 Sep 2020 21:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zEh2=CZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kIejj-0005z8-IU
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 21:13:07 +0000
X-Inumbo-ID: 13d7c8dd-6b96-48bd-a413-5e8a6aa9d159
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13d7c8dd-6b96-48bd-a413-5e8a6aa9d159;
 Wed, 16 Sep 2020 21:13:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so8346070wrm.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xEeXcGAjXvR8gsIv0zarjPW/Tba4FnvziiCMbowz46I=;
 b=oN4JBAnRA50nRpK9CGaFIbEdbBVyI34slNVRm7glYOWFhmBb2suF0Lemim4JRRTxGu
 SSXQVkxQFoylRBesk6IGvce2NLQ8OkYy9kww/dcTaOk0+4beF2x/ELd5mGDQLY961FvM
 lbNHvTL4KmPnIhUcI0xuoOOAjOZvWj2cpuzxHY4f9SPKIIxR/5NsTE/l2sCa74bjC4rn
 Ot4kFnm66sVQA4cstyAsHiQ3SBok2VrvqsmMIkoL1Zqugx+/PnED1oLI75H/XtpkMl6X
 2Q+vt9UFiZFTHDL1vVd05oLhkD90gBzXmNBoNRJRh+TyOX9mm8AtHJrLV7peiL8wYlef
 frGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xEeXcGAjXvR8gsIv0zarjPW/Tba4FnvziiCMbowz46I=;
 b=S9PoATX9qqlBf9VhF/MFt4WuYvo1lbBZ6A/qNjlbHvIruhfXaMgzv0hBpAngtoi7Gj
 /GmIqV4joxe0N0cUDgVehTCmbje9r9/ktZAr1g3BgKOPIl7uOOLRF/GeOYeAyXL+THBY
 2KqniJB6QR6NCFG2kR79YUzCoIIfV15CV9DVeXEJUeNJJYLrfNeJ5KG5yfQ2V9S0OV0j
 5SmFmLzDGEp8jtcNMxFyQJ6l5tYJkSzH8ddCm2vWqKS9U/hRsWvaSdrAvssdXbMIMDzJ
 JSdD2YciEC7bYmS6Ehm2eQX//4WwU5ySe1vGyNUMcoNbf4GExe73ggBiz//DTr+ysz+W
 X+QQ==
X-Gm-Message-State: AOAM533MRxrEfkwNY/L7DLXAKAN2q4l6ONgB6vf3hENbsaRtHHqqf8x+
 lDvQjgbug7hr0gHKJxChD4TA/cwhipp+SJX8TJM=
X-Google-Smtp-Source: ABdhPJyN5kWFaDeNv7ygIrxfnUoF+yyvLtqFz6TZqZJmtASX2I8qA6grT2db+ayZPU+Cjdd7DVqoXPM0cID79E4skEw=
X-Received: by 2002:adf:f548:: with SMTP id j8mr29749111wrp.114.1600290785533; 
 Wed, 16 Sep 2020 14:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
 <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
In-Reply-To: <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 17 Sep 2020 00:12:54 +0300
Message-ID: <CAPD2p-nbhYTBQUTZgeVpbfw2G9cnpP9F-f=gYJLFdGy5c1q5mQ@mail.gmail.com>
Subject: Re: [PATCH] SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="000000000000cf22ef05af74bbc9"
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

--000000000000cf22ef05af74bbc9
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2020 at 8:02 PM Julien Grall <julien@xen.org> wrote:

> Hi Oleksandr,
>

Hi Julien

[sorry for the possible format issues]


>
> On 14/09/2020 20:37, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > And remove dependencies on CONFIG_EXPERT.
>
> In order to help to make the decision, can you provide the following
> information:
>     - Is it functionally complete?
>

I think, yes. At least I am not aware of any remaining issues which prevent
us from using Xen driver normally these days.
There was one important issue related to the known R-Car Gen3 IPMMU-VMSA
limitation to handle maximum 40-bit IPA only (so 4-level translation table
is not supported) and
this issue didn't allow us to have the Xen driver *completely* functional.
Hopefully, we have already found a proper way to handle this in Xen on Arm
[1]:


>     - Can it work on all known platforms with IPMMU VMSA?
>

I don't think Xen driver will work on all known platforms with the
IPMMU-VMSA.
Xen driver is supposed to be used with newest R-Car Gen3 SoC revisions only
(H3 ES3.0, M3-W+, etc.) which IPMMU H/W supports stage 2 translation
table format (to be able to share the P2M with the CPU). On older SoC
revisions it won't work (driver performs a special check at the
initialization time to see whether
the P2M sharing is supported in current SoC revision). Being honest, the
R-Car Gen3 family is not limited by these 3 SoCs (H3, M3-W+, M3N) the
driver is looking for.
There are other SoCs: E3, D3, V3H, V3M, etc, which are quite new and likely
have a *proper* IPMMU H/W to be used in Xen. But, I don't have a
possibility to check
them in order to be 100% sure and extend a number of supported SoCs in the
driver.


>     - Is there any plan to smoke (manually or automatically) test the
> driver?
>

Yes, there is a plan to perform manual tests. Actually, this is what we
usually do in the context of our development.
After all, device passthrough is one of the important features and keeping
this driver in a functional state is our target.

[1]
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02967.html

-- 
Regards,

Oleksandr Tyshchenko

--000000000000cf22ef05af74bbc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2020 at 8:02 PM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Oleksandr,<b=
r></blockquote><div><br></div><div>Hi Julien</div><div><br></div><div>[sorr=
y for the possible format issues]</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
On 14/09/2020 20:37, Oleksandr Tyshchenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; <br>
&gt; And remove dependencies on CONFIG_EXPERT.<br>
<br>
In order to help to make the decision, can you provide the following <br>
information:<br>
=C2=A0 =C2=A0 - Is it functionally complete?<br></blockquote><div>=C2=A0</d=
iv><div>I think, yes. At least I am not aware of any remaining issues which=
 prevent us from using Xen driver normally these days.<br>There was one imp=
ortant issue related to the known R-Car Gen3 IPMMU-VMSA limitation to handl=
e maximum 40-bit IPA only (so 4-level translation table is not supported) a=
nd<br>this issue didn&#39;t allow us to have the Xen driver *completely* fu=
nctional. Hopefully, we have already found a proper way to handle this in X=
en on Arm [1]:<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
=C2=A0 =C2=A0 - Can it work on all known platforms with IPMMU VMSA?<br></bl=
ockquote><div>=C2=A0</div><div>I don&#39;t think Xen driver will work on al=
l known platforms with the IPMMU-VMSA.<br>Xen driver is supposed to be used=
 with newest R-Car Gen3 SoC revisions only (H3 ES3.0, M3-W+, etc.) which IP=
MMU H/W supports stage 2 translation<br>table format (to be able to share t=
he P2M with the CPU). On older SoC revisions it won&#39;t work (driver perf=
orms a special check at the initialization time to see whether</div><div>th=
e P2M sharing is supported in current SoC revision). Being honest, the R-Ca=
r Gen3 family is not limited by these 3 SoCs (H3, M3-W+, M3N) the driver is=
 looking for.</div><div>There are other SoCs: E3, D3, V3H, V3M, etc, which =
are quite new and likely have a *proper* IPMMU H/W to be used in Xen. But, =
I don&#39;t have a possibility to check</div><div>them in order to be 100% =
sure and extend a number of supported SoCs in the driver.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 - Is there any plan to smoke (manually or automatically) test=
 the driver?<br></blockquote><div>=C2=A0</div><div>Yes, there is a plan to =
perform manual tests. Actually, this is what we usually do in the context o=
f our development.</div><div>After all, device passthrough is one of the im=
portant features and keeping this driver in a functional state is our targe=
t.<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">[1]=C2=A0=C2=A0<a href=3D"https://lists.xenproject.org/archives/html=
/xen-devel/2019-09/msg02967.html">https://lists.xenproject.org/archives/htm=
l/xen-devel/2019-09/msg02967.html</a><div><br></div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><fon=
t size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-seri=
f">Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div></div></di=
v></div></div>

--000000000000cf22ef05af74bbc9--

