Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3001A79BC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJv3-0003wN-B0; Tue, 14 Apr 2020 11:39:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOJv2-0003wC-8B
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:39:56 +0000
X-Inumbo-ID: a954fac6-7e44-11ea-8927-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a954fac6-7e44-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 11:39:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F15BAC4A;
 Tue, 14 Apr 2020 11:39:54 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 00/10] x86emul: further work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Date: Tue, 14 Apr 2020 13:39:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A few of the patches are still at least partly RFC, for varying
reasons (see there). I'd appreciate though if at least some of
the series could go in rather sooner than later. The two new
ones (8 and 9) could likely be moved arbitrarily ahead (as a
pair, not 9 ahead of 8), if others are to be further delayed.

 1: x86: determine HAVE_AS_* just once
 2: x86: move back clang no integrated assembler tests
 3: x86emul: support MOVDIR{I,64B} insns
 4: x86emul: support ENQCMD insn
 5: x86/HVM: scale MPERF values reported to guests (on AMD)
 6: x86emul: support RDPRU
 7: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads
 8: x86emul: support SERIALIZE
 9: x86emul: support X{SUS,RES}LDTRK
10: x86emul: support MCOMMIT

See individual patches for changes from v5; as indicated in reply
to v5 I've not changed patch 1 according to feedback, as I'm not
(yet?) convinced of the underlying (new) model.

Patch 3 continues to (contextually) depend on the still pending
"x86emul: disable FPU/MMX/SIMD insn emulation when !HVM".

Jan

