Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB581BC17D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRON-0007Sx-TV; Tue, 28 Apr 2020 14:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTROM-0007Sq-6Y
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:39:22 +0000
X-Inumbo-ID: 0c236c04-895e-11ea-9872-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c236c04-895e-11ea-9872-12813bfff9fa;
 Tue, 28 Apr 2020 14:39:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADB4AAA7C;
 Tue, 28 Apr 2020 14:39:19 +0000 (UTC)
Subject: Re: [XEN PATCH v5 16/16] build, include: rework compat-build-header.py
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-17-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28e89622-5020-c9cd-9518-3726f29dff37@suse.com>
Date: Tue, 28 Apr 2020 16:39:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-17-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 18:12, Anthony PERARD wrote:
> Replace a mix of shell script and python script by all python script.
> 
> No change to the final generated headers.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v5:
>     - Removed -P from CPP when generating compat/%.i
>       -> keep removing linemarkers and keep de-duplicating empty lines.
>       So that all the blank line that currently exist in the generated
>       headers stays in place.

Thanks for doing these adjustments. However, my Python isn't good
enough to actually ack this patch, I'm afraid.

Jan

