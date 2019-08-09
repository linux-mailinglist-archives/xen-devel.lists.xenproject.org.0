Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348187D70
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6Mz-0000Hb-G0; Fri, 09 Aug 2019 14:59:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cgI=WF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hw6MZ-0007nS-2q
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:59:27 +0000
X-Inumbo-ID: 46debc74-bab6-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46debc74-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:59:25 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a6ZXsabSlmtjrt1SZkzxvwxrMs90cwiuujpS7ilIlZwtDVkuKXXiBwoDIU35UTXociVTZrFshd
 fmGlk8Tz2/3am1T1xgfnwwpvl28LU680j9InuI8TWuTtezMEWEahOOr2vW5DXmie6T4bXJDcai
 m+oM3uAOoXH8yP0yKh7NN/AyVneVWuaF9U2OfYzXAfb+GCQITH88jRTZePMphnyPFQg2U7koWe
 n+chj+5XRXU20ZrbwcQmN2ARTDDVh/vOgE1B5+LFl2djJ4Qsgs9ys83LLZ1aBivLsmhoRS8nxr
 9T8=
X-SBRS: 2.7
X-MesageID: 4079809
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4079809"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
 <307c0b92-040a-14d1-eef0-3235c0498751@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6e849dec-0a0a-27d7-5186-9f994d5f8019@citrix.com>
Date: Fri, 9 Aug 2019 15:59:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <307c0b92-040a-14d1-eef0-3235c0498751@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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

