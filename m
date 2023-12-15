Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2E814FC9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655330.1023052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rED1i-0001oV-I1; Fri, 15 Dec 2023 18:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655330.1023052; Fri, 15 Dec 2023 18:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rED1i-0001ll-F1; Fri, 15 Dec 2023 18:35:10 +0000
Received: by outflank-mailman (input) for mailman id 655330;
 Fri, 15 Dec 2023 18:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rED1g-0001lc-PN
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rED1g-0004WZ-5V; Fri, 15 Dec 2023 18:35:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rED1f-0001ps-V8; Fri, 15 Dec 2023 18:35:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=c5HlktnpL28JFXepwvAtDM/QnqahJzHO48lN0KMg7vY=; b=PJtNUw6zPFWZmYp+ubkbs6UA24
	Eax+TdTGQZ4s4gcOUszB6Asrr8Gf5vlQxmK39IgMKRHfEg52qjTgD+fAP+Nz04hk5KmxZqBRUfHTK
	aDU/6aBZ9ZtmQdt9AkNJlzGAuKZhl9mbyBKUEbc3HGg9N6AnRY0ZO/hDUEyuysbCrRa4=;
Message-ID: <139031ab-522c-41d7-b9d7-e9b7d3656555@xen.org>
Date: Fri, 15 Dec 2023 18:35:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/bug: Complete outstanding TODO
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Federico Serafini <federico.serafini@bugseng.com>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
 <20231215181433.1588532-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231215181433.1588532-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 15/12/2023 18:14, Andrew Cooper wrote:
> Since this TODO was written, BUILD_BUG_ON() has been moved out of xen/lib.h
> into xen/macros.h, which has done all the hard work.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/include/xen/bug.h | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index cb5138410ea7..8cca4486a477 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -20,7 +20,8 @@
>   #define BUG_DEBUGGER_TRAP_FATAL(regs) 0
>   #endif
>   
> -#include <xen/lib.h>
> +#include <xen/macros.h>
> +#include <xen/types.h>
>   
>   #ifndef BUG_FRAME_STRUCT
>   
> @@ -104,14 +105,11 @@ typedef void bug_fn_t(const struct cpu_user_regs *regs);
>   
>   #ifndef run_in_exception_handler
>   
> -/*
> - * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> - * and use a real static inline here to get proper type checking of fn().
> - */
> -#define run_in_exception_handler(fn) do {                   \
> -    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> -    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> -} while ( false )
> +static void always_inline run_in_exception_handler(
> +    void (*fn)(struct cpu_user_regs *regs))

Based on the other threads, shouldn't this be using bug_fn_t?

Also coding style NIT: I was under the impression we would format 
prototype like that:

static void always_inline
run_in_exception_handler(void (*fn)(struct cpu_user_regs *regs))

Anyway, that comment would be moot if we were using bug_fn_t.

Cheers,

-- 
Julien Grall

