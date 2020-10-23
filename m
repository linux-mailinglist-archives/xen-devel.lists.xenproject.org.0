Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF662971EF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11072.29337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyek-0006O4-BG; Fri, 23 Oct 2020 15:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11072.29337; Fri, 23 Oct 2020 15:07:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyek-0006Ni-7h; Fri, 23 Oct 2020 15:07:02 +0000
Received: by outflank-mailman (input) for mailman id 11072;
 Fri, 23 Oct 2020 15:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVyei-0006Nd-Oi
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:07:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab015e83-faa7-485d-ac9c-4744e7e0cc80;
 Fri, 23 Oct 2020 15:06:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDE5EAC83;
 Fri, 23 Oct 2020 15:06:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVyei-0006Nd-Oi
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:07:00 +0000
X-Inumbo-ID: ab015e83-faa7-485d-ac9c-4744e7e0cc80
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab015e83-faa7-485d-ac9c-4744e7e0cc80;
	Fri, 23 Oct 2020 15:06:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603465618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJfdBU/v3a9AiZbddIIyfpXTvlnrLNU7ifSIrJmNkPY=;
	b=Gb8CSFTYYralmCouIQBs3BT6akLW/9yN78GgF8/InK3qvXsU0fHyryxBE0muu9XmnqZnVn
	DsONvoH1Wd2dT7vnGeMgHJkz4kwHuC5Kzk63YrxFUEu5ro7NmEKQZ0q7dbuJBwHekudAmG
	/p+DEyL7Y5ezaafBdJqshAXwNSaEVrw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CDE5EAC83;
	Fri, 23 Oct 2020 15:06:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] tools/libs: move official headers to common
 directory
To: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20201023141934.20062-1-jgross@suse.com>
 <20201023141934.20062-2-jgross@suse.com>
 <24466.60952.899550.965639@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2e11d90-70c3-0a00-2e56-83191e4d7d0e@suse.com>
Date: Fri, 23 Oct 2020 17:07:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <24466.60952.899550.965639@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.10.2020 16:52, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v2 1/3] tools/libs: move official headers to common directory"):
>> Instead of each library having an own include directory move the
>> official headers to tools/include instead. This will drop the need to
>> link those headers to tools/include and there is no need any longer
>> to have library-specific include paths when building Xen.
>>
>> While at it remove setting of the unused variable
>> PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Thanks, all three
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> and pushed.

While you're at it, Ian, could you also take a look at
"[PATCH 2/2] tools/libs: fix uninstall rule for header files"
(patch 1 there now obviously is obsolete)?

Thanks, Jan

