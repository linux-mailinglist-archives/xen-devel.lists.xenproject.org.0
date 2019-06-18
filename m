Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D4D4A234
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 15:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdEA1-0005Px-9N; Tue, 18 Jun 2019 13:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Le+r=UR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdEA0-0005Po-1T
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 13:28:28 +0000
X-Inumbo-ID: f2a30a70-91cc-11e9-9c8c-876c36bb7127
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2a30a70-91cc-11e9-9c8c-876c36bb7127;
 Tue, 18 Jun 2019 13:28:24 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GJAkarTw+EyEJ0bhkzik5wONj22yKyiAHjQLRfLivjF+BIkWAHAWj/ZpgP6cxe1JzetuEwTNPs
 85J6f8qKuCgV4GsU1MNRLSv5vIzwnA72RDk1+Qt9umvywHKue1YEPo6GK8hb9iB7pJMM3jCDQE
 i5OMvWpxzTbTsKXPGBQfa+Hjs0N92TINNmbqXfaCTW9k1bvU0CKxdanwE52pQwbqTw/cy5dWkJ
 Xip/9h+w59FgRykRCUgUqhU4qVVTpGejO4kgxLPkwWmnbe5iOWCHxr26rz1K4MGxdYOmRUJM/R
 Uzg=
X-SBRS: 2.7
X-MesageID: 1867762
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1867762"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024F7C0200007800237E7F@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <29ac168c-f8d0-1069-61c4-4c13857fc042@citrix.com>
Date: Tue, 18 Jun 2019 14:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D024F7C0200007800237E7F@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC 9/9] AMD/IOMMU: correct IRTE updating
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDYvMjAxOSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgZm9yIDMyLWJp
dCBJUlRFcyBJIHRoaW5rIHdlIGNhbiBzYWZlbHkgY29udGludWUgdG8gYXNzdW1lIHRoYXQgdGhl
Cj4gd3JpdGVzIHdpbGwgdHJhbnNsYXRlIHRvIGEgc2luZ2xlIE1PViwgdGhlIHVzZSBvZiBDTVBY
Q0hHMTZCIGlzIG1vcmUKPiBoZWF2eSBoYW5kZWQgdGhhbiBuZWNlc3NhcnkgZm9yIHRoZSAxMjgt
Yml0IGZvcm0sIGFuZCB0aGUgZmx1c2hpbmcKPiBkaWRuJ3QgZ2V0IGRvbmUgYWxvbmcgdGhlIGxp
bmVzIG9mIHdoYXQgdGhlIHNwZWNpZmljYXRpb24gc2F5cy4gTWFyawo+IGVudHJpZXMgdG8gYmUg
dXBkYXRlZCBhcyBub3QgcmVtYXBwZWQgKHdoaWNoIHdpbGwgcmVzdWx0IGluIGludGVycnVwdAo+
IHJlcXVlc3RzIHRvIGdldCB0YXJnZXQgYWJvcnRlZCwgYnV0IHRoZSBpbnRlcnJ1cHRzIHNob3Vs
ZCBiZSBtYXNrZWQKPiBhbnl3YXkgYXQgdGhhdCBwb2ludCBpbiB0aW1lKSwgaXNzdWUgdGhlIGZs
dXNoLCBhbmQgb25seSB0aGVuIHdyaXRlIHRoZQo+IG5ldyBlbnRyeS4gSW4gdGhlIDEyOC1iaXQg
SVJURSBjYXNlIHNldCBSZW1hcEVuIHNlcGFyYXRlbHkgbGFzdCwgdG8gdGhhdAo+IHRoZSBvcmRl
cmluZyBvZiB0aGUgd3JpdGVzIG9mIHRoZSB0d28gNjQtYml0IGhhbHZlcyB3b24ndCBtYXR0ZXIu
Cj4KPiBJbiB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9tc2lfbXNnKCkgYWxzbyBmb2xkIHRo
ZSBkdXBsaWNhdGUgaW5pdGlhbAo+IGxvY2sgZGV0ZXJtaW5hdGlvbiBhbmQgYWNxdWlyZSBpbnRv
IGp1c3QgYSBzaW5nbGUgaW5zdGFuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpMb29raW5nIGF0IHRoaXMgcGF0Y2gsIEkgdGhpbmsgcXVpdGUg
YSBiaXQgb2YgaXQgc2hvdWxkIGJlIGZvbGRlZCBpbnRvCnBhdGNoIDQuwqAgSG93ZXZlciwgbXkg
cmV2aWV3IHN1Z2dlc3Rpb25zIG9uIHRoYXQgcGF0Y2ggdGFrZSBwcmVjZWRlbnQKb3ZlciB0aGUg
bmV0IHJlc3VsdCBoZXJlLgoKPiAtLS0KPiBSRkM6IFB1dHRpbmcgdGhlIGZsdXNoIGludm9jYXRp
b25zIGluIGxvb3BzIGlzbid0IG92ZXJseSBuaWNlLCBidXQgSQo+ICAgICAgZG9uJ3QgdGhpbmsg
dGhpcyBjYW4gcmVhbGx5IGJlIGFidXNlZCwgc2luY2UgY2FsbGVycyB1cCB0aGUgc3RhY2sKPiAg
ICAgIGhvbGQgZnVydGhlciBsb2Nrcy4gTmV2ZXJ0aGVsZXNzIEknZCBsaWtlIHRvIGFzayBmb3Ig
YmV0dGVyCj4gICAgICBzdWdnZXN0aW9ucy4KCkxldHMgZm9jdXMgb24gZ2V0dGluZyBpdCBmdW5j
dGlvbmluZyBmaXJzdCwgYW5kIGZhc3Qgc2Vjb25kLsKgIEhvd2V2ZXIsIEkKdGhpbmsgd2UgY2Fu
IGRvIGJldHRlciB0aGFuIHRoZSBsb29wLsKgIExldCBtZSBkaWcgc29tZSBub3RlcyBvdXQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
