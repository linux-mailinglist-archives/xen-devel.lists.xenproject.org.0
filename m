Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFDB3DE7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:46:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9tAH-0001Vq-1B; Mon, 16 Sep 2019 15:43:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9tAF-0001Vc-IM
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:43:43 +0000
X-Inumbo-ID: c2df4ff2-d898-11e9-95ef-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2df4ff2-d898-11e9-95ef-12813bfff9fa;
 Mon, 16 Sep 2019 15:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8C6FA86E86F;
 Mon, 16 Sep 2019 15:43:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F85160BE1;
 Mon, 16 Sep 2019 15:43:41 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-6-anthony.perard@citrix.com>
 <59a12b9c-17ce-2e4c-96a9-f741858b2ba6@redhat.com>
Message-ID: <8f1860bf-c9e9-8281-402c-c65d7dcd0e76@redhat.com>
Date: Mon, 16 Sep 2019 17:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <59a12b9c-17ce-2e4c-96a9-f741858b2ba6@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 16 Sep 2019 15:43:42 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 05/11] OvmfPkg/XenBusDxe:
 Construct paths without allocation
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTYvMTkgMTc6MzksIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwOS8xMy8xOSAxNjo1
MCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFdoZW4gZG9pbmcgYW4gYWN0aW9uIHdpdGggYSBw
YXRoIGFuZCBzdWJwYXRoIGluIHRoZSB4ZW5zdG9yZSwKPj4gWGVuU3RvcmVKb2luIGlzIGNhbGxl
ZCB0byBnZW5lcmF0ZSAiJHBhdGgvJHN1YnBhdGgiLiBCdXQgdGhpcyBmdW5jdGlvbgo+PiBkbyBh
biBhbGxvY2F0aW9uIG9mIG1lbW9yeSB3aGljaCBpc24ndCBuZWNlc3NhcnkuIEluc3RlYWQgd2Ug
d2lsbAo+PiBjb25zdHJ1Y3QgdGhlIHBhdGggd2l0aCBXUklURV9SRVFVRVNUIGFuZCBkYXRhIHVz
ZWQgdG8gZ2VuZXJhdGUgdGhlCj4+IHBhdGggd2lsbCBiZSBjb3BpZWQgZGlyZWN0bHkgdG8gdGhl
IHhlbnN0b3JlIHNoYXJlZCByaW5nLgo+Pgo+PiBBbHNvIGNoYW5nZSBXUklURV9SRVFVRVNULkxl
biB0eXBlLCBpdCBvbmx5IGNvbnRhaW4gc2l6ZXMgYW5kIGRvZXNuJ3QKPj4gbmVlZCB0byBiZSBl
eGFjdGx5IDMyYml0cy4KPj4KPj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcv
c2hvd19idWcuY2dpP2lkPTIxOTAKPj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiAgT3ZtZlBrZy9YZW5CdXNEeGUvWGVu
U3RvcmUuYyB8IDc4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyBiL092bWZQa2cvWGVuQnVzRHhl
L1hlblN0b3JlLmMKPj4gaW5kZXggN2I3MWRjMTU2ZC4uY2E3YmUxMmQ2OCAxMDA2NDQKPj4gLS0t
IGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwo+PiArKysgYi9Pdm1mUGtnL1hlbkJ1c0R4
ZS9YZW5TdG9yZS5jCj4+IEBAIC01Myw3ICs1Myw3IEBACj4+ICAKPj4gIHR5cGVkZWYgc3RydWN0
IHsKPj4gICAgQ09OU1QgVk9JRCAgKkRhdGE7Cj4+IC0gIFVJTlQzMiAgICAgIExlbjsKPj4gKyAg
VUlOVE4gICAgICAgTGVuOwo+PiAgfSBXUklURV9SRVFVRVNUOwo+PiAgCj4+ICAvKiBSZWdpc3Rl
ciBjYWxsYmFjayB0byB3YXRjaCBzdWJ0cmVlIChub2RlKSBpbiB0aGUgWGVuU3RvcmUuICovCj4+
IEBAIC0yNjAsNiArMjYwLDM1IEBAIFhlblN0b3JlRmluZFdhdGNoICgKPj4gICAgcmV0dXJuIE5V
TEw7Cj4+ICB9Cj4+ICAKPj4gKy8qKgo+PiArICBGaWxsIHRoZSBmaXJzdCB0aHJlZSBzbG90cyBv
ZiBhIFdSSVRFX1JFUVVFU1QgYXJyYXkuCj4+ICsKPj4gKyAgV2hlbiB0aG9zZSB0aHJlZSBzbG90
cyBhcmUgY29uY2F0ZW5hdGVkIHRvIGdlbmVyYXRlIGEgc3RyaW5nLCB0aGUgcmVzdWx0aW5nCj4+
ICsgIHN0cmluZyB3aWxsIGJlICIkUGF0aFwwIiBvciAiJFBhdGgvJFN1YlBhdGhcMCIgaWYgU3Vi
UGF0aCBpcyBwcm92aWRlZC4KPj4gKyoqLwo+PiArU1RBVElDCj4+ICtWT0lECj4+ICtYZW5TdG9y
ZVByZXBhcmVXcml0ZVJlcXVlc3QgKAo+PiArICBJTiBPVVQgV1JJVEVfUkVRVUVTVCAqV3JpdGVS
ZXF1ZXN0LAoKKDYpIEkgdGhpbmsgdGhpcyBjb3VsZCBiZSBqdXN0IE9VVCAtLSB3ZSBzdGFydCBi
eSB6ZXJvaW5nIGl0IG91dC4KCj4+ICsgIElOICAgICBDT05TVCBDSEFSOCAgICpQYXRoLAo+PiAr
ICBJTiAgICAgQ09OU1QgQ0hBUjggICAqU3ViUGF0aCBPUFRJT05BTAo+PiArICApCj4+ICt7Cj4+
ICsgIFNldE1lbShXcml0ZVJlcXVlc3QsIDMgKiBzaXplb2YgKFdSSVRFX1JFUVVFU1QpLCAwKTsK
ClRoYW5rcwpMYXN6bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
