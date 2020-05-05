Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFA1C501D
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 10:19:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVsnH-0004uy-9U; Tue, 05 May 2020 08:19:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVsnF-0004um-Lc
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 08:19:09 +0000
X-Inumbo-ID: 17b1e99c-8ea9-11ea-9d93-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b1e99c-8ea9-11ea-9d93-12813bfff9fa;
 Tue, 05 May 2020 08:19:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 773EFAFF0;
 Tue,  5 May 2020 08:19:10 +0000 (UTC)
Subject: Re: [PATCH v8 09/12] x86/HVM: scale MPERF values reported to guests
 (on AMD)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <c14edd2c-3cd8-c9b4-0cc0-7cbf2c672127@suse.com>
Message-ID: <d4ae14f1-52c2-1dfb-439b-d0b09b36282a@suse.com>
Date: Tue, 5 May 2020 10:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c14edd2c-3cd8-c9b4-0cc0-7cbf2c672127@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 10:17, Jan Beulich wrote:
> AMD's PM specifies that MPERF (and its r/o counterpart) reads are
> affected by the TSC ratio. Hence when processing such reads in software
> we too should scale the values. While we don't currently (yet) expose
> the underlying feature flags, besides us allowing the MSRs to be read
> nevertheless, RDPRU is going to expose the values even to user space.
> 
> Furthermore, due to the not exposed feature flags, this change has the
> effect of making properly inaccessible (for reads) the two MSRs.
> 
> Note that writes to MPERF (and APERF) continue to be unsupported.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Sorry, just re-sent this one with correct numbering.

Jan

