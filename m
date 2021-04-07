Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641F356DF4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106687.203991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8fy-0004dS-4U; Wed, 07 Apr 2021 13:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106687.203991; Wed, 07 Apr 2021 13:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8fy-0004d3-1Q; Wed, 07 Apr 2021 13:56:58 +0000
Received: by outflank-mailman (input) for mailman id 106687;
 Wed, 07 Apr 2021 13:56:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lU8fw-0004cy-EZ
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:56:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU8ft-0006P8-MR; Wed, 07 Apr 2021 13:56:53 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU8ft-0007zl-Dt; Wed, 07 Apr 2021 13:56:53 +0000
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
	bh=q0sXYJJ0N701qo2FkTnn8uS6pjJvXlCPOrgmgY1xugo=; b=ld4rxmol5AuyMZHtVX2s3iYQWn
	/bcop5tbfgFn0PNzzekGAhf0O3Us6h4NZVTWP7znuHBuDiek1jluk3ugHLQjGI/bY9p/Ug+aWSEZg
	1M7r+Pnv3BqsX7Ef7jxyQybEZsRdoQGU8+7PMur83AxCizmWW2dDBPkbqE7KJmbuMGjU=;
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b55d2d18-c80c-5596-8ac4-d4d7099708bf@xen.org>
Date: Wed, 7 Apr 2021 14:56:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Luca,

On 07/04/2021 14:19, Luca Fancellu wrote:
> 
> 
>> On 7 Apr 2021, at 14:13, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 06/04/2021 11:36, Luca Fancellu wrote:
>>> Modification to include/public/grant_table.h:
>>> 1) Change anonymous structure to be named structure,
>>>     because doxygen can't deal with them.
>>
>> What do you mean by can't deal with them? I had a quick try with doxygen build and couldn't find any failure (although I haven't looked at the output).
>>
> 
> Hi Julien,
> 
> The problem is that Doxygen can’t generate proper documentation for anonymous union/structure, it ends up with warning and/or producing wrong documentation like
> changing names or giving field description to the wrong field.

I might do something wrong because I cannot spot any significant 
difference in the doxygen ouput if I switch back to anonymous union. 
Would you mind to post more details (such as a diff) on how doxygen 
doesn't generate properly documentation?

Cheers,

-- 
Julien Grall

