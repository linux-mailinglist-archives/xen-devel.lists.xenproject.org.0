Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C8283421
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 12:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2968.8518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPNuK-0005zJ-Pn; Mon, 05 Oct 2020 10:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2968.8518; Mon, 05 Oct 2020 10:39:52 +0000
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
	id 1kPNuK-0005yu-MR; Mon, 05 Oct 2020 10:39:52 +0000
Received: by outflank-mailman (input) for mailman id 2968;
 Mon, 05 Oct 2020 10:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPNuI-0005yp-Sq
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:39:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 144920f9-330b-4a44-955e-52f305f8aa8a;
 Mon, 05 Oct 2020 10:39:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPNuI-0005yp-Sq
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:39:50 +0000
X-Inumbo-ID: 144920f9-330b-4a44-955e-52f305f8aa8a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 144920f9-330b-4a44-955e-52f305f8aa8a;
	Mon, 05 Oct 2020 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601894388;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ZJxHvFXJT4hE+LcVa/v6udXiAg2ozRAKSroSYJs3BJ4=;
  b=Ok9FQngMN/ObMgiCw396iOHYK0+i27ahCQOEdQAYhQfwoaiIN1tNnami
   kT1lQI/bl3CC8rHSbECT0/yu+WyrZD6zixp+qQ48yIcpIgDOvLynOKcun
   2O3Rvbz0H9Dxl7OorQTu7o91n5V8s1gjvHWcYFADe/ISg/ENxm1R7FCXm
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JbJHbmblZRw5sb17Yx6MOn4OKiJbTwJE6YrtiHjWqthMZ433+dgP8NlV2mfmhCp3JJ86sjc9I7
 FRKcxc8hUhi69W/RPVOgjmXE6jQEHi52HDbUULBKmhbVfvptSSOIL0OtYM8EGDIBvf6NnlrdGV
 y5hiwp49MqnKXji5sXhl35i7WHupN0I0UM2qjjo0X+0hXEj5EtlXoEg96ioaffNGcCBPbpNyNz
 U0X/Py8/cgcEq0+0nKCnQbVhbfvA7cP6w0f5KblYtW3unI2jETJA1nV4hxG7L7GNQwyGB+BmfQ
 ptk=
