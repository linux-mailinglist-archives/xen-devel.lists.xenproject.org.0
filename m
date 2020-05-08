Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B71CA5EE
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWyEY-0005rF-5U; Fri, 08 May 2020 08:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWyEW-0005r9-P0
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:19:48 +0000
X-Inumbo-ID: ae3a16ac-9104-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae3a16ac-9104-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 08:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCFD2B004;
 Fri,  8 May 2020 08:19:49 +0000 (UTC)
Subject: Re: [PATCH 3/3] xen/cpupool: fix removing cpu from a cpupool
To: Juergen Gross <jgross@suse.com>
References: <20200430151559.1464-1-jgross@suse.com>
 <20200430151559.1464-4-jgross@suse.com>
 <e02432bf8ea8ca85a31176de1a1f9e429c84b243.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c0c5c02-7bf8-8aa1-4c5d-586d18290d2f@suse.com>
Date: Fri, 8 May 2020 10:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e02432bf8ea8ca85a31176de1a1f9e429c84b243.camel@suse.com>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 20:36, Dario Faggioli wrote:
> On Thu, 2020-04-30 at 17:15 +0200, Juergen Gross wrote:
>> Commit cb563d7665f2 ("xen/sched: support core scheduling for moving
>> cpus to/from cpupools") introduced a regression when trying to remove
>> an offline cpu from a cpupool, as the system would crash in this
>> situation.
>>
>> Fix that by testing the cpu to be online.
>>
>> Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving
>> cpus to/from cpupools")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> Acked-by: Dario Faggioli <dfaggioli@suse.com>

Jürgen,

it looks like this is independent of the earlier two patches
and hence could go in, while I understand there'll be v2 for
the earlier ones. Please confirm.

Jan

