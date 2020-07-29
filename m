Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F140B23256D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 21:29:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0rl1-0005dr-Pz; Wed, 29 Jul 2020 19:28:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0rl0-0005dm-5p
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 19:28:54 +0000
X-Inumbo-ID: bc26deea-d1d1-11ea-aa50-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc26deea-d1d1-11ea-aa50-12813bfff9fa;
 Wed, 29 Jul 2020 19:28:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC785AC7F;
 Wed, 29 Jul 2020 19:29:03 +0000 (UTC)
Subject: Re: [PATCH v3] print: introduce a format specifier for pci_sbdf_t
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200727103136.53343-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca6cd6a5-3221-4d34-08a0-8ea4b2dc92d0@suse.com>
Date: Wed, 29 Jul 2020 21:28:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727103136.53343-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew,

On 27.07.2020 12:31, Roger Pau Monne wrote:
> The new format specifier is '%pp', and prints a pci_sbdf_t using the
> seg:bus:dev.func format. Replace all SBDFs printed using
> '%04x:%02x:%02x.%u' to use the new format specifier.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
> For just the pieces where Jan is the only maintainer:
> Acked-by: Jan Beulich <jbeulich@suse.com>

for a change as controversial as this one I think it is particularly
relevant that formal aspects get obeyed to. With the acks above I
don't think the change could have gone in. I would assume you simply
forgot to add yours while committing, but then I'd have expected at
least an on-list instance of it, which I don't think I've seen. (But
yes, email hasn't been as reliable here lately as one would expect
it to be, so I'm not going to exclude that I've simply missed it.)

Me restricting my ack to just what's needed to avoid further stalling
of the change was for a reason, as you may recall. In particular I
wanted to make sure people actually supporting the approach taken
would be recognizable from the eventual commit, rather than me as
being the one who was opposed to it.

In all reality, Roger, it looks to me as if you should have dropped
my ack, as there seems to be nothing left at this point that I'm
the only maintainer of.

Jan

