Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB894208F5
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:02:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGuc-0002HS-Q4; Thu, 16 May 2019 13:59:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRGub-0002HN-IP
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:59:09 +0000
X-Inumbo-ID: c668e579-77e2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c668e579-77e2-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:59:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9271715;
 Thu, 16 May 2019 06:59:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87EC23F5AF;
 Thu, 16 May 2019 06:59:07 -0700 (PDT)
To: Andre Przywara <andre.przywara@arm.com>, Amit Tomer <amittomer25@gmail.com>
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
 <60d23898-7e91-bb59-5bc8-b36d06452f28@gmail.com>
 <CABHD4K_DybrEQBeG2pn9D68pFoPH9e0ior17uy3A-_mXeSA+cQ@mail.gmail.com>
 <20190516141736.486f8a06@donnerap.cambridge.arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <97ec1401-f711-8a93-37ed-8f7d526c3e11@arm.com>
Date: Thu, 16 May 2019 14:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516141736.486f8a06@donnerap.cambridge.arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8wNS8yMDE5IDE0OjE3LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBUaHUsIDE2
IE1heSAyMDE5IDE3OjE1OjM2ICswNTMwCj4gQW1pdCBUb21lciA8YW1pdHRvbWVyMjVAZ21haWwu
Y29tPiB3cm90ZToKPj4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6MjUgQU0gT2xla3NhbmRy
IDxvbGVrc3R5c2hAZ21haWwuY29tPiB3cm90ZToKPj4+IE9uIDAzLjA1LjE5IDIwOjAyLCBBbWl0
IFNpbmdoIFRvbWFyIHdyb3RlOgo+Pj4+IFN1Z2dlc3RlZC1ieTogIEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8
YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgICAgICogVGhpcyByZXBsYWNl
cyBmb2xsb3dpbmcgcGF0Y2guCj4+Pj4gICAgICAgICBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzEwODk5ODgxLwo+Pj4+IC0tLQo+Pj4+ICAgIHhlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyB8IDE2ICsrKysrKysrKysrKysrKy0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4+
IGluZGV4IGQ5ODM2NzcuLjhmNTQ0NzIgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4g
QEAgLTEzNTMsNyArMTM1Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4+Pj4gICAgICAgICAgICB7
IC8qIHNlbnRpbmVsICovIH0sCj4+Pj4gICAgICAgIH07Cj4+Pj4gICAgICAgIHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqY2hpbGQ7Cj4+Pj4gLSAgICBpbnQgcmVzOwo+Pj4+ICsgICAgaW50IHJlcywg
aSwgbmlycSwgaXJxX2lkOwo+Pj4+ICAgICAgICBjb25zdCBjaGFyICpuYW1lOwo+Pj4+ICAgICAg
ICBjb25zdCBjaGFyICpwYXRoOwo+Pj4+Cj4+Pj4gQEAgLTEzOTksNiArMTM5OSwyMCBAQCBzdGF0
aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvLAo+Pj4+ICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pj4gICAgICAgIH0KPj4+
Pgo+Pj4+ICsgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNpbmcgUFBJIHNvdXJjZSAqLwo+Pj4+ICsg
ICAgbmlycSA9IGR0X251bWJlcl9vZl9pcnEobm9kZSk7Cj4+Pj4gKwo+Pj4+ICsgICAgZm9yICgg
aSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCj4+Pj4gKyAgICB7Cj4+Pj4gKyAgICAgICAgaXJxX2lk
ID0gcGxhdGZvcm1fZ2V0X2lycShub2RlLCBpKTsKPj4+Cj4+PiBEbyB3ZSBuZWVkIHRvIGRvIHNv
bWV0aGluZyBoZXJlIGlmIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIC0xPwo+Pgo+PiBZZWFo
LCBJIHNob3VsZCBoYXZlIGRvbmUgaXQuIHNvbWUgdGhpbmsgbGlrZSBmb2xsb3dpbmc6Cj4+IGh0
dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYztoPWQ5ODM2Nzc5ZDE3YzkwZTg0Yjk0YmEzMmU0YTIwZjAyODE4
OWZjNWI7aGI9SEVBRCNsMTI4NAo+IAo+IFdoeSB3b3VsZCB0aGF0IChvciBhbnkgYWN0dWFsIGNo
ZWNrIGFnYWluc3QgLTEpIGJlIG5lY2Vzc2FyeT8KPiBJZiBpcnFfaWQgaXMgPCAwLCB0aGVuIGl0
IHdvdWxkIHN1cmVseSBub3QgbWF0Y2ggdGhlIGNvbmRpdGlvbiBiZWxvdyBhbmQKPiAqbm90aGlu
Zyogd291bGQgaGFwcGVuLiBTbyBJJ2Qgc2F5OiBLZWVwIGl0IGxpa2UgaXQgaXMsIG5vIGFjdGlv
biBuZWNlc3NhcnkuCgpXb3JzdCwgZGVwZW5kaW5nIG9uIHRoZSBhY3Rpb24gZG9uZSB3aXRoIGNo
ZWNrLCB5b3UgY291bGQgYWN0aXZlbHkgYnJlYWsgc3VwcG9ydCAKZm9yIHBsYXRmb3JtIHdpdGgg
bXVsdGlwbGUgaW50ZXJydXB0IGNvbnRyb2xsZXJzLiBUaGF0J3Mgd2h5IGluIGhhbmRsZV9kZXZp
Y2UoKSwgCnRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBjaGVja2VkIGJlZm9yZSBjYWxsaW5n
IHBsYXRmb3JtX2dldF9pcnEoKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
