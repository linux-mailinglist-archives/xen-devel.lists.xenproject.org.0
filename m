Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A684A25FE6B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 18:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFJnL-0002s9-DJ; Mon, 07 Sep 2020 16:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFJnK-0002s4-Ox
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 16:15:02 +0000
X-Inumbo-ID: e4f5292b-4202-4af1-af5a-e669ee55c859
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4f5292b-4202-4af1-af5a-e669ee55c859;
 Mon, 07 Sep 2020 16:15:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4A6CAC3C;
 Mon,  7 Sep 2020 16:15:01 +0000 (UTC)
Subject: Re: [PATCH v4 28/31] tools/libxl: move libxenlight to tools/libs/light
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>, Yang Hongyang
 <imhy.yang@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-29-jgross@suse.com>
 <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
 <5d65901d-5729-fe17-3fb2-2a41867d726b@suse.com>
 <20200907155257.jztw3kv2h3kmjcqa@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4a6b6986-30d9-1da9-e861-7772a8d160c4@suse.com>
Date: Mon, 7 Sep 2020 18:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907155257.jztw3kv2h3kmjcqa@liuwe-devbox-debian-v2>
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

On 07.09.20 17:52, Wei Liu wrote:
> On Mon, Aug 31, 2020 at 07:50:42AM +0200, Jürgen Groß wrote:
>> On 28.08.20 18:05, Wei Liu wrote:
>>> On Fri, Aug 28, 2020 at 05:07:44PM +0200, Juergen Gross wrote:
>>>> Carve out all libxenlight related sources and move them to
>>>> tools/libs/light in order to use the generic library build environment.
>>>>
>>>> The closely related sources for libxl-save-helper and the libxl test
>>>> environment are being moved, too.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> Acked-by: Wei Liu <wl@xen.org>
>>>
>>> It occurs to me you may need to modify golang/xenlight/Makefile.
>>>
>>> There is
>>>
>>>       LIBXL_SRC_DIR = ../../libxl
>>>
>>> in it.
>>>
>>> I didn't hit any error perhaps due to I didn't have golang installed.
>>
>> Me neither.
>>
>> Thanks for noticing that.
> 
> No need to resend just for this. I can fix it up for you.

Sure? Did you consider ac7a21cf5c125810? I had to rebase in order
to have a successful build.


Juergen

