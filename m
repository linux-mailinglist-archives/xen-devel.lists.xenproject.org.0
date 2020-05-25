Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBC1E106F
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE1M-0007hI-3S; Mon, 25 May 2020 14:24:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE1K-0007hD-Pv
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:24:02 +0000
X-Inumbo-ID: 610c89d6-9e93-11ea-aee4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 610c89d6-9e93-11ea-aee4-12813bfff9fa;
 Mon, 25 May 2020 14:24:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77E3AAC9F;
 Mon, 25 May 2020 14:24:03 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v10 0/9] x86emul: further work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Date: Mon, 25 May 2020 16:23:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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

The first two patches are bug fixes, in part pointed out by the
3rd patch. The remainder is further enabling.

1: address x86_insn_is_mem_{access,write}() omissions 
2: rework CMP and TEST emulation
3: also test decoding and mem access / write logic
4: disable FPU/MMX/SIMD insn emulation when !HVM
5: support MOVDIR{I,64B} insns
6: support ENQCMD insn
7: support FNSTENV and FNSAVE
8: support FLDENV and FRSTOR
9: support FXSAVE/FXRSTOR

Main changes from v9 are several fixes in patch 1 and the new
patch 2, both a result of the new patch 3. For other changes
see the individual patches.

Jan

