Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41AE1A307C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 09:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMRyx-0003Th-9f; Thu, 09 Apr 2020 07:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMRyw-0003Tc-Bn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 07:52:14 +0000
X-Inumbo-ID: 0603433e-7a37-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0603433e-7a37-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 07:52:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 95B74AE52;
 Thu,  9 Apr 2020 07:52:11 +0000 (UTC)
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7ae5179c-8d48-bb83-8250-43a558a04ba5@suse.com>
Date: Thu, 9 Apr 2020 09:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.20 09:41, Jan Beulich wrote:
> All,
> 
> the releases are due in a week or two. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, I notice there haven't been any
> tools side backports at all so far. Julien, Stefano - same for
> Arm.)
> 
> Jan
> 

Commit bb2a34fd740e9a26be9e2244f1a5b4cef439e5a8 should be backported
to both IMO (tools patch).


Juergen

