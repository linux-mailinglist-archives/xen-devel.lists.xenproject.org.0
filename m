Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5ECAD95B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 14:49:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7J4P-0008Cc-8S; Mon, 09 Sep 2019 12:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7J4N-0008CV-OY
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:46:59 +0000
X-Inumbo-ID: e8bfc9cb-d2ff-11e9-ac0b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8bfc9cb-d2ff-11e9-ac0b-12813bfff9fa;
 Mon, 09 Sep 2019 12:46:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD176AF78;
 Mon,  9 Sep 2019 12:46:57 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190906124103.8535-1-jgross@suse.com>
 <23926.18558.942759.385214@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2f367801-06e2-8abe-792e-03cfc2d940f0@suse.com>
Date: Mon, 9 Sep 2019 14:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23926.18558.942759.385214@mariner.uk.xensource.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2] tools/libs: put common Makefile parts
 into new libs.mk
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTQ6NDEsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiW1BBVENIIHYyXSB0b29scy9saWJzOiBwdXQgY29tbW9uIE1ha2VmaWxlIHBhcnRzIGlu
dG8gbmV3IGxpYnMubWsiKToKPj4gVGhlIE1ha2VmaWxlIGJlbG93IHRvb2xzL2xpYnMgaGF2ZSBh
IGxvdCBpbiBjb21tb24uIFB1dCB0aG9zZSBjb21tb24KPj4gcGFydHMgaW50byBhIG5ldyBsaWJz
Lm1rIGFuZCBpbmNsdWRlIHRoYXQgZnJvbSB0aGUgc3BlY2lmaWMgTWFrZWZpbGVzLgo+IC4uLgo+
PiAgIHRvb2xzL2xpYnMvY2FsbC9NYWtlZmlsZSAgICAgICAgICB8IDg2ICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgdG9vbHMvbGlicy9kZXZpY2Vtb2RlbC9NYWtlZmls
ZSAgIHwgODggKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgdG9vbHMv
bGlicy9ldnRjaG4vTWFrZWZpbGUgICAgICAgIHwgODYgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4gICB0b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvTWFrZWZpbGUgfCA4NiAr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIHRvb2xzL2xpYnMvZ250dGFi
L01ha2VmaWxlICAgICAgICB8IDg2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+ICAgdG9vbHMvbGlicy9saWJzLm1rICAgICAgICAgICAgICAgIHwgOTUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgdG9vbHMvbGlicy90b29sY29yZS9NYWtl
ZmlsZSAgICAgIHwgODUgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICB0
b29scy9saWJzL3Rvb2xsb2cvTWFrZWZpbGUgICAgICAgfCA4NCArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gCj4gV293LCBpbXByZXNzaXZlIQo+IAo+IEhhdmUgeW91IGRvbmUg
YW55IGNoZWNrcyB0aGF0IHRoZSByZXN1bHRzIGFyZSBpZGVudGljYWwgKG9yLCBJIGd1ZXNzLAo+
IHN1ZmZpY2llbnRseSBzaW1pbGFyKSA/ICAoSWYgb25seSB3ZSBoYWQgYSByZXByb2R1Y2libGUg
YnVpbGQuLi4pCgpJIGNoZWNrZWQgdGhlIHJlc3VsdGluZyBsaWJyYXJpZXMgdG8gYmUgbG9hZGVk
IGNvcnJlY3RseSwgYW5kIHZlcmlmaWVkCnRoZSAqLnBjIGZpbGVzIHRvIGJlIHRoZSBzYW1lLgoK
Ckp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
