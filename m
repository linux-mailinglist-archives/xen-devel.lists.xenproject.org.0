Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6ED348ABC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 08:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101278.193591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKoQ-00061e-C6; Thu, 25 Mar 2021 07:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101278.193591; Thu, 25 Mar 2021 07:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKoQ-00061E-8c; Thu, 25 Mar 2021 07:53:50 +0000
Received: by outflank-mailman (input) for mailman id 101278;
 Thu, 25 Mar 2021 07:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPKoP-000619-Br
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:53:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d51ecd83-67c1-4630-83ae-28d9c5075afe;
 Thu, 25 Mar 2021 07:53:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D03A5ACBF;
 Thu, 25 Mar 2021 07:53:47 +0000 (UTC)
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
X-Inumbo-ID: d51ecd83-67c1-4630-83ae-28d9c5075afe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616658827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC00qsoMd0Vpe0LEgrn1pSDhjhoVGrMCuJHCsjhvysg=;
	b=Lw1LPfFbH5ni7z+VDpZ+wAtBiFfF29WOnR9wnosqYhciI9C9QfeJI17KnznOGA6zCH9Dmo
	n7xc7cMVdmT7PtscDuF9cRW8ZmvjlxNycctaPoPKulCxf5cZA2DU7cbH0enRmyaLpAt2v4
	FRKbUaXOLug/l2EQHSPCuTF7lDPvyVo=
Subject: Re: [PATCH 1/6] Intel Processor Trace Support: Add CHANGELOG.md and
 SUPPORT.md entries
To: George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel@lists.xenproject.org
References: <20210324164407.302062-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fe59844-d512-805d-fefe-8522cccd59ca@suse.com>
Date: Thu, 25 Mar 2021 08:53:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 17:44, George Dunlap wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -247,6 +247,13 @@ Export hypervisor coverage data suitable for analysis by gcov or lcov.
>  
>      Status: Supported, Not security supported
>  
> +### Processor trace support
> +
> +Support for using Intel Processor Trace technology to trace guests
> +from dom0.
> +
> +    Status: Tech Preview

While it may not strictly be needed here, perhaps for consistency with
other entries

    Status, x86: Tech Preview

?

This minor aspect aside,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

