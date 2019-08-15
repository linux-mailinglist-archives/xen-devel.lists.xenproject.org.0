Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F76F8E7AE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:02:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyBbZ-000158-7M; Thu, 15 Aug 2019 08:59:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pfC1=WL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hyBbX-000153-9V
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 08:59:31 +0000
X-Inumbo-ID: fe33de0a-bf3a-11e9-8b99-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe33de0a-bf3a-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 08:59:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F49D30833A8;
 Thu, 15 Aug 2019 08:59:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-57.ams2.redhat.com
 [10.36.117.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 019441E0;
 Thu, 15 Aug 2019 08:59:28 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190813113119.14804-1-anthony.perard@citrix.com>
 <20190813113119.14804-23-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4c015736-1fa1-36a2-e865-6c2f9913f8a6@redhat.com>
Date: Thu, 15 Aug 2019 10:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190813113119.14804-23-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 08:59:30 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v5 22/35]
 OvmfPkg/XenPlatformPei: no hvmloader: get the E820 table via hypercall
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTMvMTkgMTM6MzEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gdGhlIFhlbiBQ
VkggZW50cnkgcG9pbnQgaGFzIGJlZW4gdXNlZCwgaHZtbG9hZGVyIGhhc24ndCBydW4gYW5kCj4g
aGFzbid0IHByZXBhcmVkIGFuIEU4MjAgdGFibGUuIFRoZSBvbmx5IHdheSBsZWZ0IHRvIGdldCBh
biBFODIwIHRhYmxlCj4gaXMgdG8gYXNrIFhlbiB2aWEgYW4gaHlwZXJjYWxsLiAgV2Uga2VlcCB0
aGUgcmVzdWx0IGNhY2hlZCB0byBhdm9pZAo+IG1ha2luZyBhIHNlY29uZCBoeXBlcmNhbGwgd2hp
Y2ggd291bGQgZ2l2ZSB0aGUgc2FtZSByZXN1bHQuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjU6Cj4g
ICAgIC0gZml4IGNvbW1pdCBtZXNzYWdlLCB0aGUgaHlwZXJjYWxsICpjYW4qIGJlIG1hZGUgc2V2
ZXJhbCB0aW1lLCBidXQgd2UKPiAgICAgICBzdGlsbCBjYWNoZSB0aGUgcmVzdWx0LgoKQWRkcmVz
c2VzIFJvZ2VyJ3MgZmVlZGJhY2sgaW46CgpodHRwOi8vbWlkLm1haWwtYXJjaGl2ZS5jb20vMjAx
OTA4MDgxMDQ1NTgudm02ZGZpYzVkbnRqc250NEBBaXItZGUtUm9nZXIKaHR0cHM6Ly9lZGsyLmdy
b3Vwcy5pby9nL2RldmVsL21lc3NhZ2UvNDUxNjAKCk15IEFDSyBzdGFuZHMuCgpUaGFua3MKTGFz
emxvCgoKPiAgICAgdjM6Cj4gICAgIC0gZml4IGNvbW1pdCBtZXNzYWdlCj4gICAgIC0gYWRkICdt
JyBwcmVmaXggdG8gdGhlIGdsb2JhbCB2YXJpYWJsZXMKPiAgICAgICBhbmQgbWFrZSB0aGVtIHN0
YXRpYwo+IAo+ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgNDYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXggZjI2ZjBlNTZk
ZC4uNzJmNmYzN2I0NiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5j
Cj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0yNyw2ICsyNyw3IEBA
Cj4gICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIuaD4KPiAgI2luY2x1ZGUgPEluZHVzdHJ5U3Rh
bmRhcmQvWGVuL2FyY2gteDg2L2h2bS9zdGFydF9pbmZvLmg+Cj4gICNpbmNsdWRlIDxMaWJyYXJ5
L1hlbkh5cGVyY2FsbExpYi5oPgo+ICsjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9YZW4vbWVt
b3J5Lmg+Cj4gIAo+ICAjaW5jbHVkZSAiUGxhdGZvcm0uaCIKPiAgI2luY2x1ZGUgIlhlbi5oIgo+
IEBAIC00MCw2ICs0MSw4IEBAIEVGSV9YRU5fSU5GTyBtWGVuSW5mbzsKPiAgLy8gT25seSB0aGUg
RTgyMCB0YWJsZSBpcyB1c2VkIGJ5IE9WTUYuCj4gIC8vCj4gIEVGSV9YRU5fT1ZNRl9JTkZPICpt
WGVuSHZtbG9hZGVySW5mbzsKPiArU1RBVElDIEVGSV9FODIwX0VOVFJZNjQgbUU4MjBFbnRyaWVz
WzEyOF07Cj4gK1NUQVRJQyBVSU5UMzIgbUU4MjBFbnRyaWVzQ291bnQ7Cj4gIAo+ICAvKioKPiAg
ICBSZXR1cm5zIEU4MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbgo+IEBAIC01NSw2ICs1OCwxMiBAQCBY
ZW5HZXRFODIwTWFwICgKPiAgICBVSU5UMzIgKkNvdW50Cj4gICAgKQo+ICB7Cj4gKyAgSU5UTiBS
ZXR1cm5Db2RlOwo+ICsgIHhlbl9tZW1vcnlfbWFwX3QgUGFyYW1ldGVyczsKPiArICBVSU5UTiBM
b29wSW5kZXg7Cj4gKyAgVUlOVE4gSW5kZXg7Cj4gKyAgRUZJX0U4MjBfRU5UUlk2NCBUbXBFbnRy
eTsKPiArCj4gICAgLy8KPiAgICAvLyBHZXQgRTgyMCBwcm9kdWNlZCBieSBodm1sb2FkZXIKPiAg
ICAvLwo+IEBAIC02Niw3ICs3NSw0MiBAQCBYZW5HZXRFODIwTWFwICgKPiAgICAgIHJldHVybiBF
RklfU1VDQ0VTUzsKPiAgICB9Cj4gIAo+IC0gIHJldHVybiBFRklfTk9UX0ZPVU5EOwo+ICsgIC8v
Cj4gKyAgLy8gT3RoZXJ3aXNlLCBnZXQgdGhlIEU4MjAgdGFibGUgZnJvbSB0aGUgWGVuIGh5cGVy
dmlzb3IKPiArICAvLwo+ICsKPiArICBpZiAobUU4MjBFbnRyaWVzQ291bnQgPiAwKSB7Cj4gKyAg
ICAqRW50cmllcyA9IG1FODIwRW50cmllczsKPiArICAgICpDb3VudCA9IG1FODIwRW50cmllc0Nv
dW50Owo+ICsgICAgcmV0dXJuIEVGSV9TVUNDRVNTOwo+ICsgIH0KPiArCj4gKyAgUGFyYW1ldGVy
cy5ucl9lbnRyaWVzID0gMTI4Owo+ICsgIHNldF94ZW5fZ3Vlc3RfaGFuZGxlIChQYXJhbWV0ZXJz
LmJ1ZmZlciwgbUU4MjBFbnRyaWVzKTsKPiArCj4gKyAgLy8gUmV0dXJucyBhIGVycm5vCj4gKyAg
UmV0dXJuQ29kZSA9IFhlbkh5cGVyY2FsbE1lbW9yeU9wIChYRU5NRU1fbWVtb3J5X21hcCwgJlBh
cmFtZXRlcnMpOwo+ICsgIEFTU0VSVCAoUmV0dXJuQ29kZSA9PSAwKTsKPiArCj4gKyAgbUU4MjBF
bnRyaWVzQ291bnQgPSBQYXJhbWV0ZXJzLm5yX2VudHJpZXM7Cj4gKwo+ICsgIC8vCj4gKyAgLy8g
U29ydCBFODIwIGVudHJpZXMKPiArICAvLwo+ICsgIGZvciAoTG9vcEluZGV4ID0gMTsgTG9vcElu
ZGV4IDwgbUU4MjBFbnRyaWVzQ291bnQ7IExvb3BJbmRleCsrKSB7Cj4gKyAgICBmb3IgKEluZGV4
ID0gTG9vcEluZGV4OyBJbmRleCA8IG1FODIwRW50cmllc0NvdW50OyBJbmRleCsrKSB7Cj4gKyAg
ICAgIGlmIChtRTgyMEVudHJpZXNbSW5kZXggLSAxXS5CYXNlQWRkciA+IG1FODIwRW50cmllc1tJ
bmRleF0uQmFzZUFkZHIpIHsKPiArICAgICAgICBUbXBFbnRyeSA9IG1FODIwRW50cmllc1tJbmRl
eF07Cj4gKyAgICAgICAgbUU4MjBFbnRyaWVzW0luZGV4XSA9IG1FODIwRW50cmllc1tJbmRleCAt
IDFdOwo+ICsgICAgICAgIG1FODIwRW50cmllc1tJbmRleCAtIDFdID0gVG1wRW50cnk7Cj4gKyAg
ICAgIH0KPiArICAgIH0KPiArICB9Cj4gKwo+ICsgICpDb3VudCA9IG1FODIwRW50cmllc0NvdW50
Owo+ICsgICpFbnRyaWVzID0gbUU4MjBFbnRyaWVzOwo+ICsKPiArICByZXR1cm4gRUZJX1NVQ0NF
U1M7Cj4gIH0KPiAgCj4gIC8qKgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
