Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFC1BDFA6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:56:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnBf-0003U0-3G; Wed, 29 Apr 2020 13:55:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTnBe-0003Tv-48
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:55:42 +0000
X-Inumbo-ID: 1ce41a16-8a21-11ea-994e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ce41a16-8a21-11ea-994e-12813bfff9fa;
 Wed, 29 Apr 2020 13:55:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A898AABBE;
 Wed, 29 Apr 2020 13:55:39 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] x86/pv: Options to disable and/or compile out
 32bit PV support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <20200429130631.6018-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f629cab-e729-5201-3315-130b0a1d3082@suse.com>
Date: Wed, 29 Apr 2020 15:55:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429130631.6018-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 15:06, Andrew Cooper wrote:
> This is the start of some performance and security-hardening improvements,
> based on the fact that 32bit PV guests are few and far between these days.
> 
> Ring1 is full of architectural corner cases, such as counting as supervisor
> from a paging point of view.  This accounts for a substantial performance hit
> on processors from the last 8 years (adjusting SMEP/SMAP on every privilege
> transition), and the gap is only going to get bigger with new hardware
> features.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Wei Liu <wl@xen.org>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


