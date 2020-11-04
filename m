Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835902A6107
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18987.44160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFZt-0003X9-Aw; Wed, 04 Nov 2020 09:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18987.44160; Wed, 04 Nov 2020 09:59:41 +0000
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
	id 1kaFZt-0003Wk-7n; Wed, 04 Nov 2020 09:59:41 +0000
Received: by outflank-mailman (input) for mailman id 18987;
 Wed, 04 Nov 2020 09:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAD3=EK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kaFZr-0003Wf-8T
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:59:39 +0000
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e9bf3eb-cd1b-4b86-a911-4f0d4accc5e0;
 Wed, 04 Nov 2020 09:59:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k18so1721128wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:59:38 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id f17sm1527673wmh.10.2020.11.04.01.59.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Nov 2020 01:59:36 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WAD3=EK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kaFZr-0003Wf-8T
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:59:39 +0000
X-Inumbo-ID: 7e9bf3eb-cd1b-4b86-a911-4f0d4accc5e0
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7e9bf3eb-cd1b-4b86-a911-4f0d4accc5e0;
	Wed, 04 Nov 2020 09:59:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k18so1721128wmj.5
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=IHFCeb24ng8P9vt1Saa9HsamqkximAvecNeAK8FVeqU=;
        b=I+bTsTlfiXGT7IGhNHLFLhxyKgFVJ95LvyjFTAlaLUzqsV63MewoPXsQXJMOlBknAm
         o8c8YoQsIGuYQVRbZFhmbp6WqwEjp2zhkVZMvmRbUCT943Si+Oc7BAKq1lNIwTtzyY2n
         r4goffRbXF8ZnaYHNTgNrt/CfS4hp1Vwwi65RBLA6EuLBP38SfDjmn1hu8uB6annAZsd
         otcZhA7In0OhCv7CIBopweLkYljZlt8Vprknc5wrz4N33VnShXw86McElzMT7cx/ZjgX
         C8ko6Qy4f/uoYJA4g9u1swdw3uKJp6xml6+58aFzZnMlGXpxvzNfhihngIVZk5U03Pzz
         b8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=IHFCeb24ng8P9vt1Saa9HsamqkximAvecNeAK8FVeqU=;
        b=n++fh75TJ/T9232i1YxAL9whtSioGmoCtvGvHFYRWIAOmAesqkV+lhUczvpEI4qUqo
         zLypJvDUFay6gFfjW6zCSRZAvcm8YqtmAvEb7RxUoNgm/oBX+xL/RZsj1LMtwjJRbYZp
         FbJzW6NXd/bsJe+m/kdv3ymRfuRNPD/XbKa5j2Bag9EBidHE2zC/uDm+Az+soCRYKOZ2
         scuHvYinb3G0ira1pRHfkiMhATUvv1g2zzfgK1K6w0xNkAON6LEwN+SfNqLnFj0d0FRj
         RzLUeoH/DApustiOvA5xW0oPQLrBTD1jEXVoCKChnGBUdlMIa+6joCSVK4WULZ3IpqDH
         3+6w==
X-Gm-Message-State: AOAM532Odt3EsV4Ua8Ghk4CLYcCl1K9OZO2CwMnMNZ3P9WHmVBSX6EPZ
	+wHkzFsdYDoqaLWeTUSznZM=
X-Google-Smtp-Source: ABdhPJyqEJvcP2tWo6z4wLtZtpjldmzxe9SWtYvBegrbGkA2uxV5BzimLUzy/wUhks0Nl2ZeEb0YtQ==
X-Received: by 2002:a1c:1b8f:: with SMTP id b137mr3532657wmb.61.1604483977478;
        Wed, 04 Nov 2020 01:59:37 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id f17sm1527673wmh.10.2020.11.04.01.59.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 01:59:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-2-git-send-email-olekstysh@gmail.com> <003c01d6a6b0$8c418f50$a4c4adf0$@xen.org> <3dd55087-0c07-c9f3-e80a-8b136c226475@gmail.com>
