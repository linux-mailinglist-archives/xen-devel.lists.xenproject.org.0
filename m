Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5136089D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111070.212327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Xw-00079D-3M; Thu, 15 Apr 2021 11:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111070.212327; Thu, 15 Apr 2021 11:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Xv-00078o-W5; Thu, 15 Apr 2021 11:52:31 +0000
Received: by outflank-mailman (input) for mailman id 111070;
 Thu, 15 Apr 2021 11:52:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0Xv-00078R-Cb
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:52:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0Xt-0007Cp-MB; Thu, 15 Apr 2021 11:52:29 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0Xt-0001Pg-GN; Thu, 15 Apr 2021 11:52:29 +0000
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
	bh=MfaNIzeEzsMkbYOee2F7qQu9gQ03I3wA+XCjlqPFb7Y=; b=AljS9ckfQARn400mXdG66N4cP3
	//vMFShviUbTxPTPL0V01e6aW/WVEvK8l1s1hLpSuFIq83lXn4MBe2GDjYPJ9GvJbvNgPW57/DpJi
	juAWVYW77W2oQVbLwxUcG05m4oOVuNhWb9tgugoK9/3OLroJsQXnZe3qB239KhGGVRkA=;
Subject: Re: [PATCH v3 10/15] unlzma: replace INIT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <b955d146-d9dd-daa2-984b-c50d38c714d7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3f11195a-3494-7868-66b5-28ced9a389d8@xen.org>
Date: Thu, 15 Apr 2021 12:52:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b955d146-d9dd-daa2-984b-c50d38c714d7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:51, Jan Beulich wrote:
> There's no need for this abstraction.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

