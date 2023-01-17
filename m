Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512266DFDE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479473.743350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmZQ-0006Yf-6y; Tue, 17 Jan 2023 14:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479473.743350; Tue, 17 Jan 2023 14:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmZQ-0006W3-3b; Tue, 17 Jan 2023 14:04:12 +0000
Received: by outflank-mailman (input) for mailman id 479473;
 Tue, 17 Jan 2023 14:04:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmZO-0006Vv-Qs
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:04:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmZN-0001Lq-UH; Tue, 17 Jan 2023 14:04:09 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmZN-000801-Oe; Tue, 17 Jan 2023 14:04:09 +0000
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
	bh=ANxvU9NV5KMISZkbBg33IK/WHIx63yDIb1w+eGLlrlg=; b=OHaeIU/Bv/LMTvqLiPavobhIpy
	fVkA+E1NcZ0mYurJlA81iIoP1/8zDwlA7GbABOyvhah4KEaAunobrPiqj3Fsm0vRG9h7j02K+d+4N
	vcD4DuzgG4G6polTxqOIp13soUPqknxIGsWpBijCDI+vW+0m0lattETIqRh0ILKDMZ8c=;
Message-ID: <f7eaac35-4b80-a727-56d9-67d4c5f39db0@xen.org>
Date: Tue, 17 Jan 2023 14:04:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 05/17] tools/xenstore: replace watch->relative_path
 with a prefix length
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Instead of storing a pointer to the path which is prepended to
> relative paths in struct watch, just use the length of the prepended
> path.
> 
> It should be noted that the now removed special case of the
> relative path being "" in get_watch_path() can't happen at all.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

