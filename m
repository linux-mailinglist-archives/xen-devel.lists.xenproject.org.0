Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005D283152
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2869.8182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPLSw-0006jp-Jy; Mon, 05 Oct 2020 08:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2869.8182; Mon, 05 Oct 2020 08:03:26 +0000
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
	id 1kPLSw-0006jQ-Gh; Mon, 05 Oct 2020 08:03:26 +0000
Received: by outflank-mailman (input) for mailman id 2869;
 Mon, 05 Oct 2020 08:03:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNwf=DM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kPLSu-0006jJ-9c
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:03:24 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c96de68c-30e0-4469-906e-714a26d71a58;
 Mon, 05 Oct 2020 08:03:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g12so2973378wrp.10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 01:03:23 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id f14sm12854907wrv.72.2020.10.05.01.03.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2020 01:03:21 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cNwf=DM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kPLSu-0006jJ-9c
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:03:24 +0000
X-Inumbo-ID: c96de68c-30e0-4469-906e-714a26d71a58
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c96de68c-30e0-4469-906e-714a26d71a58;
	Mon, 05 Oct 2020 08:03:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g12so2973378wrp.10
        for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 01:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=UwBSmE0LRswxIEXlwF4j5BDE85r77YcyH+Po0PgV3/I=;
        b=hypyxzjKb6HbXxW6eqafquoS60aJX7f43tExNsrEb2PnRLc00FyVV0Q3PDgpruFU4M
         RdGZ42dBxHkG9uTfygKMFLdVLA9ih6oINg7twNR9Y4e8E7TblMmfT7IEamXKtPA69f7I
         Sv4LLCJropZLejB1anXlBA0HOy2csneC65EhSZKsd08oMTqJU7YNcqudJktXaS32dBNr
         V4XSbHHp1HLJvzBzwx6tge0hr1zMHPK5h17B6AYqs6CXKwC1EIFKHF8le2TOao72eMWT
         axd+Zm+KIAkTN9rKpo9VZ78ald4vaU896H+Y1Sa9wugIPGG+QYt3kHVi9Bp8WpYwF3Ca
         TzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=UwBSmE0LRswxIEXlwF4j5BDE85r77YcyH+Po0PgV3/I=;
        b=P7P6LGGwdevTW7Hnz3zve+tk/hymlmqovUAjELY/Vs7yyZkMCFJlC/kagX5Gnj22Mc
         FevACAYgTK2Vkmfu3Pp4n42N1lZ9+yAKWGUGZot/wpCGch5naEYLaTS6aYpI7g5iNdQT
         9cGkXQQfgDrmG9kvdIn5BrSDGx38T4ko/REGIYVy0R57CKNNXaJcwx4WH8K8STJ0ON2y
         5pB3owUy0MciXKNmkUw9hcPgexBCVt1jI5Eu8Abj2SwcsXy4+IKY/D/VD5qGRMdGNuUE
         FhkEBgn3Zip/s3gkuCXfTemJC+2UgvWI82E5VAzJeMRmPuHkz5Pc1hRffXPc3mK+SRFK
         zUBA==
X-Gm-Message-State: AOAM5325EWqVJsLH7kUI7iacc7loSIv/OC5P12tMoTHLPcXrfD+l7+9t
	GkbT2AOCzH08LIKZaoSH8QA=
X-Google-Smtp-Source: ABdhPJxpw6M9W6tleuXP6FByjHfOPxm+7lQomO7/cy0cupGS0LIgmSUPuPC4dKfNyA2/LlpIiJCNnQ==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr564336wrp.367.1601885002201;
        Mon, 05 Oct 2020 01:03:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id f14sm12854907wrv.72.2020.10.05.01.03.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 01:03:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200924131030.1876-1-paul@xen.org> <20200924131030.1876-2-paul@xen.org> <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
In-Reply-To: <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
Subject: RE: [PATCH v9 1/8] xen/common: introduce a new framework for save/restore of 'domain' context
Date: Mon, 5 Oct 2020 09:03:20 +0100
Message-ID: <000201d69aed$fe07a990$fa16fcb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwFAw5g3Ahr3hNSpgiPokA==



> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 02 October 2020 22:20
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Julien Grall <julien@xen.org>; =
Jan Beulich
> <jbeulich@suse.com>; George Dunlap <george.dunlap@citrix.com>; Ian =
Jackson
> <ian.jackson@eu.citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei Liu <wl@xen.org>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: Re: [PATCH v9 1/8] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 24/09/2020 14:10, Paul Durrant wrote:
> > diff --git a/xen/common/save.c b/xen/common/save.c
> > new file mode 100644
> > index 0000000000..841c4d0e4e
> > --- /dev/null
> > +++ b/xen/common/save.c
> > @@ -0,0 +1,315 @@
> > +/*
> > + * save.c: Save and restore PV guest state common to all domain =
types.
>=20
> This description will be stale by the time your work is complete.
>=20

True now, I'll just drop the 'PV'

> > +int domain_save_data(struct domain_context *c, const void *src, =
size_t len)
> > +{
> > +    int rc =3D c->ops.save->append(c->priv, src, len);
> > +
> > +    if ( !rc )
> > +        c->len +=3D len;
> > +
> > +    return rc;
> > +}
> > +
> > +#define DOMAIN_SAVE_ALIGN 8
>=20
> This is part of the stream ABI.
>=20

And what's actually the problem with defining it here?

> > +
> > +int domain_save_end(struct domain_context *c)
> > +{
> > +    struct domain *d =3D c->domain;
> > +    size_t len =3D ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* =
padding */
>=20
> DOMAIN_SAVE_ALIGN - (c->len & (DOMAIN_SAVE_ALIGN - 1))
>=20
> isn't vulnerable to overflow.
>=20

...and significantly uglier code. What's actually wrong with what I =
wrote?

> > +    int rc;
> > +
> > +    if ( len )
> > +    {
> > +        static const uint8_t pad[DOMAIN_SAVE_ALIGN] =3D {};
> > +
> > +        rc =3D domain_save_data(c, pad, len);
> > +
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +    ASSERT(IS_ALIGNED(c->len, DOMAIN_SAVE_ALIGN));
> > +
> > +    if ( c->name )
> > +        gdprintk(XENLOG_INFO, "%pd save: %s[%u] +%zu (-%zu)\n", d, =
c->name,
> > +                 c->desc.instance, c->len, len);
>=20
> IMO, this is unhelpful to print out.  It also appears to be the only =
use
> of the c->name field.
>=20
> It also creates obscure and hard to follow logic based on dry_run.
>=20

I'll drop it to debug. I personally find it helpful and would prefer to =
keep it.

> > diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> > new file mode 100644
> > index 0000000000..551dbbddb8
> > --- /dev/null
> > +++ b/xen/include/public/save.h
> > @@ -0,0 +1,89 @@
> > +/*
> > + * save.h
> > + *
> > + * Structure definitions for common PV/HVM domain state that is =
held by
> > + * Xen and must be saved along with the domain's memory.
> > + *
> > + * Copyright Amazon.com Inc. or its affiliates.
> > + *
> > + * Permission is hereby granted, free of charge, to any person =
obtaining a copy
> > + * of this software and associated documentation files (the =
"Software"), to
> > + * deal in the Software without restriction, including without =
limitation the
> > + * rights to use, copy, modify, merge, publish, distribute, =
sublicense, and/or
> > + * sell copies of the Software, and to permit persons to whom the =
Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be =
included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =
EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF =
MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO =
EVENT SHALL THE
> > + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, =
ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
> > + * DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef XEN_PUBLIC_SAVE_H
> > +#define XEN_PUBLIC_SAVE_H
> > +
> > +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> > +
> > +#include "xen.h"
> > +
> > +/* Entry data is preceded by a descriptor */
> > +struct domain_save_descriptor {
> > +    uint16_t typecode;
> > +
> > +    /*
> > +     * Instance number of the entry (since there may be multiple of =
some
> > +     * types of entries).
> > +     */
> > +    uint16_t instance;
> > +
> > +    /* Entry length not including this descriptor */
> > +    uint32_t length;
> > +};
> > +
> > +/*
> > + * Each entry has a type associated with it. =
DECLARE_DOMAIN_SAVE_TYPE
> > + * binds these things together, although it is not intended that =
the
> > + * resulting type is ever instantiated.
> > + */
> > +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> > +    struct DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
> > +
> > +#define DOMAIN_SAVE_CODE(_x) \
> > +    (sizeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->c))
> > +#define DOMAIN_SAVE_TYPE(_x) \
> > +    typeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->t)
>=20
> I realise this is going to make me very unpopular, but NACK.
>=20
> This is straight up obfuscation with no redeeming properties.  I know
> you've copied it from the exist HVMCONTEXT infrastructure, but it is
> obnoxious to use there (particularly in the domain builder) and not an
> example wanting copying.
>=20
> Furthermore, the code will be simpler and easier to follow without it.
>=20

