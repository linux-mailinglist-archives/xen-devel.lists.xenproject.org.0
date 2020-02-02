Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E614FC5B
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2020 10:08:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyBBS-0007Fx-O6; Sun, 02 Feb 2020 09:04:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zS8H=3W=merlin.srs.infradead.org=batv+d3332431526aff2919b9+6006+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iyBBQ-0007Fs-Ac
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2020 09:04:48 +0000
X-Inumbo-ID: 08356c66-459b-11ea-b211-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08356c66-459b-11ea-b211-bc764e2007e4;
 Sun, 02 Feb 2020 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S4KGY6BrosUVWr7qSYPjtyOHIz4PaeG+v9RWgtdbRyg=; b=1lxyZ4bJOypNFVUqmNDuZhVahj
 r+7F7xwcQY0F7Qk4ThFVKZf8ECKH0WQHKrXrln9yImYo+4AWD2KSWm3bZhjzzhtggo9dbXq6jViAe
 si8F1yGJvcuGdahGc/u8C5RqOrSmj5n2PORwxHRtPkv1wuDFS7lZig3NaasjRWvudqQQpDfFfkrU9
 N/y1nXDZ1nW2Oy0uLNReMIzgPmP0Ko92LjvcvsgmUHeRyZ6eGyZ+Q7eSXxI3n+uTfJ/15FzGQlkKx
 GUUVLIi3ZniqRrVy2UOcPx1yYLbBWinHAtL2hOUxxcQVBqm2R1Bunz1Gcc6x5PeGrpjaKEUhWP4rU
 htzakfFg==;
Received: from [2001:8b0:10b:1:7db1:61:a4a0:334e]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyBB8-0008Nm-My; Sun, 02 Feb 2020 09:04:31 +0000
Date: Sun, 02 Feb 2020 09:04:11 +0000
User-Agent: K-9 Mail for Android
In-Reply-To: <db1ff2aa4a0b4a4195eb374638becaf0@EX13D32EUC003.ant.amazon.com>
References: <723edf8e07ed0cbaacb6bce40bb98de3b88d69be.camel@infradead.org>
 <db1ff2aa4a0b4a4195eb374638becaf0@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 xen-devel <xen-devel@lists.xenproject.org>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <75F6EE03-B4E3-4B4D-89C2-C58931D12801@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH] libxc: migrate migration stream definitions
 into Xen public headers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Gautam, Varad" <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxIEZlYnJ1YXJ5IDIwMjAgMTE6NDU6NDIgR01ULCAiRHVycmFudCwgUGF1bCIgPHBkdXJy
