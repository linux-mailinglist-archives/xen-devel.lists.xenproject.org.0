Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1514A797
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:55:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6hM-0002wg-28; Mon, 27 Jan 2020 15:53:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw6hJ-0002wb-Tn
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:53:09 +0000
X-Inumbo-ID: 1d88f006-411d-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d88f006-411d-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580140389; x=1611676389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=25ho1cXeuXfT8uLHqGkllTr7o3V4utZLPYsWVbZ0c4I=;
 b=aQAq2GQxh/UHzsHcs7VDhTW6XRU+wuFqz5dwh7BTy/w03NP5lonL9km9
 ZihVKfJYjqkFSAYGdfVguS9NnbOcqimh7NHZBw6qnK5y1inwwgNMskxJT
 D4tRmFgX/9QtBkLt6VbFP+xwpwigH9oTNuUFwMFGacT7tsi5dEs/R7z60 s=;
IronPort-SDR: gr+S/rsfKW12Lo0m+msEcNPNCx19DfUegs1SzNlKukYszPwnNIOyIwoTxQufBgcHA5gBLhWMg5
 qo/h4Wg7u74Q==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="14938227"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Jan 2020 15:53:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id EABBAA15C0; Mon, 27 Jan 2020 15:53:06 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 15:53:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 15:53:05 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 15:53:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>
Thread-Topic: [PATCH] docs: retrospectively add XS_DIRECTORY_PART to the
 xenstore protocol...
Thread-Index: AQHV1Sei4PyI5iDsn0W7smcp5XqlRKf+qECAgAAA5tA=
Date: Mon, 27 Jan 2020 15:53:05 +0000
Message-ID: <789591e7546646ec855ba30b2e6ea667@EX13D32EUC003.ant.amazon.com>
References: <20200127151907.2877-1-pdurrant@amazon.com>
 <24111.734.509410.455377@mariner.uk.xensource.com>
 <51a28485-c692-21e9-32a2-24cbb77f7d50@suse.com>
 <24111.1639.549900.153818@mariner.uk.xensource.com>
In-Reply-To: <24111.1639.549900.153818@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART
 to the xenstore protocol...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AY2l0cml4LmNvbV0KPiBTZW50OiAyNyBKYW51YXJ5IDIwMjAgMTU6NDkKPiBU
bzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgo+IENjOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7Cj4g
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAK
PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPjsgSnVsaWVuIEdyYWxsCj4gPGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRvY3M6IHJldHJvc3BlY3RpdmVseSBhZGQgWFNfRElSRUNUT1JZX1BBUlQgdG8gdGhl
Cj4geGVuc3RvcmUgcHJvdG9jb2wuLi4KPiAKPiBKw7xyZ2VuIEdyb8OfIHdyaXRlcyAoIlJlOiBb
UEFUQ0hdIGRvY3M6IHJldHJvc3BlY3RpdmVseSBhZGQKPiBYU19ESVJFQ1RPUllfUEFSVCB0byB0
aGUgeGVuc3RvcmUgcHJvdG9jb2wuLi4iKToKPiA+IE9uIDI3LjAxLjIwIDE2OjMzLCBJYW4gSmFj
a3NvbiB3cm90ZToKPiA+ID4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gZG9jczogcmV0
cm9zcGVjdGl2ZWx5IGFkZAo+IFhTX0RJUkVDVE9SWV9QQVJUIHRvIHRoZSB4ZW5zdG9yZSBwcm90
b2NvbC4uLiIpOgo+ID4gPj4gLi4uIHNwZWNpZmljYXRpb24uCj4gPiA+Pgo+ID4gPj4gVGhpcyB3
YXMgYWRkZWQgYnkgY29tbWl0IDBjYTY0ZWQ4ICJ4ZW5zdG9yZTogYWRkIHN1cHBvcnQgZm9yCj4g
PiA+PiByZWFkaW5nIGRpcmVjdG9yeSB3aXRoIG1hbnkgY2hpbGRyZW4iIGJ1dCBub3QgYWRkZWQg
dG8gdGhlCj4gPiA+PiBzcGVjaWZpY2F0aW9uIGF0IHRoYXQgcG9pbnQuIEEgdmVyc2lvbiBvZiB4
ZW5zdG9yZWQgc3VwcG9ydGluZyB0aGUKPiA+ID4+IGNvbW1hbmQgd2FzIGZpcnN0IHJlbGVhc2Vk
IGluIFhlbiA0LjkuCj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgZG9jdW1lbnRpbmcgdGhpcy4gIEEg
ZG9jcyBmaXggbGlrZSB0aGlzIHNob3VsZCBiZQo+ID4gPiBiYWNrcG9ydGVkIGlmIGl0IGFwcGxp
ZXMsIElNTy4KPiA+ID4KPiA+ID4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+ID4gPiBCYWNrcG9ydDogNC45Kwo+ID4gPgo+ID4gPiBJIHdpbGwgY29t
bWl0IGl0IHRvIHN0YWdpbmcgbW9tZW50YXJpbHkuCj4gPiA+Cj4gPiA+PiArRElSRUNUT1JZX1BB
UlQJCTxwYXRoPnw8aW5kZXh8PgkJPGNoaWxkLWxlYWYtbmFtZT58Kgo+ID4gPj4gKwlQZXJmb3Jt
cyB0aGUgc2FtZSBmdW5jdGlvbiBhcyBESVJFQ1RPUlksIGJ1dCByZXR1cm5zIGEKPiA+ID4+ICsJ
c3ViLWxpc3Qgb2YgY2hpbGRyZW4gc3RhcnRpbmcgYXQgPGluZGV4PiBpbiB0aGUgb3ZlcmFsbAo+
ID4gPj4gKwljaGlsZCBsaXN0IGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gWEVOU1RPUkVfUEFZ
TE9BRF9NQVgKPiA+ID4+ICsJb2N0ZXRzIGluIGxlbmd0aC4gSWYgPGluZGV4PiBpcyBiZXlvbmQg
dGhlIGVuZCBvZiB0aGUKPiA+ID4+ICsJb3ZlcmFsbCBjaGlsZCBsaXN0IHRoZW4gdGhlIHJldHVy
bmVkIHN1Yi1saXN0IHdpbGwgYmUKPiA+ID4+ICsJZW1wdHkuCj4gPiA+Cj4gPiA+IEkgd29uZGVy
IGlmIGl0IHNob3VsZCBiZSBzb21laG93IG1hZGUgbW9yZSBleHBsaWNpdCB0aGF0IGBpbmRleCcg
aXMKPiA+ID4gYSBjb3VudCBvZiBkaXJlY3RvcnkgZW50cmllcywgbm90IGJ5dGVzLiAgTWF5YmUg
dGhpcyBpcyBvYnZpb3VzLgo+ID4KPiA+IEJ1dCB0aGlzIGlzIHdyb25nLiBJdCBpcyBieXRlcywg
YW5kIHRoZSBnZW5lcmF0aW9uIGNvdW50IHJldHVybmVkIGlzCj4gPiBtaXNzaW5nIChzZWUgbXkg
b3JpZ2luYWwgcGF0Y2ggYmFjayBpbiAyMDE3KS4KPiAKPiBTb3JyeSBmb3IgYmVpbmcgdG9vIHF1
aWNrLiAgSSBoYXZlIHJldmVydGVkIG15IGNvbW1pdC4KPiAKClNpbmNlIEkgZ290IGl0IHdyb25n
LCBJIHN1Z2dlc3QganVzdCB0YWtpbmcgSnVlcmdlbidzIG9yaWdpbmFsIHRleHQgKHdoaWNoIEkg
d2FzIHVuYXdhcmUgb2YgYmVmb3JlKS4gSXQgc2VlbXMgb2sgdG8gbWUuCgogIFBhdWwKCj4gSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
