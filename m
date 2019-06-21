Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E627D4E7D4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 14:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heIKO-0003vx-47; Fri, 21 Jun 2019 12:07:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heIKM-0003vn-Dh
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 12:07:34 +0000
X-Inumbo-ID: 2636dfc9-941d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2636dfc9-941d-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 12:07:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 06:07:31 -0600
Message-Id: <5D0CC87D020000780023A128@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 06:07:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190621114635.22ylw4zh6tsika6j@MacBook-Air-de-Roger.local>
In-Reply-To: <20190621114635.22ylw4zh6tsika6j@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
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

Pj4+IE9uIDIxLjA2LjE5IGF0IDEzOjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDEyOjM0OjEzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMDYuMTkgYXQgMTc6MDYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxOS4wNi4xOSBhdCAxMzowMiwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBJZiB0aGUgaHlwZXJ2aXNvciBoYXMgYmVlbiBi
dWlsdCB3aXRoIEVGSSBzdXBwb3J0IChpZTogbXVsdGlib290MikuCj4+ID4+ID4gVGhpcyBhbGxv
d3MgdG8gcG9zaXRpb24gdGhlIC5yZWxvYyBzZWN0aW9uIGNvcnJlY3RseSBpbiB0aGUgb3V0cHV0
Cj4+ID4+ID4gYmluYXJ5LCBvciBlbHNlIHRoZSBsaW5rZXIgbWlnaHQgcGxhY2UgLnJlbG9jIGJl
Zm9yZSB0aGUgLnRleHQKPj4gPj4gPiBzZWN0aW9uLgo+PiA+PiA+IAo+PiA+PiA+IE5vdGUgdGhh
dCB0aGUgLnJlbG9jIHNlY3Rpb24gaXMgbW92ZWQgYmVmb3JlIC5ic3MgZm9yIHR3byByZWFzb25z
OiBpbgo+PiA+PiA+IG9yZGVyIGZvciB0aGUgcmVzdWx0aW5nIGJpbmFyeSB0byBub3QgY29udGFp
biBhbnkgc2VjdGlvbiB3aXRoIGRhdGEKPj4gPj4gPiBhZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBm
aWxlIHNpemUgY2FuIGJlIHNtYWxsZXIgdGhhbiB0aGUgbG9hZGVkCj4+ID4+ID4gbWVtb3J5IHNp
emUsIGFuZCBiZWNhdXNlIHRoZSBkYXRhIGl0IGNvbnRhaW5zIGlzIHJlYWQtb25seSwgc28gaXQK
Pj4gPj4gPiBiZWxvbmdzIHdpdGggdGhlIG90aGVyIHNlY3Rpb25zIGNvbnRhaW5pbmcgcmVhZC1v
bmx5IGRhdGEuCj4+ID4+IAo+PiA+PiBXaGlsZSB0aGlzIG1heSBiZSBmaW5lIGZvciBFTEYsIEkn
bSBhZnJhaWQgaXQgd291bGQgYmUgY2FsbGluZyBmb3IKPj4gPj4gc3VidGxlIGlzc3VlcyB3aXRo
IHhlbi5lZmkgKGkuZS4gdGhlIFBFIGJpbmFyeSk6IFRoZXJlIGEgLnJlbG9jCj4+ID4+IHNlY3Rp
b24gaXMgZ2VuZXJhbGx5IGV4cGVjdGVkIHRvIGNvbWUgYWZ0ZXIgIm5vcm1hbCIgZGF0YQo+PiA+
PiBzZWN0aW9ucy4KPj4gPiAKPj4gPiBPSywgd291bGQgeW91IGxpa2UgbWUgdG8gbGVhdmUgdGhl
IC5yZWxvYyBzZWN0aW9uIGF0IHRoZSBwcmV2aW91cwo+PiA+IHBvc2l0aW9uIGZvciBFRkkgYnVp
bGRzIHRoZW4/Cj4+IAo+PiBXZWxsLCB0aGlzIHBhcnQgaXMgYSByZXF1aXJlbWVudCwgbm90IGEg
cXVlc3Rpb24gb2YgbWUgbGlraW5nIHlvdQo+PiB0byBkbyBzby4KPj4gCj4+ID4gT3IgZG8gd2Ug
cHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBoYW5lZCBpbiB0aGUgRUxGIGJ1aWxkPwo+PiAKPj4g
RGFuaWVsIG1pZ2h0IGhhdmUgYW4gb3BpbmlvbiBoZXJlIHdpdGggaGlzIHBsYW5zIHRvIGFjdHVh
bGx5Cj4+IGFkZCByZWxvY2F0aW9ucyB0aGVyZSBpbiB0aGUgbm9uLWxpbmtlci1nZW5lcmF0ZWQt
UEUgYnVpbGQuIEkKPj4gZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXksIGFz
IGxvbmcgYXMgdGhlCj4+IGN1cnJlbnQgbWV0aG9kIG9mIGJ1aWxkaW5nIGdldHMgbGVmdCBhcyBp
cyAob3IgZXZlbiBzaW1wbGlmaWVkKS4KPj4gCj4+IEFsc28gYSByZW1hcmsgcmVnYXJkaW5nIHRo
ZSB0aXRsZSAtIGluIG15IGJ1aWxkcyB0aGVyZSBhbHJlYWR5IGlzCj4+IGEgLnJlbG9jIHNlY3Rp
b24gaW4gdGhlIEVMRiBpbWFnZXMsIHNvICJhZGQiIGRvZXNuJ3QgcmVhbGx5IHNlZW0KPj4gY29y
cmVjdCB0byBtZS4gSXQgc2l0cyByaWdodCBhZnRlciAucm9kYXRhLCBhbmQgSSB3b3VsZCBpdCBk
b2Vzbid0Cj4+IGdldCBmb2xkZWQgaW50byB0aGVyZSBiZWNhdXNlIC0gZm9yIHNvbWUgcmVhc29u
IC0gLnJvZGF0YSBpcwo+PiBhY3R1YWxseSBtYXJrZWQgd3JpdGFibGUuCj4gCj4gQUZBSUNUIC5y
b2RhdGEgaXMgbWFya2VkIHdyaXRhYmxlIGJlY2F1c2UgaXQgY29udGFpbnMgLmRhdGEucGFyYW0g
YW5kCj4gLmRhdGEucmVsLnJvLiBJJ20gdW5zdXJlIHdoeSB3ZSBuZWVkIC5kYXRhLnJlbC5ybywg
SSB3b3VsZCBhc3N1bWUgdGhhdAo+IG9uY2UgdGhlIGZpbmFsIGJpbmFyeSBoYXMgYmVlbiBsaW5r
ZWQgLmRhdGEucmVsLnJvIHdvdWxkIGJlIGVtcHR5LAo+IHNpbmNlIHRoZXJlJ3Mgbm8gcnVuIHRp
bWUgbGlua2luZyBvciByZWxvY2F0aW9uIGFzIFhlbiBpcyBhIHN0YW5kYWxvbmUKPiBiaW5hcnku
CgpObyAtIGNvbnRlbnRzIG9mIHNlY3Rpb25zIGRvbid0IGdldCBtb3ZlZCB0byBvdGhlciBzZWN0
aW9ucyB3aGlsZQpsaW5raW5nLCB1bmxlc3MgaW5zdHJ1Y3RlZCBzbyBieSB0aGUgbGlua2VyIHNj
cmlwdC4gSW4gYWxsIHRoZQpyZWxvY2F0YWJsZSBvYmplY3RzIHRoZXJlJ3MgZ29pbmcgdG8gYmUg
LmRhdGEucmVsLnJvLCBhbmQgaGVuY2UgdGhlCmxpbmtlciBzY3JpcHQgaGFzIHRvIHB1dCB0aGVt
IHNvbWV3aGVyZSAob3IgbGVhdmUgaXQgdG8gZGVmYXVsdApwbGFjZW1lbnQgYnkgdGhlIGxpbmtl
cikuCgpIbW0sIHRoaW5raW5nIGFib3V0IGl0IC0gYXJlIHlvdSBwZXJoYXBzIG1peGluZyB1cCAu
ZGF0YS5yZWwgLwouZGF0YS5yZWwucm8gd2l0aCAucmVsLmRhdGEgLyAucmVsYS5kYXRhPwoKPiBS
ZWdhcmRpbmcgLmRhdGEucGFyYW0gaXQgc2hvdWxkIGJlIHJlbmFtZWQgdG8gLnJvZGF0YS5wYXJh
bSwgYW5kIEkKPiBzaG91bGQgdGFrZSBhIGxvb2sgYXQgd2h5IGl0J3MgbWFya2VkIGFzICdXQScg
aW5zdGVhZCBvZiAnQScuCgpXZWxsLCB0aGVyZSdzIG5vICJjb25zdCIgb24gdGhlIHN0cnVjdHVy
ZSBpbnN0YW50aWF0aW9ucy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
