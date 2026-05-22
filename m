Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGqDDHWREGqIZgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:25:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D015B824F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317174.1586417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTcC-0005rK-M6; Fri, 22 May 2026 17:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317174.1586417; Fri, 22 May 2026 17:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTcC-0005ox-Ij; Fri, 22 May 2026 17:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1317174;
 Fri, 22 May 2026 17:24:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQTcB-0005op-6j
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:24:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQTcA-000E2l-J3
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:24:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a109123-e002-0a2a0a5209dd-0a2a4509898c-44
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:24:50 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a109162-2497-0a2a45090019-d155a72db81c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:24:50 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a8dc2606a0so8179718e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 10:24:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779470690; cv=none;
        d=google.com; s=arc-20240605;
        b=GhqXVj4o3pcsMM7MQbrVwJtJJ1UylxzoBNt38UuGfacErkcN3Re43D6glbKAhu+iBu
         iuRqJNxro7cByI8MTVK6ALoDeajsaWOb8wWO4CKzqE9n8uYfczjxdZOViCPAFtiwa2tn
         f9bbMveFY4DLZn7TX/L+9PyrFQs2btOc0ZpngBBIN+XyvQUzIbHu0EwmNbewDUVvzmZg
         fXlYokpzhfAOcmP0a7OAw1/Rgequ+jX2s0YkvFxo6kwT7oFE0LAB+BmKjZdOQXhXq5LI
         c/THZseK6n0KYXv7WklLBtyErTq/W/vhkQNVJ80C2b04QNzOUO2CWcmoGfQ1mshym+sB
         I74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ/vpOKlERU5yi57m5f0o/JHTMWDqUTqTqFJmtCRR9I=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=P/lVUeDKPbM/o31XToET/tMhz0HHdRYgDb3k4QTU7pjbpLaTHbQz0FrnhdVNdzeMgP
         coXyHhS315Ppxk4Fpp8u7bLKvI1RtDdSQuZmDlEs0A5LJ7qjxPKlSc7l1D7ZItTiFmeD
         Nd6cbRAlYzRWdOdMxJk/IybikppHULV368xfkJi+7VSPlMn/fUIG0uZQgcbzgJJRFqJj
         0p/02vHXXC3GD8tP73IB+XXKikouIgNov2bd+uJ/T7M7J7DEFpUWJUV95iM+F/XHSX4T
         ABfd5ymLUXkyuqfKmnEj6MX4jWyqO47ab2QWAbSeIzl6sHF6rbdZELhsHn8P5CjTcQHy
         0XRQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779470690; x=1780075490; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ/vpOKlERU5yi57m5f0o/JHTMWDqUTqTqFJmtCRR9I=;
        b=af8Lsg88QUpdFda/qcAoeOavkg1HkV56HEOwj4u9iKTS4ZP5UsT/vBVn0vNmkI+Lbe
         mfNMbtAOK49C04g0KcYZ4xoGsokMgJ1D/D1bqu8imeH6mK5qqROP+Hcln3mfhdlZYZhB
         QXcsuNuNE9lB6NyVXpnkAt9pd4VJBNu2pmqEKK/fOdSg+GEpxMwmNPdzXEiHliFx+7Uf
         UlxL6rTGT1ucATyTaqpY0fArmOvjiva7gNw3BBjtAslfY75yiQ97R8VSKUlIVkFj6B56
         49dQA0I4Uo5WyZXrTsAsmTIKhSzkqqj9jI/CV1ixv+v+fU95cOxg1Uyu/8UBrPBBsr2N
         4EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470690; x=1780075490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ/vpOKlERU5yi57m5f0o/JHTMWDqUTqTqFJmtCRR9I=;
        b=R1JHPAxepqh+zzseo0YLZkFFFg0ooLQs+34+YBr/2sxsz5pUGhmIXq1LOmCntJqyDS
         8gMFPSEpZN8ZKk8vSqUENCTMhinDoFNjzrkQn75PK0DuoCxnS7IpLLDSEK85/9b5Vrpv
         coEa94t7EoPBYZ3TJ+zFBVzPfhiWzeXZe5Vw4Shdgu99BKDaKNKvHKI8LOzBn2bUlxr7
         KWpaUJPC7rDdGbz9p433yWQPQBFPsYqKaPN14kh3oaH0KoIADTyEc4v1jHSVftRDFGNc
         7SyAHiqYMQiCM2577WU/FE3We7ymFUmLnlX0HwvRNPXNy7GORFSDX2djnCOgQJVEBsar
         5Jxw==
