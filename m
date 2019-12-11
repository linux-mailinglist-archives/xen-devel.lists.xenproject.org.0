Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3A11B524
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 16:52:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if4Ev-0003oq-2P; Wed, 11 Dec 2019 15:49:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1if4Es-0003ol-Sd
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 15:49:22 +0000
X-Inumbo-ID: c711aa1a-1c2d-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c711aa1a-1c2d-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 15:49:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E48CAFA9;
 Wed, 11 Dec 2019 15:49:12 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191203054222.7966-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17bf38dc-a606-bb92-50a8-9bd8f269acc2@suse.com>
Date: Wed, 11 Dec 2019 16:49:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203054222.7966-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] xen-pciback: optionally allow interrupt
 enable flag writes
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
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAwNjo0MSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBRRU1VIHJ1bm5pbmcgaW4gYSBzdHViZG9tIG5lZWRzIHRvIGJlIGFibGUgdG8gc2V0IElOVFhf
RElTQUJMRSwgYW5kIHRoZQo+IE1TSSgtWCkgZW5hYmxlIGZsYWdzIGluIHRoZSBQQ0kgY29uZmln
IHNwYWNlLiBUaGlzIGFkZHMgYW4gYXR0cmlidXRlCj4gJ2FsbG93X2ludGVycnVwdF9jb250cm9s
JyB3aGljaCB3aGVuIHNldCBmb3IgYSBQQ0kgZGV2aWNlIGFsbG93cyB3cml0ZXMKPiB0byB0aGlz
IGZsYWcocykuIFRoZSB0b29sc3RhY2sgd2lsbCBuZWVkIHRvIHNldCB0aGlzIGZvciBzdHViZG9t
cy4KPiBXaGVuIGVuYWJsZWQsIGd1ZXN0IChzdHViZG9tYWluKSB3aWxsIGJlIGFsbG93ZWQgdG8g
c2V0IHJlbGV2YW50IGVuYWJsZQo+IGZsYWdzLCBidXQgb25seSBvbmUgYXQgYSB0aW1lIC0gaS5l
LiBpdCByZWZ1c2VzIHRvIGVuYWJsZSBtb3JlIHRoYW4gb25lCj4gb2YgSU5UeCwgTVNJLCBNU0kt
WCBhdCBhIHRpbWUuCj4gCj4gVGhpcyBmdW5jdGlvbmFsaXR5IGlzIG5lZWRlZCBvbmx5IGZvciBj
b25maWcgc3BhY2UgYWNjZXNzIGRvbmUgYnkgZGV2aWNlCj4gbW9kZWwgKHN0dWJkb21haW4pIHNl
cnZpbmcgYSBIVk0gd2l0aCB0aGUgYWN0dWFsIFBDSSBkZXZpY2UuIEl0IGlzIG5vdAo+IG5lY2Vz
c2FyeSBhbmQgdW5zYWZlIHRvIGVuYWJsZSBkaXJlY3QgYWNjZXNzIHRvIHRob3NlIGJpdHMgZm9y
IFBWIGRvbWFpbgo+IHdpdGggdGhlIGRldmljZSBhdHRhY2hlZC4gRm9yIFBWIGRvbWFpbnMsIHRo
ZXJlIGFyZSBzZXBhcmF0ZSBwcm90b2NvbAo+IG1lc3NhZ2VzIChYRU5fUENJX09QX3tlbmFibGUs
ZGlzYWJsZX1fe21zaSxtc2l4fSkgZm9yIHRoaXMgcHVycG9zZS4KPiBUaG9zZSBvcHMgaW4gYWRk
aXRpb24gdG8gc2V0dGluZyBlbmFibGUgYml0cywgYWxzbyBjb25maWd1cmUgTVNJKC1YKSBpbgo+
IGRvbTAga2VybmVsIC0gd2hpY2ggaXMgdW5kZXNpcmFibGUgZm9yIFBDSSBwYXNzdGhyb3VnaCB0
byBIVk0gZ3Vlc3RzLgo+IAo+IFRoaXMgc2hvdWxkIG5vdCBpbnRyb2R1Y2UgYW55IG5ldyBzZWN1
cml0eSBpc3N1ZXMgc2luY2UgYSBtYWxpY2lvdXMKPiBndWVzdCAob3Igc3R1YmRvbSkgY2FuIGFs
cmVhZHkgZ2VuZXJhdGUgTVNJcyB0aHJvdWdoIG90aGVyIHdheXMsIHNlZQo+IFsxXSBwYWdlIDgu
CgpUcnVlLCBhbGJlaXQgdGhpcyBkb2Vzbid0IGNvdmVyIElOVFhfRElTQUJMRS4KCj4gQWRkaXRp
b25hbGx5LCB3aGVuIHFlbXUgcnVucyBpbiBkb20wLCBpdCBhbHJlYWR5IGhhdmUgZGlyZWN0Cj4g
YWNjZXNzIHRvIHRob3NlIGJpdHMuCgpUcnVlIGFnYWluLCBidXQgYW55IGJ1ZyBoZXJlIChhcyBp
bjogdG9vIHdpZGUgZXhwb3N1cmUpIGlzIGEgcWVtdQpidWcgKHBvc3NpYmx5IHNlY3VyaXR5IGlz
c3VlKS4gVGhlIHN0YXRlbWVudCBhbHNvIGlzbid0IHJlYWxseQpjb3JyZWN0IGZvciBkZS1wcml2
aWxlZ2VkIHFlbXUsIEkgdGhpbmsgKGJ1dCBJIGFsc28gdGhpbmsgUENJCnBhc3MtdGhyb3VnaCBk
b2Vzbid0IHdvcmsgaW4gdGhhdCBtb2RlIGF0IGFsbCB5ZXQpLgoKT24gdGhlIHdob2xlIHRoaXMg
bG9va3MgdG8gYmUgYW4gYWNjZXB0YWJsZSBhcHByb2FjaCB0byBtZS4gQnV0CkknbSBub3QgdGhl
IG1haW50YWluZXIsIHNvIG15IG9waW5pb24gbWF5IG5vdCBjb3VudCBtdWNoLiBTb21lCmlzc3Vl
cyB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiBpdHNlbGYgd2VyZSBhbHJlYWR5IHBvaW50ZWQgb3V0
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
