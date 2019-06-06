Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AA37195
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 12:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYpY1-0008PO-GC; Thu, 06 Jun 2019 10:23:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYpXz-0008PJ-Jw
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 10:23:03 +0000
X-Inumbo-ID: 102126bd-8845-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 102126bd-8845-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 10:23:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 04:23:01 -0600
Message-Id: <5CF8E97E0200007800235DEC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 04:22:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
 <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
 <5CF8E65B0200007800235DB8@prv1-mh.provo.novell.com>
 <20190606101315.ul56zhm64wvbbucn@Air-de-Roger>
In-Reply-To: <20190606101315.ul56zhm64wvbbucn@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDEyOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDA0OjA5OjMxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDYuMDYuMTkgYXQgMTE6NTAsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4+ICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiA+PiBGcm9tOiBY
ZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10g
T24gQmVoYWxmIE9mIAo+PiA+IFJvZ2VyIFBhdSBNb25uZQo+PiA+PiBTZW50OiAwNiBKdW5lIDIw
MTkgMTA6MDIKPj4gPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyAKPj4gPj4g
Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBLb25yYWQgCj4+ID4gUnplc3p1dGVrIFdpbGsKPj4gPj4gPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBBbmRyZXcgCj4+ID4gQ29vcGVyCj4+ID4+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsg
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gCj4gKFhlbi5vcmcpIAo+
PiA+IDx0aW1AeGVuLm9yZz47IEp1bGllbgo+PiA+PiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUgCj4+
ID4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiA+PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFU
Q0ggdjIgMDEvMTJdIHBjaTogaW50cm9kdWNlIGEgZGV2Zm4gZmllbGQgdG8gCj4+ID4gcGNpX3Ni
ZGZfdAo+PiA+PiAKPj4gPj4gVGhpcyBpcyBlcXVpdmFsZW50IHRvIHRoZSBjdXJyZW50IGV4dGZ1
bmMgZmllbGQgaW4gdGVybSBvZiBjb250ZW50cy4KPj4gPj4gCj4+ID4+IFN3aXRjaCB0aGUgdHdv
IGN1cnJlbnQgdXNlcnMgb2YgZXh0ZnVuYyB0byB1c2UgZGV2Zm4gaW5zdGVhZCBmb3IKPj4gPj4g
Y29ycmVjdG5lc3MuCj4+ID4+IAo+PiA+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPj4gPj4gCj4+
ID4+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiA+PiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4g
Pj4gLS0tCj4+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+PiA+PiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+
PiA+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+ID4+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+ID4+IENjOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiA+PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPgo+PiA+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgo+PiA+PiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4+
ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+PiA+PiAtLS0KPj4gPj4gQ2hhbmdlcyBzaW5j
ZSB2MToKPj4gPj4gIC0gTmV3IGluIHRoaXMgdmVyc2lvbi4KPj4gPj4gLS0tCj4+ID4+IE5COiBQ
YXVsIHN1Z2dlc3RlZCB0byBuYW1lIHRoZSBmdW5jdGlvbiBmaWVsZCBmbiBpbnN0ZWFkIG9mIGZ1
bmMsIHNvCj4+ID4+IHRoYXQgaXQgd291bGQgbWF0Y2ggdGhlIG5hbWluZyBvZiB0aGUgZGV2Zm4g
ZmllbGQuIFNhZGx5IHRoZSBmdW5jCj4+ID4+IGZpZWxkIGNhbm5vdCBiZSBhbGlhc2VkIHRvIGFu
b3RoZXIgZmllbGQgdXNpbmcgYSB1bmlvbiBiZWNhdXNlIGl0J3MgYQo+PiA+PiBiaXQgZmllbGQs
IHNvIHRoZSBvbmx5IG9wdGlvbiBpcyB0byByZW5hbWUgZnVuYyB0byBmbi4KPj4gPiAKPj4gPiBJ
cyB0aGF0IHRydWU/IENhbiB5b3Ugbm90IGRvIHNvbWV0aGluZyBsaWtlLi4uCj4+ID4gCj4+ID4g
dW5pb24gewo+PiA+ICAgc3RydWN0IHsKPj4gPiAgICAgdWludDhfdCBmdW5jIDogMywKPj4gPiAg
ICAgICAgICAgICBkZXYgIDogNTsKPj4gPiAgIH07Cj4+ID4gICBzdHJ1Y3Qgewo+PiA+ICAgICB1
aW50OF90IGZuICAgOiAzLAo+PiA+ICAgICAgICAgICAgIHBhZCAgOiA1Owo+PiAKPj4gQW5kIHRo
ZSAicGFkIiBmaWVsZCBoZXJlIHdvdWxkbid0IHJlYWxseSBiZSBuZWNlc3NhcnkuCj4+IAo+PiBJ
cyB0aGVyZSBhIHJlYXNvbiAiZnVuYyIgbmVlZHMgdG8gYmUga2VwdD8gSWYgc28sIGlzIHRoZXJl
IGEgcGxhbiB0bwo+PiBwaGFzZSBvdXQgaXRzIHVzZT8gSWYgc28sIHBlcmhhcHMgZm4gYW5kIGRl
diBzaG91bGQgYmUgZ3JvdXBlZAo+PiB0b2dldGhlciwgYW5kIGZ1bmMgc2hvdWxkIGJlY29tZSB0
aGUgKHRlbXBvcmFyeSkgYWxpYXM/Cj4gCj4gSSB0aGluayBJIGNhbiBwcmVwYXJlIGEgcHJlLXBh
dGNoIHRvIHJlbmFtZSBmdW5jIHRvIGZuLCB0aGUgdXNlcnMgb2YKPiBwY2lfc2JkZl90IGFyZSB2
ZXJ5IGxpbWl0ZWQgYXQgdGhpcyBwb2ludC4gSWYgeW91IGFncmVlIHdpdGggdGhpcyBJCj4gd2ls
bCBhZGQgc3VjaCBhIHBhdGNoIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlcmllcy4KCldlbGws
IEknbSBva2F5IHdpdGggZWl0aGVyLCBhcyBlYWNoIGhhcyBpdCdzIHVwIGFuZCBkb3duIHNpZGVz
OgoiZm4iIGlzIG1vcmUgY29uc2lzdGVudCB3aXRoICJkZXZmbiIsIGJ1dCAiZnVuYyIgZml0cyBi
ZXR0ZXIgd2l0aApQQ0lfRlVOQygpICh3aGljaCBpcyBhbHJlYWR5IG5vdCByZWFsbHkgZml0dGlu
ZyB3aXRoIFBDSV9ERVZGTigpLApqdXN0IGxpa2UgUENJX1NMT1QoKSBpc24ndCkuCgpUaGVyZWZv
cmUgSSB3b3VsZG4ndCBvYmplY3QgdG8gc3RpY2tpbmcgdG8gZnVuYywgYnV0IHNpbmNlIFBhdWwK
d291bGQgcHJlZmVyIGl0IHRvIGJlY29tZSBmbiwgSSdtIGFsc28gb2theSB3aXRoIHRoYXQuIE9m
IGNvdXJzZQpqdXN0IGEgc2luZ2xlLCBjb25zaXN0ZW50bHkgdXNlZCBuYW1lIGZvciB0aGUgZmll
bGQgYXMgdGhlIGZpbmFsCnJlc3VsdCBvZiB0aGUgc2VyaWVzIHdvdWxkIGJlIHZlcnkgZGVzaXJh
YmxlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
