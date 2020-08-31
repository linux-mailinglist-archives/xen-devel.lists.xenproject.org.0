Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086C257309
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 06:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCbcs-000626-FN; Mon, 31 Aug 2020 04:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgtu=CJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kCbcq-000621-Ir
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 04:41:00 +0000
X-Inumbo-ID: 12adf8be-3ed3-47c7-9950-ed8e50d603d5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12adf8be-3ed3-47c7-9950-ed8e50d603d5;
 Mon, 31 Aug 2020 04:40:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13933B779;
 Mon, 31 Aug 2020 04:41:33 +0000 (UTC)
Subject: Re: [xen-unstable test] 153154: regressions - trouble:
 broken/fail/pass
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, "Durrant, Paul" <pdurrant@amazon.com>
References: <osstest-153154-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <97b0ec7e-6b74-88f1-ccb0-cc22ea2817c9@suse.com>
Date: Mon, 31 Aug 2020 06:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <osstest-153154-mainreport@xen.org>
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

On 30.08.20 18:11, osstest service owner wrote:
> flight 153154 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/153154/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
>   test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
>   test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877

Paul, I suspect some fallout from your hotplug/mtu series?

The failure in

http://logs.test-lab.xenproject.org/osstest/logs/153154/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/10.ts-debian-hvm-install.log

is pointing in this direction IMO.


Juergen

