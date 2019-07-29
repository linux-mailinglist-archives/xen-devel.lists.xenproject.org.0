Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9979AE6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 23:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsCyN-0004Yg-Bw; Mon, 29 Jul 2019 21:14:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsCyL-0004Yb-Mn
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 21:14:21 +0000
X-Inumbo-ID: d4c3dfc2-b245-11e9-bc83-d74db56deaf7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4c3dfc2-b245-11e9-bc83-d74db56deaf7;
 Mon, 29 Jul 2019 21:14:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9DC32073F;
 Mon, 29 Jul 2019 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564434860;
 bh=ImeDxY6SJoJLOwuIDDy/DCXdFHZPmK8YvZgbFf8enLc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dy+KK7rkKtpf0gWW0NM9VllsL0gh9PBRsb5MDv9SqGYWr+Ttad2xg7+vNIigIFB7+
 WUb+qmfGk3psieBoJmsNWWXbyz1KmMdx3xFPoKHW+LSEUAGapkeD4rUKlUpBWlgZ16
 F7x+0s+yv0TzeE/dk6a+J0iLss1XuuHtK9QCVcPM=
Date: Mon, 29 Jul 2019 14:14:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87h879hr52.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1907291414030.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-2-julien.grall@arm.com> <87r26dhu1z.fsf@epam.com>
 <b93a7a7e-970f-b550-bd0e-b31ac8e62975@arm.com> <87h879hr52.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/7] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiBPbiAyNi8w
Ny8yMDE5IDEzOjE0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiA+Pgo+ID4+IEhpIEp1bGll
biwKPiA+Cj4gPiBIaSBWb2xvZHlteXIsCj4gPgo+ID4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4g
Pj4KPiA+Pj4gQ3VycmVudGx5LCB0aGUgc3RydWN0dXJlIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGlz
IHBhcnQgb2YgdGhlIHB1YmxpYyBBUEkuCj4gPj4+IFRoaXMgaW1wbGllcyB0aGF0IGFueSBjaGFu
Z2UgaW4gdGhlIHN0cnVjdHVyZSBzaG91bGQgYmUgYmFja3dhcmQKPiA+Pj4gY29tcGF0aWJsZS4K
PiA+Pj4KPiA+Pj4gSG93ZXZlciwgdGhlIHN0cnVjdHVyZSBpcyBvbmx5IG5lZWRlZCBieSB0aGUg
dG9vbHMgYW5kIFhlbi4gSXQgaXMgYWxzbwo+ID4+PiBub3QgZXhwZWN0ZWQgdG8gYmUgZXZlciB1
c2VkIG91dHNpZGUgb2YgdGhhdCBjb250ZXh0LiBTbyB3ZSBjb3VsZCBzYXZlIHVzCj4gPj4+IHNv
bWUgaGVhZGFjaGUgYnkgb25seSBkZWNsYXJpbmcgdGhlIHN0cnVjdHVyZSBmb3IgWGVuIGFuZCB0
b29scy4KPiA+Pj4KPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgICBUaGlzIGlzIGEgZm9sbG93LXVw
IG9mIHRoZSBkaXNjdXNzaW9uIFsxXS4KPiA+Pj4KPiA+Pj4gICAgICBbMV0gPDNjMjQ1YzViLTUx
YzYtMWQwZS1hZDZjLTQyNDE0NTczMTY2ZkBhcm0uY29tPgo+ID4+Pgo+ID4+PiAgICAgIENoYW5n
ZXMgaW4gdjM6Cj4gPj4+ICAgICAgICAgIC0gQXZvaWQgaW50cm9kdWNlIGEgbmV3ICNpZmRlZiBp
biB0aGUgaGVhZGVyIGJ5IG1vdmluZyB0aGUKPiA+Pj4gICAgICAgICAgZGVmaW5pdGlvbnMgbGF0
ZXIgb24uCj4gPj4+IC0tLQo+ID4+PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwg
MjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aAo+ID4+PiBpbmRleCAzZThjZGMxNTFkLi43Y2UxMzlhMGY1IDEwMDY0NAo+ID4+PiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+ID4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC1hcm0uaAo+ID4+PiBAQCAtMTk3LDYgKzE5NywxOCBAQAo+ID4+PiAgICAgICB9IHdo
aWxlICggMCApCj4gPj4+ICAgI2RlZmluZSBzZXRfeGVuX2d1ZXN0X2hhbmRsZShobmQsIHZhbCkg
c2V0X3hlbl9ndWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFsKQo+ID4+PiAgICt0eXBlZGVmIHVpbnQ2
NF90IHhlbl9wZm5fdDsKPiA+Pj4gKyNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJeDY0Cj4gPj4+ICsj
ZGVmaW5lIFBSSXVfeGVuX3BmbiBQUkl1NjQKPiA+Pj4gKwo+ID4+PiArLyogTWF4aW11bSBudW1i
ZXIgb2YgdmlydHVhbCBDUFVzIGluIGxlZ2FjeSBtdWx0aS1wcm9jZXNzb3IgZ3Vlc3RzLiAqLwo+
ID4+PiArLyogT25seSBvbmUuIEFsbCBvdGhlciBWQ1BVUyBtdXN0IHVzZSBWQ1BVT1BfcmVnaXN0
ZXJfdmNwdV9pbmZvICovCj4gPj4gSnVzdCBhIHN1Z2dlc3Rpb246IHlvdSBhbHJlYWR5IHRvdWNo
aW5nIHRoaXMgcGFydC4gTWF5YmUgeW91J2xsIGZpeCB0aGlzCj4gPj4gY29tbWVudCBhcyB3ZWxs
Pwo+ID4KPiA+IEkgYW0gbm90IHN1cmUgd2hhdCdzIHdyb25nIHdpdGggdGhlIGN1cnJlbnQgY29t
bWVudC4gQ2FuIHlvdSBleHBhbmQKPiA+IHlvdXIgdGhvdWdodHMgcGxlYXNlPwo+IFN1cmUuIEl0
IGRvZXMgbm90IGNvbmZvcm0gdG8gQ09ESU5HX1NUWUxFOgo+IAo+ICAgIENvbW1lbnRzIGNvbnRh
aW5pbmcgYSBzaW5nbGUgc2VudGVuY2UgbWF5IGVuZCB3aXRoIGEgZnVsbAo+ICAgIHN0b3A7IGNv
bW1lbnRzIGNvbnRhaW5pbmcgc2V2ZXJhbCBzZW50ZW5jZXMgbXVzdCBoYXZlIGEgZnVsbCBzdG9w
Cj4gICAgYWZ0ZXIgZWFjaCBzZW50ZW5jZS4KPiAKPiBUaGUgc2Vjb25kIGNvbW1lbnQgbWlzc2Vz
IGZ1bGwgc3RvcCBhdCB0aGUgZW5kLiBBbHNvLCBtYXliZSB3ZSBzaG91bGQKPiBjb25zaWRlciB0
aGlzIGFzIHMgbXVsdGktbGluZSBjb21tZW50Ogo+IAo+ICAgIE11bHRpLWxpbmUgY29tbWVudCBi
bG9ja3Mgc2hvdWxkIHN0YXJ0IGFuZCBlbmQgd2l0aCBjb21tZW50IG1hcmtlcnMgb24KPiAgICBz
ZXBhcmF0ZSBsaW5lcyBhbmQgZWFjaCBsaW5lIHNob3VsZCBiZWdpbiB3aXRoIGEgbGVhZGluZyAn
KicuCgpJJ2xsIGltcHJvdmUgb24gY29tbWl0CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
