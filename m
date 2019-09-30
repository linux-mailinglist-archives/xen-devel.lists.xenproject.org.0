Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3083EC1F93
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:54:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtH1-0006aN-GV; Mon, 30 Sep 2019 10:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEtGz-0006aF-Uf
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:51:21 +0000
X-Inumbo-ID: 3c7f1b76-e370-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3c7f1b76-e370-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 10:51:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AADAEAE52;
 Mon, 30 Sep 2019 10:51:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
 <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
Date: Mon, 30 Sep 2019 12:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTI6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA5LjIwMTkgMTI6
MDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgbmV3
ICJzY2hlZC1ncmFuIiBoeXBlcnZpc29yIGJvb3QgcGFyYW1ldGVyLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAgIGRvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MKPj4gaW5kZXggZmM2NDQyOTA2NC4uYzg1NTI0NjA1MCAxMDA2NDQKPj4gLS0tIGEv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4+ICsrKyBiL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYwo+PiBAQCAtMTc4Miw2ICsxNzgyLDI3IEBAIFNldCB0aGUgdGlt
ZXNsaWNlIG9mIHRoZSBjcmVkaXQxIHNjaGVkdWxlciwgaW4gbWlsbGlzZWNvbmRzLiAgVGhlCj4+
ICAgZGVmYXVsdCBpcyAzMG1zLiAgUmVhc29uYWJsZSB2YWx1ZXMgbWF5IGluY2x1ZGUgMTAsIDUs
IG9yIGV2ZW4gMSBmb3IKPj4gICB2ZXJ5IGxhdGVuY3ktc2Vuc2l0aXZlIHdvcmtsb2Fkcy4KPj4g
ICAKPj4gKyMjIyBzY2hlZC1ncmFuICh4ODYpCj4+ICs+IGA9IGNwdSB8IGNvcmUgfCBzb2NrZXRg
Cj4+ICsKPj4gKz4gRGVmYXVsdDogYHNjaGVkLWdyYW49Y3B1YAo+PiArCj4+ICtTZXQgdGhlIHNj
aGVkdWxpbmcgZ3JhbnVsYXJpdHkuIEluIGNhc2UgdGhlIGdyYW51bGFyaXR5IGlzIGxhcmdlciB0
aGFuIDEgKGUuZy4KPj4gK2Bjb3JlYG9uIGEgU01ULWVuYWJsZWQgc3lzdGVtLCBvciBgc29ja2V0
YCkgbXVsdGlwbGUgdmNwdXMgYXJlIGFzc2lnbmVkCj4+ICtzdGF0aWNhbGx5IHRvIGEgInNjaGVk
dWxpbmcgdW5pdCIgd2hpY2ggd2lsbCB0aGVuIGJlIHN1YmplY3QgdG8gc2NoZWR1bGluZy4KPj4g
K1RoaXMgYXNzaWdubWVudCBvZiB2Y3B1cyB0byBzY2hlZHVsaW5nIHVuaXRzIGlzIGZpeGVkLgo+
PiArCj4+ICtgY3B1YDogVmNwdXMgd2lsbCBiZSBzY2hlZHVsZWQgaW5kaXZpZHVhbGx5IG9uIHNp
bmdsZSBjcHVzLgo+PiArCj4+ICtgY29yZWA6IEFzIG1hbnkgdmNwdXMgYXMgdGhlcmUgYXJlIGh5
cGVydGhyZWFkcyBvbiBhIHBoeXNpY2FsIGNvcmUgYXJlCj4+ICtzY2hlZHVsZWQgdG9nZXRoZXIg
b24gYSBwaHlzaWNhbCBjb3JlLgo+PiArCj4+ICtgc29ja2V0YDogQXMgbWFueSB2Y3B1cyBhcyB0
aGVyZSBhcmUgaHlwZXJ0aHJlYWRzIG9uIGEgcGh5c2ljYWwgc29ja2V0cyBhcmUKPj4gK3NjaGVk
dWxlZCB0b2dldGhlciBvbiBhIHBoeXNpY2FsIHNvY2tldC4KPiAKPiBJJ2QgcHJlZmVyIGlmIHRo
aXMgZGlkbid0IGVuZCB1cCBJbnRlbC1jZW50cmljOyBpZGVhbGx5IGl0IGFsc28gd291bGRuJ3Qg
YmUKPiB4ODYtc3BlY2lmaWMuIEFNRCBoYXMgaW50cm9kdWNlZCBoeXBlcnRocmVhZGluZyBpbiBG
YW0xNyBvbmx5OyBGYW0xNSB1c2VkCj4gImNvbXB1dGUgdW5pdHMiLCBncm91cGluZyB0b2dldGhl
ciAiY29yZXMiLiBJbnRlcm5hbGx5IHRoZSBJbnRlbCBzaWRlCj4gImNvcmUgdnMgaHlwZXJ0aHJl
YWQiIGlzIHJlcHJlc2VudGVkIGluIHRoZSBzYW1lIHZhcmlhYmxlcyAoY3B1X3NpYmxpbmdfbWFz
awo+IGluIHBhcnRpY3VsYXIpIGFzIHRoZSBBTUQgc2lkZSAiY29tcHV0ZSB1bml0IHZzIGNvcmUi
LgoKWWVzLCBpdCBpcyBhIG1lc3MuCgo+IFRoZXJlZm9yZSBpdCBtYXkgYmUgYmV0dGVyIHRvIHRh
bGsgaGVyZSBhYm91dCBlLmcuICJzbWFsbGVzdCB0b3BvbG9naWNhbAo+IHN1Yi11bml0IiBhbmQg
b25seSBzYXkgImUuZy4gYSBoeXBlcnRocmVhZCB0byBtYWtlIGEgY29ubmVjdGlvbiB0byBjb21t
b24KPiB4ODYgLyBJbnRlbCB0ZXJtaW5vbG9neSIuIE9mIGNvdXJzZSB0aGUgQU1EIHNpZGUgYWx0
ZXJuYXRpdmUgdXNlIG9mIHRoZQo+IHZhcmlhYmxlcyBhbHNvIHJlbmRlcnMgdGhlIGFjdHVhbCBj
b21tYW5kIGxpbmUgb3B0aW9uICJzY2hlZC1ncmFuPWNvcmUiCj4gbm90IG92ZXJseSBmb3J0dW5h
dGUuIFBlcmhhcHMgd2UnZCB3YW50IHRvIGFsc28gdXNlIG1vcmUgYWJzdHJhY3QgdGVybXMKPiBo
ZXJlLCBlLmcuIHRvcG9sb2dpY2FsICJsZXZlbHMiPwoKSSB0aGluayByZWdhcmRpbmcgdXNhZ2Ug
b2YgImh5cGVydGhyZWFkcyIgSSdsbCBnbyB3aXRoOgoKK2BjcHVgOiBWY3B1cyB3aWxsIGJlIHNj
aGVkdWxlZCBpbmRpdmlkdWFsbHkgb24gc2luZ2xlIGNwdXMgKGUuZy4gYQorIGh5cGVydGhyZWFk
IHVzaW5nIHg4Ni9JbnRlbCB0ZXJtaW5vbG9neSkKKworIGBjb3JlYDogQXMgbWFueSB2Y3B1cyBh
cyB0aGVyZSBhcmUgY3B1cyBvbiBhIHBoeXNpY2FsIGNvcmUgYXJlCisgc2NoZWR1bGVkIHRvZ2V0
aGVyIG9uIGEgcGh5c2ljYWwgY29yZS4KLi4uCgpJIHRoaW5rIHVzaW5nICJjb3JlIiBpcyBmaW5l
LiBXZSBoYXZlIGl0IGluIG11bHRpcGxlIHBsYWNlcyBpbiB0aGUKaHlwZXJ2aXNvciB3aGljaCBh
cmUgX25vdF8gc3BlY2lmaWMgdG8gSW50ZWwuIEFuZCAiY29yZS1zY2hlZHVsaW5nIiBpcwphIHdl
bGwta25vd24gYnV6endvcmQgYWxyZWFkeS4KCj4gCj4+ICtOb3RlOiBhIHZhbHVlIG90aGVyIHRo
YW4gYGNwdWAgd2lsbCByZXN1bHQgaW4gcmVqZWN0aW5nIGEgcnVudGltZSBtb2RpZmljYXRpb24K
Pj4gK29mIHRoZSAic210IiBzZXR0aW5nLgo+IAo+IFBlcmhhcHMgYWRkICJhdHRlbXB0IiBoZXJl
PwoKWWVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
