Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD961A1CCC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 09:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM5Om-0001To-Te; Wed, 08 Apr 2020 07:45:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM5Ol-0001Tj-RN
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 07:45:23 +0000
X-Inumbo-ID: e5af1952-796c-11ea-81c0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5af1952-796c-11ea-81c0-12813bfff9fa;
 Wed, 08 Apr 2020 07:45:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3424DABEC;
 Wed,  8 Apr 2020 07:45:19 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Remove all S: entries
To: Ian Jackson <ian.jackson@eu.citrix.com>
References: <20200407161519.16493-1-ian.jackson@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5eea22b1-878e-7529-3442-f2ff9517be8c@suse.com>
Date: Wed, 8 Apr 2020 09:45:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407161519.16493-1-ian.jackson@eu.citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 18:15, Ian Jackson wrote:
> Feature support status is tracked in SUPPORT.md nowadays.

It is, yes.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -69,16 +69,6 @@ Descriptions of section entries:
>  	L: Mailing list that is relevant to this area
>  	W: Web-page with status/info
>  	T: SCM tree type and location.  Type is one of: git, hg, quilt, stgit.
> -	S: Status, one of the following:
> -	   Supported:	Someone is actually paid to look after this.
> -	   Maintained:	Someone actually looks after it.
> -	   Odd Fixes:	It has a maintainer but they don't have time to do
> -			much other than throw the odd patch in. See below..
> -	   Orphan:	No current maintainer [but maybe you could take the
> -			role as you write your new code].
> -	   Obsolete:	Old code. Something tagged obsolete generally means
> -			it has been replaced by a better system and you
> -			should be using that.

I agree with Julien: What we express here is not really overlapping
with SUPPORT.md - the may be cases where this is so, but there are
also ones where it's not.

Jan

