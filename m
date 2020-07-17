Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27511223DF9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:23:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwRGc-00073g-O6; Fri, 17 Jul 2020 14:23:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwRGa-00073b-W9
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:23:13 +0000
X-Inumbo-ID: 0b655dda-c839-11ea-9616-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b655dda-c839-11ea-9616-12813bfff9fa;
 Fri, 17 Jul 2020 14:23:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E236FAE70;
 Fri, 17 Jul 2020 14:23:15 +0000 (UTC)
Subject: Re: PCI devices passthrough on Arm design proposal
To: Julien Grall <julien@xen.org>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <8cae3706-7171-3f29-7b68-b5e6f26bc2b7@suse.com>
 <a8e4c68b-0ba8-4f35-6a07-98a9e68b4a6f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab8b12cb-5172-47da-3f31-67affcac6621@suse.com>
Date: Fri, 17 Jul 2020 16:23:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8e4c68b-0ba8-4f35-6a07-98a9e68b4a6f@xen.org>
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.07.2020 16:12, Julien Grall wrote:
> On 17/07/2020 14:59, Jan Beulich wrote:
>> Personally I'd much
>> prefer if we didn't have two fundamentally different PCI implementations
>> in the tree. Perhaps some of what Arm wants or needs can actually
>> benefit x86 as well, but this requires sufficiently much code sharing
>> then.
> 
> Well, it would be nice to have similar implementations. But at the same 
> time, we have different constraint. For instance, dom0 may disappear in 
> the future on Arm.

And becoming independent of Dom0 in this regard would be a benefit to
x86 as well, I think, irrespective of whether dom0less is to become a
thing there, too.

Jan

