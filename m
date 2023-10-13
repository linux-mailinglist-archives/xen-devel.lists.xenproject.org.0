Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49387C8A24
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 18:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616753.958985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKkk-00050s-Ru; Fri, 13 Oct 2023 16:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616753.958985; Fri, 13 Oct 2023 16:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKkk-0004xW-PD; Fri, 13 Oct 2023 16:11:06 +0000
Received: by outflank-mailman (input) for mailman id 616753;
 Fri, 13 Oct 2023 16:11:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrKki-0004xQ-Ig
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 16:11:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrKkf-0005wm-5P; Fri, 13 Oct 2023 16:11:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrKke-0006tO-UY; Fri, 13 Oct 2023 16:11:01 +0000
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
	bh=dY5DhvVRevZpzmkzwrTSwO4AuDAe+Lb7jqCzTdnqOk0=; b=UzRVtH31wQvz3L8PQW9B/EteIb
	gBjDgR3T9qQEPq3kjt/rqMaxoRESVmPU8CZM7+4FRICTKxoDW1PiZF5BCPgy79wF2IaUUhIEAVJib
	v+MVcmCrDpRHYfO74S1TEM3cbDKGxZylSDLl+6YEq/siaaDcavjSWY7cf+dQgEyspmWY=;
Message-ID: <5af543d2-b18b-46c0-87ef-8af99dec81b3@xen.org>
Date: Fri, 13 Oct 2023 17:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com>
 <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org>
 <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com>
 <a1c3de32-7fcb-4c3d-a95b-7aa58c493f52@xen.org>
 <CA+zSX=ad_g5CWkFjs0Cu1=HaTYTLmRpUE8gFVZ+4AJ3meG-0Yw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=ad_g5CWkFjs0Cu1=HaTYTLmRpUE8gFVZ+4AJ3meG-0Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

On 13/10/2023 17:06, George Dunlap wrote:
> On Fri, Oct 13, 2023 at 4:56 PM Julien Grall <julien@xen.org> wrote:
>>> The initial patch that
>>> introduced it didn't mention wanting to include dom0 specifically; on
>>> the contrary it said:
>>>
>>> "The extra notification is harmless for domains that don't require it."
>>
>> ... even if this is what the commit message says, we can't tell whether
>> someone would start to rely on it. I definitely see use-cases for it.
>>
>> But I agree that the chance they are actualy used is slim as we didn't
>> document it.
> 
> If a dom0 kernel started relying on the behavior, it would be a bug,
> since it would be incompatible with releases before 4.16.  So I think
> the only risk here would be if some bit of a system's userspace
> tooling relied on it; but I can't really see how that would come to
> be.
> 
> If someone reports a bug, we can always add the reporting back, when
> we're not under time pressure.
> 
>> Your reasoning makes sense. I don't fully agree with it, but at the end
>> of the day we need to have a solution for dom0less guests... So if the
>> others agree with you, then I will disagree and commit.
>>
>> That said, I think the commit message should explain why removing dom0
>> notification is ok.
> 
> Yes, absolutely.
> 
> Do you or Stefano want to pick it up?  I think you'd be able to test
> it more thoroughly.  I can build-test it and send it to gitlab-CI, but
> anything more will take a lot more setup.

I just asked you a similar question on Matrix. :) Stefano was able to 
reproduce the issue. So it would probably be best for him to pick up at 
least the testing part.

Stefano, do you have some cycle to send the patch as well? If not, I can 
do it.

Cheers,

-- 
Julien Grall

