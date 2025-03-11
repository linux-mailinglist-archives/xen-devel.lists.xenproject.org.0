Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C2A5BBEC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907480.1314715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvnW-0005M1-A2; Tue, 11 Mar 2025 09:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907480.1314715; Tue, 11 Mar 2025 09:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvnW-0005KZ-7I; Tue, 11 Mar 2025 09:21:14 +0000
Received: by outflank-mailman (input) for mailman id 907480;
 Tue, 11 Mar 2025 09:21:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1trvnV-0005KT-7n
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:21:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trvnV-00EThc-05;
 Tue, 11 Mar 2025 09:21:12 +0000
Received: from [2a02:8012:3a1:0:d5e1:ab8b:3d02:5aa4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trvnU-003deD-1y;
 Tue, 11 Mar 2025 09:21:12 +0000
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
	bh=oMgLVYklDh0YrOc0j6PCgzR6NlxnMWRVmt9aLSX5P4g=; b=AnP3YDPYIcDY4MS+SIuhDcs3xe
	TMosS0NUpWhGS4NXdsT54r+yeLSy4kXxhh5AweipeO68pqku17/DpVecEhNRd4hMFa9XEMQYdiGtg
	Ie+AZ8c9ROk5ZG/+at9xfFc7tJ8V+94NH7JRDHrGPhkZMKqDa2dt77biqGlVDTTV0CqY=;
Message-ID: <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
Date: Tue, 11 Mar 2025 09:21:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250311073131.13539-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250311073131.13539-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 11/03/2025 07:31, Juergen Gross wrote:
> In docs/misc/xenstore.txt all Xenstore commands are specified, but
> the specifications lack the numerical values of the commands.
> 
> Add a table with all commands, their values, and a potential remark
> (e.g. whether the command is optional).
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - replace "ŕ" with plain "r" (Jan Beulich)
> - replace hard tabs with blanks (Jan Beulich)
> - allow GET_FEATURES and GET_QUOTA support without SET_* (Jan Beulich)
> ---
>   docs/misc/xenstore.txt | 57 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 7e1f031520..8b4b790e11 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -86,6 +86,63 @@ parts of xenstore inaccessible to some clients.  In any case passing
>   bulk data through xenstore is not recommended as the performance
>   properties are poor.
>   
> +---------- Defined Xenstore message types ----------
> +
> +Below is a table with all defined Xenstore message types (type name
> +and its associated numerical value).
> +
> +Some types are optional to be supported by a specific Xenstore
> +implementation.  If an optional type is not supported by a Xenstore
> +implementation, Xen tools will continue to work, maybe with slightly
> +reduced functionality.  A mandatory type not being supported will
> +result in severely reduced functionality, like inability to create
> +domains.  In case a type is optional, this is stated in the table with
> +the lost functionality in case Xenstore doesn't support that type.
> +
> +XS_CONTROL               0    optional
> +    If not supported, xenstore-control command will not work.

Are we documenting anywhere how a user could figure out if the command 
is not supported? Is it a specific error code?

> +    XS_DEBUG is a deprecated alias of XS_CONTROL.
 > +XS_DIRECTORY             1> +XS_READ                  2
> +XS_GET_PERMS             3
> +XS_WATCH                 4
> +XS_UNWATCH               5
> +XS_TRANSACTION_START     6
> +XS_TRANSACTION_END       7
> +XS_INTRODUCE             8
> +XS_RELEASE               9
> +XS_GET_DOMAIN_PATH      10
> +XS_WRITE                11
> +XS_MKDIR                12
> +XS_RM                   13
> +XS_SET_PERMS            14
> +XS_WATCH_EVENT          15
> +    Not valid in client sent messages.
> +    Only valid in Xenstore replies.
> +XS_ERROR                16
> +    Not valid in client sent messages.
> +    Only valid in Xenstore replies.
> +XS_IS_DOMAIN_INTRODUCED 17
> +XS_RESUME               18
> +XS_SET_TARGET           19
> +XS_RESTRICT             20    no longer supported
> +    XS_RESTRICT has been removed, the type value 20 is invalid.
> +XS_RESET_WATCHES        21
> +XS_DIRECTORY_PART       22    optional
> +    If not supported, the output of xenstore-ls might be incomplete
> +    with more than ca. 1000 domains active.

Why are we making this specific to number of domains? Wouldn't the 
problem be the same if you have 1000 node within a parent node?

> +XS_GET_FEATURE          23    optional
> +XS_SET_FEATURE          24    optional
> +    XS_SET_FEATURE requires XS_GET_FEATURE to be supported.
> +    If unsupported, setting availability of Xenstore features per
> +    domain is not possible.
> +XS_GET_QUOTA            25    optional
> +XS_SET_QUOTA            26    optional
> +    XS_SET_QUOTA requires XS_GET_QUOTA to be supported.
> +    If unsupported, setting of Xenstore quota per domain is not
> +    possible.
> +XS_INVALID           65535
> +    Guaranteed invalid type (never supported).
>   
>   ---------- Xenstore protocol details - introduction ----------
>   

Cheers,

-- 
Julien Grall


