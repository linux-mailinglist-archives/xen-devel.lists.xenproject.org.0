Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60635B54
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYU8t-0004Xv-9U; Wed, 05 Jun 2019 11:31:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ruhq=UE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYU8r-0004Xq-BZ
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:31:41 +0000
X-Inumbo-ID: 7b296490-8785-11e9-95b2-4bd2e946de5e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b296490-8785-11e9-95b2-4bd2e946de5e;
 Wed, 05 Jun 2019 11:31:38 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r+mUVnC7CrXkX52nCZ9Dm6kqlgqi2hSydvyRSG3LHXwQ7Q2f8GtWNWYNoejmS5hstidPYtojs5
 l14qdq8RPyLNPWfKteQyHt2Xi6EHDvtK2QdZ32Q3fCCAwNrHw/vEt9rbEce69ESn1AGSl8fxqp
 bJ19koWc5piLnQttxzlEj5Fq48tiIWdTTHMvGPnsQCnFg5Id/K3EwN1v7mwoeAN1I1FMQHvtva
 Yqz84N0HEqLyBORXV0Bzkgrx6EVNNO3T5jJWj8FV20h5Cwg5PaiC/Myxo40uvDZC6I/UFeboIM
 yos=
X-SBRS: 2.7
X-MesageID: 1338018
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1338018"
To: Jan Beulich <JBeulich@suse.com>
References: <1559677885-10731-1-git-send-email-andrew.cooper3@citrix.com>
 <1559677885-10731-3-git-send-email-andrew.cooper3@citrix.com>
 <5CF790890200007800235696@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <82bd675c-c7f8-5ead-f328-bca96bc3976f@citrix.com>
Date: Wed, 5 Jun 2019 12:31:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF790890200007800235696@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] tools/fuzz: Add a cpu-policy fuzzing
 harness
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDYvMjAxOSAxMDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDYuMTkg
YXQgMjE6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlcmUgaXMg
bm93IGVub3VnaCBjb21wbGV4aXR5IHRoYXQgYSBmdXp6aW5nIGhhcm5lc3MgaXMgYSBnb29kIGlk
ZWEsIGFuZAo+PiBlbm91Z2ggc3VwcG9ydGluZyBsb2dpYyB0byBpbXBsZW1lbnQgb25lIHdoaWNo
IEFGTCBzZWVtcyBoYXBweSB3aXRoLgo+Pgo+PiBUYWtlIHRoZSBleGlzdGluZyByZWNhbGN1bGF0
ZV9zeW50aCgpIGhlbHBlciBhbmQgZXhwb3J0IGl0IGFzCj4+IHg4Nl9jcHVpZF9wb2xpY3lfcmVj
YWxjX3N5bnRoKCksIGFzIGl0IGlzIG5lZWRlZCBieSB0aGUgZnV6emluZyBoYXJuZXNzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+PiAtLS0KPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4gQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Cj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4K
Pj4gLS0tCj4+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvLmdpdGlnbm9yZSAgICAgICAgICB8ICAg
MSArCj4+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvTWFrZWZpbGUgICAgICAgICAgICB8ICAyOCAr
KysrKwo+PiAgdG9vbHMvZnV6ei9jcHUtcG9saWN5L2FmbC1wb2xpY3ktZnV6emVyLmMgfCAxODcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gRG9lcyB0aGlzIHdhbnQgdG8gYmUgYWNj
b21wYW5pZWQgYnkgYSAuL01BSU5UQUlORVJTIHVwZGF0ZQo+IHRvIHRoZSBYODYgc2VjdGlvbj8K
Ck9vcHMgeWVzLCBhbmQgc2ltaWxhcmx5IGZvciB0b29scy90ZXN0cy9jcHUtcG9saWN5LwoKRG8g
eW91IG1pbmQgaWYgSSBmb2xkIHRoYXQgY2hhbmdlIGluIGFzIHdlbGw/Cgo+Cj4+ICB4ZW4vaW5j
bHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oICAgICAgICAgICB8ICAgNSArCj4+ICB4ZW4vbGliL3g4
Ni9jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQo+PiAgNSBmaWxlcyBjaGFu
Z2VkLCAyMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIGZ1cnRoZXIgcmVtYXJrOgo+Cj4+
ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4+ICt7Cj4+ICsgICAgRklMRSAqZnAg
PSBOVUxMOwo+PiArCj4+ICsgICAgc2V0YnVmKHN0ZGluLCBOVUxMKTsKPj4gKyAgICBzZXRidWYo
c3Rkb3V0LCBOVUxMKTsKPj4gKwo+PiArICAgIHdoaWxlICggdHJ1ZSApCj4+ICsgICAgewo+PiAr
ICAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBvcHRzW10gPSB7Cj4+ICsgICAgICAg
ICAgICB7ICJkZWJ1ZyIsIG5vX2FyZ3VtZW50LCBOVUxMLCAnZCcgfSwKPj4gKyAgICAgICAgICAg
IHsgImhlbHAiLCBub19hcmd1bWVudCwgTlVMTCwgJ2gnIH0sCj4+ICsgICAgICAgICAgICB7fSwK
Pj4gKyAgICAgICAgfTsKPj4gKyAgICAgICAgaW50IGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2
LCAiaGQiLCBvcHRzLCBOVUxMKTsKPj4gKwo+PiArICAgICAgICBpZiAoIGMgPT0gLTEgKQo+PiAr
ICAgICAgICAgICAgYnJlYWs7Cj4+ICsKPj4gKyAgICAgICAgc3dpdGNoICggYyApCj4+ICsgICAg
ICAgIHsKPj4gKyAgICAgICAgY2FzZSAnZCc6Cj4+ICsgICAgICAgICAgICBwcmludGYoIkVuYWJs
aW5nIGRlYnVnXG4iKTsKPj4gKyAgICAgICAgICAgIGRlYnVnID0gdHJ1ZTsKPj4gKyAgICAgICAg
ICAgIGJyZWFrOwo+PiArCj4+ICsgICAgICAgIGRlZmF1bHQ6Cj4+ICsgICAgICAgICAgICBwcmlu
dGYoIkJhZCBvcHRpb24gJWQgKCVjKVxuIiwgYywgYyk7Cj4+ICsgICAgICAgICAgICBleGl0KC0x
KTsKPj4gKyAgICAgICAgICAgIGJyZWFrOwo+IFdvdWxkbid0ICdoJyAod3JvbmdseSkgY29tZSBp
bnRvIGhlcmU/IChUaGUgYnJlYWsgc3RhdGVtZW50IGFsc28gbG9va3MKPiB0byBiZSB1bm5lY2Vz
c2FyeSBhZnRlciBleGl0KCkuKQoKSG1tIC0gc29tZXRoaW5nIGdvdCBsb3N0IGluIGEgcmViYXNl
LsKgIFRoYXQgd2FzIHN1cHBvc2VkIHRvIGJlIGRlZmF1bHQKcHJpbnRpbmcgYmFkIG9wdGlvbiwg
dGhlbiBmYWxsaW5nIHRocm91Z2ggaW50byAnaCcgd2l0aCB1c2FnZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
