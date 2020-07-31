Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE27233F12
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 08:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1OUN-0001w7-AC; Fri, 31 Jul 2020 06:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1OUL-0001w2-OZ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 06:25:53 +0000
X-Inumbo-ID: ae69a316-d2f6-11ea-8e0e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae69a316-d2f6-11ea-8e0e-bc764e2007e4;
 Fri, 31 Jul 2020 06:25:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55B50AB8B;
 Fri, 31 Jul 2020 06:26:04 +0000 (UTC)
Subject: Re: [PATCH v3] print: introduce a format specifier for pci_sbdf_t
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200727103136.53343-1-roger.pau@citrix.com>
 <ca6cd6a5-3221-4d34-08a0-8ea4b2dc92d0@suse.com>
 <20200730100801.GF7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e99a55dd-9b30-9469-b0e7-c16026012824@suse.com>
Date: Fri, 31 Jul 2020 08:25:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730100801.GF7191@Air-de-Roger>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 12:08, Roger Pau Monné wrote:
> On Wed, Jul 29, 2020 at 09:28:53PM +0200, Jan Beulich wrote:
>> On 27.07.2020 12:31, Roger Pau Monne wrote:
>>> The new format specifier is '%pp', and prints a pci_sbdf_t using the
>>> seg:bus:dev.func format. Replace all SBDFs printed using
>>> '%04x:%02x:%02x.%u' to use the new format specifier.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>> Acked-by: Julien Grall <julien.grall@arm.com>
>>> For just the pieces where Jan is the only maintainer:
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
> [...]
>> In all reality, Roger, it looks to me as if you should have dropped
>> my ack, as there seems to be nothing left at this point that I'm
>> the only maintainer of.
> 
> Yes, just realized that now, I'm sorry. Your Ack happened before Paul
> became a maintainer of vendor-independent IOMMU code and I completely
> forgot about it.
> 
> I think the overall result of having a modifier for printing SBDFs is
> a win for everyone.

No-one disagrees here, I think. It's the "how", not the "what" that
was controversial.

> TBH I just revived the patch because I think it
> will be helpful to the Arm folks doing the PCI work, if not I wouldn't
> have sent it again.

Yes, I understood this to be the case.

Jan

