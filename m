Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FC2564C8
	for <lists+xen-devel@lfdr.de>; Sat, 29 Aug 2020 06:39:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBsdY-0002q7-9Y; Sat, 29 Aug 2020 04:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x5UR=CH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBsdW-0002q2-Vw
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2020 04:38:43 +0000
X-Inumbo-ID: b565908d-e3cc-4e5e-80bf-4e975b6f0702
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b565908d-e3cc-4e5e-80bf-4e975b6f0702;
 Sat, 29 Aug 2020 04:38:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4427AF01;
 Sat, 29 Aug 2020 04:39:14 +0000 (UTC)
Subject: Re: [PATCH v4 30/31] tools/libs: add option for library names not
 starting with libxen
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-31-jgross@suse.com>
 <20200828160053.b7misof3qmmkskur@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aa1b4641-0ce5-9c72-19a0-2e27ff1fe704@suse.com>
Date: Sat, 29 Aug 2020 06:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828160053.b7misof3qmmkskur@liuwe-devbox-debian-v2>
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

On 28.08.20 18:00, Wei Liu wrote:
> On Fri, Aug 28, 2020 at 05:07:46PM +0200, Juergen Gross wrote:
>> libxlutil doesn't follow the standard name pattern of all other Xen
>> libraries, so add another make variable which can be used to allow
>> other names.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Is this still needed?

Yes. Its for the installed files, as those need to stay as they are
today.


Juergen

