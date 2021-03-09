Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FC33294F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95538.180420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdlw-0004rA-1w; Tue, 09 Mar 2021 14:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95538.180420; Tue, 09 Mar 2021 14:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdlv-0004qk-Ug; Tue, 09 Mar 2021 14:55:43 +0000
Received: by outflank-mailman (input) for mailman id 95538;
 Tue, 09 Mar 2021 14:55:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdlu-0004qd-Bt
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:55:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3a3497-dc6f-41b7-aa92-e46182e5ba5a;
 Tue, 09 Mar 2021 14:55:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5296AEBE;
 Tue,  9 Mar 2021 14:55:40 +0000 (UTC)
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
X-Inumbo-ID: 3a3a3497-dc6f-41b7-aa92-e46182e5ba5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615301740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLHb+YAcHTY1pyFDQG5H8fcOhtAOu3Rg7vCcXWyNTQg=;
	b=kXM534RWQnV7lDsg/BqCtdx4BoXj9Mk7bmnfCWk5Lqr8HQospz+COqV4sfhXo3xcHaqWq1
	IGWqGe1iSvGhulrGA79OI8JXgUoluYUZghRlG+p+SL1XM8KVlu55INvuK85M+bbWZh7JYZ
	BLT1V45NuM6Rtz2G421QdidMrmYX/+w=
Subject: Re: [PATCH 4.15 1/3] MAINTAINERS: Make myself the owner of the
 changelog
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-2-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <208181b5-d2e7-15c8-df86-00dea6e3040d@suse.com>
Date: Tue, 9 Mar 2021 15:55:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145002.30359-2-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.03.2021 15:50, Ian Jackson wrote:
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

I don't suppose this kind of a change needs it, but just in case:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -256,7 +256,7 @@ S:	Supported
>  F:	xen/drivers/passthrough/arm/smmu-v3.c
>  
>  Change Log
> -M:	Paul Durrant <paul@xen.org>
> +M:	Ian Jackson <iwj@xenproject.org>
>  R:	Community Manager <community.manager@xenproject.org>
>  S:	Maintained
>  F:	CHANGELOG.md
> 


