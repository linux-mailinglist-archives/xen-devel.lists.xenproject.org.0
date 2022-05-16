Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF745528BE5
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330215.553571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeS5-0007pz-JZ; Mon, 16 May 2022 17:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330215.553571; Mon, 16 May 2022 17:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeS5-0007nj-GP; Mon, 16 May 2022 17:24:13 +0000
Received: by outflank-mailman (input) for mailman id 330215;
 Mon, 16 May 2022 17:24:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqeS3-0007nd-RJ
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:24:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeS1-0007Lf-F3; Mon, 16 May 2022 17:24:09 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeS1-00073j-9O; Mon, 16 May 2022 17:24:09 +0000
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
	bh=5GPArWc91QslXIcim7uCyt8M5j4wEGr6RznXZCGNtyc=; b=uJA6YCLhJVVYnYUdV5kouHOixH
	UYrNh3DKHlpGa+MZeiIxmsSBIuw4wctgateZFig98KdUjwdLkHEvUb1/1XazpkLda4Z1NRYn8LS4A
	ak3yf9Xeq6uB3lTho8ZFZQykUULP8P98A98f+a37db1QPzoPD09Gnn7Efc+n5c34ZKqw=;
Message-ID: <bb829d33-e32b-a7c5-397f-4ce0df25eb03@xen.org>
Date: Mon, 16 May 2022 18:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
 <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
 <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/05/2022 14:46, Jan Beulich wrote:
> On 06.05.2022 15:43, Julien Grall wrote:
>> You say future, has this option been merged or still in discussion on
>> the ML?
> 
> "future" as in "no released version yet". The change is present on the
> binutils master branch.

Thanks for the clarification. In which case, can you update the commit 
message like Andrew suggested. For both:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

