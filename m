Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE31CEEF7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 00:19:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHbHl-0001AB-8S; Mon, 07 Oct 2019 22:15:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHbHj-0001A5-9T
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 22:15:19 +0000
X-Inumbo-ID: f1e90686-e94f-11e9-97c0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e90686-e94f-11e9-97c0-12813bfff9fa;
 Mon, 07 Oct 2019 22:15:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6967620867;
 Mon,  7 Oct 2019 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570486517;
 bh=qyOgbHvgTePvbiSGPbJ0dkAXFF0xoda10pA1IobHgCI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=etujbKhC6D14LioG/qdOD3pAi1oocxoGRRDXrbkwTgC5KMmNQiBg7Q3v115oUht00
 Ds5TXOVeYZ/AjgeSIaW7Wj8gyH4Oy1RE6WqQJmDMB+kKjbnByr6H55sNFk5ZmTR2zY
 XOEPEskmsC9NqPBO03mwYg7dSiDx/ZJ+hGzBL8YU=
Date: Mon, 7 Oct 2019 15:15:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <9d281a7c-a9b9-f710-405f-df8e10657f30@arm.com>
Message-ID: <alpine.DEB.2.21.1910071514560.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
 <a65639bc-cae9-85d2-f33c-40dd8e24f6b7@arm.com>
 <alpine.DEB.2.21.1910071426040.13684@sstabellini-ThinkPad-T480s>
 <9d281a7c-a9b9-f710-405f-df8e10657f30@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA3IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDcv
MTAvMjAxOSAyMjozMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gTW9uLCA3IE9j
dCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPj4gT24gMDUvMTAvMjAxOSAwMDowOSwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4+PiBXaGVuIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
IGFyZSBwcmVzZW50IGluIHRoZSBob3N0IGRldmljZSB0cmVlLCBkb20wCj4gPj4+IGlzIHN0YXJ0
ZWQgd2l0aCBtdWx0aXBsZSBtZW1vcnkgbm9kZXMuIEVhY2ggbWVtb3J5IG5vZGUgc2hvdWxkIGhh
dmUgYQo+ID4+PiB1bmlxdWUgbmFtZSwgYnV0IHRvZGF5IHRoZXkgYXJlIGFsbCBjYWxsZWQgIm1l
bW9yeSIgbGVhZGluZyB0byBMaW51eAo+ID4+PiBwcmludGluZyB0aGUgZm9sbG93aW5nIHdhcm5p
bmcgYXQgYm9vdDoKPiA+Pj4KPiA+Pj4gICAgIE9GOiBEdXBsaWNhdGUgbmFtZSBpbiBiYXNlLCBy
ZW5hbWVkIHRvICJtZW1vcnkjMSIKPiA+Pj4KPiA+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJv
YmxlbSBieSBhcHBlbmRpbmcgYSAiQDx1bml0LWFkZHJlc3M+IiB0byB0aGUKPiA+Pj4gbmFtZSwg
YXMgcGVyIHRoZSBEZXZpY2UgVHJlZSBzcGVjaWZpY2F0aW9uLCB3aGVyZSA8dW5pdC1hZGRyZXNz
PiBtYXRjaGVzCj4gPj4+IHRoZSBiYXNlIG9mIGFkZHJlc3Mgb2YgdGhlIGZpcnN0IHJlZ2lvbi4K
PiA+Pj4KPiA+Pj4gUmVwb3J0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4KPiA+Pj4KPiA+Pj4gLS0tCj4gPj4+
Cj4gPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+Pj4gaW5kZXggOTIxYjA1NDUyMC4uYTRjMDdkYjM4MyAx
MDA2NDQKPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4+PiBAQCAtNjQ2LDE2ICs2NDYsMjIgQEAg
c3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluCj4g
Pj4+ICpkLAo+ID4+PiAgICAgICAgaW50IHJlcywgaTsKPiA+Pj4gICAgICAgIGludCByZWdfc2l6
ZSA9IGFkZHJjZWxscyArIHNpemVjZWxsczsKPiA+Pj4gICAgICAgIGludCBucl9jZWxscyA9IHJl
Z19zaXplICogbWVtLT5ucl9iYW5rczsKPiA+Pj4gKyAgICAvKiBQbGFjZWhvbGRlciBmb3IgbWVt
b3J5QCArIGEgMzItYml0IG51bWJlciArIFwwICovCj4gPj4+ICsgICAgY2hhciBidWZbMThdOwo+
ID4+PiAgICAgICAgX19iZTMyIHJlZ1tOUl9NRU1fQkFOS1MgKiA0IC8qIFdvcnN0IGNhc2UgYWRk
cmNlbGxzICsgc2l6ZWNlbGxzICovXTsKPiA+Pj4gICAgICAgIF9fYmUzMiAqY2VsbHM7Cj4gPj4+
ICAgICAgICAgIEJVR19PTihucl9jZWxscyA+PSBBUlJBWV9TSVpFKHJlZykpOwo+ID4+PiArICAg
IC8qIE5vdGhpbmcgdG8gZG8gKi8KPiA+Pgo+ID4+IFRoaXMgYSBkZXBhcnR1cmUgZnJvbSB0aGUg
Y3VycmVudCBzb2x1dGlvbiB3aGVyZSBhIG5vZGUgd2lsbCBiZSBjcmVhdGVkIHdpdGgKPiA+PiBu
byAicmVnIiBwcm9wZXJ0eS4gSSB0aGluayB0aGlzIGNoYW5nZSBvZiBiZWhhdmlvciBzaG91bGQg
YXQgbGVhc3QgYmUKPiA+PiBkZXNjcmliZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlmIG5vdCBp
bXBsZW1lbnRlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLiBCdXQuLi4KPiA+Pgo+ID4+PiArICAgIGlm
ICggbWVtLT5ucl9iYW5rcyA9PSAwICkKPiA+Pj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gPj4KPiA+
PiAuLi4gSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGlnbm9yZSBpdC4gVGhlIGNhbGxlciBtb3N0
IGxpa2VseSBtZXNzZWQgdXAgdGhlCj4gPj4gYmFua3MgYW5kIHdlIHNob3VsZCBpbnN0ZWFkIHJl
cG9ydCBhbiBlcnJvci4KPiA+IAo+ID4gSSBhZG1pdCBpdCB3YXNuJ3QgbXkgaW50ZW50aW9uIHRv
IGNoYW5nZSB0aGUgY3VycmVudCBiZWhhdmlvci4gQXMgSSB3YXMKPiA+IGxvb2tpbmcgdGhyb3Vn
aCB0aGUgY29kZSBJIG5vdGljZWQgdGhhdCB3ZSBjYWxsIG1ha2VfbWVtb3J5X25vZGUgZm9yCj4g
PiBib3RoIG5vcm1hbCBtZW1vcnkgYW5kIHJlc2VydmVkX21lbW9yeS4gT2YgY291cnNlLCByZXNl
cnZlZF9tZW1vcnkgY291bGQKPiA+IGhhdmUgbm8gYmFua3MuIFNvIEkgdGhvdWdodCBpdCB3b3Vs
ZCBiZSBnb29kIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgYXJlCj4gPiBhbnkgYmFua3MgYmVmb3Jl
IGNvbnRpbnVpbmcgYmVjYXVzZSBub3cgd2UgYXJlIGdvaW5nIHRvIGFjY2Vzcwo+ID4gbWVtLT5i
YW5rWzBdLnN0YXJ0LCB3aGljaCB3b3VsZCBiZSBhIG1pc3Rha2UgaWYgdGhlcmUgYXJlIG5vIGJh
bmtzLgo+IAo+IE9rLCBzbyB0aGlzIG5vdCB0aGVvcml0aWNhbCBidWcgYXMgSSBmaXJzdCB0aG91
Z2h0IGJ1dCBhIHJlYWwgYnVnIG9uIAo+IHBsYXRmb3JtIHdoZXJlIERUIGRvZXMgbm90IGhhdmUg
cmVzZXJ2ZWQtcmVnaW9ucyBub2RlLgo+IAo+IEluIHRoaXMgY2FzZSwgdGhpcyBzaG91bGQgYmUg
aW4gYSBzZXBhcmF0ZSBwYXRjaCBhcyB0aGlzIGlzIG5vdyAyIAo+IGRpZmZlcmVudCBidWdzIHNv
bHZlZCBpbiBvbmUgcGF0Y2guCgpPSwoKCj4gPiBJbiByZWdhcmRzIHRvIHlvdXIgY29tbWVudCBh
Ym91dCByZXR1cm5pbmcgZXJyb3IsIHdlIGNvdWxkIHJldHVybiBFTk9FTlQsCj4gPiBob3dldmVy
IHdlIHdvdWxkIGFsc28gaGF2ZSB0byBoYW5kbGUgRU5PRU5UIGVzcGVjaWFsbHkgYXQgdGhlIGNh
bGxlcgo+ID4gc2lkZSAoaGFuZGxlX25vZGUpLiBPciB3ZSB3b3VsZCBoYXZlIHRvIGFkZCBhIGNo
ZWNrIGlmICggbWVtLT5ucl9iYW5rcyA+Cj4gPiAwKSB0byBhdm9pZCBjYWxsaW5nIG1ha2VfbWVt
b3J5X25vZGUgd2hlbiBucl9iYW5rcyBpcyB6ZXJvLgo+IAo+IEkgd291bGQgbXVjaCBwcmVmZXIg
aWYgd2UgY2hlY2sgbWVtLT5ucl9iYW5rcyA+IDAgZm9yIHJlc2VydmVkLXJlZ2lvbnMgCj4gYmVm
b3JlIGhhbmQuCgpBbGwgcmlnaHQKCgo+IEJvdGggd2lsbCBuZWVkIGEgIkZpeGVzOiIgdG8ga2Vl
cCB0cmFjayBvZiB0aGUgb3JpZ2luYWwgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
