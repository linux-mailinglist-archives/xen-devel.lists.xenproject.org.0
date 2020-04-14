Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3735F1A77EC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:55:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIHg-00032o-W1; Tue, 14 Apr 2020 09:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOIHf-00032j-T7
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:55:11 +0000
X-Inumbo-ID: 07af4950-7e36-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07af4950-7e36-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 09:55:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8B26AC5F;
 Tue, 14 Apr 2020 09:55:09 +0000 (UTC)
Subject: Re: [PATCH v5 1/3] x86/hypervisor: pass flags to hypervisor_flush_tlb
To: Wei Liu <wl@xen.org>
References: <20200409174104.23946-1-liuwe@microsoft.com>
 <20200409174104.23946-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f02be08b-b747-44c2-411d-8d8a41f4211c@suse.com>
Date: Tue, 14 Apr 2020 11:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409174104.23946-2-liuwe@microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.2020 19:41, Wei Liu wrote:
> Hyper-V's L0 assisted flush has fine-grained control over what gets
> flushed. We need all the flags available to make the best decisions
> possible.
> 
> No functional change because Xen's implementation doesn't care about
> what is passed to it.
> 
> Signed-off-by: Wei Liu <liuwe@microsoft.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

