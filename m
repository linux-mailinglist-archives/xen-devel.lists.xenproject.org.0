Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17857BFF7E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615080.956254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDvg-0007ws-21; Tue, 10 Oct 2023 14:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615080.956254; Tue, 10 Oct 2023 14:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDvf-0007uC-VR; Tue, 10 Oct 2023 14:41:47 +0000
Received: by outflank-mailman (input) for mailman id 615080;
 Tue, 10 Oct 2023 14:41:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqDve-0007u4-TR
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:41:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqDve-0003dA-HX; Tue, 10 Oct 2023 14:41:46 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.104.160]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqDve-0007XN-BJ; Tue, 10 Oct 2023 14:41:46 +0000
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
	bh=8hJu90Jt4/dIFan37qP6dkXSe0FV4v70FMEGc6/NoWY=; b=vGNbnN+QxT8zwkHdfSbMtEPouL
	zRwQ2zTonMFBZhwBJDw1ufRN/d6RKOgyKYwMZLbvHm13kKp9gB4QlFtnpfHVEM8dlz1ufH6TmQCwu
	Ivibd/coPbOwYMOw4e3ixLEsGIJCM+9jr3aHtBpJV4SUb4JtypKbh8zOjnEl4N8HYgrs=;
Message-ID: <9e4f1ee1-1163-4a8a-b979-f75c423ac8c2@xen.org>
Date: Tue, 10 Oct 2023 15:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18][PATCH v2] xen/public: arch-arm: Update list of
 supported hypercalls
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20231006125220.23140-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231006125220.23140-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/10/2023 13:52, Michal Orzel wrote:
> The list is out of date and does not specify all the hypercalls/sub-ops
> we support, so update it.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

It is now committed.

Cheers,

-- 
Julien Grall

