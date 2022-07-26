Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65CB581869
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375605.608032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOQ5-00039z-1i; Tue, 26 Jul 2022 17:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375605.608032; Tue, 26 Jul 2022 17:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOQ4-000388-V6; Tue, 26 Jul 2022 17:32:32 +0000
Received: by outflank-mailman (input) for mailman id 375605;
 Tue, 26 Jul 2022 17:32:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGOQ3-000382-23
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:32:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOPz-0005cc-Qd; Tue, 26 Jul 2022 17:32:27 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOPz-0005Lw-JW; Tue, 26 Jul 2022 17:32:27 +0000
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
	bh=TDMSdmuhgwrJYKAEjV1l+Nk7/bhrNPugEBq81jGeU2w=; b=yxAtFOI6Lej1lzXWXdlDq/lLS/
	n+JqEWhoWzTxCxj+4Wo+YTePz6YB4n7JvV+uNOKdwKBmydBAVGKUyYwLOG8x6mVD6+x4hAgjrIpvc
	S11JLHZsquRH09GslLP61HwVfVoGRQdQ3YVGTeoCbZiKZemxsWfVYrqy4D3/Zr1gwiVg=;
Message-ID: <c1d805b1-0cfc-5436-23b7-7d13c4ee9bde@xen.org>
Date: Tue, 26 Jul 2022 18:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] mm: enforce return value checking on get_page()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <cdb5c295-1b19-9337-678a-77f8320e9168@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cdb5c295-1b19-9337-678a-77f8320e9168@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/07/2022 17:04, Jan Beulich wrote:
> It's hard to imagine a case where an error may legitimately be ignored
> here. It's bad enough that in at least one case (set_shadow_status())
> the return value was checked only by way of ASSERT()ing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

