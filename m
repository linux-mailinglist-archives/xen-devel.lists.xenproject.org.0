Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC084F6F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:06:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNTq-00043G-ET; Wed, 07 Aug 2019 15:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvNTo-000435-DD
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:03:56 +0000
X-Inumbo-ID: 928e823e-b924-11e9-90aa-13c2a8d5b5de
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 928e823e-b924-11e9-90aa-13c2a8d5b5de;
 Wed, 07 Aug 2019 15:03:54 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tW2fyX3Fh+Ynrspd+qFTc0r9VJP7Wm02H/9vHcQw9UEW4zMugq6mBe6pNbkM/ZMMdGbJ5Jq0DT
 9goyGNbyiY5Mkv8qfvTeekij86VQuggDdK8svKhXQYj/acmjUUbHVVNOoGZs56byCv5Y7u+qSa
 oRpsOw9zkxZ/DNwF1eYxZ6wSODzPQt8psdchJN67CXQHzwb6sDzG9unA7JQQQERoR5jvx99s15
 6jZ0tF4b1Kq4auyrDgiN10zZHKJjTzztrGW207sO7ueLLTebbnkx+VsB2v3aEopcrKVRNi83lf
 Qwg=
X-SBRS: 2.7
X-MesageID: 4115552
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4115552"
Date: Wed, 7 Aug 2019 17:03:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807150346.upizhcngos3prol4@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-21-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-21-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 20/35]
 OvmfPkg/XenPlatformPei: Introduce XenPvhDetected
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MjlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gWGVuUHZoRGV0ZWN0ZWQoKSBjYW4gYmUgdXNlZCB0byBmaWd1cmUgb3V0IGlmIE9W
TUYgaGFzIHN0YXJ0ZWQgdmlhIHRoZQo+IFhlbiBQVkggZW50cnkgcG9pbnQuCj4gCj4gUmVmOiBo
dHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBB
Y2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5rcywgSSd2ZSBn
b3QgYSBjb21tZW50LCBidXQgaXQgY2FuIGJlIGZpeGVkIGFmdGVyd2FyZHMgaWYgcmVxdWlyZWQu
Cgo+IC0tLQo+ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggfCAgNSArKysrKwo+
ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgfCAxMyArKysrKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1m
UGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1Bs
YXRmb3JtLmgKPiBpbmRleCA0YTgwMDU3YmRjLi5kYjlhNjI1NzJmIDEwMDY0NAo+IC0tLSBhL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvUGxhdGZvcm0uaAo+IEBAIC05OSw2ICs5OSwxMSBAQCBYZW5Idm1sb2FkZXJEZXRlY3Rl
ZCAoCj4gICAgVk9JRAo+ICAgICk7Cj4gIAo+ICtCT09MRUFOCj4gK1hlblB2aERldGVjdGVkICgK
PiArICBWT0lECj4gKyAgKTsKPiArCj4gIFZPSUQKPiAgQW1kU2V2SW5pdGlhbGl6ZSAoCj4gICAg
Vk9JRAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IGluZGV4IDI5YjQyYjc0NmMuLjcxZmU1ZGU0NDYgMTAw
NjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMKPiBAQCAtMjE0LDYgKzIxNCwxOSBAQCBYZW5Idm1sb2FkZXJE
ZXRlY3RlZCAoCj4gICAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKPiAgfQo+
ICAKPiArQk9PTEVBTgo+ICtYZW5QdmhEZXRlY3RlZCAoCj4gKyAgVk9JRAo+ICsgICkKPiArewo+
ICsgIC8vCj4gKyAgLy8gVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhl
bkNvbm5lY3QKPiArICAvLwo+ICsgIEFTU0VSVCAobVhlbkluZm8uVmVyc2lvbk1ham9yICE9IDAp
OwoKVGhhdCdzIElNTyBkYW5nZXJvdXMuIFVzaW5nIHRoZSB2ZXJzaW9uIGFzIGFuIGluZGljYXRp
b24gdGhhdApYZW5Db25uZWN0IGhhcyBydW4gc2VlbXMgbGlrZSBhIGJhZCBpZGVhLCBzaW5jZSBy
ZXR1cm5pbmcgYSBtYWpvcgp2ZXJzaW9uIG9mIDAgaXMgYSB2YWxpZCBudW1iZXIgdG8gcmV0dXJu
LiBDYW4ndCB5b3UgY2hlY2sgYWdhaW5zdApzb21ldGhpbmcgZWxzZSB0aGF0IGRvZXNuJ3QgZGVw
ZW5kcyBvbiBoeXBlcnZpc29yIHByb3ZpZGVkIGRhdGE/IChpZToKbGlrZSBzb21lIGFsbG9jYXRp
b25zIG9yIHN1Y2ggdGhhdCBoYXBwZW4gaW4gWGVuQ29ubmVjdCkKCkEgcGFyYW5vaWQgY291bGQg
cHJvdmlkZXIgY291bGQgZXZlbiByZXR1cm4gbWFqb3IgPT0gMCBhbmQgbWlub3IgPT0gMAppbiBv
cmRlciB0byBhdHRlbXB0IHRvIGhpZGUgdGhlIFhlbiB2ZXJzaW9uIHVzZWQsIHNpbmNlIGd1ZXN0
cyBhcmUgbm90CnN1cHBvc2VkIHRvIGluZmVyIGFueXRoaW5nIGZyb20gdGhlIFhlbiB2ZXJzaW9u
LCBhdmFpbGFibGUgaHlwZXJ2aXNvcgpmZWF0dXJlcyBhcmUgcmVwb3J0ZWQgYnkgb3RoZXIgbWVh
bnMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
