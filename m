Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A882A190DE3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:45:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGiu6-0008Cf-2U; Tue, 24 Mar 2020 12:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGiu4-0008Ca-1k
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:43:32 +0000
X-Inumbo-ID: 10f34292-6dcd-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10f34292-6dcd-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 12:43:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F42FAC91;
 Tue, 24 Mar 2020 12:43:30 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Message-ID: <fba4f9c6-5bbd-21d9-3912-328c6c6cc389@suse.com>
Date: Tue, 24 Mar 2020 13:43:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul,On 24.03.2020 13:26, Jan Beulich wrote:
> Some of the later patches are still at least partly RFC, for
> varying reasons (see there). I'd appreciate though if at least
> some of the earlier ones could go in rather sooner than later.
> 
> Patch 1 functionally (for the test harness) depends on
> "libx86/CPUID: fix (not just) leaf 7 processing", while at
> least patch 2 contextually depends on "x86emul: disable
> FPU/MMX/SIMD insn emulation when !HVM".
> 
>  1: x86emul: support AVX512_BF16 insns

I should note that I also have a VP2INTERSECT patch ready, but the
just released SDE segfaults when trying to test it. I'll be holding
this back for some more time, I guess.

>  2: x86emul: support MOVDIRI insn
>  3: x86: determine HAVE_AS_* just once
>  4: x86: move back clang no integrated assembler tests
>  5: x86emul: support MOVDIR64B insn
>  6: x86emul: support ENQCMD insn
>  7: x86/HVM: scale MPERF values reported to guests (on AMD)
>  8: x86emul: support RDPRU
>  9: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads
> 10: x86emul: support MCOMMIT

Paul, I should also note that I mistakenly Cc-ed your old Citrix
address. I'd like to avoid re-posting the series - do you perhaps
nevertheless get the xen-devel copies?

Jan

