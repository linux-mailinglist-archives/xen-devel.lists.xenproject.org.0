Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03870383BC9
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 19:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128446.241146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihUa-0003x3-E3; Mon, 17 May 2021 17:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128446.241146; Mon, 17 May 2021 17:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihUa-0003v6-AY; Mon, 17 May 2021 17:57:24 +0000
Received: by outflank-mailman (input) for mailman id 128446;
 Mon, 17 May 2021 17:57:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lihUY-0003v0-UL
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 17:57:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihUX-0000xF-Br; Mon, 17 May 2021 17:57:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihUX-0007jg-5u; Mon, 17 May 2021 17:57:21 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=0BpIULNvqppXfJ8kFTXCLdLrLKmy7mOmn4MW6g2NJ98=; b=Sz1qizjxXbeUxtWnHiwmXSECi7
	Yb5qmMdVeRfUZvEQxMfHby1fPFgOFt4Ea8/FdSZ52xe+Q1qQcq061PIDhdk316cxY2SQlj8vjfzrc
	5EAHoMXhjzSuW5XLOvrs1SqgRglmvR+gbfEcpxoVSnampEVbu72pr7wePrvYKv5c0bRw=;
Subject: Re: [PATCH] tools/xenstore: cleanup Makefile and gitignore
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210514090116.21002-1-jgross@suse.com>
 <a67f922a-935e-2b8b-dde6-2362ca3371c3@xen.org>
Message-ID: <e9fb6fad-f8b5-7566-5c5c-ec79ba146530@xen.org>
Date: Mon, 17 May 2021 18:57:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a67f922a-935e-2b8b-dde6-2362ca3371c3@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/05/2021 18:06, Julien Grall wrote:
> Hi Juergen,
> 
> On 14/05/2021 10:01, Juergen Gross wrote:
>> The Makefile of xenstore and related to that the global .gitignore
>> file contain some leftovers from ancient times. Remove those.
>>
>> While at it sort the tools/xenstore/* entries in .gitignore.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

-- 
Julien Grall

