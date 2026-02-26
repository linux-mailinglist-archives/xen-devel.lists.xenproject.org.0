Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKw0BTS5oGnClwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 22:20:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A301AFA9B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 22:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242340.1542881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vviln-0007mI-4x; Thu, 26 Feb 2026 21:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242340.1542881; Thu, 26 Feb 2026 21:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vviln-0007jK-1g; Thu, 26 Feb 2026 21:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1242340;
 Thu, 26 Feb 2026 21:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xR4/=A6=bounce.vates.tech=bounce-md_30504962.69a0b8e1.v1-72cbbdec2faa4e42b17a16a616dd5811@srs-se1.protection.inumbo.net>)
 id 1vvill-0007jE-9y
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 21:19:37 +0000
Received: from mail177-30.suw61.mandrillapp.com
 (mail177-30.suw61.mandrillapp.com [198.2.177.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d669a02f-1358-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 22:19:31 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-30.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4fMPV92qQLzP0JtvM
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 21:19:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 72cbbdec2faa4e42b17a16a616dd5811; Thu, 26 Feb 2026 21:19:29 +0000
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
X-Inumbo-ID: d669a02f-1358-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772140769; x=1772410769;
	bh=MLNN+TTM7nCCyhQnjEzu9i5uefM5EB6jJQto4+Ymqhw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FlsusTc2j+wjy6ZHWZwN73t+vOXUqw6d9ypP89lcHpLNppOcajHv/gl4SOWlOk9og
	 BbVTGudl3SLjv+OtupowKXq8m7yx6x/qOfpoKlCsqu6bSWvxxQkw3C7h4ETFGf04po
	 UfK+jzpHh9yaDGxuTt+oUcqT5/b7yWPH+8Vf7hq7PdFLYz/Ttwy6ikbHJTSgWhz6bc
	 fmMkscSaLyTQxUiGYDX3j7j0nGRiEkLWCvaUjniC1dFst3LkN7k6pcuQ153oCmwZ2X
	 df32V0TX+vQ3TB4Phk9Bp/iTfSyhHbZyaQgKwgLSQp3FAHMP6dCJELcauyaZUXZTSn
	 mIh4ZIgT39B7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772140769; x=1772401269; i=teddy.astie@vates.tech;
	bh=MLNN+TTM7nCCyhQnjEzu9i5uefM5EB6jJQto4+Ymqhw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mWEwesTNGeG27+5x2QyV2OqT9+jvkpg74d5+JKO26lRKCHnOnLtj8W8Bx8JK2MOp/
	 /KAr2nbXebrEfv/F4sNta11frSEu5T42yusCR97uDMp+nyDkG7tdD4wyqbSWXNSGNK
	 VgI+K3+KugWhNKE2yTO0SfFj9UEojRBXoTj6bk6BOf5qBhPe0v7SexhKdnCRhCx2qt
	 odI/M28Y4jI6bSKW2df9cjtpT0IyUl1T9GHmjH84xCq1cGVvFVbe1R1X+8bvPoX7Jh
	 1OcPtz9tYiYFYak57N6E9lmK7foC09vAlEWRDaS0ynRydJQShUVeQ3G8b81vSksl0T
	 hgQJnWo1RQylw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=2005/10]=20xen/domain:=20Add=20DOMCTL=20handler=20for=20claiming=20memory=20with=20NUMA=20awareness?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772140767599
Message-Id: <656ff614-9165-49ce-8c55-0cfad33d4ed6@vates.tech>
To: "Bernhard Kaindl" <bernhard.kaindl@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com> <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
In-Reply-To: <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.72cbbdec2faa4e42b17a16a616dd5811?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260226:md
Date: Thu, 26 Feb 2026 21:19:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 68A301AFA9B
X-Rspamd-Action: no action

Le 26/02/2026 =C3=A0 15:54, Bernhard Kaindl a =C3=A9crit=C2=A0:
> Add a DOMCTL handler for claiming memory with NUMA awareness. It
> rejects claims when LLC coloring (does not support claims) is enabled
> and translates the public constant to the internal NUMA_NO_NODE.
> 
> The request is forwarded to domain_set_outstanding_pages() for the
> actual claim processing. The handler uses the same XSM hook as the
> legacy XENMEM_claim_pages hypercall.
> 
> While the underlying infrastructure currently supports only a single
> claim, the public hypercall interface is designed to be extensible for
> multiple claims in the future without breaking the API.
> 

I'm not sure about the idea of introducing a new hypercall for this 
operation. Though I may be missing some context about the reasons of 
introducing a new hypercall.

XENMEM_claim_pages doesn't have actual support for NUMA, but the 
hypercall interface seems to define it (e.g you can pass 
XENMEMF_exact_node(n) to mem_flags). Would it be preferable instead to 
make XENMEM_claim_pages aware of NUMA-related XENMEMF flags ?

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>   xen/common/domain.c         | 29 ++++++++++++++++++++++++++++
>   xen/common/domctl.c         |  9 +++++++++
>   xen/include/public/domctl.h | 38 +++++++++++++++++++++++++++++++++++++
>   xen/include/xen/domain.h    |  2 ++
>   4 files changed, 78 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e7861259a2b3..ac1b091f5574 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -268,6 +268,35 @@ int get_domain_state(struct xen_domctl_get_domain_st=
ate *info, struct domain *d,
>       return rc;
>   }
>   
> +/* Claim memory for a domain or reset the claim */
> +int claim_memory(struct domain *d, const struct xen_domctl_claim_memory =
*uinfo)
> +{
> +    memory_claim_t claim;
> +
> +    /* alloc_color_heap_page() does not handle claims, so reject LLC col=
oring */
> +    if ( llc_coloring_enabled )
> +        return -EOPNOTSUPP;
> +    /*
> +     * We only support single claims at the moment, and if the domain is
> +     * dying (d->is_dying is set), its claims have already been released
> +     */
> +    if ( uinfo->pad || uinfo->nr_claims !=3D 1 || d->is_dying )
> +        return -EINVAL;
> +
> +    if ( copy_from_guest(&claim, uinfo->claims, 1) )
> +        return -EFAULT;
> +
> +    if ( claim.pad )
> +        return -EINVAL;
> +
> +    /* Convert the API tag for a host-wide claim to the NUMA_NO_NODE con=
stant */
> +    if ( claim.node =3D=3D XEN_DOMCTL_CLAIM_MEMORY_NO_NODE )
> +        claim.node =3D NUMA_NO_NODE;
> +
> +    /* NB. domain_set_outstanding_pages() has the checks to validate its=
 args */
> +    return domain_set_outstanding_pages(d, claim.pages, claim.node);
> +}
> +
>   static void __domain_finalise_shutdown(struct domain *d)
>   {
>       struct vcpu *v;
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32d0..9e858f631aaf 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -868,6 +868,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) =
u_domctl)
>           ret =3D get_domain_state(&op->u.get_domain_state, d, &op->domai=
n);
>           break;
>   
> +    case XEN_DOMCTL_claim_memory:
> +        /* Use the same XSM hook as XENMEM_claim_pages */
> +        ret =3D xsm_claim_pages(XSM_PRIV, d);
> +        if ( ret )
> +            break;
> +
> +        ret =3D claim_memory(d, &op->u.claim_memory);
> +        break;
> +
>       default:
>           ret =3D arch_do_domctl(op, d, u_domctl);
>           break;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7cd..610806c8b6e0 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
>       uint64_t unique_id;      /* Unique domain identifier. */
>   };
>   
> +/*
> + * XEN_DOMCTL_claim_memory
> + *
> + * Claim memory for a guest domain. The claimed memory is converted into=
 actual
> + * memory pages by allocating it. Except for the option to pass claims f=
or
> + * multiple NUMA nodes, the semantics are based on host-wide claims as
> + * provided by XENMEM_claim_pages, and are identical for host-wide claim=
s.
> + *
> + * The initial implementation supports a claim for the host or a NUMA no=
de, but
> + * using an array, the API is designed to be extensible to support more =
claims.
> + */
> +struct xen_memory_claim {
> +    uint64_aligned_t pages;   /* Amount of pages to be allotted to the d=
omain */
> +    uint32_t node;  /* NUMA node, or XEN_DOMCTL_CLAIM_MEMORY_NO_NODE for=
 host */
> +    uint32_t pad;                 /* padding for alignment, set to 0 on =
input */
> +};
> +typedef struct xen_memory_claim memory_claim_t;
> +#define XEN_DOMCTL_CLAIM_MEMORY_NO_NODE    0xFFFFFFFF  /* No node: host =
claim */
> +
> +/* Use XEN_NODE_CLAIM_INIT to initialize a memory_claim_t structure */
> +#define XEN_NODE_CLAIM_INIT(_pages, _node) { \
> +    .pages =3D (_pages),                  \
> +    .node =3D (_node),                    \
> +    .pad =3D 0                            \
> +}
> +DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
> +
> +struct xen_domctl_claim_memory {
> +    /* IN: array of struct xen_memory_claim */
> +    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
> +    /* IN: number of claims in the claims array handle. See the claims f=
ield. */
> +    uint32_t nr_claims;
> +#define XEN_DOMCTL_MAX_CLAIMS UINT8_MAX /* More claims require changes i=
n Xen */
> +    uint32_t pad;                       /* padding for alignment, set it=
 to 0 */
> +};
> +
>   struct xen_domctl {
>   /* Stable domctl ops: interface_version is required to be 0.  */
>       uint32_t cmd;
> @@ -1368,6 +1404,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_gsi_permission                88
>   #define XEN_DOMCTL_set_llc_colors                89
>   #define XEN_DOMCTL_get_domain_state              90 /* stable interface=
 */
> +#define XEN_DOMCTL_claim_memory                  91
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1436,6 +1473,7 @@ struct xen_domctl {
>   #endif
>           struct xen_domctl_set_llc_colors    set_llc_colors;
>           struct xen_domctl_get_domain_state  get_domain_state;
> +        struct xen_domctl_claim_memory      claim_memory;
>           uint8_t                             pad[128];
>       } u;
>   };
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 93c0fd00c1d7..79e8932c4530 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -193,4 +193,6 @@ extern bool vmtrace_available;
>   
>   extern bool vpmu_is_available;
>   
> +int claim_memory(struct domain *d, const struct xen_domctl_claim_memory =
*uinfo);
> +
>   #endif /* __XEN_DOMAIN_H__ */

Teddy


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



