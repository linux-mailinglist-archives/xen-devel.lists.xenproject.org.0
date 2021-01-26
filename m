Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBF303DA0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 13:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74960.134815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NmZ-00042W-6y; Tue, 26 Jan 2021 12:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74960.134815; Tue, 26 Jan 2021 12:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4NmZ-000427-2N; Tue, 26 Jan 2021 12:49:19 +0000
Received: by outflank-mailman (input) for mailman id 74960;
 Tue, 26 Jan 2021 12:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4NmY-000422-2A
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:49:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad8ee3d1-36bf-4d33-a7e4-4c9f80c31110;
 Tue, 26 Jan 2021 12:49:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74DABAD6B;
 Tue, 26 Jan 2021 12:49:16 +0000 (UTC)
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
X-Inumbo-ID: ad8ee3d1-36bf-4d33-a7e4-4c9f80c31110
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611665356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPfl8BENQnZQCsXmS3h/iSScwQ4FnTm/K7E6BqaN/g8=;
	b=P1ZC7kW0W80jVjLAH10TAcf/HsG57twLvfvwGVghEYGtiY+m27Sua/hKNBfYCuYj4ebI6q
	BYr3iZP6wPe4l0B27hhHGte4dnt0xFHvDR9zOB1y5QH9q+39PRF7aTtaWDYwKXE8GT0Dpr
	gt20EWzwKhQQgWqHvM7jbdQBgUnWT6w=
Subject: Re: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <b33f4fd3-e81a-a703-9fb5-a01880c2db9a@suse.com>
 <24592.870.302768.927980@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2677e6b-c9b4-cf79-969b-03e541ceebe5@suse.com>
Date: Tue, 26 Jan 2021 13:49:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24592.870.302768.927980@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 12:56, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC"):
>> There's no need for the extra abstraction.
> 
> Thanks for tidying things up.
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks.

>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> However, I think this is a refactoring commit which wasn't posted
> before the last posting date and can easily be postponed ?  So:
> 
> Release-Nacked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>         ^^^^^^
> 
> Please correct me if I am wrong and you (Jan, or Andy, or anyone)
> think this should go into 4.15.

No, that's fine (and expected, as per the cover letter).

Jan

