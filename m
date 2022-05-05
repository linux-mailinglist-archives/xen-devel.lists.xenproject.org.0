Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3F51C5F8
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 19:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322305.543578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmf7v-0005Is-3Z; Thu, 05 May 2022 17:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322305.543578; Thu, 05 May 2022 17:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmf7v-0005FN-0T; Thu, 05 May 2022 17:18:55 +0000
Received: by outflank-mailman (input) for mailman id 322305;
 Thu, 05 May 2022 17:18:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmf7t-0005FH-W0
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 17:18:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmf7t-00033f-0Q; Thu, 05 May 2022 17:18:53 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmf7s-0000u5-Pm; Thu, 05 May 2022 17:18:52 +0000
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
	bh=vV72h4zKeNStGZHPCXEaQRJ7zTKqQ6FLw2y+SXdYZW8=; b=igzd5EnK5F+wO7qjd+69zMiAMX
	zjBzH2BK1Dwsf4g2jCueP+migbJrGYz2j+/46wXpVL7PhwTIBNv+8WOtlEx3W8+GL1z+YSUzItduK
	PRnMAPXZigKFWSIvEwlH9lJuwJNg686dCZ4SKFwgxcd+vdjUSmzn7rOlYEH2oxT1xuKk=;
Message-ID: <b9b78598-8ce6-7167-483c-a59c80111ae7@xen.org>
Date: Thu, 5 May 2022 18:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] bump default SeaBIOS version to 1.16.0
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <58aad4ba-af15-0189-5336-698aadfcf905@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <58aad4ba-af15-0189-5336-698aadfcf905@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/04/2022 11:55, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

