Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D19584621
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 21:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377040.610111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH8k2-0004n1-7Z; Thu, 28 Jul 2022 19:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377040.610111; Thu, 28 Jul 2022 19:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH8k2-0004jw-4R; Thu, 28 Jul 2022 19:00:14 +0000
Received: by outflank-mailman (input) for mailman id 377040;
 Thu, 28 Jul 2022 19:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oH8k0-0004jq-DR
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 19:00:12 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e5b8ba-0ea7-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 21:00:11 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id g12so2694012pfb.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 12:00:11 -0700 (PDT)
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
X-Inumbo-ID: 80e5b8ba-0ea7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GSO0e+K/595xy9Bblk5pFyUK2CqoEV+q1TQVPsYLSZk=;
        b=XyG+Uu2v7ec9cgbFi6RizyeUBw6R9gIRURjVrQjXfJmUFP8mv5VHBKBSQssjTHqYDo
         ZkRFiq/DIm7dbIO0VJ4WXtfnAmLqx7lUQ9Nxl0rG0ycdGbzZ707FH5auak9yFpDowswf
         I070SNNnnfB9DL5aZr3fhHvIhWGow3w04uKKDKBFMcKsZpRgSlQ/qpD2ljCs5IWNFGet
         SZTlSPGycXimPM6mW5NvahZv1JDXDoPfd41csuoa5qHoA0IlTX/6LFoeMVMWBndDc1/y
         lK9y6uuMgJBEHfaOzLWWRWGC73urB5USsBoFJJDXIpjiaNykbPJyWJjK60pY1MfBWExe
         99iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GSO0e+K/595xy9Bblk5pFyUK2CqoEV+q1TQVPsYLSZk=;
        b=ZwlTIoKTLKc7nrG2FpzLGwj1XNH5xfI9NfTXKv/A0b1/8MUBpTE7SQoS5E1iV7nPWm
         4+5Jhj+0oVEc7Qq9ru8cy4JNCyY/BYG3UMKbAP9ilVEB0KYcuWKh8I4Ho9aKmoleApkI
         rGOk7+NjlJd7UiftqHYMrRrQP8h23JdtFZ0E7jvAzyMnk3c8U98ZFbRWTBo43YTZXDcD
         ulw2X0heiHqq7Xzg+DA7wxdYGxH4FNFSHci/vc/38TO+itDdrx9WDjjHF1ZeQ3YuOABT
         Jc+C9Otdzf0iJAvL0WbeJNMVspGcMEWh4wlBy0NCeG2Jct+VA463VVrKc+A2cjdY+RWO
         oDeQ==
X-Gm-Message-State: AJIora80j0ryPD4KXemDdf+XSh8c2aFTMD01qAHHSsQ6uYOuGs4xFQaM
	ow+Zu1UMhLvcepwNAPDP1SQ0tpDQD4lZ5ae7q7k=
X-Google-Smtp-Source: AGRyM1si9Hsm9KLkrtmLWsEkTPmJF6TfVJs8WGCFRk+s/vbndn/gRzz98S+O+vLHJdO6MvLpQVtyCmgMGoxU1VSLBFI=
X-Received: by 2002:a63:f74e:0:b0:41a:716c:bfc4 with SMTP id
 f14-20020a63f74e000000b0041a716cbfc4mr157561pgk.14.1659034809655; Thu, 28 Jul
 2022 12:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <540d44a5-6966-a9d7-4e62-63ae845c6f62@epam.com>
 <20220716163745.28712-1-olekstysh@gmail.com> <15aebc64-aa2d-235c-fec0-e83b6fde3113@xen.org>
In-Reply-To: <15aebc64-aa2d-235c-fec0-e83b6fde3113@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 28 Jul 2022 21:59:58 +0300
Message-ID: <CAPD2p-nmTadz=+vswTmJRXftUB00j_W_RtLybXA7=BNfdy6evw@mail.gmail.com>
Subject: Re: [PATCH V11.1 1/3] libxl: Add support for Virtio disk configuration
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007fe7db05e4e224c4"

--0000000000007fe7db05e4e224c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3., 21:28 Julien Grall <juli=
en@xen.org>:

> Hi Oleksandr,
>


Hello Julien

(sorry for the possible format issues)


> On 16/07/2022 17:37, Oleksandr Tyshchenko wrote:
> > Changes V10.1 -> V11:
> >     - Anthony already gave his Reviewed-by, I dropped it due to the
> changes
> >     - George already gave his Acked-by, I dropped it due to the changes
> >     - s/other/standalone for the backendtype
>
> As discussed with Andrew on IRC, the golang changes are autogenerated.
> So I have kept George's acked-by and committed the series.
>


Thank you very much!


> Cheers,
>
> --
> Julien Grall
>

--0000000000007fe7db05e4e224c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 28 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3., 21:=
28 Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt=
;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Oleksandr,<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Hello Julien</div><div dir=3D"auto"><br></div><div dir=3D"auto">(=
sorry for the possible format issues)</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On 16/07/2022 17:37, Oleksandr Tyshchenko wrote:<br>
&gt; Changes V10.1 -&gt; V11:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Anthony already gave his Reviewed-by, I dropped i=
t due to the changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0- George already gave his Acked-by, I dropped it du=
e to the changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0- s/other/standalone for the backendtype<br>
<br>
As discussed with Andrew on IRC, the golang changes are autogenerated. <br>
So I have kept George&#39;s acked-by and committed the series.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thank you very much!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div></div>

--0000000000007fe7db05e4e224c4--

