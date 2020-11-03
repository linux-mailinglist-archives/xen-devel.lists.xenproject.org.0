Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32272A3FE5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18063.42836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsWt-0002R1-HK; Tue, 03 Nov 2020 09:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18063.42836; Tue, 03 Nov 2020 09:23:03 +0000
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
	id 1kZsWt-0002Qc-E3; Tue, 03 Nov 2020 09:23:03 +0000
Received: by outflank-mailman (input) for mailman id 18063;
 Tue, 03 Nov 2020 09:23:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZsWr-0002QT-FL
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:23:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8cd90120-311d-4a5f-89a9-0a4673ba5589;
 Tue, 03 Nov 2020 09:23:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A9C0AC97;
 Tue,  3 Nov 2020 09:23:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZsWr-0002QT-FL
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:23:01 +0000
X-Inumbo-ID: 8cd90120-311d-4a5f-89a9-0a4673ba5589
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 8cd90120-311d-4a5f-89a9-0a4673ba5589;
	Tue, 03 Nov 2020 09:23:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604395380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzatKUxPuJ4BmtBk4o15c/AANhscTKaCziIkcBaMskc=;
	b=urT8XrOEb9glwysdL6XbTnDep5UMoa8f1AEEmsD7t4Brwpxd3HXDlDKJK/qPWULSofxPut
	wXvkSH6nFn15rwY0dUwBQgGNqfcTD28umCD9fFWA1Ue6ARtnol3xDrusot91QTVw+lpr2s
	QcwJK5RleSnt9JtV36aL5AG24JubVio=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A9C0AC97;
	Tue,  3 Nov 2020 09:23:00 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <fabf886c-4270-9620-5a72-210a2fccb016@suse.com>
 <2898550a-6921-4c5a-920f-37486e2599ea@qubes-os.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <512c3480-5736-ff1b-3ba1-46eacd04e058@suse.com>
Date: Tue, 3 Nov 2020 10:23:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2898550a-6921-4c5a-920f-37486e2599ea@qubes-os.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.2020 10:21, Frédéric Pierret wrote:
> 
> 
> Le 11/3/20 à 10:15 AM, Jan Beulich a écrit :
>> On 31.10.2020 16:14, Frédéric Pierret (fepitre) wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>>   export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>>>   -include xen-version
>>>   
>>> +export SOURCE_DATE_EPOCH	?= $(shell git log -1 --format=%ct 2>/dev/null)
>>
>> In patch 1 you also use the variable under tools/. Why do you
>> place this here rather than in the top level Makefile?
>>
>> This said I'm not convinced anyway that we want this to be the
>> default. I'd rather see this as something to get set by the
>> package build process of distros, outside of any of the source
>> files.
> 
> In fact this was intended to provide a default/example value. Indeed, each package manager should
> handle this with changelog or such.
> 
> This is not mandatory and if not wanted by default, maybe add this example value into the INSTALL documentation?

I'm certainly fine with putting this in the docs. (Whether
INSTALL is the right place I can#t tell.)

Jan

