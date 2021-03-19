Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E9341BE5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 13:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99193.188467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDnN-0006nI-Tg; Fri, 19 Mar 2021 12:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99193.188467; Fri, 19 Mar 2021 12:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDnN-0006lN-Q6; Fri, 19 Mar 2021 12:00:01 +0000
Received: by outflank-mailman (input) for mailman id 99193;
 Fri, 19 Mar 2021 12:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNDnM-0006hq-1M
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 12:00:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a370f509-9f15-4f80-a45b-91bfca125097;
 Fri, 19 Mar 2021 11:59:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7942AAE05;
 Fri, 19 Mar 2021 11:59:58 +0000 (UTC)
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
X-Inumbo-ID: a370f509-9f15-4f80-a45b-91bfca125097
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616155198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFUyjSuYC33Up51520sQxDFGwTsig4GVwFdSVC313BM=;
	b=RLNgt37qCemtyMCNWuolcnBVn0Bu/jHVlN/6MeDHiHFNqGeX2FSFiHum3lRtwRKaAA2f+V
	MfkN3Wa5ipz4lDL8yhab/As4f97RKA/C33mK1h/O/1O0BR7zuZnaPaCsxffpmiuy8yRBRj
	eOlDqGcR8FfD50ESzmi0re49NiJtijQ=
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
 <24658.6228.390535.850901@mariner.uk.xensource.com>
 <e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d13f8a3a-03ff-6a17-c526-ccc25d6440d3@suse.com>
Date: Fri, 19 Mar 2021 12:59:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 12:57, Andrew Cooper wrote:
> Do we want to backport the -Og fixes so we can get ABI checking working?

Do we have a finalized picture of how this checking is going to
work? I was under the impression that this is still in flux, in
which case I'm not convinced of backporting changes just because
they're prereqs to this.

Jan

