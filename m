Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886ED496A0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 03:25:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd2nX-00082p-KK; Tue, 18 Jun 2019 01:20:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=h25s=UR=126.com=lcy985a@srs-us1.protection.inumbo.net>)
 id 1hd2nW-00082k-4S
 for xen-devel@lists.xen.org; Tue, 18 Jun 2019 01:20:30 +0000
X-Inumbo-ID: 409cdeba-9167-11e9-8980-bc764e045a96
Received: from m15-26.126.com (unknown [220.181.15.26])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 409cdeba-9167-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=irgLu
 OnKoKiORsa7W99u6ptmcUpCTNzZi+tSoiGLF00=; b=WeEWuV2Kom0OcacWgWy51
 m2oHcDZmf12tzMoBLA5ZP6PBwhCLffdLfifNZ7SmTrt/2w8YVt3er/7xnykqQx+G
 7JKGtcyV0i6v3sPjbcGVsrc5b0+SAccSHj7kvyZd+uDnVGku5yx3X8ut8ExoL6zn
 JongXjcTr1LFrqj/ie6HcA=
Received: from lcy985a$126.com ( [14.18.236.70] ) by ajax-webmail-wmsvr26
 (Coremail) ; Tue, 18 Jun 2019 09:20:23 +0800 (CST)
X-Originating-IP: [14.18.236.70]
Date: Tue, 18 Jun 2019 09:20:23 +0800 (CST)
From: lcy985a  <lcy985a@126.com>
To: "Jan Beulich" <JBeulich@suse.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20190614(cb3344cf) Copyright (c) 2002-2019 www.mailtech.cn 126com
In-Reply-To: <5D076C5E0200007800238C6D@prv1-mh.provo.novell.com>
References: <12faee3a.750c.16b64f00e8e.Coremail.lcy985a@126.com>
 <5D076C5E0200007800238C6D@prv1-mh.provo.novell.com>
X-CM-CTRLDATA: wZ05+WZvb3Rlcl9odG09MTMyMjo1Ng==
MIME-Version: 1.0
Message-ID: <284c4f96.e76.16b682bb69b.Coremail.lcy985a@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GsqowAC3x69YPAhdXoY9AA--.37529W
X-CM-SenderInfo: pof1mmkvd6ij2wof0z/1tbi2Q7XiFpD802ELQABsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Subject: Re: [Xen-devel] hvmloader crashed when passthrough bridge device
 but not intel piix4 acpi pm
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
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============0016402237330057180=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0016402237330057180==
Content-Type: multipart/alternative; 
	boundary="----=_Part_13481_622906777.1560820823706"

