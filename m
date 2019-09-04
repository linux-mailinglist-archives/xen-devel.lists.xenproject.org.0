Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA77A867A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 18:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Xt8-0002td-Fs; Wed, 04 Sep 2019 16:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Xt7-0002tY-J5
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 16:12:05 +0000
X-Inumbo-ID: bbe2c6fc-cf2e-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbe2c6fc-cf2e-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 16:12:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C4C7AE6F;
 Wed,  4 Sep 2019 16:12:03 +0000 (UTC)
To: Daniel Smith <dpsmith.dev@gmail.com>, xen-devel@lists.xenproject.org
References: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2e2293bc-4187-3fe8-52d6-96f709ae4c3c@suse.com>
Date: Wed, 4 Sep 2019 18:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Running xenstored in Linux stubdom
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTc6NDUsIERhbmllbCBTbWl0aCB3cm90ZToKPiBHcmVldGluZ3MsCj4gCj4g
SSBhbSBhdHRlbXB0aW5nIHRvIHNlZSBpZiBJIGNhbiBnZXQgeGVuc3RvcmVkIHRvIHJ1biB3aXRo
aW4gYSBMaW51eAo+IHN0dWJkb20gZm9yIGEgdmFyaWV0eSBvZiByZWFzb25zLiBUaGUgd2F5IEkg
aGF2ZSBpdCBjb25zdHJ1Y3RlZCBhdAo+IHRoaXMgcG9pbnQgaXMgdGhhdCBlbWJlZGRlZCB3aXRo
aW4gdGhlIGluaXRyYW1mcyBvZiBkb20wIGlzIHRoZSBsaW51eAo+IHN0dWJkb20gaW1hZ2UgYWxv
bmcgd2l0aCB0aGUgaW5pdC14ZW5zdG9yZS1kb21haW4gaGVscGVyLiBUaGUgaW5pdAo+IHNjcmlw
dCB3aXRoaW4gdGhlIGluaXRyYW1mcyBkb2VzIGJhc2ljIExpbnV4IHN0YXJ0IHNldHVwLCBsYXVu
Y2hlcwo+IHVkZXYgYW5kIHRoZW4gYXR0ZW1wdHMgdG8gc3RhcnQgdGhlIHN0dWJkb20gdXNpbmcg
dGhlIGhlbHBlciBiaW5hcnkuCj4gVGhlIGhlbHBlciBiaW5hcnkgaGFuZ3MgYW5kIHVzaW5nIHN0
cmFjZSBzaG93cyB0aGUgbGFzdCBjYWxscyBiZWZvcmUKPiBoYW5naW5nIGlzLAo+IAo+IHdyaXRl
KDMsICIvdG9vbC94ZW5zdG9yZWQvZG9taWRcMDosIDIyKSA9IDIyCj4gd3JpdGUoMywgIjEiLCAx
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAxCj4gcmVhZCgzLAo+IAo+
IEZvciB0aGUgc3R1YmRvbSBpdHNlbGYsIGl0cyBpbml0IHNjcmlwdCBkb2VzIHRoZSBiYXNpYyBM
aW51eCBzdGFydAo+IHNldHVwIGFuZCB0aGVuIGV4ZWN1dGVzIHhlbnN0b3JlZCBpbiBmb3JlZ3Jv
dW5kLiBJIGhhdmUgdGVzdGVkIHRoZQo+IHN0dWJkb20gYXMgYSByZWd1bGFyIGd1ZXN0IHBhc3Np
bmcgdGhlIC0tbm8tZG9tYWluLWluaXQgZmxhZyBhbmQgSSBzZWUKPiBubyBpc3N1ZXMgd2l0aCB0
aGUgZG9tYWluIHN0YXJ0aW5nIGFuZCBsYXVuY2hpbmcgeGVuc3RvcmVkLgo+IAo+IEZvciBhIHBv
aW50IG9mIHJlZmVyZW5jZSwgSSBoYXZlIGJlZW4gYWJsZSB0byBzdWNjZXNzZnVsbHkgdXNlIHRo
ZQo+IG1pbmlvcyBzdHViZG9tIGluIHBsYWNlIG9mIHRoZSBMaW51eCBzdHViZG9tLiBJIGhhdmUg
YmVlbiByZXZpZXdpbmcKPiB0aGUgbWluaW9zIHZlcnNpb24gdG8gc2VlIHdoYXQgSSBtaWdodCBi
ZSBtaXNzaW5nIGluIHRoZSBMSW51eCB2ZXJzaW9uCj4gdG8gbm8gYXZhaWwuIFBlcmhhcHMgb3Ro
ZXJzIG1heSBoYXZlIGluc2lnaHQgb24gd2hhdCB0aGUgaXNzdWUgbWF5IGJlLgoKVGhlIHN0dWJk
b20gZ2V0cyBhbiBldmVudCBjaGFubmVsIHRvIHVzZSBmb3IgZG9tMCB4ZW5ic3RvcmUgY29ubmVj
dGlvbgp2aWEgY29tbWFuZGxpbmUgcGFyYW1ldGVyICgiLS1ldmVudCA8ZXZlbnQtbnI+IikuIFRo
aXMgbmVlZHMgdG8gYmUgdXNlZAppbiB0aGUgc3R1YmRvbSBmb3Igc2V0dGluZyB1cCB0aGUgY29t
bXVuaWNhdGlvbiBwYXRoLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
