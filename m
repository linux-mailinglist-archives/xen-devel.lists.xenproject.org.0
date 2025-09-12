Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CDCB559B0
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122765.1466270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCXq-0002SJ-Fy; Fri, 12 Sep 2025 22:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122765.1466270; Fri, 12 Sep 2025 22:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCXq-0002QJ-D8; Fri, 12 Sep 2025 22:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1122765;
 Fri, 12 Sep 2025 22:47:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxCXo-0002QD-Me
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:47:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCXo-006fWu-0l;
 Fri, 12 Sep 2025 22:47:04 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCXo-006FJM-17;
 Fri, 12 Sep 2025 22:47:04 +0000
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
	bh=sYPqw6SWkUINZCLQgp8uRx2waBan1moNfGZFtXkfZVU=; b=bvrikgAlYh7NN2Ww8yuctNwXdK
	220EtEMRxXJFZXR0fN67JBotM59/doMCh6wR8B4Ujym232+wP/2RKrYUHNwIWEU1ItxzH7SRv3lTC
	h+/DwOAzM9vlsgAk0TUzvuLwR+3cOsE2b2kB5dbP4S0oKhTrgHIY7uITMir9+WkZfzNo=;
Message-ID: <95ac4fa9-3169-4285-874e-32ec58c247b2@xen.org>
Date: Fri, 12 Sep 2025 23:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support
 for guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1756803419.git.mykola_kvach@epam.com>
 <9dffe19e3ba29020a8f35c0fcf12f088de6b9eea.1756803419.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9dffe19e3ba29020a8f35c0fcf12f088de6b9eea.1756803419.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 02/09/2025 10:03, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add a new entry under the "Virtual Hardware, QEMU" section documenting
> support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

AFAICT, this is added under "Virtual Hardware, Hypervisor".

> 
> This function is available via the virtual PSCI (vPSCI) interface and
> allows guest domains (domUs) to initiate system suspend operations.
> 
> The feature is currently marked as "Tech Preview".
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

With the above fixed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


