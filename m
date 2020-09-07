Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A847225F283
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 06:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kF8kn-0001e1-PJ; Mon, 07 Sep 2020 04:27:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kF8km-0001dI-MS
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 04:27:40 +0000
X-Inumbo-ID: a7c81630-6a33-4b9b-918a-50cb04d569f1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7c81630-6a33-4b9b-918a-50cb04d569f1;
 Mon, 07 Sep 2020 04:27:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DB4BAC6E;
 Mon,  7 Sep 2020 04:27:36 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20200906044433.24820-1-jgross@suse.com>
 <CAHk-=wiTZ3V-Jn5xmHTKafZ-vRw-E0n8EMz+PyHKz4CMRwmYxw@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <65f878b3-2a46-4781-29b8-9472da500bb2@suse.com>
Date: Mon, 7 Sep 2020 06:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiTZ3V-Jn5xmHTKafZ-vRw-E0n8EMz+PyHKz4CMRwmYxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 06.09.20 19:01, Linus Torvalds wrote:
> On Sat, Sep 5, 2020 at 9:44 PM Juergen Gross <jgross@suse.com> wrote:
>>
>> It contains a small series for fixing a problem with Xen PVH guests
>> when running as backends (e.g. as dom0). Mapping other guests' memory
>> now is working via ZONE_DEVICE, thus not requiring to abuse the memory
>> hotplug functionality for that purpose.
> 
> Tssk. This really isn't a bug-fix, it's clearly new development.
> 
> I'm going to let it slide since it seems so contained, but don't do this.

Thanks for taking it.

I agree I should have spelled out the nature of the patch more clearly
and add more reasoning why you might consider taking it.


Juergen

