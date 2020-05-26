Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EF1E1CEF
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 10:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdUd7-0004Ez-Fz; Tue, 26 May 2020 08:08:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdUd5-0004Er-RK
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:08:07 +0000
X-Inumbo-ID: 07bfc196-9f28-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07bfc196-9f28-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 08:08:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D888ACAD;
 Tue, 26 May 2020 08:08:07 +0000 (UTC)
Subject: Re: [PATCH v10 00/12] Add hypervisor sysfs-like support
To: paul@xen.org
References: <20200519072106.26894-1-jgross@suse.com>
 <24935c43-2f2d-83cf-9039-ec0f97498103@suse.com>
 <305d829f-24a9-1a6d-2131-fed92c22c305@suse.com>
 <000f01d62db4$57181e90$05485bb0$@xen.org>
 <fc55f4dc-c802-2153-cd6a-736a29e8a396@suse.com>
 <003f01d63333$aa399f20$feacdd60$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88154236-0e64-55a5-7531-eeb6029a188e@suse.com>
Date: Tue, 26 May 2020 10:08:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <003f01d63333$aa399f20$feacdd60$@xen.org>
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
Cc: =?UTF-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>,
 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.05.2020 10:00, Paul Durrant wrote:
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 25 May 2020 08:02
>>
>> On 19.05.20 10:06, Paul Durrant wrote:
>>> Looking at patch #4, I'm not confident that the XSM parts are complete (e.g. does xen.if need
>> updating?). Also I'd put the new access vector in xen2, since that's where set_parameter currently is
>> (and will be removed from in a later patch), but the xen class does appear to have space so that's
>> really just my taste.
>>
>> I don't think xen.if needs updating, as it contains only macros for
>> groups of operations.
>>
> 
> Ok.
> 
>> As the new hypercall isn't only replacing set_parameter, but has much
>> wider semantics, I don't think it should go to xen2. There will be
>> probably more interfaces being replaced and/or added after all.
>>
> 
> If you're happy with it then, in the absence of a response from Daniel,
> then I think patch #4 can go in. Patch #10 and #11 have acks now, so it
> looks like the series is good to go.
I've pinged Daniel privately, and hence would like to give him a day or
two more to respond at least there. If I don't hear back, I'll put the
series in before the end of the week.

Jan

