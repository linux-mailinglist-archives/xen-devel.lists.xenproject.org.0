Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BC222050
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:11:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw0rY-0004rv-EX; Thu, 16 Jul 2020 10:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jw0rW-0004rq-UC
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:11:34 +0000
X-Inumbo-ID: b9894ac2-c74c-11ea-949a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9894ac2-c74c-11ea-949a-12813bfff9fa;
 Thu, 16 Jul 2020 10:11:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C99BB850;
 Thu, 16 Jul 2020 10:11:36 +0000 (UTC)
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
To: George Dunlap <George.Dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
 <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f5e86cc-4f64-982b-d84b-1de6b2739a2b@suse.com>
Date: Thu, 16 Jul 2020 12:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 16:37, George Dunlap wrote:
> IT sounds like you’re saying:
> 
> 1. Paths listed without conditions will always be available
> 
> 2. Paths listed with conditions may be extended: i.e., a node currently listed as PV might also become available for HVM guests
> 
> 3. Paths listed with conditions might have those conditions reduced, but will never entirely disappear.  So something currently listed as PV might be reduced to CONFIG_HAS_FOO, but won’t be completely removed.
> 
> Is that what you meant?

I see Jürgen replied "yes" to this, but I'm not sure about 1.
above: I think it's quite reasonable to expect that paths without
condition may gain a condition. Just like paths now having a
condition and (perhaps temporarily) losing it shouldn't all of
the sudden become "always available" when they weren't meant to
be.

As far a 3. goes, I'm also unsure in how far this is any better
stability wise (from a consumer pov) than allowing paths to
entirely disappear.

Jan

