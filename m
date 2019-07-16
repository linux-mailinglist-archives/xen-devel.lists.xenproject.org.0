Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCC6A106
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 05:55:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnEVv-0002qf-TY; Tue, 16 Jul 2019 03:52:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnEVt-0002qW-Qv
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 03:52:25 +0000
X-Inumbo-ID: 1e8a584d-a77d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e8a584d-a77d-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 03:52:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CFCDAFFC;
 Tue, 16 Jul 2019 03:52:23 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20190715113739.17694-1-jgross@suse.com>
 <20190715113739.17694-2-jgross@suse.com>
 <91ed11a0-c97e-8caf-c71c-4595be4dbbb4@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b5049344-da16-274b-b519-aba565dbff98@suse.com>
Date: Tue, 16 Jul 2019 05:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <91ed11a0-c97e-8caf-c71c-4595be4dbbb4@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/2] x86/xen: remove 32-bit Xen PV guest
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMTkgMTc6NDQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiAKPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9NYWtlZmlsZSBiL2FyY2gveDg2L3hlbi9NYWtlZmlsZQo+PiBpbmRl
eCAwODRkZTc3YTEwOWUuLmQ0MjczN2YzMTMwNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYveGVu
L01ha2VmaWxlCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9NYWtlZmlsZQo+PiBAQCAtMSw1ICsxLDUg
QEAKPj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+IC1PQkpFQ1RfRklM
RVNfTk9OX1NUQU5EQVJEX3hlbi1hc21fJChCSVRTKS5vIDo9IHkKPj4gK09CSkVDVF9GSUxFU19O
T05fU1RBTkRBUkRfeGVuLWFzbV82NC5vIDo9IHkKPj4gICAKPj4gICBpZmRlZiBDT05GSUdfRlVO
Q1RJT05fVFJBQ0VSCj4+ICAgIyBEbyBub3QgcHJvZmlsZSBkZWJ1ZyBhbmQgbG93bGV2ZWwgdXRp
bGl0aWVzCj4+IEBAIC0zNCw3ICszNCw3IEBAIG9iai0kKENPTkZJR19YRU5fUFYpCQkrPSBtbXVf
cHYubwo+PiAgIG9iai0kKENPTkZJR19YRU5fUFYpCQkrPSBpcnEubwo+PiAgIG9iai0kKENPTkZJ
R19YRU5fUFYpCQkrPSBtdWx0aWNhbGxzLm8KPj4gICBvYmotJChDT05GSUdfWEVOX1BWKQkJKz0g
eGVuLWFzbS5vCj4+IC1vYmotJChDT05GSUdfWEVOX1BWKQkJKz0geGVuLWFzbV8kKEJJVFMpLm8K
Pj4gK29iai0kKENPTkZJR19YRU5fUFYpCQkrPSB4ZW4tYXNtXzY0Lm8KPiAKPiBXZSBzaG91bGQg
YmUgYWJsZSB0byBtZXJnZSB4ZW4tYXNtXzY0LlMgaW50byB4ZW4tYXNtLlMsIHNob3VsZG4ndCB3
ZT8KClllcywgcHJvYmFibHkgYSBnb29kIGlkZWEgdG8gYWRkIHRoYXQuCgo+PiBAQCAtMTMxMiwx
NSArMTI5MCw3IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhlbl9zdGFydF9r
ZXJuZWwodm9pZCkKPj4gICAKPj4gICAJLyoga2VlcCB1c2luZyBYZW4gZ2R0IGZvciBub3c7IG5v
IHVyZ2VudCBuZWVkIHRvIGNoYW5nZSBpdCAqLwo+PiAgIAo+PiAtI2lmZGVmIENPTkZJR19YODZf
MzIKPj4gLQlwdl9pbmZvLmtlcm5lbF9ycGwgPSAxOwo+PiAtCWlmICh4ZW5fZmVhdHVyZShYRU5G
RUFUX3N1cGVydmlzb3JfbW9kZV9rZXJuZWwpKQo+PiAtCQlwdl9pbmZvLmtlcm5lbF9ycGwgPSAw
Owo+PiAtI2Vsc2UKPj4gICAJcHZfaW5mby5rZXJuZWxfcnBsID0gMDsKPiAKPiBJcyBrZXJuZWxf
cnBsIG5lZWRlZCBhbnltb3JlPwoKWWVzLCB0aGlzIGNhbiBiZSBkcm9wcGVkLCB0b2dldGhlciB3
aXRoIGdldF9rZXJuZWxfcnBsKCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
