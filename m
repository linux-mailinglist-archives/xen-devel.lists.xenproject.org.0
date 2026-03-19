Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFa3CG/Bu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:27:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D52C8A30
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256835.1551309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39eg-0007pb-0P; Thu, 19 Mar 2026 09:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256835.1551309; Thu, 19 Mar 2026 09:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39ef-0007n6-Tr; Thu, 19 Mar 2026 09:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1256835;
 Thu, 19 Mar 2026 09:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEY9=BT=bounce.vates.tech=bounce-md_30504962.69bbc15f.v1-3cce8e40ec434d269c9e851992b0bde6@srs-se1.protection.inumbo.net>)
 id 1w39ed-0007mz-PJ
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:26:59 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5d18994-2375-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 10:26:57 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fc0hH423xz5QkLSW
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 09:26:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3cce8e40ec434d269c9e851992b0bde6; Thu, 19 Mar 2026 09:26:55 +0000
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
X-Inumbo-ID: c5d18994-2375-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773912415; x=1774182415;
	bh=BDPqBepCOnJf7AdxDoz0lCGeWKsigInjP2+Wov2y/8Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zpuS/aRDAzni4A8bkmmHuFEWRPdGiYM9rs5obdxC6gs1+uW9Iyfsl0291F/C+F+0K
	 nrnru9usF04YLoNfxzVL54kvakARiRAn9iHHkVfpBHkWjcB1Ih8TVDvgJxlr6jQJy8
	 TmtTrPD2huyxvVqFDyK16wzuMs8dS2lQnDBrkn5M2GDBmcT65HVETRsjSD5c0SmIhH
	 hHSH5h2uejP1tOMBsSfbnydZGwHpTULZ5CAI7R4LfIQnTVKHDGyddisKiVBXec2RB3
	 7grUKpgjtlRRicObG5q3d8b0Z0kO6FjnrrhQ3OFmq1Z7a/sqW/5tbcOlwXqCyq2tJu
	 QzTT45vmAPXeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773912415; x=1774172915; i=anthony.perard@vates.tech;
	bh=BDPqBepCOnJf7AdxDoz0lCGeWKsigInjP2+Wov2y/8Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SJd5snZk0g+AXLglUKlnTkm8TWI25ffbdlR98LimKpD2ZsUofpfhBNs1IVjrhJqqU
	 5y9d1FagslPHu2TWoMOiEYbzVM9BVNNEz/Cf1jC715W+pPiLN9hmJxYiluhAKvXFZU
	 zUSLH9qwqeBX6TIPgIVyEa2VOcKN4Qg84dOraT/HAI5vcml7kyg4kqeDdReLAlZwZo
	 /dtnK/lZPV8HDhidYV4EVYIh2/UHmf8GbgEpf3C+ryeAbm4vOqeyIFEpRyy5N1V70u
	 r/VxkhvyVC4H2OnX9eDDne35d0KvsvrbUfXCybJA0KtH1+G6Zhbg0X8wdczhvZYBLk
	 YSjW8bW5D2HXw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2009/11]=20tools/libxl:=20add=20support=20for=20xenstore=20quota=20in=20domain=5Fconfig?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773912414970
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Nick Rosbrook" <enr0n@ubuntu.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <abvBXjUXfHHJTE29@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-10-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-10-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3cce8e40ec434d269c9e851992b0bde6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 09:26:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	NEURAL_SPAM(0.00)[0.856];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C39D52C8A30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:06PM +0100, Juergen Gross wrote:
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 5be47f687f..86e43e7133 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -2533,6 +2533,16 @@ static void retrieve_domain_configuration_end(libxl__egc *egc,
>          }
>      }
>  
> +    /* Xenstore quota */
> +    {
> +        libxl_xs_quota_set_dispose(&d_config->b_info.xenstore_quota);
> +        rc = libxl_xsquota_domain_get(CTX, domid, &d_config->b_info.xenstore_quota);
> +        if (rc) {
> +            LOGD(ERROR, domid, "Fail to get xenstore quota");

It would be useful to print "errno" with LOGED, right?

> +            goto out;
> +        }
> +    }
> +
>      /* Devices: disk, nic, vtpm, pcidev etc. */
>  
>      /* The MERGE macro implements following logic:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index c5ddc40f35..ee8f89e462 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -760,6 +760,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("vpmu", libxl_defbool),
>      ("trap_unmapped_accesses", libxl_defbool),
>      ("xenstore_feature_mask", uint32, {'init_val': '~0U'}),
> +    ("xenstore_quota", libxl_xs_quota_set),

This would deserve a new LIBXL_HAVE_ macro, or a mention about the new
field in the macro added in the previous patch.

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


