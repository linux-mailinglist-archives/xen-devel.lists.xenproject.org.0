Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9480A78C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650688.1016413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcu9-0000rO-AG; Fri, 08 Dec 2023 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650688.1016413; Fri, 08 Dec 2023 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcu9-0000oo-7U; Fri, 08 Dec 2023 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 650688;
 Fri, 08 Dec 2023 15:36:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBcu7-0000oQ-91
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:36:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBcu6-0001P9-Vg; Fri, 08 Dec 2023 15:36:38 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBcu6-00017s-OK; Fri, 08 Dec 2023 15:36:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=pjY3uhahoJ6Ejf8Jy+OMLCKeesaBjGu909SiT0NAvKg=; b=Cco1qm3eM7d6vdy7admSOva9Ws
	xe4ihqXXcDm+ipmnlNxi98qfGar+kaZzPNw88nAO9a3TTqBP1Ic11X+Z6NDYWqLtzRzrPizyVPh+5
	Xxix9S7paO0ipdK07ekRGwYA5K4PowT1H8pwpHWSutLXyTu8QBFn0iMVYt95AZ3K55ow=;
Message-ID: <b0133fa8-a774-4587-a1ed-4059f97970f9@xen.org>
Date: Fri, 8 Dec 2023 15:36:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
 <232da84f-08d0-4bec-9eca-0bef023dae37@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <232da84f-08d0-4bec-9eca-0bef023dae37@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2023 15:13, Andrew Cooper wrote:
> Ping.

I noticed Anthony is not CCed (scripts/get_maintainer.pl reports him and 
Wei). The same for CHANGELOG. This should have been Henry (and soon 
Oleksii).

Is this intended?

> 
> On 23/11/2023 4:30 pm, Andrew Cooper wrote:
>> This was declared deprecated in commit 10c88f1c18b7 ("tools: Install pv
>> bootloaders in libexec rather than /usr/bin") in 2012
>>
>> Take it out fully now, 11 years later.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> ---
>>   CHANGELOG.md          | 3 +++
>>   tools/pygrub/Makefile | 6 ------

See above, I think this code is under the remit of Anthony. You haven't 
CCed him so no surprise no-one answered.

It is unclear why "THE REST" was CCed. I called 
scripts/get_maintainers.pl on the patch and only Henry/Anthony/Wei
was listed.

I have CCed Anthony. I can review give a try to review it if you don't 
get any answer from Anthony by mid-next week.

>>   2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 4ecebb9f686a..36a8ef89d8e4 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   ### Removed
>>   - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
>>     been superseded by the MirageOS/SOLO5 projects.
>> +- /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
>> +  compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
>> +  should be updated to just bootloader="pygrub".
>>   
>>   ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
>>   
>> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>> index 4963bc89c6ed..d5e291ea0619 100644
>> --- a/tools/pygrub/Makefile
>> +++ b/tools/pygrub/Makefile
>> @@ -22,15 +22,9 @@ install: all
>>   	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>   		--root="$(DESTDIR)" --force
>>   	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>> -	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
>> -	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
>> -	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>> -	    ln -sf $(LIBEXEC_BIN)/pygrub $(DESTDIR)/$(bindir); \
>> -	fi
>>   
>>   .PHONY: uninstall
>>   uninstall:
>> -	rm -f $(DESTDIR)/$(bindir)/pygrub
>>   	if [ -e $(INSTALL_LOG) ]; then \
>>   		cat $(INSTALL_LOG) | xargs -i rm -f $(DESTDIR)/{}; \
>>   	fi
>>
>> base-commit: f96e2f64576cdbb147391c7cb399d393385719a9
> 

Cheers,

-- 
Julien Grall

