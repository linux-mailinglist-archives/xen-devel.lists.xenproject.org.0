Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB7807713
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 18:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649382.1013849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAw7V-0003f5-5M; Wed, 06 Dec 2023 17:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649382.1013849; Wed, 06 Dec 2023 17:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAw7V-0003cp-2k; Wed, 06 Dec 2023 17:55:37 +0000
Received: by outflank-mailman (input) for mailman id 649382;
 Wed, 06 Dec 2023 17:55:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAw7T-0003ch-8S
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 17:55:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAw7O-0006g3-U6; Wed, 06 Dec 2023 17:55:30 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.253]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAw7O-00028Q-MP; Wed, 06 Dec 2023 17:55:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=JsdaJlZ7Uf11pmwTN+rVl61uYTcgvMqDW15hG7J4ZEg=; b=GhZxTWeKDQU8NqXx7Ukds5+ou7
	dfSRBpvqbkAWcyPVc2q17PrCqafPQ5n0V1/CWskGkxxMXSNTPZ85sRlGC81B0NCzNq+7Yd5jWCi7X
	03MMnt3quvXnVIFjLk45muOdbcJCONTjc57SLPVY2UuNQ9sYbjx9AFYrMPHby7rUtjqA=;
Message-ID: <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
Date: Wed, 6 Dec 2023 17:55:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
 <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/12/2023 02:32, George Dunlap wrote:
> On Tue, Dec 5, 2023 at 2:07 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.12.2023 14:46, Luca Fancellu wrote:
>>> In my opinion, I don’t know of any tool that can address all the flexibility the Xen codestyle allows, yet the use of automatic
>>> checkers would improve the review time, allow more new contributors to approach the community without being put down by
>>> the amount of code-style comments,
>>
>> Since this argument is being repeated: I find it odd. No-one needs to even
>> fear any amount of style comments if they simply follow the written down
>> policy plus a tiny bit of common sense. According to my observation, (some)
>> newcomers don't even care to look at what is being said about our style.
>> It's not like you and I haven't been through this. When I started working
>> with GNU toolchain, I had to adopt to their style. When I later started to
>> work with Linux, I had to also adopt there. And then for Xen. And all of
>> that already past closed source projects I had been working on before.

I am not sure I get the point. With this argument, we are not only 
putting load on the contributors but also on the reviewers because we 
have to check the style manually while reviewing the code.

Do you really think this is a good use of our time? Personally I don't 
think so and definitely there are more unwritten rule than you let 
transpire above.

A good example is the "_" vs "-". If even a maintainer can't guess it, 
then how can a contributor know it?

> 
> Most modern languages, including golang (and I think rust) have
> built-in style correctors (`go fmt` is go's official one).  If you
> haven't worked with an automatic style checker / fixer, you don't know
> how much time, hassle, and emotional energy you're saving.  I don't
> think I know anyone who, after using one, wants to go back to not
> using one any more.
> 
> In general, I'm in favor of making changes to our style such that we
> can make clang's style checker official.  The only reason I would vote
> against it is if one of the style requirements was really intolerable;
> but I find that pretty unlikely.

+1

> 
> And as I've said before, the main reservation I have going forward
> with this discussion is that I can't see clearly what it is that I'm
> agreeing to.

+1

I found the way we dealt with MISRA rules quite helpful. We had a weekly 
meeting to discuss some of the rules and then the outcome was posted on 
the ML. Maybe we should do the same here? Any other suggestion how to move?

Cheers,

-- 
Julien Grall

