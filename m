Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116961F301
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 14:10:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsgh-0006mF-5d; Wed, 15 May 2019 12:07:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQsgf-0006mA-BF
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 12:07:09 +0000
X-Inumbo-ID: f604fa64-7709-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f604fa64-7709-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 12:07:08 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 1j9aHJvKoyxR/zq4zzUbwyKp/mMfGNpRFU+4XGIemc+kDjpQ+roJHWCPtkWQBaQRfpbpqWEem0
 Fe7kAI36iubuOS8Ak2i0Nc/vyY5QVuv3RE2taWqq2ucK7/JimdBJFqBTI11JQiWOpHu44IxtAj
 XOS6qmqByae6ZxtUXY+X7MH3CeTzUfenzwGZ+WKiDcFaZBrbRqY0R5iK3q1YNTLB+JG0iG+OpW
 MvrBynl4jeiAqeCBDn2YfyKKYpqNGW5wONnP8sG/SHNv24ESniMa/ThX25K2L9mdbNDbWainhp
 URU=
X-SBRS: 2.7
X-MesageID: 454372
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="454372"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
Date: Wed, 15 May 2019 13:07:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515114015.25492-1-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDUvMjAxOSAxMjo0MCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyB3YXMgcHJv
YmFibHkgdXNlZnVsIHRvIGxvYWQgRUxGIE5vdGUsIGJ1dCBub3cgRUxGIG5vdGVzCj4gInNob3Vs
ZCBsaXZlIGluIGEgUFRfTk9URSBzZWdtZW50IiAoZWxmbm90ZS5oKS4KPgo+IFdpdGggbm90ZXMg
bGl2aW5nIGluIHNlZ21lbnQsIHRoZXJlIGFyZSBubyBuZWVkIGZvciBzZWN0aW9ucywgc28gdGhl
cmUKPiBpcyBub3RoaW5nIHRvIGJlIHN0b3JlZCBpbiB0aGUgc2hzdHJ0YWIuCj4KPiBUaGlzIHBh
dGNoIHdvdWxkIGFsbG93IHRvIHdyaXRlIGEgc2ltcGxlciBFTEYgaGVhZGVyIGZvciBhbiBPVk1G
IGJsb2IKPiAod2hpY2ggaXNuJ3QgYW4gRUxGKSBhbmQgYWxsb3cgaXQgdG8gYmUgbG9hZGVkIGFz
IGEgUFZIIGtlcm5lbC4gVGhlCj4gaGVhZGVyIG9ubHkgbmVlZHMgdG8gZGVjbGFyZSB0d28gcHJv
Z3JhbSBzZWdtZW50czoKPiAtIG9uZSB0byB0ZWxsIGFuIEVMRiBsb2FkZXIgd2hlcmUgdG8gcHV0
IHRoZSBibG9iLAo+IC0gb25lIGZvciBhIFhlbiBFTEZOT1RFLgo+Cj4gVGhlIEVMRk5PVEUgaXMg
dG8gY29tcGx5IHRvIHRoZSBwdmggZGVzaWduIHdoaWNoIHdhbnRzIHRoZQo+IFhFTl9FTEZOT1RF
X1BIWVMzMl9FTlRSWSB0byBkZWNsYXJlIGEgYmxvYiBhcyBjb21wYXB0aWJsZSB3aXRoIHRoZSBQ
VkgKPiBib290IEFCSS4KPgo+IE5vdGUgdGhhdCB3aXRob3V0IHRoZSBFTEZOT1RFLCBsaWJ4YyB3
aWxsIGxvYWQgYW4gRUxGIGJ1dCB3aXRoCj4gdGhlIHBsYWluIEVMRiBsb2FkZXIsIHdoaWNoIGRv
ZXNuJ3QgY2hlY2sgZm9yIHNoc3RydGFiLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhjL3hjX2Rv
bV9lbGZsb2FkZXIuYyB8IDkgLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2RvbV9lbGZsb2FkZXIuYyBiL3Rv
b2xzL2xpYnhjL3hjX2RvbV9lbGZsb2FkZXIuYwo+IGluZGV4IDgyYjVmMmVlNzkuLmIzMjdkYjIx
OWQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jCj4gKysrIGIv
dG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jCj4gQEAgLTE2NSwxNSArMTY1LDYgQEAgc3Rh
dGljIGVsZl9uZWdlcnJub3ZhbCB4Y19kb21fcGFyc2VfZWxmX2tlcm5lbChzdHJ1Y3QgeGNfZG9t
X2ltYWdlICpkb20pCj4gICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICAgfQo+ICAKPiAtICAgIC8q
IEZpbmQgdGhlIHNlY3Rpb24taGVhZGVyIHN0cmluZ3MgdGFibGUuICovCj4gLSAgICBpZiAoIEVM
Rl9QVFJWQUxfSU5WQUxJRChlbGYtPnNlY19zdHJ0YWIpICkKPiAtICAgIHsKPiAtICAgICAgICB4
Y19kb21fcGFuaWMoZG9tLT54Y2gsIFhDX0lOVkFMSURfS0VSTkVMLCAiJXM6IEVMRiBpbWFnZSIK
PiAtICAgICAgICAgICAgICAgICAgICAgIiBoYXMgbm8gc2hzdHJ0YWIiLCBfX0ZVTkNUSU9OX18p
Owo+IC0gICAgICAgIHJjID0gLUVJTlZBTDsKPiAtICAgICAgICBnb3RvIG91dDsKPiAtICAgIH0K
ClRoaXMgbWlnaHQgYmUgZmluZSBmb3IgbmV3ZXIgYmluYXJpZXMsIGJ1dCB5b3UnbGwgYnJlYWsg
b2xkZXIgb25lcy4KCkluc3RlYWQsIHlvdSBzaG91bGQgc2tpcCBzZWFyY2hpbmcgZm9yIHN0cnRh
YiBpZiB3ZSd2ZSBhbHJlYWR5IGxvY2F0ZWQKdGhlIFhlbiBub3Rlcy4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
