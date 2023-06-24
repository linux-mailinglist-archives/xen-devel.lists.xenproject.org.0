Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27573CB3C
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 16:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554586.865862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3ut-0007m8-H1; Sat, 24 Jun 2023 14:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554586.865862; Sat, 24 Jun 2023 14:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD3ut-0007kR-EA; Sat, 24 Jun 2023 14:07:07 +0000
Received: by outflank-mailman (input) for mailman id 554586;
 Sat, 24 Jun 2023 14:07:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qD3us-0007kJ-Fm
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 14:07:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qD3ur-0001MN-6G; Sat, 24 Jun 2023 14:07:05 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qD3uq-0000Qh-Vh; Sat, 24 Jun 2023 14:07:05 +0000
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
	bh=bTRkiKM/+K9Ff+kPgQ5JQB3gTAQWdnMMPN7EA+dV6LM=; b=aCDuH2FmjcXMYSc/ekssjya8Fy
	ZOeU8HKllSdn0kYPoYOHpZ7s7WZDE1KL+7L25b7T4pLEhYkzNggSQ9HPQlSxy625rbnkMiNr64LAT
	nzKS+sWYLFZQ+yJVYcC1rDxZsVrjJZLbxOjcPHbt3T5A/sIqVzZ+jq4t5NLJhfSEiJTs=;
Message-ID: <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
Date: Sat, 24 Jun 2023 15:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] doc: clarify intended usage of ~/control/ xentore
 path
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
 <20230531103427.1551719-2-yann.dirson@vates.fr>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230531103427.1551719-2-yann.dirson@vates.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yann,

Adding Juergen.

On 31/05/2023 11:35, Yann Dirson wrote:
> Signed-off-by: Yann Dirson <yann.dirson@vates.fr>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   docs/misc/xenstore-paths.pandoc | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
> index f07ef90f63..5501033893 100644
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -432,6 +432,35 @@ by udev ("0") or will be run by the toolstack directly ("1").
>   
>   ### Platform Feature and Control Paths
>   
> +#### ~/control = "" []
> +
> +Directory to hold feature and control paths.  This directory is not
> +guest-writable, only the toolstack is allowed to create new child
> +nodes under this.
> +
> +Children of this nodes can have one of several types:
> +
> +* platform features: using name pattern `platform-feature-*`, they may
> +  be set by the toolstack to inform the guest, and are not writable by
> +  the guest.
> +
> +* guest features: using name pattern `feature-*`, they may be created
> +  by the toolstack with an empty value (`""`), should be set writable
> +  by the guest which can then advertize to the toolstack its
> +  (non-)usage of the feature with values `"0"` and `"1"` respectively.
> +  The lack of update by the guest can be interpreted by the toolstack
> +  as the lack of supporting software (PV driver, guest agent, ...) in
> +  the guest.
> +
> +* control nodes: using any name not matching the above pattern, they
> +  are used by the toolstack or by the guest to signal a specific
> +  condition to the other end, which is expected to watch it to react
> +  to changes.
> +
> +Note: the presence of a control node in itself advertises the
> +underlying toolstack feature, it is not necessary to add an extra
> +platform-feature for such cases.
> +
>   #### ~/control/sysrq = (""|COMMAND) [w]
>   
>   This is the PV SysRq control node. A toolstack can write a single character

-- 
Julien Grall

