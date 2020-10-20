Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC77293948
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9075.24396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUp25-0006Xk-RJ; Tue, 20 Oct 2020 10:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9075.24396; Tue, 20 Oct 2020 10:38:21 +0000
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
	id 1kUp25-0006XL-No; Tue, 20 Oct 2020 10:38:21 +0000
Received: by outflank-mailman (input) for mailman id 9075;
 Tue, 20 Oct 2020 10:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUp24-0006XG-Ei
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:38:20 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a962fe0b-e350-4eeb-8372-77b2799decca;
 Tue, 20 Oct 2020 10:38:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t21so1296068eds.6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:38:19 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id g9sm1887628edv.81.2020.10.20.03.38.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 03:38:17 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUp24-0006XG-Ei
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:38:20 +0000
X-Inumbo-ID: a962fe0b-e350-4eeb-8372-77b2799decca
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a962fe0b-e350-4eeb-8372-77b2799decca;
	Tue, 20 Oct 2020 10:38:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t21so1296068eds.6
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=j3qlUyBmKXWhPcO4B44JdevayqvreT7vzraRFkngAJM=;
        b=lr9eO/yjwgM2j9hlfCDgaFQydxTjPObKYevUXLK7IGV2bGTQixUZGWB7b/ZDuv22vY
         Ew2VdHB1hIBg+6HGUwE63YnISNfixEIxAJkDHWi6LBfCCE+Pjt/uU0NTuYArFWPdRyfC
         tkYz67XVaYH0POhHSqogZggo2VYotO8GPEpyKCwSP0T67+RELAT6MZV6U56Xz7dQ7n/v
         rI2W9PqOKtqhICedoXaNuEDB+dWLclml8JaEMJsvlrrUHDlXC1WGg8Z871jy6civBQS6
         blAfXq7LcTvX01dpn/xztsx6ZxS+0mDqcolq8m8ZjwXAiR4w1BWDsT2jZue0tM/jYJaj
         cMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=j3qlUyBmKXWhPcO4B44JdevayqvreT7vzraRFkngAJM=;
        b=KM2FWv3M7FxbSe+OSmxR52cgWByEpMj5+wlSAKkDFDO2MHALXbp/LZQpv85+vZ6rr/
         yTc5fC1BuflPnUSoV7q7ugrJYrvvbQ0Fd/Ek0TrnK4wLedzwK18yL0Z/miOxIA/A0A+y
         h/aVcd/iwvc2g1RFwnQRWqBbZI6klwK7t8Qzm6uXryfji3cd4qeK9hOZOqUYx1j9lwgR
         qdwcJw1m2GLdtMx24MYJrMn2cxNNCDt4mIBivl6AqnbkyrgsGojCfcGTCHVQiy6H/nzm
         4GSQ1GzE6b67G3MzkxFVgwwkS6P4GMmcGntrzNIWWaeEkKikJKFcJrr/SQf3O1saYn4o
         h0kg==
X-Gm-Message-State: AOAM532qJAcE6dBDWFon8K553F7X7RmelLRD6Vld8sz8O+On8+/iDRq6
	Did7nRewaruN4mXJ9+bPFfc=
X-Google-Smtp-Source: ABdhPJzWTlmfDDy3ot2+SujuF15GMmeKMUhcZqFEXGfgSfHdN0gxL1nfWIAH0in6xFaAQIVu8jMtxA==
X-Received: by 2002:a05:6402:22cb:: with SMTP id dm11mr2100443edb.23.1603190298332;
        Tue, 20 Oct 2020 03:38:18 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
        by smtp.gmail.com with ESMTPSA id g9sm1887628edv.81.2020.10.20.03.38.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 03:38:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-5-git-send-email-olekstysh@gmail.com> <004701d6a6c1$6c09f860$441de920$@xen.org> <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
In-Reply-To: <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
Subject: RE: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
Date: Tue, 20 Oct 2020 11:38:15 +0100
Message-ID: <004a01d6a6cd$1f4684b0$5dd38e10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAG4T9I6AbhrsZgB8lcTCapNMgiw
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 20 October 2020 11:05
> To: paul@xen.org
> Cc: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>; =
xen-devel@lists.xenproject.org; 'Oleksandr
> Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'Roger Pau
> Monn=C3=A9' <roger.pau@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Julien =
Grall' <julien@xen.org>; 'Stefano
> Stabellini' <sstabellini@kernel.org>; 'Julien Grall' =
<julien.grall@arm.com>
> Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the =
handle_mmio()
>=20
> On 20.10.2020 11:14, Paul Durrant wrote:
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Oleksandr Tyshchenko
> >> Sent: 15 October 2020 17:44
> >>
> >> --- a/xen/include/asm-x86/hvm/ioreq.h
> >> +++ b/xen/include/asm-x86/hvm/ioreq.h
> >> @@ -181,6 +181,8 @@ static inline bool =
arch_hvm_ioreq_destroy(struct domain *d)
> >>  #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
> >>  #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
> >>
> >> +#define ioreq_complete_mmio   handle_mmio
> >> +
> >
> > A #define? Really? Can we not have a static inline?
>=20
> I guess this would require further shuffling: handle_mmio() is
> an inline function in hvm/emulate.h, and hvm/ioreq.h has no
> need to include the former (and imo it also shouldn't have).
>=20

I see. I think we need an x86 ioreq.c anyway, to deal with the legacy =
use of magic pages, so it could be dealt with there instead.

  Paul

> Jan


