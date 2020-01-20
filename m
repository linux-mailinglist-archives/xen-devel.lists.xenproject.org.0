Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5411142F6F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:17:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZhz-0005Uc-Us; Mon, 20 Jan 2020 16:15:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itZhy-0005UX-Me
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:15:22 +0000
X-Inumbo-ID: 0c230ba8-3ba0-11ea-b99a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c230ba8-3ba0-11ea-b99a-12813bfff9fa;
 Mon, 20 Jan 2020 16:15:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDF54B1C5;
 Mon, 20 Jan 2020 16:15:16 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
 <20200120160732.GC11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3b70e5b-d017-c934-ea84-46e3d653905f@suse.com>
Date: Mon, 20 Jan 2020 17:15:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120160732.GC11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
 KevinTian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxNzowNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDQ6NDI6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+IEBAIC0xNDkzLDE4ICsxNDkzLDI4IEBAIHN0
YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZyhzdHJ1Y3QKPj4gICAgICAgICAgaWYgKCBm
aW5kX3Vwc3RyZWFtX2JyaWRnZShzZWcsICZidXMsICZkZXZmbiwgJnNlY2J1cykgPCAxICkKPj4g
ICAgICAgICAgICAgIGJyZWFrOwo+PiAgCj4+ICsgICAgICAgIC8qCj4+ICsgICAgICAgICAqIE1h
cHBpbmcgYSBicmlkZ2Ugc2hvdWxkLCBpZiBhbnl0aGluZywgcGFzcyB0aGUgc3RydWN0IHBjaV9k
ZXYgb2YKPj4gKyAgICAgICAgICogdGhhdCBicmlkZ2UuIFNpbmNlIGJyaWRnZXMgZG9uJ3Qgbm9y
bWFsbHkgZ2V0IGFzc2lnbmVkIHRvIGd1ZXN0cywKPj4gKyAgICAgICAgICogdGhlaXIgb3duZXIg
d291bGQgYmUgdGhlIHdyb25nIG9uZS4gUGFzcyBOVUxMIGluc3RlYWQuCj4+ICsgICAgICAgICAq
Lwo+PiAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZShkb21haW4sIGRy
aGQtPmlvbW11LCBidXMsIGRldmZuLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBidXMsIGRldmZuKSk7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOwo+PiAgCj4+ICAgICAgICAgIC8q
Cj4+ICAgICAgICAgICAqIERldmljZXMgYmVoaW5kIFBDSWUtdG8tUENJL1BDSXggYnJpZGdlIG1h
eSBnZW5lcmF0ZSBkaWZmZXJlbnQKPj4gICAgICAgICAgICogcmVxdWVzdGVyLWlkLiBJdCBtYXkg
b3JpZ2luYXRlIGZyb20gZGV2Zm49MCBvbiB0aGUgc2Vjb25kYXJ5IGJ1cwo+PiAgICAgICAgICAg
KiBiZWhpbmQgdGhlIGJyaWRnZS4gTWFwIHRoYXQgaWQgYXMgd2VsbCBpZiB3ZSBkaWRuJ3QgYWxy
ZWFkeS4KPj4gKyAgICAgICAgICoKPj4gKyAgICAgICAgICogU29tZXdoYXQgc2ltaWxhciBhcyBm
b3IgYnJpZGdlcywgd2UgZG9uJ3Qgd2FudCB0byBwYXNzIGEgc3RydWN0Cj4+ICsgICAgICAgICAq
IHBjaV9kZXYgaGVyZSAtIHRoZXJlIG1heSBub3QgZXZlbiBleGlzdCBvbmUgZm9yIHRoaXMgKHNl
Y2J1cywwLDApCj4+ICsgICAgICAgICAqIHR1cGxlLiBJZiB0aGVyZSBpcyBvbmUsIHdpdGhvdXQg
cHJvcGVybHkgd29ya2luZyBkZXZpY2UgZ3JvdXBzIGl0Cj4+ICsgICAgICAgICAqIG1heSBhZ2Fp
biBub3QgaGF2ZSB0aGUgY29ycmVjdCBvd25lci4KPj4gICAgICAgICAgICovCj4+ICAgICAgICAg
IGlmICggIXJldCAmJiBwZGV2X3R5cGUoc2VnLCBidXMsIGRldmZuKSA9PSBERVZfVFlQRV9QQ0ll
MlBDSV9CUklER0UgJiYKPj4gICAgICAgICAgICAgICAoc2VjYnVzICE9IHBkZXYtPmJ1cyB8fCBw
ZGV2LT5kZXZmbiAhPSAwKSApCj4+ICAgICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9t
YXBwaW5nX29uZShkb21haW4sIGRyaGQtPmlvbW11LCBzZWNidXMsIDAsCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBzZWNi
dXMsIDApKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5VTEwpOwo+IAo+IElzbid0IGl0IGRhbmdlcm91cyB0byBtYXAgdGhpcyBkZXZpY2UgdG8gdGhl
IGd1ZXN0LCBhbmQgdGhhdCBtdWx0aXBsZQo+IGd1ZXN0cyBtaWdodCBlbmQgdXAgd2l0aCB0aGUg
c2FtZSBkZXZpY2UgbWFwcGVkPwoKVGhleSB3b24ndCAoYWZhaWN0KSAtIHNlZSB0aGUgY2hlY2tp
bmcgZG9uZSBieSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZSgpCndoZW4gaXQgZmluZHMgYW4g
YWxyZWFkeSBwcmVzZW50IGNvbnRleHQgZW50cnkuIFRoZSBmaXJzdCBvbmUgdG8gbWFrZSBzdWNo
CmEgbWFwcGluZyB3aWxsIHdpbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
