Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DC34337E
	for <lists+xen-devel@lfdr.de>; Sun, 21 Mar 2021 17:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99771.189716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO15W-0003wG-LV; Sun, 21 Mar 2021 16:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99771.189716; Sun, 21 Mar 2021 16:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO15W-0003vr-Hz; Sun, 21 Mar 2021 16:38:02 +0000
Received: by outflank-mailman (input) for mailman id 99771;
 Sun, 21 Mar 2021 16:38:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lO15V-0003vm-5m
 for xen-devel@lists.xenproject.org; Sun, 21 Mar 2021 16:38:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lO15R-0004IF-Ry; Sun, 21 Mar 2021 16:37:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lO15R-0003aC-Iy; Sun, 21 Mar 2021 16:37:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=QMGU/Qm2+TLIrPzxYuMCSpwH0AxT10xkyqXGpM4qBCQ=; b=OD7mcCGWnHInFV4rlXcKxzFwR7
	LI8+cQKG4UDx59TFAnZpx35Uz6eF1ozRPT9FipgqWcHfzSqrdrGwMYmujj2e8/pkvcJNP6rndVdgc
	xFWssSvHGKS07sTJWO8MxS6FtqlS8Zncv7j+8D9Xt1MJdd8H2rRZYxd4zBz6Jq/c6Kgw=;
Subject: Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml
 XenStored daemon as Tech Preview
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>
References: <20210317120854.19903-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
Date: Sun, 21 Mar 2021 16:37:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317120854.19903-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Ian)

Hi Ian,

Sorry I forgot to CC you on the original Ian. Would it be possible to 
give an R-A for the patch below?

Cheers,

On 17/03/2021 12:08, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Support to liveupdate C/OCaml XenStored daemon was added during the
> 4.15 development cycle. Add two new sections in SUPPORT.MD to explain
> what is the support state.
> 
> For now, it is a tech preview.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> CC: Juergen Gross <jgross@suse.com>
> 
>      Changes in v3:
>          - Add a section of OCaml XenStored
> 
>      Changes in v2:
>          - Clarify this is only supported for the daemon version
>          - Fix typoes
> ---
>   SUPPORT.md | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 7db4568f1a0f..1021a24801dc 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -177,6 +177,14 @@ Support for running qemu-xen device model in a linux stubdomain.
>   
>       Status: Tech Preview
>   
> +## Liveupdate of C XenStored daemon
> +
> +    Status: Tech Preview
> +
> +## Liveupdate of OCaml XenStored daemon
> +
> +    Status: Tech Preview
> +
>   ## Toolstack/3rd party
>   
>   ### libvirt driver for xl
> 

-- 
Julien Grall

