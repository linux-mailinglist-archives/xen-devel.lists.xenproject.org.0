Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A16358339
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 15:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgUF5-0001gd-8w; Thu, 27 Jun 2019 13:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCrz=U2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgUF4-0001gY-Kg
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 13:15:10 +0000
X-Inumbo-ID: 94e67de6-98dd-11e9-9511-efc64dc12435
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94e67de6-98dd-11e9-9511-efc64dc12435;
 Thu, 27 Jun 2019 13:15:07 +0000 (UTC)
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
IronPort-SDR: T6/kLYI3rUfp74Cejk0pJOXrgOXfgSGOSoZ92dX07394tx8aXxUJt14wIS965U8GZyyEtsGhsQ
 KrrdJWk/0wHPrFtBiKnPqCQke+VAkZMpb0vAA9JNZR/2zr9i4Ka9qo7Tu/ilQx6W/iEnQiHWFD
 XKGGLS4//ZrN9TztqQaLcBjbzu/cpOtAyDrrysQLAyRuOSm1rD3sVhiSJTcZwm3/cNeWaobjo2
 hcjY+L3GytVH+KRq61X2jKOqlKUzU8aPsN1pj49k1SVoN0LEUA5x/BrbuEne2miYSBlkCkjFJi
 wiM=
X-SBRS: 2.7
X-MesageID: 2314416
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2314416"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190626190212.15365-1-andrew.cooper3@citrix.com>
 <20190627083729.ffid5ect3tso32em@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <70bcf297-87cb-fc22-f421-cb85a51e649b@citrix.com>
Date: Thu, 27 Jun 2019 14:15:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190627083729.ffid5ect3tso32em@MacBook-Air-de-Roger.local>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: set CR4 before CR0
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYvMjAxOSAwOTozNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEp1
biAyNiwgMjAxOSBhdCAwODowMjoxMlBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBG
cm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4+Cj4+IE90aGVy
d2lzZSBodm1fc2V0X2NyMCgpIHdpbGwgY2hlY2sgdGhlIHdyb25nIENSNCBiaXRzIChMMSBpbnN0
ZWFkIG9mIEwyCj4+IGFuZCB2aWNlLXZlcnNhKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5
IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4KPj4gLS0tCj4+IENDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+PiBD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IENDOiBKdW4gTmFr
YWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KPj4KPj4gSSBmb3VuZCB0aGlzIHBhdGNoIGxhbmd1aXNoaW5nIGluIHRo
ZSBYZW5TZXJ2ZXIgcGF0Y2hxdWV1ZSwgYW5kIFNlcmdleSBpcyBPb08KPj4gc28gSSdtIHN1Ym1p
dHRpbmcgaXQgb24gaGlzIGJlaGFsZi4KPj4KPj4gV2l0aG91dCB0aGlzIGNoYW5nZSwgbmVzdGVk
IHZpcnQgaXMgYnJva2VuIHdoZW4gTDEgYW5kIEwyIGRpZmZlciBpbiB0aGVpciB1c2UKPj4gb2Yg
UENJRC4KPj4KPj4gVGhpcyBpcyBvbmx5IGEgc3RvcGdhcCBzb2x1dGlvbiAtIGl0IHJlc29sdmVz
IHRoZSBQQ0lEIGlzc3VlIHdpdGhvdXQKPj4gaW50cm9kdWNpbmcgb3RoZXIgaXNzdWVzLCBidXQg
dGhlIHByb3BlciBmaXggbmVlZHMgdG8gY29uc2lkZXIgYWxsIGNvbnRyb2wKPj4gYml0cyBhdCBv
bmNlLCByYXRoZXIgdGhhbiBjb25zaWRlcmluZyBhIHZtZW50cnkvZXhpdCBhcyBhIHNlcXVlbmNl
IG9mIGNoYW5nZXMKPj4gb2YgZGlzY3JldGUgcmVnaXN0ZXJzLgo+IFRoZSBjdXJyZW50IGFwcHJv
YWNoIHNlZW1zIHByb25lIHRvIHN1Y2ggb3JkZXJpbmcgaXNzdWVzLCBhbmQgSSBkb24ndAo+IHNl
ZSBhIHdheSB0byBtYWtlIGl0IG1vcmUgcm9idXN0IHdoaWxlIGtlZXBpbmcgdGhlIGN1cnJlbnQg
YXBwcm9hY2gsCj4gc28gSSBndWVzcyBzZXR0aW5nIGFsbCB0aGUgcmVnaXN0ZXJzIHN0YXRlIGFu
ZCB0aGVuIGV2YWx1YXRpbmcgdGhlbQo+IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBhbmQgcHJldmVu
dCB0aGlzIGtpbmQgb2YgbWlzdGFrZXMuCgpJJ20gcHJldHR5IHN1cmUgdGhhdCB3aGVuIHdlIHN0
YXJ0IGRvaW5nIGFsbCB0aGUgY2hlY2tzIHRoYXQgd2Ugc2hvdWxkCmJlIGRvaW5nLCB0aGVyZSB3
aWxsIGJlIGNvbWJpbmF0aW9ucyB3aGljaCBjYW4ndCBiZSBleHByZXNzZWQgYXMgYQpub24tZmF1
bHRpbmcgc2VxdWVuY2Ugb2Ygd3JpdGVzIHRvIGNyMCwgY3I0IGFuZCBlZmVyLgoKVW5mb3J0dW5h
dGVseSwgdGhlcmUgaXMgYSBsb2FkIG9mIG5lc3RlZCB2aXJ0IHByZXAgd29yayB0byBkbyBiZWZv
cmUKaW1wbGVtZW50aW5nIGFuIGFwcHJvYWNoIGxpa2UgdGhpcyBiZWNvbWVzIHZpYWJsZS4KCkhl
bmNlIHRoZSBzdG9wZ2FwIHNvbHV0aW9uIGluIHRoZSBtZWFudGltZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
