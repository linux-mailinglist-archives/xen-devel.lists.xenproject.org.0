Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DF3B9180
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 14:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148655.274708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvVL-0005im-Py; Thu, 01 Jul 2021 12:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148655.274708; Thu, 01 Jul 2021 12:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvVL-0005g0-Mr; Thu, 01 Jul 2021 12:09:15 +0000
Received: by outflank-mailman (input) for mailman id 148655;
 Thu, 01 Jul 2021 12:09:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyvVK-0005fu-Eb
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 12:09:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyvVJ-0004Js-8L; Thu, 01 Jul 2021 12:09:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyvVJ-0008Vk-1w; Thu, 01 Jul 2021 12:09:13 +0000
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
	bh=KRmNipCF9JIWLcYk1qw3J6A7B0Feg12knd8BAk5qQs0=; b=X9BhITvKIUwFhnilezbc2wA0QG
	8Bqs8kFJU95c9T9vcU+VyFGW8R2PprvTaEau33F9g9aPQSEzYxefEum98LeNMUmlVvwlxEBHQy9oI
	iUPM4om/bvURpA1PAdJltQviM0f81skNaZ72qQT/UrkzoDQB+eJrxBgrez/N7Ytu9veQ=;
Subject: Re: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore
 maintainer
To: Olaf Hering <olaf@aepfle.de>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-9-olaf@aepfle.de>
 <13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
 <20210701130143.2b8cfce3.olaf@aepfle.de>
 <07174c4e-cf39-66c2-c3cb-27b728dc5819@xen.org>
 <20210701140007.77132794.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <aecdfba7-ea09-6278-6425-6eaa4c9a7ee8@xen.org>
Date: Thu, 1 Jul 2021 13:09:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701140007.77132794.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 01/07/2021 13:00, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 12:40:09 +0100
> schrieb Julien Grall <julien@xen.org>:
> 
>> You would be the sole maintainer of the directory
> 
> Yes that is the point, it changes the count from zero to one.

The code you are moving is already maintained by the tools maintainers.
So I am guessing you are saying they are unresponsive...

Cheers,

-- 
Julien Grall

