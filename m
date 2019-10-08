Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87430CFAAD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 14:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHp0O-0008BR-6R; Tue, 08 Oct 2019 12:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N428=YB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHp0N-0008BK-H8
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 12:54:19 +0000
X-Inumbo-ID: bdbc52de-e9ca-11e9-80e3-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bdbc52de-e9ca-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 12:54:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6094A15BE;
 Tue,  8 Oct 2019 05:54:18 -0700 (PDT)
Received: from [10.37.12.88] (unknown [10.37.12.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02AA53F703;
 Tue,  8 Oct 2019 05:54:16 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
 <20191008011501.21038-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c82ac387-fa8e-481a-37e3-5588b7e800fd@arm.com>
Date: Tue, 8 Oct 2019 13:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008011501.21038-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix duplicate memory node
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC84LzE5IDI6MTUgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBXaGVu
IHJlc2VydmVkLW1lbW9yeSByZWdpb25zIGFyZSBwcmVzZW50IGluIHRoZSBob3N0IGRldmljZSB0
cmVlLCBkb20wCj4gaXMgc3RhcnRlZCB3aXRoIG11bHRpcGxlIG1lbW9yeSBub2Rlcy4gRWFjaCBt
ZW1vcnkgbm9kZSBzaG91bGQgaGF2ZSBhCj4gdW5pcXVlIG5hbWUsIGJ1dCB0b2RheSB0aGV5IGFy
ZSBhbGwgY2FsbGVkICJtZW1vcnkiIGxlYWRpbmcgdG8gTGludXgKPiBwcmludGluZyB0aGUgZm9s
bG93aW5nIHdhcm5pbmcgYXQgYm9vdDoKPiAKPiAgICBPRjogRHVwbGljYXRlIG5hbWUgaW4gYmFz
ZSwgcmVuYW1lZCB0byAibWVtb3J5IzEiCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxl
bSBieSBhcHBlbmRpbmcgYSAiQDx1bml0LWFkZHJlc3M+IiB0byB0aGUKPiBuYW1lLCBhcyBwZXIg
dGhlIERldmljZSBUcmVlIHNwZWNpZmljYXRpb24sIHdoZXJlIDx1bml0LWFkZHJlc3M+IG1hdGNo
ZXMKPiB0aGUgYmFzZSBvZiBhZGRyZXNzIG9mIHRoZSBmaXJzdCByZWdpb24uCj4gCj4gRml4ZXM6
IDI0OGZhYTYzN2QyICh4ZW4vYXJtOiBhZGQgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gdGhl
IGRvbTAgbWVtb3J5IG5vZGUpCj4gUmVwb3J0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxv
bGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgoKQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+IC0tLQo+IENoYW5nZXMg
aW4gdjI6Cj4gLSBmaXggYnVmIHNpemUgY2FsY3VsYXRpb246IHRoZSBudW1iZXIgaXMgNjRiaXQg
YW5kIHByaW50ZWQgYXMKPiAgICBoZXhhZGVjaW1hbAo+IC0gbW92ZSBjaGVjayBvbiBucl9iYW5r
cyB0byBhIHNlcGFyYXRlIHBhdGNoCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IGVhMDFhYWRhMGIuLjNkZTRkYWZhZWQg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTY0Niw2ICs2NDYsOCBAQCBzdGF0aWMgaW50IF9f
aW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgaW50
IHJlcywgaTsKPiAgICAgICBpbnQgcmVnX3NpemUgPSBhZGRyY2VsbHMgKyBzaXplY2VsbHM7Cj4g
ICAgICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiBtZW0tPm5yX2JhbmtzOwo+ICsgICAgLyog
UGxhY2Vob2xkZXIgZm9yIG1lbW9yeUAgKyBhIDY0LWJpdCBudW1iZXIgKyBcMCAqLwo+ICsgICAg
Y2hhciBidWZbMjRdOwo+ICAgICAgIF9fYmUzMiByZWdbTlJfTUVNX0JBTktTICogNCAvKiBXb3Jz
dCBjYXNlIGFkZHJjZWxscyArIHNpemVjZWxscyAqL107Cj4gICAgICAgX19iZTMyICpjZWxsczsK
PiAgIAo+IEBAIC02NTcsNyArNjU5LDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlf
bm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICAgICAgcmVnX3NpemUs
IG5yX2NlbGxzKTsKPiAgIAo+ICAgICAgIC8qIGVQQVBSIDMuNCAqLwo+IC0gICAgcmVzID0gZmR0
X2JlZ2luX25vZGUoZmR0LCAibWVtb3J5Iik7Cj4gKyAgICBzbnByaW50ZihidWYsIHNpemVvZihi
dWYpLCAibWVtb3J5QCUiUFJJeDY0LCBtZW0tPmJhbmtbMF0uc3RhcnQpOwo+ICsgICAgcmVzID0g
ZmR0X2JlZ2luX25vZGUoZmR0LCBidWYpOwo+ICAgICAgIGlmICggcmVzICkKPiAgICAgICAgICAg
cmV0dXJuIHJlczsKPiAgIAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
