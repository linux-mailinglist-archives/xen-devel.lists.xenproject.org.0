Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157DA190868
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 10:03:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGfQL-0003BW-8V; Tue, 24 Mar 2020 09:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGfQK-0003BR-Gs
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 09:00:36 +0000
X-Inumbo-ID: ec3ee484-6dad-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec3ee484-6dad-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 09:00:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE66FACE3;
 Tue, 24 Mar 2020 09:00:33 +0000 (UTC)
To: Pu Wen <puwen@hygon.cn>
References: <20200324045131.2060-1-puwen@hygon.cn>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8dd611c-3e56-b3fe-1734-e867b8ccc17b@suse.com>
Date: Tue, 24 Mar 2020 10:00:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324045131.2060-1-puwen@hygon.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] x86/mce: Correct the machine check vendor
 for Hygon
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 05:51, Pu Wen wrote:
> Currently the xl dmesg output on Hygon platforms will be
> "(XEN) CPU0: AMD Fam18h machine check reporting enabled",
> which is misleading as AMD does not have family 18h (Hygon
> negotiated with AMD to confirm that only Hygon has family 18h).
> 
> To correct this, add Hygon machine check type and vendor string.
> 
> Signed-off-by: Pu Wen <puwen@hygon.cn>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

