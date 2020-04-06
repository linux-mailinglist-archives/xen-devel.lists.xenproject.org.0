Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A719F40E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPXh-0001Ym-RF; Mon, 06 Apr 2020 11:03:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLPXf-0001YZ-OH
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:03:47 +0000
X-Inumbo-ID: 49827a14-77f6-11ea-bfe0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49827a14-77f6-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 11:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 030BBAD41;
 Mon,  6 Apr 2020 11:03:46 +0000 (UTC)
Subject: Re: [PATCH 0/5] use new API for Xen page tables
To: Hongyan Xia <hx242@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f072eca-bd34-ebb7-706f-9dc688c991ad@suse.com>
Date: Mon, 6 Apr 2020 13:03:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 10:27, Hongyan Xia wrote:
> Ping.

Does this somehow imply you didn't get my replies sent on the 1st?

Jan

> On Mon, 2020-03-23 at 09:41 +0000, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> This small series is basically just rewriting functions using the new
>> API to map and unmap PTEs. Each patch is independent.
>>
>> Apart from mapping and unmapping page tables, no other functional
>> change
>> intended.
>>
>> Wei Liu (5):
>>   x86/shim: map and unmap page tables in replace_va_mapping
>>   x86_64/mm: map and unmap page tables in m2p_mapped
>>   x86_64/mm: map and unmap page tables in share_hotadd_m2p_table
>>   x86_64/mm: map and unmap page tables in destroy_compat_m2p_mapping
>>   x86_64/mm: map and unmap page tables in destroy_m2p_mapping
>>
>>  xen/arch/x86/pv/shim.c     | 10 ++++---
>>  xen/arch/x86/x86_64/mm.c   | 55 +++++++++++++++++++++++++-----------
>> --
>>  xen/include/asm-x86/page.h | 18 +++++++++++++
>>  3 files changed, 62 insertions(+), 21 deletions(-)
>>
> 


