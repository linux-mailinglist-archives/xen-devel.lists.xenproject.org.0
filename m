Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4745514C1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352656.579487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E26-0006Ye-9x; Mon, 20 Jun 2022 09:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352656.579487; Mon, 20 Jun 2022 09:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E26-0006Wl-72; Mon, 20 Jun 2022 09:49:22 +0000
Received: by outflank-mailman (input) for mailman id 352656;
 Mon, 20 Jun 2022 09:49:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3E24-0006WZ-0v
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:49:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E23-0000le-8c; Mon, 20 Jun 2022 09:49:19 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[192.168.1.39])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E23-0000eN-2u; Mon, 20 Jun 2022 09:49:19 +0000
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
	bh=/NnHuR2O7sfkCDEmvcgwPIix5vP58a2/KArTqE4jTPQ=; b=hB6w45q58bEAL2JTSJ6BP0PMjx
	zSrmtVBZCbxqbZGiv3yubH9Z6qtmhWcpiCylHTjAmpAJskianP6fsxenW5Yq4D2K+L8xG3a7Jf9uZ
	CuCu9CUB61cGuNO07lqhmzGebeAvRIRRNvB5B/r7qAsCBxl8zohcDr1EvfVDpbCIesKY=;
Message-ID: <82c90795-375c-4581-c6c1-9e3c109b653b@xen.org>
Date: Mon, 20 Jun 2022 10:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 3/9] xen/common: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620070245.77979-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/06/2022 08:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

