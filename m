Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE4B02A79
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041811.1412410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXiB-000238-Cx; Sat, 12 Jul 2025 10:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041811.1412410; Sat, 12 Jul 2025 10:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXiB-00020s-9U; Sat, 12 Jul 2025 10:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1041811;
 Sat, 12 Jul 2025 10:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXiA-00020c-Kc
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXi8-00DnB4-23;
 Sat, 12 Jul 2025 10:44:04 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXi8-000ukb-1S;
 Sat, 12 Jul 2025 10:44:04 +0000
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
	bh=ENcVcJFaoauq1vS3AzgrO9K+/lJUKyWhTb7x7MXc7z0=; b=UaMb8qyXbjzCea8yuwsdOg6yaW
	NeqSC/ghq1PDQyuR93YC3MmFLNhbCI80LyUsOt+QbNStzOEh5Auoun7UccQ9zzGQxvqfkoKMOp1Tf
	yVUbhLYsV+CMC9+faAHzf0yGQS0YZB3ewBDV9c3dxgPl6TVQt/bBqgeElGHNhKzC+6+w=;
Message-ID: <2c220a56-0cc9-41c5-b4a7-e84209dd1490@xen.org>
Date: Sat, 12 Jul 2025 11:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add me as an additional stubdom maintainer
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250701062232.7117-1-jgross@suse.com>
 <alpine.DEB.2.22.394.2507011238170.862517@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2507011238170.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/07/2025 20:38, Stefano Stabellini wrote:
> On Tue, 1 Jul 2025, Juergen Gross wrote:
>> I've been the main contributor to the stubdom framework for several
>> years now.
>>
>> Add me as a maintainer.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I think for this one we also need an Ack from Samuel. So I have CCed him

Cheers,

-- 
Julien Grall


