Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28923F01B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 17:41:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k44Tz-0005f4-Sk; Fri, 07 Aug 2020 15:40:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k44Ty-0005ez-UI
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 15:40:34 +0000
X-Inumbo-ID: a565c9e8-62f3-44a5-a1b6-75eececcfc29
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a565c9e8-62f3-44a5-a1b6-75eececcfc29;
 Fri, 07 Aug 2020 15:40:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F9C5ADE0;
 Fri,  7 Aug 2020 15:40:51 +0000 (UTC)
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
 <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
 <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
 <9a3cd872-bc6c-3113-fdf9-2f80ad8fabce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <039916f1-c9f2-710f-8f46-3ff9d91a9109@suse.com>
Date: Fri, 7 Aug 2020 17:40:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9a3cd872-bc6c-3113-fdf9-2f80ad8fabce@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 17:12, Andrew Cooper wrote:
> On 07/08/2020 11:56, Jan Beulich wrote:
>> On 06.08.2020 18:16, Andrew Cooper wrote:
>>> On 06/08/2020 10:05, Jan Beulich wrote:
>>> Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
>>> properly in Kconfig, and gathering all the objects normally, rather than
>>> bodging all of common/efi/ through arch/efi/ ?
>> _If_ we settle on Kconfig to be allowed to check compiler (and linker)
>> features, then yes. This continues to be a pending topic though, so
>> the switch can't be made like this at this point in time. (It could be
>> made a Kconfig item now - which, when enabled, implies the assertion
>> that a capable tool chain is in use.)
> 
> I am still of the opinion that nothing needs discussing, but you are
> obviously not.
> 
> Please raise this as a topic and lets discuss it, because it has a
> meaningful impacting on a large number of pending series.

Preferably I would have put this on this month's community meeting
agenda, but I'll be ooo next week, so that's not going to help, I'm
afraid. I guess I should put it up in email form when I'm back,
albeit I wasn't thinking it should need to be me to start the
discussion. Instead my view was that such a discussion should (have
been, now after-the-fact) be started by whoever wants to introduce
a new feature. You did say this was discussed in Chicago, but while
I'm pretty sure I was in all relevant sessions, I don't think this
can have been mentioned more than just in passing.

Jan

