Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D672220D95
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 15:02:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvh2b-00089B-N0; Wed, 15 Jul 2020 13:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvh2a-000896-Mi
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 13:01:40 +0000
X-Inumbo-ID: 526a27f1-c69b-11ea-93da-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 526a27f1-c69b-11ea-93da-12813bfff9fa;
 Wed, 15 Jul 2020 13:01:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27F5BAD81;
 Wed, 15 Jul 2020 13:01:42 +0000 (UTC)
Subject: Re: [PATCH 00/12] tools: move more libraries into tools/libs
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20200715125143.15199-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8dbf6f72-8968-47e1-6806-436acdccc928@suse.com>
Date: Wed, 15 Jul 2020 15:01:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715125143.15199-1-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 14:51, Juergen Gross wrote:
> Move some more libraries under tools/libs, including libxenctrl. This
> is resulting in a lot of cleanup work regarding building libs and
> restructuring of the tools directory.
> 
> I have (for now) left out some more libraries like libxenguest and
> libxl, but I can have a try moving those, too, if wanted.
> 
> Please note that patch 8 ("tools: move libxenctrl below tools/libs")
> needs the related mini-os and qemu-trad patches applied in order not
> to break the build:
> 
> https://lists.xen.org/archives/html/xen-devel/2020-07/msg00548.html
> https://lists.xen.org/archives/html/xen-devel/2020-07/msg00617.html
> 
> As discussed at the Xen developers summit this series has been
> selected to act as a test case for sending pull requests via gitlab.
> This is the reason the patches are _not_ sent individually to
> xen-devel, but only the cover letter.

I don't think I've seen any summary of that discussion, and hence I
also can't judge or know whether this is meant just for huge and
presumably very mechanical series, or as a general form of patch
submission. The immediate point that strikes me is - how would I
comment on such series without having to go to gitlab? (There are
likely other issues I'd want to see addressed before this becomes
a common process.)

Jan

