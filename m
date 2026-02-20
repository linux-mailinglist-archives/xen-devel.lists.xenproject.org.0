Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGiRAxPkmGneNwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:45:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B69016B4B4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237762.1540012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtZFS-0008CQ-F2; Fri, 20 Feb 2026 22:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237762.1540012; Fri, 20 Feb 2026 22:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtZFS-00089w-Ar; Fri, 20 Feb 2026 22:45:22 +0000
Received: by outflank-mailman (input) for mailman id 1237762;
 Fri, 20 Feb 2026 22:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjHa=AY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vtZFQ-00089q-IS
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 22:45:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51dd6a9-0ead-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 23:45:19 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 997E44EE7812;
 Fri, 20 Feb 2026 23:45:18 +0100 (CET)
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
X-Inumbo-ID: d51dd6a9-0ead-11f1-b164-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771627518;
	b=NOFuQ7+omLDGjNeLnuRxqTNmI4VaTtauhFQKzfcO1nq9oi+XFvKOD3b8eCQqFlLo+Qfb
	 d34tWecO9w0IXW6suhYXiN7SZNbkhj1PJQ2L0bjO8iJiYBZDX+ABHqLDtHieIG3NG93lq
	 owPHsu1AYc48PsIaiMUxVagfLYMUDkIJBBIucDbM1sN6fXp1+RWuOESDTWPP22F6H1SpI
	 dU2XnngbJS220iwZh5/8F/PRMsuchA1VcW/UPUeZvhOTOZKoEKPxjw9yr/B8IDNIcuNSA
	 J7PsMoetNh2msfr0fJewNMWvTXTdFndKdiCIyCLGaFsH2Y/yfnN7P41ainN2q+fC5THAi
	 wbYWJXHtd0xHV1ml3+rm20/kzl6k7Hq4GQGOxMzNIPAQgZ/JuAa9ey6FBwjXNjNZwYDU5
	 qp2BZM8AzlX3peKTPkmRa5us1xlmWjp/ZM385iH090TT/uFaewc+JH32Y9CoiPebRFymm
	 Arx3R2hav1TJFaa3tFlwrpm/BZfEhUvbovjsYnvomg8NpWa4faxLvX2wWeSCpxBNk2+W3
	 kyfjrkqe4sDDsCI5tB5H3451DJT2vnAx9CdKmAyyVQwEP/+De36vMi/9oZsTVBP61ldOv
	 hpiCs9XbvXDrfjKvumOqq5l3YpTmeuCYUSlzy/eJSMyHTjKazrsb9fyFmxfLCL8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771627518;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZuT8Al7qRVwTf+zcSkcaotR4xT/ASXYI3j/VG1xYTKk=;
	b=5NlwkaeKzYZxZrHoAyyQIaa3WPi6jTxXqF57aykLSXzJl+c2uzrPJBUPkCQY83FrWbuu
	 Yj/Io3SEFQJmmMJq/4oDOKGQBqhPhvYl8mWdNs85F0FAcL9VAr1hutgoctxhgq5c9WzFC
	 335lw6z7xm8vRUY1N7cU6D04TH7cRd2U9KPCMi6ZGqbenV3goo4IpuaZpLw4KOv5SxNd5
	 71OinRRGPzMx4dvWNcYroxibxSu8BT4PCIz8kWu/lFYKf5GM1+JaGBuvLt5THreNGkaZd
	 0oF4+RudnavWeqabQaHCv2OEzUopYuht7LKaCh2d8r9aoQlezPw7gwDSc+IJyfxpVVfDD
	 nzm2ee24t4fAJ7yu8/Kf+vRQP7NkAW8vtaF2cSQcltt/6/4/D3YQYxI/Fw475Q9qSZaem
	 5UQ2Dn9pz6d9/EPwz7fr1xZKZvyWNsUYRWpsln6wILjveSw0wfqHCSkf462eQgoMSvKFe
	 asBidUpYbRaJwHpfGOnrzyiam/zbbnkuYofntDVUV4eG5gIj+rlEanwzcudXrTsoYCRl4
	 Jil3oVUJtwMAOSYA1eRTJo4sOrgoLE02f56JGVcExZfIYXIKNPIlMzAyFYHn9EEGQaKRM
	 KRmlc+qNcpS/UDNE5zyJFLGS40wvnAUWxpBlYAxSbIGsYB6m066FegXMN+e5fKM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 23:45:18 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
In-Reply-To: <20260220214653.3497384-12-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
Message-ID: <a917dc27a7fba87a8f829558444545bb@bugseng.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 6B69016B4B4
X-Rspamd-Action: no action

On 2026-02-20 22:46, Andrew Cooper wrote:
> Fixing Rule 20.7 violations.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>


