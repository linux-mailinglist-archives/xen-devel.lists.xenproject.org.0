Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BE7DD96
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:16:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBoK-000479-Pe; Thu, 01 Aug 2019 14:12:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ofpL=V5=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1htBoJ-000471-KR
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:12:03 +0000
X-Inumbo-ID: 54d9e00b-b466-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54d9e00b-b466-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:12:02 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so69271373eds.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uESVNlIy2FRB00PcaeL8jnmoOxoOuG3wYPteGTmGDqs=;
 b=PkkzbkA/5w01xtVhFBdTz3PnvNnHl42S8D7BMgapZ4ngTP/ZtSaLUG8JecTafNcIe/
 kv4y5vFE5kzGUfMF6u0mNyTpL0F0++cnEyYipNAItSdmw1QINEvo9rXnMsNMMVmOVEV8
 9FTs9rsf7F9pvz7PjPGbYOYlj8SrwWa/D/uXd2JkP8H0r7ev6PKkOFIs08Ol6oznH/yt
 UY/k//Gia8iOlU9NOTa6gqQ2wDDc2NalZvGkNbrKrorR3f6lOHmC+31Fasi588rF0VNu
 DuDw9JK8sR8RvevAhptEC/e81Eez/cYd/wCNtQwjGtMjw/jBThuwicv8zUmwzFvpjzOk
 FG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uESVNlIy2FRB00PcaeL8jnmoOxoOuG3wYPteGTmGDqs=;
 b=p5er86rhdu19GpmJdJGkX5reTG+5w/EcRs6XIgBgkmOqh/I+DK8F89B2yf0+Gpvxss
 AxpHc9PPdder74fZLY51Q8VSTrbm0V8lwg0CUVl5WQSSOkkE7DCWDDUPwAIwg+zMKO6a
 llpFl3pgMDsokg4ioWklMIuNzkyDShFL0mo9S+YjYZtgwRwllW9Il4QQfyWPbb00GeKS
 gVjWWCYvdWr728qFCiBVPmWCP68K841aRSQRcqPrG8eW0lJbVeE5I8eCQ3rsGLKD9xOP
 Rz3QM5s/pgCpujlkUOhsSSyZS2b9+zHSHiOK2pDQlYCqGM5hz/AcFiS8H14P1AXNKz56
 M7wg==
X-Gm-Message-State: APjAAAVCIfFbAT2+Ph9d1KLHEQs7vpqe979UyitIBy3hx7sC4J4nfiP8
 iAuIqr5za2cHypASUp1QYcY=
X-Google-Smtp-Source: APXvYqyDTyYbDlKZEvooF0FBkJ+FTzG/a4au9a5B4hVq6mMgSHmv7QJogow75Kn8/92QGVHlUHGSdA==
X-Received: by 2002:a17:906:3098:: with SMTP id
 24mr101874599ejv.106.1564668720608; 
 Thu, 01 Aug 2019 07:12:00 -0700 (PDT)
Received: from [10.80.118.76] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id j25sm17220878edq.68.2019.08.01.07.11.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:11:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <6b3a71b6-4040-9e42-4f83-daa07f2ae15b@arm.com>
Date: Thu, 1 Aug 2019 15:11:58 +0100
Message-Id: <6AD2FCDA-857C-4611-9797-16CD3BD8B2AF@gmail.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
 <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
 <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
 <269AA3CE-4B2D-4651-B65D-907E64B43473@xenproject.org>
 <6b3a71b6-4040-9e42-4f83-daa07f2ae15b@arm.com>
