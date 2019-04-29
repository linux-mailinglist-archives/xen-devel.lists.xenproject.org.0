Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5CBE408
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 15:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL6ip-00060a-20; Mon, 29 Apr 2019 13:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL6in-00060V-29
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 13:53:29 +0000
X-Inumbo-ID: 282b03e6-6a86-11e9-b43f-3b5de26950d6
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 282b03e6-6a86-11e9-b43f-3b5de26950d6;
 Mon, 29 Apr 2019 13:53:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84641255"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-4-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <48e629c2-f1f3-bacf-6d86-1c2d1045a41f@citrix.com>
Date: Mon, 29 Apr 2019 14:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190408083224.104802-4-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 4/4] livepatch-build: Handle
 newly created object files
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

T24gNC84LzE5IDk6MzIgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IFVwIHRvIG5v
dyB0aGUgbGl2ZXBhdGNoLWJ1aWxkIGlnbm9yZXMgbmV3bHkgY3JlYXRlZCBvYmplY3QgZmlsZXMu
Cj4gV2hlbiBwYXRjaCBhcHBsaWVzIG5ldyAuYyBmaWxlIGFuZCBhdWdtZW50cyBpdHMgTWFrZWZp
bGUgdG8gYnVpbGQgaXQKPiB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlIGlzIG5vdCB0YWtlbiBp
bnRvIGFjY291bnQgZm9yIGZpbmFsIGxpbmtpbmcKPiBzdGVwLgo+IAo+IFN1Y2ggbmV3bHkgY3Jl
YXRlZCBvYmplY3QgZmlsZXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNvbXBhcmluZyBwYXRjaGVkLwo+
IGFuZCBvcmlnaW5hbC8gZGlyZWN0b3JpZXMgYW5kIGNvcGllZCBvdmVyIHRvIHRoZSBvdXRwdXQg
ZGlyZWN0b3J5IGZvcgo+IHRoZSBmaW5hbCBsaW5raW5nIHN0ZXAuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE5vcmJl
cnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+ICAgbGl2ZXBhdGNoLWJ1aWxk
IHwgNiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvbGl2ZXBhdGNoLWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxkCj4gaW5kZXggNzk2ODM4
Yy4uYjQzNzMwYyAxMDA3NTUKPiAtLS0gYS9saXZlcGF0Y2gtYnVpbGQKPiArKysgYi9saXZlcGF0
Y2gtYnVpbGQKPiBAQCAtMTQ2LDYgKzE0NiwxMiBAQCBmdW5jdGlvbiBjcmVhdGVfcGF0Y2goKQo+
ICAgICAgICAgICBmaQo+ICAgICAgIGRvbmUKPiAgIAo+ICsgICAgTkVXX0ZJTEVTPSQoY29tbSAt
MjMgPChmaW5kIHBhdGNoZWQgLXR5cGUgZiAtbmFtZSAnKi5vJyB8IGN1dCAtZjItIC1kJy8nIHwg
c29ydCAtdSkgPChmaW5kIG9yaWdpbmFsIC10eXBlIGYgLW5hbWUgJyoubycgfCBjdXQgLWYyLSAt
ZCcvJyB8IHNvcnQgLXUpKQoKVGhlIHBhdGhzIHNob3VsZCBiZSBgcGF0Y2hlZC94ZW5gIGFuZCBg
b3JpZ2luYWwveGVuYCBzbyB0aGF0IG9ubHkgCmh5cGVydmlzb3IgY2hhbmdlcyBhcmUgcHJvY2Vz
c2VkLiBJdCBpcyBkb25lIHRoaXMgd2F5IGVhcmxpZXIgKHNlZSAKRklMRVM9IiQoZmluZCB4ZW4g
Li4uKSIpLgoKU2luY2UgcHJvY2VzcyBzdWJzdGl0dXRpb24gY3JlYXRlcyBhIHN1YnNoZWxsLCBp
dCBtaWdodCBiZSBzaW1wbGVyIHRvIGRvIAo8KGNkIHBhdGNoZWQveGVuICYmIGZpbmQgLiAuLi4p
IGFuZCB0aGVuIGRyb3AgdGhlIGBjdXRgLiBBbHNvLCB0aGUgYC11YCAKYXJndW1lbnQgdG8gc29y
dCBzZWVtcyB1bm5lY2Vzc2FyeS4KCj4gKyAgICBmb3IgaSBpbiAkTkVXX0ZJTEVTOyBkbwo+ICsg
ICAgICAgIGNwICJwYXRjaGVkLyRpIiAib3V0cHV0LyRpIgo+ICsgICAgICAgIENIQU5HRUQ9MQo+
ICsgICAgZG9uZQoKSWYgdGhlIGxpdmUgcGF0Y2ggZm9yIHdoYXRldmVyIHJlYXNvbiBoYXMgbm8g
InBhdGNoZWQiIG9iamVjdCBmaWxlcyBhbmQgCm9ubHkgIm5ldyIgb2JqZWN0IGZpbGVzLCB0aGVu
IGl0IGlzIG5vdCBnb2luZyB0byBkbyBhbnl0aGluZyB1c2VmdWwgCnNpbmNlIG5vdGhpbmcgd2ls
bCB1c2UgdGhlIG5ldyBmdW5jdGlvbnMuIFRoaXMgc2hvdWxkIGZhaWwgdG8gYnVpbGQgd2l0aCAK
YW4gZXJyb3IuIEUuZy4gc2V0IE5FVz0xIGFib3ZlIGFuZCB0aGVuIGxhdGVyIGNoZWNrIGZvciBD
SEFOR0VEPTAgJiYgTkVXPTEuCgpQcmV2aW91c2x5IGFsbCBvYmplY3QgZmlsZXMgdGhhdCB3ZXJl
IGxpbmtlZCBpbnRvIHRoZSBsaXZlcGF0Y2ggd2VyZSAKZnJvbSB0aGUgb3V0cHV0IG9mIGNyZWF0
ZS1kaWZmLW9iamVjdC4gVGhpcyBjaGFuZ2UganVzdCBpbmNsdWRlcyB0aGUgCm5ld2x5IGJ1aWx0
IG9iamVjdCBmaWxlcyBkaXJlY3RseS4gSSB3b25kZXIgaWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMg
b3IgCnN1YnRsZSBkaWZmZXJlbmNlcyB3aGVuIGRvaW5nIHRoaXM/IEEgY291cGxlIG9mIGRpZmZl
cmVuY2VzIG9mZiB0aGUgdG9wIApvZiBteSBoZWFkOgoKMSkgVGhlIG9iamVjdCBmaWxlIHdpbGwg
aW5jbHVkZSBfZXZlcnl0aGluZ18gKGUuZy4gcG90ZW50aWFsbHkgdW51c2VkIApmdW5jdGlvbnMp
IHdoaWxlIGNyZWF0ZS1kaWZmLW9iamVjdCBnZW5lcmFsbHkgb25seSBpbmNsdWRlcyB0aGUgbWlu
aW11bSAKdGhhdCBpcyBuZWVkZWQuCgoyKSBIb29rcyBhbmQgaWdub3JlZCBmdW5jdGlvbnMvc2Vj
dGlvbnMgaW4gdGhlIG5ldyBvYmplY3QgZmlsZSB3b3VsZCBub3QgCmJlIHByb2Nlc3NlZCBhdCBh
bGwuCgpUaGUgd2FzIHByZXZpb3VzbHkgYSBwYXRjaCBvbiB4ZW4tZGV2ZWwgd2hpY2ggdG9vayBh
IGRpZmZlcmVudCBhcHByb2FjaCAKKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0wNi9tc2cwMzUzMi5odG1sKS4gClBlcmhhcHMgeW91IGNv
dWxkIGxvb2sgYXQgaXQgYW5kIHNlZSB3aGljaCBhcHByb2FjaCB3b3VsZCBiZSBiZXR0ZXI/CgpU
aGFua3MsCi0tIApSb3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
