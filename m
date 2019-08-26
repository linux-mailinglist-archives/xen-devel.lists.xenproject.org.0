Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8A9D7EB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 23:09:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2MBW-0005qr-3q; Mon, 26 Aug 2019 21:05:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=h3Cn=WW=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1i2MBU-0005qm-UD
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 21:05:52 +0000
X-Inumbo-ID: 47bde2e2-c845-11e9-b95f-bc764e2007e4
Received: from emh02.mail.saunalahti.fi (unknown [62.142.5.108])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47bde2e2-c845-11e9-b95f-bc764e2007e4;
 Mon, 26 Aug 2019 21:05:49 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 50E9C2000A;
 Tue, 27 Aug 2019 00:05:48 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 955DE36C0F6; Tue, 27 Aug 2019 00:05:47 +0300 (EEST)
Date: Tue, 27 Aug 2019 00:05:47 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190826210547.GE2840@reaktio.net>
References: <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
 <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
 <20181003155104.GH5318@reaktio.net>
 <f6b8e055-7afc-b4de-af88-425d799dcd28@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6b8e055-7afc-b4de-af88-425d799dcd28@oracle.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
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
Cc: Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?H=E5kon?= Alstadheim <hakon@alstadheim.priv.no>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBNb24sIE9jdCAwOCwgMjAxOCBhdCAxMDozMjo0NUFNIC0wNDAwLCBCb3JpcyBPc3Ry
b3Zza3kgd3JvdGU6Cj4gT24gMTAvMy8xOCAxMTo1MSBBTSwgUGFzaSBLw6Rya2vDpGluZW4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIFNlcCAxOSwgMjAxOCBhdCAxMTowNToyNkFNICswMjAwLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+ID4+IE9uIFR1ZSwgU2VwIDE4LCAyMDE4IGF0IDAyOjA5OjUzUE0g
LTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+Pj4gT24gOS8xOC8xOCA1OjMyIEFNLCBH
ZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4+Pj4+IE9uIFNlcCAxOCwgMjAxOCwgYXQgODoxNSBBTSwg
UGFzaSBLw6Rya2vDpGluZW4gPHBhc2lrQGlraS5maT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBI
aSwKPiA+Pj4+Pgo+ID4+Pj4+IE9uIE1vbiwgU2VwIDE3LCAyMDE4IGF0IDAyOjA2OjAyUE0gLTA0
MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+Pj4+Pj4gV2hhdCBhYm91dCB0aGUgdG9vbHN0
YWNrIGNoYW5nZXM/IEhhdmUgdGhleSBiZWVuIGFjY2VwdGVkPyBJIHZhZ3VlbHkKPiA+Pj4+Pj4g
cmVjYWxsIHRoZXJlIHdhcyBhIGRpc2N1c3Npb24gYWJvdXQgdGhvc2UgY2hhbmdlcyBidXQgZG9u
J3QgcmVtZW1iZXIgaG93Cj4gPj4+Pj4+IGl0IGVuZGVkLgo+ID4+Pj4+Pgo+ID4+Pj4+IEkgZG9u
J3QgdGhpbmsgdG9vbHN0YWNrL2xpYnhsIHBhdGNoIGhhcyBiZWVuIGFwcGxpZWQgeWV0IGVpdGhl
ci4KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gIltQQVRDSCBWMSAwLzFdIFhlbi9Ub29sczogUENJ
IHJlc2V0IHVzaW5nICdyZXNldCcgU3lzRlMgYXR0cmlidXRlIjoKPiA+Pj4+PiBodHRwczovL2xp
c3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2NC5odG1s
Cj4gPj4+Pj4KPiA+Pj4+PiAiW1BBVENIIFYxIDEvMV0gWGVuL2xpYnhsOiBQZXJmb3JtIFBDSSBy
ZXNldCB1c2luZyAncmVzZXQnIFN5c0ZTIGF0dHJpYnV0ZSI6Cj4gPj4+Pj4gaHR0cHM6Ly9saXN0
cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMTIvbXNnMDA2NjMuaHRtbAo+
ID4+Pgo+ID4+PiBXaWxsIHRoaXMgcGF0Y2ggd29yayBmb3IgKkJTRD8gUm9nZXI/Cj4gPj4gQXQg
bGVhc3QgRnJlZUJTRCBkb24ndCBzdXBwb3J0IHBjaS1wYXNzdGhyb3VnaCwgc28gbm9uZSBvZiB0
aGlzIHdvcmtzCj4gPj4gQVRNLiBUaGVyZSdzIG5vIHN5c2ZzIG9uIEJTRCwgc28gbXVjaCBvZiB3
aGF0J3MgaW4gbGlieGxfcGNpLmMgd2lsbAo+ID4+IGhhdmUgdG8gYmUgbW92ZWQgdG8gbGlieGxf
bGludXguYyB3aGVuIEJTRCBzdXBwb3J0IGlzIGFkZGVkLgo+ID4+Cj4gPiBPay4gVGhhdCBzb3Vu
ZHMgbGlrZSBpdCdzIE9LIGZvciB0aGUgaW5pdGlhbCBwY2kgJ3Jlc2V0JyBpbXBsZW1lbnRhdGlv
biBpbiB4bC9saWJ4bCB0byBiZSBsaW51eC1vbmx5Li4gCj4gPgo+IAo+IEFyZSB0aGVzZSB0d28g
cGF0Y2hlcyBzdGlsbCBuZWVkZWQ/IElTVFIgdGhleSB3ZXJlwqAgd3JpdHRlbiBvcmlnaW5hbGx5
Cj4gdG8gZGVhbCB3aXRoIGd1ZXN0IHRyeWluZyB0byB1c2UgZGV2aWNlIHRoYXQgd2FzIHByZXZp
b3VzbHkgYXNzaWduZWQgdG8KPiBhbm90aGVyIGd1ZXN0LiBCdXQgcGNpc3R1Yl9wdXRfcGNpX2Rl
digpIGNhbGxzCj4gX19wY2lfcmVzZXRfZnVuY3Rpb25fbG9ja2VkKCkgd2hpY2ggZmlyc3QgdHJp
ZXMgRkxSLCBhbmQgaXQgbG9va3MgbGlrZQo+IGl0IHdhcyBhZGRlZCByZWxhdGl2ZWx5IHJlY2Vu
dGx5Lgo+IAoKUmVwbHlpbmcgdG8gYW4gb2xkIHRocmVhZC4uIEkgb25seSBub3cgcmVhbGl6ZWQg
SSBmb3Jnb3QgdG8gcmVwbHkgdG8gdGhpcyBtZXNzYWdlIGVhcmxpZXIuCgphZmFpayB0aGVzZSBw
YXRjaGVzIGFyZSBzdGlsbCBuZWVkZWQuIEjDpWtvbiAoQ0MnZCkgd3JvdGUgdG8gbWUgaW4gcHJp
dmF0ZSB0aGF0CmhlIGdldHMgYSAoZG9tMCkgTGludXgga2VybmVsIGNyYXNoIGlmIGhlIGRvZXNu
J3QgaGF2ZSB0aGVzZSBwYXRjaGVzIGFwcGxpZWQuCgoKSGVyZSBhcmUgdGhlIGxpbmtzIHRvIGJv
dGggdGhlIGxpbnV4IGtlcm5lbCBhbmQgbGlieGwgcGF0Y2hlczoKCgoiW1hlbi1kZXZlbF0gW1BB
VENIIFYzIDAvMl0gWGVuL1BDSWJhY2s6IFBDSSByZXNldCB1c2luZyAncmVzZXQnIFN5c0ZTIGF0
dHJpYnV0ZSI6Cmh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE3LTEyL21zZzAwNjU5Lmh0bWwKCltOb3RlIHRoYXQgUEFUQ0ggVjMgMS8yICJEcml2ZXJzL1BD
STogRXhwb3J0IHBjaWVfaGFzX2ZscigpIGludGVyZmFjZSIgaXMgYWxyZWFkeSBhcHBsaWVkIGlu
IHVwc3RyZWFtIGxpbnV4IGtlcm5lbCwgc28gaXQncyBub3QgbmVlZGVkIGFueW1vcmVdCgoiW1hl
bi1kZXZlbF0gW1BBVENIIFYzIDIvMl0gWGVuL1BDSWJhY2s6IEltcGxlbWVudCBQQ0kgZmxyL3Ns
b3QvYnVzIHJlc2V0IHdpdGggJ3Jlc2V0JyBTeXNGUyBhdHRyaWJ1dGUiOgpodHRwczovL2xpc3Rz
Lnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2MS5odG1sCgoK
IltYZW4tZGV2ZWxdIFtQQVRDSCBWMSAwLzFdIFhlbi9Ub29sczogUENJIHJlc2V0IHVzaW5nICdy
ZXNldCcgU3lzRlMgYXR0cmlidXRlIjoKaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTctMTIvbXNnMDA2NjQuaHRtbAoKIltYZW4tZGV2ZWxdIFtQQVRDSCBW
MSAxLzFdIFhlbi9saWJ4bDogUGVyZm9ybSBQQ0kgcmVzZXQgdXNpbmcgJ3Jlc2V0JyBTeXNGUyBh
dHRyaWJ1dGUiOgpodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwv
MjAxNy0xMi9tc2cwMDY2My5odG1sCgoKPiAKPiAtYm9yaXMKCgpUaGFua3MsCgotLSBQYXNpCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
