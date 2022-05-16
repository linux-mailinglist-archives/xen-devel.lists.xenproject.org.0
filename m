Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF0528BC4
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330196.553536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeLs-0005g2-GG; Mon, 16 May 2022 17:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330196.553536; Mon, 16 May 2022 17:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeLs-0005dr-DY; Mon, 16 May 2022 17:17:48 +0000
Received: by outflank-mailman (input) for mailman id 330196;
 Mon, 16 May 2022 17:17:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqeLr-0005dl-5Z
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:17:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeLq-0007EN-VR; Mon, 16 May 2022 17:17:46 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeLq-0006Ys-PC; Mon, 16 May 2022 17:17:46 +0000
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
	bh=BTwCt3h58bptRAu2KOKnhYLeDlVlkELneOhsSbW5fww=; b=eq6xvZ/nZ4rz6vhj+e/juJjJz+
	KTHmhVZyBR34sL/61R9liTkKvALtlR0ncBGypsj6GjehTr3jDltQAeN0oTJ/oviFAIjPjXfV4x1zp
	XPYeBcjfZBA+B5rKkUTDNAfIXTbtmGwLC8q3r9iqK+rGmccQu2eA2F5Z+RuBcjg50nlg=;
Message-ID: <73077f8d-d1e9-aec2-3cc1-38b2487c1d9d@xen.org>
Date: Mon, 16 May 2022 18:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN PATCH] docs: fix path to code in migration doc
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220510140506.64930-1-anthony.perard@citrix.com>
 <8c92b56a-bd7b-b91a-5a18-1865ab5b5e98@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c92b56a-bd7b-b91a-5a18-1865ab5b5e98@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2022 15:21, Andrew Cooper wrote:
> On 10/05/2022 15:05, Anthony PERARD wrote:
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Committed.

Thanks,

-- 
Julien Grall

