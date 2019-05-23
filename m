Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08F27FFE
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 16:41:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hToqd-0000yl-KV; Thu, 23 May 2019 14:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hToqc-0000yf-Ht
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 14:37:34 +0000
X-Inumbo-ID: 4bbd2ad8-7d68-11e9-94e7-e31d25d47985
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bbd2ad8-7d68-11e9-94e7-e31d25d47985;
 Thu, 23 May 2019 14:37:31 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 5Efy01vmvlYQej/g2tSW6pIEmf+Gdqlmhg5fcoyMdGvjPeKZy0Fb1E/hp5BD8aKxrwuPgf78IZ
 wyVp7h1tCVus86S2+aGWnOaOClX0/Vqmicvpue3ZMeuOJhZ72qTBD42o/1jTBBaOd+NkmR9xYC
 J0II9BUBytDZLTyGaWww4hV0xKcb1y+rRYHxjizi7kz5v/C4jlSUa1dH5vGu7eex+7Ke4FPK9g
 gJ/PHKy/FKr0UQ0rKhVJ1vAtZPIXk/MJXd3yoWSgo1VpdurfXFrDoYNlMcsU8wsaYKrhUJabCL
 VPY=
X-SBRS: 2.7
X-MesageID: 832289
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,503,1549947600"; 
   d="scan'208";a="832289"
Date: Thu, 23 May 2019 15:37:01 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190523143701.GG2373@zion.uk.xensource.com>
References: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
 <20190523142033.GF2373@zion.uk.xensource.com>
 <30ea972e-f693-e223-ae46-8bef2d0714a2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30ea972e-f693-e223-ae46-8bef2d0714a2@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/IO-APIC: fix build with gcc9
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDM6MzU6MDFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMy8wNS8yMDE5IDE1OjIwLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVGh1LCBN
YXkgMjMsIDIwMTkgYXQgMDc6NTQ6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4g
VGhlcmUgYXJlIGEgbnVtYmVyIG9mIHBvaW50bGVzcyBfX3BhY2tlZCBhdHRyaWJ1dGVzIHdoaWNo
IGNhdXNlIGdjYyA5IHRvCj4gPj4gbGVnaXRpbWF0ZWx5IHdhcm46Cj4gPj4KPiA+PiB1dGlscy5j
OiBJbiBmdW5jdGlvbiAndnRkX2R1bXBfaW9tbXVfaW5mbyc6Cj4gPj4gdXRpbHMuYzoyODc6MzM6
IGVycm9yOiBjb252ZXJ0aW5nIGEgcGFja2VkICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeScg
cG9pbnRlciAoYWxpZ25tZW50IDEpIHRvIGEgJ3N0cnVjdCBJT19BUElDX3JvdXRlX3JlbWFwX2Vu
dHJ5JyBwb2ludGVyIChhbGlnbm1lbnQgOCkgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9p
bnRlciB2YWx1ZSBbLVdlcnJvcj1hZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXJdCj4gPj4gICAyODcg
fCAgICAgICAgICAgICAgICAgcmVtYXAgPSAoc3RydWN0IElPX0FQSUNfcm91dGVfcmVtYXBfZW50
cnkgKikgJnJ0ZTsKPiA+PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4+Cj4gPj4gaW50cmVtYXAuYzogSW4gZnVuY3Rp
b24gJ2lvYXBpY19ydGVfdG9fcmVtYXBfZW50cnknOgo+ID4+IGludHJlbWFwLmM6MzQzOjI1OiBl
cnJvcjogY29udmVydGluZyBhIHBhY2tlZCAnc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnknIHBv
aW50ZXIgKGFsaWdubWVudCAxKSB0byBhICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRy
eScgcG9pbnRlciAoYWxpZ25tZW50IDgpIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50
ZXIgdmFsdWUgWy1XZXJyb3I9YWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQo+ID4+ICAgMzQzIHwg
ICAgIHJlbWFwX3J0ZSA9IChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeSAqKSBvbGRf
cnRlOwo+ID4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+ID4+Cj4gPj4gU2ltcGx5IGRyb3AgdGhlc2UgYXR0cmlidXRlcy4gVGFrZSB0
aGUgbGliZXJ0eSBhbmQgYWxzbyByZS1mb3JtYXQgdGhlCj4gPj4gc3RydWN0dXJlIGRlZmluaXRp
b25zIGF0IHRoZSBzYW1lIHRpbWUuCj4gPj4KPiA+PiBSZXBvcnRlZC1ieTogQ2hhcmxlcyBBcm5v
bGQgPGNhcm5vbGRAc3VzZS5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gCj4gSSd2ZSBnb3QgYW5vdGhlciBpZGVudGljYWwgcGF0Y2ggd2hpY2ggSSBo
YWRuJ3QgZ290IGFyb3VuZCB0byBzZW5kaW5nCj4gdXBzdHJlYW0uCj4gCj4gV2UndmUgZ290IGZ1
cnRoZXIgaXNzdWVzIHdpdGggVUJTQU4uwqAgV2hpbGUgSSd2ZSBnb3QgdGhlIEFQSSBmaXhlcwo+
IHNvcnRlZCwgdGhlIHJlc3V0bGluZyBiaW5hcnkgY3Jhc2hlcyBhbG1vc3QgaW1tZWRpYXRlbHkg
b24gYm9vdCBhbmQgSQo+IGhhdmVuJ3QgZmlndXJlZCBvdXQgd2h5IHlldC4KClByb2JhYmx5IG1v
cmUgbWlzc2VkIGZpbHRlcmluZyAtLSB5b3UgZG9uJ3Qgd2FudCBlYXJseSBib290IGNvZGUgdG8g
Z2V0CmNvbXBpbGVkIHdpdGggVUJTQU4gZW5hYmxlZC4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