T24gMDkvMDgvMjAxOSAxMzozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFRCRDogRXNwZWNpYWxseSB3
aXRoIGhvdyB0aGUgcHJldmlvdXMgcGF0Y2ggbm93IHdvcmtzIEknbSB1bmNvbnZpbmNlZCBvZgo+
IMKgwqDCoMKgIHRoZSB1dGlsaXR5IG9mIHRoZSBsaW5rZXIgc2NyaXB0IGFsaWdubWVudCBjaGVj
ay4gSXQgaW4gcGFydGljdWxhcgo+IMKgwqDCoMKgIGRvZXNuJ3QgY2hlY2sgdGhlIHByb3BlcnR5
IHdlJ3JlIGFmdGVyIGluIHRoaXMgcGF0Y2gsIGkuZS4gdGhlIGZhY3QKPiDCoMKgwqDCoCB0aGF0
IHRoZXJlJ3Mgbm90aGluZyBlbHNlIGluIHRoZSBzYW1lIHBhZ2UuCgpJdCBzaG91bGQgbm93IHBy
b2JhYmx5IGJlIGEgQlVJTERfQlVHX09OKCkgY2hlY2tpbmcgc2l6ZW9mKHRzc19wYWdlKQpiZWlu
ZyBleGFjdGx5IGEgcGFnZSwgZ2l2ZW4gdGhhdCB0aGVyZSBpcyBhbHNvIGEgY29tcGlsZSB0aW1l
IGFsaWdubWVudAphc3NlcnRpb24uCgo+IE5COiBTYWRseSBnZXRfcGVyX2NwdV92YXIoKSBjYW4n
dCBhbHNvIGJlIHVzZWQgb24gdGhlICJsZWZ0IiBzaWRlIG9mIGEKPiDCoMKgwqAgI2RlZmluZS4K
CkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGltcGx5IHdpdGggdGhp
cy7CoCBUaGF0IHNhaWQsIC4uLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nv
ci5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAo+IEBAIC00MTEsNyAr
NDExLDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfX213YWl0KHVuc2lnbgo+IMKgI2Rl
ZmluZSBJT0JNUF9CWVRFU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA4MTkyCj4gwqAjZGVmaW5l
IElPQk1QX0lOVkFMSURfT0ZGU0VUwqDCoMKgIDB4ODAwMAo+IMKgCj4gLXN0cnVjdCBfX3BhY2tl
ZCBfX2NhY2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1Y3Qgewo+ICtzdHJ1Y3QgX19wYWNrZWQgdHNz
X3N0cnVjdCB7Cj4gwqDCoMKgwqAgdWludDMyX3QgOjMyOwo+IMKgwqDCoMKgIHVpbnQ2NF90IHJz
cDAsIHJzcDEsIHJzcDI7Cj4gwqDCoMKgwqAgdWludDY0X3QgOjY0Owo+IEBAIC00MjUsNiArNDI1
LDExIEBAIHN0cnVjdCBfX3BhY2tlZCBfX2NhY2hlbGluZV9hbGlnbmVkIHRzc18KPiDCoMKgwqDC
oCAvKiBQYWRzIHRoZSBUU1MgdG8gYmUgY2FjaGVsaW5lLWFsaWduZWQgKHRvdGFsIHNpemUgaXMg
MHg4MCkuICovCj4gwqDCoMKgwqAgdWludDhfdCBfX2NhY2hlbGluZV9maWxsZXJbMjRdOwo+IMKg
fTsKPiArc3RydWN0IHRzc19wYWdlIHsKPiArwqDCoMKgIHN0cnVjdCB0c3Nfc3RydWN0IF9fYWxp
Z25lZChQQUdFX1NJWkUpIHRzczsKPiArfTsKPiArREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0c3Nf
cGFnZSwgaW5pdF90c3NfcGFnZSk7Cj4gKyNkZWZpbmUgcGVyX2NwdV9faW5pdF90c3MgZ2V0X3Bl
cl9jcHVfdmFyKGluaXRfdHNzX3BhZ2UudHNzKQoKLi4uIG15IGZpcnN0IGF0dGVtcHQgc3RhcnRl
ZCBieSByZW5hbWluZyBpbml0X3RzcyBiZWNhdXNlIHRoZSBpbml0IHBhcnQKaXMgYm9ndXMuwqAg
SSBiZWxpZXZlIHdlIGluaGVyaXRlZCB0aGlzIG5vbWVuY2xhdHVyZSBmcm9tIExpbnV4LCBidXQg
dGhhdApkb2Vzbid0IG1ha2UgaXQgcmlnaHQuCgpJIHJlZmVycmVkIHRoZSByZW5hbWluZyBwYXRj
aCBzcGVjaWZpY2FsbHkgdG8gYWlkIGluIGJhY2twb3J0YWJpbGl0eSwKYnV0IGdpdmVuIHRoZXNl
IGNoYW5nZXMgdG8gdGhlIHR5cGUsIGxlYXZpbmcgaXQgYWxvbmUgaXNuJ3QgYW4gb3B0aW9uLgoK
SSdtIG5vdCBoYXBweSB3aXRoIGludHJvZHVjaW5nIHRoaXMgZGl2ZXJzaW9uLCBiZWNhdXNlIGl0
IG1lYW5zIHRoYXQgYWxsCnVzZXJzIG9mIHBlcl9jcHUoaW5pdF90c3MpIG5vdyBoYXZlIHRoZSB3
cm9uZyB0eXBlcyBpbiB0aGVpciBoYW5kIGZyb20KdGhlIHBvaW50IG9mIHZpZXcgb2YgcmVhZGlu
ZyB0aGUgY29kZS4KCkknbSBzdGlsbCB1bmNlcnRhaW4gd2hpY2ggaXMgdGhlIGxlYXN0IGJhZCBv
cHRpb24gYmV0d2VlbiBiYWNrcG9ydGluZwp0aGlzIHZlcnNpb24sIGFuZCBiYWNrcG9ydGluZyB0
aGUgdmVyc2lvbiB3aGljaCBhZGp1c3RzIGFsbCB1c2VycyAtCnRoZXJlIGFyZW4ndCB0b28gbWFu
eSwgYW5kIGl0cyBkZWZpbml0ZWx5IG5vdCB0aGUgbW9zdCBhd2t3YXJkIGJhY2twb3J0CndlJ3Zl
IGV2ZXIgaGFkIHRvIGRvLgoKSSBjb3VsZCBiZSBwZXJzdWFkZWQgaW50byBrZWVwaW5nIHRoaXMg
dmVyc2lvbiBmb3IgbGVnYWN5IHRyZWVzLCBzbyBsb25nCmFzIGl0IGRvZXNuJ3QgcHJvcGFnYXRl
IGludG8gbWFzdGVyLsKgIGkuZS4gdGhpcyBwYXRjaCBkcm9wcyB0aGUgaW5pdF8KcHJlZml4LCBh
bmQgSSdsbCByZWJhc2UgbXkgcmVuYW1pbmcgYXMgYSAzLzIgYWdhaW4gd2hpY2ggZ2V0cyBjb21t
aXR0ZWQKYXQgYXJvdW5kIGFib3V0IHRoZSBzYW1lIHRpbWUuCgpUaGF0IHdheSB3ZSByZXRhaW4g
YSBub24tZGVjZXB0aXZlIGNvZGUgaW4gbWFzdGVyLgoKVGhvdWdodHM/Cgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
