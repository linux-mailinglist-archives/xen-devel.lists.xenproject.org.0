Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0000B55819
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 23:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122546.1466160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxB1l-0001Oz-G0; Fri, 12 Sep 2025 21:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122546.1466160; Fri, 12 Sep 2025 21:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxB1l-0001MJ-Cl; Fri, 12 Sep 2025 21:09:53 +0000
Received: by outflank-mailman (input) for mailman id 1122546;
 Fri, 12 Sep 2025 21:09:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxB1j-0001MD-Ta
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 21:09:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxB1j-006dXW-16;
 Fri, 12 Sep 2025 21:09:51 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxB1j-006A1c-16;
 Fri, 12 Sep 2025 21:09:51 +0000
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
	bh=zlcujAk6Lo59RFqYuGaHKJuqf6p6m8I7RCpvCucJ+fE=; b=L5Xe+wirpdHwBPI2XkTOQkeirZ
	pbbSgzsJqHSE3h4nNNn//+WhCEOUKMnRAnlE6yYxCgrjj8K26PYrECoeTRyU/bv/1mdF7doV7ZT7v
	lfRegKGX/j0dkaPMpMto309M+JnXDSbmpU3lTUp6zSblACcxKp2YA9xNKdu0yS2jdjY4=;
Message-ID: <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
Date: Fri, 12 Sep 2025 22:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] SUPPORT.md: add xenstorepvh-stubdom live update
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250730122305.4050-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

Sorry for the late answer.

On 30/07/2025 13:23, Juergen Gross wrote:
> Live update is now working with the PVH variant of xenstore-stubdom.
 > > Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   SUPPORT.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a92189..eb44ee85fd 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -280,7 +280,7 @@ or itself will not be regarded a security issue.
>   ### C xenstore stubdom PVH
>   
>       Status: Supported
> -    Status, Liveupdate: Not implemented
> +    Status, Liveupdate: Supported

I went through the changes in Xenstored for the stubdom and I have one 
question regarding [1]. Does this mean the event channel will be closed 
during Live-Update? Asking because I vaguely remember we need to keep 
them open to avoid losing events. I am wondering how this would work in 
stubdom?

Cheers,

[1] https://lore.kernel.org/all/20250730122305.4050-7-jgross@suse.com/

>   
>   ### OCaml xenstored daemon
>   

-- 
Julien Grall


