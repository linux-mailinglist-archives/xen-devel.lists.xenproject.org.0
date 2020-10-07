Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3A285EAD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 14:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3479.9949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ8Ad-0006OY-9e; Wed, 07 Oct 2020 12:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3479.9949; Wed, 07 Oct 2020 12:03:47 +0000
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
	id 1kQ8Ad-0006O9-67; Wed, 07 Oct 2020 12:03:47 +0000
Received: by outflank-mailman (input) for mailman id 3479;
 Wed, 07 Oct 2020 12:03:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0nCK=DO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kQ8Ac-0006O1-31
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:03:46 +0000
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30bf7a6b-128b-4d93-b776-21b3bf3df1de;
 Wed, 07 Oct 2020 12:03:44 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id qp15so2579545ejb.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 05:03:44 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id m7sm1491305edv.88.2020.10.07.05.03.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 05:03:43 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0nCK=DO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kQ8Ac-0006O1-31
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:03:46 +0000
X-Inumbo-ID: 30bf7a6b-128b-4d93-b776-21b3bf3df1de
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 30bf7a6b-128b-4d93-b776-21b3bf3df1de;
	Wed, 07 Oct 2020 12:03:44 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id qp15so2579545ejb.3
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=XmaxyqqD4t/7Z1ArZshtrKB398YVfdVs4G/Q4xHvD9Q=;
        b=CHmkX/VAtY6HCFzdJLDgQvfp09xYrvGBIX9aeLXvgNCiKTAx7VGNWvtW6PBnLnFj43
         MpMYsDe/DNPKOuxCWUNvX03ikj7J18aBXbcqdTXzgoCjK0lSKcrjDcpbojAZec2Dd9XX
         B7WfBbtnGYE4XrQaw3uS7JjPFnuWKBzd+s77pPgw2MTqCu4mVtVeWKrbHszwcpF3C48D
         F3MduQW6q+nzrOovx3V2BwMM0YsZ2lKacU040b9Uxh6cev1spCU3kgnu3V0RZ8hCgqt+
         Rv+kEAZQGBCe+rVawPr9kZfjyLvTMqD+J98MMWbJ/eioQT93P4lSPO9K53Ru2aYKB+BU
         7hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=XmaxyqqD4t/7Z1ArZshtrKB398YVfdVs4G/Q4xHvD9Q=;
        b=seUD0NeiwX+vuOwCqUWV5Q42ckKlWDrBIy8U2kEkfCk1iR9akTUZ5XtfGwfgNYHtZn
         PP6kB5RizttKXxDxQllcaxWanu6EaN++AzskdMbgClXIMOfqHJAMk0zpCPaTefq+D8ik
         oDmHWv24PpaIJVCZcDRHRgwhtq2rd9FS34PTEMPfsUEgwrMeWo6g1NY19Te/W0lSlpym
         v8wy+kJXIZ1ZlAjDXy3DI1UEZa1ojW8ofVWPHbrF6TY3iu/FvVjpFlDiB0knBejTuxQp
         OnloX3FKGuvR68htgmY+yDvLgvRHM3bwzn9fyuJIqHyY3dbziqtQ/eq0136l4FP/6WRf
         DTbQ==
X-Gm-Message-State: AOAM532x8NwRbmvll5+48dkXjDNPVPyZIaovF8iaRWcCBEx+FwYjl+Uo
	x3i2VmBLHT3J16cLxNbrjEo=
X-Google-Smtp-Source: ABdhPJwe+CJeG6AkRc797UIxhzjpL+p33xFOsJNorrDDzJwlfoOfx+Ol+I7w4Voq0I1xxxNEn09Zqw==
X-Received: by 2002:a17:906:4151:: with SMTP id l17mr3169801ejk.83.1602072223933;
        Wed, 07 Oct 2020 05:03:43 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id m7sm1491305edv.88.2020.10.07.05.03.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2020 05:03:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20200924131030.1876-1-paul@xen.org> <20200924131030.1876-7-paul@xen.org> <a82cfb40-9ce5-d8ed-a2f7-1b02fc6e27e6@citrix.com>
