Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE874A511D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 22:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263302.455984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEdu7-0003HM-K3; Mon, 31 Jan 2022 21:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263302.455984; Mon, 31 Jan 2022 21:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEdu7-0003EO-H0; Mon, 31 Jan 2022 21:08:03 +0000
Received: by outflank-mailman (input) for mailman id 263302;
 Mon, 31 Jan 2022 21:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PC2d=SP=gmail.com=neilsikka@srs-se1.protection.inumbo.net>)
 id 1nEdu6-0003EI-03
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 21:08:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df26bd7d-82d9-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 22:08:00 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id l5so29346243edv.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jan 2022 13:08:00 -0800 (PST)
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
X-Inumbo-ID: df26bd7d-82d9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=iDWJ4nqpbl656bzRdWwuixMgWIkssWMC//fUAnNhWZU=;
        b=gUB8lPj2oGwhmgdl8yZVPQvg6irQVNQav0jZ4JzuCp5P9eLyZr5Wd7kTiEVNhBkBO2
         X6k7HLpJlkwHIL6Q1iCnA4S22YtqRyKeGpuLiv0b/LyEl94Ki2FcjT3nV1XztLJny9og
         MMNJEOytpCGeoPmtGXrU7lB0CAMWpfYWxwlKE1vcQIRQOg2yx6efVMY389VNToQwcHJo
         HecWA6mr1AP4DGwyndCLp5mL2eG+b3UmtPiobY1eyH7j2Gkw6aXxi84UhgWwqL8xBzY2
         lMPFHpbq8QSZS5eo8HFY1iC91bTATY3RoL6i/2/tamTqRH1W3JUIUwmBrCclSjx6Dfsu
         mvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iDWJ4nqpbl656bzRdWwuixMgWIkssWMC//fUAnNhWZU=;
        b=0WRRvBOsoQqidfAYO48spCRMn7BKOmTJgxbLThkfU7QJolQV62o7ukILyZg8mbqdl4
         O8fP9bDK6PCuhSpx6O/s5PVuijFKQI4yLqm9lc2WLXsmDP8eQITxeSaN/nQAi6VCUHKr
         bAG/YGAhhug4tZ0lM4W+m8qi2zUtEkfjCgOm59IVq5BkBoET6MJGKh3nv9U7n5gaHyhr
         ktz+l8ir2yPPxV5GUR7wI7KNBB3KEGfAYlKFZTnU03JtEp6bj52VtVRfG/HM5j6oVyou
         PQNkiHLku7HUN4qZMO3FrVt+unbsdgSh5pOM92uERhpMJPSdqp9z+ptfCMo7FdynGyCm
         w+gw==
X-Gm-Message-State: AOAM5302PMRaW69kKtU7omxfpGrSIv4OaTSovn+IYwpf6mPdPSveHcFw
	g9B2duIzomnSYebjjcGLTgOCp0IYavj0DHVu/kQbh3jsSsc=
X-Google-Smtp-Source: ABdhPJyP8oPSLvVvZR9HfR6d/gBuJcPPaBWB7/45eVglgy4AY1B76Ad8GHnemGYoRV2FRfkH0Qx6tTEyXX9BmeEu11I=
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr22553662edd.314.1643663279841;
 Mon, 31 Jan 2022 13:07:59 -0800 (PST)
MIME-Version: 1.0
From: Neil Sikka <neilsikka@gmail.com>
Date: Mon, 31 Jan 2022 16:07:48 -0500
Message-ID: <CAHPMNWccVJO+bkTBh=O67xV7hSPq7L1eyNQ3x0eYX0dKqMMh7A@mail.gmail.com>
Subject: OXenstored performance
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000ece5bf05d6e72d36"

--000000000000ece5bf05d6e72d36
Content-Type: text/plain; charset="UTF-8"

Hello,
I see oxenstored running at 100% CPU on a busy Xen host. This article (
https://xenproject.org/2014/05/01/9124/) says that the maximum number of
VMs supported by oxenstore is 160. What is the technical reason for this
limit? Doesn't the Xen hypervisor support more than 160 concurrent DomUs?

-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--000000000000ece5bf05d6e72d36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I see oxenstored=C2=A0running at 100% CPU on a =
busy Xen host. This article (<a href=3D"https://xenproject.org/2014/05/01/9=
124/">https://xenproject.org/2014/05/01/9124/</a>) says that the maximum nu=
mber of VMs supported by oxenstore is 160. What is the technical reason for=
 this limit? Doesn&#39;t the Xen hypervisor support more than 160 concurren=
t DomUs?<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div>My Blog: <a href=3D=
"http://www.neilscomputerblog.blogspot.com/" target=3D"_blank">http://www.n=
eilscomputerblog.blogspot.com/</a></div><div>Twitter: @neilsikka</div></div=
></div></div>

--000000000000ece5bf05d6e72d36--

