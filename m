Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A0420EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 11:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hazc4-0004SK-J6; Wed, 12 Jun 2019 09:32:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hazc3-0004SF-E0
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 09:32:11 +0000
X-Inumbo-ID: f3220d65-8cf4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3220d65-8cf4-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 09:32:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 03:32:08 -0600
Message-Id: <5D00C6960200007800237622@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 03:32:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Juergen Gross" <jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
 <afe9fd8d-36b5-e946-2084-36bf8f7dcaba@citrix.com>
 <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
In-Reply-To: <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDEwOjE5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Mi4wNi4xOSAxMDowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjgvMDUvMjAxOSAxMToz
MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IEBAIC0xODcwLDggKzE4NzEsMTkgQEAgaW50IHNj
aGVkdWxlX2NwdV9zd2l0Y2godW5zaWduZWQgaW50IGNwdSwgc3RydWN0IAo+IGNwdXBvb2wgKmMp
Cj4+PiAgICAgICBvbGRfbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnEoY3B1KTsKPj4+ICAg
Cj4+PiAgICAgICB2cHJpdl9vbGQgPSBpZGxlLT5zY2hlZF9wcml2Owo+Pj4gLSAgICBwcHJpdl9v
bGQgPSBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWRfcHJpdjsKPj4+IC0gICAgc2No
ZWRfc3dpdGNoX3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKPj4+ICsgICAgcHBy
aXZfb2xkID0gc2QtPnNjaGVkX3ByaXY7Cj4+PiArICAgIG5ld19sb2NrID0gc2NoZWRfc3dpdGNo
X3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKPj4+ICsKPj4+ICsgICAgcGVyX2Nw
dShzY2hlZHVsZXIsIGNwdSkgPSBuZXdfb3BzOwo+Pj4gKyAgICBzZC0+c2NoZWRfcHJpdiA9IHBw
cml2Owo+Pj4gKwo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiAoUmU/KXJvdXRlIHRoZSBsb2NrIHRv
IHRoZSBwZXIgcENQVSBsb2NrIGFzIC9sYXN0LyB0aGluZy4gSW4gZmFjdCwKPj4+ICsgICAgICog
aWYgaXQgaXMgZnJlZSAoYW5kIGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0IG1h
bmFnZXMKPj4+ICsgICAgICogdGFraW5nIGl0LCBmaW5kcyBhbGwgdGhlIGluaXRpYWxpemF0aW9u
cyB3ZSd2ZSBkb25lIGFib3ZlIGluIHBsYWNlLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgc21wX21i
KCk7Cj4+IAo+PiBJIHJlYWxpc2UgeW91J3JlIGp1c3QgbW92aW5nIGV4aXN0aW5nIGNvZGUsIGJ1
dCB0aGlzIGJhcnJpZXIgc3RpY2tzIG91dAo+PiBsaWtlIGEgc29yZSB0aHVtYi4KPj4gCj4+IEEg
ZnVsbCBtZW1vcnkgYmFycmllciBpcyBhIG1hc3NpdmUgb3ZlcmhlYWQgZm9yIHdoYXQgc2hvdWxk
IGJlCj4+IHNtcF93bWIoKS4gIFRoZSBtYXRjaGluZyBiYXJyaWVyIGlzIGFjdHVhbGx5IGhpZGRl
biBpbiB0aGUgaW1wbGljaXQKPj4gc2VtYW50aWNzIG9mIG1hbmFnaW5nIHRvIGxvY2sgc2QtPnNj
aGVkdWxlX2xvY2sgKHdoaWNoIGlzIHRyaWFsIGFuIGVycm9yCj4+IGFueXdheSksIGJ1dCB0aGUg
b25seSB0aGluZyB0aGF0IG1hdHRlcnMgaGVyZSBpcyB0aGF0IGFsbCBvdGhlciB3cml0dGVuCj4+
IGRhdGEgaXMgaW4gcGxhY2UgZmlyc3QuCj4+IAo+PiBCZXlvbmQgdGhhdCwgbG9jYWwgY2F1c2Fs
aXR5IHdpbGwgY2F1c2UgYWxsIHJlYWRzIHRvIGJlIGluIG9yZGVyIChub3QKPj4gdGhhdCB0aGUg
YXJlIGltcG9ydGFudCkgZHVlIHRvIGxvZ2ljIGRlcGVuZGVuY2llcy4gIEFueSB0aGF0IG1pc3Mg
b3V0IG9uCj4+IHRoaXMgYXJlIGEgb3B0aW1pc2F0aW9uLXdhaXRpbmctdG8taGFwcGVuIGFzIHRo
ZSBjb21waWxlciBjb3VsZCBlbGlkZQo+PiB0aGVtIGZ1bGx5Lgo+IAo+IE5vdCB0aGF0IGl0IHdv
dWxkIHJlYWxseSBtYXR0ZXIgZm9yIHBlcmZvcm1hbmNlIChzd2l0Y2hpbmcgY3B1cyBiZXR3ZWVu
Cj4gY3B1cG9vbHMgaXMgYSBfdmVyeV8gcmFyZSBvcGVyYXRpb24pLCBJJ20gZmluZSB0cmFuc2Zv
cm1pbmcgdGhlIGJhcnJpZXIKPiBpbnRvIHNtcF93bWIoKS4KClRoaXMgYWdhaW4gaXMgYSBjaGFu
Z2UgZWFzeSBlbm91Z2ggdG8gbWFrZSB3aGlsZSBjb21taXR0aW5nLiBJJ20KcmVjb3JkaW5nIHRo
ZSBhYm92ZSBpbiBjYXNlIEkgZW5kIHVwIGJlaW5nIHRoZSBjb21taXR0ZXIuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
