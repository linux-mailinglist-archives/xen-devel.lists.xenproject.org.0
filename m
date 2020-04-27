Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D21BA5E5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 16:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4Tw-00076a-46; Mon, 27 Apr 2020 14:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT4Tu-00076V-2Z
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 14:11:34 +0000
X-Inumbo-ID: ff759734-8890-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff759734-8890-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 14:11:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3322ABB2;
 Mon, 27 Apr 2020 14:11:31 +0000 (UTC)
Subject: Re: [PATCH] x86/IST: Fix comment about stack layout
To: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200427131702.13991-1-andrew.cooper3@citrix.com>
 <20200427131955.tqcnjdppinr4oopk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9000549-f51a-430d-14ea-d5d4d5171ef2@suse.com>
Date: Mon, 27 Apr 2020 16:11:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427131955.tqcnjdppinr4oopk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.2020 15:19, Wei Liu wrote:
>> --- a/xen/include/asm-x86/current.h
>> +++ b/xen/include/asm-x86/current.h
>> @@ -18,7 +18,7 @@
>>   * 6 - Primary stack
>>   * 5 - Optionally not present (MEMORY_GUARD)
>>   * 4 - Unused; optionally not present (MEMORY_GUARD)
>> - * 3 - Unused; optionally not present (MEMORY_GUARD)
>> + * 3 -  DB IST stack
> 
> There seems to be an extraneous space before "DB".

I guess #DB was meant. With that

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

