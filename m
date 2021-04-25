Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF936A758
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 14:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117142.223001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laeD9-0002Aq-C6; Sun, 25 Apr 2021 12:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117142.223001; Sun, 25 Apr 2021 12:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laeD9-0002AT-7o; Sun, 25 Apr 2021 12:50:07 +0000
Received: by outflank-mailman (input) for mailman id 117142;
 Sun, 25 Apr 2021 12:50:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1laeD7-0001zC-Mx
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 12:50:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laeD6-0001Nm-Ds; Sun, 25 Apr 2021 12:50:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laeD5-0006OM-Jh; Sun, 25 Apr 2021 12:50:03 +0000
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
	bh=2Ps+FB4jNhogDBgVcMafzdbJTl1575eff1zTCK8JFm0=; b=az7++oWCDkBrjPmbBQKtDacwZw
	ErQk5PD/kdZyuPpzk3bCEmJxMFF+ZMCZ76bu4OF+Ux3EjgtnkxZzyX0X4nh7Vs6XMg1muPvRZcyLW
	IaGu/PSYLC7Fw5YaHKSg3NNJzN7lKAMSrTBHyRIFUvlTSHP/caz5pPrRz6Ju3vmSDP3U=;
Subject: Re: [PATCH] tools/xenstored: Remove unused prototype
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210420134906.10910-1-julien@xen.org>
 <756df886-2e18-f2d0-a6d7-27e9817cb9c6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f10922b-fae7-9acd-8b3c-f25012741c38@xen.org>
Date: Sun, 25 Apr 2021 13:50:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <756df886-2e18-f2d0-a6d7-27e9817cb9c6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 21/04/2021 08:39, Juergen Gross wrote:
> On 20.04.21 15:49, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> A prototype for dump_conn() has been present for quite a long time
>> but there are no implementation. Even, AFAICT in the patch that
>> introduced it. So drop it.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! I have committed it.

Cheers,

-- 
Julien Grall

