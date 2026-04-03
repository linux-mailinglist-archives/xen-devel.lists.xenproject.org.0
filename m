Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBSpNPVR0GlY6QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 01:49:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604E39922E
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 01:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1273371.1560216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8oF9-0003Uq-OD; Fri, 03 Apr 2026 23:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273371.1560216; Fri, 03 Apr 2026 23:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8oF9-0003TO-LZ; Fri, 03 Apr 2026 23:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1273371;
 Fri, 03 Apr 2026 23:48:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1w8oF7-0003TI-Td
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 23:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8oF7-009MjX-9u
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 01:48:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d051af-5cb7-0a2a0a5109dd-0a2a4507bfd6-6
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 01:48:01 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d051af-ba2d-0a2a45070019-aceafc1f8c1a-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 01:48:00 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D209643BAA;
 Fri,  3 Apr 2026 23:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134E6C4CEF7;
 Fri,  3 Apr 2026 23:47:57 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775260078;
	bh=A/UuuA1NVFkJMO81wS0G58dAgB2oCFTP3hEqag6xc8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GJl0pGY4rSCZdff2BVZvDGgyy/PfbnKnWwsgH/4L92t8PypTgMmGCNS58Ab86tTra
	 5NKgnGl1oFDIfLg5xe7Yf3J2iHFHk1dG/uQJIpLQZCr7OY69AvYjJbzqUvwIG5ryxW
	 /zHLZ7IKxVrKRxpWHSJqMKRfyYiC4zkjF00C+Mr/fAQNgp5PD7J8FsmEdIv0nrnPJ7
	 oyCUPGhqIjOsXeb7MNN/AuSy3sJrTQrP8nqmEA0x2ct7z32sJgecpC+AMcB8jxGYdN
	 F8GCcJKKje1tvzAR8OCYbqtAHMk2ve3lIHaBQZiOZtuhLaglBgnEPpP4XEeXVnmdWS
	 Jga7pSoh180UQ==
Date: Fri, 3 Apr 2026 16:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: xen: validate hypervisor compatible before parsing
 its version
In-Reply-To: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2604031637130.2873990@ubuntu-linux-20-04-desktop>
References: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1775260081-1274A41E-A6D6C45C/0/0
X-purgate-type: clean
X-purgate-size: 2310
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7604E39922E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026, Pengpeng Hou wrote:
> fdt_find_hyper_node() reads the raw compatible property and then
> derives hyper_node.version from a prefix match before later printing it
> with %s. Flat DT properties are external boot input, and this path does
> not prove that the compatible string is NUL-terminated within its
> declared bounds.
> 
> Fetch the first compatible entry with fdt_stringlist_get() so malformed
> unterminated properties are rejected before the version suffix is
> parsed.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/arm/xen/enlighten.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 4feed2c2498d..f69290a4c639 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -19,6 +19,7 @@
>  #include <asm/efi.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/libfdt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -218,8 +219,9 @@ static __initdata struct {
>  static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  				      int depth, void *data)
>  {
> -	const void *s = NULL;
> +	const char *s = NULL;
>  	int len;
> +	size_t prefix_len = strlen(hyper_node.prefix);
>  
>  	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
>  		return 0;
> @@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  	if (of_flat_dt_is_compatible(node, hyper_node.compat))
>  		hyper_node.found = true;
>  
> -	s = of_get_flat_dt_prop(node, "compatible", &len);
> -	if (strlen(hyper_node.prefix) + 3  < len &&
> -	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
> -		hyper_node.version = s + strlen(hyper_node.prefix);
> +	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
> +	if (s && len > prefix_len + 2 &&
> +	    !strncmp(hyper_node.prefix, s, prefix_len))
> +		hyper_node.version = s + prefix_len;

I'd prefer to go with:

  s = of_get_flat_dt_prop(node, "compatible", &len);
  if (s && len > 0 && strnlen(s, len) < len &&
      len > prefix_len + 3 &&
      !strncmp(hyper_node.prefix, s, prefix_len))


