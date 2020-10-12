Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA128ACBC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 06:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5781.15003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRpJP-00078R-KY; Mon, 12 Oct 2020 04:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5781.15003; Mon, 12 Oct 2020 04:19:51 +0000
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
	id 1kRpJP-000782-HQ; Mon, 12 Oct 2020 04:19:51 +0000
Received: by outflank-mailman (input) for mailman id 5781;
 Mon, 12 Oct 2020 04:19:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRpJO-00077x-5S
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 04:19:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31580948-b2d6-4560-9458-4b432e2571d2;
 Mon, 12 Oct 2020 04:19:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 585A7AB5C;
 Mon, 12 Oct 2020 04:19:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRpJO-00077x-5S
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 04:19:50 +0000
X-Inumbo-ID: 31580948-b2d6-4560-9458-4b432e2571d2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 31580948-b2d6-4560-9458-4b432e2571d2;
	Mon, 12 Oct 2020 04:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602476387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Vo7oaCnzCTjjefr7nGjqs8mFYgwNhN8TeP87arFBPI=;
	b=VYiHrnNzKZxCtvG+Y0HfHhfpWBtlexg/rw83A2ULTu0nht0VWx0xZbWgMhUsytct2fTB/v
	lHaM8szRprajcmYUgWKxcft6wI7bESOW2SJ3m60Cpgx0c5DSlH/ElcQtZd6b2n8y30JDeI
	4UwJ1uiQSQL+8k+v6tTPnr2rWjHD9kY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 585A7AB5C;
	Mon, 12 Oct 2020 04:19:47 +0000 (UTC)
Subject: Re: [PATCH 1/3] tools/libs: move official headers to common directory
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20201002142214.3438-1-jgross@suse.com>
 <20201002142214.3438-2-jgross@suse.com>
 <20201008153205.6quz43n7w7utli22@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a3900dbd-f57b-9972-b3f6-d12a314ac3f7@suse.com>
Date: Mon, 12 Oct 2020 06:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008153205.6quz43n7w7utli22@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.10.20 17:32, Wei Liu wrote:
> On Fri, Oct 02, 2020 at 04:22:12PM +0200, Juergen Gross wrote:
>> Instead of each library having an own include directory move the
>> official headers to tools/include instead. This will drop the need to
>> link those headers to tools/include and there is no need any longer
>> to have library-specific include paths when building Xen.
>>
>> While at it remove setting of the unused variable
>> PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
>>
> 
> Not sure about this.
> 
> Will this make packaging individual libraries more difficult?

Not at all. This was meant for the pkg-config file used internally in
the Xen build, not for the ones installed on user's systems.

As there seems to be no need for that I believe we should drop that
extra hook. It can easily be reintroduced in case we need it in future.

> Maintainers will need to comb through a large amount of headers to pick
> the ones they want.
> 
> What do others think?


Juergen

