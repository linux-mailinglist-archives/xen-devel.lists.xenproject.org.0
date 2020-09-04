Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6425D8CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 14:42:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEB2r-0007hJ-B2; Fri, 04 Sep 2020 12:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kEB2q-0007hC-8r
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 12:42:20 +0000
X-Inumbo-ID: fcf437cd-e3d7-445b-9802-98501f46ace3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf437cd-e3d7-445b-9802-98501f46ace3;
 Fri, 04 Sep 2020 12:42:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A3ECB58D;
 Fri,  4 Sep 2020 12:42:19 +0000 (UTC)
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1e46c3f-503f-b00a-b789-28c1f9c61640@suse.com>
Date: Fri, 4 Sep 2020 14:42:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
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

On 04.09.2020 12:43, Bertrand Marquis wrote:
>> On 4 Sep 2020, at 11:20, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.09.2020 11:54, George Dunlap wrote:
>>> At the community call last month as well as this, we discussed whether to continue the “Gitlab experiment”.  It was generally agreed that reviewing Juergen’s long series was fairly sub-optimal, and that email was more suited to that sort of series.
>>>
>>> That said, there was general agreement that requiring all patches to go through email was going to limit contribution, particularly of one-off “drive-by” contributions.  As such, it was proposed that we consider allowing both Gitlab PRs, and email: that for one-off or short series, Gitlab PRs would be accepted, but that for longer series and/or longer term contributors, we would encourage people to switch to patchbombing the mailing list.
>>>
>>> We decided to continue the “Gitlab Experiment”, but with short PRs.  As such, Andy Cooper has posted two PRs:
>>>
>>> https://gitlab.com/xen-project/xen/-/merge_requests/2
>>
>> This looks to be confusing, to me at least. Following this link I
>> can't see the actual change directly. Following either of the links
>> after "Request to merge" gives a 404 error (after gitlab not being
>> able to sign me in via Google, but then being able to sign me in
>> via github) on both
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/tree/xen-pv-segbase
> 
> I think you missed on top the “Commits” and “Changes"

I did indeed. Nevertheless I think the other links ought to be
working, as they're (I assume) going to give me a view of the
tree as a whole with the patch/series applied.

That said, from an engineer's point of view I think the main
thing of interest should be shown in the "primary" view, and
that's (imo) clearly the entire patch.

Jan

