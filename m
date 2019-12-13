Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068511E767
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:03:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnMs-00075P-IP; Fri, 13 Dec 2019 16:00:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifnMr-00075K-DI
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:00:37 +0000
X-Inumbo-ID: b27cd102-1dc1-11ea-8f57-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b27cd102-1dc1-11ea-8f57-12813bfff9fa;
 Fri, 13 Dec 2019 16:00:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F97DADA1;
 Fri, 13 Dec 2019 16:00:34 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20191213155145.31945-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3d58296a-1794-daeb-c9c2-64c9692deb35@suse.com>
Date: Fri, 13 Dec 2019 17:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213155145.31945-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] public/io/netif.h: document a mechanism
 to advertise carrier state
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTY6NTEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMg
YSBzcGVjaWZpY2F0aW9uIGZvciBhICdjYXJyaWVyJyBub2RlIGluIHhlbnN0b3JlIHRvIGFsbG93
Cj4gYSBiYWNrZW5kIHRvIG5vdGlmeSBhIGZyb250ZW5kIG9mIGl0J3MgdmlydHVhbCBjYXJyaWVy
L2xpbmsgc3RhdGUuIEUuZy4KPiBhIGJhY2tlbmQgdGhhdCBpcyB1bmFibGUgdG8gZm9yd2FyZCBw
YWNrZXRzIGZyb20gdGhlIGd1ZXN0IGJlY2F1c2UgaXQgaXMKPiBub3QgYXR0YWNoZWQgdG8gYSBi
cmlkZ2UgbWF5IHdpc2ggdG8gYWR2ZXJ0aXNlICdubyBjYXJyaWVyJy4KPiAKPiBXaGlsZSBpbiB0
aGUgYXJlYSBhbHNvIGZpeCBhbiBlcnJvbmVvdXMgYmFja2VuZCBwYXRoIGRlc2NyaXB0aW9uLgo+
IAo+IE5PVEU6IFRoaXMgaXMgcHVyZWx5IGEgZG9jdW1lbnRhdGlvbiBwYXRjaC4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgo+IC0tLQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiB2
MjoKPiAgIC0gRml4IHRleHQKPiAgIC0gRml4IHBhdGgKPiAtLS0KPiAgIHhlbi9pbmNsdWRlL3B1
YmxpYy9pby9uZXRpZi5oIHwgMTYgKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvcHVibGljL2lvL25ldGlmLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaAo+
IGluZGV4IDI0NTQ0NDhiYWEuLjUyZGQyMDg3Y2QgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2lvL25ldGlmLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaAo+
IEBAIC0xNzEsNyArMTcxLDcgQEAKPiAgICAqIFRoZSBhYmlsaXR5IG9mIHRoZSBiYWNrZW5kIHRv
IHVzZSBhIGNvbnRyb2wgcmluZyBpcyBhZHZlcnRpc2VkIGJ5Cj4gICAgKiBzZXR0aW5nOgo+ICAg
ICoKPiAtICogL2xvY2FsL2RvbWFpbi9YL2JhY2tlbmQvPGRvbWlkPi88dmlmPi9mZWF0dXJlLWN0
cmwtcmluZyA9ICIxIgo+ICsgKiAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC92aWYvPGRvbWlkPi88
dmlmPi9mZWF0dXJlLWN0cmwtcmluZyA9ICIxIgo+ICAgICoKPiAgICAqIFRoZSBmcm9udGVuZCBw
cm92aWRlcyBhIGNvbnRyb2wgcmluZyB0byB0aGUgYmFja2VuZCBieSBzZXR0aW5nOgo+ICAgICoK
PiBAQCAtMTkwLDYgKzE5MCwyMCBAQAo+ICAgICogb3JkZXIgYXMgcmVxdWVzdHMuCj4gICAgKi8K
PiAgIAo+ICsvKgo+ICsgKiBMaW5rIHN0YXRlCj4gKyAqID09PT09PT09PT0KPiArICoKPiArICog
VGhlIGJhY2tlbmQgY2FuIGFkdmVydGlzZSBpdHMgY3VycmVudCBsaW5rIChjYXJyaWVyKSBzdGF0
ZSB0byB0aGUKPiArICogZnJvbnRlbmQgdXNpbmcgdGhlIC9sb2NhbC9kb21haW4vWC9iYWNrZW5k
L3ZpZi88ZG9taWQ+Lzx2aWY+L2NhcnJpZXIKPiArICogbm9kZS4gSWYgdGhpcyBub2RlIGlzIG5v
dCBwcmVzZW50LCB0aGVuIHRoZSBmcm9udGVuZCBzaG91bGQgYXNzdW1lIHRoYXQKPiArICogdGhl
IGxpbmsgaXMgdXAgKGZvciBjb21wYXRpYmlsaXR5IHdpdGggYmFja2VuZHMgdGhhdCBkbyBubyBp
bXBsZW1lbnQKCk9oLCBvbmx5IHNlZWluZyBpdCBub3c6IHMvbm8gaW1wbGVtZW50L25vdCBpbXBs
ZW1lbnQvCgpXaXRoIHRoYXQgZml4ZWQ6CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
