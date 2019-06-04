Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6D33C91
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 02:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXxdW-0002cF-Se; Tue, 04 Jun 2019 00:49:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rj+d=UD=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXxdV-0002cA-KI
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 00:49:09 +0000
X-Inumbo-ID: 8e5e5fba-8662-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8e5e5fba-8662-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 00:49:07 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 4 Jun
 2019 08:46:55 +0800
To: Jan Beulich <JBeulich@suse.com>, <george.dunlap@citrix.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
 <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
 <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
 <6852F5F0-0DC1-4FAE-9D80-5AF9C1187DB4@citrix.com>
 <5CF52F3A0200007800234AC4@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <99e95625-f124-2896-efa8-30c03ad00c0f@mxnavi.com>
Date: Tue, 4 Jun 2019 08:49:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF52F3A0200007800234AC4@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMy8xOSAyMjozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MTY6MDgsIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gSnVuIDMsIDIw
MTksIGF0IDExOjU0IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
Pj4KPj4+Pj4+IE9uIDAzLjA2LjE5IGF0IDEyOjQxLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4g
d3JvdGU6Cj4+Pj4gT24gNi8zLzE5IDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4g
T24gMDMuMDYuMTkgYXQgMDU6MDcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4+
Pj4+IE9uIDUvMzEvMTkgMTk6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIDMw
LjA1LjE5IGF0IDEyOjE3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+
IERlZmF1bHQ6IGVuYWJsZWQuCj4+Pj4+Pj4+IENhbiBiZSBkaXNhYmxlZCBmb3Igc21hbGxlciBj
b2RlIGZvb3RwcmludC4KPj4+Pj4+PiBCdXQgeW91J3JlIGF3YXJlIHRoYXQgd2UncmUsIGZvciBu
b3cgYXQgbGVhc3QsIHRyeWluZyB0byBsaW1pdCB0aGUKPj4+Pj4+PiBudW1iZXIgb2YgaW5kZXBl
bmRlbnRseSBzZWxlY3RhYmxlIGNvbmZpZyBvcHRpb25zPyBPbmVzIGRlcGVuZGluZwo+Pj4+Pj4+
IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4gY2VydGFpbiBjYXNlcy4KPj4+
Pj4+IExpbWl0IHRoZSBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxlY3RhYmxlIGNvbmZpZyBz
b3VuZHMgZ29vZCB0byBtZS4KPj4+Pj4+Cj4+Pj4+PiBEb2VzIHRoZSBmb2xsb3dpbmcgbG9va3Mg
Z29vZD8KPj4+Pj4+Cj4+Pj4+PiArY29uZmlnIEhBU19UUkFDRUJVRkZFUgo+Pj4+Pj4gKyAgICAg
ICBib29sICJFbmFibGUvRGlzYWJsZSB0cmFjZWJ1ZmZlciIgIGlmIEVYUEVSVCA9ICJ5Igo+Pj4+
Pj4gKyAgICAgICAtLS1oZWxwLS0tCj4+Pj4+PiArICAgICAgICAgRW5hYmxlIG9yIGRpc2FibGUg
dHJhY2VidWZmZXIgZnVuY3Rpb24uCj4+Pj4+PiArICAgICAgICAgWGVuIGludGVybmFsIHJ1bm5p
bmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxsIGJlIHNhdmVkIHRvCj4+Pj4+PiB0cmFjZSBtZW1v
cnkKPj4+Pj4+ICsgICAgICAgICB3aGVuIGVuYWJsZWQuCj4+Pj4+PiArCj4+Pj4+IFRoZSBFWFBF
UlQgYWRkaXRpb24gbWFrZSBpbnRyb2R1Y2luZyB0aGlzIGZpbmUgYnkgbWUuIEJ1dCBpdHMgbmFt
ZQo+Pj4+PiBpcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRleHQgYWxzbyBuZWVkcyBmdXJ0
aGVyIGltcHJvdmVtZW50IGltby4KPj4+PiBIaSBKYW4sIHRoYW5rcyBmb3IgeW91ciBraW5kbHkg
cmV2aWV3IGFuZCBmZWVkYmFjay4KPj4+Pgo+Pj4+IEZvciB0aGlzLCB3b3VsZCB5b3UgcGxlYXNl
IGdpdmUgeW91ciBzdWdnZXN0aW9ucyBhYm91dCB0aGUgbmFtZSBhbmQgaGVscAo+Pj4+IHRleHQ/
Cj4+PiBBcyBmYXIgYXMgdGhlIG5hbWUgaXMgY29uY2VybmVkLCB0aGUgSEFTXyBzaG91bGQgYmUg
ZHJvcHBlZC4KPj4+IEknbSBhZnJhaWQgSSBkb24ndCBoYXZlIGEgcGFydGljdWxhciBzdWdnZXN0
aW9uIGZvciB0aGUgaGVscCB0ZXh0Lgo+PiBZb3UgY291bGQgYXQgbGVhc3QgZ2l2ZSBhbiBpZGVh
IHdoYXQgeW91IHRoaW5rIHRoZSBoZWxwIHRleHQgc2hvdWxkIGluY2x1ZGUsCj4+IG9yIHNvbWUg
a2luZCBvZiBndWlkYW5jZSBhcyB0byB3aGF0IHdvdWxkIHNhdGlzZnkgeW91LiAgT2J2aW91c2x5
IHlvdQo+PiBzaG91bGRu4oCZdCBiZSByZXF1aXJlZCB0byB3cml0ZSBldmVyeWJvZHnigJlzIGhl
bHAgdGV4dCBmb3IgdGhlbTsgYnV0IGJ5IHRoZQo+PiBzYW1lIHRva2VuLCBldmVyeWJvZHkgc2hv
dWxkbuKAmXQgYmUgcmVxdWlyZWQgdG8gcmVhZCB5b3VyIG1pbmQuCj4+Cj4+IElzLCDigJxBIGRl
c2NyaXB0aW9uIG9mIHRoZSBmZWF0dXJlLCBhbG9uZyB3aXRoIHRoZSBjb3N0cyBvZiBlbmFibGlu
ZyBpdOKAnSB0aGUKPj4gc29ydCBvZiB0aGluZyB5b3UgaGFkIGluIG1pbmQ/Cj4gSSBoYWQgbm90
aGluZyBpbiBwYXJ0aWN1bGFyIGluIG1pbmQuIFRoZXJlIG91Z2h0IHRvIGJlIG90aGVyIEtjb25m
aWcKPiBvcHRpb25zIHdpdGggYXQgbGVhc3QgaGFsZiB3YXkgcmVhc29uYWJsZSBoZWxwIHRleHQs
IHdoaWNoIEkgdGhpbmsKPiBjb3VsZCBiZSB1c2VkIGFzIGd1aWRhbmNlLiBCZXlvbmQgdGhhdCBJ
IHRoaW5rIGhlbHAgdGV4dCBsYXJnZWx5IG9ubHkKPiByZS1zdGF0aW5nIHdoYXQgdGhlIHByb21w
dCBhbHJlYWR5IHNheXMgaXNuJ3QgaGVscGZ1bCwgYW5kIGhlbmNlCj4gY291bGQgYXMgd2VsbCBi
ZSBvbWl0dGVkLgoKVXBkYXRlIHRoZSBoZWxwIHRleHQgYW5kIHRoZSBIQVNfIGhhcyBiZWVuIGRy
b3BwZWQgaW4gdjEuCgo+Cj4gSmFuCj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