Two minor nits below

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
>  xen/arch/arm/pci/pci-access.c       |  6 +++---
>  xen/arch/x86/include/asm/bootinfo.h |  2 +-
>  xen/arch/x86/mm/shadow/multi.c      |  2 +-
>  xen/common/kimage.c                 | 11 ++++++-----
>  xen/common/livepatch.c              | 11 ++++++-----
>  xen/crypto/vmac.c                   |  8 ++++----
>  xen/include/xen/libfdt/libfdt.h     |  6 +++---
>  7 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci-access.c 
> b/xen/arch/arm/pci/pci-access.c
> index 2b23d552bbfb..7bd6877596d4 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -16,7 +16,7 @@
>  #include <asm/io.h>
> 
>  #define INVALID_VALUE (~0U)
> -#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
> +#define PCI_ERR_VALUE(len) GENMASK(0, (len) * 8)
> 
>  static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
>                                       pci_sbdf_t sbdf)
> @@ -139,14 +139,14 @@ static void pci_config_write(pci_sbdf_t sbdf, 
> unsigned int reg,
>      void pci_conf_write##size(pci_sbdf_t sbdf,              \
>                                unsigned int reg, type data)  \
>  {                                                           \
> -    pci_config_write(sbdf, reg, size / 8, data);            \
> +    pci_config_write(sbdf, reg, (size) / 8, data);          \
>  }
> 
>  #define PCI_OP_READ(size, type)                             \
>      type pci_conf_read##size(pci_sbdf_t sbdf,               \
>                                unsigned int reg)             \
>  {                                                           \
> -    return pci_config_read(sbdf, reg, size / 8);            \
> +    return pci_config_read(sbdf, reg, (size) / 8);          \
>  }
> 
>  PCI_OP_READ(8, uint8_t)
> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
> b/xen/arch/x86/include/asm/bootinfo.h
> index 4f2cc5906e59..b3a6b2acf3ac 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -75,7 +75,7 @@ static inline unsigned int __init 
> next_boot_module_index(
>  #define for_each_boot_module_by_type(i, b, t)           \
>      for ( (i) = first_boot_module_index(b, t);          \
>            (i) <= (b)->nr_modules;                       \
> -          (i) = next_boot_module_index(b, t, i + 1) )
> +          (i) = next_boot_module_index(b, t, (i) + 1) )
> 
>  #endif /* X86_BOOTINFO_H */
> 
> diff --git a/xen/arch/x86/mm/shadow/multi.c 
> b/xen/arch/x86/mm/shadow/multi.c
> index 3bbaceec1287..9de60720db20 100644
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -793,7 +793,7 @@ do {                                                
>                     \
>  do {                                                                   
>  \
>      int __done = 0;                                                    
>  \
>      _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p,                        
>  \
> -                         ({ (__done = _done); }), _code);              
>  \
> +                         ({ (__done = (_done)); }), _code);            
>  \
>      _sl1mfn = sh_next_page(_sl1mfn);                                   
>  \
>      if ( !__done )                                                     
>  \
>          _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code);     
>  \
> diff --git a/xen/common/kimage.c b/xen/common/kimage.c
> index e1aec5a18a54..972301368443 100644
> --- a/xen/common/kimage.c
> +++ b/xen/common/kimage.c
> @@ -491,11 +491,12 @@ static void kimage_terminate(struct kexec_image 
> *image)
>   * Call unmap_domain_page(ptr) after the loop exits.
>   */
>  #define for_each_kimage_entry(image, ptr, entry)                       
>  \
> -    for ( ptr = map_domain_page(_mfn(paddr_to_pfn(image->head)));      
>  \
> -          (entry = *ptr) && !(entry & IND_DONE);                       
>  \
> -          ptr = (entry & IND_INDIRECTION) ?                            
>  \
> -              (unmap_domain_page(ptr), 
> map_domain_page(_mfn(paddr_to_pfn(entry)))) \
> -              : ptr + 1 )
> +    for ( (ptr) = map_domain_page(_mfn(paddr_to_pfn((image)->head)));  
>  \
> +          ((entry) = *(ptr)) && !((entry) & IND_DONE);                 
>  \
> +          (ptr) = (((entry) & IND_INDIRECTION)                         
>  \
> +                   ? (unmap_domain_page(ptr),                          
>  \
> +                      map_domain_page(_mfn(paddr_to_pfn(entry))))      
>  \
> +                   : (ptr) + 1) )
> 
>  static void kimage_free_entry(kimage_entry_t entry)
>  {
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 7446533c8cfb..63473925cafb 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -664,9 +664,10 @@ static inline int 
> livepatch_check_expectations(const struct payload *payload)
>      const struct livepatch_elf_sec *__sec = 
> livepatch_elf_sec_by_name(elf, section_name); \
>      if ( !__sec )                                                      
>                    \
>          break;                                                         
>                    \
> -    if ( !section_ok(elf, __sec, sizeof(*hook)) || __sec->sec->sh_size 
> != sizeof(*hook) ) \
> +    if ( !section_ok(elf, __sec, sizeof(*(hook))) ||                   
>                    \
> +         __sec->sec->sh_size != sizeof(*(hook)) )                      
>                    \
>          return -EINVAL;                                                
>                    \
> -    hook = __sec->addr;                                                
>                    \
> +    (hook) = __sec->addr;                                              
>                    \

This is not strictly needed, if not for consistency

>  } while (0)
> 
>  /*
> @@ -678,10 +679,10 @@ static inline int 
> livepatch_check_expectations(const struct payload *payload)
>      const struct livepatch_elf_sec *__sec = 
> livepatch_elf_sec_by_name(elf, section_name); \
>      if ( !__sec )                                                      
>                    \
>          break;                                                         
>                    \
> -    if ( !section_ok(elf, __sec, sizeof(*hook)) )                      
>                    \
> +    if ( !section_ok(elf, __sec, sizeof(*(hook))) )                    
>                    \
>          return -EINVAL;                                                
>                    \
> -    hook = __sec->addr;                                                
>                    \
> -    nhooks = __sec->sec->sh_size / sizeof(*hook);                      
>                    \
> +    (hook) = __sec->addr;                                              
>                    \
> +    (nhooks) = __sec->sec->sh_size / sizeof(*(hook));                  
>                    \

same as above

>  } while (0)
> 
>  static int prepare_payload(struct payload *payload,
> diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
> index c9914d2c7c1d..c7aa1e9be3b9 100644
> --- a/xen/crypto/vmac.c
> +++ b/xen/crypto/vmac.c
> @@ -203,7 +203,7 @@ const uint64_t mpoly = 
> UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
>  #define nh_16(mp, kp, nw, rh, rl)                                      
>       \
>  {   int i; uint64_t th, tl;                                            
>       \
>      rh = rl = 0;                                                       
>       \
> -    for (i = 0; i < nw; i+= 2) {                                       
>       \
> +    for (i = 0; i < (nw); i+= 2) {                                     
>       \
>          MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  
> ],get64PE((mp)+i+1)+(kp)[i+1]);\
>          ADD128(rh,rl,th,tl);                                           
>       \
>      }                                                                  
>       \
> @@ -211,7 +211,7 @@ const uint64_t mpoly = 
> UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
>  #define nh_16_2(mp, kp, nw, rh, rl, rh1, rl1)                          
>       \
>  {   int i; uint64_t th, tl;                                            
>       \
>      rh1 = rl1 = rh = rl = 0;                                           
>       \
> -    for (i = 0; i < nw; i+= 2) {                                       
>       \
> +    for (i = 0; i < (nw); i+= 2) {                                     
>       \
>          MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  
> ],get64PE((mp)+i+1)+(kp)[i+1]);\
>          ADD128(rh,rl,th,tl);                                           
>       \
>          MUL64(th,tl,get64PE((mp)+i  
> )+(kp)[i+2],get64PE((mp)+i+1)+(kp)[i+3]);\
> @@ -223,7 +223,7 @@ const uint64_t mpoly = 
> UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
>  #define nh_vmac_nhbytes(mp, kp, nw, rh, rl)                            
>       \
>  {   int i; uint64_t th, tl;                                            
>       \
>      rh = rl = 0;                                                       
>       \
> -    for (i = 0; i < nw; i+= 8) {                                       
>       \
> +    for (i = 0; i < (nw); i+= 8) {                                     
>       \
>          MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  
> ],get64PE((mp)+i+1)+(kp)[i+1]);\
>          ADD128(rh,rl,th,tl);                                           
>       \
>          
> MUL64(th,tl,get64PE((mp)+i+2)+(kp)[i+2],get64PE((mp)+i+3)+(kp)[i+3]);\
> @@ -237,7 +237,7 @@ const uint64_t mpoly = 
> UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
>  #define nh_vmac_nhbytes_2(mp, kp, nw, rh, rl, rh1, rl1)                
>       \
>  {   int i; uint64_t th, tl;                                            
>       \
>      rh1 = rl1 = rh = rl = 0;                                           
>       \
> -    for (i = 0; i < nw; i+= 8) {                                       
>       \
> +    for (i = 0; i < (nw); i+= 8) {                                     
>       \
>          MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  
> ],get64PE((mp)+i+1)+(kp)[i+1]);\
>          ADD128(rh,rl,th,tl);                                           
>       \
>          MUL64(th,tl,get64PE((mp)+i  
> )+(kp)[i+2],get64PE((mp)+i+1)+(kp)[i+3]);\
> diff --git a/xen/include/xen/libfdt/libfdt.h 
> b/xen/include/xen/libfdt/libfdt.h
> index fabddbee8cec..1b09bba28eea 100644
> --- a/xen/include/xen/libfdt/libfdt.h
> +++ b/xen/include/xen/libfdt/libfdt.h
> @@ -230,9 +230,9 @@ int fdt_next_subnode(const void *fdt, int offset);
>   * literal.
>   */
>  #define fdt_for_each_subnode(node, fdt, parent)		\
> -	for (node = fdt_first_subnode(fdt, parent);	\
> -	     node >= 0;					\
> -	     node = fdt_next_subnode(fdt, node))
> +	for ((node) = fdt_first_subnode(fdt, parent);	\
> +	     (node) >= 0;				\
> +	     (node) = fdt_next_subnode(fdt, node))
> 
>  
> /**********************************************************************/
>  /* General functions                                                  
> */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

