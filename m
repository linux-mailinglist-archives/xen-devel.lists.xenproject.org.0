Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD189C1EE3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:27:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsra-0005oH-Ha; Mon, 30 Sep 2019 10:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEsrY-0005oC-8M
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:25:04 +0000
X-Inumbo-ID: 8f92a64c-e36c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8f92a64c-e36c-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:25:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24DDCAF19;
 Mon, 30 Sep 2019 10:25:01 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
Date: Mon, 30 Sep 2019 12:25:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930100900.660-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot
 parameter documentation
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMjowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgZG9jdW1lbnRh
dGlvbiBmb3IgdGhlIG5ldyAic2NoZWQtZ3JhbiIgaHlwZXJ2aXNvciBib290IHBhcmFtZXRlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0t
Cj4gIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDIxICsrKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKPiBpbmRleCBmYzY0NDI5MDY0Li5jODU1MjQ2MDUwIDEwMDY0NAo+
IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ICsrKyBiL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+IEBAIC0xNzgyLDYgKzE3ODIsMjcgQEAgU2V0IHRo
ZSB0aW1lc2xpY2Ugb2YgdGhlIGNyZWRpdDEgc2NoZWR1bGVyLCBpbiBtaWxsaXNlY29uZHMuICBU
aGUKPiAgZGVmYXVsdCBpcyAzMG1zLiAgUmVhc29uYWJsZSB2YWx1ZXMgbWF5IGluY2x1ZGUgMTAs
IDUsIG9yIGV2ZW4gMSBmb3IKPiAgdmVyeSBsYXRlbmN5LXNlbnNpdGl2ZSB3b3JrbG9hZHMuCj4g
IAo+ICsjIyMgc2NoZWQtZ3JhbiAoeDg2KQo+ICs+IGA9IGNwdSB8IGNvcmUgfCBzb2NrZXRgCj4g
Kwo+ICs+IERlZmF1bHQ6IGBzY2hlZC1ncmFuPWNwdWAKPiArCj4gK1NldCB0aGUgc2NoZWR1bGlu
ZyBncmFudWxhcml0eS4gSW4gY2FzZSB0aGUgZ3JhbnVsYXJpdHkgaXMgbGFyZ2VyIHRoYW4gMSAo
ZS5nLgo+ICtgY29yZWBvbiBhIFNNVC1lbmFibGVkIHN5c3RlbSwgb3IgYHNvY2tldGApIG11bHRp
cGxlIHZjcHVzIGFyZSBhc3NpZ25lZAo+ICtzdGF0aWNhbGx5IHRvIGEgInNjaGVkdWxpbmcgdW5p
dCIgd2hpY2ggd2lsbCB0aGVuIGJlIHN1YmplY3QgdG8gc2NoZWR1bGluZy4KPiArVGhpcyBhc3Np
Z25tZW50IG9mIHZjcHVzIHRvIHNjaGVkdWxpbmcgdW5pdHMgaXMgZml4ZWQuCj4gKwo+ICtgY3B1
YDogVmNwdXMgd2lsbCBiZSBzY2hlZHVsZWQgaW5kaXZpZHVhbGx5IG9uIHNpbmdsZSBjcHVzLgo+
ICsKPiArYGNvcmVgOiBBcyBtYW55IHZjcHVzIGFzIHRoZXJlIGFyZSBoeXBlcnRocmVhZHMgb24g
YSBwaHlzaWNhbCBjb3JlIGFyZQo+ICtzY2hlZHVsZWQgdG9nZXRoZXIgb24gYSBwaHlzaWNhbCBj
b3JlLgo+ICsKPiArYHNvY2tldGA6IEFzIG1hbnkgdmNwdXMgYXMgdGhlcmUgYXJlIGh5cGVydGhy
ZWFkcyBvbiBhIHBoeXNpY2FsIHNvY2tldHMgYXJlCj4gK3NjaGVkdWxlZCB0b2dldGhlciBvbiBh
IHBoeXNpY2FsIHNvY2tldC4KCkknZCBwcmVmZXIgaWYgdGhpcyBkaWRuJ3QgZW5kIHVwIEludGVs
LWNlbnRyaWM7IGlkZWFsbHkgaXQgYWxzbyB3b3VsZG4ndCBiZQp4ODYtc3BlY2lmaWMuIEFNRCBo
YXMgaW50cm9kdWNlZCBoeXBlcnRocmVhZGluZyBpbiBGYW0xNyBvbmx5OyBGYW0xNSB1c2VkCiJj
b21wdXRlIHVuaXRzIiwgZ3JvdXBpbmcgdG9nZXRoZXIgImNvcmVzIi4gSW50ZXJuYWxseSB0aGUg
SW50ZWwgc2lkZQoiY29yZSB2cyBoeXBlcnRocmVhZCIgaXMgcmVwcmVzZW50ZWQgaW4gdGhlIHNh
bWUgdmFyaWFibGVzIChjcHVfc2libGluZ19tYXNrCmluIHBhcnRpY3VsYXIpIGFzIHRoZSBBTUQg
c2lkZSAiY29tcHV0ZSB1bml0IHZzIGNvcmUiLgoKVGhlcmVmb3JlIGl0IG1heSBiZSBiZXR0ZXIg
dG8gdGFsayBoZXJlIGFib3V0IGUuZy4gInNtYWxsZXN0IHRvcG9sb2dpY2FsCnN1Yi11bml0IiBh
bmQgb25seSBzYXkgImUuZy4gYSBoeXBlcnRocmVhZCB0byBtYWtlIGEgY29ubmVjdGlvbiB0byBj
b21tb24KeDg2IC8gSW50ZWwgdGVybWlub2xvZ3kiLiBPZiBjb3Vyc2UgdGhlIEFNRCBzaWRlIGFs
dGVybmF0aXZlIHVzZSBvZiB0aGUKdmFyaWFibGVzIGFsc28gcmVuZGVycyB0aGUgYWN0dWFsIGNv
bW1hbmQgbGluZSBvcHRpb24gInNjaGVkLWdyYW49Y29yZSIKbm90IG92ZXJseSBmb3J0dW5hdGUu
IFBlcmhhcHMgd2UnZCB3YW50IHRvIGFsc28gdXNlIG1vcmUgYWJzdHJhY3QgdGVybXMKaGVyZSwg
ZS5nLiB0b3BvbG9naWNhbCAibGV2ZWxzIj8KCj4gK05vdGU6IGEgdmFsdWUgb3RoZXIgdGhhbiBg
Y3B1YCB3aWxsIHJlc3VsdCBpbiByZWplY3RpbmcgYSBydW50aW1lIG1vZGlmaWNhdGlvbgo+ICtv
ZiB0aGUgInNtdCIgc2V0dGluZy4KClBlcmhhcHMgYWRkICJhdHRlbXB0IiBoZXJlPwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
