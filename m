Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0DE766
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8sT-0004GO-Iw; Mon, 29 Apr 2019 16:11:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL8sR-0004GJ-IR
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 16:11:35 +0000
X-Inumbo-ID: 74e788f3-6a99-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74e788f3-6a99-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:11:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="84669391"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-6-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <ab261ac1-795d-687a-31b2-d7b29e39dde2@citrix.com>
Date: Mon, 29 Apr 2019 17:11:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190416120716.26269-6-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 6/6]
 create-diff-object: Do not include all .rodata sections
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8xNi8xOSAxOjA3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBTdGFydGlu
ZyB3aXRoIHRoZSAiMmFmNmYxYWE2MjMzIEZpeCBwYXRjaCBjcmVhdGlvbiB3aXRoIEdDQyA2LjEr
IiBjb21taXQKPiBhbGwgLnJvZGF0YSBzZWN0aW9ucyBhcmUgaW5jbHVkZWQgYnkgZGVmYXVsdCAo
cmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkKPiBhcmUgbmVlZGVkIG9yIG5vdCkuCj4gRHVyaW5n
IHN0YWNrZWQgaG90cGF0Y2ggYnVpbGRzIGl0IGxlYWRzIHRvIHVubmVjZXNzYXJ5IGR1cGxpY2F0
aW9uIG9mCj4gdGhlIC5yb2RhdGEgc2VjdGlvbnMgYXMgZWFjaCBhbmQgZXZlcnkgY29uc2VjdXRp
dmUgaG90cGF0Y2ggY29udGFpbnMgYWxsCj4gdGhlIC5yb2RhdGEgc2VjdGlvbiBvZiBwcmV2aW91
cyBob3RwYXRjaGVzLgoKVGhpcyBjb21taXQgbWVzc2FnZSBpcyBhIGJpdCBjb25mdXNpbmcuCgox
KSBBbGwgb2YgdGhpcyBvbmx5IGFwcGxpZXMgdG8gLnJvZGF0YS5zdHIqIHNlY3Rpb25zLiBPdGhl
ciAucm9kYXRhIApzZWN0aW9ucyBhcmUgaGFuZGxlZCBzZXBhcmF0ZWx5LgoKMikgVGhlIGFib3Zl
IGNvbW1pdCBfZGlkIG5vdF8gaW50cm9kdWNlIHRoZSBwcm9ibGVtLiBQcmV2aW91cyB2ZXJzaW9u
cyAKb2YgR0NDIGRpZCBub3Qgc3BsaXQgLnJvZGF0YS5zdHIgc2VjdGlvbnMgYnkgZnVuY3Rpb24g
d2hpY2ggbWVhbnQgdGhhdCAKdGhlIGVudGlyZSBzZWN0aW9uIHdhcyBhbHdheXMgaW5jbHVkZWQu
IFRoZSBjb21taXQgZml4ZWQgcGF0Y2ggY3JlYXRpb24gCmFuZCBfbWFpbnRhaW5lZF8gdGhlIGV4
aXN0aW5nIGJlaGF2aW91ciBmb3IgR0NDIDYuMSsgYnkgaW5jbHVkaW5nIGFsbCAKdGhlIC5yb2Rh
dGEuc3RyKiBzZWN0aW9ucy4gVGhpcyBwYXRjaCBub3cgaW5jbHVkZXMgb25seSB3aGF0IGlzIG5l
ZWRlZCAKKGJ1dCBpdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB0aGlzIHdvdWxkIGxpa2VseSBub3Qg
YmUgdXNlZnVsIG9uIG9sZGVyIAp2ZXJzaW9ucyBvZiBHQ0Mgc2luY2UgdGhleSBkb24ndCBzcGxp
dCAucm9kYXRhLnN0ciBwcm9wZXJseSkuCgo+IAo+IFRvIHByZXZlbnQgdGhpcyBzaXR1YXRpb24s
IG1hcmsgdGhlIC5yb2RhdGEgc2VjdGlvbiBmb3IgaW5jbHVzaW9uIG9ubHkKPiBpZiB0aGV5IGFy
ZSByZWZlcmVuY2VkIGJ5IGFueSBvZiB0aGUgY3VycmVudCBob3RwYXRjaCBzeW1ib2xzIChvciBh
Cj4gY29ycmVzcG9uZGluZyBSRUxBIHNlY3Rpb24pLgo+IAo+IEV4dGVuZCBwYXRjaGFiaWxpdHkg
dmVyaWZpY2F0aW9uIHRvIGRldGVjdCBhbGwgbm9uLXN0YW5kYXJkLCBub24tcmVsYSwKPiBub24t
ZGVidWcgYW5kIG5vbi1zcGVjaWFsIHNlY3Rpb25zIHRoYXQgYXJlIG5vdCByZWZlcmVuY2VkIGJ5
IGFueSBvZgo+IHRoZSBzeW1ib2xzIG9yIFJFTEEgc2VjdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE5vcmJl
cnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+ICAgY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NyZWF0
ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKPiBpbmRleCBmNjA2MGNkLi5m
N2ViNDIxIDEwMDY0NAo+IC0tLSBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gKysrIGIvY3JlYXRl
LWRpZmYtb2JqZWN0LmMKPiBAQCAtMTM0MSw3ICsxMzQxLDcgQEAgc3RhdGljIHZvaWQga3BhdGNo
X2luY2x1ZGVfc3RhbmRhcmRfZWxlbWVudHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCj4gICAK
PiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNlYywgJmtlbGYtPnNlY3Rpb25zLCBsaXN0KSB7Cj4g
ICAJCS8qIGluY2x1ZGUgdGhlc2Ugc2VjdGlvbnMgZXZlbiBpZiB0aGV5IGhhdmVuJ3QgY2hhbmdl
ZCAqLwo+IC0JCWlmIChpc19zdGFuZGFyZF9zZWN0aW9uKHNlYykgfHwgc2hvdWxkX2luY2x1ZGVf
c3RyX3NlY3Rpb24oc2VjLT5uYW1lKSkgewo+ICsJCWlmIChpc19zdGFuZGFyZF9zZWN0aW9uKHNl
YykpIHsKPiAgIAkJCXNlYy0+aW5jbHVkZSA9IDE7Cj4gICAJCQlpZiAoc2VjLT5zZWNzeW0pCj4g
ICAJCQkJc2VjLT5zZWNzeW0tPmluY2x1ZGUgPSAxOwo+IEBAIC0xMzUyLDYgKzEzNTIsMTkgQEAg
c3RhdGljIHZvaWQga3BhdGNoX2luY2x1ZGVfc3RhbmRhcmRfZWxlbWVudHMoc3RydWN0IGtwYXRj
aF9lbGYgKmtlbGYpCj4gICAJbGlzdF9lbnRyeShrZWxmLT5zeW1ib2xzLm5leHQsIHN0cnVjdCBz
eW1ib2wsIGxpc3QpLT5pbmNsdWRlID0gMTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCBrcGF0
Y2hfaW5jbHVkZV9zdGFuZGFyZF9zdHJpbmdfZWxlbWVudHMoc3RydWN0IGtwYXRjaF9lbGYgKmtl
bGYpCj4gK3sKPiArCXN0cnVjdCBzZWN0aW9uICpzZWM7Cj4gKwo+ICsJbGlzdF9mb3JfZWFjaF9l
bnRyeShzZWMsICZrZWxmLT5zZWN0aW9ucywgbGlzdCkgewo+ICsJCWlmIChzaG91bGRfaW5jbHVk
ZV9zdHJfc2VjdGlvbihzZWMtPm5hbWUpICYmIGlzX3JlZmVyZW5jZWRfc2VjdGlvbihzZWMsIGtl
bGYpKSB7Cj4gKwkJCXNlYy0+aW5jbHVkZSA9IDE7Cj4gKwkJCWlmIChzZWMtPnNlY3N5bSkKPiAr
CQkJCXNlYy0+c2Vjc3ltLT5pbmNsdWRlID0gMTsKPiArCQl9Cj4gKwl9Cj4gK30KCkkgdGhpbmsg
aXQgd291bGQgYmUgc2ltcGxlciB0byBqdXN0IGFtZW5kIHRoZSBwcmV2aW91cyBmdW5jdGlvbiBy
YXRoZXIgCnRoYW4gaW50cm9kdWNpbmcgYSBuZXcgb25lLiBFLmcuCgouLi4gfHwgKHNob3VsZF9p
bmNsdWRlX3N0cl9zZWN0aW9uKHNlYy0+bmFtZSkgJiYgCmlzX3JlZmVyZW5jZWRfc2VjdGlvbihz
ZWMsIGtlbGYpKQoKUmVnYXJkcywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
