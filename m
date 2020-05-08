Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6F1CA62B
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:36:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWyUR-0007Yt-RM; Fri, 08 May 2020 08:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWyUQ-0007Yo-Eb
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:36:14 +0000
X-Inumbo-ID: f8f3694e-9106-11ea-9fcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8f3694e-9106-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 08:36:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 339E1AAC7;
 Fri,  8 May 2020 08:36:14 +0000 (UTC)
Subject: Re: Xen Coding style
To: Julien Grall <jgrall@amazon.com>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
Date: Fri, 8 May 2020 10:36:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 16:43, Julien Grall wrote:
> This was originally discussed during the last community call.
> 
> A major part of the comments during review is related to coding style issues. This can lead to frustration from the contributor as the current CODING_STYLE is quite light and the choice often down to a matter of taste from the maintainers.
> 
> In the past, Lars tried to address the problem by introducing a coding style checker (see [1] and [2]). However, the work came to stop because we couldn't agree on what is Xen coding style.
> 
> I would like to suggest a different approach. Rather than trying to agree on all the rules one by one, I propose to have a vote on different coding styles and pick the preferred one.
> 
> The list of coding styles would come from the community. It could be coding styles already used in the open source community or new coding styles (for instance a contributor could write down his/her understanding of Xen Coding Style).
> 
> Are the committers happy with this appraoch?

I'm not, sorry, and I'm pretty sure I indicated so before. For one I
don't think picking an arbitrary other style than what we currently use
is going to be helpful: It'll be a significant amount of code churn all
over the code base. Instead I think the basic current principle should
remain: Imported files, if not heavily changed, are permitted to retain
their original style, while "our" files get written in "our" style.
(Recording which one's which is still tbd.)

I don't think though this necessarily implies "to agree on all the rules
one by one" - we could also settle on there explicitly being freedom
beyond what's spelled out explicitly. I'd not be happy with this, as it
would lead to a lot of inconsistencies over time, but it's still an
option. Obviously there's the wide range of middle ground to agree on
some more rules to become written down (I did propose a few over time,
without - iirc - getting helpful, if any, feedback), while leaving the
rest up to the author.

The main thing we need to settle on imo is whether unwritten rules
count. Me being picky isn't because of me liking to be, but because of
me thinking that a consistent code base is quite helpful. If consensus
is that consistency is not a goal, I'll accept this (with some
grumbling).

Jan

