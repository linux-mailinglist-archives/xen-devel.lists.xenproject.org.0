Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736A690BBE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492533.762119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7vY-00036R-Mr; Thu, 09 Feb 2023 14:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492533.762119; Thu, 09 Feb 2023 14:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7vY-00033p-JP; Thu, 09 Feb 2023 14:29:32 +0000
Received: by outflank-mailman (input) for mailman id 492533;
 Thu, 09 Feb 2023 14:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ7vX-00033h-7b
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ7vW-0006mt-UF; Thu, 09 Feb 2023 14:29:30 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ7vW-0005PQ-O1; Thu, 09 Feb 2023 14:29:30 +0000
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
	bh=q2RUcxkoa+Cgk7J/9Kck8+Un6PMtoauiMIj3g6RocVI=; b=s1Zo/yoNXn/2WZ7TYZfTem8raZ
	H8RPDhgD9sAzmJWGx2825GRW7PCpyMB4iUWjGGBsmJfFE9OWedute0UOTZQOqRg06BcOpQFYXELNf
	jqr9yYExrcAsivJGA7v+xjk8I6KeKFZE2S3orA0wnmcGOhdJvDZzT8JoNNCsCt4gLz+U=;
Message-ID: <c153cd63-c3c0-5842-cd1f-62d575eb60d5@xen.org>
Date: Thu, 9 Feb 2023 14:29:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH] SUPPORT.md: update version to 4.18-unstable
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230209142357.3270-1-jgross@suse.com>
 <e18e36c3-6478-cb63-ca92-330392efe0db@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e18e36c3-6478-cb63-ca92-330392efe0db@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 09/02/2023 14:26, Andrew Cooper wrote:
> On 09/02/2023 2:23 pm, Juergen Gross wrote:
>> The current version is no longer 4.17-rc. Update it to "4.18-unstable".
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Shouldn't this be on the release technicians checklist?

It is. But somehow I missed it.

This reminds me that I also need to respin my branch checklist series.

Cheers,

-- 
Julien Grall

