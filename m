Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD530217E55
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 06:25:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt1eU-0003nR-MN; Wed, 08 Jul 2020 04:25:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ym/r=AT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jt1eS-0003nJ-Ul
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 04:25:44 +0000
X-Inumbo-ID: 16c4b954-c0d3-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16c4b954-c0d3-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 04:25:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31DACAD81;
 Wed,  8 Jul 2020 04:25:44 +0000 (UTC)
Subject: Re: [linux-linus test] 151705: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-151705-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e47bb121-72f3-e608-1177-4991669ec5d7@suse.com>
Date: Wed, 8 Jul 2020 06:25:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-151705-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On 07.07.20 21:23, osstest service owner wrote:
> flight 151705 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/151705/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:

...

>   build-i386-pvops              6 kernel-build             fail REGR. vs. 151214

This one is a known problem with a fixing patch already queued for the
next rc.


Juergen

