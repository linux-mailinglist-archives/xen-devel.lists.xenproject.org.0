Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9033B38
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:29:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXvQ8-0005sa-Im; Mon, 03 Jun 2019 22:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXvQ7-0005sV-9o
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:27:11 +0000
X-Inumbo-ID: b84518b6-864e-11e9-9bdd-ff1788ed549c
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b84518b6-864e-11e9-9bdd-ff1788ed549c;
 Mon, 03 Jun 2019 22:27:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559600827; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=0m1B87YvYVjTLNYurAWqcYH8MyHzgt+qWSLwGpBMrFI=;
 b=mk6an6Wz8oWl1ftRAttydHZEDpRhvaMjLgLL7SvCLaTPFvI76jiX9Fhcxjy//JMfFfwxA6Tf
 6WwHDdp1Z9kW9Z1qixGG38Fqmw8k943H2DBwJrMatH4IytlDuITI6zHzxcpBqI+CFo8NEHs4
 gkbN6lOMdFRrPETKo0qFnFk87aE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5cf59eba.7f2d5d4af2f0-smtp-out-n03;
 Mon, 03 Jun 2019 22:27:06 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b18so13699602wrq.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 15:27:05 -0700 (PDT)
X-Gm-Message-State: APjAAAWSUemBWvRKFRIcVe8AHlF1q5PhP4E3/7jjDau1cF5NGxuqsL6I
 rlsGrs1P4hEpUx8LqMNJK8oOGjSzCwgpdEzJjvE=
X-Google-Smtp-Source: APXvYqymr8formwL8CvRdgaozGuwWa97VIywaVk0xEATNdkvqZWzUB3u7DUFsmmdGRse1VPhxMeQXEMPHuzXLYERz3o=
X-Received: by 2002:adf:81c8:: with SMTP id 66mr17285614wra.261.1559600824503; 
 Mon, 03 Jun 2019 15:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
 <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
In-Reply-To: <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 3 Jun 2019 16:26:28 -0600
X-Gmail-Original-Message-ID: <CABfawhmhdgks1k77EwY_h4-biFmvFuE-uO_1LtZ082mUVDDxnA@mail.gmail.com>
Message-ID: <CABfawhmhdgks1k77EwY_h4-biFmvFuE-uO_1LtZ082mUVDDxnA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/9] vm_event: Define VM_EVENT type
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA0OjIyIFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gIC8qIFhFTl9ET01DVExfbWVtX3NoYXJpbmdfb3Au
Cj4gPiA+IC0gKiBUaGUgQ09OVFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJyaW5ndXAvdGVh
cmRvd24uICovCj4gPiA+ICsgKiBUaGUgQ09OVFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJy
aW5ndXAvdGVhcmRvd24uCj4gPiA+ICsgKiBQbGVhc2Ugbm90ZSB0aGF0IG1lbSBzaGFyaW5nIGNh
biBiZSB0dXJuZWQgb24gKndpdGhvdXQqIHNldHRpbmctdXAgdGhlCj4gPiA+ICsgKiBjb3JyZXNw
b25kaW4gcmluZwo+ID4gPiArICovCj4gPgo+ID4gQXMgYSB0YW5nZW50LCBpdCBjYW4/IGhvdz8g
IChJJ20gZW50aXJlbHkgcHJlcGFyZWQgdG8gYmVsaWV2ZSB0aGF0IHRoaXMKPiA+IGlzIGhvdyB0
aGUgY29kZSBjdXJyZW50bHkgd29ya3MsIGJ1dCBJIGNhbid0IHNlZSBob3cgc3VjaCBhIHNldHVw
IHdvdWxkCj4gPiBwbGF1c2libHkgd29yay4pCj4KPiBUaGUgdm1fZXZlbnQgcmluZyBmb3IgbWVt
X3NoYXJpbmcgaXMgb25seSB1c2VkIHRvIGNvbW11bmljYXRlCj4gb3V0LW9mLW1lbW9yeSBjb25k
aXRpb24gdG8gYW4gZXh0ZXJuYWwgbGlzdGVuZXIuIEkgdGhpbmsgaXQncyBvbmx5Cj4gdXNlZnVs
IGZvciBsb2dnaW5nIHNpbmNlIHRoZSBsaXN0ZW5lciB3b3VsZG4ndCByZWFsbHkgYmUgaW4gYSBw
b3NpdGlvbgo+IHRvIHRyeSB0byAibWFrZSBzcGFjZSIgZm9yIHRoZSBmYXVsdGluZyBkb21haW4g
YW5kIGl0IHdvdWxkIGdldAo+IGRlc3Ryb3llZCBhZnRlciB0aGUgbWVzc2FnZSBpcyBzZW50LiBJ
biBhbnkgY2FzZSwgdGhlcmUgaXNuJ3QgYW55Cj4gZG9jdW1lbnRhdGlvbiBmb3IgaG93IGl0IHdh
cyBpbnRlbmRlZCB0byBiZSB1c2VkIHNvIHRoaXMgaXMganVzdCBteQo+IGd1ZXNzLgoKQWN0dWFs
bHksIGl0IHNlZW1zIHRoZSBsaXN0ZW5lciB3YXMgaW50ZW5kZWQgdG8gYmUgYWJsZSB0byB0cnkg
dG8KIm1ha2Ugc3BhY2UiIGZvciB0aGUgZG9tYWluLiBIb3cgZXhhY3RseSBpcyBub3QgY2xlYXIg
YnV0IGFueXdheSwgdGhlCmRvbWFpbiB3b3VsZCBnZXQgcGF1c2VkIGlmIHRoZXJlIGlzIGEgbGlz
dGVuZXIgaW5zdGVhZCBvZiBqdXN0IGJlaW5nCmRlc3Ryb3llZCB3aGVuIHRoZXJlIGlzIGFuIEVO
T01FTSBlcnJvciB3aGlsZSB0cnlpbmcgdG8gZGVkdXBsaWNhdGUKc2hhcmVkIHBhZ2VzLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
