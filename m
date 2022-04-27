Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06295511C8E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315333.533833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlLO-0001G9-Or; Wed, 27 Apr 2022 17:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315333.533833; Wed, 27 Apr 2022 17:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlLO-0001Dx-Lb; Wed, 27 Apr 2022 17:20:50 +0000
Received: by outflank-mailman (input) for mailman id 315333;
 Wed, 27 Apr 2022 17:20:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlLN-0001Dn-59
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:20:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlLM-0002qO-R4; Wed, 27 Apr 2022 17:20:48 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlLM-0000Xn-Kg; Wed, 27 Apr 2022 17:20:48 +0000
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
	bh=XX/zrz1j2QLKRE2okFeGt9K2nh4J+RrtyptQ0NcHnZk=; b=a3PmdlUD2uOEymaQNa+cwL8RVm
	e+Wnv0EX7+UHQJQ05OBDSsSYQf7VA0CiADzmA6S/yLfdlWkrU2zj+ci0OrBwtT7WV9oAj/RxMnB7n
	r5jJzSEbMMxRBYF3edPhf4yUbfpiNg+oUpRBtdXmfxDG+hXQTa64bEwWBDe2wZ+sGdPk=;
Message-ID: <43ed32c2-b3fb-02ef-74e2-5815b21b5918@xen.org>
Date: Wed, 27 Apr 2022 18:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 7/8] platforms/omap: Remove unused-but-set variable
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-8-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427094941.291554-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 10:49, Michal Orzel wrote:
> Function omap5_init_time defines and sets a variable den but does not

s/a/the/ I think

> make use of it. Remove this variable.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

