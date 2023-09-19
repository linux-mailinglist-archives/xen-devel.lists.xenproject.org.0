Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA1C7A5C6D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604454.941834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW2t-0008LY-Pc; Tue, 19 Sep 2023 08:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604454.941834; Tue, 19 Sep 2023 08:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW2t-0008Jo-N0; Tue, 19 Sep 2023 08:25:23 +0000
Received: by outflank-mailman (input) for mailman id 604454;
 Tue, 19 Sep 2023 08:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vY4L=FD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qiW2s-0008Ji-4Q
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:25:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12367e17-56c6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 10:25:20 +0200 (CEST)
Received: from [192.168.1.15] (host-87-19-206-190.retail.telecomitalia.it
 [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id DAC714EE0737;
 Tue, 19 Sep 2023 10:25:19 +0200 (CEST)
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
X-Inumbo-ID: 12367e17-56c6-11ee-8789-cb3800f73035
Message-ID: <046797bc-160f-85db-d8c4-f48407cd731c@bugseng.com>
Date: Tue, 19 Sep 2023 10:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/vPCI: address violation of MISRA C:2012 Rule 8.3
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c0a206c000f475f50d7ee52825567fcd111568ee.1694164323.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <c0a206c000f475f50d7ee52825567fcd111568ee.1694164323.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/23 11:13, Federico Serafini wrote:
> Make function declaration consistent with the corresponding definition.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/include/xen/vpci.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 0b8a2a3c74..d743d96a10 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -26,7 +26,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>                  __used_section(".data.vpci." p) = x
>   
>   /* Add vPCI handlers to device. */
> -int __must_check vpci_add_handlers(struct pci_dev *dev);
> +int __must_check vpci_add_handlers(struct pci_dev *pdev);
>   
>   /* Remove all handlers and free vpci related structures. */
>   void vpci_remove_device(struct pci_dev *pdev);

Are there any chances of getting an ack?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

