Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D71BA5F2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 16:12:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4US-00079L-Dv; Mon, 27 Apr 2020 14:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT4UQ-00079C-JL
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 14:12:06 +0000
X-Inumbo-ID: 12afac5e-8891-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12afac5e-8891-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587996726;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jXUEm1PTaUOMP/eGkSnRISxH2N3b47mp86SBXqTFxsA=;
 b=HQyx3ZKsgzV9B9NU+yftde48mbPIN4mMR0hnaU6kYf2Rfw2bwuUmrg4z
 FMMEaCiW0pNk5I7/Iyw4eyO0R+TJHPXBrjMOwWB6MiumQVZa8lu143PCP
 yEX+639+DWlvUdB9UksDq94DLp2mGD3YRekOza1jk2rLwx+flWb7N0QRJ M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QRNQ54Z/WDflkmhtlh0cQ5oCv0/rybnATTDaESuXIwMqCNWsm9ycpqX49YhsofDHO1wxKM++5R
 hhuErKfogIzEq8eT24EqSG+JAApEf1B8QqXO6qe0DCqgmCbhqzgUJ7CjxgzVLp9O1daXqk+Lj8
 RFw1tYMiUNvAjlcVIIuaY+V0onm+tAKyRnqiMfgf7MIPxMGovjJiDgOKgJ7ApeqKx1o5lmeO4l
 vDJJyiJjCThNLlu24j2amQR/mgcoBKCSUuIgE9jy4l85BoOVPo1Y8TFwWwm1ywcZvjWqWETSp0
 uhc=
X-SBRS: 2.7
X-MesageID: 16320225
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16320225"
Subject: Re: [PATCH] x86/IST: Fix comment about stack layout
To: Wei Liu <wl@xen.org>
References: <20200427131702.13991-1-andrew.cooper3@citrix.com>
 <20200427131955.tqcnjdppinr4oopk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4e71ae01-6310-b292-dab0-1941c0bca6d9@citrix.com>
Date: Mon, 27 Apr 2020 15:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427131955.tqcnjdppinr4oopk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/04/2020 14:19, Wei Liu wrote:
> On Mon, Apr 27, 2020 at 02:17:02PM +0100, Andrew Cooper wrote:
>> This was an oversight in c/s 5d37af364dc "x86/traps: Use an Interrupt Stack
>> Table for #DB" which introduced the #DB IST to begin with.
>>
>> Reported-by: Jan Beulich <JBeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/include/asm-x86/current.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
>> index 0b47485337..39c2c6cbf8 100644
>> --- a/xen/include/asm-x86/current.h
>> +++ b/xen/include/asm-x86/current.h
>> @@ -18,7 +18,7 @@
>>   * 6 - Primary stack
>>   * 5 - Optionally not present (MEMORY_GUARD)
>>   * 4 - Unused; optionally not present (MEMORY_GUARD)
>> - * 3 - Unused; optionally not present (MEMORY_GUARD)
>> + * 3 -  DB IST stack
> There seems to be an extraneous space before "DB".

Yes.  The alternative would be for misaligned tabulation with the lower
"IST stack".

~Andrew

>
> Wei.
>
>>   * 2 - MCE IST stack
>>   * 1 - NMI IST stack
>>   * 0 - Double Fault IST stack
>> -- 
>> 2.11.0
>>


