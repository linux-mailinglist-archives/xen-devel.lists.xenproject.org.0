Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1CC3ED6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 19:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFM6H-0002sk-KJ; Tue, 01 Oct 2019 17:38:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFM6F-0002sW-Lh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:38:11 +0000
X-Inumbo-ID: 3ca9ca4e-e472-11e9-9704-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 3ca9ca4e-e472-11e9-9704-12813bfff9fa;
 Tue, 01 Oct 2019 17:38:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7CEE2053B;
 Tue,  1 Oct 2019 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569951490;
 bh=MMmGvGL9mMISD7665FS8n/2elHIASz6KuyJpSch+Vzc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PGyzGHOi8DLY9Ntkwu1xLIIjou96erVvR41GoRYE63/OEUdplRKDX/U+LkKD1XiPD
 4RC1VBOtqVJPdE3vzE0V0JTmVjnNOFDFOOfnH/zLIYFmxWmDIhAvlM0PHZnLoSvOgQ
 7wnlKe7hxq0JZ33qeMO21zV/luBcFtqS9qbtj/18=
Date: Tue, 1 Oct 2019 10:38:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190906153948.2160342-1-arnd@arndb.de>
Message-ID: <alpine.DEB.2.21.1910011032500.20899@sstabellini-ThinkPad-T480s>
References: <20190906153948.2160342-1-arnd@arndb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: mark.rutland@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IFNlcCAyMDE5LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IEhZUEVSVklTT1JfcGxh
dGZvcm1fb3AoKSBpcyBhbiBpbmxpbmUgZnVuY3Rpb24gYW5kIHNob3VsZCBub3QKPiBiZSBleHBv
cnRlZC4gU2luY2UgY29tbWl0IDE1YmZjMjM0OGQ1NCAoIm1vZHBvc3Q6IGNoZWNrIGZvcgo+IHN0
YXRpYyBFWFBPUlRfU1lNQk9MKiBmdW5jdGlvbnMiKSwgdGhpcyBjYXVzZXMgYSB3YXJuaW5nOgo+
IAo+IFdBUk5JTkc6ICJIWVBFUlZJU09SX3BsYXRmb3JtX29wIiBbdm1saW51eF0gaXMgYSBzdGF0
aWMgRVhQT1JUX1NZTUJPTF9HUEwKPiAKPiBSZW1vdmUgdGhlIGV4dHJhbmVvdXMgZXhwb3J0Lgo+
IAo+IEZpeGVzOiAxNWJmYzIzNDhkNTQgKCJtb2Rwb3N0OiBjaGVjayBmb3Igc3RhdGljIEVYUE9S
VF9TWU1CT0wqIGZ1bmN0aW9ucyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jIHwgMSAtCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hl
bi9lbmxpZ2h0ZW4uYyBiL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYwo+IGluZGV4IDFlNTc2OTI1
NTJkOS4uODQ1YzUyOGFjZjI0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4u
Ywo+ICsrKyBiL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYwo+IEBAIC00MzcsNyArNDM3LDYgQEAg
RVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9tZW1vcnlfb3ApOwo+ICBFWFBPUlRfU1lNQk9M
X0dQTChIWVBFUlZJU09SX3BoeXNkZXZfb3ApOwo+ICBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJ
U09SX3ZjcHVfb3ApOwo+ICBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3RtZW1fb3ApOwo+
IC1FWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3BsYXRmb3JtX29wKTsKPiAgRVhQT1JUX1NZ
TUJPTF9HUEwoSFlQRVJWSVNPUl9tdWx0aWNhbGwpOwo+ICBFWFBPUlRfU1lNQk9MX0dQTChIWVBF
UlZJU09SX3ZtX2Fzc2lzdCk7Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfZG1fb3Ap
OwoKSGkgQXJuZCwgCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gSFlQRVJWSVNPUl9wbGF0Zm9y
bV9vcCgpIGlzIGFuIGlubGluZSBmdW5jdGlvbiwKdGhlIHVuZGVybHlpbmcgZnVuY3Rpb24gdGhh
dCBzaG91bGQgYmUgZXhwb3J0ZWQgaXMKSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcF9yYXcuIFNvLCBp
bnN0ZWFkIG9mIHJlbW92aW5nCkhZUEVSVklTT1JfcGxhdGZvcm1fb3AsIHdlIHNob3VsZCBjaGFu
Z2UgaXQgdG8KSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcF9yYXcuCgpGb3IgY29udmVuaWVuY2UsIGFu
ZCBmb3IgdGVzdGluZyBJIGNvb2tlZCB1cCBhIHBhdGNoLiBBcm5kLCBpZiB5b3UgYXJlCmhhcHB5
IHdpdGggaXQgKGluIHRoZSBzZW5zZSB0aGF0IGl0IHNvbHZlcyB5b3VyIHByb2JsZW0pIHdlJ2xs
IGNoZWNrIGl0CmluIHRoZSB4ZW50aXAgdHJlZSwgdW5sZXNzIHlvdSB3b3VsZCBsaWtlIHRvIGdl
dCBpdCBpbiB5b3VyIHRyZWU/CgpDaGVlcnMsCgpTdGVmYW5vCgotLS0KCkZyb206IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+CgpIWVBFUlZJU09SX3Bs
YXRmb3JtX29wKCkgaXMgYW4gaW5saW5lIGZ1bmN0aW9uIGFuZCBzaG91bGQgbm90CmJlIGV4cG9y
dGVkLiBTaW5jZSBjb21taXQgMTViZmMyMzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yCnN0YXRp
YyBFWFBPUlRfU1lNQk9MKiBmdW5jdGlvbnMiKSwgdGhpcyBjYXVzZXMgYSB3YXJuaW5nOgoKV0FS
TklORzogIkhZUEVSVklTT1JfcGxhdGZvcm1fb3AiIFt2bWxpbnV4XSBpcyBhIHN0YXRpYyBFWFBP
UlRfU1lNQk9MX0dQTAoKSW5zdGVhZCwgZXhwb3J0IHRoZSB1bmRlcmx5aW5nIGZ1bmN0aW9uIGNh
bGxlZCBieSB0aGUgc3RhdGljIGlubGluZToKSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcF9yYXcuCgpG
aXhlczogMTViZmMyMzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yIHN0YXRpYyBFWFBPUlRfU1lN
Qk9MKiBmdW5jdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGlu
aUB4aWxpbnguY29tPgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyBiL2Fy
Y2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYwppbmRleCAxZTU3NjkyNTUyZDkuLjUyMmM5N2Q0M2VmOCAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jCisrKyBiL2FyY2gvYXJtL3hlbi9l
bmxpZ2h0ZW4uYwpAQCAtNDM3LDcgKzQzNyw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklT
T1JfbWVtb3J5X29wKTsKIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfcGh5c2Rldl9vcCk7
CiBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3ZjcHVfb3ApOwogRVhQT1JUX1NZTUJPTF9H
UEwoSFlQRVJWSVNPUl90bWVtX29wKTsKLUVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfcGxh
dGZvcm1fb3ApOworRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcF9yYXcp
OwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9tdWx0aWNhbGwpOwogRVhQT1JUX1NZTUJP
TF9HUEwoSFlQRVJWSVNPUl92bV9hc3Npc3QpOwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNP
Ul9kbV9vcCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
