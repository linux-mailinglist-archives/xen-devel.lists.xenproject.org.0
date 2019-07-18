Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C16D0A9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:05:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7vm-0001KB-SC; Thu, 18 Jul 2019 15:02:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho7vl-0001K6-2M
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:02:49 +0000
X-Inumbo-ID: 1abe9608-a96d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1abe9608-a96d-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:02:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C502344;
 Thu, 18 Jul 2019 08:02:47 -0700 (PDT)
Received: from [10.37.10.69] (unknown [10.37.10.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813013F71F;
 Thu, 18 Jul 2019 08:02:44 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190718144317.23307-1-tamas@tklengyel.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
Date: Thu, 18 Jul 2019 16:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718144317.23307-1-tamas@tklengyel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpBZGRpbmcgTGFycywgQXJ0ZW0gYW5kIEl1cmlpLiBJdXJpaSBoYXMgYmVlbiB3
b3JraW5nIG9uIGEgdmVyc2lvbiBmb3IgCmNsYW5nLWZvcm1hdCByZWNlbnRseS4KCk9uIDcvMTgv
MTkgMzo0MyBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFVzaW5nIGFzdHlsZSAoaHR0cDov
L2FzdHlsZS5zb3VyY2Vmb3JnZS5uZXQpIGNhbiBncmVhdGx5IHJlZHVjZSB0aGUgb3ZlcmhlYWQg
b2YKPiBtYW51YWxseSBjaGVja2luZyBhbmQgYXBwbHlpbmcgc3R5bGUtZml4ZXMgdG8gc291cmNl
LWNvZGUuIFRoZSBpbmNsdWRlZAo+IC5hc3R5bGVyYyBpcyB0aGUgY2xvc2VzdCBhcHByb3hpbWF0
aW9uIG9mIHRoZSBlc3RhYmxpc2hlZCBYZW4gc3R5bGUgKGluY2x1ZGluZwo+IHN0eWxlcyBub3Qg
Zm9ybWFsbHkgc3BlbGxlZCBvdXQgYnkgQ09ESU5HX1NUWUxFIGJ1dCBjb21tb25seSByZXF1ZXN0
ZWQpLgo+IAo+IENoZWNraW5nIHRoZSBjb21tZW50IHN0eWxlcyBhcmUgbm90IGluY2x1ZGVkIGlu
IHRoZSBhdXRvbWF0aW9uLgo+IAo+IEluY29ycG9yYXRpbmcgWGVuJ3MgZXhjZXB0aW9uIHRvIHRo
ZSBkby13aGlsZSBzdHlsZSBpcyBvbmx5IHBhcnRpYWxseSBwb3NzaWJsZSwKPiB0aHVzIGEgY2hh
bmdlIGlzIHByb3Bvc2VkIHRvIHRoZSBDT0RJTkdfU1RZTEUgb2YgbW92aW5nIHRoZSBicmFjZSBm
cm9tICJkbyB7Igo+IHRvIHRoZSBuZXh0IGxpbmUuCj4gCj4gTW9zdCBvZiBYZW4ncyBjb2RlLWJh
c2UgaXMgbm9uLWNvbmZvcm1pbmcgYXQgdGhlIG1vbWVudDogMjg5IGZpbGVzIHBhc3MKPiB1bmNo
YW5nZWQsIDg3NiBoYXZlIHNvbWUgc3R5bGUgaXNzdWVzLgo+IAo+IElkZWFsbHkgd2UgY2FuIHNs
b3dseSBtaWdyYXRlIHRoZSBlbnRpcmUgY29kZS1iYXNlIHRvIGJlIGNvbmZvcm1pbmcsIHRodXMK
PiBlbGltaW5hdGluZyB0aGUgbmVlZCBvZiBkaXNjdXNzaW5nIGFuZCBlbmZvcmNpbmcgc3R5bGUg
aXNzdWVzIG1hbnVhbGx5IG9uIHRoZQo+IG1haWxpbmdsaXN0LgoKSSBxdWl0ZSBsaWtlIHRoZSBp
ZGVhIG9mIGFuIGF1dG9tYXRpYyBjb2Rpbmcgc3R5bGUgY2hlY2tlci4gSG93ZXZlciwgaXQgCmlz
IGEgYml0IGNvbmNlcm5pbmcgdGhhdCBub3QgZXZlbiBhIDEvMyBvZiB0aGUgZmlsZXMgYXJlIGFi
bGUgdG8gcGFzcyAKdGhlIGNvZGluZyBzdHlsZSB5b3Ugc3VnZ2VzdC4gQ291bGQgeW91IGV4cGxh
aW4gd2hldGhlciB0aGlzIGlzIGJlY2F1c2UgCnRoZSBmaWxlcyBkb2VzIG5vdCBhbHJlYWR5IGZv
bGxvdyBYZW4gY29kaW5nIHN0eWxlIG9yIGlzIGl0IGp1c3QgdGhlIApkaWZmZXJlbmNlIHdpdGgg
YXN0eWxlPwoKV2hhdCBhcmUgdGhlIG1haW4gc3R5bGUgaXNzdWVzPwoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gLS0tCj4gICAuYXN0
eWxlcmMgICAgfCAxNCArKysrKysrKysrKysrKwo+ICAgQ09ESU5HX1NUWUxFIHwgMTggKysrKysr
KysrKysrKysrLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgLmFzdHlsZXJjCj4gCj4gZGlmZiAtLWdp
dCBhLy5hc3R5bGVyYyBiLy5hc3R5bGVyYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uYmJkMWQ1NWRkZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi8uYXN0eWxlcmMK
PiBAQCAtMCwwICsxLDE0IEBACj4gK3N0eWxlPWJzZAo+ICtzdWZmaXg9bm9uZQo+ICthbGlnbi1w
b2ludGVyPW5hbWUKPiArYWxpZ24tcmVmZXJlbmNlPW5hbWUKPiAraW5kZW50PXNwYWNlcz00Cj4g
K21heC1jb2RlLWxlbmd0aD04MAo+ICttaW4tY29uZGl0aW9uYWwtaW5kZW50PTAKPiArYXR0YWNo
LWNsb3Npbmctd2hpbGUKPiArcmVtb3ZlLWJyYWNlcwo+ICtpbmRlbnQtc3dpdGNoZXMKPiArYnJl
YWstb25lLWxpbmUtaGVhZGVycwo+ICtrZWVwLW9uZS1saW5lLWJsb2Nrcwo+ICtwYWQtY29tbWEK
PiArcGFkLWhlYWRlcgo+IGRpZmYgLS1naXQgYS9DT0RJTkdfU1RZTEUgYi9DT0RJTkdfU1RZTEUK
PiBpbmRleCA2Y2M1Yjc3NGNmLi4wYjM3ZjdhZTRkIDEwMDY0NAo+IC0tLSBhL0NPRElOR19TVFlM
RQo+ICsrKyBiL0NPRElOR19TVFlMRQo+IEBAIC02MCw4ICs2MCw4IEBAIEJyYWNpbmcKPiAgIC0t
LS0tLS0KPiAgIAo+ICAgQnJhY2VzICgneycgYW5kICd9JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9u
IGEgbGluZSBvZiB0aGVpciBvd24sIGV4Y2VwdAo+IC1mb3IgdGhlIGRvL3doaWxlIGxvb3AuICBU
aGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZAo+IC11bmxpa2UgSyZSLiAg
ZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoKPiArZm9yIHRoZSB3aGlsZS1w
YXJ0IG9mIGRvL3doaWxlIGxvb3BzLiAgVGhpcyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBz
dHlsZQo+ICthbmQgdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBhbiBleGNlcHRpb24u
IGUuZy46Cj4gICAKPiAgIGlmICggY29uZGl0aW9uICkKPiAgIHsKPiBAQCAtNzcsNyArNzcsOCBA
QCB3aGlsZSAoIGNvbmRpdGlvbiApCj4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gICB9Cj4gICAK
PiAtZG8gewo+ICtkbwo+ICt7Cj4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gICB9IHdoaWxlICgg
Y29uZGl0aW9uICk7Cj4gICAKPiBAQCAtMTIwLDMgKzEyMSwxNCBAQCB0aGUgZW5kIG9mIGZpbGVz
LiAgSXQgc2hvdWxkIGJlOgo+ICAgICogaW5kZW50LXRhYnMtbW9kZTogbmlsCj4gICAgKiBFbmQ6
Cj4gICAgKi8KPiArCj4gK0F1dG9tYXRlZCBzdHlsZSBmb3JtYXR0aW5nIHVzaW5nIGFzdHlsZQo+
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1RoZSAuYXN0
eWxlcmMgaW5jbHVkZWQgaW4gdGhlIFhlbiB0cmVlIGluY29ycG9yYXRlcyBtb3N0IG9mIFhlbidz
Cj4gK3N0eWxlIHJlcXVpcmVtZW50cywgZXhjZXB0IHRoZSBmb3JtYXR0aW5nIG9mIGNvbW1lbnRz
Lgo+ICsKPiArVGhlIHN0ZXBzIHRvIGF1dG9tYXRpY2FsbHkgZm9ybWF0IGEgZmlsZSBhcmU6Cj4g
Kwo+ICtleHBvcnQgQVJUSVNUSUNfU1RZTEVfT1BUSU9OUz0iLmFzdHlsZXJjIgo+ICthc3R5bGUg
PHNvdXJjZSBvciBoZWFkZXIgZmlsZT4KCkkgdGhpbmsgeW91IHdhbnQgdG8gcHJvdmlkZSBlYXN5
IHdheSBmb3IgdGhlIHVzZXIgdG8gaW5zdGFsbC9jb21waWxlIGl0LiAKU28gdGhlcmUgYXJlIGFu
IGhpZ2hlciBjaGFuY2UgZm9yIHRoZW0gdG8gdXNlIGl0LgoKTG9uZy10ZXJtIHdlIHByb2JhYmx5
IHdhbnQgdG8gZ2V0IHRoaXMgaG9va2VkIHRvIHRoZSBDSSBsb29wLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
