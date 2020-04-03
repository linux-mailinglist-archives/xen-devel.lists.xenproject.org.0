Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7AD19DA17
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:29:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOGQ-0002ou-8T; Fri, 03 Apr 2020 15:29:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKOGP-0002om-BB
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:29:45 +0000
X-Inumbo-ID: f134342a-75bf-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f134342a-75bf-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 15:29:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8308ABEF;
 Fri,  3 Apr 2020 15:29:42 +0000 (UTC)
Subject: Re: [PATCH 3/5] tools/misc: add xen-ctx to present domain context
To: paul@xen.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-4-paul@xen.org>
 <b94676ab-371b-bb69-0d07-dd38fe22ceba@suse.com>
 <001e01d609cb$64913fa0$2db3bee0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f04d7e53-b1d9-a304-a7ac-64238836eca5@suse.com>
Date: Fri, 3 Apr 2020 17:29:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001e01d609cb$64913fa0$2db3bee0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 17:20, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 30 March 2020 11:54
>> To: Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH 3/5] tools/misc: add xen-ctx to present domain context
>>
>> On 27.03.2020 19:50, Paul Durrant wrote:
>>> This tools is analogous to 'xen-hvmctx' which presents HVM context.
>>> Subsequent patches will add 'dump' functions when new records are
>>> introduced.
>>>
>>> Signed-off-by: Paul Durrant <paul@xen.org>
>>> ---
>>> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
>>> Cc: Wei Liu <wl@xen.org>
>>> ---
>>>  .gitignore           |   1 +
>>>  tools/misc/Makefile  |   4 ++
>>>  tools/misc/xen-ctx.c | 144 +++++++++++++++++++++++++++++++++++++++++++
>>
>> Is xen-ctx a good choice of a name, considering we already have not
>> only xen-hvmctx, but also xenctx? If the new functionality isn't a
>> good fit for either, perhaps its name would better reflect its
>> connection to save/restore records? xen-sr-dump looks pretty clumsy
>> to me, but still seems better than a name easily mixed up with
>> others.
> 
> How about xen-domctx?

Hmm, maybe. Seeing this is about PV pieces, xen-pvctx might also be
an option.

Jan

