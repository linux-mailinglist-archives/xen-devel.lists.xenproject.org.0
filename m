Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305015EC698
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412714.656125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBiF-00088A-H2; Tue, 27 Sep 2022 14:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412714.656125; Tue, 27 Sep 2022 14:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBiF-00085o-EP; Tue, 27 Sep 2022 14:37:31 +0000
Received: by outflank-mailman (input) for mailman id 412714;
 Tue, 27 Sep 2022 14:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4SB=Z6=citrix.com=prvs=2628f7867=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1odBiE-00085i-CE
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:37:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8384148-3e71-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:37:28 +0200 (CEST)
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
X-Inumbo-ID: e8384148-3e71-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664289449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kxDZ0rbJ3bMBOrYvM6g62C5B7UtbXGXUlMV/QGn+QVE=;
  b=At5N0qz5G5+rHg3EVfOaunA2zADflI7ZgP4gZeSbtwdsY7HT3VeyC3+a
   i4Cl9ndA4v149zvw8hHco/wpv6M0SI7VlZzHnRPqHcXY5hlzTIBz00kCy
   KBCmBBPur7RKBM38hVaCuOPem2eKhw35BjwJAmBEk/fD+K0hm7ZSSDbpL
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80575648
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qARhVq1/wJaRtaIaOfbD5T5xkn2cJEfYwER7XKvMYLTBsI5bpzNSy
 mEZXWiEb66MYDGhe9AgYImx8kkEup6En9E2HQtrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlH5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUF1Op1X2MT8
 MUIdjs/YCm63s+I6rmSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqNJ4PXG5kF9qqej
 lLN3kf7GE4bDcaS0hjG3E+1nrOMvDyuDer+E5Xnr6U30TV/3Fc7ChIMUkCgieKkkUP4UNVaQ
 2QY/ysyt7l070GuQ9/wQwaQr3uNvxpaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLTBqoaGPTkWG+7KZqz6uIgAYNWYHIyQDSGMt4dPuvYUyhRLnVct4Hei+ididMTb0z
 jORpS4ynYIai8IRyr679lDKhTGrjpXRRwtz7QLSNkq66itpaYjjYJangWU39t4ZctzfFAPY+
 iFZxY7Ot4jiEK1higSQbukPQrP04s+Vbjbuj2dWRrQf3T+ErivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYH7H8iTI/ePi+D2iJuppVAtbzOzghgRtv/sneks2
 4832zG24xteSvbiRSLc7JQeK1sHRVBiW86q8ZUIK7/Tc1I3cI3ENxM26exJRmCYt/4NyregE
 o+VAye0N2YTdVWYcF7XOxiPmZvkXIplrGJTABHAyW2AgiF7CbtDGY9FKPPbi5F7q7E4pRO1J
 tFZE/i97gNnGmSepG5BMcGmxGGgHTzy7T+z0+OeSGBXV/Zdq8bhoLcIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:QGtU/aiWHE4uSPWPtFJETPotpXBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="80575648"
Date: Tue, 27 Sep 2022 15:37:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Wei Liu
	<wl@xen.org>, Dmytro Semenets <dmytro_semenets@epam.com>, Juergen Gross
	<jgross@suse.com>, <dmitry.semenets@gmail.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] tools: remove xenstore entries on vchan server
 closure
Message-ID: <YzMKn5YgGJGu2CB7@perard.uk.xensource.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <336cfa84-2f32-286a-394b-fc596b2ce03e@suse.com>
 <3394db68-6569-50fc-a3f9-95b9756a0d89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3394db68-6569-50fc-a3f9-95b9756a0d89@suse.com>

On Thu, Sep 22, 2022 at 08:29:52AM +0200, Jan Beulich wrote:
> On 01.08.2022 10:57, Juergen Gross wrote:
> > On 13.07.22 17:03, dmitry.semenets@gmail.com wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> vchan server creates XenStore entries to advertise its event channel and
> >> ring, but those are not removed after the server quits.
> >> Add additional cleanup step, so those are removed, so clients do not try
> >> to connect to a non-existing server.
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> > 
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Anthony - any chance of getting an ack for at least this first patch?
> The others are more like feature additions, so perhaps aren't to go
> in anymore before 4.18 opens ...

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

