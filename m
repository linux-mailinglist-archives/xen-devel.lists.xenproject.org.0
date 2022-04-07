Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F024F8476
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 18:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300933.513471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUYX-0000Cl-Ud; Thu, 07 Apr 2022 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300933.513471; Thu, 07 Apr 2022 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUYX-0000AN-RK; Thu, 07 Apr 2022 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 300933;
 Thu, 07 Apr 2022 16:00:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncUYW-0000AH-C8
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 16:00:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncUYU-0003I2-Ei; Thu, 07 Apr 2022 16:00:18 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.7.236.16])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncUYU-00035g-8F; Thu, 07 Apr 2022 16:00:18 +0000
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
	bh=B80q+p+aCwQSw9V8KWhT0wsQxF1lmRA3ZIY/LS0xyYY=; b=BdN3McEgf+Sq9GBaq1R9s+bluO
	4JCHjxfq5gWOQotHo4wWMCtrK8IJTTvSA7KBGG4b3G5lrK5bQZnNmzOFrGSpgKbn6ZEsVg5odz8Sa
	HVkbG2DW+SkoTfLwdD4yoT/mFQPDw4G7si6QAkrelu014RKRszNdlu2YyG3d7ZDh4qHo=;
Message-ID: <80f0eb2a-43c0-7663-a1ca-481535361c68@xen.org>
Date: Thu, 7 Apr 2022 17:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 iwj@xenproject.org, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210714234809.30483-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20210714234809.30483-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/07/2021 00:48, Stefano Stabellini wrote:
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

I was going through my inbox and notice this was no follow-up. Dom0less 
is getting more traction, so I think it would be good for us to have a 
support statement.

Is it still under your radar?

Cheers,

-- 
Julien Grall