To: Julien Grall <julien.grall@arm.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEgQXVnIDIwMTksIGF0IDE1OjAyLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPiAKPiBIaSBMYXJzLAo+IAo+IE9uIDAxLzA4LzIwMTkgMTQ6NTksIExh
cnMgS3VydGggd3JvdGU6Cj4+PiBPbiAxIEF1ZyAyMDE5LCBhdCAxMzo0MSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbSA8bWFpbHRvOmp1bGllbi5ncmFsbEBhcm0uY29tPj4gd3Jv
dGU6Cj4+PiAKPj4+IEhpIFZpa3RvciwKPj4+IAo+Pj4gT24gMDEvMDgvMjAxOSAxMzoyNiwgVmlr
dG9yIE1pdGluIHdyb3RlOgo+Pj4+IEhpIEp1bGllbiBhbmQgVm9sb2R5bXlyLAo+Pj4+IE9uIFdl
ZCwgSnVsIDMxLCAyMDE5IGF0IDM6NTIgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbSA8bWFpbHRvOmp1bGllbi5ncmFsbEBhcm0uY29tPj4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBI
aSwKPj4+Pj4gCj4+Pj4+Pj4gSXQgaXMgcmVjb21tZW5kZWQgKGFuZCBwcm9iYWJseSByZXF1aXJl
ZCwgYnV0IEkgY2FuJ3QgZmluZCBleGFjdCBwbGFjZQo+Pj4+Pj4+IGluIHRoZSBydWxlcykgdG8g
aW5jbHVkZSBjb3ZlciBsZXR0ZXIgaWYgeW91IGFyZSBzZW5kaW5nIG1vcmUgdGhhdCBvbmUKPj4+
Pj4+PiBwYXRjaCBpbiBzZXJpZXMuIFRoaXMgd2lsbCBlYXNlIHVwIHJldmlldyBwcm9jZXNzLCBi
ZWNhdXNlIHJldmlld2VyIHdpbGwKPj4+Pj4+PiBrbm93IHdoYXQgdG8gZXhwZWN0IGluIHRoZSBz
ZXJpZXMuCj4+Pj4+PiAgPiBUaGVyZSBpcyBubyBzdWNoIHJlcXVpcmVtZW50LCBvbmx5IHJlY29t
bWVuZGF0aW9uLgo+Pj4+PiAKPj4+Pj4gSXQgaXMgYSBzdHJvbmcgcmVjb21tZW5kYXRpb246ICJJ
ZiB5b3UgbmVlZCB0byBzZW5kIG1vcmUgdGhhbiBvbmUgcGF0Y2hlcyAod2hpY2gKPj4+Pj4gbm9y
bWFsbHkgbWVhbnMgeW91J3JlIHNlbmRpbmcgYSBwYXRjaCBzZXJpZXMgd2l0aCBjb3ZlciBsZXR0
ZXIpLCIuCj4+Pj4+IAo+Pj4+Pj4gSSBkaWQgbm90IHB1dCBpdCBzaW5jZSB0aGlzIGlzIHNpbXBs
ZSBzaG9ydCBwYXRjaCBzZXJpZXMgYW5kIGJvdGgKPj4+Pj4+IHBhdGNoZXMgaW4gdGhpcyBzZXJp
ZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBwcmV2aW91c2x5LCBzbyBpdCBpcyBrbm93bgo+Pj4+Pj4g
d2hhdCBpdCBpcyBhYm91dC4KPj4+Pj4gCj4+Pj4+IEZvciBhIGZpcnN0LCBpZiB5b3UgZG9uJ3Qg
aGF2ZSBhIGNvdmVyIGxldHRlciB0aGVuIHRoZSB0aHJlYWRpbmcgaW4gZS1tYWlsCj4+Pj4+IGNs
aWVudCB3b3VsZCBsb29rIHdlaXJkOgo+Pj4+PiAgICAgW1BBVENIIHY0IDEvMl0geGVuL2FybTog
ZXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzCj4+Pj4+ICAgICAgICB8LT4gW1BBVENIIHY0
IDIvMl0geGVuL2FybTogbWVyZ2UgbWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVf
bm9kZQo+Pj4+PiAKPj4+Pj4gSSB0ZW5kIHRvIGhpZCBhbnl0aGluZyB3aXRoaW4gdGhlIHRocmVh
ZCBzbyBJIGhhdmUgb25seSBvbmUgdGl0bGUuIEZvciB0aGUgdGl0bGUKPj4+Pj4gaXQgaXMgbm90
IGNsZWFyIHRvIG1lIHdoYXQncyB0aGUgcHVycG9zZSBvZiB0aGUgZS1tYWlsLgo+Pj4+PiAKPj4+
Pj4gVGhlIGNvdmVyIGxldHRlciBpcyBhbHNvIHVzZWQgdG8ga2VlcCBhIHN1bW1hcnkgb2Ygd2hh
dCB3YXMgZGlzY3Vzc2VkIGFuZCB0aGUKPj4+Pj4gb3ZlcmFsbCBnb2FsLiBJdCBkb2VzIG5vdCBt
YXR0ZXIgaWYgaXQgaXMganVzdCBhIGZldyBsaW5lcy4gVGhpcyBpcyBhbHNvIGEgZ29vZAo+Pj4+
PiBwbGFjZSB0byBoYXZlIGEgZGlzY3Vzc2lvbiBvZiB0aGUgb3ZlcmFsbCBzZXJpZXMgKGkuZSBu
b3Qgc3BlY2lmaWMgdG8gYSBwYXRjaCkuCj4+Pj4+IAo+Pj4+PiBMYXN0bHksIHlvdSBtYXkgaGF2
ZSBuZXcgcmV2aWV3ZXJzIHRoYXQgaGF2ZW4ndCBmb2xsb3dlZCB0aGUgcHJldmlvdXMKPj4+Pj4g
ZGlzY3Vzc2lvbi4gWW91IGhhdmUgYWxzbyByZXZpZXdlcnMgbGlrZSBtZSB3aGljaCByZWNlaXZl
IGEgZmV3IGh1bmRyZWRzIGUtbWFpbHMKPj4+Pj4gcGVyIHdlZWsgKGp1c3QgY291bnRpbmcgbXkg
aW5ib3ggc28gZS1tYWlsIEkgYW0gQ0NlZCB0bykuIFdoaWxlIEkgaGF2ZSBhIGdvb2QKPj4+Pj4g
bWVtb3J5LCBJIGNhbid0IHBvc3NpYmx5IHJlbWVtYmVyIGV2ZXJ5dGhpbmcgc2luZ2xlIGUtbWFp
bHMuCj4+Pj4+IAo+Pj4+PiBTbyB0aGUgY292ZXIgbGV0dGVyIGlzIGEgZ29vZCBwbGFjZSB0byBl
eHBsYWluIHdoYXQgY2hhbmdlcyBoYXZlIGJlZW4gZG9uZQo+Pj4+PiBiZXR3ZWVuIHNlcmllcy4g
WW91IGNhbiBhbHNvIGRvIHRoYXQgcGVyLXBhdGNoLgo+Pj4+PiAKPj4+Pj4gU3BlYWtpbmcgYWJv
dXQgY2hhbmdlbG9nLCBJIHdvdWxkIGhpZ2hseSByZWNvbW1lbmQgdG8ga2VlcCBhbGwgdGhlIGNo
YW5nZWxvZwo+Pj4+PiBmcm9tIHYxLiBUaGlzIGdpdmVzIHVzIGFuIGlkZWEgd2hhdCBoYXBwZW4g
b3ZlciB0aGUgcmV2aWV3Lgo+Pj4+IFRoYW5rIHlvdSBmb3IgdGhpcyBncmVhdCBhbmQgZGV0YWls
ZWQgYXJndW1lbnRhdGlvbiBwcm92aWRlZC4gSXQgbWFrZXMKPj4+PiBzZW5zZSwgc28gcHJvYmFi
bHkgWGVuIHBhdGNoZXMgd2lraSBzaG91bGQgYmUgdXBkYXRlZCB3aXRoIHRoaXMKPj4+PiBpbmZv
cm1hdGlvbiBhbmQgY292ZXIgbGV0dGVyIHNob3VsZCBiZWNvbWUgbm90IGEgcmVjb21tZW5kYXRp
b24sIGJ1dCBhCj4+Pj4gcnVsZS4KPj4+IAo+Pj4gVXBkYXRlIHRvIHRoZSB3aWtpIGFyZSBhbHdh
eXMgd2VsY29tZWQuCj4+IEkgc3RpbGwgaGF2ZSBhbiBhY3Rpb24gdG8gcmV3b3JrIGh0dHBzOi8v
d2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyBh
bmQgPGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2pl
Y3RfUGF0Y2hlc2FuZD4gbWlncmF0ZSB0aGUgY29udGVudCB0byB0aGUgc3BoaW54IGRvY3MKPj4g
QFZpY3RvcjogY2FuIHlvdSBxdWlja2x5IHBvaW50IG91dCB3aGVyZSB3ZSByZWNvbW1lbmQgdG8g
dXNlIGNvdmVyIGxldHRlcnMgKGlmIHlvdSByZW1lbWJlcikuIEkgdGhvdWdodCBpdCB3YXMgYSBy
ZXF1aXJlbWVudAo+IAo+IEl0IGlzIG5vdCBleHBsaWNpdGx5IHdyaXR0ZW4gaW4gdGhlIHdpa2kg
cGFnZS4gQnV0IGl0IGlzIGltcGxpZWQgaW4gYSBmZXcgcGxhY2VzIHN1Y2ggYXMgaW4gdGhlIHNl
Y3Rpb24gIlByb3ZpZGluZyBhIGdpdCBicmFuY2giLCAiVXNpbmcgZ2l0IHNlbmQtZW1haWwgYWxv
bmUiLgoKWW91IGFyZSByaWdodC4gVGhhdCBzaG91bGQgYmUgbWFkZSBleHBsaWNpdC4gSSB0aGlu
ayB5b3UgYXJlIHRoZSBvbmx5IHBlcnNvbiBpbiB5ZWFycyB0aGF0IHNlbnQgYSBzZXJpZXMgd2l0
aG91dCBjb3ZlciBsZXR0ZXIKCkkgd2lsbCBoYXZlIGEgZ28gb3ZlciB0aGF0IHBhZ2UgaW4gdGhl
IG5leHQgZmV3IGRheXMgcmVkdWNpbmcgdGhlIG9wdGlvbnMgYW5kIG1ha2luZyBpdCBtb3JlIHN0
cmljdCBhbmQgY2xlYXIKCkl0IHdvdWxkIGJlIGdvb2QgaWYgeW91IGNvdWxkIGdvIG92ZXIgaXQs
IG9uY2UgSSBhbSBkb25lLCBhbmQgbGV0IG1lIGtub3cgd2hldGhlciBpdCBpcyBjbGVhcmVyCgpM
YXJzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
