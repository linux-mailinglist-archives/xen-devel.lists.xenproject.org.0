Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDA3F9AFF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173751.317004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJd2Q-0002O8-AC; Fri, 27 Aug 2021 14:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173751.317004; Fri, 27 Aug 2021 14:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJd2Q-0002Lh-79; Fri, 27 Aug 2021 14:40:58 +0000
Received: by outflank-mailman (input) for mailman id 173751;
 Fri, 27 Aug 2021 14:40:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJd2O-0002Lb-RF
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:40:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJd2N-0007RM-RM; Fri, 27 Aug 2021 14:40:55 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJd2N-0005iz-LZ; Fri, 27 Aug 2021 14:40:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=94/q8Bayupugn3hnwicMTkjhY2AOaU+P2CBCZ8k1QDk=; b=hMnmyskTnTeL/UtmXRbEmJyZuS
	vqERV4Iqj69OqiDiws5jBQGv6zyzuMerKj2KtqkxmyAO0B7J3l7CTA0dc8mIyiW8KnBTStItf/c+J
	Fh8Ofashe4hQX1P+vtrGyxVFxiJCwlM8EuSpxxQUtFbxq3qwA+eF7Bj21YPJYzRj+Zlw=;
Subject: Re: [PATCH v3 1/7] xen/arm: Import ID registers definitions from
 Linux
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <325f3bacc9b0717664f8f83c529fc59488e22437.1629897306.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1abd501b-af2c-f387-99f7-be5ec8ffe6e6@xen.org>
Date: Fri, 27 Aug 2021 15:40:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <325f3bacc9b0717664f8f83c529fc59488e22437.1629897306.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 25/08/2021 14:18, Bertrand Marquis wrote:
> Import some ID registers definitions from Linux sysreg header to have
> required shift definitions for all ID registers fields.
> 
> Those are required to reuse the cpufeature sanitization system from
> Linux kernel.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

