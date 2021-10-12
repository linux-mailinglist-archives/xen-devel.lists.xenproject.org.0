Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B642A71A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207278.363049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIgd-0000Yf-0I; Tue, 12 Oct 2021 14:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207278.363049; Tue, 12 Oct 2021 14:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIgc-0000Vb-TE; Tue, 12 Oct 2021 14:23:22 +0000
Received: by outflank-mailman (input) for mailman id 207278;
 Tue, 12 Oct 2021 14:23:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2oI=PA=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1maIga-0000VT-MB
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:23:20 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfac3e54-a5a3-4c79-85e8-5dd6bff9a7d8;
 Tue, 12 Oct 2021 14:23:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y15so88483043lfk.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 07:23:19 -0700 (PDT)
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
X-Inumbo-ID: bfac3e54-a5a3-4c79-85e8-5dd6bff9a7d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ct4m37rxCiZlZTpZjjg9zCs/ZaOobzFpJHx7onj7Shc=;
        b=IOttjUkcdv39ZC0AVC0HdqEg0oHaJf+JfXfz2HD2BNODJoesqjS75WvDAWtgB/wFsU
         nMzfW+6ud7+HBZKKPDHVgqvHjMD9d/+YoM6BOV3wtnRgpII+M3Ch49cPPVAWAcwaiFe+
         urfsVC+JquLDU35+5FG52FaLONO1i+07f5RjftwLTGDnEKBpyjRK+3RWwZlJPOzUK+jb
         3KCoqZSAYKkLYaE0e6A8sbx2A96z0VwwVK5T66bjQbT/FhIFldlFFRpPYDn5uIbpWWPo
         sCtHHLowGVaTAnT8wpzbHW/CeSw520KMKjXVubWtPx7BKt7ho2gqsGGnDN+PziN854X2
         J3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ct4m37rxCiZlZTpZjjg9zCs/ZaOobzFpJHx7onj7Shc=;
        b=wYMe9r7grOiPQKHPFfraqIbImmbXC9efmcPCYbiuppbXu+tfUay/Eox/pOYQMeGiKB
         GaI/nr9Wrqw13TRn66cXV95tfo64fVEBs5AtiBDdp1ZmsvvGplRMt/qfIFitsFD+M0bM
         g6/CeBB7WmwVAPKjgQ2Ocm+BbmAgIwBw0sg6aHmHClN/CFftp8ShtozjNf5lEeoymkHO
         Hj3GDK6/ZmV+kBXerFvA5lzoQJdtkdC4KxVBJMMq8axaewvLoGA6Yy/Fx/JlOhVLHb34
         InOEPjAa76J0csGeP9Ch8J1rRbFLKM33d4osikCNrrPR0g/0T5NtxmVUMOFzbew/B2w9
         VMQQ==
X-Gm-Message-State: AOAM532wgzPhS+suVIcV5BooGpxO6RkTN6VEXuiIi4QWTCzK0TOxqjMA
	EHDzzLul1iZUxsp3cOptsxXM0sdKhhTiDBVloUU=
X-Google-Smtp-Source: ABdhPJxnHoyZKaY+ELcqvbRVw+32P7kWeZ79yogq8t+sqUa/nhI5uzLbLUjsq4mk2TNxG98V+VdCLQsMwaAS1VmbcI4=
X-Received: by 2002:a2e:8099:: with SMTP id i25mr18024414ljg.277.1634048598802;
 Tue, 12 Oct 2021 07:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633106362.git.roman_skakun@epam.com> <CADu_u-PVqHc6RQ4JTpkrmNap+QxEh7=0Mu2xsiAjOty3J5hKjQ@mail.gmail.com>
 <243d4615-fb29-6be0-eef9-c892cb56f8bc@xen.org>
In-Reply-To: <243d4615-fb29-6be0-eef9-c892cb56f8bc@xen.org>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Tue, 12 Oct 2021 17:23:08 +0300
Message-ID: <CADu_u-OE2ZoB6vPDwayRyBV+03szTx7Ah84GWLeQeSEGvCbjpQ@mail.gmail.com>
Subject: Re: [RFC 0/1] tag IOMMU-protected devices in Dom0 fdt
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Roman Skakun <roman_skakun@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>, Roman Skakun <rm.skakun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood.
Thank you!

=D0=B2=D1=82, 12 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:20, Julien Gral=
l <julien@xen.org>:
>
>
>
> On 12/10/2021 15:11, Roman Skakun wrote:
> > Hi,
>
> Hi Roman,
>
> > Would you be so kind to look at my patches, it would help me to
> > know exactly whether I'm moving correctly and whether I've chosen
> > the right path?
>
> This is in my queue to review. At the moment, I am prioritizing work
> targeting 4.16. Unfortunately, this RFC was posted after the last
> posting date. So I will review it after the feature freeze.
>
> Best regards,
>
> --
> Julien Grall



--=20
Best Regards, Roman.

