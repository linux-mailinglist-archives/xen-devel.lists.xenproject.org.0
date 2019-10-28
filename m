Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B90E70B8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:49:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3Tv-00079x-4e; Mon, 28 Oct 2019 11:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP3Tt-00079s-R5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:46:41 +0000
X-Inumbo-ID: 9af775e1-f978-11e9-94f5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9af775e1-f978-11e9-94f5-12813bfff9fa;
 Mon, 28 Oct 2019 11:46:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE275B33D;
 Mon, 28 Oct 2019 11:46:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
 <7333496f-48e7-c659-5314-54feffde0273@suse.com>
 <15969ed4-55ab-0a18-3b63-30cc3c266a47@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f505d7e-4715-24cf-906e-6acb7c81a5c1@suse.com>
Date: Mon, 28 Oct 2019 12:46:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15969ed4-55ab-0a18-3b63-30cc3c266a47@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxMjoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbmUgb3B0aW9uIHdo
aWNoIHdhcyBleHBlcmltZW50ZWQgd2l0aCB3YXMgY2xlYXJpbmcgSFRUIHVzaW5nIHRoZSBjcHVp
ZD0KPiBjb250cm9sLCBidXQgdGhhdCBkaWRuJ3Qgd29yay7CoCBJIHRoaW5rIGEgdXNlciBIVFQg
c2V0dGluZyBnZXRzCj4gY2xvYmJlcmVkIGJ5IHRoZSBsYXRlciBDUFVJRCBsb2dpYy7CoCBQZXJo
YXBzIHRoYXQgaXMgc29tZXRoaW5nIHdlIGNvdWxkCj4gYm9kZ2UgaW4gYSBsZXNzIGJhZCB3YXku
CgpSaWdodCAtIHRoYXQncyB3aGF0IEkgdG9vIHdhcyB0aGlua2luZyBvZjogTWFrZSBzdXJlIGFu
IGV4cGxpY2l0CkhUVCBzZXR0aW5nIGluIHRoZSBndWVzdCBjb25maWcgZ2V0cyBob25vcmVkLiBX
aGF0IHdlIHRoZW4gbmVlZAp0byBob3BlIGZvciBpcyBmb3IgcGVvcGxlIHRvIG5vdCBoYXZlIHN1
Y2ggaW4gdGhlaXIgY29uZmlncwphbHJlYWR5LCBzZWVpbmcgdGhhdCBpdCBzaW1wbHkgZ2V0cyBp
Z25vcmVkIHJpZ2h0IG5vdy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
