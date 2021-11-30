Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD705462D7D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 08:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234876.407579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxYw-0003zG-MI; Tue, 30 Nov 2021 07:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234876.407579; Tue, 30 Nov 2021 07:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxYw-0003x3-It; Tue, 30 Nov 2021 07:28:26 +0000
Received: by outflank-mailman (input) for mailman id 234876;
 Tue, 30 Nov 2021 07:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MWZz=QR=cimware.in=skiran@srs-se1.protection.inumbo.net>)
 id 1mrxYv-0003wx-Er
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 07:28:25 +0000
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e10a1b-51af-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 08:28:24 +0100 (CET)
Received: by mail-io1-xd32.google.com with SMTP id y16so24783445ioc.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 23:28:24 -0800 (PST)
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
X-Inumbo-ID: 19e10a1b-51af-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cimware-in.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SfUuYInbuzXZWRFqsUC+UXmEet/I00ezr6N7lOWjZjo=;
        b=7apLFUFa3mU9+R4FITtZwzeQTt4tDts3VLPUUQJsuQ8tNbEFZSfmeOFNcUjEuepcoR
         wPiAbWihrAsDA7pV5ftv1tCGk7+qT6wmDW0tqV/5xfnM8LYmhY2O/9wfYj1NGqpC18dv
         AmkR6rlT1j3Y85Tw79bFFWnh3QIdL+E7vzbjA+/WtdwlytLLlh2qAPjSMobRZb8YgNWT
         1K8Tspf6hh4C08S/SRXqflJw7+m0Qwn3QlkHAwWSzhgNIsX91R9noAAp2DdpLC6qAR91
         16JxuST7IuDSPMp1m7NAP0Jr2PL/SNPRHjViTxiEagspto2pr/6G3DjCALt7kodag1fz
         2cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SfUuYInbuzXZWRFqsUC+UXmEet/I00ezr6N7lOWjZjo=;
        b=m10IO6N7gOC1fNEoZmwWYLlG3gbCeNMRce4Y87C4z8WdExpa39Zg9ks9Pr/7Bg1Ysy
         Rk0Y0t4UZnFN1IFlp6quQwW+QWsGFIP7mOfhzhDSx8+kqvuiN2N2dJh03vXLswZ5HwXx
         tdnMWu0PuTyVoeXugOaeOtzqisddG7HqCpnjLb0Yd/f9zhA8TeC82m6Jj5XgZnoNofuF
         8IOpviqARv+13ioE9f0GKLQXa+QOJuziAr0C1HAW967TgXR7prtBCCTx8CjTk8cVPhQ0
         qwFAqI0EMQYs5Y56fhNeLGCNjm2i4xy36OzD0Ctc5N5LD9lXOQu0DDdsQdzgvLBSvzam
         eBgg==
X-Gm-Message-State: AOAM5326U7XQnbgaoK1GCAAvETEZSAAf6hX2h7gDsV1cd9EwCQPEK1ix
	wr/HN4GimDdXzRhrINidpY+0yWFDuUCknf3750t9I0jviw==
X-Google-Smtp-Source: ABdhPJynBvtJ2/GXsbJUbRJ5CuNK7uxumA6Gn7Bhpksni2yReKVC6buhhNa828r4x5NfcBxmaOVmnZDcn5aPdN2TQzw=
X-Received: by 2002:a05:6638:3a4:: with SMTP id z4mr72565878jap.76.1638257303289;
 Mon, 29 Nov 2021 23:28:23 -0800 (PST)
MIME-Version: 1.0
References: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
 <e421fc4b-afde-8bdc-9be0-859523512b9b@suse.com>
In-Reply-To: <e421fc4b-afde-8bdc-9be0-859523512b9b@suse.com>
From: Sai Kiran Kumar Reddy <skiran@cimware.in>
Date: Tue, 30 Nov 2021 12:58:12 +0530
Message-ID: <CAAQMfLrxpc=6L_mp_EuPq-B+EydrFGaVqb_MiyjELPQYXi0e=g@mail.gmail.com>
Subject: Re: Xen on LFS
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009d12b005d1fc8069"

--0000000000009d12b005d1fc8069
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the reply. Will do that.

On Tue, Nov 30, 2021 at 12:52 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:
> > I am Sai Kiran. I am currently working on installing xen on Linux From
> > Scratch(LFS) system. One of the dependencies of xen is "xorg" package.
> This
> > package is present in Beyond
> > <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html> Linux From
> > Scratch(BLFS) <
> https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>
> > manual. But, there are a lot of packages to be installed. I am not sure
> if
> > all these packages are required for Xen. Also, is xorg a must, to build
> and
> > install xen?
> >
> > Kindly help me out here. Thanks in advance, for the support.
>
> Thanks for your interest, but I'm afraid your question isn't fitting
> xen-devel.
> Please raise it on xen-users.
>
> Jan
>
>

--0000000000009d12b005d1fc8069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks for the reply. Will do that.<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30,=
 2021 at 12:52 PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeu=
lich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:<br>
&gt; I am Sai Kiran. I am currently working on installing xen on Linux From=
<br>
&gt; Scratch(LFS) system. One of the dependencies of xen is &quot;xorg&quot=
; package. This<br>
&gt; package is present in Beyond<br>
&gt; &lt;<a href=3D"https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.linuxfromscratch.org=
/blfs/view/svn/x/xorg7.html</a>&gt; Linux From<br>
&gt; Scratch(BLFS) &lt;<a href=3D"https://www.linuxfromscratch.org/blfs/vie=
w/svn/x/xorg7.html" rel=3D"noreferrer" target=3D"_blank">https://www.linuxf=
romscratch.org/blfs/view/svn/x/xorg7.html</a>&gt;<br>
&gt; manual. But, there are a lot of packages to be installed. I am not sur=
e if<br>
&gt; all these packages are required for Xen. Also, is xorg a must, to buil=
d and<br>
&gt; install xen?<br>
&gt; <br>
&gt; Kindly help me out here. Thanks in advance, for the support.<br>
<br>
Thanks for your interest, but I&#39;m afraid your question isn&#39;t fittin=
g xen-devel.<br>
Please raise it on xen-users.<br>
<br>
Jan<br>
<br>
</blockquote></div>

--0000000000009d12b005d1fc8069--

