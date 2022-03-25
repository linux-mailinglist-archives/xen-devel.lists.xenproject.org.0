Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCD4E7025
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 10:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294622.501033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgQX-00078K-MN; Fri, 25 Mar 2022 09:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294622.501033; Fri, 25 Mar 2022 09:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgQX-00076J-I1; Fri, 25 Mar 2022 09:40:13 +0000
Received: by outflank-mailman (input) for mailman id 294622;
 Fri, 25 Mar 2022 09:40:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXgQW-00076B-SJ
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 09:40:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXgQW-0007SD-Fw; Fri, 25 Mar 2022 09:40:12 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXgQW-0004UE-9n; Fri, 25 Mar 2022 09:40:12 +0000
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
	bh=eO6GVMi8Gy3zE9oh6bZXq5EpUVoJAotgMX0BiDmMw4s=; b=Fw/BpW7lF1Mx/7bikYqtoIU7Hj
	dFX4HJToGdE+tBzf08Gc0GiNNAYvgCqPFrAHb4Tl7hV8y1CDkw/oqZQvVl5laXESXYC/wjYCONEBI
	jIXaF4yaWzzIHlOGuafLwUyYEzkfRBVQjy4SnvMu2pq2BIt86qYkUWrBkfnZlXqU7o0g=;
Message-ID: <b4a4d93e-ff2b-477d-1300-921c31e8e20e@xen.org>
Date: Fri, 25 Mar 2022 09:40:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220325010052.1597420-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220325010052.1597420-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/03/2022 01:00, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
> kernel, certain versions of Linux will use an UNPREDICATABLE NOP

typo: s/UNPREDICATABLE/UNPREDICTABLE/

I will fix it on commit.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

