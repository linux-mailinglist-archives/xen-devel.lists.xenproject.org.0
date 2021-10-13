Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781D42BFC4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208337.364421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madF3-0005mX-RH; Wed, 13 Oct 2021 12:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208337.364421; Wed, 13 Oct 2021 12:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madF3-0005jX-Mh; Wed, 13 Oct 2021 12:20:17 +0000
Received: by outflank-mailman (input) for mailman id 208337;
 Wed, 13 Oct 2021 12:20:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K823=PB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1madF1-0005jR-O9
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:20:15 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f4d307e6-b2bb-408a-ba26-67017d52117f;
 Wed, 13 Oct 2021 12:20:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4AC7D6E;
 Wed, 13 Oct 2021 05:20:13 -0700 (PDT)
Received: from [10.57.25.166] (unknown [10.57.25.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A20263F70D;
 Wed, 13 Oct 2021 05:20:09 -0700 (PDT)
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
X-Inumbo-ID: f4d307e6-b2bb-408a-ba26-67017d52117f
Subject: Re: [PATCH v6] xen: Expose the PMU to the guests
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211013074528.1396-1-michal.orzel@arm.com>
 <75e19429-49d2-c075-acb8-797c01364771@xen.org>
 <a0618ea7-3c66-bfca-20fb-62855c8791e4@arm.com>
 <24934.51672.609742.454355@mariner.uk.xensource.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ebd69458-55e9-5ee5-6f8f-1fbb6ce62175@arm.com>
Date: Wed, 13 Oct 2021 14:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24934.51672.609742.454355@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 13.10.2021 13:58, Ian Jackson wrote:
> Michal Orzel writes ("Re: [PATCH v6] xen: Expose the PMU to the guests"):
>> Ok so it is the matter of adding "HVM" word into status for x86.
>> Is this something that can be done while committing?
> 
> Making changes while committing is risky because they don't get
> properly reviewed.  When I am the committer, I prefer not to do it at
> all.
> 
I fully understand but this is just adding a word "HVM".
It's ok i will push v7
> Also committers are going to be very busy now.  Please don't ask them
> to do extra work.
> 
> Thanks,
> Ian.
> 

Cheers,
Michal

