Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DA573B6E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366902.597835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfRn-0006bk-0l; Wed, 13 Jul 2022 16:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366902.597835; Wed, 13 Jul 2022 16:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfRm-0006ZU-UA; Wed, 13 Jul 2022 16:42:46 +0000
Received: by outflank-mailman (input) for mailman id 366902;
 Wed, 13 Jul 2022 16:42:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBfRk-0006ZO-IE
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:42:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBfRj-00088b-VZ; Wed, 13 Jul 2022 16:42:43 +0000
Received: from [54.239.6.184] (helo=[192.168.7.160])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBfRj-0004cN-Mu; Wed, 13 Jul 2022 16:42:43 +0000
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
	bh=Nty5XLd4yLOqpNqxxl6pTXwkStFUN1nzDl8RDxoB23g=; b=LdLxiVmBKIXM7tCtS2+ApznWxs
	dKupbcJ1fSImhn+sxk0SPiDtc8w1z8MKAgMZcB7LqdQWfwoZ63X7/mZHm4M92BQzEPjWJrWmnEdLD
	SktgkjQDKNiH6zd5IBynZqQ6HH0XA1gm82jxccvVigW7gSdKmDFtdGJi1gKp9dCL9P+Y=;
Message-ID: <ba284333-bd95-9ca2-e453-14df5c047bb6@xen.org>
Date: Wed, 13 Jul 2022 17:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: Hyperlaunch Working Group: Status and Next Steps (15JUL22)
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>,
 "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 "Lei, Jason" <jlei@RiversideResearch.org>,
 Scott Davis <scott.davis@starlab.io>
References: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/07/2022 23:45, Daniel P. Smith wrote:
> Greetings All,
> 
> We will be holding a Hyperlaunch Working Group meeting on Friday, July
> 15th at 0900PDT/1200EDT/1700GMT.

Did you mean 16:00 GMT rather than 17:00 GMT?

Cheers,

-- 
Julien Grall

