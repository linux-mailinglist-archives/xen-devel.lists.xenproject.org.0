Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B557A1DE83E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:42:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7wI-0007Gj-QS; Fri, 22 May 2020 13:42:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc7wI-0007Ge-0r
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:42:18 +0000
X-Inumbo-ID: 0a86a730-9c32-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a86a730-9c32-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 13:42:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5AC2B00E;
 Fri, 22 May 2020 13:42:14 +0000 (UTC)
Subject: Re: [PATCH v4] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200521092258.82503-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b59a2d2e-e66d-f3a1-dd85-fd7c7eccc98a@suse.com>
Date: Fri, 22 May 2020 15:42:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521092258.82503-1-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.05.2020 11:22, Roger Pau Monne wrote:
> Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
> BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
> Dispatched Before an Interrupt of The Same Priority Completes".

While the change looks good to me as far as Broadwell goes, I
think it was before this posting that Andrew also pointed at
a specific Haswell erratum instance, still on the v3 thread.
Am I to imply a v5 will follow adding affected Haswell models
to the table?

Jan

