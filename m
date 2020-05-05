Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA11C4FEB
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 10:11:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVsej-0003jM-8f; Tue, 05 May 2020 08:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVsei-0003jH-4I
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 08:10:20 +0000
X-Inumbo-ID: db91352c-8ea7-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db91352c-8ea7-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 08:10:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99C70AC1F;
 Tue,  5 May 2020 08:10:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 00/12] x86emul: further work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Date: Tue, 5 May 2020 10:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At least the RDPRU patch is still at least partly RFC. I'd
appreciate though if at least some of the series could go in rather
sooner than later. Note in particular that there's no strong
ordering throughout the entire series, i.e. certain later parts
could be arranged for to go in earlier. This is also specifically
the case for what is now the last patch.

 1: x86emul: disable FPU/MMX/SIMD insn emulation when !HVM
 2: x86emul: support MOVDIR{I,64B} insns
 3: x86emul: support ENQCMD insn
 4: x86emul: support SERIALIZE
 5: x86emul: support X{SUS,RES}LDTRK
 6: x86/HVM: make hvmemul_blk() capable of handling r/o operations
 7: x86emul: support FNSTENV and FNSAVE
 8: x86emul: support FLDENV and FRSTOR
 9: x86emul: support FXSAVE/FXRSTOR
10: x86/HVM: scale MPERF values reported to guests (on AMD)
11: x86emul: support RDPRU
12: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads

Main changes from v7 are the new patch 6 and quiite a bit of re-work
of what is now patch 9. See individual patches for revision details.

Jan