In-Reply-To: <3dd55087-0c07-c9f3-e80a-8b136c226475@gmail.com>
Subject: RE: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it common
Date: Wed, 4 Nov 2020 09:59:35 -0000
Message-ID: <007501d6b291$34160a30$9c421e90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAH3I7RCAUkXRk0BK34LuKpsc2pQ

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 04 November 2020 09:06
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Jan =
Beulich' <jbeulich@suse.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>; 'Roger Pau Monn=C3=A9' =
<roger.pau@citrix.com>; 'Julien Grall'
> <julien@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei =
Liu' <wl@xen.org>; 'Julien
> Grall' <julien.grall@arm.com>
> Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for =
making it common
>=20
>=20
> On 20.10.20 10:13, Paul Durrant wrote:
>=20
> Hi Paul.
>=20
> Sorry for the late response.
>=20
> >> +
> >> +/* Called when target domain is paused */
> >> +static inline void arch_hvm_destroy_ioreq_server(struct =
hvm_ioreq_server *s)
> >> +{
> >> +    p2m_set_ioreq_server(s->target, 0, s);
> >> +}
> >> +
> >> +/*
> >> + * Map or unmap an ioreq server to specific memory type. For now, =
only
> >> + * HVMMEM_ioreq_server is supported, and in the future new types =
can be
> >> + * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. =
And
> >> + * currently, only write operations are to be forwarded to an =
ioreq server.
> >> + * Support for the emulation of read operations can be added when =
an ioreq
> >> + * server has such requirement in the future.
> >> + */
> >> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain =
*d,
> >> +                                                   ioservid_t id,
> >> +                                                   uint32_t type,
> >> +                                                   uint32_t flags)
> >> +{
> >> +    struct hvm_ioreq_server *s;
> >> +    int rc;
> >> +
> >> +    if ( type !=3D HVMMEM_ioreq_server )
> >> +        return -EINVAL;
> >> +
> >> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
> >> +        return -EINVAL;
> >> +
> >> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> >> +
> >> +    s =3D get_ioreq_server(d, id);
> >> +
> >> +    rc =3D -ENOENT;
> >> +    if ( !s )
> >> +        goto out;
> >> +
> >> +    rc =3D -EPERM;
> >> +    if ( s->emulator !=3D current->domain )
> >> +        goto out;
> >> +
> >> +    rc =3D p2m_set_ioreq_server(d, flags, s);
> >> +
> >> + out:
> >> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
> >> +
> >> +    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> >> +    {
> >> +        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> >> +
> >> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> >> +            p2m_change_entry_type_global(d, p2m_ioreq_server, =
p2m_ram_rw);
> >> +    }
> >> +
> >> +    return rc;
> >> +}
> >> +
> > The above doesn't really feel right to me. It's really an entry =
point into the ioreq server code and
> as such I think it ought to be left in the common code. I suggest =
replacing the p2m_set_ioreq_server()
> function with an arch specific function (also taking the type) which =
you can then implement here.
>=20
> Agree that it ought to be left in the common code.
>=20
> However, I am afraid I didn't entirely get you suggestion how this
> function could be split. On Arm struct p2m_domain doesn't contain =
IOREQ
> fields (p2m->ioreq.XXX), nor p2m_change_entry_type_global() is used, =
so
> they should be abstracted together with p2m_set_ioreq_server().
>=20
> So the whole "if ( rc =3D=3D 0 && flags =3D=3D 0 )" check should be =
folded into
> arch_p2m_set_ioreq_server implementation on x86? This in turn raises a
> question can we put a spin_unlock after.
>=20

Hi Oleksandr,

I think the code as it stands is really a bit of a layering violation. I =
don't really see a problem with retaining the ioreq server lock around =
the call to p2m_change_entry_type_global() so I'd just fold that into =
p2m_set_ioreq_server().

  Paul


