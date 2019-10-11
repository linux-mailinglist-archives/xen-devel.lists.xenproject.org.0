Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24626D361A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 02:36:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIiqq-0000tN-WB; Fri, 11 Oct 2019 00:32:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIiqp-0000tI-KX
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 00:32:11 +0000
X-Inumbo-ID: 90452998-ebbe-11e9-bbab-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90452998-ebbe-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 00:32:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 616F62190F;
 Fri, 11 Oct 2019 00:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570753930;
 bh=/uUkHBBMHLLc8Gcm7lSZIJK1uo9ZhAQpEpkJCnZQv7U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lapLt99SuD/Nbbh5ImfYvlIyN4kuIW7n3w6zyjBcZUpNXC4alxT9mXdMhduKqs5ZB
 iL29wh43Ibo0zRrp24h6LOLDWwQerM9L57XB8FLTM+QZlu0FF/Q/0FXKBl3LRysdns
 lqs1rWmmtvMS+MFqlbns2K/pIy7hITe2rI8QBsRk=
Date: Thu, 10 Oct 2019 17:32:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
Message-ID: <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
 <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
 <alpine.DEB.2.21.1910081422040.13684@sstabellini-ThinkPad-T480s>
 <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMCBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA4LzEwLzIwMTkg
MjM6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgOCBPY3QgMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBPbiAxMC84LzE5IDE6MTggQU0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDcgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3
cm90ZToKPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPbiAwMy8xMC8yMDE5IDAy
OjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIEZyaSwgMjAgU2Vw
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+ID4gPiBUaGF0J3Mgbm90IGNvcnJl
Y3QuIGFsbG9jX2Jvb3RfcGFnZXMoKSBpcyBhY3R1YWxseSBoZXJlIHRvIGFsbG93Cj4gPiA+ID4g
PiA+ID4gZHluYW1pYwo+ID4gPiA+ID4gPiA+IGFsbG9jYXRpb24gYmVmb3JlIHRoZSBtZW1vcnkg
c3Vic3lzdGVtIChhbmQgdGhlcmVmb3JlIHRoZSBydW50aW1lCj4gPiA+ID4gPiA+ID4gYWxsb2Nh
dG9yKQo+ID4gPiA+ID4gPiA+IGlzIGluaXRpYWxpemVkLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gTGV0IG1lIGNoYW5nZSB0aGUgcXVlc3Rpb24gdGhlbjogaXMgdGhlIHN5c3RlbV9zdGF0ZSA9
PQo+ID4gPiA+ID4gPiBTWVNfU1RBVEVfZWFybHlfYm9vdCBjaGVjayBzdHJpY3RseSBuZWNlc3Nh
cnk/IEl0IGxvb2tzIGxpa2UgaXQgaXMKPiA+ID4gPiA+ID4gbm90Ogo+ID4gPiA+ID4gPiB0aGUg
cGF0Y2ggd291bGQgd29yayBldmVuIGlmIGl0IHdhcyBqdXN0Ogo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBJIGhhZCBhIGZldyB0aG91Z2h0cyBhYm91dCBpdC4gT24gQXJtMzIsIHRoaXMgb25seSByZWFs
bHkgd29ya3MgZm9yCj4gPiA+ID4gPiAzMi1iaXRzIG1hY2hpbmUgYWRkcmVzcyAoaXQgY2FuIGdv
IHVwIHRvIDQwLWJpdHMpLiBJIGhhdmVuJ3QgcmVhbGx5Cj4gPiA+ID4gPiBmdWxseSBpbnZlc3Rp
Z2F0ZWQgd2hhdCBjb3VsZCBnbyB3cm9uZywgYnV0IGl0IHdvdWxkIGJlIGJlc3QgdG8ga2VlcAo+
ID4gPiA+ID4gaXQKPiA+ID4gPiA+IG9ubHkgZm9yIGVhcmx5IGJvb3QuCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEFsc28sIEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gcmVseSBvbiB0aGlzICJ3b3JrYXJv
dW5kIiBhZnRlciBib290Lgo+ID4gPiA+ID4gTWF5YmUKPiA+ID4gPiA+IHdlIHdvdWxkIHdhbnQg
dG8ga2VlcCB0aGVtIHVubWFwcGVkIGluIHRoZSBmdXR1cmUuCj4gPiA+ID4gCj4gPiA+ID4gWWVz
LCBubyBwcm9ibGVtcywgd2UgYWdyZWUgb24gdGhhdC4gSSBhbSBub3QgYXNraW5nIGluIHJlZ2Fy
ZHMgdG8gdGhlCj4gPiA+ID4gY2hlY2sgc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9i
b290IHdpdGggdGhlIGdvYWwgb2YgYXNraW5nIHlvdQo+ID4gPiA+IHRvIGdldCByaWQgb2YgaXQu
IEkgYW0gZmluZSB3aXRoIGtlZXBpbmcgdGhlIGNoZWNrLiAoTWF5YmUgd2Ugd2FudCB0bwo+ID4g
PiA+IGFkZAo+ID4gPiA+IGFuIGB1bmxpa2VseSgpJyBhcm91bmQgdGhlIGNoZWNrLikKPiA+ID4g
PiAKPiA+ID4gPiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoZXRoZXIgdGhlIGNvZGUgYWN0
dWFsbHkgcmVsaWVzIG9uCj4gPiA+ID4gc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9i
b290LCBhbmQsIGlmIHNvLCB3aHkuIFRoZSBnb2FsIGlzIHRvCj4gPiA+ID4gbWFrZSBzdXJlIHRo
YXQgaWYgdGhlcmUgYXJlIHNvbWUgbGltaXRhdGlvbnMgdGhhdCB0aGV5IGFyZSBkb2N1bWVudGVk
LAo+ID4gPiA+IG9yIGp1c3QgdG8gZG91YmxlLWNoZWNrIHRoYXQgdGhlcmUgYXJlIG5vIGxpbWl0
YXRpb25zLgo+ID4gPiAKPiA+ID4gVGhlIGNoZWNrIGlzIG5vdCBzdHJpY3RseSBuZWNlc3Nhcnku
Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEluIHJlZ2FyZHMgdG8geW91ciBjb21tZW50IGFib3V0
IG9ubHkgd29ya2luZyBmb3IgMzItYml0IGFkZHJlc3NlcyBvbgo+ID4gPiA+IEFybTMyLCB5b3Ug
aGF2ZSBhIHBvaW50LiBBdCBsZWFzdCB3ZSBzaG91bGQgYmUgY2FyZWZ1bCB3aXRoIHRoZSBtZm4g
dG8KPiA+ID4gPiB2YWRkciBjb252ZXJzaW9uIGJlY2F1c2UgbWZuX3RvX21hZGRyIHJldHVybnMg
YSBwYWRkcl90IHdoaWNoIGlzIDY0LWJpdAo+ID4gPiA+IGFuZCB2YWRkcl90IGlzIDMyLWJpdC4g
SSBpbWFnaW5lIHRoYXQgdGhlb3JldGljYWxseSwgZXZlbiB3aXRoCj4gPiA+ID4gc3lzdGVtX3N0
YXRlID09IFNZU19TVEFURV9lYXJseV9ib290LCBpdCBjb3VsZCBnZXQgdHJ1bmNhdGVkIHdpdGgg
dGhlCj4gPiA+ID4gd3JvbmcgY29tYmluYXRpb24gb2YgbWZuIGFuZCBwaHlzX29mZnNldC4KPiA+
ID4gPiAKPiA+ID4gPiBJZiBub3RoaW5nIGVsc2UsIG1heWJlIHdlIHNob3VsZCBhZGQgYSB0cnVu
Y2F0aW9uIGNoZWNrIGZvciBzYWZldHk/Cj4gPiA+IAo+ID4gPiBFeGNlcHQgdGhhdCBwaHlzX29m
ZnNldCBpcyBub3QgZGVmaW5lZCBjb3JyZWN0bHksIHNvIHlvdXIgY2hlY2sgYmVsb3cgd2lsbAo+
ID4gPiBicmVhayBzb21lIHNldHVwIDooLiBMZXQncyB0YWtlIHRoZSBmb2xsb3dpbmcgZXhhbXBs
ZToKPiA+ID4gCj4gPiA+ICAgICBYZW4gaXMgbG9hZGVkIGF0IFBBIDB4MTAwMDAwCj4gPiA+IAo+
ID4gPiBUaGUgYm9vdCBvZmZzZXQgaXMgY29tcHV0ZWQgdXNpbmcgMzItYml0IGFkZHJlc3MgKHNl
ZSBoZWFkLlMpOgo+ID4gPiAgICAgIFBBIC0gVkEgPSAweDEwMDAwMCAtIDB4MjAwMDAwCj4gPiA+
ICAgICAgICAgICAgICA9IDB4ZmZmMDAwMDAKPiA+ID4gCj4gPiA+IFRoaXMgdmFsdWUgd2lsbCBi
ZSBwYXNzZWQgdG8gQyBjb2RlIGFzIGFuIHVuc2lnbmVkIGxvbmcuIEJ1dCB0aGVuIHdlIHdpbGwK
PiA+ID4gc3RvcmUgaXQgaW4gYSB1aW50NjRfdC9wYWRkcl90IChzZWUgcGh5c19vZmZzZXQgd2hp
Y2ggaXMgc2V0IGluCj4gPiA+IHNldHVwX3BhZ2VfdGFibGVzKS4gQmVjYXVzZSB0aGlzIGlzIGEg
Y29udmVyc2lvbiBmcm9tIHVuc2lnbmVkIHRvCj4gPiA+IHVuc2lnbmVkLAo+ID4gPiB0aGUgInNp
Z24gYml0IiB3aWxsIG5vdCBiZSBwcm9wYWdhdGVkLgo+ID4gPiAKPiA+ID4gVGhpcyBtZWFucyB0
aGF0IHBoeXNfb2Zmc2V0IHdpbGwgYmUgZXF1YWwgdG8gMHhmZmYwMDAwMCBhbmQgbm90Cj4gPiA+
IDB4ZmZmZmZmZmZmZmYwMDAwMCEKPiA+ID4gCj4gPiA+IFRoZXJlZm9yZSBpZiB3ZSB0cnkgdG8g
Y29udmVydCAweDEwMDAwMCAod2hlcmUgWGVuIGhhcyBiZWVuIGxvYWRlZCkgYmFjawo+ID4gPiB0
bwo+ID4gPiBpdHMgVkEsIHRoZSByZXN1bHRpbmcgdmFsdWUgd2lsbCBiZSAweGZmZmZmZmZmMDAy
MDAxMDAuCj4gPiA+IAo+ID4gPiBMb29raW5nIGF0IHRoZSBjb2RlLCBJIHRoaW5rIHB0ZV9vZl94
ZW5hZGRyKCkgaGFzIGFsc28gdGhlIGV4YWN0IHByb2JsZW0uCj4gPiA+IDooCj4gPiAKPiA+IE9u
ZSB3YXkgdG8gZml4IGl0IHdvdWxkIGJlIHRvIGNoYW5nZSBwaHlzX29mZnNldCB0byByZWdpc3Rl
cl90IChvciBqdXN0Cj4gPiBkZWNsYXJlIGl0IGFzIHVuc2lnbmVkIGxvbmcgb24gYXJtMzIgYW5k
IHVuc2lnbmVkIGxvbmcgbG9uZyBvbiBhcm02NCk6Cj4gCj4gc2l6ZW9mICh1bnNpZ25lZCBsb25n
KSA9IDMyIChyZXNwLiA2NCkgb24gQXJtMzIgKHJlc3AuIGFybTY0KS4gVGhpcyBpcyB3aGF0IHdl
Cj4gYWxyZWFkeSByZWx5IG9uIGZvciBib290X3BoeXNfb2Zmc2V0IChzZWUgc2V0dXBfcGFnZXRh
YmxlcykuIFNvIEkgYW0gbm90IHN1cmUKPiB3aHkgcGh5c19vZmZzZXQgbmVlZHMgdG8gYmUgZGVm
aW5lZCBkaWZmZXJlbnRseS4KPiAKPiBBbiBhbHRlcm5hdGl2ZSBpcyB0byB1c2UgdmFkZHJfdC4K
ClllcywgSSBtZWFudCBsaWtlIHZhZGRyX3Qgb3IganVzdCAidW5zaWduZWQgbG9uZyIgbGlrZSBi
b290X3BoeXNfb2Zmc2V0LgpFdmVuIHdpdGggeW91ciBsYXRlc3QgcGF0Y2gKKGh0dHBzOi8vbWFy
Yy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1NzA3MzAwNDgzMDg5NCkgd2hpY2ggSSBsaWtlIGFzIGEg
d2F5CnRvIHNvbHZlIHRoZSBvcmlnaW5hbCBHUlVCIGJvb3RpbmcgaXNzdWUsIGl0IGxvb2tzIGxp
a2Ugd2UgYWxzbyBuZWVkIHRvCmNoYW5nZSBwaHlzX2FkZHIgdG8gdW5zaWduZWQgbG9uZyB0byBm
aXggb3RoZXIgYXJtMzIgcHJvYmxlbXMuCgpBcmUgeW91IGdvaW5nIHRvIHNlbmQgdGhlIHBhdGNo
IGZvciB0aGF0IHRvbz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
