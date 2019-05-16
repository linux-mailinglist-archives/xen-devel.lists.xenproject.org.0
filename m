Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC842047A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREQG-0000WO-PI; Thu, 16 May 2019 11:19:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nM/z=TQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hREQF-0000WG-4X
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:19:39 +0000
X-Inumbo-ID: 7d4c529e-77cc-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d4c529e-77cc-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:19:37 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: CP2aE9+mzfTe11IwEWkvptX1R4ob6n3ZdJQhMwKAG46pheN2inS5ArBbfu2zuizOPjtr8PdSc5
 qZp57iP1qZYM559V6HBXU4uZ0rD5+j8ace7blIUob+k5RNXVRXG0xco3Lncj0vN8fky9A9TRXj
 rdZDtEAakY1M2Wr+FP2JR8YVpLSiHAr2NMaEe2izlGa4VpmQkFtg0Z67EyMt40Z2JrqwHdhBzF
 7RQPDIxZFMC7f4OqKH1hq+drZBSkj02Vy5pZUa2ERbqc/384c+I6HxSyP9IeUH5D7SFFtcMeFw
 F+8=
X-SBRS: 2.7
X-MesageID: 514162
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="514162"
Date: Thu, 16 May 2019 12:19:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <20190516111929.GC5438@perard.uk.xensource.com>
References: <osstest-136181-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-136181-mainreport@xen.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [qemu-upstream-4.10-testing test] 136181: FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDU6NDM6NDRQTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzYxODEgcWVtdS11cHN0cmVhbS00LjEwLXRlc3Rpbmcg
cmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTM2MTgxLwo+IAo+IEZhaWx1cmVzIGFuZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAo+
IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICBidWlsZC1hcm02NC1wdm9wcyAg
ICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ1
ODAKPiAgYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAg
ICAgICAgICAgIGJyb2tlbiAgaW4gMTM0NTgwCj4gIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAg
ICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDU4MAo+ICBi
dWlsZC1hcm02NC14c20gICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gaW4gMTM0
NTgwIFJFR1IuIHZzLiAxMjQ5MjEKPiAgYnVpbGQtYXJtNjQtcHZvcHMgICAgICAgICAgNCBob3N0
LWluc3RhbGwoNCkgYnJva2VuIGluIDEzNDU4MCBSRUdSLiB2cy4gMTI0OTIxCj4gIGJ1aWxkLWFy
bTY0ICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1ODAgUkVH
Ui4gdnMuIDEyNDkyMQo+IAo+IFRlc3RzIHdoaWNoIGFyZSBmYWlsaW5nIGludGVybWl0dGVudGx5
IChub3QgYmxvY2tpbmcpOgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFjb3cyICAgIDE3IGd1ZXN0
LWxvY2FsbWlncmF0ZS94MTAgICAgIGZhaWwgcGFzcyBpbiAxMzQ1ODAKCklhbiwgSSBkb24ndCB0
aGluayBJIHVuZGVyc3RhbmQgb3NzdGVzdCdzIHJlYXNvbm5pbmcgaGVyZS4KCkRvZXMgdGhlIHJl
cG9ydCBzYXlzIHRoYXQgdGhlICdob3N0LWluc3RhbGwnIGZhaWx1cmUgdGhhdCBoYXBwZW4gYSBs
b29uZwp0aW1lIGFnbyAod2l0aCBhIGRpZmZlcmVudCBvc3N0ZXN0KSBpcyBibG9ja2luZz8KQnV0
IHRoYXQgdGhlIC1xY293MiB0ZXN0IHdoaWNoIG5vdyBrZWVwcyBmYWlsaW5nIGlzbid0IGJsb2Nr
aW5nPwoKQW55d2F5LCB0aGUgKmFybTY0KiB0ZXN0cyBzdWNjZWVkLCBhbmQgdGhlICpxY293MiB0
ZXN0IGtlZXBzIGZhaWxpbmcuCkJ1dCB0aGUgcWNvdzIgaXNzdWUgc2VlbXMgdG8gYmUgYSBndWVz
dCBrZXJuZWwgdGhyZWFkIGZhaWxpbmcgdG8Kc3VzcGVuZCwgc28gbm90IGEgYnVnIGluIHFlbXUs
IGJ1dCBhIHJlZ3Jlc3Npb24gdGhlIGd1ZXN0IHVzZWQgZm9yCnRlc3RpbmcsIGxpa2UgaW4geGVu
LSogYnJhbmNoZXMuIFNvIGNhbiB5b3UgZm9yY2UgcHVzaCB0aGlzPwoKVGhhbmtzLAoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
