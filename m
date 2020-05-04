Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA591C39ED
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaaK-0002BW-JB; Mon, 04 May 2020 12:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVaaJ-0002BQ-3V
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:52:35 +0000
X-Inumbo-ID: 1f94ab02-8e06-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f94ab02-8e06-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 12:52:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38604ABD0;
 Mon,  4 May 2020 12:52:35 +0000 (UTC)
Subject: Re: [PATCH] x86/ucode/intel: Writeback and invalidate caches before
 updating microcode
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200504124752.29806-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <961ecc3e-0450-473a-8c85-17c7f9aa827b@suse.com>
Date: Mon, 4 May 2020 14:52:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504124752.29806-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.05.2020 14:47, Andrew Cooper wrote:
> From: Ashok Raj <ashok.raj@intel.com>
> 
> Updating microcode is less error prone when caches have been flushed and
> depending on what exactly the microcode is updating. For example, some of the
> issues around certain Broadwell parts can be addressed by doing a full cache
> flush.
> 
> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [Linux commit 91df9fdf51492aec9fed6b4cbd33160886740f47, ported to Xen]
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

