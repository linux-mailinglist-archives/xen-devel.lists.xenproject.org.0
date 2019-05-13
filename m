Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2331B9BB
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCeJ-0006wc-04; Mon, 13 May 2019 15:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCeH-0006wX-Pj
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:13:53 +0000
X-Inumbo-ID: b6734652-7591-11e9-a33d-f3fa41bac9e8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6734652-7591-11e9-a33d-f3fa41bac9e8;
 Mon, 13 May 2019 15:13:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:13:49 -0600
Message-Id: <5CD989A9020000780022E3C2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:13:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <395b39ff-8dbd-e3bf-bd7d-8a213e1cab11@citrix.com>
In-Reply-To: <395b39ff-8dbd-e3bf-bd7d-8a213e1cab11@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE2OjM1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAzLzUvMTkgMToyOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBjb21taXQg
cmUtaW50cm9kdWNpbmcgaXQgKDE0ZWIzYjQxZDAgWyJ4ZW46IHJlaW5zdGF0ZSBwcmV2aW91c2x5
Cj4+IHVudXNlZCBYRU5NRU1fcmVtb3ZlX2Zyb21fcGh5c21hcCBoeXBlcmNhbGwiXSkgYXMgd2Vs
bCBhcyB0aGUgb25lIGhhdmluZwo+PiBvcmlnaW5hbGx5IGludHJvZHVjZWQgaXQgKGQ4MThmM2Ni
N2MgWyJodm06IFVzZSBtYWluIG1lbW9yeSBmb3IgdmlkZW8KPj4gbWVtb3J5Il0pIGFuZCB0aGUg
b25lIHRoZW4gcHVyZ2luZyBpdCBhZ2FpbiAoNzhjMzA5N2U0ZiBbIlJlbW92ZSB1bnVzZWQKPj4g
WEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAiXSkgbWFrZSBjbGVhciB0aGF0IHRoaXMgb3BlcmF0
aW9uIGlzIGludGVuZGVkCj4+IGZvciB1c2Ugb24gSFZNIChpLmUuIHRyYW5zbGF0ZWQpIGd1ZXN0
cyBvbmx5LiBSZXN0cmljdCBpdCBhdCBsZWFzdCBhcwo+PiBtdWNoLCBiZWNhdXNlIGZvciBQViBn
dWVzdHMgZG9jdW1lbnRhdGlvbiAoaW4gdGhlIHB1YmxpYyBoZWFkZXIpIGRvZXMKPj4gbm90IGV2
ZW4gbWF0Y2ggdGhlIGltcGxlbWVudGF0aW9uOiBJdCB0YWxrcyBhYm91dCBHUEZOIGFzIGlucHV0
LCBidXQKPj4gZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhc3N1bWVzIGEgR01GTiBpbiB0aGUgbm9uLXRy
YW5zbGF0ZWQgY2FzZSAoYW5kIGhhbmRzCj4+IGJhY2sgdGhlIHZhbHVlIHBhc3NlZCBpbikuCj4+
IAo+PiBBbHNvIGxpZnQgdGhlIGNoZWNrIGluIFhFTk1FTV9hZGRfdG9fcGh5c21hcHssX2JhdGNo
fSBoYW5kbGluZyB1cAo+PiBkaXJlY3RseSBpbnRvIHRvcCBsZXZlbCBoeXBlcmNhbGwgaGFuZGxp
bmcsIGFuZCBjbGFyaWZ5IHRoaW5ncyBpbiB0aGUKPj4gcHVibGljIGhlYWRlciBhY2NvcmRpbmds
eS4KPj4gCj4+IFRha2UgdGhlIGxpYmVydHkgYW5kIGFsc28gcmVwbGFjZSBhIHBvaW50bGVzcyB1
c2Ugb2YgImN1cnJlbnQiIHdpdGggYQo+PiBtb3JlIGVmZmljaWVudCB1c2Ugb2YgYW4gZXhpc3Rp
bmcgbG9jYWwgdmFyaWFibGUgKG9yIGZ1bmN0aW9uIHBhcmFtZXRlcgo+PiB0byBiZSBwcmVjaXNl
KS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiAKPiBMb29rcyBnb29kLCBzb3JyeSBmb3IgdGhlIGRlbGF5Ogo+IAo+IFJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpUaGFua3MuCgo+IEEgY291
cGxlIG9mIGNvbW1lbnRzOgo+IAo+PiAtLS0KPj4gVEJEOiBJcyB1c2luZyBQMk1fQUxMT0MgaGVy
ZSByZWFsbHkgYXBwcm9wcmlhdGU/IEl0IG1lYW5zIGUuZy4KPj4gICAgICBwb2ludGxlc3NseSBw
b3B1bGF0aW5nIGEgUG9EIHNsb3QganVzdCB0byB1bnBvcHVsYXRlIGl0IGFnYWluIHJpZ2h0Cj4+
ICAgICAgYXdheSwgd2l0aCB0aGUgcGFnZSB0aGVuIGZyZWUgZmxvYXRpbmcsIGkuZS4gbm8gbG9u
Z2VyIGF2YWlsYWJsZQo+PiAgICAgIGZvciB1c2UgdG8gcmVwbGFjZSBhbm90aGVyIFBvRCBzbG90
LCBhbmQgKGFmYWljdCkgbm8gbG9uZ2VyCj4+ICAgICAgYWNjZXNzaWJsZSBieSB0aGUgZ3Vlc3Qg
aW4gYW55IHdheS4KPiAKPiBMb29rcyBsaWtlIHRoZSBQMk1fQUxMT0Mgd2FzIGludHJvZHVjZWQg
aW4gYy9zIDA2ZTdiZmVkMjA2LiBJIGNhbid0Cj4gaW1tZWRpYXRlbHkgc2VlIGFueSByZWFzb24g
dG8gZG8gdGhlIGFsbG9jYXRpb24gLS0gSSB0aGluayBpdCBqdXN0IG11c3QKPiBoYXZlIGJlZW4g
QyZQIHdpdGhvdXQgbXVjaCB0aG91Z2h0IGdpdmVuIGFzIHRvIHdoYXQgd2FzIGdvaW5nIHRvIGhh
cHBlbgo+IG5leHQuCgpUaGUgcXVlc3Rpb24gaXM6IElmIHdlIHJlbW92ZSBpdCwgd2hhdCBpcyB0
aGUgLUVOT0VOVCBjb25kaXRpb24KZ29pbmcgdG8gYmU/Cgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+PiBAQCAtNDQ3MCw5ICs0NDcwLDYgQEAg
aW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoCj4+ICAgICAgbWZuX3QgbWZuID0gSU5WQUxJ
RF9NRk47Cj4+ICAgICAgcDJtX3R5cGVfdCBwMm10Owo+PiAgCj4+IC0gICAgaWYgKCAhcGFnaW5n
X21vZGVfdHJhbnNsYXRlKGQpICkKPj4gLSAgICAgICAgcmV0dXJuIC1FQUNDRVM7Cj4+IC0KPj4g
ICAgICBzd2l0Y2ggKCBzcGFjZSApCj4+ICAgICAgewo+PiAgICAgICAgICBjYXNlIFhFTk1BUFNQ
QUNFX3NoYXJlZF9pbmZvOgo+PiAtLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCj4+ICsrKyBiL3hl
bi9jb21tb24vbWVtb3J5LmMKPj4gQEAgLTgxNSw2ICs4MTUsOCBAQCBpbnQgeGVubWVtX2FkZF90
b19waHlzbWFwKHN0cnVjdCBkb21haW4KPj4gICAgICBsb25nIHJjID0gMDsKPj4gICAgICB1bmlv
biB4ZW5fYWRkX3RvX3BoeXNtYXBfYmF0Y2hfZXh0cmEgZXh0cmE7Cj4+ICAKPj4gKyAgICBBU1NF
UlQocGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpKTsKPiAKPiBTbywganVzdCB0cnlpbmcgdG8gdGhp
bmsgdGhyb3VnaCB0aGUgcHJpbmNpcGxlcyBiZWhpbmQgdGhlc2UgdHdvLiAgV2UKPiBrbm93IHRo
YXQgdGhpcyBpcyBuZXZlciBnb2luZyB0byBiZSBjYWxsZWQgdy9vIGZpcnN0IGNhbGxpbmcKPiB4
YXRwX3Blcm1pc3Npb25fY2hlY2soKTsgaWYgd2UgYXNzdW1lIHRoYXQgc3VjaCBhIGNoYW5nZSB3
aWxsIGJlIHRlc3RlZAo+IChpLmUuLCB0aGF0IHNvbWV0aGluZyB3aXRoIHBhZ2luZ19tb2RlX3Ry
YW5zbGF0ZSgpIHdpbGwgY2FsbCB0aGlzCj4gaHlwZXJjYWxsIGJlZm9yZSBhIHJlbGVhc2UpLCB0
aGVuIGEgc2luZ2xlIEFTU0VSVCgpIHNob3VsZCBiZSBlbm91Z2ggdG8KPiBtYWtlIHN1cmUgdGhh
dCBib3RoIGZ1bmN0aW9ucyBhcmUgdXBkYXRlZCBwcm9wZXJseT8KClllcywgdGhhdCdzIG15IGV4
cGVjdGF0aW9uLgoKPiBJIGd1ZXNzIHRoYXQncyBnb29kIGVub3VnaC4gIChJdCdzIGhhcmQgbm90
IHRvIHN0YXJ0IHRvIGdldCBwYXJhbm9pZAo+IHdoZW4geW91IGFzayB5b3Vyc2VsZiB0aGVzZSBz
b3J0cyBvZiBxdWVzdGlvbnMuKQoKR29vZC4gKEluZGVlZC4pCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
