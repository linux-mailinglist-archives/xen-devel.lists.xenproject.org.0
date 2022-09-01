Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351EB5A917A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 10:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396312.636404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTf91-0003V7-U6; Thu, 01 Sep 2022 08:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396312.636404; Thu, 01 Sep 2022 08:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTf91-0003T9-RH; Thu, 01 Sep 2022 08:01:47 +0000
Received: by outflank-mailman (input) for mailman id 396312;
 Thu, 01 Sep 2022 08:01:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTf90-0003T3-RQ
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 08:01:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTf8z-00071U-Lu; Thu, 01 Sep 2022 08:01:45 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTf8z-00068V-DH; Thu, 01 Sep 2022 08:01:45 +0000
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
	bh=/4YkO97ZB0+YoJBbEkhrVQnDzircAx4hOywRswGhpL0=; b=NKRnPbdEsufPgxbDJTF5oFMu2G
	0muY5gJRVLICZiX6yQbY9fez6n70lesv7burqiCyFLRr3DI60m6G6BHqe4lDXujhwqQukwDNu//l/
	QZWydy9lzdQuHkVttRsxmWt79A54Zk9ORzLWvUnm9vBHA8Y6UAt6FslD3S5oj9YZA3pM=;
Message-ID: <93678e83-cec1-7e5f-89da-074480efa9d5@xen.org>
Date: Thu, 1 Sep 2022 09:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v11 0/6] populate/unpopulate memory when domain on static
 allocation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220831024041.468757-1-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2208311542310.2375071@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2208311542310.2375071@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 31/08/2022 23:44, Stefano Stabellini wrote:
> I looked at the series and patches 1-5 are ready to be committed.
> 
> Patch 6 needs an Ack, preferably from Jan as Jan had questions on this
> patch in v9.
> 
> I plan to commit patches 1-5 in the next couple of days (and ideally
> patch 6 too if an Ack comes from Jan).

IIRC Jan is away this week. So I will have a look at the patch later today.

Please don't commit patch #1-5 until patch #6 is ready as they don't 
make sense to be merged alone.

Cheers,

-- 
Julien Grall

