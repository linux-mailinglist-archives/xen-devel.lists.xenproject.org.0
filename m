Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AA19D323
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 11:09:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKIJv-0002QZ-Ty; Fri, 03 Apr 2020 09:08:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKIJu-0002QU-2n
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 09:08:58 +0000
X-Inumbo-ID: bff27f46-758a-11ea-bcd8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bff27f46-758a-11ea-bcd8-12813bfff9fa;
 Fri, 03 Apr 2020 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USlXGxBQfW6TZRIeGQbE283xJ03bgHQ9rV6twibcHpM=; b=ViK04IDSPu+KaNGgnDxgX+QJd7
 mP+riwE2+EnHzhOYO+WbLD8DkcR6Bc6TcYKkrKKe6VpVHPwuN3hnugyrXy9Y3kNpDKEQGkpLjGl80
 AbY4lzHB8WOcECEeqMu9nlHWWz4owyAR0Vm8RyPxe3JWMmcNDTMLwlauJJQ3pWl/1Td0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKIJq-0002Qx-7U; Fri, 03 Apr 2020 09:08:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKIJq-00080G-0x; Fri, 03 Apr 2020 09:08:54 +0000
Subject: Re: [xen-unstable test] 149335: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <osstest-149335-mainreport@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <90c01d6b-1d8f-81de-656e-d97eea302552@xen.org>
Date: Fri, 3 Apr 2020 10:08:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <osstest-149335-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 03/04/2020 06:27, osstest service owner wrote:
> flight 149335 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/149335/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 149188
>   build-amd64-xsm               6 xen-build                fail REGR. vs. 149188

I am a bit puzzled with this failure. Looking at the log [1], I only found:

failure (trapped): status 256 at Osstest/TestSupport.pm line 551.

Can anyone spot an issue in the log?

Cheers,

[1] 
http://logs.test-lab.xenproject.org/osstest/logs/149335/build-amd64-xsm/6.ts-xen-build.log

-- 
Julien Grall

