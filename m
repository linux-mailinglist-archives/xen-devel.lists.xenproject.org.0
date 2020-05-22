Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB01DECA9
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 17:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcA4s-0003oG-Ta; Fri, 22 May 2020 15:59:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jcA4q-0003oB-UY
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 15:59:16 +0000
X-Inumbo-ID: 2fdf4d62-9c45-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fdf4d62-9c45-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 15:59:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09A28B251;
 Fri, 22 May 2020 15:59:17 +0000 (UTC)
Subject: Re: [PATCH] x86/idle: Extend ISR/C6 erratum workaround to Haswell
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200522150733.18422-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5cbeb49b-96fa-8bc7-407d-724defef5671@suse.com>
Date: Fri, 22 May 2020 17:59:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522150733.18422-1-andrew.cooper3@citrix.com>
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

On 22.05.2020 17:07, Andrew Cooper wrote:
> This bug was first discovered against Haswell.  It is definitely affected.
> 
> (The XenServer ticket for this bug was opened on 2013-05-30 which is coming up
> on 7 years old, and predates Broadwell).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

