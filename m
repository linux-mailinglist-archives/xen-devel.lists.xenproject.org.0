Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7326303E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 17:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG1li-0007AK-6Y; Wed, 09 Sep 2020 15:12:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c0kD=CS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kG1lg-00079o-SI
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 15:12:16 +0000
X-Inumbo-ID: 90258e1e-4ed0-4035-a4eb-d748d7bcd4cc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90258e1e-4ed0-4035-a4eb-d748d7bcd4cc;
 Wed, 09 Sep 2020 15:12:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDCC5AC65;
 Wed,  9 Sep 2020 15:12:30 +0000 (UTC)
Subject: Re: [PATCH] tools/libs: merge xenctrl_dom.h into xenguest.h
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200909141837.8293-1-jgross@suse.com>
 <20200909145541.GA9907@aepfle.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <edd08a89-12a6-1827-3b43-1e3fe81f8e81@suse.com>
Date: Wed, 9 Sep 2020 17:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909145541.GA9907@aepfle.de>
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

On 09.09.20 16:55, Olaf Hering wrote:
> On Wed, Sep 09, Juergen Gross wrote:
> 
>> +++ b/tools/libs/guest/include/xenguest.h
> 
>> +#include <xen/libelf/libelf.h>
> 
> In case this file will be installed via make install:
> 
> Does any of the pending patches create that file?

No. This include was in xenctrl_dom.h previously and has just been
moved to xenguest.h.


Juergen

