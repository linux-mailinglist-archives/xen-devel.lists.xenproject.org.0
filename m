Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48F54EF0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:33:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfkbP-0000TX-HP; Tue, 25 Jun 2019 12:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SbZn=UY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hfkbN-0000TQ-SO
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:31:09 +0000
X-Inumbo-ID: 1abe7670-9745-11e9-a8ae-6fc8858db021
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1abe7670-9745-11e9-a8ae-6fc8858db021;
 Tue, 25 Jun 2019 12:31:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41B9DAF86;
 Tue, 25 Jun 2019 12:31:06 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561377779-28036-6-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <99a28880-c2bf-e328-ee52-afc782af3b74@suse.com>
Date: Tue, 25 Jun 2019 14:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561377779-28036-6-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/7] x86/xen: nopv parameter support for
 HVM guest
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
Cc: sstabellini@kernel.org, peterz@infradead.org, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDYuMTkgMTQ6MDIsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IFBWSCBndWVzdCBuZWVk
cyBQViBleHRlbnRpb25zIHRvIHdvcmssIHNvIG5vcHYgcGFyYW1ldGVyIGlzIGlnbm9yZWQKPiBm
b3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KPiAKPiBJbiBvcmRlciBmb3Igbm9wdiBwYXJh
bWV0ZXIgdG8gdGFrZSBlZmZlY3QgZm9yIEhWTSBndWVzdCwgd2UgbmVlZCB0bwo+IGRpc3Rpbmd1
aXNoIGJldHdlZW4gUFZIIGFuZCBIVk0gZ3Vlc3QgZWFybHkgaW4gaHlwZXJ2aXNvciBkZXRlY3Rp
b24KPiBjb2RlLiBCeSBtb3ZpbmcgdGhlIGRldGVjdGlvbiBvZiBQVkggaW4geGVuX3BsYXRmb3Jt
X2h2bSgpLAo+IHhlbl9wdmhfZG9tYWluKCkgY291bGQgYmUgdXNlZCBmb3IgdGhhdCBwdXJwb3Nl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFj
bGUuY29tPgo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
Pgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+
IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gLS0tCj4gICBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwg
MTggKysrKysrKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKPiBpbmRleCA3ZmNiNGVhLi4y
NjkzOWU3IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKPiArKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgICNp
bmNsdWRlICJtbXUuaCIKPiAgICNpbmNsdWRlICJzbXAuaCIKPiAgIAo+ICtleHRlcm4gYm9vbCBu
b3B2Owo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgc2hhcmVkX2luZm9fcGZuOwo+ICAgCj4gICB2
b2lkIHhlbl9odm1faW5pdF9zaGFyZWRfaW5mbyh2b2lkKQo+IEBAIC0yMjYsMjAgKzIyNywyNCBA
QCBzdGF0aWMgdWludDMyX3QgX19pbml0IHhlbl9wbGF0Zm9ybV9odm0odm9pZCkKPiAgIAlpZiAo
eGVuX3B2X2RvbWFpbigpKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+ICsjaWZkZWYgQ09ORklHX1hF
Tl9QVkgKPiArCS8qIFRlc3QgZm9yIFBWSCBkb21haW4gKFBWSCBib290IHBhdGggdGFrZW4gb3Zl
cnJpZGVzIEFDUEkgZmxhZ3MpLiAqLwo+ICsJaWYgKCF4ODZfcGxhdGZvcm0ubGVnYWN5LnJ0YyAm
JiB4ODZfcGxhdGZvcm0ubGVnYWN5Lm5vX3ZnYSkKPiArCQl4ZW5fcHZoID0gdHJ1ZTsKClNvcnJ5
LCB0aGlzIHdvbid0IHdvcmssIGFzIEFDUEkgdGFibGVzIGFyZSBzY2FubmVkIG9ubHkgc29tZSB0
aW1lIGxhdGVyLgoKWW91IGNhbiB0ZXN0IGZvciB4ZW5fcHZoIGJlaW5nIHRydWUgaGVyZSAoZm9y
IHRoZSBjYXNlIHdoZXJlIHRoZSBndWVzdApoYXMgYmVlbiBib290ZWQgdmlhIHRoZSBYZW4tUFZI
IGJvb3QgZW50cnkpIGFuZCBoYW5kbGUgdGhhdCBjYXNlLCBidXQKdGhlIGNhc2Ugb2YgYSBQVkgg
Z3Vlc3Qgc3RhcnRlZCB2aWEgdGhlIG5vcm1hbCBib290IGVudHJ5IChsaWtlIHZpYQpncnViMikg
YW5kIG5vcHYgc3BlY2lmaWVkIGlzIGRpZmZpY3VsdC4gVGhlIG9ubHkgaWRlYSBJIGhhdmUgcmln
aHQgbm93CndvdWxkIGJlIHRvIHVzZSBhbm90aGVyIHN0cnVjdCBoeXBlcnZpc29yX3g4NiBmb3Ig
dGhhdCBjYXNlIHdoaWNoIHdpbGwKb25seSBiZSB1c2VkIGZvciBYZW4gSFZNL1BWSCBfYW5kXyBu
b3B2IHNwZWNpZmllZC4gSXQgc2hvdWxkIGJlIGEgY29weQpvZiB0aGUgYmFyZSBtZXRhbCB2YXJp
YW50LCBidXQgYSBzcGVjaWFsIGd1ZXN0X2xhdGVfaW5pdCBtZW1iZXIgaXNzdWluZwphIGJpZyBm
YXQgd2FybmluZyBpbiBjYXNlIFBWSCBpcyBiZWluZyBkZXRlY3RlZC4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
