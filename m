Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B05F768F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417590.662303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogk5l-0005kU-0c; Fri, 07 Oct 2022 09:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417590.662303; Fri, 07 Oct 2022 09:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogk5k-0005jI-SV; Fri, 07 Oct 2022 09:56:28 +0000
Received: by outflank-mailman (input) for mailman id 417590;
 Fri, 07 Oct 2022 09:56:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogk5j-0005jC-OV
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:56:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogk5i-0006fV-ST; Fri, 07 Oct 2022 09:56:26 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.20.83]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogk5i-0002eH-Lk; Fri, 07 Oct 2022 09:56:26 +0000
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
	bh=O871Yp72G9dcsWOFWbMCc0Qyt9pKblNV7o3dtQf4rL0=; b=f83LY8/gIcRbvgqxB0BMveP5vs
	ybF1a9bDy2sGkeRGWiqrQw8oTsovz2hFv1LbluXx33eUXeqt8MBUbrJhNSg1Gb0cG8cYFIVo0mTGa
	KQFuZ2ejSGsA+53bj2bQq1CepbTNSi5S27OUC4SXw4iKvHDzYGKj/OaSp5p05oyJxywc=;
Message-ID: <7fa3fe1e-a339-eee3-f3a2-2275d9add9be@xen.org>
Date: Fri, 7 Oct 2022 10:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] Update Xen version to 4.17-rc
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-4-julien@xen.org>
 <AS8PR08MB7991D9B26480DCCDEA7DC755925F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991D9B26480DCCDEA7DC755925F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/10/2022 10:51, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: [PATCH 3/3] Update Xen version to 4.17-rc
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I am not very sure, but I think the name should be 4.17-rc1 since
> we will likely to have rc2 to rc4 according to the previous plan in
> xen-devel [1]?

Looking at previous release, we are not updating the files for every RC. 
Instead, we only tag the commit with X-rc<N>.

Cheers,

-- 
Julien Grall

