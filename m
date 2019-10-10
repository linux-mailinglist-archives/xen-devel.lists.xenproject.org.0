Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D913D2D94
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaDK-0007Pa-ML; Thu, 10 Oct 2019 15:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIaDJ-0007PV-5R
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:18:49 +0000
X-Inumbo-ID: 41abaf8e-eb71-11e9-931d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 41abaf8e-eb71-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 15:18:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC99337;
 Thu, 10 Oct 2019 08:18:47 -0700 (PDT)
Received: from [10.1.39.39] (e110479-lin.cambridge.arm.com [10.1.39.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A6F3F6C4;
 Thu, 10 Oct 2019 08:18:46 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <948ee2a4-8a6a-57d5-3358-e0d6217624cb@arm.com>
Date: Thu, 10 Oct 2019 16:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC84LzE5IDQ6MjUgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
PiAKPiBXZSBkb24ndCBwYXNzdGhyb3VnaCBJT01NVSBkZXZpY2UgdG8gaHdkb20gZXZlbiBpZiBp
dCBpcyBub3QgdXNlZCBieSBYZW4uCj4gVGhlcmVmb3JlIGV4cG9zaW5nIHRoZSBwcm9wZXJ0aWVz
IHRoYXQgZGVzY3JpYmUgcmVsYXRpb25zaGlwIGJldHdlZW4KPiBtYXN0ZXIgZGV2aWNlcyBhbmQg
SU9NTVVzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNlLgo+IAo+IEFjY29yZGluZyB0byB0aGU6Cj4g
MS4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2lvbW11LnR4dAo+IDIu
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlvbW11LnR4dAoKSXQg
aXMgbm90IGVudGlyZWx5IGNsZWFyIHRoYXQgZG9jdW1lbnRhdGlvbiBpcyBmcm9tIExpbnV4LgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlcyBWMSBbMV0gLT4gVjI6Cj4gICAgIC0g
T25seSBza2lwIElPTU1VIHNwZWNpZmljIHByb3BlcnRpZXMgb2YgdGhlIG1hc3RlciBkZXZpY2Ug
aWYgd2UKPiAgICAgICBza2lwIHRoZSBjb3JyZXNwb25kaW5nIElPTU1VIGRldmljZQo+ICAgICAt
IFVzZSAiaHdkb20iIG92ZXIgIkRvbTAiCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMC9tc2cwMDEwNC5odG1sCj4gLS0t
Cj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyOSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCj4gaW5kZXggNmQ2ZGQ1Mi4uYTczMjFiOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
PiBAQCAtNDgwLDEwICs0ODAsMjYgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGll
cyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgIGNv
bnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAqcHJvcCwgKnN0YXR1cyA9IE5VTEw7Cj4gICAgICAgaW50
IHJlcyA9IDA7Cj4gICAgICAgaW50IGhhZF9kb20wX2Jvb3RhcmdzID0gMDsKPiArICAgIHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqaW9tbXVfbm9kZTsKPiAgIAo+ICAgICAgIGlmICgga2luZm8tPmNt
ZGxpbmUgJiYga2luZm8tPmNtZGxpbmVbMF0gKQo+ICAgICAgICAgICBib290YXJncyA9ICZraW5m
by0+Y21kbGluZVswXTsKPiAgIAo+ICsgICAgLyoKPiArICAgICAqIElmIHdlIHNraXAgdGhlIElP
TU1VIGRldmljZSB3aGVuIGNyZWF0aW5nIERUIGZvciBod2RvbSAoZXZlbiBpZgo+ICsgICAgICog
dGhlIElPTU1VIGRldmljZSBpcyBub3QgdXNlZCBieSBYZW4pLCB3ZSBzaG91bGQgYWxzbyBza2lw
IHRoZSBJT01NVQo+ICsgICAgICogc3BlY2lmaWMgcHJvcGVydGllcyBvZiB0aGUgbWFzdGVyIGRl
dmljZSBiZWhpbmQgaXQgaW4gb3JkZXIgdG8gYXZvaWQKPiArICAgICAqIGV4cG9zaW5nIGFuIGhh
bGYgY29tcGxldGUgSU9NTVUgYmluZGluZ3MgdG8gaHdkb20uCj4gKyAgICAgKiBVc2UgImlvbW11
X25vZGUiIGFzIGFuIGluZGljYXRvciBvZiB0aGUgbWFzdGVyIGRldmljZSB3aGljaCBwcm9wZXJ0
aWVzCj4gKyAgICAgKiBzaG91bGQgYmUgc2tpcHBlZC4KPiArICAgICAqLwo+ICsgICAgaW9tbXVf
bm9kZSA9IGR0X3BhcnNlX3BoYW5kbGUobm9kZSwgImlvbW11cyIsIDApOwoKVGhlIGNvZGUgaXMg
c2xpZ2h0bHkgY29uZnVzaW5nIHRvIHJlYWQuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGNhcmUg
b2YgCmludmFsaWQgRFQgaGVyZSwgc28gbGV0J3Mgb25seSBjb25zaWRlciB2YWxpZCBvbmUuCgpG
b3IgdmFsaWQgRFQsIGFueSBub24tTlVMTCByZXR1cm4gc2hvdWxkIHBvaW50IHRvIGFuIElPTU1V
LiBUaGUgY29tbWVudCAKYWJvdmUgc3VnZ2VzdHMgdGhhdCBhbGwgSU9NTVUgd2lsbCBiZSBza2lw
cGVkLiBIb3dldmVyLCB0aGUgY2hlY2sgYmVsb3cgCihkZXZpY2VfZ2V0X2NsYXNzKGlvbW11X25v
ZGUpKSB3aWxsIG5vdCByZXR1cm4gREVWSUNFX0lPTU1VIHdoZW4gdGhlcmUgCmFyZSBub3QgaGF2
ZSBhIGRyaXZlciBmb3IgdGhlIElPTU1VLgoKU28gdGhpcyBuZWVkcyB0byBiZSBjbGFyaWZpZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKPiArICAgIGlmICggaW9tbXVfbm9kZSApCj4gKyAgICB7
Cj4gKyAgICAgICAgaWYgKCBkZXZpY2VfZ2V0X2NsYXNzKGlvbW11X25vZGUpICE9IERFVklDRV9J
T01NVSApCj4gKyAgICAgICAgICAgIGlvbW11X25vZGUgPSBOVUxMOwo+ICsgICAgfQoKQ291bGQg
d2UgZ2F0aGVyIHRoZSB0d28gY29uZGl0aW9ucyBpbiBvbmUgaWY/Cgo+ICsKPiAgICAgICBkdF9m
b3JfZWFjaF9wcm9wZXJ0eV9ub2RlIChub2RlLCBwcm9wKQo+ICAgICAgIHsKPiAgICAgICAgICAg
Y29uc3Qgdm9pZCAqcHJvcF9kYXRhID0gcHJvcC0+dmFsdWU7Cj4gQEAgLTU0MCw2ICs1NTYsMTkg
QEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAg
ICAgICAgIH0KPiAgIAo+ICsgICAgICAgIGlmICggaW9tbXVfbm9kZSApCj4gKyAgICAgICAgewo+
ICsgICAgICAgICAgICAvKiBEb24ndCBleHBvc2UgSU9NTVUgc3BlY2lmaWMgcHJvcGVydGllcyB0
byBod2RvbSAqLwo+ICsgICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNfZXF1YWwo
cHJvcCwgImlvbW11cyIpICkKPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAg
ICAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdS1tYXAi
KSApCj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgIGlmICgg
ZHRfcHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwLW1hc2siKSApCj4gKyAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICB9Cj4gKwo+ICAgICAgICAgICByZXMg
PSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFtZSwgcHJvcF9kYXRhLCBwcm9wX2xl
bik7Cj4gICAKPiAgICAgICAgICAgaWYgKCByZXMgKQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
