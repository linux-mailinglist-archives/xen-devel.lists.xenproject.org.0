Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B19F4442
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:13:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1D3-0001xd-0r; Fri, 08 Nov 2019 10:09:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uSPO=ZA=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iT1Cz-0001wt-G3
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:09:39 +0000
X-Inumbo-ID: dd605998-020f-11ea-9631-bc764e2007e4
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd605998-020f-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 10:09:35 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0D3700695E5CE6DC2DF0A9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:3700:695e:5ce6:dc2d:f0a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5E2861EC0CFB;
 Fri,  8 Nov 2019 11:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573207774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Zi83kBXDzZBZ6+y95rMr+7di9jcc32PZkbcTv3IAkfg=;
 b=jMz7yGz/YYrTc/Zf5NGWTmt4iwndQVEGHvOi/9AAZvnjjxrptrFjdYUOfJjUkTvxyC7aW9
 dEhXF1+JSliS/KYbczj3azUWlG42lzOBfqf2v84IsWcRQDP40jNXpVSPwYB5uSad6IVGqk
 JpCnRMw+YyXNawwgROz/j82W98h/DUg=
Date: Fri, 8 Nov 2019 11:09:30 +0100
From: Borislav Petkov <bp@alien8.de>
To: Daniel Kiper <daniel.kiper@oracle.com>
Message-ID: <20191108100930.GA4503@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104151354.28145-3-daniel.kiper@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6MTM6NTNQTSArMDEwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IFRoaXMgZmllbGQgY29udGFpbnMgbWF4aW1hbCBhbGxvd2VkIHR5cGUgZm9yIHNldHVw
X2RhdGEuCj4gCj4gVGhpcyBwYXRjaCBkb2VzIG5vdCBidW1wIHNldHVwX2hlYWRlciB2ZXJzaW9u
IGluIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMKPiBiZWNhdXNlIGl0IHdpbGwgYmUgZm9sbG93ZWQg
YnkgYWRkaXRpb25hbCBjaGFuZ2VzIGNvbWluZyBpbnRvIHRoZQo+IExpbnV4L3g4NiBib290IHBy
b3RvY29sLgo+IAo+IFN1Z2dlc3RlZC1ieTogSC4gUGV0ZXIgQW52aW4gKEludGVsKSA8aHBhQHp5
dG9yLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFj
bGUuY29tPgo+IFJldmlld2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvc3MgUGhpbGlwc29uIDxyb3NzLnBoaWxpcHNv
bkBvcmFjbGUuY29tPgo+IFJldmlld2VkLWJ5OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFA
enl0b3IuY29tPgo+IC0tLQo+IHY1IC0gc3VnZ2VzdGlvbnMvZml4ZXM6Cj4gICAgLSBtb3ZlIGlu
Y29ycmVjdCByZWZlcmVuY2VzIHRvIHRoZSBzZXR1cF9pbmRpcmVjdCB0byB0aGUKPiAgICAgIHBh
dGNoIGludHJvZHVjaW5nIGl0LAo+ICAgIC0gZG8gbm90IGJ1bXAgc2V0dXBfaGVhZGVyIHZlcnNp
b24gaW4gYXJjaC94ODYvYm9vdC9oZWFkZXIuUwo+ICAgICAgKHN1Z2dlc3RlZCBieSBILiBQZXRl
ciBBbnZpbikuCj4gLS0tCj4gIERvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0ICAgICAgICAgICAg
IHwgOSArKysrKysrKy0KPiAgYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMg
fCA1ICsrKysrCj4gIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggIHwgMyAr
KysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0IGIvRG9jdW1lbnRhdGlv
bi94ODYvYm9vdC5yc3QKPiBpbmRleCBjNjBmYWZkYTk0MjcuLjFkYWQ2ZWVlOGE1YyAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
eDg2L2Jvb3QucnN0Cj4gQEAgLTczLDcgKzczLDcgQEAgUHJvdG9jb2wgMi4xNDoJQlVSTlQgQlkg
SU5DT1JSRUNUIENPTU1JVCBhZTdlMTIzOGU2OGYyYTQ3MmExMjU2NzNhYjUwNmQ0OTE1OGMxODgK
PiAgCQkoeDg2L2Jvb3Q6IEFkZCBBQ1BJIFJTRFAgYWRkcmVzcyB0byBzZXR1cF9oZWFkZXIpCj4g
IAkJRE8gTk9UIFVTRSEhISBBU1NVTUUgU0FNRSBBUyAyLjEzLgo+ICAKPiAtUHJvdG9jb2wgMi4x
NToJKEtlcm5lbCA1LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mby4KPiArUHJvdG9jb2wgMi4xNToJ
KEtlcm5lbCA1LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mbyBhbmQga2VybmVsX2luZm8uc2V0dXBf
dHlwZV9tYXguCj4gID09PT09PT09PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gIAo+ICAuLiBub3RlOjoKPiBAQCAtOTgx
LDYgKzk4MSwxMyBAQCBPZmZzZXQvc2l6ZToJMHgwMDA4LzQKPiAgICBUaGlzIGZpZWxkIGNvbnRh
aW5zIHRoZSBzaXplIG9mIHRoZSBrZXJuZWxfaW5mbyBpbmNsdWRpbmcga2VybmVsX2luZm8uaGVh
ZGVyCj4gICAgYW5kIGtlcm5lbF9pbmZvLmtlcm5lbF9pbmZvX3Zhcl9sZW5fZGF0YS4KPiAgCj4g
Kz09PT09PT09PT09PQk9PT09PT09PT09PT09PQo+ICtGaWVsZCBuYW1lOglzZXR1cF90eXBlX21h
eAo+ICtPZmZzZXQvc2l6ZToJMHgwMDA4LzQKCllvdSBhbHJlYWR5IGhhdmUKCkZpZWxkIG5hbWU6
ICAgICBzaXplX3RvdGFsCk9mZnNldC9zaXplOiAgICAweDAwMDgvNAoKYXQgdGhhdCBvZmZzZXQu
CgpJIGd1ZXNzIHlvdSBtZWFuIHNldHVwX3R5cGVfbWF4J3Mgb2Zmc2V0IHRvIGJlIDB4MDAwYyBh
bmQgaXQgd291bGQgYmUKdGhhdCBtZW1iZXI6CgoubG9uZyAgIDB4MDEyMzQ1NjcgICAgICAvKiBT
b21lIGZpeGVkIHNpemUgZGF0YSBmb3IgdGhlIGJvb3Rsb2FkZXJzLiAqLwoKPwoKLS0gClJlZ2Fy
ZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBzOi8vcGVvcGxlLmtlcm5lbC5vcmcvdGdseC9ub3Rl
cy1hYm91dC1uZXRpcXVldHRlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
