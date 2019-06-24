Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5E50B86
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 15:10:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfOhL-0007Ts-1t; Mon, 24 Jun 2019 13:07:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Snzw=UX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hfOhK-0007Tn-37
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 13:07:50 +0000
X-Inumbo-ID: 0ff02a0d-9681-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0ff02a0d-9681-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 13:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDFDEAEC7;
 Mon, 24 Jun 2019 13:07:46 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ed451198-9953-7b2d-4963-b60d3015bb5b@suse.com>
Date: Mon, 24 Jun 2019 15:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 3/6] x86: Add nopv parameter to disable PV
 extensions
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
Cc: sstabellini@kernel.org, mingo@kernel.org, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDYuMTkgMTU6MDEsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IEluIHZpcnR1YWxpemF0
aW9uIGVudmlyb25tZW50LCBQViBleHRlbnNpb25zIChkcml2ZXJzLCBpbnRlcnJ1cHRzLAo+IHRp
bWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNlIGNhc2VzIHdoaWNo
IGlzIHRoZQo+IGJlc3Qgb3B0aW9uLgo+IAo+IEhvd2V2ZXIsIGluIHNvbWUgY2FzZXMgKGtleGVj
IG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCj4gd2Ugd2FudCB0byBkaXNhYmxlIFBW
IGV4dGVuc2lvbnMuIEFzIHN1Y2ggaW50cm9kdWNlIHRoZQo+ICdub3B2JyBwYXJhbWV0ZXIgdGhh
dCB3aWxsIGRvIGl0Lgo+IAo+IFRoZXJlIGlzIGFscmVhZHkgJ3hlbl9ub3B2JyBwYXJhbWV0ZXIg
Zm9yIFhFTiBwbGF0Zm9ybSBidXQgbm90IGZvcgo+IG90aGVycy4gJ3hlbl9ub3B2JyBjYW4gdGhl
biBiZSByZW1vdmVkIHdpdGggdGhpcyBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpo
b25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgfCAgNCArKysrCj4gICBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVy
dmlzb3IuYyAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IDEzOGY2NjYuLmIzNTJmMzYgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IEBA
IC01MjY4LDYgKzUyNjgsMTAgQEAKPiAgIAkJCWltcHJvdmUgdGltZXIgcmVzb2x1dGlvbiBhdCB0
aGUgZXhwZW5zZSBvZiBwcm9jZXNzaW5nCj4gICAJCQltb3JlIHRpbWVyIGludGVycnVwdHMuCj4g
ICAKPiArCW5vcHY9CQlbWDg2XQo+ICsJCQlEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0aW9ucyBm
b3JjaW5nIHRoZSBndWVzdCB0byBydW4KPiArCQkJYXMgZ2VuZXJpYyBndWVzdCB3aXRoIG5vIFBW
IGRyaXZlcnMuCj4gKwo+ICAgCXhpcmMycHNfY3M9CVtORVQsUENNQ0lBXQo+ICAgCQkJRm9ybWF0
Ogo+ICAgCQkJPGlycT4sPGlycV9tYXNrPiw8aW8+LDxmdWxsX2R1cGxleD4sPGRvX3NvdW5kPiw8
bG9ja3VwX2hhY2s+Wyw8aXJxMj5bLDxpcnEzPlssPGlycTQ+XV1dCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9oeXBl
cnZpc29yLmMKPiBpbmRleCA0NzljYTQ3Li40ZjJjODc1IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9oeXBl
cnZpc29yLmMKPiBAQCAtODUsMTAgKzg1LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjb3B5X2Fy
cmF5KGNvbnN0IHZvaWQgKnNyYywgdm9pZCAqdGFyZ2V0LCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiAg
IAkJCXRvW2ldID0gZnJvbVtpXTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgYm9vbCBub3B2Owo+ICtz
dGF0aWMgX19pbml0IGludCB4ZW5fcGFyc2Vfbm9wdihjaGFyICphcmcpCgpZb3UgcmVhbGx5IGRv
bid0IHdhbnQgdG8gdXNlIHRoZSAieGVuXyIgcHJlZml4IGhlcmUuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
