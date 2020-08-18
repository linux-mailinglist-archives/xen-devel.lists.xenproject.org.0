Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC62480F0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xLn-0003rv-HJ; Tue, 18 Aug 2020 08:52:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7xLm-0003rk-Ao
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:52:10 +0000
X-Inumbo-ID: 4d68904d-5f83-466c-ad04-17ef900b0efe
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d68904d-5f83-466c-ad04-17ef900b0efe;
 Tue, 18 Aug 2020 08:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 837CFABF4;
 Tue, 18 Aug 2020 08:52:34 +0000 (UTC)
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
 <3bafb97f-45a3-7203-3e73-37e73c453de6@suse.com>
 <28c7d999-52da-cc96-533b-264c749c7f88@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d63c930-24f4-da8d-cbae-1a88c90bad99@suse.com>
Date: Tue, 18 Aug 2020 10:52:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <28c7d999-52da-cc96-533b-264c749c7f88@xen.org>
Content-Type: text/plain; charset=utf-8
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

On 14.08.2020 21:18, Julien Grall wrote:
> On 31/07/2020 12:41, Jan Beulich wrote:
>> On 30.07.2020 20:18, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>>      * Add space before and after operator
>>>      * Align \
>>>      * Format comments
>>
>> How about also
>>
>>      * remove/replace leading underscores
>>
>> ?
> 
> I don't have any plan for this. You are welcome to send a patch for this.

In which case may I ask that you replace "Fix" by "Improve" or some
such in the title?

Jan

