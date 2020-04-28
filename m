Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A962E1BB657
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 08:15:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTJWD-0006xE-4O; Tue, 28 Apr 2020 06:14:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTJWC-0006x9-An
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 06:14:56 +0000
X-Inumbo-ID: 93d1ed02-8917-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93d1ed02-8917-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 06:14:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4800AECD;
 Tue, 28 Apr 2020 06:14:52 +0000 (UTC)
Subject: Re: [PATCH 0/2] x86: high compat r/o M2P table handling adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
Message-ID: <e8902061-702b-e049-a541-a4422de70a9e@suse.com>
Date: Tue, 28 Apr 2020 08:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
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
Cc: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org, julien@xen.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 10:21, Jan Beulich wrote:
> While looking at "x86_64/mm: map and unmap page tables in
> destroy_compat_m2p_mapping" it occurred to me that the mappings
> changed there can be dropped altogether, as can the linear
> address range used for this. Note that both patches have only
> been lightly tested so far, I guess in particular the 2nd one
> may still have issues.
> 
> 1: x86: drop unnecessary page table walking in compat r/o M2P handling
> 2: x86: drop high compat r/o M2P table address range

Just fyi - with the reviews I've got I'm intending to commit
this later this week, unless I hear otherwise soon.

Jan

