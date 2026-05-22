Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNK7CaOQEGqIZgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:21:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE855B8196
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317153.1586389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTYi-0004Li-P1; Fri, 22 May 2026 17:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317153.1586389; Fri, 22 May 2026 17:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTYi-0004Jg-MM; Fri, 22 May 2026 17:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1317153;
 Fri, 22 May 2026 17:21:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQTYg-0004Ja-U7
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:21:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQTYg-007LcX-3x
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:21:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a10905c-5cb7-0a2a0a5109dd-0a2a4501eaa2-24
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:21:14 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a109089-c1f2-0a2a45010019-d155d0aab9f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:21:14 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39378db197aso78764601fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 10:21:13 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779470473; cv=none;
        d=google.com; s=arc-20240605;
        b=jHVR/m7AexpdA4W/XMumOkbJpMyOpi5PveOU4vqIo0nRzgQkUJtrFjITEkJgysAYZM
         mqjyyMOgKcej+0Y/kOsgsz9QdjOdkd7RbQjjHF/N61y/Bt68pYctlwdJNNfF8TUr0MJZ
         hJSjhmrXqd/b0t3BrIlhjLDgrdPla+wz1oB5iISByVfBxWCLx2vojuGt70GiZU2IIKAo
         1WAOQCJhKsVaiD01KdYB5CUNlVHvTLiBeGE5ofYu07bG7pkFB2ELY/DokVlPSDwt2uEh
         MIyJyzxVSkKHUd7ZBig4ypIj7nSLU80RBa3ueag70jjt+ebdrad0ezpcCaI/8RbsI+nJ
         O4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q3X2LTkGpGrzNkaanU5OXsB+tno/ATiL8zpNRdRupBY=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=Xv66pTD9hx+K/LSxjJjR9o/ERVWOhR1OdkjppyWjlePahhKRKiPevoEjvnxEf1Ij9c
         T/vnPm1GSIqLuhZFdHlBxDks13f28O07sBW9GCx4gxAbmYFP1Dn7fa4MzDc/huRqCrik
         aHKG7Q+BlFOCLV/7yaEPqlcx3C1P1BsPyLzqGyAcEifa8UPRxReCnn8K8ZjjsPGi3BGO
         ps9lQ3NHZsRNMb2aBZnN7In/YH5S9O1130nXmez1JuitZ132uv3vEnTuOrXMO7iXWtG1
         2Gb4CToRcecxGlLWvy3oFYSaKSiEY4cDe/ayB23Qu7Ui3761p6nx7B8t1o/fo4saGIA4
         SyQw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779470473; x=1780075273; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3X2LTkGpGrzNkaanU5OXsB+tno/ATiL8zpNRdRupBY=;
        b=bmwbALPmTgLBes/X+U3VZNQvrT2Kjkd6TU+Q0fXTqi1UMcdC5z1+shlqPY3wlmS7vl
         YbSM0gStmbcngm3zc/I++2GYqe3b4ul8DSDGUxh7EkqOPuOkbYpgFJlI6zUlNaD3uGBG
         6tuJo2Nmwl+teTAJfgA4EzYlRNn/igdnQMSkwTv4jT2gX9wGlkWUKSbrlSJ523YbtQL5
         XA/7QLtuCB8wsrW0ECuhjK/GILmlj8A0M5Fh3fnlthuwGBp+mqjB0OqUtjw1VABtx14o
         3TLnuOkGHFLLxXj/g/XHOC5VTIACXH833W1FYQDARAMV6KMXV7tUHgV6+5NhH3TZjfbQ
         Qwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470473; x=1780075273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q3X2LTkGpGrzNkaanU5OXsB+tno/ATiL8zpNRdRupBY=;
        b=pq/qJogvgabTEuV981Yt7f4zn9L/Vq4Fjkey+BJoRP75MJ56geACDYNi6bgTpK3FYy
         RjVNfSFDcZG0w4WlmuT6yE8G4sL2+CVb1LChwSRTPzRp9GxPt0Ymg2ejBIp9CFIvmkwS
         kvRzXPUjT9l8gZiCpzOa476qQbHJUzCRUyN9eEw/05MvUOljmjmBrx/eGKk8ThSj7woD
         5WwSIBZIHOypLZtjj6HvuHEjk6lj3rMn52q1yexKtPSXJBEP68Yu5Wb9Ly4iJANouMFX
         dBtV8iOlJsJWrDZQ77yXeP1LPFDpY0Y9mJOvc0heNERQ+mHBi+Y9VuL+Ec11RCKiNaSq
         N/PA==
X-Gm-Message-State: AOJu0YyhrBXph53GGnDqDj+GrRbTHs37xb96iaFU6t6xZ1O0qRbcuM+4
	uPnDvz31bvdK5fbwsiIINxRRY1R1CCINruRL4O+mVH2iy1naPg1eBheV2SiXA+71jzYa93QC4Xb
	1yliOoDu1tGh9XkNkrKvUNT7fw1ci49Y=
X-Gm-Gg: Acq92OHJlTbrcvgA7ljuQ+bIqibjmP0jM8QDjrSfg4xVWVlHmSa/swdEwMqQE6WFC/o
	r9qemUr7VQHAa8SigtGr5808o6oCZwBPidAXFf/RLDO96EwUzDfCFJLi2W2hvGnyIZ9jIbTQv2y
	ZqR1htiQZg3PegWWl+XZXxqDq00IP12igJGTVE5mePghTMXblfqBW3O9q0X8yHVsn9lO5T0JCKu
	4onX1jo3Rd9TJmtsMJSHNuStHaLhV31V2MRyfuJ4Qx7M4or3CmTt8qKtrFGyV2G9E9bYX/qXZJR
	onHkgL7PPB6r6Cg=
X-Received: by 2002:a2e:bd86:0:b0:393:975b:5634 with SMTP id
 38308e7fff4ca-395d8c0f870mr22124781fa.11.1779470473127; Fri, 22 May 2026
 10:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260522165238.844649-1-dmukhin@ford.com> <20260522165238.844649-2-dmukhin@ford.com>
In-Reply-To: <20260522165238.844649-2-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 20:21:01 +0300
X-Gm-Features: AVHnY4LecR-n6Qq4gQ9i09UQsRZlM4uvQfNwQFRN7pqgpAJwxikNPgcM8ccH0Ss
Message-ID: <CAGeoDV_c6NbDXC5Z8x+qqaOtVbXzpOSeJYLBWtk-02LF9opd4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] argo: lower level of noisy connection-refused log
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779470474-B7957FF4-0FEB443B/0/0
X-purgate-type: clean
X-purgate-size: 1495
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5DE855B8196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 7:53=E2=80=AFPM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Lower the log level of the "connection refused" log line, as it can
> spam the logs when a dom0 service using the Argo hypercall tries to
> communicate with a domain that is still starting up.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped duplicate "argo: " prefix
> ---
>  xen/common/argo.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 28626e00a8cb..98a3db7fd070 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_a=
ddr,
>                                          src_id.domain_id);
>      if ( !ring_info )
>      {
> -        gprintk(XENLOG_ERR,
> -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:=
%x)\n",
> -                current->domain->domain_id, src_id.domain_id, src_id.apo=
rt,
> -                dst_addr->domain_id, dst_addr->aport);
> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%=
x)\n",
> +                     current->domain->domain_id, src_id.domain_id, src_i=
d.aport,
> +                     dst_addr->domain_id, dst_addr->aport);
>
>          ret =3D -ECONNREFUSED;
>      }
> --
> 2.54.0
>
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

~Mykola

