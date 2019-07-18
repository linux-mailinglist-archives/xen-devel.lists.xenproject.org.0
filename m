Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6D6CE9F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho69k-0006vA-UW; Thu, 18 Jul 2019 13:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ho69j-0006v3-Qy
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:09:07 +0000
X-Inumbo-ID: 37cd6576-a95d-11e9-9558-efa10cc005c4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37cd6576-a95d-11e9-9558-efa10cc005c4;
 Thu, 18 Jul 2019 13:09:05 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hkg3S85RTytXab0xm59sx8Xa26u/9p6NbP7bEXJgwpDvqeug0cSAX6cbOM96oelbuUFtWR8amO
 JzBS4VXndeC8+j24GikV6mu9wSXCXwE1piuOE5Nb8V0b7SyrRp1RfHEtuVIX2duFOZTe9f9pIW
 ytizx3lS81/HP2jLXKst9n+FXcEJpu92Qf7jMqg/mnF/qGye2LLdteAklFdhBb1mwOrkCFbNSX
 qIjqYg893axskqm6QyM4vCBu/bbGgrfb8R5XPjepWDSELz1kx8ZNyy4OYPK36RqiY8O8idNIqX
 uLM=
X-SBRS: 2.7
X-MesageID: 3196391
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3196391"
To: Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515651319.7407.3000873927341886165.stgit@Palanthas.fritz.box>
 <533decf6-7ae0-cc43-0162-695151cde292@citrix.com>
 <9d4acfa8661eb571492405be91b0cdce1bb069c0.camel@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <3054de3e-8e95-8d0d-cc72-e14d194dce96@citrix.com>
