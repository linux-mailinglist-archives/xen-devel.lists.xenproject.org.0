Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AA1DB8C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 17:56:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbR4l-0008Ds-0M; Wed, 20 May 2020 15:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbR4j-0008Dn-1z
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 15:56:09 +0000
X-Inumbo-ID: 6ac35e30-9ab2-11ea-aa45-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ac35e30-9ab2-11ea-aa45-12813bfff9fa;
 Wed, 20 May 2020 15:56:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 88B60AA4F;
 Wed, 20 May 2020 15:56:09 +0000 (UTC)
Subject: Re: [PATCH] VT-x: extend LBR Broadwell errata coverage
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
 <e107f97b-4bb7-31ee-20d1-ddf8f7e00c21@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c193aaec-cebc-ca0b-88f9-aabfca6b988a@suse.com>
Date: Wed, 20 May 2020 17:56:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e107f97b-4bb7-31ee-20d1-ddf8f7e00c21@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.05.2020 16:07, Andrew Cooper wrote:
> On 20/05/2020 13:52, Jan Beulich wrote:
>> @@ -2895,15 +2897,26 @@ static void __init lbr_tsx_fixup_check(v
>>  static void __init bdf93_fixup_check(void)
> 
> Seeing as this is no longer just BDF93, how about ler_tsx_fixup_check() ?

I did consider renaming, and didn't do so just because this would
grow the patch size quite a bit. I'm fine doing so, but with the
name you suggest, is this one really as directly TSX related as the
other one? I had thought of something like lbr_bdw_fixup_check().

Jan

