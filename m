Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57602587D0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 08:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCzMD-0004u2-Pr; Tue, 01 Sep 2020 06:01:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCzMC-0004tu-Mq
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 06:01:24 +0000
X-Inumbo-ID: d95880b7-273a-4f2e-a1cd-81759d97f892
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d95880b7-273a-4f2e-a1cd-81759d97f892;
 Tue, 01 Sep 2020 06:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A5CAAF96;
 Tue,  1 Sep 2020 06:01:22 +0000 (UTC)
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
 <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
 <20200831225517.GA11156@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
Date: Tue, 1 Sep 2020 08:01:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831225517.GA11156@mattapan.m5p.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.09.2020 00:55, Elliott Mitchell wrote:
> On Mon, Aug 31, 2020 at 08:52:45AM +0200, Jan Beulich wrote:
>> On 31.08.2020 08:37, Elliott Mitchell wrote:
>>> Preferences in sorting?
>>
>> Alphabetical sorting is what we generally aim for here.
> 
> Going into specific example since those best demonstrate what I
> observed.
> 
> Before this patch the top-level .gitignore included the lines:
> @@
> -tools/misc/cpuperf/cpuperf-perfcntr
> -tools/misc/cpuperf/cpuperf-xen
> -tools/misc/xc_shadow
> -tools/misc/xen_cpuperf
> -tools/misc/xen-cpuid
> @@
> -xen/xsm/flask/policy.*
> -xen/xsm/flask/xenpolicy-*
>  tools/flask/policy/policy.conf
>  tools/flask/policy/xenpolicy-*
>  xen/xen
> @@
> 
> tools/misc/.gitignore had the single line:
> xen-ucode
> 
> xen/xsm/flask/.gitignore had the single line:
> /policy.c
> 
> 
> You'll note from the second batch, .gitignore isn't consistently sorted.

I'm aware, and hence I said "aim for". In cases like this what we
often do is adjust things incrementally, as lines get touched anyway.
Of course if you want to clean it up all in one go ...

Jan

