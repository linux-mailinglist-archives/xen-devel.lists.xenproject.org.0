Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185403555E6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105981.202653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmFm-0005Ad-9Q; Tue, 06 Apr 2021 14:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105981.202653; Tue, 06 Apr 2021 14:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmFm-0005AE-65; Tue, 06 Apr 2021 14:00:26 +0000
Received: by outflank-mailman (input) for mailman id 105981;
 Tue, 06 Apr 2021 14:00:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dxY0=JD=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lTmFk-0005A9-SI
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:00:24 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36bba9c2-3397-4473-9b6a-6e280e49d1fe;
 Tue, 06 Apr 2021 14:00:24 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lTmFa-000Cwc-Pf; Tue, 06 Apr 2021 14:00:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 36bba9c2-3397-4473-9b6a-6e280e49d1fe
Date: Tue, 6 Apr 2021 15:00:14 +0100
From: Tim Deegan <tim@xen.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 03/14] xen/x86: shadow: The return type of
 sh_audit_flags() should be const
Message-ID: <YGxpbltNLUJN9cfe@deinos.phlegethon.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-4-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-4-julien@xen.org>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:57 +0100 on 05 Apr (1617641822), Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function sh_audit_flags() is returning pointer to literal strings.
> They should not be modified, so the return is now const and this is
> propagated to the callers.
> 
> Take the opportunity to fix the coding style in the declaration of
> sh_audit_flags.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Tim Deegan <tim@xen.org>

Thanks,

Tim.

