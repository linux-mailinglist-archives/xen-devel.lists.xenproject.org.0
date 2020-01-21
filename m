Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2014465B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:22:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0vb-0007EI-Jy; Tue, 21 Jan 2020 21:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iu0vZ-0007E4-TE
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:19:13 +0000
X-Inumbo-ID: abf59ec2-3c93-11ea-bb77-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abf59ec2-3c93-11ea-bb77-12813bfff9fa;
 Tue, 21 Jan 2020 21:19:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90A6124653;
 Tue, 21 Jan 2020 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579641552;
 bh=vU6ocGpNbdi01FzoXkIzPYOysLY0dgT6JVvYJjuoBzE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZYWdxtPfzN+CNNBgYO6sBN4mxelXEI7aqlBFXuk6q++nuqEVlC8Bae1NAz/1VWeQp
 7k6Jegw/YRKo3K7s90MNCHSpQ90lGcNl4d+m1RbnHPqn3t1YFJHhZyZyvZ5p5rzmm7
 6ZipFMf9oJqfDqO20Kt2pGBI4YDlGJkhxzRAACGQ=
Date: Tue, 21 Jan 2020 13:19:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <20200118153924.10878-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2001211317260.16648@sstabellini-ThinkPad-T480s>
References: <20200118153924.10878-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: gic: Remove pointless assertion
 against enum gic_sgi
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAxOCBKYW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBBcm0gQ29tcGls
ZXIgd2lsbCBjb21wbGFpbiB0aGF0IHRoZSBhc3NlcnRpb25zIEFTU0VSVChzZ2kgPCAxNikgaXMK
PiBhbHdheXMgdHJ1ZS4gVGhpcyBpcyBiZWNhdXNlIHNnaSBpcyBhIGl0ZW0gb2YgdGhlIGVudW0g
Z2ljX3NnaSBhbmQKPiBzaG91bGQgYWx3YXlzIGNvbnRhaW4gbGVzcyB0aGFuIDE2IFNHSXMuCj4g
Cj4gUmF0aGVyIHRoYW4gdXNpbmcgQVNTRVJUcywgaW50cm9kdWNlIGEgbmV3IGl0ZW0gaW4gdGhl
IG51bSB0aGF0IGNvdWxkIGJlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4gZW51bQoKPiBjaGVja2VkIGFnYWluc3QgYSBidWlsZCB0aW1l
Lgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSB0aGUgc3BlY2lmaWMgYXNzaWdu
ZWQgdmFsdWVzIGZvciBlYWNoCj4gaXRlbXMuIFRoaXMgaXMgZmluZSBiZWNhdXNlIGVudW0gYWx3
YXlzIHN0YXJ0cyBhdCB6ZXJvIGFuZCB2YWx1ZXMgd2lsbAo+IGJlIGFzc2lnbmVkIGJ5IGluY3Jl
bWVudCBvZiBvbmUuIE5vbmUgb2Ygb3VyIGNvZGUgYWxzbyByZWx5IG9uIGhhcmRjb2RlZAo+IHZh
bHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4g
Q0M6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpSZXZpZXdlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIHhl
bi9hcmNoL2FybS9naWMuYyAgICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgeGVuL2luY2x1ZGUv
YXNtLWFybS9naWMuaCB8ICA3ICsrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2lj
LmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKPiBpbmRleCAxMTM2NTVhNzg5Li5kNjIzYzU3Y2I5IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMu
Ywo+IEBAIC00NCw2ICs0NCwxMiBAQCBERUZJTkVfUEVSX0NQVSh1aW50NjRfdCwgbHJfbWFzayk7
Cj4gIAo+ICBjb25zdCBzdHJ1Y3QgZ2ljX2h3X29wZXJhdGlvbnMgKmdpY19od19vcHM7Cj4gIAo+
ICtzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lk
KQo+ICt7Cj4gKyAgICAvKiBDaGVjayBvdXIgZW51bSBnaWNfc2dpIG9ubHkgY292ZXJzIFNHSXMg
Ki8KPiArICAgIEJVSUxEX0JVR19PTihHSUNfU0dJX01BWCA+IE5SX0dJQ19TR0kpOwo+ICt9Cj4g
Kwo+ICB2b2lkIHJlZ2lzdGVyX2dpY19vcHMoY29uc3Qgc3RydWN0IGdpY19od19vcGVyYXRpb25z
ICpvcHMpCj4gIHsKPiAgICAgIGdpY19od19vcHMgPSBvcHM7Cj4gQEAgLTI5NCw4ICszMDAsNiBA
QCB2b2lkIF9faW5pdCBnaWNfaW5pdCh2b2lkKQo+ICAKPiAgdm9pZCBzZW5kX1NHSV9tYXNrKGNv
bnN0IGNwdW1hc2tfdCAqY3B1bWFzaywgZW51bSBnaWNfc2dpIHNnaSkKPiAgewo+IC0gICAgQVNT
RVJUKHNnaSA8IDE2KTsgLyogVGhlcmUgYXJlIG9ubHkgMTYgU0dJcyAqLwo+IC0KPiAgICAgIGdp
Y19od19vcHMtPnNlbmRfU0dJKHNnaSwgU0dJX1RBUkdFVF9MSVNULCBjcHVtYXNrKTsKPiAgfQo+
ICAKPiBAQCAtMzA2LDE1ICszMTAsMTEgQEAgdm9pZCBzZW5kX1NHSV9vbmUodW5zaWduZWQgaW50
IGNwdSwgZW51bSBnaWNfc2dpIHNnaSkKPiAgCj4gIHZvaWQgc2VuZF9TR0lfc2VsZihlbnVtIGdp
Y19zZ2kgc2dpKQo+ICB7Cj4gLSAgICBBU1NFUlQoc2dpIDwgMTYpOyAvKiBUaGVyZSBhcmUgb25s
eSAxNiBTR0lzICovCj4gLQo+ICAgICAgZ2ljX2h3X29wcy0+c2VuZF9TR0koc2dpLCBTR0lfVEFS
R0VUX1NFTEYsIE5VTEwpOwo+ICB9Cj4gIAo+ICB2b2lkIHNlbmRfU0dJX2FsbGJ1dHNlbGYoZW51
bSBnaWNfc2dpIHNnaSkKPiAgewo+IC0gICBBU1NFUlQoc2dpIDwgMTYpOyAvKiBUaGVyZSBhcmUg
b25seSAxNiBTR0lzICovCj4gLQo+ICAgICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ksIFNHSV9U
QVJHRVRfT1RIRVJTLCBOVUxMKTsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLWFybS9naWMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPiBpbmRleCA3OTNkMzI0
YjMzLi5iYTg3MDUyM2JiIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4gQEAgLTI3Nyw5ICsyNzcsMTAgQEAg
ZXh0ZXJuIHZvaWQgZ2ljX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOwo+ICAKPiAgLyog
U0dJIChBS0EgSVBJcykgKi8KPiAgZW51bSBnaWNfc2dpIHsKPiAtICAgIEdJQ19TR0lfRVZFTlRf
Q0hFQ0sgPSAwLAo+IC0gICAgR0lDX1NHSV9EVU1QX1NUQVRFICA9IDEsCj4gLSAgICBHSUNfU0dJ
X0NBTExfRlVOQ1RJT04gPSAyLAo+ICsgICAgR0lDX1NHSV9FVkVOVF9DSEVDSywKPiArICAgIEdJ
Q19TR0lfRFVNUF9TVEFURSwKPiArICAgIEdJQ19TR0lfQ0FMTF9GVU5DVElPTiwKPiArICAgIEdJ
Q19TR0lfTUFYLAo+ICB9Owo+ICAKPiAgLyogU0dJIGlycSBtb2RlIHR5cGVzICovCj4gLS0gCj4g
Mi4xNy4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