X-Gm-Message-State: AOJu0Yxux0huYdiGB5a2fhLlqYFNqjr9bZ5mOfIvsQJd+UpjrAlKbaJG
	j9FUn40eAdlkDnuBBh/lOksXjy3gY8Dcrj8y13n3k2jsGQrMKE3duandVyk5U/VLQ5QB3T2t9AN
	d8taXQUQdonRCtNk+BZJwFL/9CC55BXQ=
X-Gm-Gg: Acq92OEvaU8H5h04Lkzgz1Ts7Ay0TujrDAvBJHfJrpovpxp0iVXZxZNclkePDGSMlmi
	GaN/TFEtBvjjlx6UyYSeaQn1eVujB7RROvvlcP1S+vnST/O33oEE5yCtX33ka2dGQ3jKvJ5gS2f
	CQQg8O3coEFLy4w4Yf15/cTKcGXWJy2oT28Z9MRO1WFsOP7UHF30ML18FZDojdSxn1B1lQsWM+V
	hdEvYLVu9aKE7Xsw2OhvcRFEWc/B6EWjkE2sHQZthS3/Umk9fXj/JOx38lFcfn53I2W07WqXqb9
	D1FshR7+6azQjnU=
X-Received: by 2002:a05:6512:4890:b0:5a8:f6fd:1cb with SMTP id
 2adb3069b0e04-5aa3238ed6bmr1278467e87.26.1779470689711; Fri, 22 May 2026
 10:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260522165238.844649-1-dmukhin@ford.com> <20260522165238.844649-4-dmukhin@ford.com>
In-Reply-To: <20260522165238.844649-4-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 20:24:38 +0300
X-Gm-Features: AVHnY4LZG7Lq1STBvtGuZVJT0hUQ163E5IgE3WCEme_ERWExTirtVIFpbQBnVSY
Message-ID: <CAGeoDV_CqYCM0r1QAgGxdaxcj5rJ3VeXAuv_-_iUt+ygmPk1Kg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] argo: drop argo prefix from argo_dprintk() calls
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1779470690-8B790A53-7EE86066/0/0
X-purgate-type: clean
X-purgate-size: 2561
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 81D015B824F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 7:53=E2=80=AFPM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> argo_dprintk() prefixes all log lines with "argo: " automatically.
>
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - new patch
> ---
>  xen/common/argo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 5da14c929e14..ffa1f43437ab 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -1467,7 +1467,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_i=
nfo *ring_info,
>      if ( ring_info->mfns )
>      {
>          /* Ring already existed: drop the previous mapping. */
> -        argo_dprintk("argo: vm%u re-register existing ring "
> +        argo_dprintk("vm%u re-register existing ring "
>                       "(vm%u:%x vm%u) clears mapping\n",
>                       d->domain_id, ring_info->id.domain_id,
>                       ring_info->id.aport, ring_info->id.partner_id);
> @@ -1527,7 +1527,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_i=
nfo *ring_info,
>      {
>          ASSERT(ring_info->nmfns =3D=3D NPAGES_RING(len));
>
> -        argo_dprintk("argo: vm%u ring (vm%u:%x vm%u) %p "
> +        argo_dprintk("vm%u ring (vm%u:%x vm%u) %p "
>                       "mfn_mapping %p len %u nmfns %u\n",
>                       d->domain_id, ring_info->id.domain_id,
>                       ring_info->id.aport, ring_info->id.partner_id, ring=
_info,
> @@ -1741,7 +1741,7 @@ register_ring(struct domain *currd,
>          list_add(&ring_info->node,
>                   &currd->argo->ring_hash[hash_index(&ring_info->id)]);
>
> -        argo_dprintk("argo: vm%u registering ring (vm%u:%x vm%u)\n",
> +        argo_dprintk("vm%u registering ring (vm%u:%x vm%u)\n",
>                       currd->domain_id, ring_id.domain_id, ring_id.aport,
>                       ring_id.partner_id);
>      }
> @@ -1781,7 +1781,7 @@ register_ring(struct domain *currd,
>              goto out_unlock2;
>          }
>
> -        argo_dprintk("argo: vm%u re-registering existing ring (vm%u:%x v=
m%u)\n",
> +        argo_dprintk("vm%u re-registering existing ring (vm%u:%x vm%u)\n=
",
>                       currd->domain_id, ring_id.domain_id, ring_id.aport,
>                       ring_id.partner_id);

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

~Mykola

