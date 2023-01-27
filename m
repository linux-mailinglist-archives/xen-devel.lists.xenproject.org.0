Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAC67EE61
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 20:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485914.753359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUZc-0005a6-NB; Fri, 27 Jan 2023 19:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485914.753359; Fri, 27 Jan 2023 19:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUZc-0005XV-K4; Fri, 27 Jan 2023 19:39:44 +0000
Received: by outflank-mailman (input) for mailman id 485914;
 Fri, 27 Jan 2023 19:39:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLUZb-0005XP-Qo
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 19:39:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUZb-0006hH-CZ; Fri, 27 Jan 2023 19:39:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUZb-0001nb-7D; Fri, 27 Jan 2023 19:39:43 +0000
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
	bh=mxU+Z0A/FyzUGWyvDzJ3yQKsr/satDe7LU9nvwy1YJg=; b=aEmlhlZYmr+ulss/GjI3KCVN7+
	Uf+0W54QWqCCwqEWA/OAKb8pkBTCSobuqEBvhGq3X6/CfsiTYPhHOZ48jSyKykC0hX2KZZkUFwg28
	I2VvUTdAtAqlBj/E25sRnA0jCVSzRVnpHgKarrN/9nG97YosQTkLCtEued27qrfLNVkI=;
Message-ID: <73b31683-1ffc-b708-467a-9ba628a1fd1d@xen.org>
Date: Fri, 27 Jan 2023 19:39:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-15-julien@xen.org>
 <8A0AD684-FB21-46B3-A0C9-DE0BF67030D0@arm.com>
 <69C4635C-1C1D-4F00-813B-83DF9E6D825D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <69C4635C-1C1D-4F00-813B-83DF9E6D825D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/01/2023 09:06, Luca Fancellu wrote:
> 
> Hi Julien,

Hi Luca,

>>
>> I’ve left the boards to test all night, so on Monday I will be 100% sure this serie
>> Is not introducing any issue.
> 
> The serie passed the overnight tests on neoverse board, raspberry pi 4, Juno board.

Thanks for testing!

Cheers,

-- 
Julien Grall

