Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A06105074
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:24:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjbv-0004li-88; Thu, 21 Nov 2019 10:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXjbu-0004ld-N6
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:22:50 +0000
X-Inumbo-ID: de2fca50-0c48-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de2fca50-0c48-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 10:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1831FB23A;
 Thu, 21 Nov 2019 10:22:49 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191121101904.10295-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf9611eb-e0a6-7d10-bde9-d4ccf8cbca80@suse.com>
Date: Thu, 21 Nov 2019 11:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121101904.10295-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxMToxOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgY29k
ZSB1bmNvbmRpdGlvbmFsbHkgcHJldmVudHMgc2V0dGluZyBBUElDX1NQSVZfRk9DVVNfRElTQUJM
RUQKPiByZWdhcmRsZXNzIG9mIHRoZSBwcm9jZXNzb3IgbW9kZWwsIHdoaWNoIGlzIG5vdCBjb3Jy
ZWN0IGFjY29yZGluZyB0bwo+IHRoZSBzcGVjaWZpY2F0aW9uLgo+IAo+IFRoaXMgaXNzdWUgd2Fz
IGRpc2NvdmVyZWQgd2hpbGUgdHJ5aW5nIHRvIGJvb3QgYSBwdnNoaW0gd2l0aCB4MkFQSUMKPiBl
bmFibGVkLgo+IAo+IEFsd2F5cyBhbGxvdyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxF
RDogdGhlIGxvY2FsIEFQSUMKPiBwcm92aWRlZCB0byBndWVzdHMgaXMgZW11bGF0ZWQgYnkgWGVu
LCBhbmQgYXMgc3VjaCBkb2Vzbid0IGRlcGVuZCBvbgo+IHRoZSBmZWF0dXJlcyBmb3VuZCBvbiB0
aGUgaGFyZHdhcmUgcHJvY2Vzc29yLiBOb3RlIGZvciBleGFtcGxlIHRoYXQKPiBYZW4gb2ZmZXJz
IHgyQVBJQyBzdXBwb3J0IHRvIGd1ZXN0cyBldmVuIHdoZW4gdGhlIHVuZGVybHlpbmcgaGFyZHdh
cmUKPiBkb2Vzbid0IGhhdmUgc3VjaCBmZWF0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
