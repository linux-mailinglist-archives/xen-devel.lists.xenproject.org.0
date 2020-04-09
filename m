Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E71A316C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 11:01:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMT3F-0001lC-IU; Thu, 09 Apr 2020 09:00:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMT3E-0001l6-Fq
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 09:00:44 +0000
X-Inumbo-ID: 97eebbb3-7a40-11ea-829b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97eebbb3-7a40-11ea-829b-12813bfff9fa;
 Thu, 09 Apr 2020 09:00:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F3B4AEC5;
 Thu,  9 Apr 2020 09:00:42 +0000 (UTC)
Subject: Re: [xen-unstable test] 149520: regressions - FAIL
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <osstest-149520-mainreport@xen.org>
 <74b51d2e-4480-8aea-9069-1214333e799f@suse.com>
 <277afcf8-fc0f-de37-ab61-0b1bff54c125@suse.com>
 <36780b96-6db0-ab80-9bb2-d028d6856552@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c58d88e0-04ce-500d-9216-8b3746a8d03d@suse.com>
Date: Thu, 9 Apr 2020 11:00:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <36780b96-6db0-ab80-9bb2-d028d6856552@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.2020 10:56, Jürgen Groß wrote:
> On 09.04.20 10:00, Jan Beulich wrote:
>> On 09.04.2020 09:31, Jürgen Groß wrote:
>>> On 09.04.20 04:30, osstest service owner wrote:
>>>> flight 149520 xen-unstable real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/149520/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>    test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 13 guest-saverestore fail REGR. vs. 149478
>>>>    test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 149478
>>>
>>> Is it possible to get the ioemu-stubdom binary used in those tests?
>>
>> Isn't this the usr/local/lib/xen/boot/ioemu-stubdom.gz in
>> http://logs.test-lab.xenproject.org/osstest/logs/149520/build-amd64-xsm/build/dist.tar.gz
> 
> No, the crashed one was a 32-bit stubdom, while this file is a 64-bit
> one. According to the log the path should be fine, but the file in no
> way matches the crashed one.

Then look under http://logs.test-lab.xenproject.org/osstest/logs/149520/build-i386-xsm/build/
or any of the other http://logs.test-lab.xenproject.org/osstest/logs/149520/build-*/build/?
I'm pretty sure all produced binaries get collected and made available.

Jan

