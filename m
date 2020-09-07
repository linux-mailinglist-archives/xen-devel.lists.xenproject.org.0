Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6325F3E3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBTu-0001Qp-KZ; Mon, 07 Sep 2020 07:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBTt-0001Qk-TS
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:22:25 +0000
X-Inumbo-ID: 1e2ef1c7-a7ef-4ae3-b774-9b3cd445ab28
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e2ef1c7-a7ef-4ae3-b774-9b3cd445ab28;
 Mon, 07 Sep 2020 07:22:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47C51AF7F;
 Mon,  7 Sep 2020 07:22:25 +0000 (UTC)
Subject: Re: [PATCH v3 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-2-roger.pau@citrix.com>
 <MWHPR11MB16457A9096E266A249386A4A8C280@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccf00f3e-9901-1ae6-5ea2-18fb22a01e80@suse.com>
Date: Mon, 7 Sep 2020 09:22:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16457A9096E266A249386A4A8C280@MWHPR11MB1645.namprd11.prod.outlook.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 05:25, Tian, Kevin wrote:
>> From: Roger Pau Monne <roger.pau@citrix.com>
>> Sent: Tuesday, September 1, 2020 6:55 PM
>>
>> Such handling consist in checking that no bits have been changed from
>> the read value, if that's the case silently drop the write, otherwise
>> inject a fault.
>>
>> At least Windows guests will expect to write to the MISC_ENABLE MSR
>> with the same value that's been read from it.
> 
> for better readability could you also add this line to the code comment
> below?
> 
> with that:
> 
> 	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

I'll fold this in while committing.

Jan

