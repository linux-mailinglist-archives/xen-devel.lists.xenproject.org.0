Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA907D5A50
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 20:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622547.969491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvM05-0003kv-Et; Tue, 24 Oct 2023 18:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622547.969491; Tue, 24 Oct 2023 18:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvM05-0003iY-Bd; Tue, 24 Oct 2023 18:19:33 +0000
Received: by outflank-mailman (input) for mailman id 622547;
 Tue, 24 Oct 2023 18:19:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvM03-0003iS-U3
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 18:19:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvM00-0008T2-BG; Tue, 24 Oct 2023 18:19:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvM00-00006Z-41; Tue, 24 Oct 2023 18:19:28 +0000
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
	bh=B/kp2Oez8y/WqJ85FZFaAHtPZ1uYy30EDf7lCL+6ue8=; b=FvhA11Qwhcc0kG6iHdVkUoKyMx
	DTSHQyI8cLApSjJlHmhfdKY3TenpJqkNqjGsDqXt34fJzFUQNHCs3ZLUlMbE9AJ7Ch0qPfHYq/qdh
	+j5WY0bOVUJ1ipAWsUBk1SEYQxAM2FwFqh5HhvdO406rWl59kJ88dGqgSE7OKJZYNg0M=;
Message-ID: <2ccea28c-df6b-46ca-9158-ff47d13bfd82@xen.org>
Date: Tue, 24 Oct 2023 19:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] CHANGELOG.md: Set 4.18 release date and tag
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
 <20231023092123.1756426-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231023092123.1756426-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/10/2023 10:21, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
																								> ---
> v3:
> - Don't set the release date.
> ---
>   CHANGELOG.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 25d29fe59d..3ca7969699 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> -## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-XX-XX

I can update the date just before I tag the release.

Cheers,

>   
>   ### Changed
>    - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't

-- 
Julien Grall

