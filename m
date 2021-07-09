Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3F3C219F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153518.283634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ms1-00026O-Rs; Fri, 09 Jul 2021 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153518.283634; Fri, 09 Jul 2021 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ms1-00023P-Mq; Fri, 09 Jul 2021 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 153518;
 Fri, 09 Jul 2021 09:32:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WfOa=MB=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1m1mrz-00021U-EX
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:32:27 +0000
Received: from pi.kojedz.in (unknown [2a01:be00:10:201:0:80:0:1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb53465e-5e3b-4daa-b339-2b964feb1557;
 Fri, 09 Jul 2021 09:32:26 +0000 (UTC)
Received: from [IPv6:2a01:be00:0:2:29b2:6c38:b1b7:afc5] (unknown
 [IPv6:2a01:be00:0:2:29b2:6c38:b1b7:afc5])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id C9F86C1B0;
 Fri,  9 Jul 2021 11:32:24 +0200 (CEST)
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
X-Inumbo-ID: bb53465e-5e3b-4daa-b339-2b964feb1557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
	t=1625823145; bh=mXzX4zkmNiwBO+NUpFqoWx+93sk4+KjYM3ETlQg+PDA=;
	h=Date:In-Reply-To:References:Subject:To:From;
	b=PsCi3LN8JZVBHcF/qZXMSGcRSe0Y/5eHOnkCDP0NimOzmIqKCDv0gtnURXLd/gWRB
	 Ux/FYm/wpHH37x9PZt/V1gVcIWr5NOIFoI3vatOkXcbHjBF+ywhvBDq0I4Cd5HNCsy
	 2QWkcZPvZAWCkblKXG4XGBUXSqPanfU2fopxXLJjb7la/d69ZYOYwv/K5FVhq7Dalq
	 m4tucWnx4no/PMtfbOvn6V2Xyrqj8h33LRx4zvwHIM4tfOgVDLBknjuDcVcHqnc6fE
	 G3vF4sfD32giwT/ULPl/lyr3xCD0vTARlqx/hZock+l5aiDxWlfRlJ0OqcJtegpll2
	 HWMY/vk/wocmH3w9MnSXWmZt3R32fL/AUsr6qJ2HrM42N2Pawkw7ewJG4wQ/jyB6Wl
	 JrGcYNh0tOZcii8D/g2Pn8R/Oyfn1Kipwt8HzhTeXQt7Z4cBIyTLxma++0PO8Z8F3t
	 0NosetDYn5ZZfi3WERUf4yHM5PPzWqgbN9gGfgFhTLkNmZUqyPqdsrh9hQGnEd8QfF
	 MUv14LshGlrPU80Z3upoia1gcJPzFIqdR9GNXSzfQJC7daRyVU3RnD1/hdWrse50R7
	 nEYlt/f2XnmSzJeMZVXEaq1wm2O+XZpLI9GtMU6DcWouQnEBNCTYjOva8dTT+oCMjF
	 5EZ2qrCMbRl6WTlvxdsMbsQg=
Date: Fri, 09 Jul 2021 11:32:20 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
References: <585c34fd96c6e22847333d9d18843c0f@kojedz.in> <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----3CUGW2BUZTVZ2WIDP4SY4014O4SO7V"
Content-Transfer-Encoding: 7bit
Subject: Re: fix vbd rd_sects stat
To: Andrew Cooper <andrew.cooper3@citrix.com>,xen-devel@lists.xenproject.org
From: Richard Kojedzinszky <richard@kojedz.in>
Message-ID: <61970531-A990-44B4-8614-320141E7C2D7@kojedz.in>

------3CUGW2BUZTVZ2WIDP4SY4014O4SO7V
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Then please add signed-by headers=2E :)


Thanks

2021=2E j=C3=BAlius 9=2E 10:59:54 CEST, Andrew Cooper <andrew=2Ecooper3@ci=
trix=2Ecom> =C3=ADrta:
>On 09/07/2021 09:09, Richard Kojedzinszky wrote:
>
>Thankyou for the patch=2E=C2=A0 That is quite an embarrassing bug=2E
>
>However, for copyright reasons, we require all submissions to contain a
>Signed-off-by line, as per the Developer's Certificate of Origin,
>https://wiki=2Exenproject=2Eorg/wiki/Submitting_Xen_Project_Patches#Signe=
d-off-by
>
>Given how trivial this patch is, feel free to just reply to this email
>with confirmation and I can sort it out on commit=2E
>
>However, for future patches, please include directly=2E=C2=A0 (Also, if y=
ou
>are
>able to use git-send-email, and the get_maintainers=2Epl script, that
>would be even better=2E)
>
>~Andrew

--=20
Ezt a levelet az Android k=C3=A9sz=C3=BCl=C3=A9kemr=C5=91l k=C3=BCldtem K-=
9 Mail-el=2E Eln=C3=A9z=C3=A9st a t=C3=B6m=C3=B6rs=C3=A9gem=C3=A9rt=2E
------3CUGW2BUZTVZ2WIDP4SY4014O4SO7V
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Then please add signed-by headers=2E :)<br><br><br=
>Thanks<br><br><div class=3D"gmail_quote">2021=2E j=C3=BAlius 9=2E 10:59:54=
 CEST, Andrew Cooper &lt;andrew=2Ecooper3@citrix=2Ecom&gt; =C3=ADrta:<block=
quote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">On 09/07/2021 09:09, Richard Kojedzinszky wrote:<br>=
<br>Thankyou for the patch=2E&nbsp; That is quite an embarrassing bug=2E<br=
><br>However, for copyright reasons, we require all submissions to contain =
a<br>Signed-off-by line, as per the Developer's Certificate of Origin,<br><=
a href=3D"https://wiki=2Exenproject=2Eorg/wiki/Submitting_Xen_Project_Patch=
es#Signed-off-by">https://wiki=2Exenproject=2Eorg/wiki/Submitting_Xen_Proje=
ct_Patches#Signed-off-by</a><br><br>Given how trivial this patch is, feel f=
ree to just reply to this email<br>with confirmation and I can sort it out =
on commit=2E<br><br>However, for future patches, please include directly=2E=
&nbsp; (Also, if you are<br>able to use git-send-email, and the get_maintai=
ners=2Epl script, that<br>would be even better=2E)<br><br>~Andrew<br><br></=
pre></blockquote></div><br>-- <br>Ezt a levelet az Android k=C3=A9sz=C3=BCl=
=C3=A9kemr=C5=91l k=C3=BCldtem K-9 Mail-el=2E Eln=C3=A9z=C3=A9st a t=C3=B6m=
=C3=B6rs=C3=A9gem=C3=A9rt=2E</body></html>
------3CUGW2BUZTVZ2WIDP4SY4014O4SO7V--

