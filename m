Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA1644B5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 11:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl9Er-0006rb-Vo; Wed, 10 Jul 2019 09:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hl9Eq-0006rW-4Q
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 09:50:12 +0000
X-Inumbo-ID: 1bdfcb76-a2f8-11e9-b4a5-6bb13f952f05
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bdfcb76-a2f8-11e9-b4a5-6bb13f952f05;
 Wed, 10 Jul 2019 09:50:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B494308338E;
 Wed, 10 Jul 2019 09:50:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7221001B1B;
 Wed, 10 Jul 2019 09:50:09 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-30-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1cddaea8-dd2d-b55a-456c-e9435c36f4cf@redhat.com>
Date: Wed, 10 Jul 2019 11:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-30-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 10 Jul 2019 09:50:11 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 29/35] OvmfPkg/PlatformBootManagerLib:
 Handle the absence of PCI bus on Xen PVH
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gcnVubmluZyBp
biBhIFhlbiBQVkggZ3Vlc3QsIHRoZXJlJ3Mgbm90aGluZyB0byBkbyBpbgo+IFBjaUFjcGlJbml0
aWFsaXphdGlvbigpIGJlY2F1c2UgdGhlcmUgaXNuJ3QgYW55IFBDSSBidXMuIFdoZW4gdGhlIEhv
c3QKPiBCcmlkZ2UgRElEIGlzbid0IHJlY29nbmlzZWQsIHNpbXBseSBjb250aW51ZS4gKFRoZSB2
YWx1ZSBvZgo+IFBjZE92bWZIb3N0QnJpZGdlUGNpRGV2SWQgd291bGQgYmUgMCBiZWNhdXNlIGl0
IGlzbid0IHNldC4pCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hv
d19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0g
SW5zdGVhZCBvZiBjaGVja2luZyBmb3IgYSBmYWxzZSB2YWx1ZSwKPiAgICAgICBYRU5fUFZIX1BD
SV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQsIHNpbXBseSBjaGVjayBpZiB3ZSBhcmUgcnVubmluZyB4
ZW4KPiAgICAgICB3aGVuIHRoZSBIb3N0QnJpZGdlIGRldmljZSBJRCBpc24ndCByZWNvZ25pc2Vk
Lgo+IAo+ICBPdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9y
bS5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0
Zm9ybS5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZv
cm0uYwo+IGluZGV4IGUzMjk2OWU2M2UuLjlhZTU5MDI5M2EgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBr
Zy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwo+ICsrKyBiL092
bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKPiBAQCAt
MTIwOSw2ICsxMjA5LDEyIEBAIFBjaUFjcGlJbml0aWFsaXphdGlvbiAoCj4gICAgICAgIFBjaVdy
aXRlOCAoUENJX0xJQl9BRERSRVNTICgwLCAweDFmLCAwLCAweDZiKSwgMHgwYik7IC8vIEgKPiAg
ICAgICAgYnJlYWs7Cj4gICAgICBkZWZhdWx0Ogo+ICsgICAgICBpZiAoWGVuRGV0ZWN0ZWQgKCkp
IHsKPiArICAgICAgICAvLwo+ICsgICAgICAgIC8vIFRoZXJlIGlzIG5vIFBDSSBidXMgaW4gdGhp
cyBjYXNlLgo+ICsgICAgICAgIC8vCj4gKyAgICAgICAgcmV0dXJuOwo+ICsgICAgICB9Cj4gICAg
ICAgIERFQlVHICgoRUZJX0RfRVJST1IsICIlYTogVW5rbm93biBIb3N0IEJyaWRnZSBEZXZpY2Ug
SUQ6IDB4JTA0eFxuIiwKPiAgICAgICAgICBfX0ZVTkNUSU9OX18sIG1Ib3N0QnJpZGdlRGV2SWQp
KTsKPiAgICAgICAgQVNTRVJUIChGQUxTRSk7Cj4gCgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2Vr
IDxsZXJzZWtAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
