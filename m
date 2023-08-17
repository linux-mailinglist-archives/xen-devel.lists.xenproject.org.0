Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE677F476
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 12:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585282.916363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWaXw-0008Ch-Af; Thu, 17 Aug 2023 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585282.916363; Thu, 17 Aug 2023 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWaXw-00089M-7u; Thu, 17 Aug 2023 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 585282;
 Thu, 17 Aug 2023 10:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWaXu-00089G-ND
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 10:48:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b7a9a04-3ceb-11ee-877a-cb3800f73035;
 Thu, 17 Aug 2023 12:48:05 +0200 (CEST)
Received: from [192.168.1.15] (host-79-55-201-67.retail.telecomitalia.it
 [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 7A1A54EE0737;
 Thu, 17 Aug 2023 12:48:04 +0200 (CEST)
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
X-Inumbo-ID: 8b7a9a04-3ceb-11ee-877a-cb3800f73035
Message-ID: <3ad5c4fb-9322-825d-2347-bdd5e900c598@bugseng.com>
Date: Thu, 17 Aug 2023 12:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/2] misra: add more entires to exclude-list.json
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1692261955.git.federico.serafini@bugseng.com>
 <ce1bf98508d9d66b3e903a7ce19c0a2ee2420fc2.1692261955.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <ce1bf98508d9d66b3e903a7ce19c0a2ee2420fc2.1692261955.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/23 11:42, Federico Serafini wrote:
> Add entries to the exclude-list.json for those files that need to be
> excluded from the analysis scan.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   docs/misra/exclude-list.json | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index ca1e2dd678..3be9421e4d 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -181,6 +181,18 @@
>               "rel_path": "drivers/video/font_*",
>               "comment": "Imported from Linux, ignore for now"
>           },
> +        {
> +          "rel_path": "include/acpi/acpiosxf.h",
> +          "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +          "rel_path": "include/acpi/acpixf.h",
> +          "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +          "rel_path": "include/xen/acpi.h",
> +          "comment": "Imported from Linux, ignore for now"
> +        },
>           {
>               "rel_path": "lib/list-sort.c",
>               "comment": "Imported from Linux, ignore for now"

Wrong indentation, a v2 of this patch has already been sent.

Reviewed-by: Federico Serafini <federico.serafini@bugseng.com>


