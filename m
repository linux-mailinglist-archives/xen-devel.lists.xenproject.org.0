Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4314652A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 18:56:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbpRJ-0005iD-2G; Fri, 14 Jun 2019 16:52:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbpRH-0005i8-9o
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 16:52:31 +0000
X-Inumbo-ID: cc125cfb-8ec4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id cc125cfb-8ec4-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 16:52:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB13228;
 Fri, 14 Jun 2019 09:52:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0EE3F694;
 Fri, 14 Jun 2019 09:52:28 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D0386DC0200007800238470@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6c6fcf56-f6d1-e6b7-dcf8-3889a772d03e@arm.com>
Date: Fri, 14 Jun 2019 17:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D0386DC0200007800238470@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/ACPI: re-park previously parked
 CPUs upon resume from S3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKVGhlIHRpdGxlIGFuZCBjb21taXQgbWVzc2FnZSBhcmUgYSBiaXQgb2RkIHRvIHJl
YWQgYmVjYXVzZSB5b3UgYXJlIG1vZGlmeWluZyAKY29tbW9uIGNvZGUgYnV0IGV2ZXJ5dGhpbmcg
aXMgZ2VhcmVkIHRvd2FyZHMgeDg2LgoKT24gMTQvMDYvMjAxOSAxMjozNywgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gQWl1aSB3aGVuIHJlc3VtaW5nIGZyb20gUzMsIENQVXMgY29tZSBiYWNrIG91dCBv
ZiBSRVNFVC9JTklULiBUaGVyZWZvcmUKPiB0aGV5IG5lZWQgdG8gdW5kZXJnbyB0aGUgc2FtZSBw
cm9jZWR1cmUgYXMgd2FzIGFkZGVkIGVsc2V3aGVyZSBieQo+IGNvbW1pdHMgZDhmOTc0ZjFhNiAo
Ing4NjogY29tbWFuZCBsaW5lIG9wdGlvbiB0byBhdm9pZCB1c2Ugb2Ygc2Vjb25kYXJ5Cj4gaHlw
ZXItdGhyZWFkcyIpIGFuZCA4Nzk3ZDIwYTZlICgieDg2OiBwb3NzaWJseSBicmluZyB1cCBhbGwg
Q1BVcyBldmVuCj4gaWYgbm90IGFsbCBhcmUgc3VwcG9zZWQgdG8gYmUgdXNlZCIpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94
ZW4vY29tbW9uL2NwdS5jCj4gKysrIGIveGVuL2NvbW1vbi9jcHUuYwo+IEBAIC0xMDUsNyArMTA1
LDcgQEAgaW50IGNwdV9kb3duKHVuc2lnbmVkIGludCBjcHUpCj4gICAgICAgaWYgKCBlcnIgKQo+
ICAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAKPiAtICAgIGlmICggdW5saWtlbHkoc3lzdGVtX3N0
YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSkgKQo+ICsgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPCBTWVNf
U1RBVEVfYWN0aXZlIHx8IHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVfcmVzdW1lICkKClNvIHRo
aXMgY2hhbmdlIGhlcmUgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgZW5hYmxlX25vbmJvb3RfY3B1cygp
IG1heSBjYWxsIApjcHVfZG93bigpLCBhbSBJIHJpZ2h0PyBJZiBzbywgY291bGQgeW91IHBsZWFz
ZSBtZW50aW9uIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZT8KCj4gICAgICAgICAgIG9uX3NlbGVj
dGVkX2NwdXMoY3B1bWFza19vZihjcHUpLCBfdGFrZV9jcHVfZG93biwgTlVMTCwgdHJ1ZSk7Cj4g
ICAgICAgZWxzZSBpZiAoIChlcnIgPSBzdG9wX21hY2hpbmVfcnVuKHRha2VfY3B1X2Rvd24sIE5V
TEwsIGNwdSkpIDwgMCApCj4gICAgICAgICAgIGdvdG8gZmFpbDsKPiBAQCAtMjA3LDE1ICsyMDcs
MTkgQEAgdm9pZCBlbmFibGVfbm9uYm9vdF9jcHVzKHZvaWQpCj4gICAKPiAgICAgICBwcmludGso
IkVuYWJsaW5nIG5vbi1ib290IENQVXMgIC4uLlxuIik7Cj4gICAKPiAtICAgIGZvcl9lYWNoX2Nw
dSAoIGNwdSwgJmZyb3plbl9jcHVzICkKPiArICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1ICggY3B1
ICkKPiAgICAgICB7Cj4gKyAgICAgICAgaWYgKCBwYXJrX29mZmxpbmVfY3B1cyA/IGNwdSA9PSBz
bXBfcHJvY2Vzc29yX2lkKCkKCnBhcmtfb2ZmbGluZV9jcHVzIGlzIHg4NiBzcGVjaWZpYywgc28g
aXQgd2lsbCBub3QgYnVpbGQgb24gQXJtLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmZnJvemVuX2NwdXMpICkKPiArICAgICAgICAg
ICAgY29udGludWU7Cj4gICAgICAgICAgIGlmICggKGVycm9yID0gY3B1X3VwKGNwdSkpICkKPiAg
ICAgICAgICAgewo+ICAgICAgICAgICAgICAgcHJpbnRrKCJFcnJvciBicmluZ2luZyBDUFUlZCB1
cDogJWRcbiIsIGNwdSwgZXJyb3IpOwo+ICAgICAgICAgICAgICAgQlVHX09OKGVycm9yID09IC1F
QlVTWSk7Cj4gICAgICAgICAgIH0KPiAtICAgICAgICBlbHNlCj4gLSAgICAgICAgICAgIF9fY3B1
bWFza19jbGVhcl9jcHUoY3B1LCAmZnJvemVuX2NwdXMpOwo+ICsgICAgICAgIGVsc2UgaWYgKCAh
X19jcHVtYXNrX3Rlc3RfYW5kX2NsZWFyX2NwdShjcHUsICZmcm96ZW5fY3B1cykgJiYKPiArICAg
ICAgICAgICAgICAgICAgKGVycm9yID0gY3B1X2Rvd24oY3B1KSkgKQo+ICsgICAgICAgICAgICBw
cmludGsoIkVycm9yIHJlLW9mZmxpbmluZyBDUFUlZDogJWRcbiIsIGNwdSwgZXJyb3IpOwo+ICAg
ICAgIH0KPiAgIAo+ICAgICAgIGZvcl9lYWNoX2NwdSAoIGNwdSwgJmZyb3plbl9jcHVzICkKCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
