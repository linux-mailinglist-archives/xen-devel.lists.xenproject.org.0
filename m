Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BCD566EDB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361234.590635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iDw-000559-3W; Tue, 05 Jul 2022 13:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361234.590635; Tue, 05 Jul 2022 13:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iDw-00052k-0E; Tue, 05 Jul 2022 13:04:16 +0000
Received: by outflank-mailman (input) for mailman id 361234;
 Tue, 05 Jul 2022 13:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHCC=XK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1o8iDt-00052X-O5
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:04:13 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7027ad4-fc62-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:04:12 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id t25so20424754lfg.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 06:04:12 -0700 (PDT)
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
X-Inumbo-ID: f7027ad4-fc62-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OPb4vez3xMWgWw9qL4+82hBZyNzYuSAh7zaT/JzSON8=;
        b=ASlAVWOtaH6CL3Mv7qFkf1ThrptYMTe0Y+CzgkAxWYGoI+7YZZyjbbwKqBxqz3Rpxv
         w1RKo36oBFV3TKr8QTm2B8Jkj+xdrR0wXsXkqP74WXjz1cKtHzBjhAPR0XszETouidsr
         iHTRMp1Td8qd1XbCYs8B7r4n5RnoMVOLWDeDQvfBGSjrDL/oX7SqcRtfvZAfv6rEMQSS
         22WKRT3Tqp/WEOUZleYv2FP4Jdp9k0Ho2Wf1CfMXYpJ+x02CVs7DXm2x/Ob4xeEY/Tbv
         oRL5nWjaX/Uhwjn9MIda57x5sUhHDkZ8U+zq6B/f291hyphaLHKt8veEN1xzse2ETpHp
         vmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OPb4vez3xMWgWw9qL4+82hBZyNzYuSAh7zaT/JzSON8=;
        b=ysoEwwWDxeSmYs0xVxrr19OPwmt0wztmpLUBJy6GnUuk+cwXP4PPYtW//Dw4yyoTSU
         gsoTsmHCHhIombVebHNPaEfPAKo55G8B/2QeYatPBQdx86uh4VE5UKR5cPyY72NEggOT
         BcN3di6TLzd+kHjIj0D3eMvpf2YFBW9ZOABiwIoYxgMZB47I/zWburXsrcuDqJ5g9/Xi
         /b//SkP+d6xZFicAufj6IfRl6i55tYf8LDUgE0WgaCm3DbbJ8p6o6LmUyYIpfE5ubpSA
         atGBBftnucJshppb4lt7yL/K7EFVC50p4ittL0JVRqfp00qcJazcsEg6uUOi4zGSZTzn
         YrFQ==
X-Gm-Message-State: AJIora94t0mPFlCak31SYaFGCbxjdysLGGhyF0N8iUgUoJCc834GkFN+
	g0Z763nxvYfAaWOCcd5AM7DoN9OoEj2/E9SPyDSVw91F0C4=
X-Google-Smtp-Source: AGRyM1uDT3UhDFAUVhsyHOthe8UWUn67px+vyaPc1JMeQXZIQ0dYGcjSekxGXt0a2DwHXY4MF1KnFukwhepEAjKXdAM=
X-Received: by 2002:a05:6512:2508:b0:480:f1cb:64ad with SMTP id
 be8-20020a056512250800b00480f1cb64admr24139849lfb.359.1657026251886; Tue, 05
 Jul 2022 06:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220630022110.31555-1-dpsmith@apertussolutions.com> <20220630022110.31555-4-dpsmith@apertussolutions.com>
In-Reply-To: <20220630022110.31555-4-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 5 Jul 2022 09:03:59 -0400
Message-ID: <CAKf6xpsx2CkCuuHvJ5Zc+fC=4y9ha4Px0DYdUAY3oxe0_OhpRg@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	christopher.clark@starlab.io, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 10:22 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> The function flask_domain_alloc_security() is where a default sid should be
> assigned to a domain under construction. For reasons unknown, the initial
> domain would be assigned unlabeled_t and then fixed up under
> flask_domain_create().  With the introduction of xenboot_t it is now possible
> to distinguish when the hypervisor is in the boot state.

There is no "default label" which is why unlabeled_t was used.
flask_domain_create() does permission checks before setting the label
from the config.

flask_domain_alloc_security()
- mallocs domain_security_struct
- sets sid for system domains xen_t, domxen_t, domio_t
- is called for all domains.

flask_domain_create()
- special cases labeling dom0_t so it can only be done once.
- otherwise, ensures current has permission to domain_create.
- sets sid for both cases.
- has the config->ssidref passed in.
- is only called for non-system, non-idle domains.

