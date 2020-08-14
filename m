Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94D244E92
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 20:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6emW-0007Jv-Iv; Fri, 14 Aug 2020 18:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6emV-0007Jq-6o
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 18:50:23 +0000
X-Inumbo-ID: abfe581e-bebf-426f-a809-7d5f2fe99282
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abfe581e-bebf-426f-a809-7d5f2fe99282;
 Fri, 14 Aug 2020 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=MQrs7PSpYpqF5HXnnSK69eh2qqSxHhhgcjwOisDJREs=; b=59G4mmVtssKoOTGBd3TDVe2dDR
 ap/k8tko5TOEtuWcrekWjtR4mrBj0ezZ1MN6xN6yc/v6HUNnaxSf9AdLlIS3IGK9tDIKyp5QN8Wdv
 fLTmc1lvxN+FInY3d5qsbiLtGZL5YAYrSx8/b6QP3LKmwjjMm+PfyiA3UGv20icA2ryA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6emS-0004Np-9U; Fri, 14 Aug 2020 18:50:20 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6emS-0000oQ-1j; Fri, 14 Aug 2020 18:50:20 +0000
Subject: Re: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-5-julien@xen.org>
 <87E8FBB4-DFD2-4B10-9D90-D8628AB102F5@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f560515e-65c9-5150-1df2-ffc5b18e4598@xen.org>
Date: Fri, 14 Aug 2020 19:50:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87E8FBB4-DFD2-4B10-9D90-D8628AB102F5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 31/07/2020 13:53, Bertrand Marquis wrote:
> 
> 
>> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> We usually have xen/ includes first and then asm/. They are also ordered
>> alphabetically among themselves.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> This could have been merged in patch 3.
This is not a tree-wide conversion (there are more instances in 
arch/arm), so I would prefer to keep one patch per file.

> But anyway:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

