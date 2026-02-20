Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ALLAujhmGmHNwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:36:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5BF16B43C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237754.1540002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtZ6U-0006Sj-JU; Fri, 20 Feb 2026 22:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237754.1540002; Fri, 20 Feb 2026 22:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtZ6U-0006RI-Go; Fri, 20 Feb 2026 22:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1237754;
 Fri, 20 Feb 2026 22:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjHa=AY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vtZ6T-0006RC-70
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 22:36:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896684e0-0eac-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 23:36:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E88514EE7812;
 Fri, 20 Feb 2026 23:36:01 +0100 (CET)
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
X-Inumbo-ID: 896684e0-0eac-11f1-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771626962;
	b=ihIQGZ1EDvHB4wu0WRVp/urVYsxKrsnRsG6vqzdm1V8j6azEeKo2un9LDqH2+59XDLu2
	 lHVfYbmGHJHTu+/umSABdeVZ5VoYaQM6EWT6qmZ8C4UIVMIZGQdqhTBu65vea0Qs42u4Z
	 e9LqzuuUlNzKja5231YWWhD+MuQsWo5GmMPfwuCcrW+g5pPzSQMevE46lFGF2Of5u3xWi
	 F7OUU/pTMxlVNAFAY7loIInYR7JKXe9j+D6MSwngIVd1779Hye62n4/TXmSoyjWyRvP6A
	 yQ23gKC+GwnKLspPv1j/3ncToJKOBdpTtStrIB5DE7ds5wuvDyV6xA/L3CdNumv5hmuga
	 voY9edl/Tt0cTkF5KO0KHTznGPtLKN8EY+3Kja8YlXq7mSlfAfKvGGyH9GFnQVzQoUSDc
	 QhxqldiKQ2ctUHJvoMlcySBTppMuwxBxxAfYvEwUVJUwnm4fk674GBsL0Vzze9NaJJQOn
	 v6BG+id/76+ii1ZHcKYY/2jPZH0mN6r5DC2WfLKvK+58yzbrLLtxHb7qrLwqzw+wPX6vq
	 N8tPsJ/1T9+qIn8n/yU4GjLeWLf24mTPQp20OE9DWpW8ZUh87pfWmjZw/EN1rlTUqOePW
	 I0j5Y7v49UsNGd2nhQ1cz7CyTU/pkukyRI+rbiT1GaQIYSFM7K5NuZs2aY+Di/I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771626962;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=s2wppOSq5neXKBJRad5+bFHQtqi7vTyDBV9NWHmaybw=;
	b=y7lWxImlfEyw6qzShK8EP5SsHs59Vvtrd5P+qQ/aYbgk0cZ8xWIVS6AJhR2bpDT5yG8m
	 8qhCRNkt9jBaoRKsPGJQkFuZ+2U8YO5QSd1y7dgiQmgsN10qzfjuKKqrTl11Rr06s7Yzh
	 xhv8KpsBsJWSXn+Vz/p2WFYnT3Lf2Cxkftp99woew2SSWXv5ba/3JAbBiNrIYfcdceHMk
	 XboZVTBWExFXfN64It5LYOyK1ofpfF9yEVxJzMBpuqENizXnWMuFAfhgjqaDtdO+ePzk3
	 z+Y2kgHz4EOvi4EWsNfznZg1CSmJIh2MLhkqCIpqjvL+7MaE3vW2R271wcWtxMIEsl3Dn
	 mIt9iVTPvVKzyrvJ5eUXQISI/cZgH9MAPBYY5I+nYyrLMQgikYXiL/UOBfEqwBBvdcqe1
	 yg7XWqVXmNh1N923iNdXz13Vy25zHqLVYaeo+4OCzCk+2X96RA8z4hQeLsASA+OMxVw/S
	 7+fEa+y57+rGF+6hejZa39/kIYqtcsHRm2iG9d7GB9sGfeczusyB/PNQozAPlKZk2ehf4
	 duptNznrfOlQp4sWlfrA1f1chibquBzgLTDJuqcp5iOVgIqAAu8yh31YtwTlqR0REXezi
	 Hba+vIiSEOZp1l8gis2uMc3ChQbbsL4SDSpQBcpQHPFi6Vsy84TdMGuQTENUYsw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 23:36:01 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 10/12] xen: Adjust break/fallthrough statements
In-Reply-To: <20260220214653.3497384-11-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-11-andrew.cooper3@citrix.com>
Message-ID: <01cab67d11857d4355d8d130a676a9aa@bugseng.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 6F5BF16B43C
X-Rspamd-Action: no action

On 2026-02-20 22:46, Andrew Cooper wrote:
> sh_destroy_shadow() has a spelling of fallthrough which doesn't match 
> the
> permitted pattern.  Convert it to a real fallthrough (psedo)keyword.
> 
> Elsewhere, insert breaks at the end of the default statements.
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
>  xen/arch/arm/pci/pci-access.c     | 2 ++
>  xen/arch/arm/pci/pci-designware.c | 2 ++
>  xen/arch/arm/tee/optee.c          | 1 +
>  xen/arch/x86/mm/shadow/common.c   | 2 +-
>  4 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/pci/pci-access.c 
> b/xen/arch/arm/pci/pci-access.c
> index c0533c00c9a5..2b23d552bbfb 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -63,6 +63,7 @@ int pci_generic_config_read(struct pci_host_bridge 
> *bridge, pci_sbdf_t sbdf,
>          break;
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
> 
>      return 0;
> @@ -89,6 +90,7 @@ int pci_generic_config_write(struct pci_host_bridge 
> *bridge, pci_sbdf_t sbdf,
>          break;
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
> 
>      return 0;
> diff --git a/xen/arch/arm/pci/pci-designware.c 
> b/xen/arch/arm/pci/pci-designware.c
> index 6b85213f637b..902da19e8c98 100644
> --- a/xen/arch/arm/pci/pci-designware.c
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -48,6 +48,7 @@ static int dw_pcie_read(void __iomem *addr, unsigned 
> int len, uint32_t *val)
>          break;
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
> 
>      return 0;
> @@ -71,6 +72,7 @@ static int dw_pcie_write(void __iomem *addr, unsigned 
> int len, uint32_t val)
>          break;
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
> 
>      return 0;
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 699e8d536862..f719d9d767ab 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1206,6 +1206,7 @@ static void do_call_with_arg(struct optee_domain 
> *ctx,
>      default:
>          /* Free any temporary shared buffers */
>          free_shm_buffers(ctx, call->xen_arg);
> +        break;
>      }
> 
>      put_std_call(ctx, call);
> diff --git a/xen/arch/x86/mm/shadow/common.c 
> b/xen/arch/x86/mm/shadow/common.c
> index 96986ee2553d..5834c265f76d 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1213,7 +1213,7 @@ void sh_destroy_shadow(struct domain *d, mfn_t 
> smfn)
>  #ifdef CONFIG_PV32
>      case SH_type_l2h_64_shadow:
>          ASSERT(is_pv_32bit_domain(d));
> -        /* Fall through... */
> +        fallthrough;
>  #endif
>      case SH_type_l2_64_shadow:
>          SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 4)(d, smfn);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

