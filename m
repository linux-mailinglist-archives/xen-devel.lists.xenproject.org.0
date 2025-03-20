Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75134A6A8E5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922355.1326226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH8t-0002QL-L6; Thu, 20 Mar 2025 14:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922355.1326226; Thu, 20 Mar 2025 14:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH8t-0002OE-IM; Thu, 20 Mar 2025 14:45:07 +0000
Received: by outflank-mailman (input) for mailman id 922355;
 Thu, 20 Mar 2025 14:45:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvH8s-0002Ns-4L
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:45:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvH8s-00F230-0L;
 Thu, 20 Mar 2025 14:45:05 +0000
Received: from [2a02:8012:3a1:0:699c:37d:6a29:da07]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvH8r-00BKRl-2L;
 Thu, 20 Mar 2025 14:45:05 +0000
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
	bh=R36igSLcbrrx09luuvdrI/SdpUkeGGN1O10hoHft04U=; b=CM/mDt8hhtCbIZ8HA8CQ5c9pAP
	OrmNB5zwCuWMvex7DNT/2Wufmn5V04TapwzvYk0ZP4E20OOnR623NvzRq6U7fYgESylw7X4ecFkc+
	tnCdQsHNnK7Gedy346IkLiBHAXZXR/k737Rbyq7h5QzyLsEPVldxRM4oYGqIW2cfyah0=;
Message-ID: <918fcee9-3f8a-4c52-9d78-ba15faab36d1@xen.org>
Date: Thu, 20 Mar 2025 14:45:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] process/release: mention MAINTAINER adjustments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/03/2025 12:12, Jan Beulich wrote:
> For many major releases I've been updating ./MAINTAINERS _after_ the
> respective branch was handed over to me. That update, however, is
> relevant not only from the .1 minor release onwards, but right from the
> .0 release. Hence it ought to be done as one of the last things before
> tagging the tree for the new major release.
> 
> See the seemingly unrelated parts (as far as the commit subject goes) of
> e.g. 9d465658b405 ("update Xen version to 4.20.1-pre") for an example.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


