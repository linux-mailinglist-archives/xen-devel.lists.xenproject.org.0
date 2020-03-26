Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56499194252
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:05:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHU22-0004z6-NQ; Thu, 26 Mar 2020 15:02:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHU20-0004z1-Oz
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:02:52 +0000
X-Inumbo-ID: dd2f0e62-6f72-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd2f0e62-6f72-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 15:02:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03188ACF0;
 Thu, 26 Mar 2020 15:02:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-7-andrew.cooper3@citrix.com>
 <d6c9685b-e3a1-2837-3123-8fded5418856@suse.com>
 <00cf5ab3-6ea4-5b89-73cd-ca51fe355737@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcbc2655-51e7-9f4d-53ee-47f927673175@suse.com>
Date: Thu, 26 Mar 2020 16:02:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <00cf5ab3-6ea4-5b89-73cd-ca51fe355737@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 6/7] x86/ucode/intel: Clean up
 microcode_sanity_check()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 15:41, Andrew Cooper wrote:
> On 25/03/2020 14:07, Jan Beulich wrote:
>>> Introduce a check missing from the old code, that total_size is a multiple of
>>> 1024 bytes,
>> Where is this documented? The rather brief section in SDM vol 3 doesn't
>> mention anything like this.
> 
> It is in the middle of the final paragraph of 9.11.1 Microcode Update,
> immediately preceding Table 9-7
> 
> "The total size field of the microcode update header specifies the
> encrypted data size plus the header size; its value must be in multiples
> of 1024 bytes (1 KBytes)."

Oh, I had looked at 8.8.5 Microcode Update Resources instead,
being surprised it was much less information than I recalled
was available.

Jan

