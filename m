Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F325F30E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 08:12:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFANI-00032P-LU; Mon, 07 Sep 2020 06:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFANH-00032K-8T
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 06:11:31 +0000
X-Inumbo-ID: b46bc7cd-e5ed-4c77-bcba-3356cf9e3154
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b46bc7cd-e5ed-4c77-bcba-3356cf9e3154;
 Mon, 07 Sep 2020 06:11:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FD3AAB8B;
 Mon,  7 Sep 2020 06:11:30 +0000 (UTC)
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
 <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
 <20200905051707.GA48373@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d94b5980-be2c-da45-5f8c-1c218e254a70@suse.com>
Date: Mon, 7 Sep 2020 08:11:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200905051707.GA48373@mattapan.m5p.com>
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

On 05.09.2020 07:17, Elliott Mitchell wrote:
> On Tue, Sep 01, 2020 at 08:01:30AM +0200, Jan Beulich wrote:
>> I'm aware, and hence I said "aim for". In cases like this what we
>> often do is adjust things incrementally, as lines get touched anyway.
>> Of course if you want to clean it up all in one go ...
> 
> What I've got has turned into a patch series.  There are some general
> .gitignore cleanup patches, followed by large mechanical fixes.
> 
> Who should be included as Cc for submitting these?  Usual pattern would
> end up including all the general maintainers on all patches.  The reason
> is several of these are taking pieces off of the top-level .gitignore and
> moving those to subdirectory .gitignore files which would have shorter Cc
> lists.  There wouldn't be actual effects at the top-level, merely those
> subdirectories.  Should only the maintainers for the subdirectories be
> Cc'd?

I don't have a good suggestion or strong opinion either way here.
I can see reasons for going either route.

Jan

