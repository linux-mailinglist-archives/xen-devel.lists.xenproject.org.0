Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A88158C5
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 07:11:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNsKr-0007ak-2N; Tue, 07 May 2019 05:08:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNsKq-0007af-41
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 05:08:12 +0000
X-Inumbo-ID: 15c7e4b6-7086-11e9-90e2-03c35d253dbb
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15c7e4b6-7086-11e9-90e2-03c35d253dbb;
 Tue, 07 May 2019 05:08:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2D58ACD4;
 Tue,  7 May 2019 05:07:59 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <08beb838-2b30-4efd-ab84-8bacd4ed9061@suse.com>
Date: Tue, 7 May 2019 07:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506153211.GV1502@mail-itl>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDUvMjAxOSAxNzozMiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDA1OjE1OjE5UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6Cj4+IE9uIDA2LzA1LzIwMTkgMTY6NTAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMveGVuLmgKPj4+IGluZGV4IGNjZGZmYzAuLmIwZjBmN2UgMTAwNjQ0Cj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy94ZW4uaAo+Pj4gQEAgLTkyMyw2ICs5MjMsOCBAQCB0eXBlZGVmIHN0cnVjdCBkb20wX3Zn
YV9jb25zb2xlX2luZm8gewo+Pj4gICAgICAgICAgICAgIC8qIE1vZGUgYXR0cmlidXRlcyAob2Zm
c2V0IDB4MCwgVkVTQSBjb21tYW5kIDB4NGYwMSkuICovCj4+PiAgICAgICAgICAgICAgdWludDE2
X3QgbW9kZV9hdHRyczsKPj4+ICAjZW5kaWYKPj4+ICsgICAgICAgICAgICAvKiBoaWdoIDMyIGJp
dHMgb2YgbGZiX2Jhc2UgKi8KPj4+ICsgICAgICAgICAgICB1aW50MzJfdCBleHRfbGZiX2Jhc2U7
Cj4+Cj4+IFlvdSB3aWxsIG5lZWQgdG8gcHV0IHRoaXMgYWRkaXRpb24gaW50byBhbjoKPj4KPj4g
I2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPj0gMHgwMDA0MGQwMAo+PiAuLi4KPj4gI2Vu
ZGlmCj4+Cj4+IHNlY3Rpb24gKG9ubHkgYXZhaWxhYmxlIGZyb20gWGVuIDQuMTMgb253YXJkcyku
Cj4gCj4gV2h5IGV4YWN0bHk/IEkgZG9uJ3Qgc2VlIHRoaXMgc3RydWN0dXJlIHVzZWQgaW4gYW55
IGh5cGVyY2FsbCBhcmd1bWVudC4KPiBUaGUgb25seSBleHRlcm5hbGx5IGFjY2Vzc2libGUgcGxh
Y2UgaXMgc3RhcnRfaW5mbyBzdHJ1Y3R1cmUsIHdoZXJlIGl0Cj4gaGFzIGV4cGxpY2l0IHN0cnVj
dCBzaXplIGFscmVhZHkuCgpXaXRoIHRoZSAjaWZkZWYuLi4jZW5kaWYganVzdCBhYm92ZSB5b3Vy
IGFkZGl0aW9uIGEgY29uc3VtZXIgdXNpbmcgYW4KaW50ZXJmYWNlIHZlcnNpb24gPCAweDAwMDMw
MjA2IGNvdWxkIHRoaW5rIGdibF9jYXBzIGlzIGF2YWlsYWJsZSBpbnN0ZWFkCm9mIGV4dF9sZmJf
YmFzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
