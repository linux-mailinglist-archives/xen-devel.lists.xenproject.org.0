Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99185116A99
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFxv-0006Ly-FT; Mon, 09 Dec 2019 10:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0zrz=Z7=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1ieFxu-0006Ll-2N
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:08:30 +0000
X-Inumbo-ID: d80bdd0e-1a6b-11ea-b6f1-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d80bdd0e-1a6b-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575886107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=kgf8J08dv830lwyKwrxJuLOd2qCaBurqJZMFFAjrIZk=;
 b=gsP7X0bx+RmO/TxLkPBVcZ1kX2xKIFrRMiA8ZtKMEAxByM1oqPmu0ThK70zcfcZnpFaM97
 R2gsAp0QHHsJOs88FYhChE0NDBJ8SPjbYBw8P7+d3D65wI7YZLpLgUMv1FTeoCx7XxorBu
 oc/A5Bp08/EV++ifTP6cpYieODbRTNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-XRGtWUwIN8miFcYIjwTopA-1; Mon, 09 Dec 2019 05:08:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF21107ACC7;
 Mon,  9 Dec 2019 10:08:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A165D6C5;
 Mon,  9 Dec 2019 10:08:15 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8869b47a-8fa9-8d36-bdb8-80b4cad9ae33@redhat.com>
Date: Mon, 9 Dec 2019 11:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-5-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XRGtWUwIN8miFcYIjwTopA-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 4/6] hw/pci-host/i440fx: Use
 definitions instead of magic values
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMC41MCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gVXNl
IGRlZmluaXRpb25zIGZyb20gImh3L3BjaS9wY2lfcmVncy5oIi4KPiBUaGlzIGFsc28gaGVscHMg
d2hlbiB1c2luZyBnaXQtZ3JlcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGh3L3BjaS1ob3N0L2k0NDBmeC5j
IHwgMTQgKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMgYi9o
dy9wY2ktaG9zdC9pNDQwZnguYwo+IGluZGV4IDBjYzgwYjI3NmQuLjQxNDEzODU5NWIgMTAwNjQ0
Cj4gLS0tIGEvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKPiArKysgYi9ody9wY2ktaG9zdC9pNDQwZngu
Ywo+IEBAIC0zNzYsMTMgKzM3NiwxMyBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4gIAo+ICAvKiBIZXJl
IHdlIGp1c3QgZXhwb3NlIG1pbmltYWwgaG9zdCBicmlkZ2Ugb2Zmc2V0IHN1YnNldC4gKi8KPiAg
c3RhdGljIGNvbnN0IElHREhvc3RJbmZvIGlnZF9ob3N0X2JyaWRnZV9pbmZvc1tdID0gewo+IC0g
ICAgezB4MDgsIDJ9LCAgLyogcmV2aXNpb24gaWQgKi8KPiAtICAgIHsweDJjLCAyfSwgIC8qIHN5
YnN5c3RlbSB2ZW5kb3IgaWQgKi8KPiAtICAgIHsweDJlLCAyfSwgIC8qIHN5YnN5c3RlbSBpZCAq
Lwo+IC0gICAgezB4NTAsIDJ9LCAgLyogU05COiBwcm9jZXNzb3IgZ3JhcGhpY3MgY29udHJvbCBy
ZWdpc3RlciAqLwo+IC0gICAgezB4NTIsIDJ9LCAgLyogcHJvY2Vzc29yIGdyYXBoaWNzIGNvbnRy
b2wgcmVnaXN0ZXIgKi8KPiAtICAgIHsweGE0LCA0fSwgIC8qIFNOQjogZ3JhcGhpY3MgYmFzZSBv
ZiBzdG9sZW4gbWVtb3J5ICovCj4gLSAgICB7MHhhOCwgNH0sICAvKiBTTkI6IGJhc2Ugb2YgR1RU
IHN0b2xlbiBtZW1vcnkgKi8KPiArICAgIHtQQ0lfUkVWSVNJT05fSUQsICAgICAgICAgMn0sCj4g
KyAgICB7UENJX1NVQlNZU1RFTV9WRU5ET1JfSUQsIDJ9LAo+ICsgICAge1BDSV9TVUJTWVNURU1f
SUQsICAgICAgICAyfSwKPiArICAgIHsweDUwLCAgICAgICAgICAgICAgICAgICAgMn0sIC8qIFNO
QjogcHJvY2Vzc29yIGdyYXBoaWNzIGNvbnRyb2wgcmVnaXN0ZXIgKi8KPiArICAgIHsweDUyLCAg
ICAgICAgICAgICAgICAgICAgMn0sIC8qIHByb2Nlc3NvciBncmFwaGljcyBjb250cm9sIHJlZ2lz
dGVyICovCj4gKyAgICB7MHhhNCwgICAgICAgICAgICAgICAgICAgIDR9LCAvKiBTTkI6IGdyYXBo
aWNzIGJhc2Ugb2Ygc3RvbGVuIG1lbW9yeSAqLwo+ICsgICAgezB4YTgsICAgICAgICAgICAgICAg
ICAgICA0fSwgLyogU05COiBiYXNlIG9mIEdUVCBzdG9sZW4gbWVtb3J5ICovCj4gIH07Cj4gIAo+
ICBzdGF0aWMgdm9pZCBob3N0X3BjaV9jb25maWdfcmVhZChpbnQgcG9zLCBpbnQgbGVuLCB1aW50
MzJfdCAqdmFsLCBFcnJvciAqKmVycnApCj4gCgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
