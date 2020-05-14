Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306641D2ADF
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:04:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZ9mJ-0000rj-Gb; Thu, 14 May 2020 09:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZ9mI-0000re-34
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:03:42 +0000
X-Inumbo-ID: ce5ee54a-95c1-11ea-a463-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce5ee54a-95c1-11ea-a463-12813bfff9fa;
 Thu, 14 May 2020 09:03:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40867AF22;
 Thu, 14 May 2020 09:03:43 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 0/9] x86emul: further work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
Date: Thu, 14 May 2020 11:03:34 +0200
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

1: address x86_insn_is_mem_{access,write}() omissions 
2: disable FPU/MMX/SIMD insn emulation when !HVM
3: support MOVDIR{I,64B} insns
4: support ENQCMD insn
5: support SERIALIZE
6: support X{SUS,RES}LDTRK
7: support FNSTENV and FNSAVE
8: support FLDENV and FRSTOR
9: support FXSAVE/FXRSTOR

Main changes from v8 are the new patch 1 and dropped patches
from the end of the series. For other changes see the individual
patches.

Jan

