Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E966F13D773
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 11:03:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1wV-0000zj-R2; Thu, 16 Jan 2020 09:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is1wU-0000ze-JZ
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:59:58 +0000
X-Inumbo-ID: eefcc6ce-3846-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eefcc6ce-3846-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 09:59:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BC56AED8;
 Thu, 16 Jan 2020 09:59:49 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <f8104de4-1323-fa8f-5f8a-de73a9ce63e0@suse.com>
 <e9e082e9c1a94b7a88ab45cfda5c06d7@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bc00a86-21ca-0947-ef29-9ae7a33aec5f@suse.com>
Date: Thu, 16 Jan 2020 10:59:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e9e082e9c1a94b7a88ab45cfda5c06d7@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxMDo0NiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAxNiBKYW51YXJ5IDIwMjAgMTA6NDAKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
SWFuIEphY2tzb24KPj4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsgQW50aG9ueSBQRVJBUkQKPj4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsKPj4gR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsCj4+IDxqdWxpZW5A
eGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8KPj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IGphbmRyeXVr
QGdtYWlsLmNvbQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhCj4+IHNwZWNpZmllZCBvciByYW5kb20gZG9taWQKPj4K
Pj4gT24gMTYuMDEuMjAyMCAxMDozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL3hlbi5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgK
Pj4+IEBAIC02MTQsNiArNjE0LDkgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobW11ZXh0X29w
X3QpOwo+Pj4gIC8qIElkbGUgZG9tYWluLiAqLwo+Pj4gICNkZWZpbmUgRE9NSURfSURMRSAgICAg
ICAgICAgeGVuX21rX3VpbnQoMHg3RkZGKQo+Pj4KPj4+ICsvKiBNYXNrIGZvciB2YWxpZCBkb21h
aW4gaWQgdmFsdWVzICovCj4+PiArI2RlZmluZSBET01JRF9NQVNLICAgICAgICAgICAweDdGRkYK
Pj4KPj4gU2VlaW5nIGl0IHVzZWQgaW4gY29udGV4dCwgYW55IHJlYXNvbiBub3QgdG8gdXNlIHhl
bl9ta191aW50KCkKPj4gaGVyZSBhcyB3ZWxsPwo+Pgo+IAo+IEkgZGlkIHdvbmRlciBidXQgSSB0
aG91Z2h0IGl0IGJlc3Qgbm90IHRvIGltcG9zZSBhIHR5cGUgb24gYSBtYXNrLgoKSSdkIGJlIGhh
cHB5IHRvIHNlZSB0aGUgb3RoZXIgRE9NSURfKiB1c2VzIGRyb3BwZWQgKEkgZG9uJ3Qgc2VlCndo
ZXkgdGhleSBoYWQgYSBVIHN1ZmZpeCBvcmlnaW5hbGx5LCB3aGljaCB3YXMgdGhlbiBjb252ZXJ0
ZWQKdG8geGVuX21rX3VpbnQoKSksIGJ1dCBJJ2QgcHJlZmVyIHRoZSBlbnRpcmUgc2V0IHRvIGJl
IGNvbnNpc3RlbnQuCkkgY2FuIHNlZSBpbiBnZW5lcmFsIHdoeSBhIG1hc2sgbWlnaHQgYmV0dGVy
IG5vdCBiZSBleHBsaWNpdGx5CihvciBpbXBsaWNpdGx5KSB1bnNpZ25lZCwgYnV0IGhlcmUgSSBk
b24ndCByZWFsbHkgc2VlIHBsYXVzaWJsZQp1c2VzIG9mIH4gb24gdGhlIG1hc2suCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