> This commit looks to correct this by using a check to see if the hypervisor is
> under the xenboot_t context in flask_domain_alloc_security(). If it is, then it
> will inspect the domain's is_privileged field, and select the appropriate
> default label, dom0_t or domU_t, for the domain. The logic for
> flask_domain_create() was changed to allow the incoming sid to override the
> default label.
>
> The base policy was adjusted to allow the idle domain under the xenboot_t
> context to be able to construct domains of both types, dom0 and domU.

Your patch special cases flask_domain_alloc_security() to assign
dom0/domU.  You already have a config and therefore config->ssidref,
so that shouldn't be necessary since flask_domain_create() can use
that ssidref.

I don't see a precise reason for why this change is needed in the
commit message.  I know you are working on hyperlaunch, but I'm
guessing at the rationale for this change.  And hyperlaunch should be
passing in a config with ssidref set instead of relying on the flask
code to auto assign, so I'm not sure of why this change would be
needed for hyperlaunch.

Is the issue with only having a single creation of dom0_t?  Can you
change create_dom()'s dom0_cfg to specify the ssidref when creating
dom0.  I guess that would need a new xsm_dom0_ssidref hook (or
something) to hide away the flask code.  But that way there is less
special casing in the code.  flask_domain_alloc_security() could be
left unchanged, and flask_domain_create could() be streamlined to just
check the passed in ssidref.  How does that sound?

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  tools/flask/policy/modules/dom0.te |  3 +++
>  tools/flask/policy/modules/domU.te |  3 +++
>  xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
>  3 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
> index 0a63ce15b6..2022bb9636 100644
> --- a/tools/flask/policy/modules/dom0.te
> +++ b/tools/flask/policy/modules/dom0.te
> @@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
>  admin_device(dom0_t, iomem_t)
>
>  domain_comms(dom0_t, dom0_t)
> +
> +# Allow they hypervisor to build domains of type dom0_t
> +xen_build_domain(dom0_t)
> diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
> index b77df29d56..73fc90c3c6 100644
> --- a/tools/flask/policy/modules/domU.te
> +++ b/tools/flask/policy/modules/domU.te
> @@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
>  migrate_domain_out(dom0_t, domU_t)
>  domain_self_comms(domU_t)
>
> +# Allow they hypervisor to build domains of type domU_t
> +xen_build_domain(domU_t)
> +
>  # Device model for domU_t.  You can define distinct types for device models for
>  # domains of other types, or add more make_device_model lines for this type.
>  declare_domain(dm_dom_t)
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 8c9cd0f297..caa0ae7d4c 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -182,7 +182,15 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>          dsec->sid = SECINITSID_DOMIO;
>          break;
>      default:
> -        dsec->sid = SECINITSID_UNLABELED;
> +        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
> +        {
> +            if ( d->is_privileged )
> +                dsec->sid = SECINITSID_DOM0;
> +            else
> +                dsec->sid = SECINITSID_DOMU;
> +        }
> +        else
> +            dsec->sid = SECINITSID_UNLABELED;
>      }
>
>      dsec->self_sid = dsec->sid;
> @@ -548,23 +556,21 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>  {
>      int rc;
>      struct domain_security_struct *dsec = d->ssid;
> -    static int dom0_created = 0;
>
> -    if ( is_idle_domain(current->domain) && !dom0_created )
> -    {
> -        dsec->sid = SECINITSID_DOM0;
> -        dom0_created = 1;
> -    }
> -    else
> +    /*
> +     * If domain has not already been labeled or a valid new label is provided,
> +     * then use the provided label, otherwise use the existing label.
> +     */
> +    if ( dsec->sid == SECINITSID_UNLABELED || ssidref > 0 )
>      {
> -        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
> -                          DOMAIN__CREATE, NULL);
> -        if ( rc )
> -            return rc;

The old code returned here before...

> -
>          dsec->sid = ssidref;

... setting the sid.  That is more robust since if the function fails,
the sid is not changed.  It's not a problem today as the
xsm_domain_create() return value is checked, but it is more robust to
restore that property.

Regards,
Jason

> +        dsec->self_sid = dsec->sid;
>      }
> -    dsec->self_sid = dsec->sid;
> +
> +    rc = avc_current_has_perm(dsec->sid, SECCLASS_DOMAIN,
> +                              DOMAIN__CREATE, NULL);
> +    if ( rc )
> +        return rc;
>
>      rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
>                                   &dsec->self_sid);
> --
> 2.20.1
>

