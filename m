Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2821426896
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 18:47:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTULZ-0007so-1y; Wed, 22 May 2019 16:44:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up1o=TW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hTULX-0007sh-KX
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 16:44:07 +0000
X-Inumbo-ID: cf45bd10-7cb0-11e9-9fe5-d389b374fd4d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf45bd10-7cb0-11e9-9fe5-d389b374fd4d;
 Wed, 22 May 2019 16:44:05 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: WPFuABeF1NBvnmrsxXNG9VXn0LZoSJF3sEWP2iL9KkZoTaxdmTlsoCEh0w28X2sHbUKRkMyt2S
 TvfOAcWGBb2R5kB9D7zaDt1756ONNilqyG3/B+pT7aPC7wjqxK5PBoL5M+oCs5l49GdxK7Lui1
 RVeDo1BShHb7WVbc/0q3J68tLkIdB619xBvJPxVGugNAB0uQnjPBImaML0QdkWCV1XDMAgZrtb
 aWEf9HQ/WfiERIVL8qV0Dmqz4aOtxCdcSYiKOLOsBsFZ3VfdxFflZw74ViXtEknv088YE1YG2z
 lBg=
X-SBRS: 2.7
X-MesageID: 784261
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="784261"
Date: Wed, 22 May 2019 17:43:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190522164354.dmyur2iu4g4w6ptm@Air-de-Roger>
References: <20190522163810.32964-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522163810.32964-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: fix alternative_callN
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yZ2V0IGFib3V0IHRoaXMgdmVyc2lvbiwgSSd2ZSB1cGRhdGVkIHRoZSBzdWJqZWN0IGFuZCBj
b21taXQKbWVzc2FnZSBhbmQgZm9yZ290IHRvIHJlLWdlbmVyYXRlIHRoZSBwYXRjaC4KCk9uIFdl
ZCwgTWF5IDIyLCAyMDE5IGF0IDA1OjM4OjEwUE0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPiBhbHRlcm5hdGl2ZV9jYWxsTiB1c2luZyBpbmxpbmUgYXNzZW1ibGUgdG8gZ2VuZXJhdGUg
dGhlIGFsdGVybmF0aXZlCj4gcGF0Y2ggc2l0ZXMgc2hvdWxkIGJlIHVzaW5nIHRoZSBBTFRFUk5B
VElWRSBDIHByZXByb2Nlc3NvciBtYWNybwo+IHJhdGhlciB0aGFuIHRoZSBBTFRFUk5BVElWRSBh
c3NlbWJseSBtYWNybywgdGhlIG1vcmUgdGhhdCB1c2luZyB0aGUKPiBhc3NlbWJseSBtYWNybyBp
biBhbiBpbmxpbmUgYXNzZW1ibHkgaW5zdGFuY2UgY2F1c2VzIHRoZSBmb2xsb3dpbmcKPiBlcnJv
ciBvbiBsbHZtIGJhc2VkIHRvb2xjaGFpbnM6Cj4gCj4gPGluc3RhbnRpYXRpb24+OjE6MTogZXJy
b3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwgKmdlbmFw
aWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3Jl
cGxfczEpIC0gKC4uLgo+IF4KPiA8aW5zdGFudGlhdGlvbj46MTozNzogZXJyb3I6IGludmFsaWQg
c3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJpcCk7
IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0gKC4u
Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA8aW5zdGFudGlhdGlv
bj46MTo2MDogZXJyb3I6IGludmFsaWQgcmVhc3NpZ25tZW50IG9mIG5vbi1hYnNvbHV0ZSB2YXJp
YWJsZSAnLkwwX2RpZmYnCj4gLkwwX29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlwKTsgLkww
X29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAuTDBfcmVwbF9zMSkgLSAoLi4uCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCj4gPGlubGluZSBhc20+OjE6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlv
bgo+ICAgICAgICAgQUxURVJOQVRJVkUgImNhbGwgKmdlbmFwaWMrNjQoJXJpcCkiLCAiY2FsbCAu
IiwgWDg2X0ZFQVRVUkVfTE0KPiAgICAgICAgIF4KPiA8aW5zdGFudGlhdGlvbj46MToxNTY6IGVy
cm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KPiAgIC4uLi0gKC5MMF9vcmlnX2UgLSAu
TDBfb3JpZ19zKTsgbWtub3BzICgoLSguTDBfZGlmZiA+IDApKSAqIC5MMF9kaWZmKTsgLkwwX29y
aWdfcDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+IDxpbnN0YW50aWF0aW9uPjoxODo1OiBlcnJvcjog
aW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5M
MF9yZXBsX2UxOgo+ICAgICBeCj4gPGluc3RhbnRpYXRpb24+OjE4OjI2OiBlcnJvcjogaW52YWxp
ZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5MMF9yZXBs
X2UxOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPGluc3RhbnRpYXRpb24+OjE6MTog
ZXJyb3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwgKmdl
bmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkww
X3JlcGxfczEpIC0gKC4uLgo+IF4KPiA8aW5zdGFudGlhdGlvbj46MTozNzogZXJyb3I6IGludmFs
aWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJp
cCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0g
KC4uLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA8aW5zdGFudGlh
dGlvbj46MTo2MDogZXJyb3I6IGludmFsaWQgcmVhc3NpZ25tZW50IG9mIG5vbi1hYnNvbHV0ZSB2
YXJpYWJsZSAnLkwwX2RpZmYnCj4gLkwwX29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlwKTsg
LkwwX29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAuTDBfcmVwbF9zMSkgLSAoLi4u
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCj4gPGlubGluZSBhc20+OjE6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlh
dGlvbgo+ICAgICAgICAgQUxURVJOQVRJVkUgImNhbGwgKmdlbmFwaWMrNjQoJXJpcCkiLCAiY2Fs
bCAuIiwgWDg2X0ZFQVRVUkVfTE0KPiAgICAgICAgIF4KPiA8aW5zdGFudGlhdGlvbj46MToxNTY6
IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KPiAgIC4uLi0gKC5MMF9vcmlnX2Ug
LSAuTDBfb3JpZ19zKTsgbWtub3BzICgoLSguTDBfZGlmZiA+IDApKSAqIC5MMF9kaWZmKTsgLkww
X29yaWdfcDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IDxpbnN0YW50aWF0aW9uPjoxODo1OiBlcnJv
cjogaW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47
IC5MMF9yZXBsX2UxOgo+ICAgICBeCj4gPGluc3RhbnRpYXRpb24+OjE4OjI2OiBlcnJvcjogaW52
YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5MMF9y
ZXBsX2UxOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPGluc3RhbnRpYXRpb24+OjE6
MTogZXJyb3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwg
KmdlbmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0g
LkwwX3JlcGxfczEpIC0gKC4uLgo+IF4KPiA8aW5zdGFudGlhdGlvbj46MTozNzogZXJyb3I6IGlu
dmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+IC5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQo
JXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEp
IC0gKC4uLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA8aW5zdGFu
dGlhdGlvbj46MTo2MDogZXJyb3I6IGludmFsaWQgcmVhc3NpZ25tZW50IG9mIG5vbi1hYnNvbHV0
ZSB2YXJpYWJsZSAnLkwwX2RpZmYnCj4gLkwwX29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlw
KTsgLkwwX29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAuTDBfcmVwbF9zMSkgLSAo
Li4uCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gPGlubGluZSBhc20+OjE6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFu
dGlhdGlvbgo+ICAgICAgICAgQUxURVJOQVRJVkUgImNhbGwgKmdlbmFwaWMrNjQoJXJpcCkiLCAi
Y2FsbCAuIiwgWDg2X0ZFQVRVUkVfTE0KPiAgICAgICAgIF4KPiA8aW5zdGFudGlhdGlvbj46MTox
NTY6IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KPiAgIC4uLi0gKC5MMF9vcmln
X2UgLSAuTDBfb3JpZ19zKTsgbWtub3BzICgoLSguTDBfZGlmZiA+IDApKSAqIC5MMF9kaWZmKTsg
LkwwX29yaWdfcDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IDxpbnN0YW50aWF0aW9uPjoxODo1OiBl
cnJvcjogaW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxs
IC47IC5MMF9yZXBsX2UxOgo+ICAgICBeCj4gPGluc3RhbnRpYXRpb24+OjE4OjI2OiBlcnJvcjog
aW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCj4gICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5M
MF9yZXBsX2UxOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gCj4gRml4ZXM6IDY3ZDAx
Y2RiNSAoIng4NjogaW5mcmFzdHJ1Y3R1cmUgdG8gYWxsb3cgY29udmVydGluZyBjZXJ0YWluIGlu
ZGlyZWN0IGNhbGxzIHRvIGRpcmVjdCBvbmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4v
aW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLmggfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvYWx0ZXJuYXRpdmUuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0ZXJu
YXRpdmUuaAo+IGluZGV4IDYzZDBhNDUwYmEuLjkyZTM1ODFiYzIgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9hbHRlcm5hdGl2ZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9hbHRlcm5hdGl2ZS5oCj4gQEAgLTIwMiw5ICsyMDIsOCBAQCBleHRlcm4gdm9pZCBhbHRlcm5h
dGl2ZV9icmFuY2hlcyh2b2lkKTsKPiAgICAgIHJldHR5cGUgcmV0XzsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgIHJlZ2lzdGVyIHVuc2ln
bmVkIGxvbmcgcjEwXyBhc20oInIxMCIpOyAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
IHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgcjExXyBhc20oInIxMSIpOyAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiAtICAgIGFzbSB2b2xhdGlsZSAoX19zdHJpbmdpZnkoQUxURVJOQVRJVkUgImNh
bGwgKiVjW2FkZHJdKCUlcmlwKSIsIFwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImNhbGwgLiIsICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0ZFQVRVUkVfQUxXQVlTKSAgICAgIFwKPiAr
ICAgIGFzbSB2b2xhdGlsZSAoQUxURVJOQVRJVkUoImNhbGwgKiVjW2FkZHJdKCUlcmlwKSIsICJj
YWxsIC4iLCAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0ZFQVRVUkVf
QUxXQVlTKSAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgOiBBTFRfQ0FM
TCAjIyBuICMjIF9PVVQsICI9YSIgKHJldF8pLCAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAg
ICAgICAgICAiPXIiIChyMTBfKSwgIj1yIiAocjExXykgQVNNX0NBTExfQ09OU1RSQUlOVCAgIFwK
PiAgICAgICAgICAgICAgICAgICAgOiBbYWRkcl0gImkiICgmKGZ1bmMpKSwgImciIChmdW5jKSAg
ICAgICAgICAgICAgIFwKPiAtLSAKPiAyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
