Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABE254507
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 14:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBH7O-0002N7-Nj; Thu, 27 Aug 2020 12:35:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4js=CF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBH7N-0002N2-0U
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 12:35:01 +0000
X-Inumbo-ID: 576cd05c-7104-4a6c-98a3-562f5123a621
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 576cd05c-7104-4a6c-98a3-562f5123a621;
 Thu, 27 Aug 2020 12:35:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49902ACA0;
 Thu, 27 Aug 2020 12:35:31 +0000 (UTC)
Subject: Re: [PATCH v3 37/38] tools: add support for library names other than
 libxen*
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-38-jgross@suse.com>
 <20200827115502.iupiakmva4kfbvox@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bb0ac25d-63a2-1851-4010-6d89215a95b8@suse.com>
Date: Thu, 27 Aug 2020 14:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827115502.iupiakmva4kfbvox@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 27.08.20 13:55, Wei Liu wrote:
> On Sun, Aug 23, 2020 at 11:35:18AM +0200, Juergen Gross wrote:
>> All Xen libraries but one (libxlutil) are named libxen...
>>
> 
> It this can potentially make your life easier, I think renaming the
> library to libxenlightutil to conform to the library naming scheme is
> acceptable to me -- obviously we will need to keep the sonames and such.
> 
> What do you think?

This would certainly result in a more readable Makefile. :-)

In case nobody objects I can change the last two patches accordingly.


Juergen

