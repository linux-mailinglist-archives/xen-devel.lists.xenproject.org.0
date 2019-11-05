Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CDBF0240
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 17:06:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS1JM-0003GT-3l; Tue, 05 Nov 2019 16:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=15Fz=Y5=redhat.com=dgilbert@srs-us1.protection.inumbo.net>)
 id 1iS1JK-0003GN-8Q
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 16:04:02 +0000
X-Inumbo-ID: e0d2d0aa-ffe5-11e9-adbe-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e0d2d0aa-ffe5-11e9-adbe-bc764e2007e4;
 Tue, 05 Nov 2019 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572969839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWp6xfaIi0yb+gtxo42P3PwJt+pK/MMljHSmgaWqopw=;
 b=QmTyLnB8jQkLHrIDB4jUCTP9fcv+5eaEAF4a/78fth22FG+VWnRFi5Gj7XdUeBG9Y0XX3C
 oBPan1OWRO24syVaB8CpzmQj/1cqrXP+nYbrXuZCJvsEfFOHeWqYA3FYHjRc/vwuVB2tA8
 4xCA/mBaS+IFzPAJM/inOgfOlyGLEzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-4ALnvi9VMDqKTec0Qn6HQg-1; Tue, 05 Nov 2019 11:03:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5073477;
 Tue,  5 Nov 2019 16:03:54 +0000 (UTC)
