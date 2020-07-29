Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D5232336
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 19:13:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0pdN-0002sx-Ce; Wed, 29 Jul 2020 17:12:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgl/=BI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0pdL-0002ss-OD
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 17:12:51 +0000
X-Inumbo-ID: bb2d8ac5-d1be-11ea-8ca1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb2d8ac5-d1be-11ea-8ca1-bc764e2007e4;
 Wed, 29 Jul 2020 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596042770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7hfovDxMnNjWkR9w66TvoiFRNg1khpSwk/pSKaP5HZY=;
 b=eX9zgmPdMD5gzOa5bcjkj/abTGNjD+5MWdTadkO1AW84YWnX1Yu2Tz+D
 7G1DSNwLQMg/Q9sadhR6nFg7IL3h5BO/9IQVEPM0a1u85VG66HkjDRiw0
 LR1oQjbl/O20vDcGlht+l92ZsGfaetJM4xsvH0IOJ6IAg2s6KaPWNIC52 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: j0oc+PtaiX398gPKGe0zVIOBIhhG7t7/+UK2qNVl0BxV3t1jGFiOKVABvm3nzt3Vydonc5WXdF
 it6ChF09eM7GTmfIDfywxIKoR0RrVLSOgOogeuhVTB6HCE3sNcb0tCDfY4BHlZnU/azSw6HBRS
 9NNVZiOUQP08yMznspnqMYJSJFj5ldKUwHXvHKse31KKZsLjIC7+9C/2GzDTHfB4a01p/VDqVe
 gt3KDt9VRZXLZcxnWYck03ruVAuNjgHZrqDkWRRR7pBEQscyiWgioN5lJqGW0NsaSSuoz9AYWu
 oHY=
X-SBRS: 2.7
X-MesageID: 23801227
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,411,1589256000"; d="scan'208";a="23801227"
Date: Wed, 29 Jul 2020 19:12:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <fam@euphon.net>
Subject: Re: [PATCH] x86/cpuid: Fix APIC bit clearing
Message-ID: <20200729171240.GE7191@Air-de-Roger>
References: <20200729163341.5662-1-fam@euphon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200729163341.5662-1-fam@euphon.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: famzheng@amazon.com, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 29, 2020 at 05:33:41PM +0100, fam@euphon.net wrote:
> From: Fam Zheng <famzheng@amazon.com>
> 
> The bug is obvious here, other places in this function used
> "cpufeat_mask" correctly.
> 
> Signed-off-by: Fam Zheng <famzheng@amazon.com>
> Fixes: 46df8a65 ("x86/cpuid: Effectively remove pv_cpuid() and hvm_cpuid()")

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

