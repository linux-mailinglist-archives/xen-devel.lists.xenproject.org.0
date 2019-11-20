Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4D1037FB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:52:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXNYk-0006ra-5T; Wed, 20 Nov 2019 10:50:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rUCm=ZM=amazon.com=prvs=220eb40af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iXNYi-0006fR-Fr
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:50:04 +0000
X-Inumbo-ID: 7ef01894-0b83-11ea-a30e-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ef01894-0b83-11ea-a30e-12813bfff9fa;
 Wed, 20 Nov 2019 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574246999; x=1605782999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WX4G3ouBXDyP3cFQEdCRTZWLTn39WaIEPqf9WMDSnH0=;
 b=e6KLP8U3TJ6KiRpw3TEgDWN5VvncUQTp1mw2B9aBkWsyiI/nhi/lHsy1
 f5MImBc/i6IVaL0lzS9vPwti7yJCOTBvQwZSxYD4Rr4flFuvqa2gjZK+l
 Aj2KaiUB2JYSFr+ZHzmLD89WeajOBA+05LaafDnWoDEHegWtf7aPW31B0 s=;
IronPort-SDR: 7znlqwwl/Egm+YrsHK3q3vvgvKt773D7NE67Gtw7r/epSJ9drkT6+/O5G9z5UwsMxQ4OSKt53H
 CzUqoAxaijjA==
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; 
   d="scan'208";a="5417730"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 20 Nov 2019 10:49:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id F2C25A2776; Wed, 20 Nov 2019 10:49:28 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 10:49:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 10:49:27 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 20 Nov 2019 10:49:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] grant table size
Thread-Index: AdWfhQwGXUKIxbF7Q62ckygVPo3ZWwABR/+AAAFd68A=
Date: Wed, 20 Nov 2019 10:49:27 +0000
Message-ID: <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
 <20191120100627.GP72134@Air-de-Roger>
In-Reply-To: <20191120100627.GP72134@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] grant table size
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMTkgMTE6MDYKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIGdyYW50IHRhYmxlIHNp
emUKPiAKPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwOTo0Mzo1OUFNICswMDAwLCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+ID4gSSd2ZSBkZWFsdCB3aXRoIGEgZmV3IHByb2JsZW1zIG92ZXIgdGhl
IHllYXJzIHdoZXJlIHRoZSByb290IGNhdXNlIHdhcyBhCj4gZ3Vlc3QgcnVubmluZyBvdXQgb2Yg
Z3JhbnQgdGFibGUgYW5kIHNvIEknbSB3b25kZXJpbmcgd2hldGhlciBpdCB3b3VsZCBiZQo+IGEg
Z29vZCBpZGVhIHRvIGFsbG93IGEgdG9vbHN0YWNrIHRvIGluY3JlYXNlIHRoZSB0YWJsZSBzaXpl
IG9mIGEgcnVubmluZwo+IGd1ZXN0LCBlLmcuIHdoZW4gcGx1Z2dpbmcgaW4gYSBuZXcgUFYgaW50
ZXJmYWNlLgo+IEkgd291bGQgcmF0aGVyIGhhdmUgYSBuZXcgeGwgY29tbWFuZCB0aGF0IGRvZXMg
dGhlIGdyYW50IHRhYmxlCj4gaW5jcmVhc2UgKGllOiB4bCBzZXQtbWF4LWdyYW50LWZyYW1lcykg
aW5zdGVhZCBvZiBkb2luZyBpdCB3aGVuCj4gcGx1Z2dpbmcgbmV3IGludGVyZmFjZXMuCj4KClRo
YXQgd291bGQgYmUgb2sgdG9vLi4uIEp1c3QgdGhvdWdodCBpdCBtaWdodCBiZSBuaWNlciBpZiBp
dCB3ZXJlIGF1dG9tYXRpYyBidXQgaXQgd291bGQgaW5kZWVkIGJlIGNvbXBsZXRlIGd1ZXNzLXdv
cmsgaW4gbGlieGwgdG8gY29tZSB1cCB3aXRoIGEgcGVyLWludGVyZmFjZSBncmFudCB0YWJsZSBx
dW90YS4KIAo+ID4gSXQgd291bGQgYXBwZWFyIHRoYXQgY3VycmVudCBMaW51eCBndWVzdHMgd291
bGQgbm90IGJlIGFibGUgdG8gbWFrZSB1c2UKPiBvZiB0aGlzIGFzIGl0IHN0YW5kcyAoYnV0IHRo
YXQgY291bGQgYmUgZml4ZWQpLCBidXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwgYQo+IHB2b3BzIGtl
cm5lbCB3b3VsZCBub3QgbWlzYmVoYXZlIGlmIHRoZSBtYXhpbXVtIHRhYmxlIHNpemUgd2VyZSB0
bwo+IGluY3JlYXNlLiBTaW1pbGFybHkgV2luZG93cyBQViBkcml2ZXJzIHdvdWxkIG5lZWQgbW9k
aWZpY2F0aW9uIHRvIG1ha2UgdXNlCj4gb2YgYSBkeW5hbWljIG1heGltdW0gdGFibGUgc2l6ZSBi
dXQgd291bGQgbm90IG1pc2JlaGF2ZSBhcyBpcy4KPiA+IERvZXMgYW55b25lIGhhdmUgYW55IG9i
amVjdGlvbiB0byB0aGUgaWRlYT8KPiAKPiBEbyB5b3UgaGF2ZSBpbiBtaW5kIHRvIHNpZ25hbCB0
aGlzIHNvbWVob3cgdG8gZ3Vlc3RzLCBvciB0aGUKPiBleHBlY3RhdGlvbiBpcyB0aGF0IHRoZSBn
dWVzdCB3aWxsIGhhdmUgdG8gcG9sbCBHTlRUQUJPUF9xdWVyeV9zaXplCj4gYW5kIGF0IHNvbWUg
cG9pbnQgdGhlIHNpemUgd2lsbCBpbmNyZWFzZT8KPiAKCkkgZG9uJ3QgdGhpbmsgdGhlIGd1ZXN0
IG5lZWQgY2FyZSB1bnRpbCBpdHMgZ3JhbnQgdGFibGUgZ3Jvd3MgdG8gdGhlIG1heC4gQXQgdGhh
dCBwb2ludCwgcmF0aGVyIHRoYW4gZ2l2aW5nIHVwLCB0aGUgZ3Vlc3Qgd291bGQgcmUtcXVlcnkg
dGhlIG1heCB2YWx1ZSB0byBzZWUgaWYgdGhlcmUgaXMgbm93IG1vcmUgaGVhZHJvb20gYW5kIHRo
ZW4gcmUtc2l6ZSBpdHMgaW50ZXJuYWwgZGF0YSBzdHJ1Y3R1cmVzIGFjY29yZGluZ2x5LgoKICBQ
YXVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
