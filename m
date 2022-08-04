Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE6589CE2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380406.614541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJb41-00023M-NX; Thu, 04 Aug 2022 13:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380406.614541; Thu, 04 Aug 2022 13:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJb41-00020X-Kd; Thu, 04 Aug 2022 13:39:01 +0000
Received: by outflank-mailman (input) for mailman id 380406;
 Thu, 04 Aug 2022 13:38:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJb3z-00020R-PS
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:38:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJb3y-0004VB-S7; Thu, 04 Aug 2022 13:38:58 +0000
Received: from [54.239.6.184] (helo=[10.7.237.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJb3y-0007yy-L7; Thu, 04 Aug 2022 13:38:58 +0000
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
	bh=LAY0/qhtzM035VhFdR30SXOIYAm+iPUWEFs1VyGJReA=; b=MCqIeC6G/Db4P/QzUB0SIGnmTT
	SE6nY7dFs9RtrpJkSQKS3MbxwUn9A7EK9CS156vrBEk70CadkO9bn+Vjesl9yrXPDb3V+G0TNDR6d
	hp6PNmjmrYsDz4ra/SRF66iclBtUmIW4DVac+uBSZ8VK5j96Rm/3SMsEZcE8izzCRCUM=;
Message-ID: <688de547-896b-da29-9137-44cf2c20227a@xen.org>
Date: Thu, 4 Aug 2022 14:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] doc: Add git commands to generate Fixes
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/08/2022 15:43, Bertrand Marquis wrote:
> Add git commands examples that can be used to generate fixes and how to
> use the pretty configuration for git.
> This should make it easier for contributors to have the right format.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   docs/process/sending-patches.pandoc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 7ff7826c992b..9c4c4655323b 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -102,6 +102,10 @@ E.g.:
>   
>       Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
>   
> +If git was configured as explained earlier, this can be retrieved using
> +``git log --pretty=fixes`` otherwise ``git log --abbrev=12 --oneline`` will
> +give the proper tag and title.

Rather than "proper tag", do you mean "commit-id"?

Other than that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

