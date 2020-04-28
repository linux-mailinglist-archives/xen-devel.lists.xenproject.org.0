Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF941BC372
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTS7q-0004Vz-HD; Tue, 28 Apr 2020 15:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTS7p-0004Vt-Nv
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:26:21 +0000
X-Inumbo-ID: 9cc16490-8964-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cc16490-8964-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 15:26:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B374AB7F;
 Tue, 28 Apr 2020 15:26:19 +0000 (UTC)
Subject: Re: [PATCH 4/6] x86/smpboot: map and unmap page tables in
 cleanup_cpu_root_pgt
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <bc0ad02ad73ac3f02e063457d69634b1f6b57ddc.1587116799.git.hongyxia@amazon.com>
 <afec3c99-49e8-0304-23ef-1763df48fc9c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <332fec70-3661-d0c3-25de-dc5a7a5ee4b3@suse.com>
Date: Tue, 28 Apr 2020 17:26:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <afec3c99-49e8-0304-23ef-1763df48fc9c@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 11:13, Julien Grall wrote:
> On 17/04/2020 10:52, Hongyan Xia wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>>
>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


