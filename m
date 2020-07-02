Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BD211D35
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 09:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqtrO-0007c6-Eq; Thu, 02 Jul 2020 07:42:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqtrM-0007c1-Tc
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 07:42:16 +0000
X-Inumbo-ID: 8cb73cea-bc37-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cb73cea-bc37-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 07:42:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F82BB19E;
 Thu,  2 Jul 2020 07:42:15 +0000 (UTC)
Subject: Re: [PATCH v2 0/7] x86: compat header generation and checking
 adjustments
To: paul@xen.org
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <001d01d65043$2d137890$873a69b0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b9de197-16f1-cb22-d109-a40dc8917549@suse.com>
Date: Thu, 2 Jul 2020 09:42:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <001d01d65043$2d137890$873a69b0$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.07.2020 09:34, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 01 July 2020 11:23
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
>> Jackson <ian.jackson@citrix.com>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Roger Pau Monné <roger.pau@citrix.com>; Paul Durrant
>> <paul@xen.org>
>> Subject: [PATCH v2 0/7] x86: compat header generation and checking adjustments
>>
>> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
>> struct xen_mem_acquire_resource"), we're not currently handling structs
>> correctly that have uint64_aligned_t fields. Patch 2 demonstrates that
>> there was also an issue with XEN_GUEST_HANDLE_64().
>>
>> Only the 1st patch was previously sent, but the approach chosen has
>> been changed altogether. All later patches are new. For 4.14 I think
>> at least patch 1 should be considered.
> 
> It's now quite a large patch.

Most parts being entirely mechanical, though. But still ...

> Since xen_mem_acquire_resouce() has been fixed, patch #1 (as you say
> in the comment there) is addressing a latent issue and so I’d prefer
> not to take what is now quite a large patch into 4.14.

... fair enough.

Jan

