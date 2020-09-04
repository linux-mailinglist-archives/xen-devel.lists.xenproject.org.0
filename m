Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909FD25D5E9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:21:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8pY-0001EI-0Q; Fri, 04 Sep 2020 10:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE8pW-0001ED-RU
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:20:26 +0000
X-Inumbo-ID: acf11ee8-a614-42a9-a578-84b297f6ed34
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acf11ee8-a614-42a9-a578-84b297f6ed34;
 Fri, 04 Sep 2020 10:20:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CFB9B810;
 Fri,  4 Sep 2020 10:20:26 +0000 (UTC)
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
To: George Dunlap <George.Dunlap@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
Message-ID: <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
Date: Fri, 4 Sep 2020 12:20:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
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

On 04.09.2020 11:54, George Dunlap wrote:
> At the community call last month as well as this, we discussed whether to continue the “Gitlab experiment”.  It was generally agreed that reviewing Juergen’s long series was fairly sub-optimal, and that email was more suited to that sort of series.
> 
> That said, there was general agreement that requiring all patches to go through email was going to limit contribution, particularly of one-off “drive-by” contributions.  As such, it was proposed that we consider allowing both Gitlab PRs, and email: that for one-off or short series, Gitlab PRs would be accepted, but that for longer series and/or longer term contributors, we would encourage people to switch to patchbombing the mailing list.
> 
> We decided to continue the “Gitlab Experiment”, but with short PRs.  As such, Andy Cooper has posted two PRs:
> 
> https://gitlab.com/xen-project/xen/-/merge_requests/2

This looks to be confusing, to me at least. Following this link I
can't see the actual change directly. Following either of the links
after "Request to merge" gives a 404 error (after gitlab not being
able to sign me in via Google, but then being able to sign me in
via github) on both

https://gitlab.com/xen-project/people/andyhhp/xen
https://gitlab.com/xen-project/people/andyhhp/xen/-/tree/xen-pv-segbase

There's also an endlessly circling kind-of-icon next to "Checking
pipeline status", indicating to me the page tries to load some
information, but can't quite complete doing so.

I also wonder how one is to become aware of pending merge requests.
For the ones here, your mail was the only indication so far that
they existed. I hope the answer to this is not going to be to poll
gitlab.com. I'm sorry if I'm making newbie mistakes or assumptions
here, but as far as gitlab goes I'm afraid I am.

As it stands I'm afraid I'll be able to see what is proposed to be
committed (and afaics also approved already) only when it hits the
staging tree.

Jan

> https://gitlab.com/xen-project/xen/-/merge_requests/3
> 
> And I’d encourage others to try submitting simple one-or-two-patch series as PRs to Gitlab instead, as we continue the experiment.
> 
>  -George
> 


