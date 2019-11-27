Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7110C062
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 23:53:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia694-0007CW-0P; Wed, 27 Nov 2019 22:50:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jeri=ZT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia692-0007CN-9M
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 22:50:48 +0000
X-Inumbo-ID: 5a3cc0de-1168-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a3cc0de-1168-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 22:50:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8D83206E0;
 Wed, 27 Nov 2019 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574895047;
 bh=s0qaBHuFteWlvABZXLW5C5cxT0B6++QWKsEopA9hJhI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TZdi/Trfq+DScNTnqOzemNOSQgbYakegRINGHj61oeypYzrdBXy/wOoTqYUORnKMX
 XkNP6/n9bzRgyYbGMQBI6PMm0U0HvAFYQwFyKn+mOPIwTobn6HWEaVe6uvayo3MKX8
 UMbj/8J7k1e+nlGe4lL7yMBPR5vaHZ0R7WtUX4g4=
Date: Wed, 27 Nov 2019 14:50:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2384a9a6-200c-3243-6566-b3851338d8a6@citrix.com>
Message-ID: <alpine.DEB.2.21.1911271450170.27669@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1911271437420.27669@sstabellini-ThinkPad-T480s>
 <2384a9a6-200c-3243-6566-b3851338d8a6@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] RFC disable GCC 9 -Waddress-of-packed-member
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNyBOb3YgMjAxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8xMS8yMDE5
IDIyOjQ0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPgo+ID4gR0ND
IDkgaW50cm9kdWNlZCBhIG5ldyB3YXJuaW5nOiBhZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIuIEl0
IHdhcm5zIHdoZW4KPiA+IGEgcG9pbnRlciBwb2ludHMgdG8gYSBtZW1iZXIgb2YgYSBwYWNrZWQg
c3RydWN0LCBsZWFkaW5nIHRvIGEgYnVpbGQKPiA+IGZhaWx1cmUgaW4gWGVuIChjcm9zcyBjb21w
aWxpbmcgWGVuIG9uIEFybSB3aXRoIEdDQyA5LjIpOgo+ID4KPiA+ICAgNTU2IHRyYWNlLmM6IElu
IGZ1bmN0aW9uICdfX3RyYWNlX2h5cGVyY2FsbCc6Cj4gPiAgIDU1NyB0cmFjZS5jOjgyNjoxOTog
ZXJyb3I6IHRha2luZyBhZGRyZXNzIG9mIHBhY2tlZCBtZW1iZXIgb2YgJ3N0cnVjdCA8YW5vbnlt
b3VzPicgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRlciB2YWx1ZQo+ID4gWy1XZXJy
b3I9YWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQo+ID4gICA1NTggICA4MjYgfCAgICAgdWludDMy
X3QgKmEgPSBkLmFyZ3M7Cj4gPgo+ID4gTG9va2luZyBhdCB0aGUgY29kZSwgSSBjYW5ub3Qgc2Vl
IGFueXRoaW5nIHdyb25nIHdpdGggd2hhdCB3ZSBhcmUgZG9pbmcuCj4gPiBBdCBsZWFzdCBvbiBB
cm0sIGl0IGxvb2tzIE9LPyBBbnl0aGluZyBJIGFtIG1pc3Npbmc/Cj4gCj4gYy9zIDNmZDNiMjY2
ZDQgYXQgYSBndWVzcy4KClRoYW5rIHlvdSEgSSBtaXNzZWQgaXQgOi0vCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
