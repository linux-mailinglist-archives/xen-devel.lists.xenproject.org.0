Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07E325F7C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 09:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90133.170506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYrv-00068I-Bk; Fri, 26 Feb 2021 08:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90133.170506; Fri, 26 Feb 2021 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYrv-00067t-8b; Fri, 26 Feb 2021 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 90133;
 Fri, 26 Feb 2021 08:53:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFYrt-00067n-LG
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 08:53:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a4a077c-346a-4ed7-a79d-bdcb62383fc0;
 Fri, 26 Feb 2021 08:53:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64BFFAAAE;
 Fri, 26 Feb 2021 08:52:59 +0000 (UTC)
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
X-Inumbo-ID: 2a4a077c-346a-4ed7-a79d-bdcb62383fc0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614329579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFALBeC8k+k/GI+FB/NkN2E3GR1U69a47Bjnc+yRKOw=;
	b=YBJeuDT1kn7hK94Ef2MhwrZ59bT1pky1vaQj4ye5qCXMm7T5lK/DMRPHwvSvpEONdG6ABv
	CUFaX0Qro1T482W0yDdHfobCyWXIIYSkl+jgmkr/zzl1flP1ZBweidSfhAhn2ByudmR4Ug
	AjWREYtj/blj4oy/e6GBUo/ckseaTq8=
Subject: Re: [PATCH for-4.15] x86/dmop: Properly fail for PV guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210225170936.3008-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e50e1df-23c9-92f7-0d57-d5c0589500b7@suse.com>
Date: Fri, 26 Feb 2021 09:52:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225170936.3008-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 18:09, Andrew Cooper wrote:
> The current code has an early exit for PV guests, but it returns 0 having done
> nothing.
> 
> Fixes: 524a98c2ac5 ("public / x86: introduce __HYPERCALL_dm_op...")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

