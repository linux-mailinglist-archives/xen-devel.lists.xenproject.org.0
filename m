Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15541A73C5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 08:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOFA3-000159-PS; Tue, 14 Apr 2020 06:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOFA2-000153-GN
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 06:35:06 +0000
X-Inumbo-ID: 13d21454-7e1a-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13d21454-7e1a-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 06:35:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18FC1AB3D;
 Tue, 14 Apr 2020 06:35:04 +0000 (UTC)
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <86c6ffb6-22d0-cbce-8682-dac37697bbfd@xen.org>
 <alpine.DEB.2.21.2004100926350.19608@sstabellini-ThinkPad-T480s>
 <cb32ed05-072f-87a9-a6ed-83a9062df5a5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <593b2b99-60af-ea19-e1ae-76bdae60cb84@suse.com>
Date: Tue, 14 Apr 2020 08:35:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cb32ed05-072f-87a9-a6ed-83a9062df5a5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.04.2020 19:54, Julien Grall wrote:
> On 10/04/2020 17:37, Stefano Stabellini wrote:
>> I think the following could be a good candidate. It also touches x86 so
>> I thought I should ask you.
>>
>> 6827bea2b3b99153821b8b7446bdced27f720188 dom0-build: fix build with clang5

Hmm, I didn't think anyone but me had noticed the issue, or else
I would have expected some support in getting this in faster than
it actually went in (half a yer? more?), so I had rather decided
against.

> If we are backporting build fixes for newer compilers, shouldn't we backport all of them?

Probably; I'm not sure I'd call clang5 "newer" though. Aren't they
at v9 or v10 now? Irrespective of this - are you aware of other
"newer compiler" changes? Normally I would pick such up, at the
very least for the newest of the stable trees, but generally for
all of them since sooner or later we'd be hit by people trying to
build older (by the time) trees with new tool chains.

Jan

