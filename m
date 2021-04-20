Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B413658F7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113599.216493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpVq-0006R1-Oc; Tue, 20 Apr 2021 12:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113599.216493; Tue, 20 Apr 2021 12:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpVq-0006Qc-LB; Tue, 20 Apr 2021 12:29:54 +0000
Received: by outflank-mailman (input) for mailman id 113599;
 Tue, 20 Apr 2021 12:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYpVp-0006QX-65
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:29:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e653e5a-1c09-4653-8d7a-5657df5b3c26;
 Tue, 20 Apr 2021 12:29:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7AB4B4AF;
 Tue, 20 Apr 2021 12:29:50 +0000 (UTC)
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
X-Inumbo-ID: 0e653e5a-1c09-4653-8d7a-5657df5b3c26
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618921791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7ALtqgMP9KRHpx2uUqP3u8ppq+7kB/7+HY0Unnv9vE=;
	b=S0VW/a/SnBC30Oa0TnM8CD37PER+qUIv+izEhOEZCE50S4QgiZiRXhGKoZfmF/bnZ5nyAq
	Cto8MimUdF3HsHX/aMswB93yfqiY48CUXI1pfwpdIg7UnRuypIxJNVTLqT8J697iihgbNr
	eyHqthMimY+XpQtP4UyED/MOyCudrik=
Subject: Re: [PATCH v9 09/13] x86/smpboot: add exit path for clone_mapping()
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1617706782.git.hongyxia@amazon.com>
 <1277cb7cb71edbb03a13f9db8fe07810e68c7248.1617706782.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fdf3f018-4eff-1323-c510-bd035afbfe9f@suse.com>
Date: Tue, 20 Apr 2021 14:29:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1277cb7cb71edbb03a13f9db8fe07810e68c7248.1617706782.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 13:05, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> We will soon need to clean up page table mappings in the exit path.
> 
> No functional change.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

