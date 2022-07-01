Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E1563894
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 19:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359125.588511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KR9-0000bv-VP; Fri, 01 Jul 2022 17:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359125.588511; Fri, 01 Jul 2022 17:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KR9-0000Zc-Rl; Fri, 01 Jul 2022 17:28:11 +0000
Received: by outflank-mailman (input) for mailman id 359125;
 Fri, 01 Jul 2022 17:28:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o7KR7-0000Z7-TF
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 17:28:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7KR7-00073d-Nc; Fri, 01 Jul 2022 17:28:09 +0000
Received: from [54.239.6.185] (helo=[192.168.1.77])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7KR7-0003JO-H4; Fri, 01 Jul 2022 17:28:09 +0000
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
	bh=uzTkoonCDqOGrBx9AdVGkIcB8sppbSPLpaECqmPDBWU=; b=Kv4TF/7bluXxM3jBA8h8d8HRnz
	19/2CiNc9+VWVDMTtIrOuvfwnBWtXFzod491BWfECmQNAb9Nl/AyR4grLB21OzDeZ/A+eREFk74gX
	L3NYaYc0CZgSUWegvsHVH/i8lWGPseyRe2OOOcUhp3zQDJs6sWHQtOqtuCVNQxGnUOC8=;
Message-ID: <6780396b-5a61-258c-4b5d-533b0c9a7faf@xen.org>
Date: Fri, 1 Jul 2022 18:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3] public/io: xs_wire: Document that new errors should be
 added at the end
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220630183655.44391-1-julien@xen.org>
 <dc57c0a4-899b-a76b-6adc-cf5947beeb8b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dc57c0a4-899b-a76b-6adc-cf5947beeb8b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/07/2022 06:13, Juergen Gross wrote:
> On 30.06.22 20:36, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Some tools (e.g. xenstored) always expect EINVAL to be first in 
>> xsd_errors.
>>
>> To be conservative, mandate that new errors should be added at the end
>> of the array.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

