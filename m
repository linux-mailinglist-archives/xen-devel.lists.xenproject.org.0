Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A710B336
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:28:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia08H-0006kC-Hw; Wed, 27 Nov 2019 16:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ia08F-0006k7-Ik
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:25:35 +0000
X-Inumbo-ID: 895c1b52-1132-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 895c1b52-1132-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 16:25:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 915F4ACE0;
 Wed, 27 Nov 2019 16:25:33 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
Date: Wed, 27 Nov 2019 17:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNzoyMSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8yNy8xOSA0
OjE0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMTEuMjAxOSAxNzowMSwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOgo+Pj4gTGl2ZS1wYXRjaGluZyByZXF1aXJlcyB1bmlxdWUgc3ltYm9s
cywgYW5kIHNhZGx5IHRoZSBjbGFuZyBidWlsZAo+Pj4gZ2VuZXJhdGVzIGEgbG90IG9mIGR1cGxp
Y2F0ZSBzeW1ib2xzOgo+Pj4KPj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2FzaWQuYyNnZXRfY3B1X2lu
Zm8nIChmZmZmODJkMDgwMzAzMmMwICE9IGZmZmY4MmQwODAyZTBmNTApCj4+PiBEdXBsaWNhdGUg
c3ltYm9sICdhc2lkLmMjZ2V0X2NwdV9pbmZvX2Zyb21fc3RhY2snIChmZmZmODJkMDgwMmUxMDgw
ICE9IGZmZmY4MmQwODAzMDMyZjApCj4+PiBEdXBsaWNhdGUgc3ltYm9sICdhdHMuYyNfX2xpc3Rf
YWRkJyAoZmZmZjgyZDA4MDI2MGEwMCAhPSBmZmZmODJkMDgwMjY3YzcwKQo+Pj4gRHVwbGljYXRl
IHN5bWJvbCAnYm9vdC5jI2NvbnN0YW50X3Rlc3RfYml0JyAoZmZmZjgyZDA4MDQwZWE2MCAhPSBm
ZmZmODJkMDgwNDM3MmYwKQo+Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjY2xlYXJfYml0
JyAoZmZmZjgyZDA4MDMzMjQ0MCAhPSBmZmZmODJkMDgwMmQzM2IwKQo+Pj4gRHVwbGljYXRlIHN5
bWJvbCAnY29tbW9uLmMjY29uc3RhbnRfdGVzdF9iaXQnIChmZmZmODJkMDgwMzMyMzQwICE9IGZm
ZmY4MmQwODAyZDIyMjApCj4+PiBEdXBsaWNhdGUgc3ltYm9sICdjb21tb24uYyNjcHVtYXNrX2No
ZWNrJyAoZmZmZjgyZDA4MDJkMzM3MCAhPSBmZmZmODJkMDgwMzM3YjYwKQo+Pj4gRHVwbGljYXRl
IHN5bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDJkMjJiMCAhPSBmZmZm
ODJkMDgwMzMxNTkwKQo+Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZv
X2Zyb21fc3RhY2snIChmZmZmODJkMDgwMmQzMWMwICE9IGZmZmY4MmQwODAzMzc0YjApCj4+PiBE
dXBsaWNhdGUgc3ltYm9sICdjb21tb24uYyNwZm5fdG9fcGR4JyAoZmZmZjgyZDA4MDJkMzI3MCAh
PSBmZmZmODJkMDgwMzMxZTAwKQo+Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjdGVzdF9h
bmRfc2V0X2JpdCcgKGZmZmY4MmQwODAyZDMzNjAgIT0gZmZmZjgyZDA4MDMzMjI1MCkKPj4+IER1
cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3ZhcmlhYmxlX2NsZWFyX2JpdCcgKGZmZmY4MmQwODAy
ZDIyNzAgIT0gZmZmZjgyZDA4MDMzN2I1MCkKPj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbXBhdC5j
I2dldF9jcHVfaW5mbycgKGZmZmY4MmQwODAyNmVhYjAgIT0gZmZmZjgyZDA4MDIwMDQ2MCkKPj4+
IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbXBhdC5jI2dldF9jcHVfaW5mb19mcm9tX3N0YWNrJyAoZmZm
ZjgyZDA4MDI2ZWJkMCAhPSBmZmZmODJkMDgwMjAwZjcwKQo+Pj4gRHVwbGljYXRlIHN5bWJvbCAn
Y3B1X2lkbGUuYyNnZXRfY3B1X2luZm8nIChmZmZmODJkMDgwMmNjYjAwICE9IGZmZmY4MmQwODAz
NWZjYzApCj4+PiBbLi4uXQo+Pj4KPj4+IEZvciB0aGUgdGltZSBiZWluZyBkaXNhYmxlIGxpdmUt
cGF0Y2hpbmcgd2hlbiBidWlsZGluZyB3aXRoIGNsYW5nLAo+Pj4gc2luY2UgZHVwbGljYXRlIHN5
bWJvbHMgd2lsbCB0cmlnZ2VyIGEgYnVpbGQgZmFpbHVyZSBiZWNhdXNlCj4+PiBFTkZPUkNFX1VO
SVFVRV9TWU1CT0xTIGlzIG5vdyBhbHNvIGVuYWJsZWQgYnkgZGVmYXVsdCBpbiBjb25qdW5jdGlv
bgo+Pj4gd2l0aCBsaXZlLXBhdGNoaW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pgo+PiBUbyBiZSBob25lc3QsIGFzIGlu
ZGljYXRlZCBiZWZvcmUgSSdtIGluY2xpbmVkIHRvIG5hayB0aGlzIHBhdGNoCj4+IG9uIHRoZSBi
YXNpcyB0aGF0IGEgcHJvcGVyIHNvbHV0aW9uIGhhcyBiZWVuIHBvc3RlZCBhbG1vc3QgMyB3ZWVr
cwo+PiBhZ28gKGFuZCB0aGlzIHdhcyBhbHJlYWR5IHYyKS4KPiAKPiBXaGF0J3MgdGhhdCBwYXRj
aCB3YWl0aW5nIG9uPwoKeDg2IGFuZCByZWxlYXNlIGFja3MuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
