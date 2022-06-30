Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603656223F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 20:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358685.587993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z8u-00041m-Id; Thu, 30 Jun 2022 18:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358685.587993; Thu, 30 Jun 2022 18:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z8u-0003yy-Fg; Thu, 30 Jun 2022 18:43:56 +0000
Received: by outflank-mailman (input) for mailman id 358685;
 Thu, 30 Jun 2022 18:43:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6z8t-0003ys-6N
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 18:43:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z8s-0002c4-OR; Thu, 30 Jun 2022 18:43:54 +0000
Received: from [54.239.6.182] (helo=[10.95.73.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z8s-0000sL-Hd; Thu, 30 Jun 2022 18:43:54 +0000
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
	bh=gNfG5otd9B61VwaiFWzcbfMKVZ9WnkihdbAY+PXm4vs=; b=4Kiy9/kz+y2E6fCDfWo9gH3uSF
	Sb+Ut3jp3Nxqo9mwZwPaVShcICtz367jaDpkxc3np/FS7+siQB4iMLgYrHJsYzR9ps90ykqkNlbvZ
	OJMsB5elp4nYZpMU8WNGG1zsAstbWcVj2Ny1zPnjx7uHw4s8qxEkqNlTci8uKIHyb7ZQ=;
Message-ID: <137599b8-3088-733c-ec27-093b49673a19@xen.org>
Date: Thu, 30 Jun 2022 19:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2] docs/misra: Add instructions for cppcheck
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220629125526.28190-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220629125526.28190-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 29/06/2022 13:55, Luca Fancellu wrote:
> Add instructions on how to build cppcheck, the version currently used
> and an example to use the cppcheck integration to run the analysis on
> the Xen codebase
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v2:
> - typo fixes, removed build command line, rephrasing (Julien)
> ---
>   docs/misra/cppcheck.txt | 64 +++++++++++++++++++++++++++++++++++++++++

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

