Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55209762EC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqwnu-000267-H5; Fri, 26 Jul 2019 09:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqwns-000262-SY
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:46:20 +0000
X-Inumbo-ID: 353aab56-af8a-11e9-8301-57905763b047
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 353aab56-af8a-11e9-8301-57905763b047;
 Fri, 26 Jul 2019 09:46:15 +0000 (UTC)
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
IronPort-SDR: OoeZx1LRdpdd4WYlEhAaOykRkQc2lZS1iIc1yabJUsQx+nG+b0foYgeLeZrnZ6vYs6D3kRH6Qu
 1PWUFEbC1lf5cchre8rIIaMjHgAJW1I/4LKS/+M5A3b5znQuOzrHVTc2WonajUUosz3/bFJmJs
 jSpxley1Ob9S333p7MwcbaMybwK4pkpb0mSZEYyvhrJiir5SXxh04d5Qk3WrrHGv4yty/IuZnG
 uUuCKQZ5Jo+mI+lb83Bh4rIcd9IyaKxPrxaDObQV9j1vi+j0Iyu2XJkW/tmTOTVLonTY/c72Tv
 ejI=
X-SBRS: 2.7
X-MesageID: 3565129
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3565129"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
Date: Fri, 26 Jul 2019 10:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724112658.31495-3-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDcvMjAxOSAxMjoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi93YWl0LmMgYi94ZW4vY29tbW9uL3dhaXQuYwo+IGluZGV4IDRmODMwYTE0ZTgu
LjNmYzVmNjg2MTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi93YWl0LmMKPiArKysgYi94ZW4v
Y29tbW9uL3dhaXQuYwo+IEBAIC0zNCw4ICszNCw2IEBAIHN0cnVjdCB3YWl0cXVldWVfdmNwdSB7
Cj4gICAgICAgKi8KPiAgICAgIHZvaWQgKmVzcDsKPiAgICAgIGNoYXIgKnN0YWNrOwo+IC0gICAg
Y3B1bWFza190IHNhdmVkX2FmZmluaXR5Owo+IC0gICAgdW5zaWduZWQgaW50IHdha2V1cF9jcHU7
Cj4gICNlbmRpZgo+ICB9Owo+ICAKPiBAQCAtMTMxLDEyICsxMjksMTAgQEAgc3RhdGljIHZvaWQg
X19wcmVwYXJlX3RvX3dhaXQoc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4gICAgICBBU1NF
UlQod3F2LT5lc3AgPT0gMCk7Cj4gIAo+ICAgICAgLyogU2F2ZSBjdXJyZW50IFZDUFUgYWZmaW5p
dHk7IGZvcmNlIHdha2V1cCBvbiAqdGhpcyogQ1BVIG9ubHkuICovCj4gLSAgICB3cXYtPndha2V1
cF9jcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gLSAgICBjcHVtYXNrX2NvcHkoJndxdi0+c2F2
ZWRfYWZmaW5pdHksIGN1cnItPmNwdV9oYXJkX2FmZmluaXR5KTsKPiAtICAgIGlmICggdmNwdV9z
ZXRfaGFyZF9hZmZpbml0eShjdXJyLCBjcHVtYXNrX29mKHdxdi0+d2FrZXVwX2NwdSkpICkKPiAr
ICAgIGlmICggdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3Vyciwgc21wX3Byb2Nlc3Nvcl9pZCgp
LCBWQ1BVX0FGRklOSVRZX1dBSVQpICkKPiAgICAgIHsKPiAgICAgICAgICBnZHByaW50ayhYRU5M
T0dfRVJSLCAiVW5hYmxlIHRvIHNldCB2Y3B1IGFmZmluaXR5XG4iKTsKPiAtICAgICAgICBkb21h
aW5fY3Jhc2goY3VycmVudC0+ZG9tYWluKTsKPiArICAgICAgICBkb21haW5fY3Jhc2goY3Vyci0+
ZG9tYWluKTsKPiAgCj4gICAgICAgICAgZm9yICggOyA7ICkKPiAgICAgICAgICAgICAgZG9fc29m
dGlycSgpOwo+IEBAIC0xNzAsNyArMTY2LDcgQEAgc3RhdGljIHZvaWQgX19wcmVwYXJlX3RvX3dh
aXQoc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4gICAgICBpZiAoIHVubGlrZWx5KHdxdi0+
ZXNwID09IDApICkKPiAgICAgIHsKPiAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiU3Rh
Y2sgdG9vIGxhcmdlIGluICVzXG4iLCBfX2Z1bmNfXyk7Cj4gLSAgICAgICAgZG9tYWluX2NyYXNo
KGN1cnJlbnQtPmRvbWFpbik7Cj4gKyAgICAgICAgZG9tYWluX2NyYXNoKGN1cnItPmRvbWFpbik7
Cj4gIAo+ICAgICAgICAgIGZvciAoIDsgOyApCj4gICAgICAgICAgICAgIGRvX3NvZnRpcnEoKTsK
PiBAQCAtMTgyLDMwICsxNzgsMjQgQEAgc3RhdGljIHZvaWQgX19wcmVwYXJlX3RvX3dhaXQoc3Ry
dWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4gIHN0YXRpYyB2b2lkIF9fZmluaXNoX3dhaXQoc3Ry
dWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4gIHsKPiAgICAgIHdxdi0+ZXNwID0gTlVMTDsKPiAt
ICAgICh2b2lkKXZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VycmVudCwgJndxdi0+c2F2ZWRfYWZm
aW5pdHkpOwo+ICsgICAgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3VycmVudCwgTlJfQ1BVUywg
VkNQVV9BRkZJTklUWV9XQUlUKTsKPiAgfQo+ICAKPiAgdm9pZCBjaGVja193YWtldXBfZnJvbV93
YWl0KHZvaWQpCj4gIHsKPiAtICAgIHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2ID0gY3VycmVu
dC0+d2FpdHF1ZXVlX3ZjcHU7Cj4gKyAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4g
KyAgICBzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdiA9IGN1cnItPndhaXRxdWV1ZV92Y3B1Owo+
ICAKPiAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZ3cXYtPmxpc3QpKTsKPiAgCj4gICAgICBpZiAo
IGxpa2VseSh3cXYtPmVzcCA9PSBOVUxMKSApCj4gICAgICAgICAgcmV0dXJuOwo+ICAKPiAtICAg
IC8qIENoZWNrIGlmIHdlIHdva2UgdXAgb24gdGhlIHdyb25nIENQVS4gKi8KPiAtICAgIGlmICgg
dW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9pZCgpICE9IHdxdi0+d2FrZXVwX2NwdSkgKQo+ICsgICAg
LyogQ2hlY2sgaWYgd2UgYXJlIHN0aWxsIHBpbm5lZC4gKi8KPiArICAgIGlmICggdW5saWtlbHko
IShjdXJyLT5hZmZpbml0eV9icm9rZW4gJiBWQ1BVX0FGRklOSVRZX1dBSVQpKSApCj4gICAgICB7
Cj4gLSAgICAgICAgLyogUmUtc2V0IFZDUFUgYWZmaW5pdHkgYW5kIHJlLWVudGVyIHRoZSBzY2hl
ZHVsZXIuICovCj4gLSAgICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+IC0gICAg
ICAgIGNwdW1hc2tfY29weSgmd3F2LT5zYXZlZF9hZmZpbml0eSwgY3Vyci0+Y3B1X2hhcmRfYWZm
aW5pdHkpOwo+IC0gICAgICAgIGlmICggdmNwdV9zZXRfaGFyZF9hZmZpbml0eShjdXJyLCBjcHVt
YXNrX29mKHdxdi0+d2FrZXVwX2NwdSkpICkKPiAtICAgICAgICB7Cj4gLSAgICAgICAgICAgIGdk
cHJpbnRrKFhFTkxPR19FUlIsICJVbmFibGUgdG8gc2V0IHZjcHUgYWZmaW5pdHlcbiIpOwo+IC0g
ICAgICAgICAgICBkb21haW5fY3Jhc2goY3VycmVudC0+ZG9tYWluKTsKPiAtICAgICAgICB9Cj4g
LSAgICAgICAgd2FpdCgpOyAvKiB0YWtlcyB1cyBiYWNrIGludG8gdGhlIHNjaGVkdWxlciAqLwo+
ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJ2Y3B1IGFmZmluaXR5IGxvc3RcbiIpOwo+
ICsgICAgICAgIGRvbWFpbl9jcmFzaChjdXJyLT5kb21haW4pOwo+ICAgICAgfQoKSSdtIHNvcnJ5
IHRvIHJldHJhY3QgbXkgUi1ieSBhZnRlciB0aGUgZmFjdCwgYnV0IEkndmUgb25seSBqdXN0IG5v
dGljZWQKKHdoaWxlIHJlYmFzaW5nIHNvbWUgb2YgbXkgcGVuZGluZyB3b3JrIG92ZXIgdGhpcykg
dGhhdCBpdCBpcyBidWdneS4KClRoZSByZWFzb24gd2FpdCgpIHdhcyBjYWxsZWQgaXMgYmVjYXVz
ZSBpdCBpcyBub3Qgc2FmZSB0byBsZWF2ZSB0aGF0CmlmKCkgY2xhdXNlLgoKV2l0aCB0aGlzIGNo
YW5nZSBpbiBwbGFjZSwgd2UnbGwgYXJyYW5nZSBmb3IgdGhlIFZNIHRvIGJlIGNyYXNoZWQsIHRo
ZW4KbG9uZ2p1bXAgYmFjayBpbnRvIHRoZSBzdGFjayBmcm9tIGZyb20gdGhlIHdhaXRpbmcgdkNQ
VSwgb24gdGhlIHdyb25nCkNQVS7CoCBBbnkgY2FsbGVyIHdpdGggc21wX3Byb2Nlc3Nvcl9pZCgp
IG9yIHRocmVhZC1sb2NhbCB2YXJpYWJsZXMgY2FjaGUKYnkgcG9pbnRlciBvbiB0aGUgc3RhY2sg
d2lsbCB0aGVuIGNhdXNlIG1lbW9yeSBjb3JydXB0aW9uLgoKSXRzIG5vdCBpbW1lZGlhdGVseSBv
YnZpb3VzIGhvdyB0byBmaXggdGhpcywgYnV0IGJlYXIgaW4gbWluZCB0aGF0IGFzCnNvb24gYXMg
dGhlIHZtLWV2ZW50IGludGVyZmFjZSBpcyBkb25lLCBJIHBsYW4gdG8gZGVsZXRlIHRoaXMgd2hv
bGUKd2FpdHF1ZXVlIGluZnJhc3RydWN0dXJlIGFueXdheS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
