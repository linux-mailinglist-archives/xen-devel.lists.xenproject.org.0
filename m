Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B86460EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 19:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456549.714323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2yvg-0001iL-9g; Wed, 07 Dec 2022 18:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456549.714323; Wed, 07 Dec 2022 18:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2yvg-0001fy-74; Wed, 07 Dec 2022 18:14:00 +0000
Received: by outflank-mailman (input) for mailman id 456549;
 Wed, 07 Dec 2022 18:13:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2yve-0001fs-US
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 18:13:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2yvc-0008O9-NL; Wed, 07 Dec 2022 18:13:56 +0000
Received: from [15.248.2.156] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2yvc-0002SW-I3; Wed, 07 Dec 2022 18:13:56 +0000
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
	bh=GRqcOsblXh//rT0CWkV7crWk9v6qLlnNbHA+HbgivhE=; b=opHHxhCnDHvNFp7Yvmv5m8cfpN
	CZEohJb2SjF9QJ6/r9UrH/BW4MOQqkdNbfkJ/G6yTRdEqw2n+j49Mi+iTq4M2VlzQNnTLvfK4Ejjo
	dAA0a0iINI1is/EYL45Osmei49EdmyOEOn7TSHBrvZqqbtZoRPPsx3KPRgKsv8LS5z2k=;
Message-ID: <cf78fd74-2ef2-2abd-2417-56f01b324296@xen.org>
Date: Wed, 7 Dec 2022 18:13:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH for-4.17 v6 1/2] CHANGELOG: Set 4.17 release date and tag
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20221201113910.1984744-1-Henry.Wang@arm.com>
 <20221201113910.1984744-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221201113910.1984744-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/12/2022 11:39, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

