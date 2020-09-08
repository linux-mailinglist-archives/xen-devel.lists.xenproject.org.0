Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384E02613DA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:53:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfva-0005Yj-SQ; Tue, 08 Sep 2020 15:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFfvZ-0005YW-Dy
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:53:01 +0000
X-Inumbo-ID: dd8b5a03-cf61-4a0b-8221-e639f7a91022
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd8b5a03-cf61-4a0b-8221-e639f7a91022;
 Tue, 08 Sep 2020 15:53:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7F8BB603;
 Tue,  8 Sep 2020 15:53:00 +0000 (UTC)
Subject: Re: [PATCH v4 2/5] x86/pv: allow reading FEATURE_CONTROL MSR
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200907103143.58845-1-roger.pau@citrix.com>
 <20200907103143.58845-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6e137b9-d0e6-0895-8b49-153db03e1c6e@suse.com>
Date: Tue, 8 Sep 2020 17:52:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907103143.58845-3-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 12:31, Roger Pau Monne wrote:
> Linux PV guests will attempt to read the FEATURE_CONTROL MSR, so move
> the handling done in VMX code into guest_rdmsr as it can be shared
> between PV and HVM guests that way.
> 
> Note that there's a slight behavior change and attempting to read the
> MSR when no features are available will result in a fault.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

