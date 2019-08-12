Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5708964D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 06:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx1yM-0005fN-EP; Mon, 12 Aug 2019 04:30:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kjpr=WI=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hx1yK-0005fI-FG
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 04:30:16 +0000
X-Inumbo-ID: e1098b87-bcb9-11e9-8980-bc764e045a96
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1098b87-bcb9-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 04:30:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BEC9F145487CD;
 Sun, 11 Aug 2019 21:30:13 -0700 (PDT)
Date: Sun, 11 Aug 2019 21:30:13 -0700 (PDT)
Message-Id: <20190811.213013.1995644313060273325.davem@davemloft.net>
To: gregkh@linuxfoundation.org
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190810103108.GA29487@kroah.com>
References: <20190810103108.GA29487@kroah.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 11 Aug 2019 21:30:14 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] xen-netback: no need to check return value
 of debugfs_create functions
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org, paul.durrant@citrix.com,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KRGF0
ZTogU2F0LCAxMCBBdWcgMjAxOSAxMjozMTowOCArMDIwMAoKPiBXaGVuIGNhbGxpbmcgZGVidWdm
cyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZlciBjaGVjayB0aGUKPiByZXR1cm4g
dmFsdWUuICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMg
c2hvdWxkCj4gbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNlZCBvbiB0aGlzLgo+IAo+
IENjOiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+Cj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+IENjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkFwcGxpZWQgdG8gbmV0LW5l
eHQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