Date: Thu, 18 Jul 2019 14:09:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9d4acfa8661eb571492405be91b0cdce1bb069c0.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 3/5] xen: sched: null: deassign offline
 vcpus from pcpus
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xNy8xOSA3OjM5IFBNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+IEBAIC01MTgsNiAr
NTIxLDE0IEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV9yZW1vdmUoY29uc3Qgc3RydWN0Cj4+PiBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCj4+PiAgCj4+PiAgICAgIGxvY2sgPSB2Y3B1
X3NjaGVkdWxlX2xvY2tfaXJxKHYpOwo+Pj4gIAo+Pj4gKyAgICAvKiBJZiBvZmZsaW5lLCB0aGUg
dmNwdSBzaG91bGRuJ3QgYmUgYXNzaWduZWQsIG5vciBpbiB0aGUKPj4+IHdhaXRxdWV1ZSAqLwo+
Pj4gKyAgICBpZiAoIHVubGlrZWx5KCFpc192Y3B1X29ubGluZSh2KSkgKQo+Pj4gKyAgICB7Cj4+
PiArICAgICAgICBBU1NFUlQocGVyX2NwdShucGMsIHYtPnByb2Nlc3NvcikudmNwdSAhPSB2KTsK
Pj4+ICsgICAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZudmMtPndhaXRxX2VsZW0pKTsKPj4+ICsg
ICAgICAgIGdvdG8gb3V0Owo+Pj4gKyAgICB9Cj4+Cj4+ICogSGFuZGxlIHRoZSBjYXNlIG9mIGFu
IG9mZmxpbmUgdmNwdSBiZWluZyByZW1vdmVkIChBU1NFUlRpbmcgdGhhdAo+PiBpdCdzCj4+IG5l
aXRoZXIgb24gYSBwcm9jZXNzb3Igbm9yIG9uIHRoZSB3YWl0cXVldWUpCj4+Cj4gU28sIElJUkMg
KHNvcnJ5LCBpdCdzIGJlZW4gYSB3aGlsZSA6LUQgKSwgdGhpcyBpcyBmb3IgZGVhbGluZyB3aXRo
Cj4gcmVtb3ZlX3ZjcHUoKSBiZWluZyBjYWxsZWQgb24gYSB2Y3B1IHdoaWNoIGlzIG9mZmxpbmUu
IFNvLCB5ZXMsCj4gYmFzaWNhbGx5IHdoYXQgeW91IHNhaWQuIDotKQo+IAo+IFBvaW50IGlzIHRo
ZSB3b3JrIG9mIHJlbW92aW5nIHN1Y2ggdkNQVSBmcm9tIGFueSBDUFUgYW5kIGZyb20gdGhlIHdh
aXQKPiBsaXN0IGhhcyBiZWVuIGRvbmUgYWxyZWFkeSwgaW4gbnVsbF92Y3B1X3NsZWVwKCksIHdo
aWxlIHRoZSB2Q1BVIHdhcwo+IGdvaW5nIG9mZmxpbmUuIFNvLCBoZXJlLCB3ZSBvbmx5IG5lZWQg
dG8gbWFrZSBzdXJlIHRoYXQgd2UgZG9uJ3QgZG8KPiBhbnl0aGluZywgaS5lLiwgdGhhdCB3ZSBk
b24ndCBjYWxsIF92Y3B1X3JlbW92ZSgpLgoKUmlnaHQ7IEknbSBtYWlubHkgc2F5aW5nLCBpZiB0
aGUgY29tbWl0IG1lc3NhZ2UgaGFkIHNhaWQgd2hhdCBJIHdyb3RlCmFib3ZlLCB0aGVuIEkgd291
bGQgIGhhdmUgaW1tZWRpYXRlbHkgYmVlbiBhYmxlIHRvIHNlZSB3aGF0IHRoaXMgaHVuawp3YXMg
ZG9pbmcgYW5kIHVuZGVyc3RhbmQgd2h5IGl0IHdhcyBuZWVkZWQuCgo+PiBCdXQgd2FpdCwgaXNu
J3QgdGhpcyBmaXhpbmcgYSBpbXBvcnRhbnQgcmVncmVzc2lvbiBpbiBwYXRjaCAyPyAgSWYKPj4g
YWZ0ZXIKPj4gcGF0Y2ggMiBidXQgYmVmb3JlIHBhdGNoIDMsIGEgVk0gaXMgY3JlYXRlZCB3aXRo
IG9mZmxpbmUgdmNwdXMsIGFuZAo+PiB0aGVuCj4+IGRlc3Ryb3llZCwgd29uJ3QgdGhlIG9mZmxp
bmUgdmNwdXMgcmVhY2ggaGVyZSBuZWl0aGVyIG9uIHRoZSB3YWl0bGlzdAo+PiBub3Igb24gYSB2
Y3B1Pwo+Pgo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHBvaW50IHlvdSdyZSB0cnlp
bmcgdG8gbWFrZSBoZXJlLCBzb3JyeS4KPiAKPiBJbiBnZW5lcmFsLCBjb25zaWRlcmluZyB3aGF0
IHdlJ3ZlIHNhaWQgaW4gb3RoZXIgbWFpbHMsIGlmIHlvdSB0aGluawo+IHRoYXQgcGF0Y2ggMiBh
bmQgMyBzaG91bGQgYmUgbWVyZ2VkLCB3ZSBjYW4gZG8gdGhhdC4KPiAKPiBNeSByZWFzb25pbmcs
IHdoZW4gcHV0dGluZyB0b2dldGhlciB0aGUgc2VyaWVzLCB3YXMgdGhlIG9uZSBJIGFscmVhZHkK
PiBzdGF0ZWQ6IHRoaXMgaXMgYnJva2VuIGFscmVhZHksIHNvIG5vIGJpZyBkZWFsIGJyZWFraW5n
IGl0ICJtb3JlIiwgYW5kCj4gSSBjb250aW51ZSB0byBzZWUgaXQgdGhhdCB3YXkuCj4gCj4gQnV0
IEkgYXBwcmVjaWF0ZSB5b3Ugc2VlaW5nIGl0IGRpZmZlcmVudGx5LCB3aGlsZSBJIGRvbid0IGhh
dmUgYSB0b28KPiBzdHJvbmcgb3Bpbmlvbiwgc28gSSdkIGJlIGZpbmUgbWVyZ2luZyB0aGUgcGF0
Y2hlcyAob3IgZG9pbmcgb3RoZXIKPiBzZXJpZXMgcmVhcnJhbmdlbWVudHMsIGlmIHlvdSBmZWVs
IHN0cm9uZ2x5IHRoYXQgdGhleSdyZSBuZWNlc3NhcnkpLgo+IAo+IE9yIGlzIGl0IHNvbWV0aGlu
ZyBjb21wbGV0ZWx5IGRpZmZlcmVudCB0aGF0IHlvdSBtZWFudD8KCk1lcmdpbmcgdGhlIHBhdGNo
ZXMgd291bGQgYmUgb25lIHdheSB0byBhdm9pZCB0aGUgcmVncmVzc2lvbiwgeWVzLgoKU29ycnkg
dG8gYmUgcGlja3ksIGJ1dCBJJ3ZlIHJlY2VudGx5IHNwZW50IGEgbG90IG9mIHRpbWUgZG9pbmcK
YXJjaGFlb2xvZ3ksIGFuZCB3aXNoaW5nIHBlb3BsZSBpbiB0aGUgZGlzdGFudCBwYXN0IGhhZCBi
ZWVuIG1vcmUKY2FyZWZ1bCAvIGluZm9ybWF0aXZlIGluIHRoZWlyIGNvbW1pdCBoeWdpZW5lLiAg
QSBsaXR0bGUgYml0IG9mIGVmZm9ydApub3cgbWF5IHNhdmUgc29tZW9uZSBpbiB0aGUgZnV0dXJl
IC0tIHBvc3NpYmx5IHlvdSBvciBtZSAtLSBob3VycyBvZgpmcnVzdHJhdGlvbi4gOi0pCgogLUdl
b3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
