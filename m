Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9A19D343
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 11:13:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKIO8-0003IP-Rt; Fri, 03 Apr 2020 09:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKIO7-0003IK-T4
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 09:13:19 +0000
X-Inumbo-ID: 5c150380-758b-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c150380-758b-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bBhycdUWxbN/XcZgP00W/lb/2siG9aVTWMKSQAT4K3M=; b=wXumFoze2Joi4ghNPr2d46ZMkP
 632XhlFpfMfrewpczL3Ftt/AA3jdz0IERV/JgdCmvV6Q0EgDysmqLZFnzWn0Ey9kIVb77lhYdA6ZN
 8LUe2Or/2JJat+b3mUhNgNhhcrGlwBx+eO7s8ypdzRVio7vyS1N+PkdfwQXymdz4zJDc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKIO6-0002WX-0K; Fri, 03 Apr 2020 09:13:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKIO5-0008Q4-QF; Fri, 03 Apr 2020 09:13:17 +0000
Subject: Re: [xen-unstable test] 149335: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>
References: <osstest-149335-mainreport@xen.org>
 <90c01d6b-1d8f-81de-656e-d97eea302552@xen.org>
 <8087c371-0488-3a26-379b-af964b4300ce@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7d7afffb-9b8e-e504-9f23-4aa3d7e55e04@xen.org>
Date: Fri, 3 Apr 2020 10:13:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8087c371-0488-3a26-379b-af964b4300ce@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 03/04/2020 10:11, Jan Beulich wrote:
> On 03.04.2020 11:08, Julien Grall wrote:
>> Hi,
>>
>> On 03/04/2020 06:27, osstest service owner wrote:
>>> flight 149335 xen-unstable real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/149335/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>    test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 149188
>>>    build-amd64-xsm               6 xen-build                fail REGR. vs. 149188
>>
>> I am a bit puzzled with this failure. Looking at the log [1], I only found:
>>
>> failure (trapped): status 256 at Osstest/TestSupport.pm line 551.
>>
>> Can anyone spot an issue in the log?
> 
> Yes:
> 
> fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://github.com/krb5/krb5/': The requested URL returned error: 504 // error: Could not fetch origin
> fatal: clone of 'https://github.com/krb5/krb5' into submodule path '/home/osstest/build.149335.build-amd64-xsm/xen/tools/firmware/ovmf-dir-remote/CryptoPkg/Library/OpensslLib/openssl/krb5' failed

Thanks! So it is a networking issue. I will ignore this one.

Cheers,

-- 
Julien Grall

