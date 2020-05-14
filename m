Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040491D2B08
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:13:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZ9vE-0002Zg-1Y; Thu, 14 May 2020 09:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZ9vD-0002ZY-1X
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:12:55 +0000
X-Inumbo-ID: 17ba3d60-95c3-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17ba3d60-95c3-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 09:12:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D3C7ABE6;
 Thu, 14 May 2020 09:12:56 +0000 (UTC)
Subject: Re: [PATCH v9 0/9] x86emul: further work
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
Message-ID: <75b9068b-4bbb-221d-6737-dc4a7867d580@suse.com>
Date: Thu, 14 May 2020 11:12:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
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

On 14.05.2020 11:03, Jan Beulich wrote:
> 1: address x86_insn_is_mem_{access,write}() omissions 
> 2: disable FPU/MMX/SIMD insn emulation when !HVM
> 3: support MOVDIR{I,64B} insns
> 4: support ENQCMD insn
> 5: support SERIALIZE
> 6: support X{SUS,RES}LDTRK
> 7: support FNSTENV and FNSAVE
> 8: support FLDENV and FRSTOR
> 9: support FXSAVE/FXRSTOR
> 
> Main changes from v8 are the new patch 1 and dropped patches
> from the end of the series. For other changes see the individual
> patches.

Oh, and I should have mentioned that parts here depend on
"x86/gen-cpuid: Distinguish default vs max in feature annotations",
which looks to be ready to go in, but hasn't gone in yet.

Jan


