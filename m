Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D6192778
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:47:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH4TB-00023o-JN; Wed, 25 Mar 2020 11:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH4T9-00023j-O3
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:45:11 +0000
X-Inumbo-ID: 14e9042e-6e8e-11ea-85de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14e9042e-6e8e-11ea-85de-12813bfff9fa;
 Wed, 25 Mar 2020 11:45:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C46E5AC5B;
 Wed, 25 Mar 2020 11:45:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <db2b459a-5dac-ecd0-1650-f8b1dca8ff96@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <162583f8-2b2e-e9c9-1fcf-8fff629d0cb0@suse.com>
Date: Wed, 25 Mar 2020 12:45:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <db2b459a-5dac-ecd0-1650-f8b1dca8ff96@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v5 00/10] x86emul: further work
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 12:41, Andrew Cooper wrote:
> On 24/03/2020 12:26, Jan Beulich wrote:
>> Some of the later patches are still at least partly RFC, for
>> varying reasons (see there). I'd appreciate though if at least
>> some of the earlier ones could go in rather sooner than later.
>>
>> Patch 1 functionally (for the test harness) depends on
>> "libx86/CPUID: fix (not just) leaf 7 processing", while at
>> least patch 2 contextually depends on "x86emul: disable
>> FPU/MMX/SIMD insn emulation when !HVM".
>>
>>  1: x86emul: support AVX512_BF16 insns
>>  2: x86emul: support MOVDIRI insn
>>  3: x86: determine HAVE_AS_* just once
> 
> I have (in this order when threaded):
> 
> 02/10 Support AVX512_BF16
> 02/10 Support MOVDIRI
> 01/10 Support AVX512_BF16
> 03/10 Determine HAS_AS_*
> 
> To a first approximation, the two AVX512_BF16 ones look identical, so
> I'm going to assume that the first one (chronologically) was the error.

Yes indeed, sorry.

Jan

