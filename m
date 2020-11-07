Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A512AA323
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 09:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21297.47613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbJ96-0006Jr-39; Sat, 07 Nov 2020 08:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21297.47613; Sat, 07 Nov 2020 08:00:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbJ95-0006JS-Vi; Sat, 07 Nov 2020 08:00:23 +0000
Received: by outflank-mailman (input) for mailman id 21297;
 Sat, 07 Nov 2020 08:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=np7k=EN=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kbJ94-0006JM-Me
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 08:00:22 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59a544c3-a0c7-4401-a139-63dc7b871b06;
 Sat, 07 Nov 2020 08:00:22 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kbJ93-0002xq-9z; Sat, 07 Nov 2020 08:00:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=np7k=EN=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kbJ94-0006JM-Me
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 08:00:22 +0000
X-Inumbo-ID: 59a544c3-a0c7-4401-a139-63dc7b871b06
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 59a544c3-a0c7-4401-a139-63dc7b871b06;
	Sat, 07 Nov 2020 08:00:22 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kbJ93-0002xq-9z; Sat, 07 Nov 2020 08:00:21 +0000
Date: Sat, 7 Nov 2020 08:00:21 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 8/9] x86/shadow: cosmetics to
 sh_unshadow_for_p2m_change()
Message-ID: <20201107080021.GB11151@deinos.phlegethon.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
 <db7e83c8-e40d-3642-4acf-6320b643140f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <db7e83c8-e40d-3642-4acf-6320b643140f@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:38 +0100 on 06 Nov (1604659127), Jan Beulich wrote:
> Besides the adjustments for style
> - use switch(),
> - widen scope of commonly used variables,
> - narrow scope of other variables.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