In-Reply-To: <a82cfb40-9ce5-d8ed-a2f7-1b02fc6e27e6@citrix.com>
Subject: RE: [PATCH v9 6/8] common/domain: add a domain context record for shared_info...
Date: Wed, 7 Oct 2020 13:03:42 +0100
Message-ID: <000d01d69ca1$e6f14e90$b4d3ebb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwIhBQEuAQ4F24WphvTQAA==

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 05 October 2020 11:40
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>;
> George Dunlap <george.dunlap@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH v9 6/8] common/domain: add a domain context record =
for shared_info...
>=20
> On 24/09/2020 14:10, Paul Durrant wrote:
> > diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
> > index 243325dfce..6ead7ea89d 100644
> > --- a/tools/misc/xen-domctx.c
> > +++ b/tools/misc/xen-domctx.c
> > @@ -31,6 +31,7 @@
> >  #include <errno.h>
> >
> >  #include <xenctrl.h>
> > +#include <xen-tools/libs.h>
> >  #include <xen/xen.h>
> >  #include <xen/domctl.h>
> >  #include <xen/save.h>
> > @@ -61,6 +62,82 @@ static void dump_header(void)
> >
> >  }
> >
> > +static void print_binary(const char *prefix, const void *val, =
size_t size,
> > +                         const char *suffix)
> > +{
> > +    printf("%s", prefix);
> > +
> > +    while ( size-- )
> > +    {
> > +        uint8_t octet =3D *(const uint8_t *)val++;
> > +        unsigned int i;
> > +
> > +        for ( i =3D 0; i < 8; i++ )
> > +        {
> > +            printf("%u", octet & 1);
> > +            octet >>=3D 1;
> > +        }
> > +    }
> > +
> > +    printf("%s", suffix);
> > +}
> > +
> > +static void dump_shared_info(void)
> > +{
> > +    DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
> > +    bool has_32bit_shinfo;
> > +    shared_info_any_t *info;
> > +    unsigned int i, n;
> > +
> > +    GET_PTR(s);
> > +    has_32bit_shinfo =3D s->flags & DOMAIN_SAVE_32BIT_SHINFO;
> > +
> > +    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: =
%u\n",
> > +           has_32bit_shinfo ? "true" : "false", s->buffer_size);
> > +
> > +    info =3D (shared_info_any_t *)s->buffer;
> > +
> > +#define GET_FIELD_PTR(_f)            \
> > +    (has_32bit_shinfo ?              \
> > +     (const void *)&(info->x32._f) : \
> > +     (const void *)&(info->x64._f))
> > +#define GET_FIELD_SIZE(_f) \
> > +    (has_32bit_shinfo ? sizeof(info->x32._f) : =
sizeof(info->x64._f))
> > +#define GET_FIELD(_f) \
> > +    (has_32bit_shinfo ? info->x32._f : info->x64._f)
> > +
> > +    n =3D has_32bit_shinfo ?
> > +        ARRAY_SIZE(info->x32.evtchn_pending) :
> > +        ARRAY_SIZE(info->x64.evtchn_pending);
> > +
> > +    for ( i =3D 0; i < n; i++ )
> > +    {
> > +        const char *prefix =3D !i ?
> > +            "                 evtchn_pending: " :
> > +            "                                 ";
> > +
> > +        print_binary(prefix, GET_FIELD_PTR(evtchn_pending[0]),
> > +                 GET_FIELD_SIZE(evtchn_pending[0]), "\n");
> > +    }
> > +
> > +    for ( i =3D 0; i < n; i++ )
> > +    {
> > +        const char *prefix =3D !i ?
> > +            "                    evtchn_mask: " :
> > +            "                                 ";
> > +
> > +        print_binary(prefix, GET_FIELD_PTR(evtchn_mask[0]),
> > +                 GET_FIELD_SIZE(evtchn_mask[0]), "\n");
> > +    }
>=20
> What about domains using FIFO?  This is meaningless for them.
>=20

Indeed, but this is essentially a debug tool so I'd rather it just =
dumped everything that might be useful.

> > +
> > +    printf("                 wc: version: %u sec: %u nsec: %u\n",
> > +           GET_FIELD(wc_version), GET_FIELD(wc_sec), =
GET_FIELD(wc_nsec));
>=20
> wc_sec_hi is also a rather critical field in this calculation.=09
>=20

Ok.

