Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD42B7D9C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 13:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29800.59477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMaS-000082-Bh; Wed, 18 Nov 2020 12:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29800.59477; Wed, 18 Nov 2020 12:29:24 +0000
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
	id 1kfMaS-00007d-8Q; Wed, 18 Nov 2020 12:29:24 +0000
Received: by outflank-mailman (input) for mailman id 29800;
 Wed, 18 Nov 2020 12:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWMM=EY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfMaQ-00006j-Iy
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:29:22 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 152eb89c-3e99-4d2b-af0c-7ce439501a6e;
 Wed, 18 Nov 2020 12:29:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u12so2087732wrt.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 04:29:21 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id v189sm3989075wmg.14.2020.11.18.04.29.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:29:20 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BWMM=EY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfMaQ-00006j-Iy
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:29:22 +0000
X-Inumbo-ID: 152eb89c-3e99-4d2b-af0c-7ce439501a6e
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 152eb89c-3e99-4d2b-af0c-7ce439501a6e;
	Wed, 18 Nov 2020 12:29:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u12so2087732wrt.0
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 04:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=a7q5y5kwEhcoxThrF6U+u43rpWzWheQIW/yaAeO7GWk=;
        b=Y03YSM6VsBDbA8isiYP2X7gNhTUXsgwisKUzu/AFjfWh8SOPdW9BFDUg17Ow2z9BUE
         9mPjR+fx1oFvOA+ltrdad44VmfDZVodl1zNibG0PVADnh18Dih3/fOnLkazqJRC9faUa
         TAjdlcUKYeifjYg48KeDjPOWmoGPXIR0og1UtaGZA/uRTQg1bRHdve61/8xcCMdtRrSK
         3Oea7OrS0tvK0QWszCaAN13MVQIh834b7iK3gRgy17+fKjm1CxxLCMAA86SUI86e3NWp
         j7xx1FDt0+bfzhMfmE+GcSRJPVkR31d4I4y2n7UfMM34k5m8KRWFK4xIJ6979QVIbeb7
         oLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=a7q5y5kwEhcoxThrF6U+u43rpWzWheQIW/yaAeO7GWk=;
        b=tPxW3FVehEK54vDa9+i6CsGt2BV0M5MtroeDwzgecMyY2gH11stU00KIbUHOZnyIrz
         WNb+A68CczBJlfvKI6dzxoU8oxDK3yWGfXXjnlWseVq6o549UaA/6tlkADrWQCQ6r6Wh
         oZZyuuVLbor/WbBTRglKJlLqgYzb+i1zWmqfzD2y4LIJ61W5l3qkZczMoU/pLnCmzCTc
         OWdbhwubLR+fY7ZuzfDjgBKYUR8Fet8Xeu9qTxdgDFy1VVSQqRGMbplzJo+T3dvdXPFa
         xpgw/x8+Ow6cSJosfOxuFzsA+pDKiaiselI4INH2De71daeZuztf1jHvaNComhbpBmjk
         3BaQ==
X-Gm-Message-State: AOAM5331AxjGXgFuCHJkevVKm4MFqwbx/mMint4mfAvTJRhZZvNNXoRf
	UsD6Wh6YlWvjS6hoZfW4bVs=
X-Google-Smtp-Source: ABdhPJz9jKDbFhsLf/E2gE9cy8bgu/f44QQZAaG7eBduyPPsBCYoA8OOtC7WLNOWbp969e8uD6+ZKw==
X-Received: by 2002:adf:ffc9:: with SMTP id x9mr4667501wrs.148.1605702560655;
        Wed, 18 Nov 2020 04:29:20 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id v189sm3989075wmg.14.2020.11.18.04.29.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 04:29:20 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-8-git-send-email-olekstysh@gmail.com> <79588865-3f28-5436-0763-cb8ee0b87262@gmail.com>
In-Reply-To: <79588865-3f28-5436-0763-cb8ee0b87262@gmail.com>
Subject: RE: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) to struct domain
Date: Wed, 18 Nov 2020 12:29:19 -0000
Message-ID: <00b101d6bda6$7055f2b0$5101d810$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAHOAtspAs5yhsWqgRnfwA==

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 18 November 2020 12:09
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano =
Stabellini <sstabellini@kernel.org>;
> Julien Grall <julien.grall@arm.com>
> Subject: Re: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) =
to struct domain
>=20
>=20
> Hi Paul.
>=20
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -314,6 +314,8 @@ struct sched_unit {
> >
> >   struct evtchn_port_ops;
> >
> > +#define MAX_NR_IOREQ_SERVERS 8
> > +
> >   struct domain
> >   {
> >       domid_t          domain_id;
> > @@ -521,6 +523,21 @@ struct domain
> >       /* Argo interdomain communication support */
> >       struct argo_domain *argo;
> >   #endif
> > +
> > +#ifdef CONFIG_IOREQ_SERVER
> > +    /* Guest page range used for non-default ioreq servers */
> > +    struct {
> > +        unsigned long base;
> > +        unsigned long mask;
> > +        unsigned long legacy_mask; /* indexed by HVM param number =
*/
> > +    } ioreq_gfn;
>=20
> I assume the whole ioreq_gfn struct doesn't need to be here. According
> to the new requirement to leave legacy interface x86 specific,
>=20
> these fields won't be used in common code anymore. I will move =
ioreq_gfn
> struct back to hvm_domain. Please confirm.

Yes, leave it where it is in struct hvm_domain.

  Paul

>=20
>=20
> > +
> > +    /* Lock protects all other values in the sub-struct and the =
default */
> > +    struct {
> > +        spinlock_t              lock;
> > +        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
> > +    } ioreq_server;
> > +#endif
> >   };
> >
> >   static inline struct page_list_head *page_to_list(
>=20
> --
> Regards,
>=20
> Oleksandr Tyshchenko



