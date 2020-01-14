Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F198413AA0A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 14:04:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLp3-0000im-KH; Tue, 14 Jan 2020 13:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irLp1-0000ih-Es
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 13:01:27 +0000
X-Inumbo-ID: f42aaee2-36cd-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f42aaee2-36cd-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 13:01:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCC33ACE1;
 Tue, 14 Jan 2020 13:01:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200114123921.30850-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <acee9e6a-74bf-8c21-4032-9efebf13d897@suse.com>
Date: Tue, 14 Jan 2020 14:01:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200114123921.30850-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/libxc: Construct 32bit PV guests with
 L3 A/D bits set
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxMzozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaXRoIHRoZSAzMiBQ
QUUgYnVpbGQgb2YgWGVuIGdvbmUsIDMyYml0IFBWIGd1ZXN0cycgdG9wIGxldmVsIHBhZ2V0YWJs
ZXMgbm8KPiBsb25nZXIgYmVoYXZlIGV4YWN0bHkgbGlrZSBQQUUgaW4gaGFyZHdhcmUuCj4gCj4g
VGhleSBzaG91bGQgaGF2ZSBBL0QgYml0cyBzZXQsIGZvciB0aGUgc2FtZSBwZXJmb3JtYW5jZSBy
ZWFzb25zIGFzIGFwcGx5IHRvCj4gb3RoZXIgbGV2ZWxzLiAgVGhpcyBicmluZ3MgdGhlIGRvbWFp
biBidWlsZGVyIGluIGxpbmUgd2l0aCBob3cgWGVuIGNvbnN0cnVjdHMKPiBhIDMyYml0IGRvbTAu
Cj4gCj4gQXMgYSBwdXJlbHkgY29kZSBpbXByb3ZlbWVudCwgbWFrZSB1c2Ugb2YgcmFuZ2Ugbm90
YXRpb24gdG8gaW5pdGlhbGlzZQo+IGlkZW50aWNhbCB2YWx1ZXMgaW4gYWRqYWNlbnQgYXJyYXkg
ZWxlbWVudHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cgo+IEl0IHR1cm5zIG91dCB0aGF0IG5laXRoZXIgWGVuIG5vciBsaWJ4YyBzZXRzIGRpcnR5
IGJpdHMgb24gTDEgcGFnZXRhYmxlcywgYnV0Cj4gSSBjYW4ndCBzcG90IGFueSBkb2N1bWVudGVk
IHJlYXNvbiBmb3IgdGhpcy4gIE15IGJlc3QgZ3Vlc3MgaXMgdG8gYXZvaWQgaGF2aW5nCj4gRC9S
TyBtYXBwaW5ncyBvZiBwYWdldGFibGVzLCBidXQgdGhpcyBpc24ndCBnb2luZyB0byB0cmlwIHVw
IGEgUFYgZ3Vlc3QgdG8KPiBiZWdpbiB3aXRoLiAgVGhvdWdodHMgb24gcmVkdWNpbmcgdGhlIHBl
cmZvcm1hbmNlIGNvc3QgdGhlcmUgYXMgd2VsbD8KCkknZCBhY2sgc3VjaCBhIHBhdGNoLgoKPiAt
LS0gYS90b29scy9saWJ4Yy94Y19kb21feDg2LmMKPiArKysgYi90b29scy9saWJ4Yy94Y19kb21f
eDg2LmMKPiBAQCAtMjc3LDggKzI3Nyw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfcGd0YWJsZXNfeDg2
XzMyX3BhZShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4gICAgICAgICAgLmxldmVscyA9IFBH
VEJMX0xFVkVMU19JMzg2LAo+ICAgICAgICAgIC52YWRkcl9tYXNrID0gYml0c190b19tYXNrKFZJ
UlRfQklUU19JMzg2KSwKPiAgICAgICAgICAubHZsX3Byb3RbMF0gPSBfUEFHRV9QUkVTRU5UfF9Q
QUdFX1JXfF9QQUdFX0FDQ0VTU0VELAo+IC0gICAgICAgIC5sdmxfcHJvdFsxXSA9IF9QQUdFX1BS
RVNFTlR8X1BBR0VfUld8X1BBR0VfQUNDRVNTRUR8X1BBR0VfRElSVFl8X1BBR0VfVVNFUiwKPiAt
ICAgICAgICAubHZsX3Byb3RbMl0gPSBfUEFHRV9QUkVTRU5ULAo+ICsgICAgICAgIC5sdmxfcHJv
dFsxIC4uLiAyXSA9Cj4gKyAgICAgICAgICAgIF9QQUdFX1BSRVNFTlR8X1BBR0VfUld8X1BBR0Vf
QUNDRVNTRUR8X1BBR0VfRElSVFl8X1BBR0VfVVNFUiwKClBlcmhhcHMgd29ydGh3aGlsZSBsZWF2
aW5nIGEgY29tbWVudCBhcyB0byB0aGUgZGlmZmVyZW5jZSB0byB3aGF0CnJlYWRlcnMgbWlnaHQg
ZXhwZWN0IGZvciBQQUUgTDMgZW50cmllcz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
