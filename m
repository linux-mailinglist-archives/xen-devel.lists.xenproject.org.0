Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1567243C4A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 17:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Ev4-00028j-Li; Thu, 13 Aug 2020 15:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEtF=BX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6Ev3-00028e-LR
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 15:13:29 +0000
X-Inumbo-ID: e183178e-cb02-43ea-aab4-1fbbaeee7ac2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e183178e-cb02-43ea-aab4-1fbbaeee7ac2;
 Thu, 13 Aug 2020 15:13:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BA67ACF9;
 Thu, 13 Aug 2020 15:13:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <366f5998-4346-6140-b133-23c9abef6589@suse.com>
 <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2b7568cd-a3e6-a672-e9c4-3e58eecde43b@suse.com>
Date: Thu, 13 Aug 2020 17:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
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

On 13.08.20 17:10, Oleksandr Andrushchenko wrote:
> 
> On 8/13/20 6:02 PM, Jürgen Groß wrote:
>> On 13.08.20 08:21, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Series pushed to:
>>
>> xen/tip.git for-linus-5.9
>>
> The top patch has strange title though:
> 
> "Subject: [PATCH v2 5/5] drm/xen-front: Pass dumb buffer data offset to the backend"

Oh, indeed. I had to repair it manually as it seems some mail system
(probably on my end) mangled it a little bit.

Will repair it.


Juergen

