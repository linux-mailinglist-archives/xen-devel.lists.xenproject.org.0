Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41378255382
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 06:19:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBVqr-0002tq-7k; Fri, 28 Aug 2020 04:18:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QM1O=CF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1kBL3S-0000kw-5M
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 16:47:14 +0000
X-Inumbo-ID: 99a90bc5-006b-42a9-b0c1-dfe2f0089b8d
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99a90bc5-006b-42a9-b0c1-dfe2f0089b8d;
 Thu, 27 Aug 2020 16:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id EF666B561EF4;
 Thu, 27 Aug 2020 19:47:10 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LCLtayEFsM_I; Thu, 27 Aug 2020 19:47:08 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C126AB561EF5;
 Thu, 27 Aug 2020 19:47:08 +0300 (EEST)
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eVoPHNJe2Xh7; Thu, 27 Aug 2020 19:47:08 +0300 (EEST)
Received: from [192.168.1.35] (5-12-253-103.residential.rdsnet.ro
 [5.12.253.103]) by mx.upb.ro (Postfix) with ESMTPSA id 72B84B561EEC;
 Thu, 27 Aug 2020 19:47:08 +0300 (EEST)
Subject: Re: [xen-unstable-smoke test] 152898: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <osstest-152898-mainreport@xen.org>
 <fd303f97-a471-686e-8d4a-12578bdb6c07@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <ef1ffb57-5d70-e819-f4cf-4ff632325b76@cs.pub.ro>
Date: Thu, 27 Aug 2020 19:47:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fd303f97-a471-686e-8d4a-12578bdb6c07@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 28 Aug 2020 04:18:56 +0000
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

On 8/27/20 7:07 PM, Jan Beulich wrote:
> On 27.08.2020 17:49, osstest service owner wrote:
>> flight 152898 xen-unstable-smoke real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/152898/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-amd64                   6 xen-build                fail REGR. vs. 152892
> 
> This looks to be an issue in the mini-os tree, and I'm having
> trouble understanding how it can cause the main tree to first
> discover it. Is there no push gate for that tree?
> 
> In any event, commit 1b8ed31f4ce4 ("mini-os: netfront: Read netmask
> and gateway from Xenstore") looks to have missed callers to
> init_netfront(), both in the mini-os tree itself and in stubdom/grub/
> of the main tree.

Hi Jan,

Sorry for missing that. I've just sent a patch on the mini-os mailing
list. Please let me know if it needs anything else.

Cheers,
Costin

