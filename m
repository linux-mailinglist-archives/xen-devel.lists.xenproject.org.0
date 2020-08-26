Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65049252931
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 10:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqmV-0005mZ-Cy; Wed, 26 Aug 2020 08:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7zTW=CE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAqmT-0005mU-H5
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 08:27:41 +0000
X-Inumbo-ID: 00300f24-5dbb-4dc6-88a5-363641648b7e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00300f24-5dbb-4dc6-88a5-363641648b7e;
 Wed, 26 Aug 2020 08:27:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FB35AD29;
 Wed, 26 Aug 2020 08:28:11 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Simon Leiner <simon@leiner.me>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
 <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
 <00bdd0ee-8f18-4580-01c7-01c95f3a6184@suse.com>
 <d5db3e9a-2d5e-ef20-2516-c014d25e9e1c@leiner.me>
 <bf17ac65-6182-d426-a6d6-7dac0f286dc7@suse.com>
 <e0117840-7d09-db4d-9e14-215e39ada866@leiner.me>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4a86bc25-e6b0-0a6d-b5ee-fcdac49415d1@suse.com>
Date: Wed, 26 Aug 2020 10:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e0117840-7d09-db4d-9e14-215e39ada866@leiner.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 26.08.20 10:14, Simon Leiner wrote:
> On 26.08.20 09:59, Jürgen Groß wrote:
>> This seems to be an Arm specific function.
> 
> Is that a problem? The caller site is also ARM specific.

The caller site is ARM specific, but __is_lm_address() is defined for
arm64 only.

> 
>> virt_addr_valid() seems to be a good fit.
> 
> If you prefer that anyway, I will change it and resubmit that part of
> the patch.

No need for resend, I can fix that when committing.


Juergen

