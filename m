Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8676E72CE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 14:43:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP5Gv-00007l-0Q; Mon, 28 Oct 2019 13:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iP5Gu-00007g-CZ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 13:41:24 +0000
X-Inumbo-ID: a0bf19d2-f988-11e9-94f8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0bf19d2-f988-11e9-94f8-12813bfff9fa;
 Mon, 28 Oct 2019 13:41:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46A62B5E3;
 Mon, 28 Oct 2019 13:41:21 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191021012755.2671-1-stewart.hildebrand@dornerworks.com>
 <cb80ccce-6286-e5b6-e872-c0a4ec77c8d0@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6338e91f-46e0-3fa9-cdc7-bc50dfacc468@suse.com>
Date: Mon, 28 Oct 2019 14:41:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cb80ccce-6286-e5b6-e872-c0a4ec77c8d0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3] xen/arm: platform: fix
 Raspberry Pi compatible string
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMTM6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyMS8x
MC8yMDE5IDAyOjI3LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4+IEJvdGggdXBzdHJlYW0g
WzFdIGFuZCBkb3duc3RyZWFtIFsyXSBMaW51eCBrZXJuZWxzIHVzZSAiYnJjbSxiY20yNzExIgo+
PiBhcyB0aGUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFJhc3BiZXJyeSBQaSA0LiBBZGQgdGhpcyBz
dHJpbmcgdG8gb3VyCj4+IHBsYXRmb3JtIGNvbXBhdGlibGUgbGlzdC4KPj4KPj4gVGhlIGJyY20s
YmNtMjgzOCBjb252ZW50aW9uIGlzIGFiYW5kb25lZC4gUmVtb3ZlIGl0Lgo+Pgo+PiBSZW5hbWUg
dGhlIHZhcmlhYmxlcyB3aXRoaW4gdGhlIGZpbGUgdG8gYSBycGk0XyogcHJlZml4IHNpbmNlIHRo
ZSBmaWxlCj4+IGlzIG1lYW50IHRvIGNvdmVyIHRoZSBSYXNwYmVycnkgUGkgNCBwbGF0Zm9ybS4K
Pj4KPj4gSWYgeW91IGFyZSB1c2luZyBhIGRldmljZSB0cmVlIHdpdGggdGhlIG9sZCBjb21wYXRp
YmxlIHN0cmluZwo+PiBicmNtLGJjbTI4MzgsIHlvdSB3aWxsIG5lZWQgdG8gdXBncmFkZSB5b3Vy
IGRldmljZSB0cmVlIHRvIG9uZSB0aGF0IGhhcwo+PiB0aGUgbmV3IGJyY20sYmNtMjcxMSBjb21w
YXRpYmxlIHN0cmluZy4KPj4KPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTExNjU0MDcvCj4+IFsyXSAKPj4gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xp
bnV4L2NvbW1pdC81M2ZkZDdiOGM4Y2I5Yzg3MTkwY2FhYjRmZDQ1OWY4OWUxYjRhN2Y4IAo+Pgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFu
ZEBkb3JuZXJ3b3Jrcy5jb20+Cj4gCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gCj4gQEp1ZXJnZW46IFJQSTQgc3VwcG9ydCBoYXMgYmVlbiBhZGRlZCBk
dXJpbmcgWGVuIDQuMTMgZGV2ZWxvcG1lbnQuIFRoaXMgCj4gaXMgc3RpbGwgaW4gZGV2ZWxvcG1l
bnQgKGkuZS4gaXQgY2FuJ3Qgd29yayBvdXQtb2YtYm94IGF0IGxlYXN0IG9uIHRoZSAKPiBrZXJu
ZWwgc2lkZSksIGJ1dCBpdCB3b3VsZCBiZSBnb29kIGlmIHdlIGNhbiBlbmFibGUgc3VwcG9ydCBm
b3IgbW9yZSAKPiByZWNlbnQga2VybmVsLiBUaGlzIHdvdWxkIGhlbHAgdG8gZHJhdyBtb3JlIHVz
ZXJzIHRvIFhlbiBhbmQgYWxzbyAKPiBwb3NzaWJseSByZWR1Y2UgdGhlIG51bWJlciBvZiBoYWNr
cyBuZWNlc3NhcnkgaW4gTGludXgvRGV2aWNlLVRyZWUgd2hlbiAKPiB1c2luZyBYZW4gb24gUlBJ
NC4KPiAKPiBUaGlzIHBhdGNoIG9ubHkgdG91Y2hlcyBSUEk0IHNwZWNpZmljIGNvZGUsIHNvIGl0
IHdpbGwgbm90IGFmZmVjdCB0aGUgCj4gcmVzdCBvZiB0aGUgc3VwcG9ydGVkIHBsYXRmb3JtLgoK
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
