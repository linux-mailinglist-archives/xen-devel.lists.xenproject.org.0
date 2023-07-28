Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42820766CD8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 14:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571454.895338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMMW-0002jq-Lg; Fri, 28 Jul 2023 12:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571454.895338; Fri, 28 Jul 2023 12:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMMW-0002hC-IQ; Fri, 28 Jul 2023 12:14:28 +0000
Received: by outflank-mailman (input) for mailman id 571454;
 Fri, 28 Jul 2023 12:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcUX=DO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qPMMV-0002h6-BM
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 12:14:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4adb47e9-2d40-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 14:14:25 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 98FB14EE073F;
 Fri, 28 Jul 2023 14:14:24 +0200 (CEST)
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
X-Inumbo-ID: 4adb47e9-2d40-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Fri, 28 Jul 2023 14:14:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] xen/arm: mechanical renaming to address MISRA C:2012
 Rule 5.3
In-Reply-To: <ae4beda6-bb2d-b494-bc06-ce6475bf3624@xen.org>
References: <164303a2b19336a0e5f934a995d2a9c104035fab.1689952914.git.nicola.vetrini@bugseng.com>
 <ae4beda6-bb2d-b494-bc06-ce6475bf3624@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1313523656e1573a189e73bf4d6a0fc0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 21/07/2023 17:54, Julien Grall wrote:
> Hi,
> 
> On 21/07/2023 16:22, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>> 
>> The function parameters renamed in this patch are hiding a variable 
>> defined
>> in an enclosing scope or a function identifier.
>> 
>> The following renames have been made:
>> - s/guest_mode/guest_mode_on/ to distinguish from function 
>> 'guest_mode'
>> - s/struct module_name/struct module_info to distinguish from the 
>> homonymous
> 
> Typo: Missing '/' after 'module_info'.
> 
>> parameters, since the structure contains more information than just 
>> the name.
>> - s/file_name/file_info in 'xen/arch/arm/efi/efi-boot.h' for 
>> consistency with
> 
> Same here.
> 
>> the previous renaming.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Assuming there is no other comments, I would be Ok to fix it on commit. 
> So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,

I don't see any further comments on this. Are you ok with committing it?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

