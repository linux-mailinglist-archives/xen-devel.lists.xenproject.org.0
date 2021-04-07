Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8629356761
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106520.203705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU416-0001F6-Bw; Wed, 07 Apr 2021 08:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106520.203705; Wed, 07 Apr 2021 08:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU416-0001Eh-8S; Wed, 07 Apr 2021 08:58:28 +0000
Received: by outflank-mailman (input) for mailman id 106520;
 Wed, 07 Apr 2021 08:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU414-0001Ec-S0
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:58:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed5bd202-3541-4b41-b5fc-51afa80ff93d;
 Wed, 07 Apr 2021 08:58:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9921CB07B;
 Wed,  7 Apr 2021 08:58:24 +0000 (UTC)
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
X-Inumbo-ID: ed5bd202-3541-4b41-b5fc-51afa80ff93d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617785904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sh91exy93k3ffG9wqwOncxrpfPfOd/4VeM9WzUDweaQ=;
	b=N0OaEkBb/Iy7Bx2lEbJ71bMVvCbQTuQikZIRBaEICJTcc9XUlge385xmg3C4nVwVYI9RtS
	6f95pPFyO5aqtZtXv3skvqSLuQppfFAAfZgjthQwY+TJ4nlke6Ffqnc1F2leAe3sjAGTkn
	LPkaPoYLgNvI46xrqrny6ZTg1gbtqwo=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
Date: Wed, 7 Apr 2021 10:58:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.04.2021 10:42, Luca Fancellu wrote:
> Just to be sure that we are in the same page, are you suggesting to modify the name
> In this way?
> 
> struct gnttab_cache_flush {
> -    union {
> +    union xen_gnttab_cache_flush_a {
>         uint64_t dev_bus_addr;
>         grant_ref_t ref;
>     } a;
> 
> Following this kind of pattern: xen_<upper struct name>_<member name> ?

While in general I would be fine with this scheme, for field names like
"a" or "u" it doesn't fit well imo. I'm also unconvinced this would be
scalable to the case where there's further struct/union nesting.

Jan

