Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C776316AF
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 23:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWpDA-0001N6-Qq; Fri, 31 May 2019 21:37:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SPb=T7=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hWpD9-0001Mz-BU
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 21:37:15 +0000
X-Inumbo-ID: 4075fee3-83ec-11e9-8980-bc764e045a96
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4075fee3-83ec-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 21:37:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E711415010A34;
 Fri, 31 May 2019 14:37:11 -0700 (PDT)
Date: Fri, 31 May 2019 14:37:11 -0700 (PDT)
Message-Id: <20190531.143711.1406359688787927167.davem@davemloft.net>
To: colin.king@canonical.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
References: <20190530190438.9571-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 31 May 2019 14:37:12 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] xen-netback: remove redundant assignment to
 err
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
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.durrant@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpEYXRlOiBUaHUsIDMw
IE1heSAyMDE5IDIwOjA0OjM4ICswMTAwCgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIHZhcmlhYmxlIGVyciBpcyBhc3NpZ25lZCB3aXRo
IHRoZSB2YWx1ZSAtRU5PTUVNIHRoYXQgaXMgbmV2ZXIKPiByZWFkIGFuZCBpdCBpcyByZS1hc3Np
Z25lZCBhIG5ldyB2YWx1ZSBsYXRlciBvbi4gIFRoZSBhc3NpZ25tZW50IGlzCj4gcmVkdW5kYW50
IGFuZCBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZh
bHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgoKQXBwbGllZCB0byBuZXQtbmV4dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
