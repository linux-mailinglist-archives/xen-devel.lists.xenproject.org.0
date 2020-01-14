Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D737013A77F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:38:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJX6-0004Vh-KM; Tue, 14 Jan 2020 10:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irJX4-0004Vc-Pi
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:34:46 +0000
X-Inumbo-ID: 768202ba-36b9-11ea-a985-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 768202ba-36b9-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 10:34:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so11613216wrn.7
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 02:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgTu1h2PZligBCCLMOEK7LgHrZlLLaRxsv65kidgKzQ=;
 b=mz/jqwwpfDiAUT/gSt+iCofQYECCu3jRaxhn38C5julVKYpEwPeawBGUVBZK6rgwbN
 jXsijcJUyxD8V58AHPgJnEbVqTI9hOPaYTggaCcJocltHIo9XN8Ov/W/tNcEyJunp0Gt
 F6X8TUNXbDoKkcY38K7k8VbQQ9EgRHPiUniB21OA+rCK9wQMSKHE6w4fgYyVnw783ROp
 xajhfSdjlLXLfJp4LWUyDlUPO6CKCCvhWuoMqAZV5nNQgOJT0bPnYRRrVoeQiCbbgbBH
 k40Xr4zUeFnVziRYCDFOMOOYIuxdBafH/VUxwH0KeHdmw7XVLTTElomUZ0zPbSnX/4EA
 R7wA==
X-Gm-Message-State: APjAAAWK0TE6E0gMShwoJLiMAWhg3iraRDiGytzkL4Qe/qJWoTYrXBu9
 Wl+MpI4nPBAlD4CrBTgcplQ=
X-Google-Smtp-Source: APXvYqxdw9IfYn9x0oQ4QQ6ehJR6eklt0yMzs65jnI9K6BGVk/N0AALAGh7DqQE71oE79nCpoCQ5Fw==
X-Received: by 2002:a05:6000:12:: with SMTP id
 h18mr22977803wrx.87.1578998076896; 
 Tue, 14 Jan 2020 02:34:36 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id i11sm19421622wrs.10.2020.01.14.02.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 02:34:36 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-2-julien@xen.org>
 <f5dcdf24-f71c-164b-e770-594ea01bbe1e@suse.com>
 <15d8bf61-5648-ea6b-2c65-f9ed28c349c0@amazon.com>
 <7124bc05-6f69-10dd-3e42-1650835716a3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ee3cf0d0-a0cd-9fc0-2783-a2b7ce230f9d@xen.org>
