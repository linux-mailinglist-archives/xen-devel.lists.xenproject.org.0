Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A76E637
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoShB-0000KD-JB; Fri, 19 Jul 2019 13:13:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoShA-0000K6-CF
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:13:08 +0000
X-Inumbo-ID: f2d5ded4-aa26-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f2d5ded4-aa26-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:13:07 +0000 (UTC)
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
IronPort-SDR: HDca8ZBYDcNj2ANjTUvE2Wh8Vx8hLbyp+k9HXgG9RARHC/NrpNJ1aFocgCpW8zv2unI7STDyIm
 k6ewdGVvNQqJhJezBD8ZAFGR7QbPZhLlhGp6vkvQtNYFrlYsdR9MzhlWEpUWlR4p9uD/xSEb62
 M6MI9CqKfN1Gd4Fas2s+tbNy22dWKGrWymZJII8DZSK5U6saOgiTURwjgaLO46Y0vVc5bDJ4CM
 mcRubsHE32uKmvW/qYcyQguz5QvKxkt1DnFwdcUXK2EryrFA3gYo8zfTPxvT9LK89226rhOKvA
 MvY=
X-SBRS: 2.7
X-MesageID: 3256963
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3256963"
To: Jan Beulich <JBeulich@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <2b43d005-9a97-0ffb-6687-f08f29796e0c@citrix.com>
 <65a9dd40-5219-ec68-37be-e533f96829c7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d98f4ee1-982b-f7f2-820b-8e78c3395620@citrix.com>
Date: Fri, 19 Jul 2019 14:13:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65a9dd40-5219-ec68-37be-e533f96829c7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 00/13] x86: IRQ management adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDcvMjAxOSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDcuMjAxOSAx
NDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTYvMDcvMjAxOSAwODoyNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBGb3IgdjQgc3BlY2lmaWMgaW5mb3JtYXRpb24gcGxlYXNlIHNlZSB0
aGUgaW5kaXZpZHVhbCBwYXRjaGVzLgo+Pj4KPj4+IEZ1bGwgc2V0IG9mIHBhdGNoZXMgYXR0YWNo
ZWQgaGVyZSBkdWUgdG8gc3RpbGwgdW5yZXNvbHZlZCBlbWFpbAo+Pj4gaXNzdWVzIG92ZXIgaGVy
ZS4KPj4gSW4gZnV0dXJlLCBjYW4geW91IHBsZWFzZSBudW1iZXIgdGhlIHBhdGNoZXMgaW4gdGhl
aXIgY29ycmVjdCBvcmRlci4KPj4KPj4gVGhlcmUgaXMgbm8gY29ycmVsYXRpb24gYmV0d2VlbiB0
aGUgbmFtZXMgb2YgdGhlIHBhdGNoZXMsIGFuZCBlaXRoZXIgdGhlCj4+IGNvbW1pdCB0aXRsZSwg
b3IgdGhlIG9yZGVyIGluIHdoaWNoIHRoZXkgc2hvdWxkIGJlIGFwcGxpZWQuCj4gSSdkIHNwZWNp
ZmljYWxseSBnb25lIGFuZCBzb3J0ZWQgdGhlIGF0dGFjaG1lbnRzLCBhbmQgYXMgcGVyIHRoZQo+
IGxpc3QgYXJjaGl2ZXMgdGhpcyBzb3J0aW5nIGhhcyBpbmRlZWQgYmVlbiBwcmVzZXJ2ZWQuCgpS
aWdodCwgYnV0IHRoYXQgZG9lc24ndCBob2xkIHdoZW4gc2F2aW5nIHRoZSBwYXRjaGVzIGFzIGlu
ZGl2aWR1YWwgZmlsZXMKaW4gb3JkZXIgdG8gYXBwbHkgdGhlbS4KCj4KPj4gSSdtIGN1cnJlbnRs
eSBoYXZpbmcgYW4gZXhjZWVkaW5nbHkgImZ1biIgdGltZSB0cnlpbmcgdG8gdHVybiB0aGlzIGJh
Y2sKPj4gaW50byBhIGdpdCB0cmVlLsKgIChObyBwb2ludCByZXNlbmRpbmcgdGhpcyBzZXJpZXMs
IGJlY2F1c2UgSSd2ZSBkb25lIGl0Cj4+IG5vdy4pCj4gSSdtIHNvcnJ5IGZvciB0aGlzLgo+Cj4+
IFAuUy4gT2YgY291cnNlLCBgZ2l0IGZvcm1hdC1wYXRjaGAgaXMgdGhlIHJlY29tbWVuZGVkIHdh
eSB0byBkbyB0aGlzLAo+PiBidXQgdGhlbiBhZ2Fpbiwgc28gaXMgYGdpdCBzZW5kLWVtYWlsYCBp
biB0aGUgZmlyc3QgcGxhY2UuCj4gU3VyZSAtIGZvciBwZW9wbGUgdXNpbmcgZ2l0IGZvciB0aGVp
ciBkZXZlbG9wbWVudCB3b3JrLiBJIGNhbiBvbmx5Cj4gc3RhdGUgYWdhaW4gdGhhdCBJJ20gaGFw
cHkgd2l0aCBxdWlsdCBpbnN0ZWFkLgoKQSBkaWZmZXJlbnQgYWx0ZXJuYXRpdmUgd291bGQgYmUg
dG8gcHVzaCB0aGUgc2VyaWVzIHRvIHlvdXIgZ2l0IHRyZWUgb24KeGVuYml0cywgd2hpY2ggd291
bGQgYmUgYWxtb3N0IHRoZSBzYW1lIGFzIHB1c2hpbmcgdG8gc3RhZ2luZy4KCkkgZXhwZWN0IHRo
YXQgd291bGQgYWN0dWFsbHkgYmUgbW9yZSBjb252ZW5pZW50IGZvciB0aGUgcGVvcGxlIGxpYWJs
ZSB0bwpiZSBkZWFsaW5nIHdpdGggc2VyaWVzIGxpa2UgdGhpcyAoSXQgY2VydGFpbmx5IHdvdWxk
IGJlIGZvciBtZSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