X-SBRS: None
X-MesageID: 28360803
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28360803"
Subject: Re: [PATCH v9 6/8] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-7-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a82cfb40-9ce5-d8ed-a2f7-1b02fc6e27e6@citrix.com>
Date: Mon, 5 Oct 2020 11:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-7-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
> index 243325dfce..6ead7ea89d 100644
> --- a/tools/misc/xen-domctx.c
> +++ b/tools/misc/xen-domctx.c
> @@ -31,6 +31,7 @@
>  #include <errno.h>
>  
>  #include <xenctrl.h>
> +#include <xen-tools/libs.h>
>  #include <xen/xen.h>
>  #include <xen/domctl.h>
>  #include <xen/save.h>
> @@ -61,6 +62,82 @@ static void dump_header(void)
>  
>  }
>  
> +static void print_binary(const char *prefix, const void *val, size_t size,
> +                         const char *suffix)
> +{
> +    printf("%s", prefix);
> +
> +    while ( size-- )
> +    {
> +        uint8_t octet = *(const uint8_t *)val++;
> +        unsigned int i;
> +
> +        for ( i = 0; i < 8; i++ )
> +        {
> +            printf("%u", octet & 1);
> +            octet >>= 1;
> +        }
> +    }
> +
> +    printf("%s", suffix);
> +}
> +
> +static void dump_shared_info(void)
> +{
> +    DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
> +    bool has_32bit_shinfo;
> +    shared_info_any_t *info;
> +    unsigned int i, n;
> +
> +    GET_PTR(s);
> +    has_32bit_shinfo = s->flags & DOMAIN_SAVE_32BIT_SHINFO;
> +
> +    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
> +           has_32bit_shinfo ? "true" : "false", s->buffer_size);
> +
> +    info = (shared_info_any_t *)s->buffer;
> +
> +#define GET_FIELD_PTR(_f)            \
> +    (has_32bit_shinfo ?              \
> +     (const void *)&(info->x32._f) : \
> +     (const void *)&(info->x64._f))
> +#define GET_FIELD_SIZE(_f) \
> +    (has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
> +#define GET_FIELD(_f) \
> +    (has_32bit_shinfo ? info->x32._f : info->x64._f)
> +
> +    n = has_32bit_shinfo ?
> +        ARRAY_SIZE(info->x32.evtchn_pending) :
> +        ARRAY_SIZE(info->x64.evtchn_pending);
> +
> +    for ( i = 0; i < n; i++ )
> +    {
> +        const char *prefix = !i ?
> +            "                 evtchn_pending: " :
> +            "                                 ";
> +
> +        print_binary(prefix, GET_FIELD_PTR(evtchn_pending[0]),
> +                 GET_FIELD_SIZE(evtchn_pending[0]), "\n");
> +    }
> +
> +    for ( i = 0; i < n; i++ )
> +    {
> +        const char *prefix = !i ?
> +            "                    evtchn_mask: " :
> +            "                                 ";
> +
> +        print_binary(prefix, GET_FIELD_PTR(evtchn_mask[0]),
> +                 GET_FIELD_SIZE(evtchn_mask[0]), "\n");
> +    }

What about domains using FIFO?  This is meaningless for them.

> +
> +    printf("                 wc: version: %u sec: %u nsec: %u\n",
> +           GET_FIELD(wc_version), GET_FIELD(wc_sec), GET_FIELD(wc_nsec));

wc_sec_hi is also a rather critical field in this calculation.

> +
> +#undef GET_FIELD
> +#undef GET_FIELD_SIZE
> +#undef GET_FIELD_PTR
> +}
> +
>  static void dump_end(void)
>  {
>      DOMAIN_SAVE_TYPE(END) *e;
> @@ -173,6 +250,7 @@ int main(int argc, char **argv)
>              switch (desc->typecode)
>              {
>              case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
> +            case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
>              case DOMAIN_SAVE_CODE(END): dump_end(); break;
>              default:
>                  printf("Unknown type %u: skipping\n", desc->typecode);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8cfa2e0b6b..6709f9c79e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -33,6 +33,7 @@
>  #include <xen/xenoprof.h>
>  #include <xen/irq.h>
>  #include <xen/argo.h>
> +#include <xen/save.h>
>  #include <asm/debugger.h>
>  #include <asm/p2m.h>
>  #include <asm/processor.h>
> @@ -1657,6 +1658,110 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +static int save_shared_info(const struct domain *d, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain_shared_info_context ctxt = {
> +#ifdef CONFIG_COMPAT
> +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
> +        .buffer_size = has_32bit_shinfo(d) ?
> +                       sizeof(struct compat_shared_info) :
> +                       sizeof(struct shared_info),
> +#else
> +        .buffer_size = sizeof(struct shared_info),
> +#endif
> +    };
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    int rc;
> +
> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_save_end(c);
> +}
> +
> +static int load_shared_info(struct domain *d, struct domain_context *c)
> +{
> +    struct domain_shared_info_context ctxt;
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    unsigned int i;
> +    int rc;
> +
> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> +    if ( rc )
> +        return rc;
> +
> +    if ( i ) /* expect only a single instance */
> +        return -ENXIO;
> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
> +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
> +        return -EINVAL;
> +
> +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> +    {
> +#ifdef CONFIG_COMPAT
> +        has_32bit_shinfo(d) = true;

d->arch.has_32bit_shinfo

> +#else
> +        return -EINVAL;
> +#endif
> +    }
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        shared_info_t *shinfo = xmalloc(shared_info_t);
> +
> +        if ( !shinfo )
> +            return -ENOMEM;
> +
> +        rc = domain_load_data(c, shinfo, sizeof(*shinfo));
> +        if ( rc )
> +            goto out;

There's no need for a memory allocation, or to double buffer this data. 
You can memcpy() straight out of the context record.

> +
> +        memcpy(&shared_info(d, vcpu_info), &__shared_info(d, shinfo, vcpu_info),
> +               sizeof(shared_info(d, vcpu_info)));
> +        memcpy(&shared_info(d, arch), &__shared_info(d, shinfo, arch),
> +               sizeof(shared_info(d, arch)));
> +
> +        memset(&shared_info(d, evtchn_pending), 0,
> +               sizeof(shared_info(d, evtchn_pending)));
> +        memset(&shared_info(d, evtchn_mask), 0xff,
> +               sizeof(shared_info(d, evtchn_mask)));
> +
> +        shared_info(d, arch.pfn_to_mfn_frame_list_list) = 0;
> +        for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> +            shared_info(d, vcpu_info[i].evtchn_pending_sel) = 0;

What is the plan for transparent migrate here?  While this is ok for
regular migrate, its definitely not for transparent.

> +
> +        rc = domain_load_end(c, false);
> +
> +    out:
> +        xfree(shinfo);
> +    }
> +    else
> +        /*
> +         * No modifications to shared_info are required for restoring non-PV
> +         * domains.
> +         */
> +        rc = domain_load_end(c, true);
> +
> +    return rc;
> +}
> +
> +DOMAIN_REGISTER_SAVE_LOAD(SHARED_INFO, save_shared_info, load_shared_info);
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> index 551dbbddb8..0e855a4b97 100644
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -82,7 +82,18 @@ struct domain_save_header {
>  };
>  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>  
> -#define DOMAIN_SAVE_CODE_MAX 1
> +struct domain_shared_info_context {
> +    uint32_t flags;
> +
> +#define DOMAIN_SAVE_32BIT_SHINFO 0x00000001
> +
> +    uint32_t buffer_size;

This struct is already wrapped with a header including a size which
encompasses buffer.

Multiple overlapping size fields is an easy way to memory corruption,
because it causes ambiguity as to which one is right.

~Andrew

