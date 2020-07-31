Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0323452F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tkv-0002k7-FQ; Fri, 31 Jul 2020 12:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Tkt-0002jl-RH
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:03:19 +0000
X-Inumbo-ID: d27c4a0e-d325-11ea-8e2b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d27c4a0e-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:03:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 642C7ABD2;
 Fri, 31 Jul 2020 12:03:31 +0000 (UTC)
Subject: Re: [PATCH v1] tools/xen-cpuid: show enqcmd
To: Olaf Hering <olaf@aepfle.de>
References: <20200730163406.31020-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
Date: Fri, 31 Jul 2020 14:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730163406.31020-1-olaf@aepfle.de>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 18:34, Olaf Hering wrote:
> Translate <29> into a feature string.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I'm pretty sure there are more missing than just this lone one.

Jan

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -133,7 +133,7 @@ static const char *const str_7c0[32] =
>      [22] = "rdpid",
>      /* 24 */                   [25] = "cldemote",
>      /* 26 */                   [27] = "movdiri",
> -    [28] = "movdir64b",
> +    [28] = "movdir64b",        [29] = "enqcmd",
>      [30] = "sgx-lc",
>  };
>  
> 


