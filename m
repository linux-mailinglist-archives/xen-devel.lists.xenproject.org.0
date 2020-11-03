Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC22A4129
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18153.43014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtBz-0007fK-OD; Tue, 03 Nov 2020 10:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18153.43014; Tue, 03 Nov 2020 10:05:31 +0000
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
	id 1kZtBz-0007ev-LD; Tue, 03 Nov 2020 10:05:31 +0000
Received: by outflank-mailman (input) for mailman id 18153;
 Tue, 03 Nov 2020 10:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtBy-0007eq-C0
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:05:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 36af6dd4-fd0b-4ded-bbb7-fa034a39a686;
 Tue, 03 Nov 2020 10:05:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 373E1ABDE;
 Tue,  3 Nov 2020 10:05:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtBy-0007eq-C0
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:05:30 +0000
X-Inumbo-ID: 36af6dd4-fd0b-4ded-bbb7-fa034a39a686
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 36af6dd4-fd0b-4ded-bbb7-fa034a39a686;
	Tue, 03 Nov 2020 10:05:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604397929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ql4n2Yymab8Emht2sqi1yTHDi/l/eT3pvMQcUPCaY=;
	b=svRUg5IcZy6Sus9ZXIRsgbTTWQq/oeEdthT1M5VS7EjVqBRT0K5CHMZOaqjpcCkJuiPEkc
	jm4kz79GX+1I4jRhkqbhTTtTZhb7Pf/6P9fs6uVokxxTHw8hP+acfRKGMIDhvP5zLOY6ZI
	f5Vv9ynLwzI6/iNPUDkAlZCWp+jnb+4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 373E1ABDE;
	Tue,  3 Nov 2020 10:05:29 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
Date: Tue, 3 Nov 2020 11:05:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.2020 11:00, Julien Grall wrote:
> Hi Frédéric,
> 
> On 31/10/2020 15:14, Frédéric Pierret (fepitre) wrote:
>> ---
>>   xen/Makefile | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 30b1847515..4cc35556ef 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>   export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>>   -include xen-version
>>   
>> +export SOURCE_DATE_EPOCH	?= $(shell git log -1 --format=%ct 2>/dev/null)
> 
> It is possible to download a tarball for Xen release (see [1]). They 
> don't contain the .git directory and therefore this command would fail.
> 
> Should we fallback to "date" in this case?

Isn't this what already happens? The variable would be assigned
an empty value in this case, wouldn't it?

Jan

