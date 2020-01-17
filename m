Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF05140734
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isONr-0008I6-HN; Fri, 17 Jan 2020 09:57:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=17el=3G=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1isONq-0008I1-CN
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:57:42 +0000
X-Inumbo-ID: cc5d1e24-390f-11ea-b89f-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc5d1e24-390f-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 09:57:40 +0000 (UTC)
Received: from localhost (82-95-191-104.ip.xs4all.nl [82.95.191.104])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B33BA1555624D;
 Fri, 17 Jan 2020 01:57:37 -0800 (PST)
Date: Fri, 17 Jan 2020 01:57:35 -0800 (PST)
Message-Id: <20200117.015735.420636894227257674.davem@davemloft.net>
To: madhuparnabhowmik04@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
References: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 17 Jan 2020 01:57:39 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU
 list checking
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
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, frextrite@gmail.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogbWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20KRGF0ZTogV2VkLCAxNSBKYW4gMjAy
MCAyMToyNTo1MyArMDUzMAoKPiBGcm9tOiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFi
aG93bWlrMDRAZ21haWwuY29tPgo+IAo+IGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1IGhhcyBidWls
dC1pbiBSQ1UgYW5kIGxvY2sgY2hlY2tpbmcuCj4gUGFzcyBjb25kIGFyZ3VtZW50IHRvIGxpc3Rf
Zm9yX2VhY2hfZW50cnlfcmN1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hZGh1cGFybmEgQmhvd21p
ayA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG5ldC1uZXh0LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
