Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C93C1FAB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:01:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtNy-00079C-8V; Mon, 30 Sep 2019 10:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=599g=XZ=amazon.de=prvs=169b711c4=wipawel@srs-us1.protection.inumbo.net>)
 id 1iEtNw-000797-ML
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:58:32 +0000
X-Inumbo-ID: 3dfa4b28-e371-11e9-96ce-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 3dfa4b28-e371-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1569841112; x=1601377112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=PioLoSXAKUoJyniYA6TOYKTazNCZ8hyb6HpWSjwNpx0=;
 b=lg0jvK4p+8G4o8Yy5n1qiw7MfwFEExWiNNxR3dKxSgsxK1NdW384jNwY
 fpxhjOcPkCoWSTwdO8rBi/cysZiaOldgdovP0YzRXWUlYrwBi3x/ENxXu
 CLMSLLWKzUoZ0JTDv4I3CsqwJ+qwjd+JEXrt363LuucVPfAtOTNlxOkNL w=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754246387"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:58:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 74E27A250A; Mon, 30 Sep 2019 10:58:28 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:58:27 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:58:26 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 30 Sep 2019 10:58:26 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 10/12] livepatch: Handle arbitrary size names with the
 list operation
Thread-Index: AQHVdg9bbtYv/IKTRU+rPOPlG9ujl6dD7B6AgAAjuoA=
Date: Mon, 30 Sep 2019 10:58:26 +0000
Message-ID: <3529C51E-EB3D-4746-AA4F-3DFFB51FFA85@amazon.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-11-wipawel@amazon.de>
 <90b08bae-c883-2809-84aa-8bc85a368c0f@suse.com>
In-Reply-To: <90b08bae-c883-2809-84aa-8bc85a368c0f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.120]
Content-ID: <D5E0F8937B55D64F8C9FFCABC45F4B02@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 10/12] livepatch: Handle arbitrary size
 names with the list operation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMwLiBTZXAgMjAxOSwgYXQgMTA6NTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4gCj4gT24gMjguMDkuMjAxOSAxNzoxMywgUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+PiArKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPj4gQEAgLTkyNSwxMCArOTI1LDExIEBAIHN0cnVj
dCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9nZXQgewo+PiAgKgo+PiAKc25pcAo+PiAgICAgdWludDMy
X3QgcGFkOyAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIElOOiBNdXN0IGJlIHplcm8uICov
Cj4+ICsgICAgdWludDMyX3QgbmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAgIC8qIE9VVDog
VG90YWwgc2l6ZSBvZiBhbGwgdHJhbnNmZXIgbmFtZXMgKi8KPj4gICAgIFhFTl9HVUVTVF9IQU5E
TEVfNjQoeGVuX2xpdmVwYXRjaF9zdGF0dXNfdCkgc3RhdHVzOyAgLyogT1VULiBNdXN0IGhhdmUg
ZW5vdWdoCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3BhY2UgYWxsb2NhdGUgZm9yIG5yIG9mIHRoZW0uICovCj4+ICAgICBYRU5fR1VFU1RfSEFORExF
XzY0KGNoYXIpIG5hbWU7ICAgICAgICAgLyogT1VUOiBBcnJheSBvZiBuYW1lcy4gRWFjaCBtZW1i
ZXIKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVVT
VCBYRU5fTElWRVBBVENIX05BTUVfU0laRSBpbiBzaXplLgo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNdXN0IGhhdmUgbnIgb2YgdGhlbS4gKi8KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF5IGhhdmUg
YW4gYXJiaXRyYXJ5IGxlbmd0aCB1cCB0bwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYRU5fTElWRVBBVENIX05BTUVfU0laRSBieXRlcy4gTXVzdCBo
YXZlCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5y
IG9mIHRoZW0uICovCj4+ICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgbGVuOyAgICAg
ICAgLyogT1VUOiBBcnJheSBvZiBsZW5ndGhzIG9mIG5hbWUncy4KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNdXN0IGhhdmUgbnIgb2YgdGhlbS4gKi8K
Pj4gfTsKPiAKPiBOb24tYmluYXJ5LWNvbXBhdGlibGUgY2hhbmdlcyByZXF1aXJlIGFuIGludGVy
ZmFjZSB2ZXJzaW9uIGJ1bXAuCgpUaGUgYnVtcCBoYXBwZW5zIHdpdGggdGhpcyBwYXRjaCBvZiB0
aGUgcGF0Y2hzZXQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjU0Mjcv
Cgo+IEkgd29uZGVyIHRob3VnaCB3aHkgeW91IGRvbid0IHVzZSB0aGUgInBhZCIgZmllbGQ7IGlu
IGZhY3QgdGhlCj4gd2F5IHlvdSBtYWtlIHRoZSBjaGFuZ2UgeW91J2QgaGF2ZSB0byBpbnRyb2R1
Y2UgYSAybmQgcGFkZGluZwo+IGZpZWxkLCB0byBtYWtlIHBhZGRpbmcgZXhwbGljaXQgX2FuZF8g
Y2hlY2sgaXQncyB6ZXJvIG9uIGlucHV0Cj4gKGZvciBmdXR1cmUgZXh0ZW5zaWJpbGl0eSBfd2l0
aG91dF8gaGF2aW5nIHRvIGJ1bXAgdGhlIGludGVyZmFjZQo+IHZlcnNpb24pLgo+IAoKSSBkbyBu
b3QgdXNlIHRoZSBwYWQgZmllbGQgYmVjYXVzZSBJIGludHJvZHVjZSBhbm90aGVyIGZpZWxkIHdp
dGggdGhlCm5leHQgcGF0Y2ggb2YgdGhlIHBhdGNoc2V0OiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzExMTY1NDMzLwpUaGVuIEkgd291bGQgaGF2ZSB0byByZS1hZGQgdGhlIHBh
ZCBmaWVsZCBhZ2FpbiBJIHN1cHBvc2UuCkFsc28sIEkgd2FzIChmYWxzZT8pIGltcHJlc3Npb24g
dGhhdCB0aGUgcGFkIGZpZWxkIGlzIGRlZGljYXRlZCB0bwp0aGUgZnV0dXJlIGlucHV0IHBhcmFt
ZXRlcnMsIHNvIEkgc2hvdWxkIG5vdCB0b3VjaCBpdC4KCj4gSmFuCgpCZXN0IFJlZ2FyZHMsClBh
d2VsIFdpZWN6b3JraWV3aWN6CgoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENo
cmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmlj
aHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6
IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
