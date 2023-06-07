Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D672554C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544398.850154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nSW-000302-O4; Wed, 07 Jun 2023 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544398.850154; Wed, 07 Jun 2023 07:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nSW-0002xN-Kz; Wed, 07 Jun 2023 07:19:56 +0000
Received: by outflank-mailman (input) for mailman id 544398;
 Wed, 07 Jun 2023 07:19:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6nSV-0002xH-Pn
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:19:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6nSU-0003qt-FT; Wed, 07 Jun 2023 07:19:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6nSU-00040f-7R; Wed, 07 Jun 2023 07:19:54 +0000
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
	bh=Bey50bjwYvRujspOOhD3sqcvYayICwTYw0zEZJ7SW2k=; b=kqyxy+Y1oq5EHXMsy5xUeW9RvG
	tM9oIWbfqYY0GL9+YpTDUH+tz+FBFTyue3OxolDMoCOTYgIrd4CrmFMwBd8h5OMYCjsAXdEtelmwq
	FWb2xioG+i9AVcormvBYnisFQwfsnqqwfnbobBem+0QOd8Q/qNyrkwKkhZGokI7owLmw=;
Message-ID: <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
Date: Wed, 7 Jun 2023 08:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 07/06/2023 04:02, Stewart Hildebrand wrote:
> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
> are independent from (and don't depend on) the vPCI reference counting/locking
> work in progress, and should be able to be upstreamed independently.

Can you clarify how this code was tested? Does this require code not yet 
upstreamed?

Cheers,

-- 
Julien Grall

