Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9C19D32A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 11:11:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKIM3-00039P-BH; Fri, 03 Apr 2020 09:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKIM1-00039K-Ch
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 09:11:09 +0000
X-Inumbo-ID: 0de214aa-758b-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de214aa-758b-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 09:11:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 432FAADC8;
 Fri,  3 Apr 2020 09:11:07 +0000 (UTC)
Subject: Re: [xen-unstable test] 149335: regressions - FAIL
To: Julien Grall <julien@xen.org>
References: <osstest-149335-mainreport@xen.org>
 <90c01d6b-1d8f-81de-656e-d97eea302552@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8087c371-0488-3a26-379b-af964b4300ce@suse.com>
Date: Fri, 3 Apr 2020 11:11:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <90c01d6b-1d8f-81de-656e-d97eea302552@xen.org>
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 11:08, Julien Grall wrote:
> Hi,
> 
> On 03/04/2020 06:27, osstest service owner wrote:
>> flight 149335 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/149335/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 149188
>>   build-amd64-xsm               6 xen-build                fail REGR. vs. 149188
> 
> I am a bit puzzled with this failure. Looking at the log [1], I only found:
> 
> failure (trapped): status 256 at Osstest/TestSupport.pm line 551.
> 
> Can anyone spot an issue in the log?

Yes:

fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://github.com/krb5/krb5/': The requested URL returned error: 504 // error: Could not fetch origin
fatal: clone of 'https://github.com/krb5/krb5' into submodule path '/home/osstest/build.149335.build-amd64-xsm/xen/tools/firmware/ovmf-dir-remote/CryptoPkg/Library/OpensslLib/openssl/krb5' failed

Jan

