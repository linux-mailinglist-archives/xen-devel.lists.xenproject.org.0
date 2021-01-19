Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323242FBC79
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 17:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70565.126651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1twD-0004p6-GZ; Tue, 19 Jan 2021 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70565.126651; Tue, 19 Jan 2021 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1twD-0004ok-DU; Tue, 19 Jan 2021 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 70565;
 Tue, 19 Jan 2021 16:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1twB-0004of-31
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 16:32:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e875461-0719-4a64-abfd-e7b5c9f38a58;
 Tue, 19 Jan 2021 16:32:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF596AE57;
 Tue, 19 Jan 2021 16:32:56 +0000 (UTC)
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
X-Inumbo-ID: 8e875461-0719-4a64-abfd-e7b5c9f38a58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611073977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKzBwx/L/dNWAS1fX3dvcjhv2D5nW0PtzxgCOmm3bCs=;
	b=sFqoFrPP8WVfThZ6BxJobpP9EvmzkWxU7QIbFk7HnD/E/u00MRTj50APYEfvLZqU6JkaIJ
	+XjI9ObIkYTAhUSlGOafQNGhWN2ddUgXRubqh6/wLNDZ9/8IE8W5nrtafnjjtyLUB3FHeG
	RkVdOjYkDcPufBvC4D5HEvRoGFZGNL0=
Subject: Re: [PATCH] xen/gnttab: Log when grant_table_init() fails
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119111805.18295-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0d7f81a-5180-5799-f060-b65487f990e5@suse.com>
Date: Tue, 19 Jan 2021 17:32:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119111805.18295-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.01.2021 12:18, Andrew Cooper wrote:
> ... so debug builds can see what went wrong, rather than getting an
> unqualified -EINVAL out domain creation.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