------=_Part_13481_622906777.1560820823706
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SW4gbXkgY2FzZSwgdGhpcyBQTFggYnJpZGdlIG11c3Qgd29yayB3aXRoIHNvbWUgc3BlY2lhbCBz
b2Z0d2FyZSB3aGljaCBjYW4ndCAKcnVuIG9uIGRvbWFpbi0woaNTbyBJIGhhdmUgbm8gIGNob2lj
ZSB3aXRob3V0IHBhc3N0aHJvdWdoIGl0LgpJJ20gbm90IHN1cmUgYXJlIHRoZXJlIHNvbWUgb3Ro
ZXIgZGV2aWNlcyB3b3JraW5nIHNpbWlsYXIgd2l0aCB0aGlzIGJyaWRnZSwKQW5kIG5vdCBzdXJl
IGl0IGlzICBzdWl0YWJsZSBmb3Igb3RoZXJzLgpKdXN0IGRlYWwgd2l0aCB0aGUgb25lICBJIGZh
Y2VkLgoKCgoKQXQgMjAxOS0wNi0xNyAxODozMzowMiwgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDE3LjA2LjE5IGF0IDEyOjE2LCA8bGN5OTg1YUAxMjYu
Y29tPiB3cm90ZToKPj4gV2hlbiBwYXNzdGhyb3VnaCBhIFBMWCBQQ0k5MDU2IFBDSSB0byBJT0J1
cyBicmlkZ2UsCj4+ICAgICBodm1sb2FkZXIgd2lsbCBjcmFzaGVkIGZvciBpdCBkaXNhbGxvdyBp
bml0IGJyaWRnZSBjbGFzcyBwY2kgZGV2aWNlCj4+ICAgICBleGNlcHQgaW50ZWwgUElJWDQgQUNQ
SSBQTS4KPgo+UmlnaHQgbm93IHRoZSBjb25jZXB0dWFsIG1vZGVsIGltcGxpZXMgdGhhdCBicmlk
Z2VzIGFyZW4ndCBzdXBwb3NlZAo+dG8gYmUgcGFzc2VkIHRocm91Z2ggaW4gdGhlIGZpcnN0IHBs
YWNlLiBBdCBsZWFzdCB0aGF0J3MgbXkgdW5kZXJzdGFuZGluZy4KPkNvdWxkIHlvdSBleHBsYWlu
IHdoeSB5b3UgbmVlZCB0byBkbyBzbyBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4KPkZ1cnRoZXJtb3Jl
IG1ha2luZyBhbiBleGNsdXNpb24gb24gYSB2ZW5kb3IvZGV2aWNlIElEIGJhc2lzIGlzCj5zb21l
dGhpbmcgeW91IGNhbiB1c2UgZm9yIHlvdXIgb3duIHB1cnBvc2VzLCBidXQgaXMgdW5saWtlbHkg
dG8gYmUKPnN1aXRhYmxlIGZvciB1cHN0cmVhbSBpbmNsdXNpb246IFdoeSB3b3VsZCB0aGlzIG9u
ZSBzcGVjaWZpYyBkZXZpY2UKPmJlIGRpZmZlcmVudCBmcm9tIGFsbCBvdGhlciBzaW1pbGFyIG9u
ZXM/Cj4KPkphbgo+Cg==
------=_Part_13481_622906777.1560820823706
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SW4gbXkgY2FzZSwgdGhpcyBQTFggYnJpZGdlIG11c3Qg
d29yayB3aXRoIHNvbWUgc3BlY2lhbCBzb2Z0d2FyZSB3aGljaCBjYW4ndCZuYnNwOzwvZGl2Pjxk
aXY+cnVuIG9uIGRvbWFpbi0woaNTbyBJIGhhdmUgbm8mbmJzcDsgY2hvaWNlIHdpdGhvdXQgcGFz
c3Rocm91Z2ggaXQuPC9kaXY+PGRpdj5JJ20gbm90IHN1cmUgYXJlIHRoZXJlIHNvbWUgb3RoZXIg
ZGV2aWNlcyB3b3JraW5nIHNpbWlsYXIgd2l0aCB0aGlzIGJyaWRnZSw8L2Rpdj48ZGl2PkFuZCBu
b3Qgc3VyZSBpdCBpcyZuYnNwOyBzdWl0YWJsZSBmb3Igb3RoZXJzLjwvZGl2PjxkaXY+SnVzdCBk
ZWFsIHdpdGggdGhlIG9uZSZuYnNwOyBJIGZhY2VkLjxicj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRl
YXNlTWFpbENhcmQiPjwvZGl2Pjxicj48cHJlPjxicj5BdCAyMDE5LTA2LTE3IDE4OjMzOjAyLCAi
SmFuIEJldWxpY2giICZsdDtKQmV1bGljaEBzdXNlLmNvbSZndDsgd3JvdGU6CiZndDsmZ3Q7Jmd0
OyZndDsgT24gMTcuMDYuMTkgYXQgMTI6MTYsICZsdDtsY3k5ODVhQDEyNi5jb20mZ3Q7IHdyb3Rl
OgomZ3Q7Jmd0OyBXaGVuIHBhc3N0aHJvdWdoIGEgUExYIFBDSTkwNTYgUENJIHRvIElPQnVzIGJy
aWRnZSwKJmd0OyZndDsgICAgIGh2bWxvYWRlciB3aWxsIGNyYXNoZWQgZm9yIGl0IGRpc2FsbG93
IGluaXQgYnJpZGdlIGNsYXNzIHBjaSBkZXZpY2UKJmd0OyZndDsgICAgIGV4Y2VwdCBpbnRlbCBQ
SUlYNCBBQ1BJIFBNLgomZ3Q7CiZndDtSaWdodCBub3cgdGhlIGNvbmNlcHR1YWwgbW9kZWwgaW1w
bGllcyB0aGF0IGJyaWRnZXMgYXJlbid0IHN1cHBvc2VkCiZndDt0byBiZSBwYXNzZWQgdGhyb3Vn
aCBpbiB0aGUgZmlyc3QgcGxhY2UuIEF0IGxlYXN0IHRoYXQncyBteSB1bmRlcnN0YW5kaW5nLgom
Z3Q7Q291bGQgeW91IGV4cGxhaW4gd2h5IHlvdSBuZWVkIHRvIGRvIHNvIGluIHRoZSBmaXJzdCBw
bGFjZT8KJmd0OwomZ3Q7RnVydGhlcm1vcmUgbWFraW5nIGFuIGV4Y2x1c2lvbiBvbiBhIHZlbmRv
ci9kZXZpY2UgSUQgYmFzaXMgaXMKJmd0O3NvbWV0aGluZyB5b3UgY2FuIHVzZSBmb3IgeW91ciBv
d24gcHVycG9zZXMsIGJ1dCBpcyB1bmxpa2VseSB0byBiZQomZ3Q7c3VpdGFibGUgZm9yIHVwc3Ry
ZWFtIGluY2x1c2lvbjogV2h5IHdvdWxkIHRoaXMgb25lIHNwZWNpZmljIGRldmljZQomZ3Q7YmUg
ZGlmZmVyZW50IGZyb20gYWxsIG90aGVyIHNpbWlsYXIgb25lcz8KJmd0OwomZ3Q7SmFuCiZndDsK
PC9wcmU+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7
PC9wPjwvc3Bhbj4=
------=_Part_13481_622906777.1560820823706--



--===============0016402237330057180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0016402237330057180==--


