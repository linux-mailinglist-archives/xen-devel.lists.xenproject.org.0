Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77229303F41
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75086.135103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ok1-0003zk-2H; Tue, 26 Jan 2021 13:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75086.135103; Tue, 26 Jan 2021 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ok0-0003zL-UB; Tue, 26 Jan 2021 13:50:44 +0000
Received: by outflank-mailman (input) for mailman id 75086;
 Tue, 26 Jan 2021 13:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Ojz-0003zG-1r
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:50:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b68e39c6-5b16-48b3-8341-1c129b27459b;
 Tue, 26 Jan 2021 13:50:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79F83AB9F;
 Tue, 26 Jan 2021 13:50:41 +0000 (UTC)
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
X-Inumbo-ID: b68e39c6-5b16-48b3-8341-1c129b27459b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611669041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvyxxsnmpUYJemxQIlAp+P8OdByUDcKjFeI6fNPoogA=;
	b=tu+JdOrqk8YSxR2a+2aspsjKIDc82BsVYQus7CDYHq2SwlB1o2D9yI1RTkbl7qWun6Ukc2
	GvTu55lKPoGOccClJbQpu2uFDOf0HQDG6n+q2mE7gTjj9o74I8Eue58n2BTlm17bNWhLAR
	A1JSDWvZ2hcfyjYMddKg7mBPkQ9G760=
Subject: Re: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <24592.1425.471671.120897@mariner.uk.xensource.com>
 <e47c3312-a815-286e-9c7c-8abc75800e0f@suse.com>
 <24592.6209.807340.13829@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c9aeb2a-57a2-ab1c-1a2d-3ba764312767@suse.com>
Date: Tue, 26 Jan 2021 14:50:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24592.6209.807340.13829@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 14:25, Ian Jackson wrote:
> I hope this explanation makes some kind of sense and sorry for the
> confusion.

It does and no, I don't think there was any confusion caused. Some
thinks merely needed clarifying, on my end at least. Thanks for
doing so.

Jan

