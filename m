Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED1879CC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw3rk-0001sc-KJ; Fri, 09 Aug 2019 12:19:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cgI=WF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hw3rj-0001sX-9G
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:19:27 +0000
X-Inumbo-ID: ec9448a9-ba9f-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ec9448a9-ba9f-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 12:19:24 +0000 (UTC)
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
IronPort-SDR: LSg+I9NBjQFY8CYm2T42b+mFiNuTR666/4pmZIi9R/uMlkdzRePZ/+YKiVyoKFYHOaFxo0uQ95
 I+afvbnoYHn4d1Bn5B9wPtrsGtimVd6wKtE7Ec8ilf4qXe/D1I7CyWn7wGJFNB1THvme4vWHMB
 rlPvGtCDUfzDDQVx/CdJ4qwQvo3l7pKcMedmDSnbqDED7YjaStfUhJjrd8YO7sDVOS3tyB74Pq
 zPIa0cgJtjROb13o/5sn/8oL31IMEoonYgLOYaGhmguxVHkZAWRt8Qlzhy118f1Ddl/Fixhrvv
 lmg=
X-SBRS: 2.7
X-MesageID: 4217180
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4217180"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
Date: Fri, 9 Aug 2019 13:19:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDgvMjAxOSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPgo+IEludHJvZHVjZSBT
RUwyR0RUKCkuIENvcnJlY3QgR0RUIGluZGljZXMgaW4gcHVibGljIGhlYWRlci4KCiJDb3JyZWN0
IiBoZXJlIGlzIGFtYmlndW91cyBiZWNhdXNlIGl0IGltcGxpZXMgdGhlcmUgaXMgYSBicmVha2Fn
ZS4KCllvdSBhcHBlYXIgdG8gaGF2ZSByZXZlcnNlZCBGTEFUX1JJTkczX0NTNjQgYW5kIERTMzIg
KHJldGFpbmluZyB0aGUKb3JpZ2luYWwgY29tbWVudHMpIGFuZCBjaGFuZ2VkIHRoZSBjb21tZW50
cyBmb3IgRkxBVF9SSU5HM19TU3szMiw2NH0uCgpFeGNlcHQgdGhhdCBub3cgdGhleSBhcmUgb3V0
IG9mIHRoZWlyIGxvZ2ljYWwgb3JkZXIgKENTIDMyIHRoZW4gNjQsIERTCjMyIHRoZW4gNjQsIFNT
IDMyIHRoZW4gNjQpLgoKV2hhdCBpcyB0aGUgcmVhc29uaW5nIGZvciB0aGUgbmV3IG9yZGVyP8Kg
IEl0IGlzbid0IHNvcnRlZCBieSBpbmRleC4KCj4KPiAtLS0gL2Rldi9udWxsCj4gKysrIGIveGVu
L2FyY2gveDg2L2Rlc2MuYwo+IEBAIC0wLDAgKzEsMTA5IEBACj4gKwo+ICsjZGVmaW5lIFNFTDJH
RFQoc2VsKSAoKChzZWwpID4+IDMpIC0gRklSU1RfUkVTRVJWRURfR0RUX0VOVFJZKQo+ICsKPiAr
X19zZWN0aW9uKCIuZGF0YS5wYWdlX2FsaWduZWQiKSBfX2FsaWduZWQoUEFHRV9TSVpFKQo+ICtz
ZWdfZGVzY190IGJvb3RfZ2R0W1BBR0VfU0laRSAvIHNpemVvZihzZWdfZGVzY190KV0gPQo+ICt7
Cj4gK8KgwqDCoCAvKiAweGUwMDggLSBSaW5nIDAgY29kZSwgNjRiaXQgbW9kZSAqLwo+ICvCoMKg
wqAgW1NFTDJHRFQoX19IWVBFUlZJU09SX0NTNjQpXSA9IHsgMHgwMGFmOWIwMDAwMDBmZmZmIH0s
Cj4gKwo+ICvCoMKgwqAgLyogMHhlMDEwIC0gUmluZyAwIGRhdGEgKi8KPiArwqDCoMKgIFtTRUwy
R0RUKF9fSFlQRVJWSVNPUl9EUzMyKV0gPSB7IDB4MDBjZjkzMDAwMDAwZmZmZiB9LAo+ICsKPiAr
wqDCoMKgIC8qIDB4ZTAxOCAtIHJlc2VydmVkICovCj4gKwo+ICvCoMKgwqAgLyogMHhlMDIzIC0g
UmluZyAzIGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KPiArwqDCoMKgIFtTRUwyR0RUKEZMQVRfUklO
RzNfQ1MzMildID0geyAweDAwY2ZmYjAwMDAwMGZmZmYgfSwKPiArCj4gK8KgwqDCoCAvKiAweGUw
MmIgLSBSaW5nIDMgZGF0YSAqLwo+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19EUzMyKV0g
PSB7IDB4MDBjZmYzMDAwMDAwZmZmZiB9LAo+ICsKPiArwqDCoMKgIC8qIDB4ZTAzMyAtIFJpbmcg
MyBjb2RlLCA2NC1iaXQgbW9kZSAqLwo+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19DUzY0
KV0gPSB7IDB4MDBhZmZiMDAwMDAwZmZmZiB9LAo+ICsKPiArwqDCoMKgIC8qIDB4ZTAzOCAtIFJp
bmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCj4gK8KgwqDCoCBbU0VMMkdEVChfX0hZUEVSVklT
T1JfQ1MzMildID0geyAweDAwY2Y5YjAwMDAwMGZmZmYgfSwKPiArCj4gK8KgwqDCoCAvKiAweGUw
NDAgLSBUU1MgKi8KPiArwqDCoMKgIC8qIDB4ZTA1MCAtIExEVCAqLwo+ICsKPiArwqDCoMKgIC8q
IDB4ZTA2MCAtIHBlci1DUFUgZW50cnkgKGxpbWl0ID09IGNwdSkgKi8KPiArwqDCoMKgIFtTRUwy
R0RUKFBFUl9DUFVfR0RUX1NFTEVDVE9SKV0gPSB7IDB4MDAwMDkxMDAwMDAwMDAwMCB9LAoKSXQg
d291bGQgYmUgYmV0dGVyIGlmIHRoZSA9IHsgfSB3ZXJlIHZlcnRpY2FsbHkgYWxpZ25lZC7CoCBJ
dCBtYWtlcwpyZWFkaW5nIHRoZW0gZWFzaWVyLgoKQWxzbywgbm93IHRoYXQgU0VMMkdEVCgpIGlz
IHByZXNlbnQsIHdlIG5lZWQgYSBCVUlMRF9CVUdfT04oKSB0byBjaGVjawp0aGF0IHRoZSBzaXpl
IGRvZXNuJ3QgdmFyeSBmcm9tIG9uZSBwYWdlLsKgIEF0IHRoZSBtb21lbnQsIGNoYW5naW5nIGEK
c2VsZWN0b3IgdG8gdXNlIDB4Znh4eCB3aWxsIGNhdXNlIHRoaXMgdG8gZ3JvdyBiZXlvbmQgMSBw
YWdlIHdpdGhvdXQgYW55CmNvbXBpbGVyIGRpYWdub3N0aWMuwqAgSSdkIGdvIHdpdGgKCnN0YXRp
YyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZApidWlsZF9hc3NlcnRpb25zKHZvaWQpwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgCgp7CsKgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mKGJvb3RfZ2R0KSAhPSBQQUdF
X1NJWkUpOwrCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZihib290X2NvbXBhdF9nZHQpICE9IFBB
R0VfU0laRSk7Cn0KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