> > +
> > +#undef GET_FIELD
> > +#undef GET_FIELD_SIZE
> > +#undef GET_FIELD_PTR
> > +}
> > +
> >  static void dump_end(void)
> >  {
> >      DOMAIN_SAVE_TYPE(END) *e;
> > @@ -173,6 +250,7 @@ int main(int argc, char **argv)
> >              switch (desc->typecode)
> >              {
> >              case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
> > +            case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); =
break;
> >              case DOMAIN_SAVE_CODE(END): dump_end(); break;
> >              default:
> >                  printf("Unknown type %u: skipping\n", =
desc->typecode);
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 8cfa2e0b6b..6709f9c79e 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -33,6 +33,7 @@
> >  #include <xen/xenoprof.h>
> >  #include <xen/irq.h>
> >  #include <xen/argo.h>
> > +#include <xen/save.h>
> >  #include <asm/debugger.h>
> >  #include <asm/p2m.h>
> >  #include <asm/processor.h>
> > @@ -1657,6 +1658,110 @@ int continue_hypercall_on_cpu(
> >      return 0;
> >  }
> >
> > +static int save_shared_info(const struct domain *d, struct =
domain_context *c,
> > +                            bool dry_run)
> > +{
> > +    struct domain_shared_info_context ctxt =3D {
> > +#ifdef CONFIG_COMPAT
> > +        .flags =3D has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : =
0,
> > +        .buffer_size =3D has_32bit_shinfo(d) ?
> > +                       sizeof(struct compat_shared_info) :
> > +                       sizeof(struct shared_info),
> > +#else
> > +        .buffer_size =3D sizeof(struct shared_info),
> > +#endif
> > +    };
> > +    size_t hdr_size =3D offsetof(typeof(ctxt), buffer);
> > +    int rc;
> > +
> > +    rc =3D DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc =3D domain_save_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc =3D domain_save_data(c, d->shared_info, ctxt.buffer_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return domain_save_end(c);
> > +}
> > +
> > +static int load_shared_info(struct domain *d, struct domain_context =
*c)
> > +{
> > +    struct domain_shared_info_context ctxt;
> > +    size_t hdr_size =3D offsetof(typeof(ctxt), buffer);
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    rc =3D DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( i ) /* expect only a single instance */
> > +        return -ENXIO;
> > +
> > +    rc =3D domain_load_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
> > +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
> > +        return -EINVAL;
> > +
> > +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> > +    {
> > +#ifdef CONFIG_COMPAT
> > +        has_32bit_shinfo(d) =3D true;
>=20
> d->arch.has_32bit_shinfo
>=20

If you'd prefer, ok.

> > +#else
> > +        return -EINVAL;
> > +#endif
> > +    }
> > +
> > +    if ( is_pv_domain(d) )
> > +    {
> > +        shared_info_t *shinfo =3D xmalloc(shared_info_t);
> > +
> > +        if ( !shinfo )
> > +            return -ENOMEM;
> > +
> > +        rc =3D domain_load_data(c, shinfo, sizeof(*shinfo));
> > +        if ( rc )
> > +            goto out;
>=20
> There's no need for a memory allocation, or to double buffer this =
data.
> You can memcpy() straight out of the context record.
>=20

That would mean re-working the way that domain_load_data() works. I'd =
really rather not.

> > +
> > +        memcpy(&shared_info(d, vcpu_info), &__shared_info(d, =
shinfo, vcpu_info),
> > +               sizeof(shared_info(d, vcpu_info)));
> > +        memcpy(&shared_info(d, arch), &__shared_info(d, shinfo, =
arch),
> > +               sizeof(shared_info(d, arch)));
> > +
> > +        memset(&shared_info(d, evtchn_pending), 0,
> > +               sizeof(shared_info(d, evtchn_pending)));
> > +        memset(&shared_info(d, evtchn_mask), 0xff,
> > +               sizeof(shared_info(d, evtchn_mask)));
> > +
> > +        shared_info(d, arch.pfn_to_mfn_frame_list_list) =3D 0;
> > +        for ( i =3D 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> > +            shared_info(d, vcpu_info[i].evtchn_pending_sel) =3D 0;
>=20
> What is the plan for transparent migrate here?  While this is ok for
> regular migrate, its definitely not for transparent.
>=20

Quite true, as evidenced that this is inside 'if ( is_pv_domain(d) )'. =
It is not yet clear how much of the shared info we need for transparent =
migrate. It may be nothing.

> > +
> > +        rc =3D domain_load_end(c, false);
> > +
> > +    out:
> > +        xfree(shinfo);
> > +    }
> > +    else
> > +        /*
> > +         * No modifications to shared_info are required for =
restoring non-PV
> > +         * domains.
> > +         */
> > +        rc =3D domain_load_end(c, true);
> > +
> > +    return rc;
> > +}
> > +
> > +DOMAIN_REGISTER_SAVE_LOAD(SHARED_INFO, save_shared_info, =
load_shared_info);
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> > index 551dbbddb8..0e855a4b97 100644
> > --- a/xen/include/public/save.h
> > +++ b/xen/include/public/save.h
> > @@ -82,7 +82,18 @@ struct domain_save_header {
> >  };
> >  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
> >
> > -#define DOMAIN_SAVE_CODE_MAX 1
> > +struct domain_shared_info_context {
> > +    uint32_t flags;
> > +
> > +#define DOMAIN_SAVE_32BIT_SHINFO 0x00000001
> > +
> > +    uint32_t buffer_size;
>=20
> This struct is already wrapped with a header including a size which
> encompasses buffer.
>=20
> Multiple overlapping size fields is an easy way to memory corruption,
> because it causes ambiguity as to which one is right.
>=20

The record size currently includes padding. I'm re-working that in v10 =
and so this size can be dropped.

  Paul



