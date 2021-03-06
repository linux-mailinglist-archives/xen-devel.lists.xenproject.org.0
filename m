Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6B32FCD3
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 20:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94368.177908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcmD-0004IT-Pu; Sat, 06 Mar 2021 19:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94368.177908; Sat, 06 Mar 2021 19:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcmD-0004I7-Mt; Sat, 06 Mar 2021 19:39:49 +0000
Received: by outflank-mailman (input) for mailman id 94368;
 Sat, 06 Mar 2021 19:39:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIcmC-0004I1-IP
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 19:39:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcmA-0007jm-Gp; Sat, 06 Mar 2021 19:39:46 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcmA-0006Jz-BN; Sat, 06 Mar 2021 19:39:46 +0000
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
	bh=T+9QkXahvt+dwgRHDqLExvoouQ4Qh58rNwQps892uOE=; b=olu0NiEW0gOmM+hdcTeqJTigAI
	Pd30u/hZfQ1+vqMLUqWV81x2PvVaEuoluh+ELHYdrwfn0AUe9EbiY5F7JDzj1CY3zFrm+bcMW6zca
	kcHSkWUVl3QxPZufuEt9TkJ/p/jRNLSAX19yM2YAEVuyOhDKCkw23bfLx+jxJGXpxsFk=;
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the
 maximum number of parameters
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>
References: <20210305121029.7047-1-julien@xen.org>
 <24642.12417.651929.972294@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2e55f754-7d42-34d2-fc4a-f8415436149e@xen.org>
Date: Sat, 6 Mar 2021 19:39:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24642.12417.651929.972294@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 05/03/2021 13:22, Ian Jackson wrote:
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I have committed the patch. Thanks!

Cheers,

-- 
Julien Grall

