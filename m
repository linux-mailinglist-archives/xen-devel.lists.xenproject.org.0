Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EC1F6AED
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 17:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjP5Q-0002s2-Ol; Thu, 11 Jun 2020 15:25:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFEF=7Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjP5P-0002rx-ES
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 15:25:47 +0000
X-Inumbo-ID: d28468c4-abf7-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28468c4-abf7-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 15:25:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D528EAD78;
 Thu, 11 Jun 2020 15:25:49 +0000 (UTC)
Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
 <20200520155621.GN54375@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
Date: Thu, 11 Jun 2020 17:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520155621.GN54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.05.20 17:56, Roger Pau Monné wrote:
> On Wed, May 20, 2020 at 03:49:59PM +0100, Ian Jackson wrote:
>> Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of allocated memory"):
>>> The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
>>> ioctl() parameters is calculated wrong, which results in too much
>>> memory allocated.
>>
>> Added Roger to CC.
>>
>> Firstly,
>>
>> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> For the FreeBSD bits:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Any reason the patch didn't go in yet?


Juergen

