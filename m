Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C633493F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:45:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY9hd-0000hK-8N; Tue, 04 Jun 2019 13:42:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY9hc-0000hD-1c
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:42:12 +0000
X-Inumbo-ID: 8da970ae-86ce-11e9-bb1d-2305d81bca33
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8da970ae-86ce-11e9-bb1d-2305d81bca33;
 Tue, 04 Jun 2019 13:42:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60F2341;
 Tue,  4 Jun 2019 06:42:10 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0F9E3F690;
 Tue,  4 Jun 2019 06:42:08 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
 <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
 <5CF66C2E0200007800235190@prv1-mh.provo.novell.com>
 <54648a1c-5f8a-478e-59eb-6d5343eab8e0@arm.com>
 <5CF66EAE02000078002351BE@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <19da6704-7c6e-9e5c-6af3-86fa94f09b35@arm.com>
Date: Tue, 4 Jun 2019 14:42:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF66EAE02000078002351BE@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@cirix.com>,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzQvMTkgMjoxNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDYuMTkg
YXQgMTU6MDUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4g
T24gNi80LzE5IDI6MDMgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDYuMTkg
YXQgMTQ6NTUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gNi80LzE5IDE6
NDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNp
LmgKPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4+Pj4+IEBAIC0xMjEsNyArMTIx
LDkgQEAgc3RydWN0IHBjaV9kZXYgewo+Pj4+PiAgICAgfTsKPj4+Pj4gICAgIAo+Pj4+PiAgICAg
I2RlZmluZSBmb3JfZWFjaF9wZGV2KGRvbWFpbiwgcGRldikgXAo+Pj4+PiAtICAgIGxpc3RfZm9y
X2VhY2hfZW50cnkocGRldiwgJihkb21haW4tPmFyY2gucGRldl9saXN0KSwgZG9tYWluX2xpc3Qp
Cj4+Pj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShwZGV2LCAmKGRvbWFpbiktPnBkZXZfbGlz
dCwgZG9tYWluX2xpc3QpCj4+Pj4+ICsKPj4+Pj4gKyNkZWZpbmUgaGFzX2FyY2hfcGRldnMoZCkg
KCFsaXN0X2VtcHR5KCYoZCktPnBkZXZfbGlzdCkpCj4+Pj4KPj4+PiBUaGlzIGZlZWxzIGEgYml0
IHN0cmFuZ2UgdG8ga2VlcCAiYXJjaCIgaW4gdGhlIG1hY3JvIG5hbWUgd2hlbiB0aGUgY29kZQo+
Pj4+IGlzIG5vdyBnZW5lcmljLiBIb3cgYWJvdXQgImRvbWFpbl9oYXNfcGRldnMiPwo+Pj4KPj4+
IEluZGVlZCBJIGRpZCBub3RpY2UgdGhpcyBvZGRpdHkgdG9vLCBidXQgaWYgc3VjaCBhbiBhZGp1
c3RtZW50IGlzCj4+PiB0byBiZSBtYWRlIHRoZW4gaW1vIG5vdCBpbiB0aGlzIHBhdGNoLiBBZnRl
ciBhbGwgaW4gdHVybiBJJ2QgbmVlZAo+Pj4gdG8gY2hhbmdlIGFsbCB1c2Ugc2l0ZXMuCj4+Cj4+
IEl0IGZlZWxzIHRvIG1lIHRoZXkgYXJlIGtpbmQgb2YgdGllZCB0b2dldGhlciBiZWNhdXNlIGhh
c19hcmNoX3BkZXZzIGlzCj4+IGFuIGFjY2Vzc29yIG9mIHRoZSBmaWVsZC4KPiAKPiBJbiBhIHdh
eSB0aGV5IGFyZS4gQnV0IHRoZSBuYW1lIG9mIHRoZSBtYWNybyBoYXNuJ3QgYmVjb21lCj4gIndy
b25nIiBieSB0aGUgY2hhbmdlIGhlcmUuIFRoYXQgcmVuYW1pbmcgeW91IGFzayBmb3IgY291bGQK
PiBhbHNvIGhhdmUgYmVlbiBkb25lIGEgeWVhciBhZ28sIGlmIHNvIHdhbnRlZC4KCkZhaXIgZW5v
dWdoIGZvciBub24teDg2IGNvZGU6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
