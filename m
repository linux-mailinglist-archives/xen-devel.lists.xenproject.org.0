Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5522E0D9F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 18:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58014.101783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krl6Y-0006bn-MG; Tue, 22 Dec 2020 17:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58014.101783; Tue, 22 Dec 2020 17:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krl6Y-0006bO-If; Tue, 22 Dec 2020 17:05:46 +0000
Received: by outflank-mailman (input) for mailman id 58014;
 Tue, 22 Dec 2020 17:05:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krl6W-0006bJ-Oc
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 17:05:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ca384ed-d9e5-4631-ae3f-aa34a9992fb8;
 Tue, 22 Dec 2020 17:05:43 +0000 (UTC)
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
X-Inumbo-ID: 7ca384ed-d9e5-4631-ae3f-aa34a9992fb8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608656743;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+CxfePlyUubqw8KRU2NkqHW4qYikX7uVMK+Go3UZuaU=;
  b=RfwyAlmkbCWuVTr2xcXIa90HjjGib/w3jL0ZDFTFd1EVtgqCW3iPscig
   zUgR3w3+kek1x4OwpCxcFssA5IxLsk9HC3luht9UMLV2YGFfsHUkr5++O
   zy4xj+E3NLYrXc31l++RFq2yIncLaCXabUhziFj2n0axhTKaPsPxAI+v1
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wbgse+P8wQywN+MxDaOaUz93uuPnqEDEtDGrTt0/F8rfVH4NX6uaNt+fH59IGgHc14saDfbQmb
 8mvlEfz+luFI4ESp860IUoqqpKbDDOjIdDKNLNpQmrzj3p6RqNVVN54y7dD3FpqCYjtUezs8Rw
 3bSSsG2CE7VpfbfH0YSIvdBjYbroT4HDscg4jWAYjMtZu/DD2M5Wb55ekdOFoXSv2BijN748W5
 Yj0tlkWp76i2trQbCPpn7SAYxmESkpvwf9l9x4EEhipwcKdJhQHWBBeLBy0OW0YQyUrHb5g7Tg
 ZvM=
X-SBRS: 5.2
X-MesageID: 33801822
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,439,1599537600"; 
   d="scan'208";a="33801822"
Subject: Re: [PATCH] lib/sort: adjust types
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <37d6facf-3fb8-2171-4143-e5e0269fb637@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b8517b5e-a769-73dd-4b83-498f9b512f60@citrix.com>
Date: Tue, 22 Dec 2020 17:05:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37d6facf-3fb8-2171-4143-e5e0269fb637@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 16:49, Jan Beulich wrote:
> First and foremost do away with the use of plain int for sizes or size-
> derived values. Use size_t, despite this requiring some adjustment to
> the logic. Also replace u32 by uint32_t.
>
> While not directly related also drop a leftover #ifdef from x86's
> swap_ex - this was needed only back when 32-bit Xen was still a thing.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Its a shame that we've got exactly two users of sort() (ought to be
named heapsort), one in arm/io.c which ought to be replaced with a
generalised version of my sorted-array logic for VMCS load/save lists,
and the other in x86's sort_exception_table() which ought to become
build-time logic.

>
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -37,8 +37,7 @@ static int init_or_livepatch cmp_ex(cons
>  	return 0;
>  }
>  
> -#ifndef swap_ex
> -static void init_or_livepatch swap_ex(void *a, void *b, int size)
> +static void init_or_livepatch swap_ex(void *a, void *b, size_t size)
>  {
>  	struct exception_table_entry *l = a, *r = b, tmp;
>  	long delta = b - a;
> @@ -49,7 +48,6 @@ static void init_or_livepatch swap_ex(vo
>  	r->addr = tmp.addr - delta;
>  	r->cont = tmp.cont - delta;
>  }
> -#endif
>  
>  void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
>                                   const struct exception_table_entry *stop)
> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -5,6 +5,6 @@
>  
>  void sort(void *base, size_t num, size_t size,
>            int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, int));
> +          void (*swap)(void *, void *, size_t));
>  
>  #endif /* __XEN_SORT_H__ */
> --- a/xen/lib/sort.c
> +++ b/xen/lib/sort.c
> @@ -6,14 +6,15 @@
>  
>  #include <xen/types.h>
>  
> -static void u32_swap(void *a, void *b, int size)
> +static void u32_swap(void *a, void *b, size_t size)
>  {
> -    u32 t = *(u32 *)a;
> -    *(u32 *)a = *(u32 *)b;
> -    *(u32 *)b = t;
> +    uint32_t t = *(uint32_t *)a;
> +
> +    *(uint32_t *)a = *(uint32_t *)b;
> +    *(uint32_t *)b = t;
>  }
>  
> -static void generic_swap(void *a, void *b, int size)
> +static void generic_swap(void *a, void *b, size_t size)
>  {
>      char t;
>  
> @@ -43,18 +44,18 @@ static void generic_swap(void *a, void *
>  
>  void sort(void *base, size_t num, size_t size,
>            int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, int size))
> +          void (*swap)(void *, void *, size_t size))
>  {
>      /* pre-scale counters for performance */
> -    int i = (num / 2 - 1) * size, n = num * size, c, r;
> +    size_t i = (num / 2) * size, n = num * size, c, r;
>  
>      if ( !swap )
>          swap = (size == 4 ? u32_swap : generic_swap);
>  
>      /* heapify */
> -    for ( ; i >= 0; i -= size )
> +    while ( i > 0 )
>      {
> -        for ( r = i; r * 2 + size < n; r  = c )
> +        for ( r = i -= size; r * 2 + size < n; r  = c )

Aren't some compilers going to complain at the lack of brackets for this
setup of r?

Also as you're editing the line, the "r  = c" part should lose one space.

~Andrew

>          {
>              c = r * 2 + size;
>              if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
> @@ -66,8 +67,9 @@ void sort(void *base, size_t num, size_t
>      }
>  
>      /* sort */
> -    for ( i = n - size; i >= 0; i -= size )
> +    for ( i = n; i > 0; )
>      {
> +        i -= size;
>          swap(base, base + i, size);
>          for ( r = 0; r * 2 + size < i; r = c )
>          {