OK, I can drop it if you so vehemently object.

> Secondly, and more importantly, I do not see anything in docs/specs/
> describing the binary format of this stream,  and I'm going to insist
> that one appears, ahead of this patch in the series.
>=20

I can certainly put something there if you wish.

> In doing so, you're hopefully going to discover the bug with the older
> HVMCONTEXT stream which makes the version field fairly pointless (more
> below).
>=20
> It should describe how to forward compatibly extend the stream, and
> under what circumstances the version number can/should change.  It =
also
> needs to describe the alignment and extending rules which ...
>=20
> > +
> > +/*
> > + * All entries will be zero-padded to the next 64-bit boundary when =
saved,
> > + * so there is no need to include trailing pad fields in structure
> > + * definitions.
> > + * When loading, entries will be zero-extended if the load handler =
reads
> > + * beyond the length specified in the descriptor.
> > + */
>=20
> ... shouldn't be this.
>=20

Auto-padding was explicitly requested by Julien and extending (with =
zeroes or otherwise) is the necessary corollary (since the save handlers =
are not explicitly padding to the alignment boundary).

> The current zero extending property was an emergency hack to fix an =
ABI
> breakage which had gone unnoticed for a couple of releases.  The work =
to
> implement it created several very hard to debug breakages in Xen.
>=20
> A properly designed stream shouldn't need auto-extending behaviour, =
and
> the legibility of the code is improved by not having it.
>=20
> It is a trick which can stay up your sleeve for an emergency, in the
> hope you'll never have to use it.
>=20

The zero-extending here is different; it does not form part of the =
record. It is merely there to make sure the alignment constraint is met.

> > +
> > +/* Terminating entry */
> > +struct domain_save_end {};
> > +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
> > +
> > +#define DOMAIN_SAVE_MAGIC   0x53415645
> > +#define DOMAIN_SAVE_VERSION 0x00000001
> > +
> > +/* Initial entry */
> > +struct domain_save_header {
> > +    uint32_t magic;                /* Must be DOMAIN_SAVE_MAGIC */
> > +    uint16_t xen_major, xen_minor; /* Xen version */
> > +    uint32_t version;              /* Save format version */
> > +};
> > +DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>=20
> The layout problem with the stream is the fact that this header =
doesn't
> come first.
>=20

? It most certainly does some first as is evident from the load and save =
functions. But I will add a document that states it, as requested.

> In the eventual future where uint16_t won't be sufficient for =
instance,
> and uint32_t might not be sufficient for len, the version number is
> going to have to be bumped, in order to change the descriptor layout.
>=20
>=20
> Overall, this patch needs to be a minimum of two.  First a written
> document which is the authoritative stream ABI, and the second which =
is
> this implementation.  The header describing the stream format should =
not
> be substantively different from xg_sr_stream_format.h
>=20

Ok.

> ~Andrew
>=20
> P.S. Another good reason for having extremely simple header files is =
for
> the poor sole trying to write a Go/Rust/other binding for this in some
> likely not-to-distant future.

Fine. I'm happy to drop the macro/type magic if no-one feels it is =
necessary.

  Paul


