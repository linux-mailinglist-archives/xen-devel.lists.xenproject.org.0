Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712C625E9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 18:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkWEw-00030o-UA; Mon, 08 Jul 2019 16:11:42 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.107])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hkWEv-00030j-3q
 for xen-devel@lists.xensource.com; Mon, 08 Jul 2019 16:11:41 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 29/12-11130-B3B632D5;
 Mon, 08 Jul 2019 16:11:39 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-6.tower-284.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsWyw31vlK5VtnK
 swewblhb3prxnd2D02N63iz2AMYo1My8pvyKBNeP8ix6WgmsSFQdfHGVqYPwg3MXIycEr4Ccx
 73ATC4jNKJAlcX5JLxuILSzgKHFj+0dGEJtNwEii6eAHoBouDhGBBkaJF3vegCWYBZ4xSex9K
 gFiswioSkybf4AJxOYU8JB49GoxK0iDkEA/k8SPNdNYQRL8AjISO172sUE0a0q0bv/NDmKLCu
 hK7Ni1mAXiIkGJkzOfsEDUyEtsfzuHeQIj3ywkLbOQlM1CUraAkXkVo0VSUWZ6RkluYmaOrqG
 Bga6hoZGuoaWlrpGRoV5ilW6SXmqpbnlqcYkukFterFdcmZuck6KXl1qyiREYkCkFx+/uYNx+
 5LXeIUZJDiYlUd64KOVYIb6k/JTKjMTijPii0pzU4kOMMhwcShK8wVlAOcGi1PTUirTMHGB0w
 KQlOHiURHjjQdK8xQWJucWZ6RCpU4y6HJevz1vELMSSl5+XKiXOWwtSJABSlFGaBzcCFqmXGG
 WlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzcoBM4cnMK4Hb9AroCCagI+oilUCOKElESEk1MO0
 I6p3vIubqfGL9wo0vNrNNrtcxsGez8p4e/k38wP8Pi9S2+y9osprXe1CCc61JaPkZD5YdFwL4
 C6IWqXxcIbDsxqFrm9uMoqZdamO+8+TC9t8TH/ob/Ly3aT2b++vZrO6vf2jZXXzXbve8fQ5jw
 DH7Wn73PKsLn/fmKFo7fb3BzfFEU9RhsqaWzc6ZYjk3b21d7GK7el+/W/KrtjWPv5jwf9cOrb
 ylUZc/56nhU/uP1YYHxMzEns1dptZTvLjXuCEycsKW1/MVfjBslbz/WO6Plvm5CxvnP25SrLR
 4Hn9hTpOntdmEFamP8trOKl7KN6m2iW4In5smIdaSLpzDuDZuk2dYn/yqGVenm0UvvaHEUpyR
 aKjFXFScCABm2+8kTwMAAA==
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-6.tower-284.messagelabs.com!1562602297!874145!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26009 invoked from network); 8 Jul 2019 16:11:38 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-6.tower-284.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jul 2019 16:11:38 -0000
Message-ID: <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Lars Kurth <lars.kurth.xen@gmail.com>
Date: Mon, 08 Jul 2019 09:11:33 -0700
In-Reply-To: <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
Organization: Fedora Project
User-Agent: Evolution 3.33.3 (3.33.3-1.fc31) 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA1LTIxIGF0IDExOjE0IC0wNzAwLCBBZGFtIFdpbGxpYW1zb24gd3JvdGU6
Cj4gPiA+ID4gPiAiVGhlIHJlbGVhc2UgbXVzdCBib290IHN1Y2Nlc3NmdWxseSBhcyBYZW4gRG9t
VSB3aXRoIHJlbGVhc2VzIHByb3ZpZGluZwo+ID4gPiA+ID4gYSBmdW5jdGlvbmFsLCBzdXBwb3J0
ZWQgWGVuIERvbTAgYW5kIHdpZGVseSB1c2VkIGNsb3VkIHByb3ZpZGVycwo+ID4gPiA+ID4gdXRp
bGl6aW5nIFhlbi4iCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGFuZCBjaGFuZ2UgdGhlICdtaWxlc3Rv
bmUnIGZvciB0aGUgdGVzdCBjYXNlIC0KPiA+ID4gPiA+IGh0dHBzOi8vZmVkb3JhcHJvamVjdC5v
cmcvd2lraS9RQTpUZXN0Y2FzZV9Cb290X01ldGhvZHNfWGVuX1BhcmFfVmlydCAtCj4gPiA+ID4g
PiBmcm9tIEZpbmFsIHRvIE9wdGlvbmFsLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaG91Z2h0cz8g
Q29tbWVudHM/IFRoYW5rcyEKPiA+ID4gPiAKPiA+ID4gPiBJIHdvdWxkIHByZWZlciBmb3IgaXQg
dG8gcmVtYWluIGFzIGl0IGlzLgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBvbmx5IHByYWN0aWNhbCBp
ZiBpdCdzIGdvaW5nIHRvIGJlIHRlc3RlZCwgYW5kIHRlc3RlZCByZWd1bGFybHkKPiA+ID4gLSBu
b3QgKm9ubHkqIG9uIHRoZSBmaW5hbCByZWxlYXNlIGNhbmRpZGF0ZSwgcmlnaHQgYmVmb3JlIHdl
IHNpZ24gb2ZmCj4gPiA+IG9uIHRoZSByZWxlYXNlLiBJdCBuZWVkcyB0byBiZSB0ZXN0ZWQgcmVn
dWxhcmx5IHRocm91Z2hvdXQgdGhlIHJlbGVhc2UKPiA+ID4gY3ljbGUsIG9uIHRoZSBjb21wb3Nl
cyB0aGF0IGFyZSAibm9taW5hdGVkIGZvciB0ZXN0aW5nIi4KPiA+IAo+ID4gV291bGQgdGhlIHBy
b3Bvc2FsIGFib3ZlIHdvcmsgZm9yIHlvdT8gSSB0aGluayBpdCBzYXRpc2ZpZXMgd2hhdCB5b3Ug
YXJlCj4gPiBsb29raW5nIGZvci4gV2Ugd291bGQgYWxzbyBoYXZlIHNvbWVvbmUgd2hvIG1vbml0
b3JzIHRoZXNlIHRlc3QgcmVzdWx0cwo+ID4gcHJvLWFjdGl2ZWx5Lgo+IAo+IEluIHRoZW9yeSwg
eWVhaCwgYnV0IGdpdmVuIHRoZSBoaXN0b3J5IGhlcmUgSSdtIHNvbWV3aGF0IHNjZXB0aWNhbC4g
SSdkCj4gYWxzbyBzYXkgd2Ugc3RpbGwgaGF2ZW4ndCByZWFsbHkgZ290IGEgY29udmluY2luZyBj
YXNlIGZvciB3aHkgd2UKPiBzaG91bGQgY29udGludWUgdG8gYmxvY2sgdGhlIHJlbGVhc2UgKGF0
IGxlYXN0IGluIHRoZW9yeSkgb24gRmVkb3JhCj4gd29ya2luZyBpbiBYZW4gd2hlbiB3ZSBkb24n
dCBibG9jayBvbiBhbnkgb3RoZXIgdmlydCBzdGFjayBhcGFydCBmcm9tCj4gb3VyICdvZmZpY2lh
bCcgb25lLCBhbmQgd2UgZG9uJ3QgYmxvY2sgb24gYWxsIHNvcnRzIG9mIG90aGVyIHN0dWZmIHdl
J2QKPiAibGlrZSB0byBoYXZlIHdvcmtpbmciIGVpdGhlci4gUmVnYXJkbGVzcyBvZiB0aGUgdGVz
dGluZyBpc3N1ZXMsIEknZAo+IGxpa2UgdG8gc2VlIHRoYXQgdG9vIGlmIHdlJ3JlIGdvaW5nIHRv
IGtlZXAgYmxvY2tpbmcgb24gWGVuLi4uCgpTbywgdGhpcyBkaWVkIGhlcmUuIEFzIHRoaW5ncyBz
dGFuZDogSSBwcm9wb3NlZCByZW1vdmluZyB0aGUgWGVuCmNyaXRlcmlvbiwgTGFycyBvcHBvc2Vk
LCB3ZSBkaXNjdXNzZWQgdGhlIHRlc3Rpbmcgc2l0dWF0aW9uIGEgYml0LCBhbmQKSSBzYWlkIG92
ZXJhbGwgSSdtIHN0aWxsIGluY2xpbmVkIHRvIHJlbW92ZSB0aGUgY3JpdGVyaW9uIGJlY2F1c2UK
dGhlcmUncyBubyBjbGVhciBqdXN0aWZpY2F0aW9uIGZvciBpdCBmb3IgRmVkb3JhIGFueSBtb3Jl
LiBYZW4gd29ya2luZwoob3IgcmF0aGVyLCBGZWRvcmEgd29ya2luZyBvbiBYZW4pIGlzIGp1c3Qg
bm90IGEga2V5IHJlcXVpcmVtZW50IGZvcgpGZWRvcmEgYXQgcHJlc2VudCwgQUZBSUNTLgoKSXQn
cyB3b3J0aCBub3RpbmcgdGhhdCBhdCBsZWFzdCBwYXJ0IG9mIHRoZSBqdXN0aWZpY2F0aW9uIGZv
ciB0aGUKY3JpdGVyaW9uIGluIHRoZSBmaXJzdCBwbGFjZSB3YXMgdGhhdCBBbWF6b24gd2FzIHVz
aW5nIFhlbiBmb3IgRUMyLCBidXQKdGhhdCBpcyBubyBsb25nZXIgdGhlIGNhc2UsIG1vc3QgaWYg
bm90IGFsbCBFQzIgaW5zdGFuY2UgdHlwZXMgbm8KbG9uZ2VyIHVzZSBYZW4uIEFub3RoZXIgY29u
c2lkZXJhdGlvbiBpcyB0aGF0IHRoZXJlIHdhcyBhIHRpbWUgd2hlbiBLVk0Kd2FzIHN0aWxsIHBy
ZXR0eSBuZXcgc3R1ZmYgYW5kIFZpcnR1YWxCb3ggd2FzIG5vdCBhcyBwb3B1bGFyIGFzIGl0IGlz
Cm5vdywgYW5kIFhlbiB3YXMgc3RpbGwgd2lkZWx5IHVzZWQgZm9yIGdlbmVyYWwgaG9iYnlpc3Qg
dmlydHVhbGl6YXRpb24KcHVycG9zZXM7IEkgZG9uJ3QgYmVsaWV2ZSB0aGF0J3MgcmVhbGx5IHRo
ZSBjYXNlIGFueSBtb3JlLgoKU28uLi53aXRoIHRoYW5rcyB0byBMYXJzIC8gWGVuIFByb2plY3Qg
Zm9yIHRoZWlyIGlucHV0LCBJJ20gYWZyYWlkIEknbQpzdGlsbCBpbiBmYXZvciBvZiB0aGlzIHBy
b3Bvc2FsLCBhbmQgc3RpbGwgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhlIFhlbgpjcml0ZXJpb24g
Zm9yIEYzMS4gVGhpcyB3b3VsZG4ndCBtZWFuIFhlbiBpcyBvdXQgb2YgRmVkb3JhIGFuZCB3ZSBk
b24ndApjYXJlIGFib3V0IGl0IGFueSBtb3JlLCBvciBhbnl0aGluZyBsaWtlIHRoYXQ7IGl0IHdv
dWxkIHN0aWxsIGJlIGEgcGFydApvZiBGZWRvcmEgYW5kIHdlIHN0aWxsIHdvdWxkIGxpa2UgWGVu
IHRvIHdvcmsgb24gRmVkb3JhIGFuZCBGZWRvcmEgdG8Kd29yayBvbiBYZW4sIGp1c3QgbGlrZSBh
bnkgb3RoZXIgbm9uLXJlbGVhc2UtYmxvY2tpbmcgcGFja2FnZS4gSXQganVzdAptZWFucyB3ZSB3
b3VsZCBubyBsb25nZXIgYmxvY2sgcmVsZWFzZXMgaWYgaXQgZG9lcyBub3Qgd29yay4KCkFueW9u
ZSBoYXZlIGZ1cnRoZXIgdGhvdWdodHMgb24gdGhpcz8gWGVuIGZvbGtzLCBkbyB5b3Ugb2JqZWN0
IHRvIHRoaXMKcmVhbGx5IHN0cmVudW91c2x5PyBJZiBzbyBJIGd1ZXNzIHdlIGNvdWxkIHRha2Ug
dGhpcyB0byBhIGhpZ2hlci93aWRlcgpsZXZlbCBmb3IgbW9yZSBpbnB1dC4KLS0gCkFkYW0gV2ls
bGlhbXNvbgpGZWRvcmEgUUEgQ29tbXVuaXR5IE1vbmtleQpJUkM6IGFkYW13IHwgVHdpdHRlcjog
QWRhbVdfRmVkb3JhIHwgWE1QUDogYWRhbXcgQVQgaGFwcHlhc3Nhc3NpbiAuIG5ldApodHRwOi8v
d3d3LmhhcHB5YXNzYXNzaW4ubmV0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