Received: from work-vm (ovpn-117-86.ams2.redhat.com [10.36.117.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3D635D6A3;
 Tue,  5 Nov 2019 16:03:47 +0000 (UTC)
Date: Tue, 5 Nov 2019 16:03:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20191105160345.GB2781@work-vm>
References: <157296887817.27285.13935693519835086344@37313f22b938>
 <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 4ALnvi9VMDqKTec0Qn6HQg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PULL 0/4] Trivial branch patches
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, berrange@redhat.com,
 ehabkost@redhat.com, paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 Greg Kurz <groug@kaod.org>, marcandre.lureau@redhat.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, crosa@redhat.com, anthony.perard@citrix.com, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBMYXVyZW50IFZpdmllciAobGF1cmVudEB2aXZpZXIuZXUpIHdyb3RlOgo+IEdyZWcsIERhdmUs
Cj4gCj4gY291bGQgeW91IGZpeCB0aGF0Pwo+IAo+IFRoYW5rcywKPiBMYXVyZW50Cj4gCj4gTGUg
MDUvMTEvMjAxOSDDoCAxNjo0OCwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgYSDDqWNyaXTCoDoKPiA+
IFBhdGNoZXcgVVJMOiBodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAxOTExMDUxNDQyNDcuMTAz
MDEtMS1sYXVyZW50QHZpdmllci5ldS8KPiA+IAo+ID4gCj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBU
aGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUg
b3V0cHV0IGJlbG93IGZvcgo+ID4gbW9yZSBpbmZvcm1hdGlvbjoKPiA+IAo+ID4gU3ViamVjdDog
W1BVTEwgMC80XSBUcml2aWFsIGJyYW5jaCBwYXRjaGVzCj4gPiBUeXBlOiBzZXJpZXMKPiA+IE1l
c3NhZ2UtaWQ6IDIwMTkxMTA1MTQ0MjQ3LjEwMzAxLTEtbGF1cmVudEB2aXZpZXIuZXUKPiA+IAo+
ID4gPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQo+ID4gIyEvYmluL2Jhc2gKPiA+IGdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKPiA+IGdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKPiA+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQo+ID4gZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQo+ID4gLi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPiA+ID09PSBURVNUIFNDUklQ
VCBFTkQgPT09Cj4gPiAKPiA+IFN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKPiA+IDg1
YWM0NTMgZ2xvYmFsOiBTcXVhc2ggJ3RoZSB0aGUnCj4gPiA5ZGQ3ZGE0IHFvbTogRml4IGVycm9y
IG1lc3NhZ2UgaW4gb2JqZWN0X2NsYXNzX3Byb3BlcnR5X2FkZCgpCj4gPiAyYjc2YjQ1IGh3L21p
c2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nlc3Nlcwo+ID4gYmRkY2ZkOSBody9t
aXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcgdG8gUG5QIHJl
Z2lzdGVycwo+ID4gCj4gPiA9PT0gT1VUUFVUIEJFR0lOID09PQo+ID4gMS80IENoZWNraW5nIGNv
bW1pdCBiZGRjZmQ5YjZiMjQgKGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNo
IHdoZW4gd3JpdGluZyB0byBQblAgcmVnaXN0ZXJzKQo+ID4gMi80IENoZWNraW5nIGNvbW1pdCAy
Yjc2YjQ1MWY5YjcgKGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nlc3Nl
cykKPiA+IDMvNCBDaGVja2luZyBjb21taXQgOWRkN2RhNDIxYmZiIChxb206IEZpeCBlcnJvciBt
ZXNzYWdlIGluIG9iamVjdF9jbGFzc19wcm9wZXJ0eV9hZGQoKSkKPiA+IFdBUk5JTkc6IGxpbmUg
b3ZlciA4MCBjaGFyYWN0ZXJzCj4gPiAjMzE6IEZJTEU6IHFvbS9vYmplY3QuYzoxMTA5Ogo+ID4g
KyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiYXR0ZW1wdCB0byBhZGQgZHVwbGljYXRlIHByb3Bl
cnR5ICclcycgdG8gb2JqZWN0ICh0eXBlICclcycpIiwKPiA+IAo+ID4gV0FSTklORzogbGluZSBv
dmVyIDgwIGNoYXJhY3RlcnMKPiA+ICM0MzogRklMRTogcW9tL29iamVjdC5jOjExNDE6Cj4gPiAr
ICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJhdHRlbXB0IHRvIGFkZCBkdXBsaWNhdGUgcHJvcGVy
dHkgJyVzJyB0byBjbGFzcyAodHlwZSAnJXMnKSIsCj4gPiAKPiA+IHRvdGFsOiAwIGVycm9ycywg
MiB3YXJuaW5ncywgMjIgbGluZXMgY2hlY2tlZAo+ID4gCj4gPiBQYXRjaCAzLzQgaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwo+ID4gYXJl
IGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCj4gPiBD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo+ID4gNC80IENoZWNraW5nIGNvbW1pdCA4NWFjNDUz
ZDE1MjAgKGdsb2JhbDogU3F1YXNoICd0aGUgdGhlJykKPiA+IEVSUk9SOiBkbyBub3QgdXNlIEM5
OSAvLyBjb21tZW50cwo+ID4gIzI2OiBGSUxFOiBkaXNhcy9saWJ2aXhsL3ZpeGwvaW52YWxzZXQu
aDoxMDU6Cj4gPiArICAvLyBOb3RlIHRoYXQgdGhpcyBkb2VzIG5vdCBtZWFuIHRoZSBiYWNraW5n
IHN0b3JhZ2UgaXMgZW1wdHk6IGl0IGNhbiBzdGlsbAoKVGhhdCBvbmUgaXMgYSBmYWxzZSBwb3Np
dGl2ZTsgbGlidml4bCBpcyB3cml0dGVuIGluIEMrKyAhCgpEYXZlCgo+ID4gdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCA1NiBsaW5lcyBjaGVja2VkCj4gPiAKPiA+IFBhdGNoIDQvNCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCj4g
PiBhcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
PiA+IENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj4gPiAKPiA+ID09PSBPVVRQVVQgRU5EID09
PQo+ID4gCj4gPiBUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQo+ID4gCj4gPiAKPiA+
IFRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKPiA+IGh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMTkxMTA1MTQ0MjQ3LjEwMzAxLTEtbGF1cmVudEB2aXZpZXIuZXUvdGVzdGluZy5jaGVja3Bh
dGNoLz90eXBlPW1lc3NhZ2UuCj4gPiAtLS0KPiA+IEVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KPiA+IFBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29tCj4gPiAKPiAKLS0KRHIuIERh
dmlkIEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5jaGVzdGVyLCBVSwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