Date: Tue, 14 Jan 2020 10:34:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <7124bc05-6f69-10dd-3e42-1650835716a3@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/4] xen/x86: Remove unused forward
 declaration in asm-x86/irq.h
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxMDoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAx
MTowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxNC8wMS8yMDIwIDA5OjMxLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IE9uIDEzLjAxLjIwMjAgMjI6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4+Cj4+Pj4gTm9u
ZSBvZiB0aGUgcHJvdG90eXBlcyB3aXRoaW4gdGhlIGhlYWRlciBhc20teDg2L2lycS5oIGFjdHVh
bGx5IHJlcXVpcmVzCj4+Pj4gdGhlIGZvcndhcmQgZGVjbGFyYXRpb24gb2YgInN0cnVjdCBwaXJx
Ii4gU28gcmVtb3ZlIGl0Lgo+Pj4+Cj4+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVk
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4KPj4+Cj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4K
Pj4+IEl0IGlzIGdlbmVyYWxseSBuaWNlIHRvIGlkZW50aWZ5IGlmIHRoaXMgd2FzIG1pc3NlZCBj
bGVhbnVwICh0aGUKPj4+IG5lZWQgaW5kZWVkIHdlbnQgYXdheSBpbiA0LjEyKSwgb3IgaWYgc3Vj
aCBoYXMgbmV2ZXIgcmVhbGx5IGJlZW4KPj4+IG5lZWRlZC4KPj4KPj4gWWVzIGl0IGlzIG5pY2Ug
dG8gaGF2ZSBidXQgdGhpcyBpcyBhIGJlc3QgZWZmb3J0IGJhc2lzIGZvciBjbGVhbnVwLiBUaGV5
Cj4+IGFyZSBub3QgZml4ZXMgYW5kIHRoZXJlZm9yZSBub3QgZ29pbmcgdG8gYmUgYmFja3BvcnRl
ZC4gU28gSSBkb24ndCBmZWVsCj4+IHRoZSBuZWVkIHRvIGJyb3dzZSBtb3JlIHRoYW4gMTUgeWVh
cnMgd29ydGggb2YgaGlzdG9yeSBhbmQgY2hlY2sgd2hldGhlcgo+PiBhIGNsZWFudXAgd2VyZSBt
aXNzZWQuCj4gCj4gMTUgeWVhcnM/IEl0IHRvb2sgbWUgbGVzcyB0aGFuIGEgbWludXRlIChhIHNp
bmdsZSBncmVwKSB0byBmaWd1cmUKPiB0aGUgdmVyc2lvbiB0aGlzIGJlY2FtZSB1bm5lY2Vzc2Fy
eSBpbi4gQW5kIEkgd291bGRuJ3QgYXNrIGZvcgo+IHN1Y2ggb24gYSBwcmV0dHkgc2ltcGxlIHBh
dGNoIGxpa2UgdGhpcyBvbmUgaWYgSSBhbnRpY2lwYXRlZCBhCj4gbG90IG9mIGVmZm9ydCB0byBi
ZSBuZWVkZWQuCgpNeSBjb21tZW50IGlzIGdlbmVyaWMgdG8gY2xlYW51cC4uLiBBcyBJIHNhaWQs
IHRoaXMgaXMgYSBiZXN0IGVmZm9ydCAKYmFzaXMuIE1heWJlIEkgY291bGQgaGF2ZSBkb25lIGl0
IGhlcmUsIGJ1dCBJIGRpZG4ndCBmZWVsIHRoZSBuZWVkIHRvIGRvIGl0LgoKPiAKPj4gV2hhdCBt
YXR0ZXIgZm9yIGNsZWFudXAgaXMgdGhlIGN1cnJlbnQgY29udGV4dCBhbmQgd2hldGhlciB0aGV5
IG1ha2UKPj4gc2Vuc2Ugbm93Lgo+IAo+IEkgZGlzYWdyZWUuIEhpc3Rvcnkgb2Z0ZW4gaGVscHMg
dW5kZXJzdGFuZCB3aGV0aGVyIHNvbWV0aGluZyB3YXMgZG9uZQo+IGluIGEgY2VydGFpbiB3YXkg
d2l0aG91dCBhbiBvYnZpb3VzIChmcm9tIGN1cnJlbnQgc3RhdGUgb2YgdGhpbmdzKQo+IHJlYXNv
bi4KPiAKPj4gQW55d2F5LCBJIHdvdWxkIGJlIGhhcHB5IHRvIGFkZCBhIHdvcmQgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGlmIHlvdQo+PiBwb2ludCBtZSB0byB0aGUgY29tbWl0IHJlbW92aW5nIHRo
ZSBuZWVkLgo+IAo+IE1lIGhhdmluZyB0b2xkIHlvdSB0aGUgdmVyc2lvbiBpdCBkaXNhcHBlYXJl
ZCBpbiB3b3VsZCBoYXZlIG1hZGUgdGhpcwo+IHZlcnkgbG93IGVmZm9ydCB0byB5b3UuIApUaGF0
J3MgcHJldHR5IG11Y2ggd2l0aGRyYXdpbmcga25vd2xlZGdlIHlvdSBtYXkgaGF2ZS4gSSBkb24n
dCB0aGluayAKdGhpcyBpcyBzdWl0YWJsZSBtaW5kc2V0IGZvciBhIGNvbGxhYm9yYXRpdmUgcHJv
amVjdC4gVGhlIG1vcmUgeW91IGhhdmUgCm1vcmUga25vd2xlZGdlIHRoYW4gbWUgb24gdGhlIHg4
Ni9waXJxIHBhcnQuCgpBbnl3YXksIHRoYW5rIHlvdSBmb3IgdGhpbmtpbmcgSSBwdXQgbGl0dGxl
IGVmZm9ydCBvbiB0aGlzIHBhdGNoLi4uIApUaGF0J3MgYSBwcmV0dHkgZ3JlYXQgd2F5IHRvIGVu
Y291cmFnZSBwZW9wbGUuLi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
