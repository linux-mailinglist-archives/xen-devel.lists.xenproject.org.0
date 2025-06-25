Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E4AE8F88
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 22:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025574.1401079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWnc-0000LI-92; Wed, 25 Jun 2025 20:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025574.1401079; Wed, 25 Jun 2025 20:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWnc-0000IX-5n; Wed, 25 Jun 2025 20:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1025574;
 Wed, 25 Jun 2025 20:32:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uUWna-0000IR-R4
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 20:32:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUWnZ-00288T-2x;
 Wed, 25 Jun 2025 20:32:49 +0000
Received: from [2a02:8012:3a1:0:fd5d:2703:c772:3074]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUWnZ-0031nR-1v;
 Wed, 25 Jun 2025 20:32:49 +0000
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
	bh=7s51iM3PPGZDgvFJxYNybSrDZN/qPGnVkWEbJshEWfA=; b=jdAAT/zNcvcTe+J9plHh/CmlV1
	PevhtEwbybrUGxB68QRHZPnbIewCKaARpcOAsZRtc0xuMRfxwNnrYbXGS+9OwYJwe/lOJNgsI+Q5/
	wdu1jbmULcN1HKJxwzYfE6qKODZQbZ3GwdyYLx8cb3l6ObjdXCgFhFf5mB0g9c6qb5pU=;
Message-ID: <c8521929-50dd-4113-bb35-1d64e3a0645c@xen.org>
Date: Wed, 25 Jun 2025 21:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
 <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop>
 <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com>
 <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
 <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
 <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 25/06/2025 20:47, Oleksii Moisieiev wrote:
> 
> On 23/06/2025 11:02, Julien Grall wrote:
>> I am probably missing something. But it looks like TF-A requires to
>> suport multi-agent so Xen can use it. Am I correct?
>>
>> Furthermore, I can't tell why the multi-agent support is Xen specific.
>> Surely, you may want something similar with other hypervisors? If not,
>> then my next question is why does Xen needs to do things differently?
>>
>> Cheers,
>>
> 
> Yes, multi-agent support is required in TF-A for Xen, but this is not
> specific to Xen.

I am really confused. If the support is not Xen specific then why do we 
end up to have xen specific node/properties in your proposal (see [1]) 
such as xen,scmi-secondary-agents.

I also question the placement of the SMCI multi-agent in /chosen. For me 
/chosen is for configuration related to the hypervisor/OS. But here, it 
seems the multi-agent SMCI is related to the platform.

So wouldn't it be better to create a new compatible arm,smci-multi that 
will include the information for multi? An alternative would be to 
extend the existing SCMI node in a backward compatible way.

Lastly, I see if you put a node under "/chosen" with "arm,scmi-smc". 
Have you checked this will not confused Linux? I was under the 
impression Linux would look for any node with the compatible when 
initializing a driver.

Cheers,

[1] 
https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg01421.html


-- 
Julien Grall


