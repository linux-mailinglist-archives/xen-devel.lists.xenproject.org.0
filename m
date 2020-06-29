Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7220CE28
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 13:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jprrQ-00047B-9n; Mon, 29 Jun 2020 11:22:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jprrO-000474-Uy
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 11:22:02 +0000
X-Inumbo-ID: c0f657be-b9fa-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0f657be-b9fa-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 11:22:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C4CAAD5D;
 Mon, 29 Jun 2020 11:22:01 +0000 (UTC)
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
 <9fc81bbe-6c30-e848-ceae-1356ec30a8f8@suse.com>
 <11dad2fc-b1ec-3279-1a99-920a5f67456a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37362d94-053d-5eb9-d2fa-9d30690313f0@suse.com>
Date: Mon, 29 Jun 2020 13:22:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <11dad2fc-b1ec-3279-1a99-920a5f67456a@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.06.2020 12:03, Julien Grall wrote:
> On 29/06/2020 09:28, Jan Beulich wrote:
>> On 27.06.2020 11:55, Julien Grall wrote:
>>> As an aside, the padding sadly cannot be mandated to be 0 as they are
>>> already present. So it is not going to be possible to use the padding
>>> for extending a command in the future.
>>
>> Why is the other adjustment fine to make due to still being tech
>> preview, but this one wouldn't be for the same reason?
> 
> This is mostly a left-over of the previous message. Although, I am not 
> really inclined to address this myself any time soon.

Sure, I didn't mean to indicate I might expect you to. But perhaps
here the wording could be slightly changed as well?

Jan

