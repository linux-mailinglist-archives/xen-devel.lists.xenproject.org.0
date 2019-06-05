Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC935EFF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:18:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWiJ-0005Mq-KO; Wed, 05 Jun 2019 14:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYWiH-0005Mi-RK
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:16:25 +0000
X-Inumbo-ID: 7de50420-879c-11e9-8793-cf1cd56f2584
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7de50420-879c-11e9-8793-cf1cd56f2584;
 Wed, 05 Jun 2019 14:16:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 08:16:20 -0600
Message-Id: <5CF7CEB0020000780023590B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 08:16:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-3-git-send-email-chao.gao@intel.com>
 <5CF682930200007800235268@prv1-mh.provo.novell.com>
 <20190605132209.sjex2t4tww25ezex@Air-de-Roger>
In-Reply-To: <20190605132209.sjex2t4tww25ezex@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 02/10] microcode/intel: extend
 microcode_update_match()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDE1OjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDA4OjM5OjE1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+PiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+PiA+IEBAIC0xMzQsMTQgKzEzNCwyOCBA
QCBzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8odW5zaWduZWQgaW50IGNwdV9udW0sIAo+IHN0
cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQo+PiA+ICAgICAgcmV0dXJuIDA7Cj4+ID4gIH0KPj4g
PiAgCj4+ID4gLXN0YXRpYyBpbmxpbmUgaW50IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+ID4g
LSAgICB1bnNpZ25lZCBpbnQgY3B1X251bSwgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJf
aW50ZWwgKm1jX2hlYWRlciwKPj4gPiAtICAgIGludCBzaWcsIGludCBwZikKPj4gPiArc3RhdGlj
IGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+PiA+
ICsgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciwgdW5z
aWduZWQgaW50IHNpZywKPj4gPiArICAgIHVuc2lnbmVkIGludCBwZiwgdW5zaWduZWQgaW50IHJl
dikKPj4gPiAgewo+PiA+IC0gICAgc3RydWN0IHVjb2RlX2NwdV9pbmZvICp1Y2kgPSAmcGVyX2Nw
dSh1Y29kZV9jcHVfaW5mbywgY3B1X251bSk7Cj4+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5k
ZWRfc2lndGFibGUgKmV4dF9oZWFkZXI7Cj4+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRf
c2lnbmF0dXJlICpleHRfc2lnOwo+PiA+ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhX3NpemUgPSBn
ZXRfZGF0YXNpemUobWNfaGVhZGVyKTsKPj4gPiArICAgIHVuc2lnbmVkIGludCBpOwo+PiA+ICsK
Pj4gPiArICAgIGlmICggc2lnbWF0Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYsIG1jX2hlYWRl
ci0+cGYpICkKPj4gPiArICAgICAgICByZXR1cm4gKG1jX2hlYWRlci0+cmV2ID4gcmV2KSA/IE5F
V19VQ09ERSA6IE9MRF9VQ09ERTsKPj4gCj4+IEFzIGluZGljYXRlZCBiZWZvcmUsIEkgdGhpbmsg
eW91IHdvdWxkIGJldHRlciBhbHNvIHByb3ZpZGUgYW4gImVxdWFsIgo+PiBpbmRpY2F0aW9uLiBJ
aXJjIEkndmUgdG9sZCB5b3UgdGhhdCBJIGhhdmUgb25lIHN5c3RlbSB3aGVyZSB0aGUgY29yZXMK
Pj4gZ2V0IGhhbmRlZCBvdmVyIGZyb20gdGhlIEJJT1MgaW4gYW4gaW5jb25zaXN0ZW50IHN0YXRl
IChvbmx5IGNvcmUKPj4gaGFzIHVjb2RlIGxvYWRlZCkuIEhlbmNlIHdlJ2Qgd2FudCB0byBiZSBh
YmxlIHRvIGFsc28gX3N0b3JlXwo+PiB1Y29kZSBtYXRjaGluZyB0aGF0IGZvdW5kIG9uIENQVSAw
LCB3aXRob3V0IGFjdHVhbGx5IHdhbnQgdG8gX2xvYWRfCj4+IGl0IHRoZXJlLgo+IAo+IEhtLCB3
aXRob3V0IG1lIGJlaW5nIGFuIGV4cGVydCBvbiBtaWNyb2NvZGUsIGlzbid0IHN1Y2ggYSBzeXN0
ZW0gdXR0ZXJseQo+IGJyb2tlbj8KCkl0J3Mgd29ya2luZyBmaW5lIChmcm9tIGFsbCBJIGNhbiB0
ZWxsKS4gSXQgcmVhbGx5IGRlcGVuZHMgb24gd2hhdCBleGFjdGx5CnRoZSB1Y29kZSB1cGRhdGUg
Y2hhbmdlcy4KCj4gSSdtIG5vdCBhZ2FpbnN0IG1ha2luZyBYZW4gY2FwYWJsZSBvZiBib290aW5n
IGluIHRoaXMgc2NlbmFyaW8gd2hlcmUKPiBmaXJtd2FyZSBsZWF2ZXMgdGhlIENQVXMgd2l0aCBk
aWZmZXJlbnQgbWljcm9jb2RlIHZlcnNpb25zLCBidXQgdGhpcwo+IGlzIHNvbWV0aGluZyB0aGF0
IHNob3VsZCBiZSByZXBvcnRlZCB0byB0aGUgdmVuZG9yIGluIG9yZGVyIHRvIGdldCBpdAo+IGZp
eGVkIElNTz8KCkkgZGlkIHJlcG9ydCBpdCwgeWVhcnMgYWdvLgoKPiBXaGF0IGhhcHBlbnMgd2hl
biB5b3UgZG9uJ3QgbG9hZCBhbnkgbWljcm9jb2RlIGF0IGFsbCwgaXMgdGhlIHN5c3RlbQo+IGNh
cGFibGUgb2Ygb3BlcmF0aW5nIG5vcm1hbGx5IHdpdGggc3VjaCBtaXhlZCBtaWNyb2NvZGU/CgpZ
ZXMuIE9idmlvdXNseSB0aGVyZSBhcmUgYW5vbWFsaWVzIChsaWtlIGZpeGVkIGVycmF0YSBvZiBw
YXJ0aWN1bGFyCmluc25zIHNob3dpbmcgdXAgb3Igbm90IGRlcGVuZGluZyBvbiB3aGF0IGNvcmUg
YSBwcm9jZXNzIGV4ZWN1dGVzKSwKYnV0IHRoZSBzeXN0ZW0gaGFzIGJlZW4gc3RhYmxlIHRoaXMg
d2F5IGZvciBtYW55IHllYXJzLiAoSSd2ZSBhbHdheXMKYmVlbiBkb2luZyBlYXJseSBsb2FkaW5n
IG9mIHVjb2RlIHdoZW4gcnVubmluZyBpdCB3aXRoIFhlbiwgYnV0IHRoZQpkaXN0cm8gdGhhdCdz
IG9uIGl0IG5ldmVyIG1hbmFnZWQgdG8gYXJyYW5nZSBmb3IgZWFybHkgdWNvZGUgbG9hZGluZwp3
aGVuIGJvb3RpbmcgYSBiYXJlIG1ldGFsIGtlcm5lbCkuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
