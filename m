Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144C11D6D3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 20:08:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTm0-0003jp-U9; Thu, 12 Dec 2019 19:05:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VXz7=2C=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ifTlz-0003jk-BA
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 19:05:15 +0000
X-Inumbo-ID: 53fa9ace-1d12-11ea-b6f1-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53fa9ace-1d12-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 19:05:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EC42D153DFC99;
 Thu, 12 Dec 2019 11:05:13 -0800 (PST)
Date: Thu, 12 Dec 2019 11:05:13 -0800 (PST)
Message-Id: <20191212.110513.1770889236741616001.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191212135406.26229-1-pdurrant@amazon.com>
References: <20191212135406.26229-1-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 12 Dec 2019 11:05:14 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDEyIERl
YyAyMDE5IDEzOjU0OjA2ICswMDAwCgo+IEluIHRoZSBwYXN0IGl0IHVzZWQgdG8gYmUgdGhlIGNh
c2UgdGhhdCB0aGUgWGVuIHRvb2xzdGFjayByZWxpZWQgdXBvbgo+IHVkZXYgdG8gZXhlY3V0ZSBi
YWNrZW5kIGhvdHBsdWcgc2NyaXB0cy4gSG93ZXZlciB0aGlzIGhhcyBub3QgYmVlbiB0aGUKPiBj
YXNlIGZvciBtYW55IHJlbGVhc2VzIG5vdyBhbmQgcmVtb3ZhbCBvZiB0aGUgYXNzb2NpYXRlZCBj
b2RlIGluCj4geGVuLW5ldGJhY2sgc2hvcnRlbnMgdGhlIHNvdXJjZSBieSBtb3JlIHRoYW4gMTAw
IGxpbmVzLCBhbmQgcmVtb3ZlcyBtdWNoCj4gY29tcGxleGl0eSBpbiB0aGUgaW50ZXJhY3Rpb24g
d2l0aCB0aGUgeGVuc3RvcmUgYmFja2VuZCBzdGF0ZS4KPiAKPiBOT1RFOiB4ZW4tbmV0YmFjayBp
cyB0aGUgb25seSB4ZW5idXMgZHJpdmVyIHRvIGhhdmUgYSBmdW5jdGlvbmFsIHVldmVudCgpCj4g
ICAgICAgbWV0aG9kLiBUaGUgb25seSBvdGhlciBkcml2ZXIgdG8gaGF2ZSBhIG1ldGhvZCBhdCBh
bGwgaXMKPiAgICAgICBwdmNhbGxzLWJhY2ssIGFuZCBjdXJyZW50bHkgcHZjYWxsc19iYWNrX3Vl
dmVudCgpIHNpbXBseSByZXR1cm5zIDAuCj4gICAgICAgSGVuY2UgdGhpcyBwYXRjaCBhbHNvIGZh
Y2lsaXRhdGVzIGZ1cnRoZXIgY2xlYW51cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpJZiB1c2Vyc3BhY2UgZXZlciB1c2VkIHRoaXMgc3R1
ZmYsIEkgc2VyaW91c2x5IGRvdWJ0IHlvdSBjYW4gcmVtb3ZlIHRoaXMKZXZlbiBpZiBpdCBoYXNu
J3QgYmVlbiB1c2VkIGluIDUrIHllYXJzLgoKU29ycnkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
