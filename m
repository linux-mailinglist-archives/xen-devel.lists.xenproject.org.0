Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D53B25550C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 09:24:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBYkb-0003Co-1Z; Fri, 28 Aug 2020 07:24:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBYkZ-0003Cg-CL
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 07:24:39 +0000
X-Inumbo-ID: cc5a34f0-82d7-4793-a8c2-670747d43fc6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc5a34f0-82d7-4793-a8c2-670747d43fc6;
 Fri, 28 Aug 2020 07:24:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72E1FB7CA;
 Fri, 28 Aug 2020 07:25:10 +0000 (UTC)
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200828025747.GA25246@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
Date: Fri, 28 Aug 2020 09:24:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828025747.GA25246@mattapan.m5p.com>
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

On 28.08.2020 04:57, Elliott Mitchell wrote:
> Subdirectories which have .gitignore files should not be referenced in
> the global .gitignore files.  Move several lines to appropriate subdirs.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> ---
> Hopefully the commit message covers it.  When moved to the subdirectories
> I'm using "./<file>" as otherwise any file sharing the name in a deeper
> subdirectory would be subject to the match.

May I ask why this last sentence isn't part of the commit message?

Jan

