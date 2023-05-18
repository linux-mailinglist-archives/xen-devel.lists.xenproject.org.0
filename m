Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC075707D5D
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 11:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536272.834450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzaM4-0001DH-62; Thu, 18 May 2023 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536272.834450; Thu, 18 May 2023 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzaM4-00019w-3I; Thu, 18 May 2023 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 536272;
 Thu, 18 May 2023 09:55:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pzaM2-00019o-Oc
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 09:55:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pzaM2-0002Xd-BL; Thu, 18 May 2023 09:55:26 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.26.27]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pzaM2-0006I7-64; Thu, 18 May 2023 09:55:26 +0000
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
	bh=eoTm1ScNklZrv6cO4gidneCDF/zxW+DEZW/xrywpNBg=; b=oChv5Ko4JWJg5iMzKBZZ07sgno
	TXfFvBxBkla9t9M5SoCS635duWqq0IKFYKzebfIlzKh3fRNO5/wOK1BS4vS7V7XbhmxFvWaufNTcd
	Vso5Vjf6NZa9spwndJjtpMHy1E3ebYbJodAgmv5aTnF1/XYBVTsVhOymPWYz09Reztac=;
Message-ID: <a981c6f9-7236-1270-20e1-51ce287ece72@xen.org>
Date: Thu, 18 May 2023 10:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 04/12] xen/arm: add SVE exception class handling
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230424060248.1488859-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 24/04/2023 07:02, Luca Fancellu wrote:
> SVE has a new exception class with code 0x19, introduce the new code
> and handle the exception.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

