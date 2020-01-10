Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FC13764A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 19:44:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipzE7-00071x-0t; Fri, 10 Jan 2020 18:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w2Xu=27=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipzE5-00071s-QF
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 18:41:41 +0000
X-Inumbo-ID: d205867c-33d8-11ea-b89f-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d205867c-33d8-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 18:41:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578681693; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=4okBcia8HOwxa3XFkJtoSnsR6fL0mm4RniXGzafasaQ=;
 b=HuW1O1QdBtoQL4k382wDFaLknDpr+sFJ0C1xIm6ECyT8GyIsH1zqQxKTWXZLQQVzWhLOQoRz
 8VfAsRsAM1lWbNl1kbRuQuZ9waEZHKStdfjwncA/Z6hqcSDtuuVs242tizPYg/6S1wkPkIwB
 CKGe+oy9uuE/gEXq/8xvnTgYbmo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5e18c559.7ff833adb8b0-smtp-out-n01;
 Fri, 10 Jan 2020 18:41:29 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b6so2792060wrq.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2020 10:41:29 -0800 (PST)
X-Gm-Message-State: APjAAAVuXfnVFkbkwqH0e4jpwzdQ0Jgeg7CNkI0tH9glf8Fmj20Z/Prx
 ojueax2z/7DNsIIiq9Yo2HmK2dtI1Gnd3z19Ang=
X-Google-Smtp-Source: APXvYqwtyANU7bL/kiPATYjhrjmATRrps5FJ52JGAEHR9x17zjtrcWyHmdaC0z3VXFHjPu3uJTTiyScujON848ILCSo=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr4798728wru.353.1578681688440; 
 Fri, 10 Jan 2020 10:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20200110023052.21159-1-tamas@tklengyel.com>
 <20200110023052.21159-2-tamas@tklengyel.com>
 <0e418ebe-18fb-e76a-21b1-55d35e95fa34@citrix.com>
In-Reply-To: <0e418ebe-18fb-e76a-21b1-55d35e95fa34@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 10 Jan 2020 11:40:52 -0700
X-Gmail-Original-Message-ID: <CABfawhnnjXJSJ6jK-RrydVzkhU4ZhKUcVnmPHH5ohqotDao2gw@mail.gmail.com>
Message-ID: <CABfawhnnjXJSJ6jK-RrydVzkhU4ZhKUcVnmPHH5ohqotDao2gw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/2] Remove undocumented and unmaintained
 tools/memshr library
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMTA6NTkgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC8wMS8yMDIwIDAyOjMwLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBUaGUgbGlicmFyeSBoYXMgYmVlbiBsYXJnZWx5IHVudG91Y2hl
ZCBmb3Igb3ZlciBhIGRlY2FkZSBhdCB0aGlzIHBvaW50LCBpdCBpcwo+ID4gdW5kb2N1bWVudGVk
IGFuZCBpdCdzIHVuY2xlYXIgd2hhdCBpdCB3YXMgb3JpZ2luYWxseSB1c2VkIGZvci4gUmVtb3Zl
IGl0IGZyb20KPiA+IHRyZWUsIGlmIGFueW9uZSBuZWVkcyBpdCBpbiB0aGUgZnV0dXJlIGl0IGNh
biBiZSBjYXJ2ZWQgb3V0IGZyb20gZ2l0IGhpc3RvcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+Cj4gSG1tIC0gdGhpcyBpcyBh
IGxpdHRsZSBhd2t3YXJkLiAgWW91IHJlbW92ZSB5b3Vyc2VsZiBhcyBtYWludGFpbmVyIG9mCj4g
dGhpcyBjb2RlLCB0aGVuIGRlbGV0ZSBpdC4KPgo+IEkgc3VzcGVjdCB3aGF0IHlvdSB3YW50IHRv
IGRvIGlzIGhhdmUgcGF0Y2ggMSBzaW1wbHkgYWRkIHRvb2xzL3Rlc3QKPiBzYXlpbmcgImluY2x1
ZGUgb3RoZXIgbWVtc2hyIGNvbnRlbnQiLCBhbmQgdGhpcyBwYXRjaCBkZWxldGUKPiB0b29scy9t
ZW1zaHIgaW5jbHVkaW5nIHRoZSBlbnRyeSBpbiB0aGUgbWFpbnRhaW5lcnMgZmlsZS4gIChDYW4g
YmUgZml4ZWQKPiB1cCBvbiBjb21taXQgb2YgY291cnNlLCBzZWVpbmcgYXMgdGhpcyBpcyB0aGUg
b25seSBpc3N1ZS4pCj4KPiBPdmVyYWxsLCBJIGFncmVlIHdpdGggdGhlIGNoYW5nZSwgYnV0IGl0
IHdpbGwgbmVlZCBhIHRvb2xzIGFjay4KPgoKSSB3YXMgY29uc2lkZXJpbmcganVzdCBzcXVhc2hp
bmcgdGhlIHR3byBwYXRjaGVzIGludG8gb25lIGJ1dCB3YXNuJ3QKc3VyZSBpZiBhbnlvbmUgd291
bGQgb2JqZWN0IHRvIHJlbW92aW5nIGRlYWQgY29kZSAodGhhdCBzZWVtcyB0byBiZQpuZXZlciBk
b25lKS4gU28gaWYgdGhlcmUgaXMgbm8gb2JqZWN0aW9uIGFuZCB0aGUgb25seSBwcm9ibGVtIGlz
CiJvcmRlcmluZyIsIGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8ganVzdCBzcXVhc2ggdGhlIHR3byBp
bnRvIG9uZSBkdXJpbmcKY29tbWl0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
