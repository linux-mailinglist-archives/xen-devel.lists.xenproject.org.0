Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D20553BC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnh3-0008O7-3W; Tue, 25 Jun 2019 15:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfnh1-0008Nn-7B
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:49:11 +0000
X-Inumbo-ID: c410a7d2-9760-11e9-b8f3-fb7d3c7f6360
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c410a7d2-9760-11e9-b8f3-fb7d3c7f6360;
 Tue, 25 Jun 2019 15:49:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 09:49:06 -0600
Message-Id: <5D12426C020000780023B09E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 09:49:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
 <20190625144350.6176-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190625144350.6176-3-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] nodemask: Remove implicit addressof
 from the API
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIG5vZGVtYXNrIEFQSSBkaWZmZXJzIGZyb20gdGhlIGNwdW1hc2sgQVBJIGJlY2F1
c2UgZWFjaCB3cmFwcGVyIHRvIGJpdG1hcAo+IG9wZXJhdGlvbnMgaXMgZnVydGhlciB3cmFwcGVk
IGJ5IGEgbWFjcm8gd2hpY2ggdGFrZXMgdGhlIGFkZHJlc3Mgb2YgdGhlCj4gbm9kZW1hc2sgb2Jq
ZWN0cy4KPiAKPiBUaGlzIHJlc3VsdHMgaW4gY29kZSB3aGljaCBpcyBzbGlnaHRseSBjb25mdXNp
bmcgdG8gcmVhZCBhcyBpdCBkb2Vzbid0IGZvbGxvdwo+IEMncyBjYWxsaW5nIGNvbnZlbnRpb25z
LCBhbmQgcHJvaGliaXRzIHRoZSB1c2Ugb2Ygc2xpZ2h0bHkgbW9yZSBjb21wbGljYXRlZAo+IGNv
bnN0cnVjdHMgZm9yIHNwZWNpZnlpbmcgcGFyYW1ldGVycy4KPiAKPiBEcm9wIGFsbCB3cmFwcGlu
ZyBtYWNyb3MsIHJlbmFtZSB0aGUgbm9kZW1hc2sgc3RhdGljIGlubGluZSBmdW5jdGlvbnMgdG8g
ZHJvcAo+IHRoZSBkb3VibGUgdW5kZXJzY29yZXMsIGFuZCBmZWVkIE1BWF9OVU1OT0RFUyBpbnRv
IGFwcHJvcHJpYXRlIGxvY2F0aW9ucy4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBkcm9w
IGEgY29tcGlsZXIgd29ya2Fyb3VuZCBmb3Igbm9kZV9pc3NldCgpIGZvciBHQ0MKPiAzLjMuMiB3
aGljaCBpcyBsb25nIG91dCBvZiBzdXBwb3J0LCBhbmQgaW1wbG1lbnQgaXQgd2l0aCBhIHN0YXRp
YyBpbmxpbmUuCj4gCj4gVXBkYXRlIGFsbCBjYWxsZXJzIHRvIHVzZSB0aGUgY29ycmVjdCBpbmRp
cmVjdGlvbiB0aGVtc2VsdmVzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJJ20g
b2theSB3aXRoIHRoaXMgaW4gcHJpbmNpcGxlLCBzbwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgood2l0aCBvbmUgYXNwZWN0IGFkZHJlc3NlZCBiZWxvdyksIGJ1dCB0
byBiZSBob25lc3QgSSB3b3VsZApoYXZlIGhvcGVkIHRoYXQgdGhlIHN3aXRjaCB0byB0aGUgY3B1
bWFzay5oIG1vZGVsIHdvdWxkIGFsc28KaW1wbHkgYSBzd2l0Y2ggdG8gdGhlIG5hbWluZyB1c2Vk
IHRoZXJlIChlLmcuIG5vZGVtYXNrX2FuZCgpKS4KVGhpcyB3b3VsZCBoYXZlIHByb3ZpZGVkIHRo
ZSBvcHBvcnR1bml0eSB0byBub3QgZG8gdGhlIGVudGlyZQpzd2l0Y2ggaW4gb25lIHBhdGNoLgoK
PiAtLyogTm8gc3RhdGljIGlubGluZSB0eXBlIGNoZWNraW5nIC0gc2VlIFN1YnRsZXR5ICgxKSBh
Ym92ZS4gKi8KPiAtI2RlZmluZSBub2RlX2lzc2V0KG5vZGUsIG5vZGVtYXNrKSB0ZXN0X2JpdCgo
bm9kZSksIChub2RlbWFzaykuYml0cykKPiArc3RhdGljIGlubGluZSBpbnQgbm9kZV9pc3NldChp
bnQgbm9kZSwgY29uc3Qgbm9kZW1hc2tfdCAqc3JjKQo+ICt7Cj4gKwlyZXR1cm4gdGVzdF9iaXQo
bm9kZSwgc3JjLT5iaXRzKTsKPiArfQoKU2luY2UgdGhpcyBpcyBhIG5ldyBmdW5jdGlvbiwgY291
bGQgSSBhc2sgdGhhdCB5b3UgbWFrZSBpdCByZXR1cm4gYm9vbD8KKFNhbWUgZm9yIHRoZSB0ZXN0
X2FuZF8uLi4gYW5kIGEgZmV3IG90aGVycyBiZWxvdyB0aGVuLikgQW5kIChhbHNvCmVsc2V3aGVy
ZSkgY291bGQgSSBmdXJ0aGVyIGFzayB0aGF0IHBsYWluIGludCBiZSBzd2l0Y2hlZCB0byB1bnNp
Z25lZAppbnQgYXQgdGhpcyBvY2Nhc2lvbj8KCj4gLSNkZWZpbmUgbm9kZXNfc2hpZnRfcmlnaHQo
ZHN0LCBzcmMsIG4pIFwKPiAtCQkJX19ub2Rlc19zaGlmdF9yaWdodCgmKGRzdCksICYoc3JjKSwg
KG4pLCBNQVhfTlVNTk9ERVMpCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBfX25vZGVzX3NoaWZ0X3Jp
Z2h0KG5vZGVtYXNrX3QgKmRzdHAsCj4gLQkJCQkJY29uc3Qgbm9kZW1hc2tfdCAqc3JjcCwgaW50
IG4sIGludCBuYml0cykKPiArc3RhdGljIGlubGluZSB2b2lkIG5vZGVzX3NoaWZ0X3JpZ2h0KG5v
ZGVtYXNrX3QgKmRzdHAsIGNvbnN0IG5vZGVtYXNrX3QgKnNyY3AsCj4gKwkJCQkgICAgIGludCBu
KQo+ICB7Cj4gLQliaXRtYXBfc2hpZnRfcmlnaHQoZHN0cC0+Yml0cywgc3JjcC0+Yml0cywgbiwg
bmJpdHMpOwo+ICsJYml0bWFwX3NoaWZ0X3JpZ2h0KGRzdHAtPmJpdHMsIHNyY3AtPmJpdHMsIG4s
IE1BWF9OVU1OT0RFUyk7Cj4gIH0KPiAgCj4gLSNkZWZpbmUgbm9kZXNfc2hpZnRfbGVmdChkc3Qs
IHNyYywgbikgXAo+IC0JCQlfX25vZGVzX3NoaWZ0X2xlZnQoJihkc3QpLCAmKHNyYyksIChuKSwg
TUFYX05VTU5PREVTKQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgX19ub2Rlc19zaGlmdF9sZWZ0KG5v
ZGVtYXNrX3QgKmRzdHAsCj4gLQkJCQkJY29uc3Qgbm9kZW1hc2tfdCAqc3JjcCwgaW50IG4sIGlu
dCBuYml0cykKPiArc3RhdGljIGlubGluZSB2b2lkIG5vZGVzX3NoaWZ0X2xlZnQobm9kZW1hc2tf
dCAqZHN0cCwgY29uc3Qgbm9kZW1hc2tfdCAqc3JjcCwKPiArCQkJCSAgICBpbnQgbikKPiAgewo+
IC0JYml0bWFwX3NoaWZ0X2xlZnQoZHN0cC0+Yml0cywgc3JjcC0+Yml0cywgbiwgbmJpdHMpOwo+
ICsJYml0bWFwX3NoaWZ0X2xlZnQoZHN0cC0+Yml0cywgc3JjcC0+Yml0cywgbiwgTUFYX05VTU5P
REVTKTsKPiAgfQoKSG93IGFib3V0IGRpdGNoaW5nIHJhdGhlciB0aGFuIGFkanVzdGluZyB0aGVz
ZSB0d28/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
