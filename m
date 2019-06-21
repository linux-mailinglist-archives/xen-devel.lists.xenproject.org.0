Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7324E9BB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 15:44:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heJnK-0003yi-Pq; Fri, 21 Jun 2019 13:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heJnI-0003ya-Ov
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 13:41:32 +0000
X-Inumbo-ID: 45183320-942a-11e9-afbd-fb55c5b74b79
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45183320-942a-11e9-afbd-fb55c5b74b79;
 Fri, 21 Jun 2019 13:41:28 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wp7CvgqH0wjTTScn08D2E7OLP/89oR+cNFIFcu5HcAzs31j+HPRhjQYKRZsa8WNuUWvSv+LkNP
 uB5cDlobvLxoOcH7fdHNFQ43WuxDKgUIxiO/Guz01A7eH+jxhD/JQrRByI7lp8Si5tRjUbJ/un
 +XyATMpGmn9/1AXqIhZ2bVT9nTjbWxvyiic60WpzBR7JsuuNBrQAnaYRktuBSHBvTkG3hiVULr
 qv8ba+X5VTwEkRJ4z7ZH6ZPi30qTNIGFwZ7xqTEZ1WyBjid6oWVfrGmV/KVBmy4qy5SbEkzfh5
 xuQ=
X-SBRS: 2.7
X-MesageID: 2070411
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2070411"
Date: Fri, 21 Jun 2019 15:41:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190621134120.7njtc4t7j2hil6yi@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190621114635.22ylw4zh6tsika6j@MacBook-Air-de-Roger.local>
 <5D0CC87D020000780023A128@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0CC87D020000780023A128@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDY6MDc6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjA2LjE5IGF0IDEzOjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MzQ6MTNBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVB
TSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEz
OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gSWYgdGhlIGh5cGVy
dmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+
ID4+ID4+ID4gVGhpcyBhbGxvd3MgdG8gcG9zaXRpb24gdGhlIC5yZWxvYyBzZWN0aW9uIGNvcnJl
Y3RseSBpbiB0aGUgb3V0cHV0Cj4gPj4gPj4gPiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBt
aWdodCBwbGFjZSAucmVsb2MgYmVmb3JlIHRoZSAudGV4dAo+ID4+ID4+ID4gc2VjdGlvbi4KPiA+
PiA+PiA+IAo+ID4+ID4+ID4gTm90ZSB0aGF0IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBi
ZWZvcmUgLmJzcyBmb3IgdHdvIHJlYXNvbnM6IGluCj4gPj4gPj4gPiBvcmRlciBmb3IgdGhlIHJl
c3VsdGluZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBkYXRhCj4gPj4g
Pj4gPiBhZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBmaWxlIHNpemUgY2FuIGJlIHNtYWxsZXIgdGhh
biB0aGUgbG9hZGVkCj4gPj4gPj4gPiBtZW1vcnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhlIGRhdGEg
aXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBpdAo+ID4+ID4+ID4gYmVsb25ncyB3aXRoIHRo
ZSBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25seSBkYXRhLgo+ID4+ID4+IAo+ID4+
ID4+IFdoaWxlIHRoaXMgbWF5IGJlIGZpbmUgZm9yIEVMRiwgSSdtIGFmcmFpZCBpdCB3b3VsZCBi
ZSBjYWxsaW5nIGZvcgo+ID4+ID4+IHN1YnRsZSBpc3N1ZXMgd2l0aCB4ZW4uZWZpIChpLmUuIHRo
ZSBQRSBiaW5hcnkpOiBUaGVyZSBhIC5yZWxvYwo+ID4+ID4+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5
IGV4cGVjdGVkIHRvIGNvbWUgYWZ0ZXIgIm5vcm1hbCIgZGF0YQo+ID4+ID4+IHNlY3Rpb25zLgo+
ID4+ID4gCj4gPj4gPiBPSywgd291bGQgeW91IGxpa2UgbWUgdG8gbGVhdmUgdGhlIC5yZWxvYyBz
ZWN0aW9uIGF0IHRoZSBwcmV2aW91cwo+ID4+ID4gcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhl
bj8KPiA+PiAKPiA+PiBXZWxsLCB0aGlzIHBhcnQgaXMgYSByZXF1aXJlbWVudCwgbm90IGEgcXVl
c3Rpb24gb2YgbWUgbGlraW5nIHlvdQo+ID4+IHRvIGRvIHNvLgo+ID4+IAo+ID4+ID4gT3IgZG8g
d2UgcHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBoYW5lZCBpbiB0aGUgRUxGIGJ1aWxkPwo+ID4+
IAo+ID4+IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24gaGVyZSB3aXRoIGhpcyBwbGFucyB0
byBhY3R1YWxseQo+ID4+IGFkZCByZWxvY2F0aW9ucyB0aGVyZSBpbiB0aGUgbm9uLWxpbmtlci1n
ZW5lcmF0ZWQtUEUgYnVpbGQuIEkKPiA+PiBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gZWl0
aGVyIHdheSwgYXMgbG9uZyBhcyB0aGUKPiA+PiBjdXJyZW50IG1ldGhvZCBvZiBidWlsZGluZyBn
ZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCj4gPj4gCj4gPj4gQWxzbyBhIHJl
bWFyayByZWdhcmRpbmcgdGhlIHRpdGxlIC0gaW4gbXkgYnVpbGRzIHRoZXJlIGFscmVhZHkgaXMK
PiA+PiBhIC5yZWxvYyBzZWN0aW9uIGluIHRoZSBFTEYgaW1hZ2VzLCBzbyAiYWRkIiBkb2Vzbid0
IHJlYWxseSBzZWVtCj4gPj4gY29ycmVjdCB0byBtZS4gSXQgc2l0cyByaWdodCBhZnRlciAucm9k
YXRhLCBhbmQgSSB3b3VsZCBpdCBkb2Vzbid0Cj4gPj4gZ2V0IGZvbGRlZCBpbnRvIHRoZXJlIGJl
Y2F1c2UgLSBmb3Igc29tZSByZWFzb24gLSAucm9kYXRhIGlzCj4gPj4gYWN0dWFsbHkgbWFya2Vk
IHdyaXRhYmxlLgo+ID4gCj4gPiBBRkFJQ1QgLnJvZGF0YSBpcyBtYXJrZWQgd3JpdGFibGUgYmVj
YXVzZSBpdCBjb250YWlucyAuZGF0YS5wYXJhbSBhbmQKPiA+IC5kYXRhLnJlbC5yby4gSSdtIHVu
c3VyZSB3aHkgd2UgbmVlZCAuZGF0YS5yZWwucm8sIEkgd291bGQgYXNzdW1lIHRoYXQKPiA+IG9u
Y2UgdGhlIGZpbmFsIGJpbmFyeSBoYXMgYmVlbiBsaW5rZWQgLmRhdGEucmVsLnJvIHdvdWxkIGJl
IGVtcHR5LAo+ID4gc2luY2UgdGhlcmUncyBubyBydW4gdGltZSBsaW5raW5nIG9yIHJlbG9jYXRp
b24gYXMgWGVuIGlzIGEgc3RhbmRhbG9uZQo+ID4gYmluYXJ5Lgo+IAo+IE5vIC0gY29udGVudHMg
b2Ygc2VjdGlvbnMgZG9uJ3QgZ2V0IG1vdmVkIHRvIG90aGVyIHNlY3Rpb25zIHdoaWxlCj4gbGlu
a2luZywgdW5sZXNzIGluc3RydWN0ZWQgc28gYnkgdGhlIGxpbmtlciBzY3JpcHQuIEluIGFsbCB0
aGUKPiByZWxvY2F0YWJsZSBvYmplY3RzIHRoZXJlJ3MgZ29pbmcgdG8gYmUgLmRhdGEucmVsLnJv
LCBhbmQgaGVuY2UgdGhlCj4gbGlua2VyIHNjcmlwdCBoYXMgdG8gcHV0IHRoZW0gc29tZXdoZXJl
IChvciBsZWF2ZSBpdCB0byBkZWZhdWx0Cj4gcGxhY2VtZW50IGJ5IHRoZSBsaW5rZXIpLgoKUmln
aHQsIHNvIGFzIGxvbmcgYXMgd2UgcGxhY2UgLmRhdGEucmVsLnJvIGluc2lkZSBvZiAucm9kYXRh
IHRoZQpyZXN1bHRpbmcgc2VjdGlvbiBpcyBhbHdheXMgZ29pbmcgdG8gYmUgd3JpdGFibGUsIGR1
ZSB0byB0aGUgaW5wdXQKLmRhdGEucmVsLnJvIGJlaW5nIHdyaXRhYmxlLgoKPiBIbW0sIHRoaW5r
aW5nIGFib3V0IGl0IC0gYXJlIHlvdSBwZXJoYXBzIG1peGluZyB1cCAuZGF0YS5yZWwgLwo+IC5k
YXRhLnJlbC5ybyB3aXRoIC5yZWwuZGF0YSAvIC5yZWxhLmRhdGE/CgpZZXMsIEkgdGhpbmsgSSBt
ZXNzZWQgdXAuIEFzIHlvdSBzYXksIGNvbnRlbnRzIG9mIHNlY3Rpb25zIGRvbid0IG1vdmUKdW5s
ZXNzIGV4cGxpY2l0bHkgZG9uZSBieSB0aGUgbGlua2VyIHNjcmlwdC4KCj4gPiBSZWdhcmRpbmcg
LmRhdGEucGFyYW0gaXQgc2hvdWxkIGJlIHJlbmFtZWQgdG8gLnJvZGF0YS5wYXJhbSwgYW5kIEkK
PiA+IHNob3VsZCB0YWtlIGEgbG9vayBhdCB3aHkgaXQncyBtYXJrZWQgYXMgJ1dBJyBpbnN0ZWFk
IG9mICdBJy4KPiAKPiBXZWxsLCB0aGVyZSdzIG5vICJjb25zdCIgb24gdGhlIHN0cnVjdHVyZSBp
bnN0YW50aWF0aW9ucy4KCkkgdGhpbmsgdGhlcmUgaXMgaW5kZWVkIGEgY29uc3Qgb24gdGhlIGlu
c3RhbnRpYXRpb24sIHNlZSBfX3BhcmFtCm1hY3JvIGluIGluaXQuaCB3aGljaCBpcyB1c2VkIGlu
IHRoZSBkZWNsYXJhdGlvbnMgZG9uZSB3aXRoCl9fcnRwYXJhbS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
