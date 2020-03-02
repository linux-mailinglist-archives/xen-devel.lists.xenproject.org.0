Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E001756AB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:14:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8h6N-0002Wo-Cw; Mon, 02 Mar 2020 09:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8h6M-0002Wj-3e
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:11:02 +0000
X-Inumbo-ID: bc7f8dec-5c65-11ea-8e51-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc7f8dec-5c65-11ea-8e51-bc764e2007e4;
 Mon, 02 Mar 2020 09:11:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6043AF2D;
 Mon,  2 Mar 2020 09:11:00 +0000 (UTC)
To: Yan Yankovskyi <yyankovskyi@gmail.com>
References: <20200229223035.GA28145@kbp1-lhp-F74019>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
Date: Mon, 2 Mar 2020 10:11:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229223035.GA28145@kbp1-lhp-F74019>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Use 'unsigned int' instead of
 'unsigned'
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDIuMjAyMCAyMzozMCwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gUmVzb2x2ZSB0aGUg
Zm9sbG93aW5nIHdhcm5pbmcsIHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2gucGw6Cj4gV0FSTklORzog
UHJlZmVyICd1bnNpZ25lZCBpbnQnIHRvIGJhcmUgdXNlIG9mICd1bnNpZ25lZCcKPiAKPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4KCklNTyBhIGNoYW5nZSBsaWtlIHRoaXMgd291bGQgaWRlYWxseSBn
byBhIGxpdHRsZSBmdXJ0aGVyIGFuZCB0cnkKdG8gdXNlIHRoZSBhY3R1YWxseSBkZXNpZ25hdGVk
IHR5cGVzIHdoZW4gYWRqdXN0aW5nIHRoZW0gYW55d2F5LAplLmcuIC4uLgoKPiAtLS0gYS9kcml2
ZXJzL3hlbi9ldmVudHMvZXZlbnRzXzJsLmMKPiArKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZl
bnRzXzJsLmMKPiBAQCAtNDIsNDggKzQyLDQ4IEBACj4gIAo+ICBzdGF0aWMgREVGSU5FX1BFUl9D
UFUoeGVuX3Vsb25nX3QgW0VWVENITl9NQVNLX1NJWkVdLCBjcHVfZXZ0Y2huX21hc2spOwo+ICAK
PiAtc3RhdGljIHVuc2lnbmVkIGV2dGNobl8ybF9tYXhfY2hhbm5lbHModm9pZCkKPiArc3RhdGlj
IHVuc2lnbmVkIGludCBldnRjaG5fMmxfbWF4X2NoYW5uZWxzKHZvaWQpCj4gIHsKPiAgCXJldHVy
biBFVlRDSE5fMkxfTlJfQ0hBTk5FTFM7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGV2dGNobl8y
bF9iaW5kX3RvX2NwdShzdHJ1Y3QgaXJxX2luZm8gKmluZm8sIHVuc2lnbmVkIGNwdSkKPiArc3Rh
dGljIHZvaWQgZXZ0Y2huXzJsX2JpbmRfdG9fY3B1KHN0cnVjdCBpcnFfaW5mbyAqaW5mbywgdW5z
aWduZWQgaW50IGNwdSkKPiAgewo+ICAJY2xlYXJfYml0KGluZm8tPmV2dGNobiwgQk0ocGVyX2Nw
dShjcHVfZXZ0Y2huX21hc2ssIGluZm8tPmNwdSkpKTsKPiAgCXNldF9iaXQoaW5mby0+ZXZ0Y2hu
LCBCTShwZXJfY3B1KGNwdV9ldnRjaG5fbWFzaywgY3B1KSkpOwo+ICB9Cj4gIAo+IC1zdGF0aWMg
dm9pZCBldnRjaG5fMmxfY2xlYXJfcGVuZGluZyh1bnNpZ25lZCBwb3J0KQo+ICtzdGF0aWMgdm9p
ZCBldnRjaG5fMmxfY2xlYXJfcGVuZGluZyh1bnNpZ25lZCBpbnQgcG9ydCkKCi4uLiBldnRjaG5f
cG9ydF90IGhlcmUgYW5kIGVsc2V3aGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
