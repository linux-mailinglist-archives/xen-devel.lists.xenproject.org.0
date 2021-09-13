Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346CE40885F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 11:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185591.334297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPiOT-0005YN-Oq; Mon, 13 Sep 2021 09:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185591.334297; Mon, 13 Sep 2021 09:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPiOT-0005Vp-Lr; Mon, 13 Sep 2021 09:36:53 +0000
Received: by outflank-mailman (input) for mailman id 185591;
 Mon, 13 Sep 2021 09:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+8d=OD=gmail.com=ysaikiran1997@srs-us1.protection.inumbo.net>)
 id 1mPiOT-0005Vj-49
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 09:36:53 +0000
Received: from mail-yb1-xb33.google.com (unknown [2607:f8b0:4864:20::b33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e6a9516-1900-4625-849a-936c2f2f2b3b;
 Mon, 13 Sep 2021 09:36:52 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id z18so19183286ybg.8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Sep 2021 02:36:52 -0700 (PDT)
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
X-Inumbo-ID: 1e6a9516-1900-4625-849a-936c2f2f2b3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2BgUTmkSFrfNfDlgIjUV6hq1Z8OY6s5PO4dFMa0tY8=;
        b=R1pnkXEJcfYc+28FcQjiodepvoqAm2kgxDVaheyqwebTf3FjDDSIxcAyd0ADvE+KPX
         22VncIy/w2c/lOoZy7niOrzzSx9qkn7ZEKooQ9Y3e/+vGntWTTdXRGfgaUBMbfnYVVIc
         cZCj0SYuspUxnpvuDNPZ4vtnpvhAPviCL7uNVZ2S4H5NdzQBCJJCti1xk/gszGhwuc5Q
         fKLTRe3ToQgPHRL6BKCWVMUsjsrBZc93YAKEjd8Hj4zVfp3Fnn5RVturBii9El/GBCrC
         b7mwVRBq1ap7eH8tcYJdJry2c8UB/+oFfsAFrNylIEcc+t1EJeMH2yMoEl6tbPO0zCnC
         L+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2BgUTmkSFrfNfDlgIjUV6hq1Z8OY6s5PO4dFMa0tY8=;
        b=U/CJsdOCacWYd698of2ZtUYslSJpIBIeDkZMTPzQe881D9hycIIVgBmYN/mxtxMfLa
         /iFjcy8iRb5FDmF0QCOHIqO56K5kDsSeVt8vt0nf04vWtWnYj6Slcf33RpnEuumKVT7B
         D2vn7jG9GUGjCvtVbB2pE0Ag1Qzur/bprYN7aD6qhsbEl8UKd9a19d+NC8DdYWyM1W08
         +EPr0jJYTObZvyf8JvkaorRr3WjASdzIeanpMhHLn2tvmFBXtXRTN078NEMpfJZwgUgf
         B5vd4f5bL5JFcJZmMmRgGW4qvHc6lqGjlQP3dSdO6WoennVufQjnjvy1ocH5wa+yVOfI
         bAVQ==
X-Gm-Message-State: AOAM531FGGy0hCLiJSzGkJ4u/ezzfBLKgiECdOa3UW7v6GCDZvgf4GeX
	LM8UwnjhigiVpBLGjoATSdAk/3sqopd23Cxo+X0=
X-Google-Smtp-Source: ABdhPJy+nnQNBVJSZ2S1YKoRMLa7tn+xyYINMcU/0hMn54oN/NAK4IKQ4LxpufB3XjzInI8evLXofg83llKcxb87sTs=
X-Received: by 2002:a25:af07:: with SMTP id a7mr13941247ybh.329.1631525811540;
 Mon, 13 Sep 2021 02:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org>
In-Reply-To: <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org>
From: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
Date: Mon, 13 Sep 2021 15:06:40 +0530
Message-ID: <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
Subject: Re: Xen Booting Problem on ARM Machine
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, kannan@cimware.in
Content-Type: multipart/alternative; boundary="0000000000007057c005cbdd34db"

--0000000000007057c005cbdd34db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org> wrote:

>
>
> On 08/09/2021 11:43, Sai Kiran wrote:
> > Hello,
>
> Hi,
>
> Thank you for the report. Moving the discussion back to xen-devel
> because this looks like a potential issue in the UEFI stub in Xen.
>
> > I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.
>
> Would you be able to give more details on the Arm machine you are using?
> Also, are you using ACPI or DT to boot?
>

   Sai >> DT . ACPI configuration is disabled in Boot settings

>
> >  I
> > am able to do =E2=80=9Cmake world=E2=80=9D and =E2=80=9Cmake install=E2=
=80=9D, after =E2=80=9C./configure=E2=80=9D, as
> > specified in README file. When I reboot the system, I get the following
> > message:
> >
> > Warning: All 128 bootinfo mem banks exhausted.
> >
> > Warning: All 128 bootinfo mem banks exhausted.
>
> Hmmm... This means that you have more than 128 memory regions described
> in the EFI memory map. That's quite a lot.
>
> Although, this should be harmless as it means Xen will not use the extra
> memory banks.
>
> >
> > Cannot exit boot services: ErrCode: 0x8000000000000002
>
> This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT
> ExitBootServices() may sometime fails (I have CCed Jan may have more
> idea what's happening).
>
> Would you be able to provide more details on the UEFI firmware you are
> using? Is it EDK2 or U-boot?
>
> Sai >>  EDK2

> Also, do you know if Linux is boot on the same system?
>
> Sai >> Yes

> However, AFAICT, the error message would not prevent Xen to continue
> booting. So you may get stuck later in the boot process.
>
> My suggestion would be to enable earlyprintk for your platform. You can
> setup it up from the menuconfig in "Debugging Options".
>
Sai >> Yes, I have enabled earlyprintk.
I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256,
from 128. The error message is no longer seen, but the device is stuck in
the boot process.

> >
> > Here is the snapshot of the error.
>
> Please avoid posting image on the ML. Instead, if you need to do it, you
> can upload on a web server and provide the URL.
>
> Best regards,
>
> --
> Julien Grall
>

--0000000000007057c005cbdd34db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2021 at 7:30 PM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 08/09/2021 11:43, Sai Kiran wrote:<br>
&gt; Hello,<br>
<br>
Hi,<br>
<br>
Thank you for the report. Moving the discussion back to xen-devel <br>
because this looks like a potential issue in the UEFI stub in Xen.<br>
<br>
&gt; I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.<b=
r>
<br>
Would you be able to give more details on the Arm machine you are using? <b=
r>
Also, are you using ACPI or DT to boot?<br></blockquote><div><br></div><div=
>=C2=A0 =C2=A0Sai &gt;&gt; DT . ACPI configuration is disabled in Boot sett=
ings=C2=A0 =C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt;=C2=A0 I <br>
&gt; am able to do =E2=80=9Cmake world=E2=80=9D and =E2=80=9Cmake install=
=E2=80=9D, after =E2=80=9C./configure=E2=80=9D, as <br>
&gt; specified in README file. When I reboot the system, I get the followin=
g <br>
&gt; message:<br>
&gt; <br>
&gt; Warning: All 128 bootinfo mem banks exhausted.<br>
&gt; <br>
&gt; Warning: All 128 bootinfo mem banks exhausted.<br>
<br>
Hmmm... This means that you have more than 128 memory regions described <br=
>
in the EFI memory map. That&#39;s quite a lot.<br>
<br>
Although, this should be harmless as it means Xen will not use the extra <b=
r>
memory banks.<br>
<br>
&gt; <br>
&gt; Cannot exit boot services: ErrCode: 0x8000000000000002<br>
<br>
This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT <br>
ExitBootServices() may sometime fails (I have CCed Jan may have more <br>
idea what&#39;s happening).<br>
<br>
Would you be able to provide more details on the UEFI firmware you are <br>
using? Is it EDK2 or U-boot?<br>
<br></blockquote><div>Sai &gt;&gt;=C2=A0 EDK2=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Also, do you know if Linux is boot on the same system?<br>
<br></blockquote><div>Sai &gt;&gt; Yes=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
However, AFAICT, the error message would not prevent Xen to continue <br>
booting. So you may get stuck later in the boot process.<br>
<br>
My suggestion would be to enable earlyprintk for your platform. You can <br=
>
setup it up from the menuconfig in &quot;Debugging Options&quot;.<br></bloc=
kquote><div>Sai &gt;&gt; Yes, I have enabled earlyprintk.</div><div>I tried=
 changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 1=
28. The error message is no longer seen, but the device is stuck in the boo=
t process.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Here is the snapshot of the error.<br>
<br>
Please avoid posting image on the ML. Instead, if you need to do it, you <b=
r>
can upload on a web server and provide the URL.<br>
<br>
Best regards,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--0000000000007057c005cbdd34db--

