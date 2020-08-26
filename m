Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193D252938
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 10:30:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqpS-0006YJ-Rx; Wed, 26 Aug 2020 08:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TrzI=CE=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1kAqpR-0006YD-7Q
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 08:30:45 +0000
X-Inumbo-ID: 4c1b7df4-941b-47d0-809f-f3e6d791c861
Received: from mx2.mailbox.org (unknown [80.241.60.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c1b7df4-941b-47d0-809f-f3e6d791c861;
 Wed, 26 Aug 2020 08:30:43 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id E555CA169E;
 Wed, 26 Aug 2020 10:30:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id NgXV5WX8KLRx; Wed, 26 Aug 2020 10:30:38 +0200 (CEST)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
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
 <4a86bc25-e6b0-0a6d-b5ee-fcdac49415d1@suse.com>
From: Simon Leiner <simon@leiner.me>
Message-ID: <6627778f-47e8-2650-544d-b1305c30bdf6@leiner.me>
Date: Wed, 26 Aug 2020 10:30:37 +0200
MIME-Version: 1.0
In-Reply-To: <4a86bc25-e6b0-0a6d-b5ee-fcdac49415d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.11 / 15.00 / 15.00
X-Rspamd-Queue-Id: B9F711354
X-Rspamd-UID: bb249a
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

On 26.08.20 10:27, Jürgen Groß wrote:
> On 26.08.20 10:14, Simon Leiner wrote:
>> On 26.08.20 09:59, Jürgen Groß wrote:
>>> This seems to be an Arm specific function.
>>
>> Is that a problem? The caller site is also ARM specific.
> 
> The caller site is ARM specific, but __is_lm_address() is defined for
> arm64 only.

Oh, I did not catch that - you're right, thanks :-)


> No need for resend, I can fix that when committing. 

Thanks!

Simon

