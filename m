Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144061316A4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 18:21:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioW1w-0005m8-Dc; Mon, 06 Jan 2020 17:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ioW1u-0005m2-Oc
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 17:19:02 +0000
X-Inumbo-ID: a130a69b-30a8-11ea-ab3d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a130a69b-30a8-11ea-ab3d-12813bfff9fa;
 Mon, 06 Jan 2020 17:19:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 728B420715;
 Mon,  6 Jan 2020 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578331140;
 bh=N4PyN/ioMxd3f4CHCcX1fBkgPLk3L3vfRcqZXGCf8RY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cXduWxmAnxmAWU+Be8dJklvJXJp2oMHir6bdtrEv4Fwteh29LQqkUPXJrQdp7MmFI
 LyNyn5AajDUcvvQ71zsBXr7megMtaKNtQLY7lxFbOY2kX68djp+bMVoHInuvY5ZRJV
 EXL6FiABUErJtEpNG7I2bz6x8X+1KhyrhtM5fy+g=
Date: Mon, 6 Jan 2020 09:18:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Pavel Tatashin <pasha.tatashin@soleen.com>
In-Reply-To: <20200102211357.8042-2-pasha.tatashin@soleen.com>
Message-ID: <alpine.DEB.2.21.2001060918470.732@sstabellini-ThinkPad-T480s>
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
 <20200102211357.8042-2-pasha.tatashin@soleen.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 1/6] arm/arm64/xen: hypercall.h add
 includes guards
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, stefan@agner.ch,
 linux@armlinux.org.uk, yamada.masahiro@socionext.com, will@kernel.org,
 boris.ostrovsky@oracle.com, sashal@kernel.org, sstabellini@kernel.org,
 maz@kernel.org, jmorris@namei.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, vladimir.murzin@arm.com, julien@xen.org,
 alexios.zavras@intel.com, tglx@linutronix.de, allison@lohutok.net,
 jgross@suse.com, steve.capper@arm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, andrew.cooper3@citrix.com,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyIEphbiAyMDIwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiBUaGUgYXJtIGFuZCBh
cm02NCB2ZXJzaW9ucyBvZiBoeXBlcmNhbGwuaCBhcmUgbWlzc2luZyB0aGUgaW5jbHVkZQo+IGd1
YXJkcy4gVGhpcyBpcyBuZWVkZWQgYmVjYXVzZSBDIGlubGluZXMgZm9yIHByaXZjbWRfY2FsbCBh
cmUgZ29pbmcgdG8KPiBiZSBhZGRlZCB0byB0aGUgZmlsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF2ZWwgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Cj4gUmV2aWV3ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgYXJjaC9hcm0vaW5jbHVkZS9h
c20veGVuL2h5cGVyY2FsbC5oICAgfCA0ICsrKysKPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94
ZW4vaHlwZXJjYWxsLmggfCA0ICsrKysKPiAgaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oICAg
ICAgICAgICAgfCA2ICsrKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hl
bi9oeXBlcmNhbGwuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+IGlu
ZGV4IDM1MjJjYmFlZDMxNi4uYzY4ODJiYmE1Mjg0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hl
bi9oeXBlcmNhbGwuaAo+IEBAIC0xICsxLDUgQEAKPiArI2lmbmRlZiBfQVNNX0FSTV9YRU5fSFlQ
RVJDQUxMX0gKPiArI2RlZmluZSBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0gKPiAgI2luY2x1ZGUg
PHhlbi9hcm0vaHlwZXJjYWxsLmg+Cj4gKwo+ICsjZW5kaWYgLyogX0FTTV9BUk1fWEVOX0hZUEVS
Q0FMTF9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVy
Y2FsbC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiBpbmRleCAz
NTIyY2JhZWQzMTYuLmMzMTk4ZjljY2QyZSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVu
L2h5cGVyY2FsbC5oCj4gQEAgLTEgKzEsNSBAQAo+ICsjaWZuZGVmIF9BU01fQVJNNjRfWEVOX0hZ
UEVSQ0FMTF9ICj4gKyNkZWZpbmUgX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKPiAgI2luY2x1
ZGUgPHhlbi9hcm0vaHlwZXJjYWxsLmg+Cj4gKwo+ICsjZW5kaWYgLyogX0FTTV9BUk02NF9YRU5f
SFlQRVJDQUxMX0ggKi8KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5o
IGIvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oCj4gaW5kZXggYjQwNDg1ZTU0ZDgwLi5iYWJj
YzA4YWY5NjUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oCj4gKysr
IGIvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oCj4gQEAgLTMwLDggKzMwLDggQEAKPiAgICog
SU4gVEhFIFNPRlRXQVJFLgo+ICAgKi8KPiAgCj4gLSNpZm5kZWYgX0FTTV9BUk1fWEVOX0hZUEVS
Q0FMTF9ICj4gLSNkZWZpbmUgX0FTTV9BUk1fWEVOX0hZUEVSQ0FMTF9ICj4gKyNpZm5kZWYgX0FS
TV9YRU5fSFlQRVJDQUxMX0gKPiArI2RlZmluZSBfQVJNX1hFTl9IWVBFUkNBTExfSAo+ICAKPiAg
I2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgo+ICAKPiBAQCAtODgsNCArODgsNCBAQCBNVUxUSV9tbXVf
dXBkYXRlKHN0cnVjdCBtdWx0aWNhbGxfZW50cnkgKm1jbCwgc3RydWN0IG1tdV91cGRhdGUgKnJl
cSwKPiAgCUJVRygpOwo+ICB9Cj4gIAo+IC0jZW5kaWYgLyogX0FTTV9BUk1fWEVOX0hZUEVSQ0FM
TF9IICovCj4gKyNlbmRpZiAvKiBfQVJNX1hFTl9IWVBFUkNBTExfSCAqLwo+IC0tIAo+IDIuMTcu
MQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
