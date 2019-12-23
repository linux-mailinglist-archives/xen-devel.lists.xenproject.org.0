Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A954D1293B4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 10:39:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijK9F-0003GR-5e; Mon, 23 Dec 2019 09:37:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ijK9D-0003GM-DK
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 09:37:07 +0000
X-Inumbo-ID: c7a3b372-2567-11ea-96b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7a3b372-2567-11ea-96b7-12813bfff9fa;
 Mon, 23 Dec 2019 09:37:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67A6AABCD;
 Mon, 23 Dec 2019 09:37:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
Date: Mon, 23 Dec 2019 10:37:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxODozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDE3OjI3LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+IE9uIEZyaSwgRGVjIDIwLCAyMDE5IGF0
IDk6NDcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDE4
LjEyLjIwMTkgMjA6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBDdXJyZW50bHkgdGhl
IGh2bSBwYXJhbWV0ZXJzIGFyZSBvbmx5IGFjY2Vzc2libGUgdmlhIHRoZSBIVk1PUCBoeXBlcmNh
bGxzLiBCeQo+Pj4+IGV4cG9zaW5nIGh2bV97Z2V0L3NldH1fcGFyYW0gaXQgd2lsbCBiZSBwb3Nz
aWJsZSBmb3IgVk0gZm9ya2luZyB0byBjb3B5IHRoZQo+Pj4+IHBhcmFtZXRlcnMgZGlyZWN0bHkg
aW50byB0aGUgY2xvbmUgZG9tYWluLgo+Pj4gSGF2aW5nIHBlZWtlZCBhaGVhZCBhdCBwYXRjaCAx
Nywgd2hlcmUgdGhpcyBnZXRzIHVzZWQsIEkgd29uZGVyIHdoeQo+Pj4geW91IHdhbnQgYSBwYWly
IG9mIG9uZS1ieS1vbmUgZnVuY3Rpb25zLCByYXRoZXIgdGhhbiBhIGNvcHktYWxsIG9uZS4KPj4+
IFRoaXMgdGhlbiB3b3VsZG4ndCByZXF1aXJlIGV4cG9zdXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91
IHRvdWNoIGhlcmUuCj4+IFdlbGwsIHByb3ZpZGVkIHRoZXJlIGlzIG5vIHN1Y2ggZnVuY3Rpb24g
aW4gZXhpc3RlbmNlIHRvZGF5IGl0IHdhcwo+PiBqdXN0IGVhc2llciB0byB1c2Ugd2hhdCdzIGFs
cmVhZHkgYXZhaWxhYmxlLiBJIHN0aWxsIHdvdWxkbid0IHdhbnQgdG8KPj4gaW1wbGVtZW50IGEg
b25lLXNob3QgZnVuY3Rpb24gbGlrZSB0aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNvZGUtcGF0aCBp
cwo+PiBzaGFyZWQgYnkgdGhlIHNhdmUtcmVzdG9yZSBvcGVyYXRpb25zIG9uIHRoZSB0b29sc3Rh
Y2sgc2lkZSwgc28gYXQKPj4gbGVhc3QgSSBoYXZlIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uIHRo
YXQgaXQgd29uJ3QgYnJlYWsgb24gbWUgaW4gdGhlCj4+IGZ1dHVyZS4KPiAKPiBJbiBwYXJ0aWN1
bGFyLCBhIG51bWJlciBvZiB0aGUgc2V0IG9wZXJhdGlvbnMgYXJlIGRpc3RpbmN0bHkKPiBub24t
dHJpdmlhbC4KCkhvdyBpcyB0cml2aWFsIG9yIG5vdCByZWxhdGVkIHRvIHRoZXJlIGJlaW5nIG9u
ZSBmdW5jdGlvbiBkb2luZwp0aGUgbG9vcGluZyB3YW50ZWQgaGVyZSB2cyB0aGUgbG9vcGluZyBi
ZWluZyBkb25lIGJ5IHRoZSBjYWxsZXIKYXJvdW5kIHRoZSB0d28gcGVyLWVudGl0eSBjYWxscz8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
