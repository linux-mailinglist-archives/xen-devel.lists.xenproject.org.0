Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8270B217AE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 23:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078115.1439119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulaSf-000765-C1; Mon, 11 Aug 2025 21:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078115.1439119; Mon, 11 Aug 2025 21:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulaSf-00073d-95; Mon, 11 Aug 2025 21:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1078115;
 Mon, 11 Aug 2025 21:53:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulaSe-00073X-CM
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 21:53:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulaSd-000Ftt-0f;
 Mon, 11 Aug 2025 21:53:43 +0000
Received: from [2a02:8012:3a1:0:80f0:1985:f3d0:f76b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulaSd-000bV3-0x;
 Mon, 11 Aug 2025 21:53:43 +0000
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
	bh=OF/hx5FWe8y+igZtcmED/W/2oLW/NBtMj2v2mVX0dpQ=; b=mL0R6/yzU8YOyE3aI9IQaVCefg
	Q7VDbCBgLhHdXVrqvt3a1o//hMCGo5XAYkvnjvZMNH8DZ75eIwJBmbxHZXTcQXPRHNd3r+X8NCIC1
	5rZgwXREqORa+NTZxLKL+tJs+tkygYFxd85pLy6VjyycN9TH3z40e+SXaagDby7oAiqg=;
Message-ID: <2b3afe23-1d47-4a66-bf0f-9a94b0b906c7@xen.org>
Date: Mon, 11 Aug 2025 22:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] Add initial Xen Suspend-to-RAM support on ARM64
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 11/08/2025 21:47, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This is part 2 of version 5 of the ARM Xen system suspend/resume patch
> series, based on earlier work by Mirela Simonovic and Mykyta Poturai.

Thanks for adding support for Suspend-to-RAM. You mention this is part 
2, can you clarify what's the state of part 1? Is this already merged?

If not, then can you add a link in the cover letter? This would be 
helpful to know the review ordering.

Cheers,

-- 
Julien Grall


