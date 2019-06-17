Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8648862
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuB3-0003LR-VU; Mon, 17 Jun 2019 16:08:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcuB2-0003LL-GH
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:08:12 +0000
X-Inumbo-ID: 19e8ce7a-911a-11e9-8586-fbcfaa88cca6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19e8ce7a-911a-11e9-8586-fbcfaa88cca6;
 Mon, 17 Jun 2019 16:08:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 10:08:09 -0600
Message-Id: <5D07BAE20200007800238E5D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 10:08:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
 <5C80F32C0200000000103FF7@prv1-mh.provo.novell.com>
 <5C80F32C0200007800232900@prv1-mh.provo.novell.com>
 <5C80F32C0200000000104D67@prv1-mh.provo.novell.com>
 <5C80F32C0200007800238665@prv1-mh.provo.novell.com>
 <5D03C3B90200007800238676@prv1-mh.provo.novell.com>
 <fb71b7c1-133d-b68d-f4a4-ce788cb7d32a@citrix.com>
In-Reply-To: <fb71b7c1-133d-b68d-f4a4-ce788cb7d32a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Ping: [PATCH 2/2] x86/mtrr: fix build with gcc9
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
Cc: Charles Arnold <CARNOLD@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDE3OjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDYvMjAxOSAxNjo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA3
LjAzLjE5IGF0IDExOjMyLCAgd3JvdGU6Cj4+PiBnZW5lcmljLmM6IEluIGZ1bmN0aW9uIOKAmHBy
aW50X210cnJfc3RhdGXigJk6Cj4+PiBnZW5lcmljLmM6MjEwOjExOiBlcnJvcjog4oCYJTAqbHji
gJkgZGlyZWN0aXZlIG91dHB1dCBiZXR3ZWVuIDEgYW5kIDEwNzM3NDE4MjMgCj4+PiBieXRlcyBt
YXkgY2F1c2UgcmVzdWx0IHRvIGV4Y2VlZCDigJhJTlRfTUFY4oCZIFstV2Vycm9yPWZvcm1hdC1v
dmVyZmxvdz1dCj4+PiAgIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIw
MDAgbWFzayAlMCoiUFJJeDY0IjAwMCAlc1xuIiwKPj4+ICAgICAgIHwgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+Cj4+PiBnZW5lcmljLmM6MjEwOjQ0OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlz
IGRlZmluZWQgaGVyZQo+Pj4gICAyMTAgfCAgICBwcmludGsoIiVzICAldSBiYXNlICUwKiJQUkl4
NjQiMDAwIG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCj4+PiBnZW5lcmljLmM6MjEwOjExOiBu
b3RlOiBkaXJlY3RpdmUgYXJndW1lbnQgaW4gdGhlIHJhbmdlIFswLCAKPj4+IDQ1MDM1OTk2Mjcz
NzA0OTVdCj4+PiAgIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIwMDAg
bWFzayAlMCoiUFJJeDY0IjAwMCAlc1xuIiwKPj4+ICAgICAgIHwgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+Cj4+PiBnZW5lcmljLmM6MjEwOjExOiBub3RlOiBhc3N1bWluZyBkaXJlY3RpdmUg
b3V0cHV0IG9mIDEgYnl0ZQo+Pj4KPj4+IFJlc3RyaWN0IHRoZSB3aWR0aCBvZiB0aGUgdmFyaWFi
bGUgIndpZHRoIiBjb250cm9sbGluZyB0aGUgbnVtYmVyIG9mCj4+PiBhZGRyZXNzIGRpZ2l0cyBv
dXRwdXQuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2Uu
Y29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBUaGlzIG9uZSdzIHN0aWxsIHBlbmRpbmcgZm9yIHVzIHRvIGJ1aWxkIGNsZWFubHkgd2l0aCBn
Y2MgOS4KPiAKPiBJIGNhbid0IHJlcHJvZHVjZSBpdCB3aXRoIGFueSBidWlsZCBvZiBHQ0MgOSAo
YWxsIG9mIHdoaWNoIGFyZSBzdHJhaWdodAo+IGZyb20gdGhlIHVwc3RyZWFtIHRyZWUpLiAgSXMg
dGhpcyBhIGxvY2FsbHkgcGF0Y2hlZCB2ZXJzaW9uPwoKVGhpcyB3YXMgd2l0aCBhIHByZS1SQyB2
ZXJzaW9uIG9mIGdjYzk7IEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoZXkKY2hhbmdlZCB0
aGVpciBjb2RlIGJlZm9yZSB0aGUgcmVsZWFzZS4gSSBhZG1pdCBpdCBkaWRuJ3Qgb2NjdXIgdG8g
bWUgdG8KcmV0cnkgYnVpbGRpbmcgd2l0aG91dCB0aGUgcGF0Y2guCgo+PiBJIGtub3cgeW91J2Qg
bGlrZSBpdCBiZSBkb25lIGRpZmZlcmVudGx5LCBidXQgSSdtIG5vdCBoYXBweSB3aXRoIHRoZQo+
PiBpbXBsaWNhdGlvbnMgb2YgeW91ciBzdWdnZXN0aW9uLCBhbmQgSSd2ZSBleHBsYWluZWQgd2h5
Lgo+IAo+IEJ1dCB5b3UgaGF2ZW4ndCBhZGVxdWF0ZWx5IChJTU8pIGFkZHJlc3NlZCBhbnkgb2Yg
dGhlIHNob3J0Y29taW5ncy4gCj4gTm90YWJseSB0aGF0IHRoZSBhcmd1bWVudCBmYWxscyBkb3du
IG9uIGFsbCBjb21tb24gSW50ZWwgcGxhdGZvcm1zLCBhbmQKPiBpdHMgc3RpbGwgYSBwaWVjZSBv
ZiBtYWdpYyB3aGljaCBvbmx5IHlvdSBrbm93IGhvdyB0byBpbnRlcnByZXQuCgpJJ20gdW5hd2Fy
ZSBvZiBzaG9ydGNvbWluZ3MsIGFuZCB0aGUgIm1hZ2ljcyIgb2YgdGhlIG51bWJlciBvZiBkaWdp
dHMKbG9nZ2VkIGlzIHNpbXBseSBub3QgcmVsZXZhbnQgdG8gcGVvcGxlIG5vdyBrbm93aW5nIG9m
IHRoaXMuIEl0IGlzCnJlbGV2YW50IHRvIHBlb3BsZSBsaWtlIG1lIHdobyBkbyBrbm93LiBBbmQg
SSBjYW4ndCBkbyBhbnl0aGluZyBhYm91dAp0aGUgbnVtYmVyIG9mIGFkZHJlc3MgYml0cyBvbiBj
b21tb24gSW50ZWwgcGxhdGZvcm1zIG5vdCBiZWluZyBldmVubHkKZGl2aXNpYmxlIGJ5IDQuCgo+
PiBJIHdvdWxkCj4+IChoZXNpdGFudGx5LCBpLmUuIGp1c3QgdG8gZ2V0IHRoZSBidWlsZCBpc3N1
ZSBvdXQgb2YgdGhlIHdheSkgYWNrCj4+IHlvdXIgdmFyaWFudCBpZiB5b3Ugc3VibWl0dGVkIGl0
LCBidXQgSSdkIGFwcHJlY2lhdGUgaWYgeW91IHdvdWxkCj4+IHJlLWNvbnNpZGVyIHdoZXRoZXIg
eW91IGNvdWxkIGxpdmUgd2l0aCBnb2luZyB3aXRoIHRoZSBvbmUgaGVyZS4KPiAKPiBJJ20gaGFw
cHkgdG8gcHV0IGEgU29CIGFuZCByZWFsIGNvbW1pdCBtZXNzYWdlIG9uIG15IHBhdGNoLCBidXQg
SSdkIGxpa2UKPiB0byBhY3R1YWxseSBnZXQgdG8gdGhlIGJvdHRvbSBvZiB0aGUgYnVpbGQgZmFp
bHVyZSwgZ2l2ZW4gdGhhdCBpdCBoYXNuJ3QKPiBiZWVuIHJlcHJvZHVjZWQgYnkgYW55b25lIGVs
c2UgdXNpbmcgR0NDIDkuCj4gCj4gSSBkb24ndCB2aWV3IGxpbWl0aW5nIHRoZSB0eXBlIGFzIGEg
dmlhYmxlIGZpeCwgYmVjYXVzZSBhbGwgZG9lcyBpcyB0cnkKPiB0byBnYW1lIHdoaWNoZXZlciBw
aWVjZSBvZiBsb2dpYyBHQ0MgaXMgdXNpbmcgdG8gb2JqZWN0IHRvIHRoZQo+IGNvbnN0cnVjdCwg
YW5kIGlzIHRoZXJlZm9yZSBsaWtlbHkgdG8gYnJlYWsgYWdhaW4gaW4gdGhlIGZ1dHVyZS4KCldl
bGwsIEkgY2FuJ3QgZXhjbHVkZSB0aGlzIGhhcHBlbmluZywgYnV0IHRoZSBtZW50aW9uIG9mIElO
VF9NQVggaW4KdGhlIGRpYWdub3N0aWMgZG9lc24ndCBzZWVtIHRvIG1ha2UgdGhpcyB2ZXJ5IGxp
a2VseSB3aXRoIGFuIDgtYml0IHdpZGUKd2lkdGggc3BlY2lmaWVyLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
