Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E837B3068
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 12:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610490.949918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmAlj-0003Ah-9D; Fri, 29 Sep 2023 10:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610490.949918; Fri, 29 Sep 2023 10:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmAlj-000394-6U; Fri, 29 Sep 2023 10:30:47 +0000
Received: by outflank-mailman (input) for mailman id 610490;
 Fri, 29 Sep 2023 10:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qmAlh-00038y-27
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 10:30:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e1facad-5eb3-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 12:30:43 +0200 (CEST)
Received: from [192.168.1.15] (host-87-11-204-216.retail.telecomitalia.it
 [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 481A64EE0739;
 Fri, 29 Sep 2023 12:30:42 +0200 (CEST)
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
X-Inumbo-ID: 3e1facad-5eb3-11ee-878c-cb3800f73035
Message-ID: <837cde69-eb15-66ba-1b91-974f8307f295@bugseng.com>
Date: Fri, 29 Sep 2023 12:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 1/4] video/vesa: drop bool_t
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
 <96027a74236514f38f54051d24a93b6d692644ac.1695972930.git.federico.serafini@bugseng.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <96027a74236514f38f54051d24a93b6d692644ac.1695972930.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/09/23 10:56, Federico Serafini wrote:
> Drop bool_t to make function declaration and definition consistent and address
> a violation of MISRA C:2012 Rule 8.3.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/drivers/video/vesa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
> index b007ff5678..70feca21ac 100644
> --- a/xen/drivers/video/vesa.c
> +++ b/xen/drivers/video/vesa.c
> @@ -145,7 +145,7 @@ static void cf_check lfb_flush(void)
>       __asm__ __volatile__ ("sfence" : : : "memory");
>   }
>   
> -void __init vesa_endboot(bool_t keep)
> +void __init vesa_endboot(bool keep)
>   {
>       if ( keep )
>       {

I am seeing that there is an acked patch that solves this,
so this patch should be dropped.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

