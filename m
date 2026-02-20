Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EPdGCbdmGnYNgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:16:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACC16B233
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237726.1539982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYmj-0002qg-TH; Fri, 20 Feb 2026 22:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237726.1539982; Fri, 20 Feb 2026 22:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYmj-0002nk-Pd; Fri, 20 Feb 2026 22:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1237726;
 Fri, 20 Feb 2026 22:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjHa=AY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vtYmi-0002ne-Ec
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 22:15:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af73a640-0ea9-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 23:15:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2913C4EE7806;
 Fri, 20 Feb 2026 23:15:37 +0100 (CET)
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
X-Inumbo-ID: af73a640-0ea9-11f1-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771625737;
	b=Jy9PZvmv0XHVgphT6huxJqKJHg7OZZSYtrJ58L/2jzFt/YqsTne+vYgfWGGLKM22i5Mq
	 IvdC/6tvJL1ex018at1UAQqRvIqHeSEPaFqTYL8piBixFDtBag0UOvWKggrtmDRC9R8ZZ
	 jHc8hHztDy51mzS+kU66iPb/69Ri4hQ8PuyIoWAjrVqhHZsm0i0XlCS1vJSQfwI1goJtT
	 tEgYsoAt+yej02GG57Cct4qIiH3m/r1dwRIiIdBAaO3s751DV2NnEMF4ridlJ82M5qF5K
	 IcIpSVIIOLvgrM/o7BiJlZdd1BQ3HdHnkb3fz+tNOoqp/iPFz0Px4Tv9oWrEA8/AdQ4ka
	 QOz+FApBNkSO78dspDVmm8Y/EV026u1hDTlJ2m2/Rnk5Aotd67kNTiiKPZ5bEj9iGYWia
	 tqRxOR18T17afA9WK6JUtemRfOPjVdLlOTreGu3DcY06AQqKjl8uLMtLDQmzKZjqSphbE
	 /1XRxDL/1JB4yqabdc4jBKAHWJKeMnKBzktuDlXiVipl0DOq8G4pevV5UUalLF4MaVyW5
	 4HvZwcIifLvTKrOrtooGSCAGKfS0z2lYr/wkwfIlgoENTrCpuFMamHnXnrp24CKMhZi7K
	 gsRysVeUR+iaGUvJ7zFoxxvw1vJiEQH3dqltSTJeQlZSU4xsucp29n/2hAF3Jkc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771625737;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=EN/3HH/VIPh5HXiOGshM4hir4fjZy/kgf/ECL5VqcoU=;
	b=stgJLXcEFrVbzWQkS6S+idXdJWZlb04/xrXTq516cPxVW5WRHYsuP1GfMhamv+qHm5Ix
	 k3BguW5Sn0uvNQbGE6pSrTRFuiHjgr/WHaiv93gAzViCFxM6EMZaHnbxxv8qI5BnQC0yT
	 dDg21o2ee1F0+ht6+ovXi7SLXt3BBUsNF9wDmkY5NEH1m3JT6gbwwyQ3RVax7ZRIQTbsM
	 6QWDmxFJ+ISU/N5Fj+Pw2YfXU/HLDImF+MdQqk2DWw4QOK/TrLqNTxHvRTZM2Ghpx1r2A
	 dXp46bjKIEUIon0zdGJRXgVPW6K+zr7Bbhn9Xt2Pt9vX/6hZd/S/RWdOg7SFAaXB6YrP/
	 LEkGTH0H1l3+V0jd+N7oDlkCpVuVDmVm9GgSBZVF8pPeF6vgIy3o9Io/Tc+ywzZv66a8m
	 Qm5h9a55pN7UEEZwJ9YHPzIgGSbEwx98t1ygyW7dTzh9MYYy6UGwmqNcVfef59l+LzGtE
	 DMS45oINW7zuEVv4PmwmGhw0cayuDTzhkZoLO4aHc2xfqONDn6MQ43BGC7G+zU0F5ZzoE
	 RkeRiKmler66ef6wREhPOSO/HFgvsaZAIjBnJiqHb8+tAjEH5IBrmh8cvlUA6FPV36+s7
	 N7eKezKMkJBVLryc73R7WW9NfspE/0hOO86hr0ETeeqhRBZ6DR7ub1CQ8w0/3U4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 23:15:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 08/12] arm/pci-designware: Fix MISRA violations
In-Reply-To: <20260220214653.3497384-9-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-9-andrew.cooper3@citrix.com>
Message-ID: <0261cb56885d241d010467e8ff24e169@bugseng.com>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linkedin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 12ACC16B233
X-Rspamd-Action: no action

On 2026-02-20 22:46, Andrew Cooper wrote:
> * Move includes inside the header guards (D4.10)
>  * Use NULL in preference to 0 (R11.9)
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

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
>  xen/arch/arm/pci/pci-designware.c | 2 +-
>  xen/arch/arm/pci/pci-designware.h | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci-designware.c 
> b/xen/arch/arm/pci/pci-designware.c
> index 0bd67524ac8b..6b85213f637b 100644
> --- a/xen/arch/arm/pci/pci-designware.c
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -285,7 +285,7 @@ void __iomem *dw_pcie_child_map_bus(struct 
> pci_host_bridge *bridge,
>                                      bridge->child_cfg->phys_addr, 
> busdev,
>                                      bridge->child_cfg->size);
>      if ( ret )
> -        return 0;
> +        return NULL;
> 
>      return bridge->child_cfg->win + where;
>  }
> diff --git a/xen/arch/arm/pci/pci-designware.h 
> b/xen/arch/arm/pci/pci-designware.h
> index b9deb3b138ae..bd93dab6f2f1 100644
> --- a/xen/arch/arm/pci/pci-designware.h
> +++ b/xen/arch/arm/pci/pci-designware.h
> @@ -6,12 +6,11 @@
>   * Based on xen/arch/arm/pci/pci-host-generic.c
>   */
> 
> -#include <xen/pci.h>
> -#include <xen/init.h>
> -
>  #ifndef __PCI_DESIGNWARE_H__
>  #define __PCI_DESIGNWARE_H__
> 
> +#include <xen/pci.h>
> +#include <xen/init.h>
> 
>  #define PCIE_ATU_VIEWPORT               0x900
>  #define PCIE_ATU_REGION_OUTBOUND        0

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

