Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB1FOhPZmGnlNQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:58:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915516B161
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237706.1539972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYVj-0007y7-EX; Fri, 20 Feb 2026 21:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237706.1539972; Fri, 20 Feb 2026 21:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYVj-0007vb-Bh; Fri, 20 Feb 2026 21:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1237706;
 Fri, 20 Feb 2026 21:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjHa=AY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vtYVi-0007vV-LB
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:58:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b6cffe8-0ea7-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:58:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 93C724EE7813;
 Fri, 20 Feb 2026 22:58:03 +0100 (CET)
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
X-Inumbo-ID: 3b6cffe8-0ea7-11f1-b164-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771624683;
	b=od/wvcOw5vbDQpvmAEMfDB20D5XZoOGEbxlfGQJVjawtDSksmyzYGi/olyuPPi/EDuZF
	 pXaGkLhv3dCKptrqFd6qP7AyQ4Q2/gL+f4HPr7/i3EVg87AWkDlrtMN8TgRX7YeO1dhbt
	 rdAf5i7iUsk8bDszyQIP2cKIRWJTZrOezywvmsHNOUC3H8bRhiX9P+0INN68DVBBGJ9og
	 14KCiG5Wppg50cpFnbKSTe4bdFRwhJvqsbZubA/VZljezFr0pYXY49m3V4H5fviiBKQ05
	 sDq0UhsNusr8zBukC/eV8pqCaVwwfapXJQaO/evI2dw+EifLBIWXP9lLssew8WPzEdoDQ
	 3NoEbpvKm5TwZnPrOdyRCD6Lfur+sKJIOwqKLqttrWJsTOTNaGXZ/zrxIFI8zvhCYG2g4
	 KUTwQQLtEQe8Fz22epXode/C3Aao46gT6TBafijnrBdEshsdcYZpT6wUqRtgwTejyU64L
	 w1FfJAwfDhKj0xU42hJg+4+eHy6U4w6qTn8EEVoUYeGdKlOZ5F3EI3epbD6FjMrGO/VUD
	 TzV03Ne8JtuQ3WD7LNZG2kZUs/6nzPmphnS9pl+aCa2IiREdlelfT/BpenVbL7LJmwtcR
	 e0Rl46A40B1I4bBCZbl5EPiX1F+ZC/riH4sW90KXy2PYwV68NG1YFFRPsHAATvc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771624683;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=SQUL1z7BRzL3A60Mgp+F9p0fDu9xJ4j1gn+DCTcytBU=;
	b=mlFpqNtKw55Ev+PZoM0AIgXFmzcAdp0og1MIyH34KTCe1gTyr79FyGilNHyzo42y/ds5
	 Jxknc9qTZ/p2pSLnEYFydeggecJFplDLKLD8hIU59ClteX5zKgJsDrCV8/S97Vy5QcWO/
	 W9mfh/Jlv3sFiKXRkRNUJIr/azzUtvO3jNCR8MQkjEDY5GOfyIaB4pTHKBu3vLEiXt/Sv
	 A+BEkZvgxniTUQsa6almXBsv6+W/I1M8TpuOTrOQqSre9Pt02QlH82GprX+gG6WCgBEvY
	 wLddFwDBpLLzHl7cCNUngBOCbLBPafZ45Su1hEWt3plG68Rek71DXH23eIM5cmOc+LpUZ
	 LJodPaYm8uu1gbO4OD9xjalnDd5QqoJ7aYDLeTMTTh+IfChMRS98EGhjfEkufir8WIbSv
	 3rlSFAuIuHeCMJZfHLtJHLYgdH0pRqRi2F1Zb1mb6a8rrtqMm+gCCcSAqeqTea2CqpWDQ
	 HkaUl9qeizEJ2cS0NPhUe0mhFYrr215Ro2V8V13uQKNICRYbauFEU2PQRv9Lr/a0iRine
	 ewytvHhxHOkWw+1dun1m/oUPSDY82VbbvHaxx9ObKMoHg/9pnApbDdSM5ZT1ejb680wfS
	 VgQcjrvfz3NLUHzr7boT2DFqEWsueHi8/t6G1+r8mSFtdAVEfSBO5tB+JjF3S1o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 22:58:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 01/12] arm: Use __func__ in acpi_boot_table_init()
In-Reply-To: <20260220214653.3497384-2-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-2-andrew.cooper3@citrix.com>
Message-ID: <26db9f5f17b162c0b183cff90cb452da@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3915516B161
X-Rspamd-Action: no action

On 2026-02-20 22:46, Andrew Cooper wrote:
> Elcair rejects __FUNCTION__ as nonstandard syntax and a R1.1 violation.
> 

s/Elcair/ECLAIR/

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

>  xen/arch/arm/acpi/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index db5085e15d84..4ac0fd8f51e8 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -264,14 +264,14 @@ int __init acpi_boot_table_init(void)
>      if ( error )
>      {
>          printk("%s: Unable to initialize table parser (%d)\n",
> -               __FUNCTION__, error);
> +               __func__, error);
>          goto disable;
>      }
> 
>      error = acpi_table_parse(ACPI_SIG_FADT, acpi_parse_fadt);
>      if ( error )
>      {
> -        printk("%s: FADT not found (%d)\n", __FUNCTION__, error);
> +        printk("%s: FADT not found (%d)\n", __func__, error);
>          goto disable;
>      }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

