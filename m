Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F025F2922FB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8611.23088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPdF-0006n3-5Z; Mon, 19 Oct 2020 07:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8611.23088; Mon, 19 Oct 2020 07:31:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPdF-0006me-28; Mon, 19 Oct 2020 07:31:01 +0000
Received: by outflank-mailman (input) for mailman id 8611;
 Mon, 19 Oct 2020 07:30:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUPdC-0006mV-Sl
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:30:58 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694a70b5-7173-494f-afe6-49879c748879;
 Mon, 19 Oct 2020 07:30:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so10182132wrq.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:30:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c130sm15061465wma.17.2020.10.19.00.30.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 00:30:56 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CSGA=D2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUPdC-0006mV-Sl
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:30:58 +0000
X-Inumbo-ID: 694a70b5-7173-494f-afe6-49879c748879
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 694a70b5-7173-494f-afe6-49879c748879;
	Mon, 19 Oct 2020 07:30:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so10182132wrq.2
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=3UaDZvd2RGQZ+R4RoT1ZOULGUmWOFiVK7Le4dLFx6ew=;
        b=PNspJM3/4DX0AgPfRv3za0iK/HDPq+1VrPjU24WxPIfpRhRYINDr32iVT2h3dGlVA4
         cpCMhVKgiqzFjxBK4o0CWNjTdeExnt+1/BZPewr3C3bSdkltiaE457b4DXFxRNfZq7zZ
         XHcbVoeAkZjheFyynDiD3+CW51cmFDCyiDsOmjxPiUj8HOYLl2QV8c/4i0K/37AzMVoI
         lRwWG52Fl/xKpq1cRA3KgceACx1Pgut9lHleo1WTKwTTs2hmAPgKVkv5/wXoELEVD76m
         w1SFwRrSE2Sy5BrLKVfqJIVg3lwupmTJgy5OP37FohDkTaE5hopJA3MrgGjbIAnSP4xH
         7eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=3UaDZvd2RGQZ+R4RoT1ZOULGUmWOFiVK7Le4dLFx6ew=;
        b=DCio7H8LHVTs+0xOzUUtMOKGa/yw2PVtaN0tjqhzupb7ppInslQj8zrwy+xX/7fnpl
         hWxLAvm0ogbJYBnaj+PGu4Wndu+I2s/VPghPhm+hjAjeOjsGqY5MgfXLdLWydgGTBaD+
         WEyJbEJBnltIM811pE9yMARbQMIZhgP1aZrhwRxjVBgrdcamRdcahwrgn3wyhu2ZLmw7
         Z50otAjPT1m/98rE/9oraxg1hNa6ZVy9hIwJTWe1K8/dqFke7SewBkuFJCuBcJA5I0q8
         BQnw6WuYfw21DxVU3SvHzOIU0C/QST5kbjIYUFkCSTXw1H6dpGLOvR9olvIyD01qXYoH
         cQvg==
X-Gm-Message-State: AOAM531BmI8UEu2XzVmzXHxTaMVPeAwmpovJRfbw+J7N9P/yEuljsdAO
	VxEPoC5GbHXXJzh5aiWOUOI=
X-Google-Smtp-Source: ABdhPJzAUvEkPsz1TKSyh41TsRpeAIW378YBambYEUCQvhRO6hg9ydpoN8IyhzXe5sBEFx6HJTesmA==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr17847067wrr.131.1603092657195;
        Mon, 19 Oct 2020 00:30:57 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id c130sm15061465wma.17.2020.10.19.00.30.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 00:30:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20201005094905.2929-1-paul@xen.org> <20201005094905.2929-4-paul@xen.org> <471c9800-2ff0-d180-0840-e29dee4d3b4f@xen.org>
In-Reply-To: <471c9800-2ff0-d180-0840-e29dee4d3b4f@xen.org>
Subject: RE: [PATCH 3/5] libxl / iommu / domctl: introduce XEN_DOMCTL_IOMMU_SET_ALLOCATION...
Date: Mon, 19 Oct 2020 08:30:55 +0100
Message-ID: <002c01d6a5e9$c8a778f0$59f66ad0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH+ubxU5MmdI1NaD6dn626TcODZdgKhLAozArQHbBSpI7R0MA==
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 16 October 2020 16:55
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson =
<iwj@xenproject.org>; Wei Liu <wl@xen.org>; Andrew
> Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Anthony PERARD
> <anthony.perard@citrix.com>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>
> Subject: Re: [PATCH 3/5] libxl / iommu / domctl: introduce =
XEN_DOMCTL_IOMMU_SET_ALLOCATION...
>=20
> Hi Paul,
>=20
> On 05/10/2020 10:49, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ... sub-operation of XEN_DOMCTL_iommu_ctl.
> >
> > This patch adds a new sub-operation into the domctl. The code in =
iommu_ctl()
> > is extended to call a new arch-specific iommu_set_allocation() =
function which
> > will be called with the IOMMU page-table overhead (in 4k pages) in =
response
>=20
> Why 4KB? Wouldn't it be better to use the hypervisor page size =
instead?
>=20

I think I'll follow the shadow/hap code more closely and just pass a =
value in MB, then any issue with page size is left inside Xen.

> > diff --git a/xen/include/public/domctl.h =
b/xen/include/public/domctl.h
> > index 75e855625a..6402678838 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1138,8 +1138,16 @@ struct xen_domctl_vuart_op {
> >
> >   #define XEN_DOMCTL_IOMMU_INVALID 0
> >
> > +#define XEN_DOMCTL_IOMMU_SET_ALLOCATION 1
> > +struct xen_domctl_iommu_set_allocation {
> > +    uint32_t nr_pages;
>=20
> Shouldn't this be a 64-bit value?

If I pass the value in MB then 32-bits will cover it, I think. I do need =
to add padding though.

  Paul

>=20
> Cheers,
>=20
> --
> Julien Grall