YW50QGFtYXpvbi5jby51az4gd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+
IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPj4gU2VudDogMDEg
RmVicnVhcnkgMjAyMCAwMDo0MAo+PiBUbzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+Cj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Owo+QW5kcmV3Cj4+IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPj4gPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4
LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj5KdWxpZW4KPj4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj48a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT47Cj4+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEdhdXRhbSwgVmFyYWQKPj4gPHZyZEBhbWF6b24uZGU+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY28udWs+Cj4+IFN1YmplY3Q6IFtQQVRDSF0gbGlieGM6IG1pZ3JhdGUgbWlncmF0
aW9uIHN0cmVhbSBkZWZpbml0aW9ucyBpbnRvIFhlbgo+PiBwdWJsaWMgaGVhZGVycwo+PiAKPj4g
RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPj4gCj4+IFRoZXNlIGRh
dGEgc3RydWN0dXJlcyB3aWxsIGJlIHVzZWQgZm9yIGxpdmUgdXBkYXRlLCB3aGljaCBpcwo+YmFz
aWNhbGx5Cj4+IGp1c3QgbGl2ZSBtaWdyYXRpb24gZnJvbSBvbmUgWGVuIHRvIHRoZSBuZXh0IG9u
IHRoZSBzYW1lIG1hY2hpbmUgdmlhCj4+IGluLW1lbW9yeSBkYXRhIHN0cnVjdHVyZXMsIGluc3Rl
YWQgb2YgYWNyb3NzIHRoZSBuZXR3b3JrLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29v
ZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPj4gV2VsbC1leGNlbGxlbnQtY2Fycnktb24tdGhl
bi1ieTogSWFuIEphY2tzb24KPjxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+PiBHby13aXRo
LXRoYXQtZm9yLW5vdy1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPgo+VGhpcyBpcyBwcm9iYWJseSBmaW5lIGJ1dCBtYXkgbmVlZCBzb21lIHJlLXN0cnVjdHVy
aW5nIHdoZW4gd2UgY29uc2lkZXIKPm5vbi1jb29wZXJhdGl2ZSBtaWdyYXRpb24uIEkgaGF2ZSBu
b3QgeWV0IGhhZCB0aW1lIHRvIHBvc3QgYSBkZXNpZ24KPmRvY3VtZW50IGJ1dCBteSB0aG91Z2h0
cyBhcmUgYWxvbmcgdGhlIGxpbmVzIG9mIGdlbmVyYWxpc2luZyB0aGUgaWRlYQo+b2YgJ2h2bV9j
b250ZXh0JyByZWNvcmRzIGludG8gJ2RvbWFpbl9jb250ZXh0JyAob3Igc29tZSBzdWl0YWJsZSBu
YW1lKS4KPlRoZW4gd2UgY2FuIGFkZCB0aGUgbmVjZXNzYXJ5ICdQVicgc2F2ZSByZWNvcmRzLCBz
dWNoIGFzIGV2ZW50IGNoYW5uZWwKPnN0YXRlLCBncmFudCB0YWJsZSBzdGF0ZSwgZXRjLiBXZSBt
YXkgdGhlbiB3YW50IHRvIGNvbnNpZGVyIHVzaW5nIHRoZQo+c2FtZSBtZWNoYW5pc20gZm9yIFBW
IHNoYXJlZCBpbmZvIGFuZCBtYXliZSBzb21lIG9mIHRoZSBvdGhlciByZWNvcmRzCj50aGF0IGFy
ZSBjdXJyZW50bHkgJ3RvcCBsZXZlbCcgaW4gdGhlIFhDIG1pZ3JhdGlvbiBzdHJlYW0uCgpSaWdo
dC4gVGhpcyBpcyBqdXN0IHRoZSBleGlzdGluZyBBQkk7IHN0cnVjdHVyZXMgdGhhdCBleGlzdCBv
biB0aGUgd2lyZSBhbmQgYXJlIGluIHNvbWUgY2FzZXMgZXhwb3J0ZWQgYnkgZXhpc3RpbmcgZG9t
Y3Rscy4KCkFzIHdlIGJ1aWxkIHVwb24gaXQgZm9yIGxpdmUgdXBkYXRlIGFuZCBHVCBtaWdyYXRp
b24sIHdlIG5lZWQgdG8gY2FyZWZ1bGx5IGNvbnNpZGVyIGhvdyB3ZSBkbyB0aGF0IOKAlCBhbmQg
d2hldGhlciBhbnkgb2YgdGhlIG5ldyBvciBpbmRlZWQgZXhpc3RpbmcgZmllbGRzIGluIHRoZSBI
Vk1fQ09OVEVYVCBzaG91bGQgYWN0dWFsbHkgYmUgdG9wLWxldmVsIG1pZ3JhdGlvbiByZWNvcmRz
IGluIHRoZWlyIG93biByaWdodCwgd2hpY2ggSSB0aGluayBpcyB3aGF0IHlvdSdyZSBzdWdnZXN0
aW5nLgoKVGhpcyBwYXRjaCBpcyBqdXN0IHRoZSBiYXNpcyBmb3IgdGhhdCB3b3JrLCBhcyBpdCdz
IHByZWNpc2VseSB0aGUgc3RydWN0dXJlcyB3ZSBoYXZlIGFscmVhZHk7IGp1c3QgcmVuYW1lZCBh
bmQgbW92ZWQgaW50byBzY29wZSBmb3Igd2hhdCBjb21lcyBuZXh0LgoKLS0gCmR3bXcyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
