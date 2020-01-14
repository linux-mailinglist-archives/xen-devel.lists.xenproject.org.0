Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC413A32C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 09:43:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irHkI-0002S6-SJ; Tue, 14 Jan 2020 08:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFw3=3D=amazon.de=prvs=2751bfab6=wipawel@srs-us1.protection.inumbo.net>)
 id 1irHkG-0002S1-Ch
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 08:40:16 +0000
X-Inumbo-ID: 7c9e0492-36a9-11ea-8347-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c9e0492-36a9-11ea-8347-12813bfff9fa;
 Tue, 14 Jan 2020 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1578991216; x=1610527216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=SyVlFYF+/1oxuExRpoT559PlH8fO+Q0qRR+YjYO6CTg=;
 b=gQqpYqdKrtsWxI8HzLz8URbEUs/0v95JXazi+XOftSKzvain/ktiNqMY
 7DFjiqimX2LC0UvOLix13M+y1OlGDsictRp/dfrozAjQR3diq17vwM/bR
 w0+puB+jcScylatIWOlPEkI52JJtPMWRxvgSAV4kgYZKOnxD3UfwD4RFT s=;
IronPort-SDR: MFBLlrIN3LQ740KuuJ1hFV6XhHkvzqfJvo1b2ccn/Mo16woHNliMxFbcLKF5m+8JlMWpBmxTTj
 smZPw+QrEx9Q==
X-IronPort-AV: E=Sophos;i="5.69,432,1571702400"; d="scan'208";a="12262773"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 14 Jan 2020 08:40:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5D2B0A2422; Tue, 14 Jan 2020 08:40:13 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 08:40:12 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 08:40:10 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 14 Jan 2020 08:40:10 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien@xen.org>
Thread-Topic: [PATCH] docs/misc: livepatch: Espace backslash
Thread-Index: AQHVyl6tD21tO8QlNkO0SjexvPUSC6fp17gA
Date: Tue, 14 Jan 2020 08:40:10 +0000
Message-ID: <2C251055-D2D2-419A-9040-C43EC0DC8BBE@amazon.com>
References: <20200113221227.20857-1-julien@xen.org>
In-Reply-To: <20200113221227.20857-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.141]
Content-ID: <47B4DE8750F8A54383EA0D32756DBF64@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEzLiBKYW4gMjAyMCwgYXQgMjM6MTIsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOgo+IAo+IHBhbmRvYyBpcyBjdXJyZW50bHkgZmFpbGluZyB0byBnZW5lcmF0ZSB0
aGUgcGRmIHdpdGggdGhlIGZvbGxvd2luZwo+IGVycm9yOgo+ICEgVW5kZWZpbmVkIGNvbnRyb2wg
c2VxdWVuY2UuCj4gbC4xMDQ4ICAgbWV0YWRhdGEgc3RyaW5nIGZvcm1hdCBpczoga2V5PXZhbHVl
XDAKPiAKPiBJbiB0aGlzIGNhc2UsIHdlIHdhbnQgdG8gcHJpbnQgXDAgc28gd2UgbmVlZCB0byBi
YWNrc2xhc2gtZXNjYXBlIHRoZQo+IGZpcnN0IGNoYXJhY3Rlci4KPiAKPiBJbnRlcmVzdGluZ2x5
IHBhbmRvYyB3aWxsIG5vdCBjb21wbGFpbiB3aGVuIGNyZWF0aW5nIGh0bWwgYW5kIHdpbGwganVz
dAo+IGlnbm9yZSBcMCBjb21wbGV0ZWx5Lgo+IAo+IEZpeGVzOiA1MDgzZTBmZjkzICgibGl2ZXBh
dGNoOiBBZGQgbWV0YWRhdGEgcnVudGltZSByZXRyaWV2YWwgbWVjaGFuaXNtIikKPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENjOiBQYXdlbCBXaWVjem9y
a2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gLS0tCj4gZG9jcy9taXNjL2xpdmVwYXRjaC5w
YW5kb2MgfCAyICstCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jIGIvZG9jcy9t
aXNjL2xpdmVwYXRjaC5wYW5kb2MKPiBpbmRleCAyZjNmOTVlZDM3Li45NDczYWQ1OTkxIDEwMDY0
NAo+IC0tLSBhL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL2xp
dmVwYXRjaC5wYW5kb2MKPiBAQCAtNzM5LDcgKzczOSw3IEBAIFRoZSBjYWxsZXIgcHJvdmlkZXM6
Cj4gICAgQ2FsbGVyICpNVVNUKiBhbGxvY2F0ZSBlbm91Z2ggc3BhY2UgdG8gYmUgYWJsZSB0byBz
dG9yZSBhbGwgcmVjZWl2ZWQgZGF0YQo+ICAgIChpLmUuIHRvdGFsIGFsbG9jYXRlZCBzcGFjZSAq
TVVTVCogbWF0Y2ggdGhlIGBtZXRhZGF0YV90b3RhbF9zaXplYCB2YWx1ZQo+ICAgIHByb3ZpZGVk
IGJ5IHRoZSBoeXBlcnZpc29yKS4gSW5kaXZpZHVhbCBwYXlsb2FkIG1ldGFkYXRhIHN0cmluZyBj
YW4gYmUgb2YKPiAtICAgYXJiaXRyYXJ5IGxlbmd0aC4gVGhlIG1ldGFkYXRhIHN0cmluZyBmb3Jt
YXQgaXM6IGtleT12YWx1ZVwwLi4ua2V5PXZhbHVlXDAuCj4gKyAgIGFyYml0cmFyeSBsZW5ndGgu
IFRoZSBtZXRhZGF0YSBzdHJpbmcgZm9ybWF0IGlzOiBrZXk9dmFsdWVcXDAuLi5rZXk9dmFsdWVc
XDAuCj4gICogYG1ldGFkYXRhX2xlbmAgLSBWaXJ0dWFsIGFkZHJlc3Mgb2Ygd2hlcmUgdG8gd3Jp
dGUgdGhlIGxlbmd0aCBvZiBlYWNoIG1ldGFkYXRhCj4gICAgc3RyaW5nIG9mIHRoZSBwYXlsb2Fk
LiBDYWxsZXIgKk1VU1QqIGFsbG9jYXRlIHVwIHRvIGBucmAgb2YgdGhlbS4gRWFjaCAqTVVTVCoK
PiAgICBiZSBvZiBzaXplb2YodWludDMyX3QpICg0IGJ5dGVzKS4KPiAtLSAKPiAyLjE3LjEKPiAK
CgpTb3JyeSBmb3IgeWV0IGFub3RoZXIgcHJvYmxlbS4uLgoKUmV2aWV3ZWQtYnk6IFBhd2VsIFdp
ZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KCgoKCgoKCkFtYXpvbiBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFl
ZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
