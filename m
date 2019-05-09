Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042821954F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 00:39:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOrdW-0004iR-MB; Thu, 09 May 2019 22:35:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=przs=TJ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hOrdV-0004iM-1J
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 22:35:33 +0000
X-Inumbo-ID: c10b5e04-72aa-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c10b5e04-72aa-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 22:35:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1557441332; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=PNuXRDVcrBigHI5l+cES4LXGQSSaxYUBgg+P+qTXM2M=;
 b=qR7CRrYpS1YBwuxiDtbFc2/t0tJQ+WRinO9Mt80JcuqCU/cZAfS1O/vsf0CAH6Lmlaz9IrnJ
 JfQZBrxWxNNnPD1mTOIHgOJUvEcM9HkGjBvf3xAoG2Ot2RxQTbcHBUvfmSTcbIa0sVfd84z1
 6lKPpd6d7npjL65lrFe7K0EE6Ks=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5cd4ab33.7f5ae05072f0-smtp-out-n03;
 Thu, 09 May 2019 22:35:31 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 198so5135621wme.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 15:35:31 -0700 (PDT)
X-Gm-Message-State: APjAAAUd0pEi6mWFkQURaKrfnO2R0nvmmKPI7Ik6vbxD/TcWZg1PcQuo
 Im5olfaTWErOlvU6CK2N6wplun3ZzO0e7jk+g6g=
X-Google-Smtp-Source: APXvYqzSUGtzQSskz7G3CiAIqEXRsIUT1paB1+uri3exEeObCyz8bZ09UlbkckPUeR5Z38Fi7Nhp67wxvYhh9eg+9LE=
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr4711477wmb.39.1557441330678; 
 Thu, 09 May 2019 15:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
 <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
In-Reply-To: <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 May 2019 16:34:54 -0600
X-Gmail-Original-Message-ID: <CABfawhn-Qhjr3ES=g2n9kskauXC0JV9eoQBAZ23U-0cHR8YsNQ@mail.gmail.com>
Message-ID: <CABfawhn-Qhjr3ES=g2n9kskauXC0JV9eoQBAZ23U-0cHR8YsNQ@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCAzOjUwIFBNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzEwLzE5IDEyOjMxIEFNLCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+ID4gV2hhdCB3ZSdsbCBoYXZlIHRvIGRvIGlzIGVuZCB1cCBpbiBhIHBv
c2l0aW9uIHdoZXJlIHdlIGNhbiBoYXZlIHNvbWUKPiA+IHJlYWwgJWRyIHNldHRpbmdzIGdpdmVu
IGJ5IHRoZSBWTUkgYWdlbnQsIGFuZCBzb21lIHNoYWRvdyAlZHIgc2V0dGluZ3MKPiA+IHdoaWNo
IHRoZSBndWVzdCBpbnRlcmFjdHMgd2l0aC4gIEFsc28gSSBzaG91bGQgd2FybiB5b3UgYXQgdGhp
cyBwb2ludAo+ID4gdGhhdCwgYmVjYXVzZSBvZiBob3cgdGhlIHJlZ2lzdGVycyB3b3JrLCBJdCB3
aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBoYXZlCj4gPiBndWVzdC1zaGFkb3dlZCAlZHIgZnVuY3Rp
b25pbmcgYXQgdGhlIHNhbWUgdGltZSBhcyBWTUktcHJvdmlkZWQgJWRyCj4gPiBzZXR0aW5ncy4K
PiA+Cj4gPiBJIGd1ZXNzIHRoZSBtYWluIHVzZWNhc2UgaGVyZSBpcyBzaW1wbHkgaGlkaW5nIGZy
b20gdGhlIGd1ZXN0IGtlcm5lbAo+ID4gdGhhdCBkZWJ1Z2dpbmcgYWN0aXZpdGllcyBhcmUgaW4g
dXNlLCBhbmQgd2UgYXJlIG9rIHRvIGJyZWFrIHRoZSByZWFsCj4gPiB1c2Ugb2YgZ2RiL290aGVy
IGluc2lkZSB0aGUgZ3Vlc3Q/ICBSYXp2YW4vVGFtYXM6IEFzIHlvdXIgdGhlCj4gPiBtYWludGFp
bmVycywgaXQgaXMgeW91ciBjYWxsLCB1bHRpbWF0ZWx5Lgo+Cj4gV2hhdCB3b3JyaWVzIG1lIGhl
cmUgaXMgdGhhdCBpbiB0aGF0IGNhc2UgaXQgYmVjb21lcyBlYXNpZXIgZm9yIGEgcm9ndWUKPiBh
cHBsaWNhdGlvbiBpbnNpZGUgdGhlIGd1ZXN0IHRvIGZpZ3VyZSBvdXQgdGhhdCB0aGUgZ3Vlc3Qn
cyBiZWluZwo+IG1vbml0b3JlZCwgaWYgSSB1bmRlcnN0YW5kIHRoaW5ncyBjb3JyZWN0bHkuCj4K
PiBPZiBjb3Vyc2UsIGEgZG9tMCBpbnRyb3NwZWN0aW9uIGFnZW50IG1heSBjaG9vc2UgdG8gc2lt
cGx5IG5vdCBzdWJzY3JpYmUKPiB0byBEUiBldmVudHMsIGFuZCB0aHVzIG5vdCBhbHRlciB0aGUg
Y3VycmVudCBmbG93IGF0IGFsbCwgd2hpY2ggbWFrZXMKPiB0aGluZ3MgYmV0dGVyLgoKSSBhZ3Jl
ZSwgaWRlYWxseSBub25lIG9mIHRoZSBWTUkgZXZlbnRzIHNob3VsZCBhbHRlciB0aGUgZ3Vlc3Rz
JwphYmlsaXR5IHRvIGRvIGFueXRoaW5nIGl0IG5vcm1hbGx5IGNhbiBhbmQgdGhlIFZNSSBldmVu
dHMgc2hvdWxkIG9ubHkKYWRkIG92ZXJoZWFkIChhbmQgb2YgY291cnNlIHRoZSBjYWNoZSBzaWRl
LWVmZmVjdHMgdGhhdCBhcmUKZGV0ZWN0YWJsZSkuIFRoYXQgc2FpZCwgc2luY2UgdGhlIHVzZWNh
c2UgZm9yIE1hdGhpZXUgaXMgb25lIHdoZXJlIGhlCmNhbiBsaXZlIHdpdGggdGhlIGd1ZXN0IG5v
dCBiZWluZyBhYmxlIHRvIHJ1biBhIGRlYnVnZ2VyLCBJIHdvdWxkCnN0aWxsIGFjY2VwdCB0aGUg
cGF0Y2ggYXMgbG9uZyBhcyB0aGVyZSBpcyBhbiBleHBsaWNpdCBjb21tZW50CmRvY3VtZW50aW5n
IGl0cyBsaW1pdGF0aW9uLiBXZSBjYW4gd29ycnkgYWJvdXQgZmlndXJpbmcgb3V0IGhvdyB0bwpt
YWtlIHRoZSBldmVudCB0cmFuc3BhcmVudCBpZmYgdGhhdCBiZWNvbWVzIG5lZWRlZCBmb3Igc29t
ZSBvdGhlcgp1c2VjYXNlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
