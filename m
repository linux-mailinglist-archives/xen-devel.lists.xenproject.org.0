Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B491EAF9C2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zNR-0004gQ-Vs; Wed, 11 Sep 2019 09:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7zNQ-0004gJ-UB
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:57:28 +0000
X-Inumbo-ID: 8fdb503c-d47a-11e9-ac26-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fdb503c-d47a-11e9-ac26-12813bfff9fa;
 Wed, 11 Sep 2019 09:57:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33CB3B6B6;
 Wed, 11 Sep 2019 09:57:27 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
 <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
Date: Wed, 11 Sep 2019 11:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTE6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMDg6
MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3Rvb2xzL21pc2MvTWFrZWZpbGUKPj4g
KysrIGIvdG9vbHMvbWlzYy9NYWtlZmlsZQo+PiBAQCAtMjQsNiArMjQsNyBAQCBJTlNUQUxMX1NC
SU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVuLWxvd21lbWQKPj4gICBJTlNUQUxMX1NCSU4tJChD
T05GSUdfWDg2KSAgICAgKz0geGVuLW1mbmR1bXAKPj4gICBJTlNUQUxMX1NCSU4tJChDT05GSUdf
WDg2KSAgICAgKz0geGVuLXVjb2RlCj4+ICAgSU5TVEFMTF9TQklOICAgICAgICAgICAgICAgICAg
ICs9IHhlbmNvdgo+PiArSU5TVEFMTF9TQklOICAgICAgICAgICAgICAgICAgICs9IHhlbmZzCj4g
Cj4gV2h5IFNCSU4/IElzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggYWxsb3dpbmcgdW5wcml2
aWxlZ2VkCj4gdXNlcnMgci9vIGFjY2Vzcz8gT3IgaXMgdGhpcyBiZWNhdXNlIGluIG9yZGVyIHRv
IGFjY2VzcyB0aGUKPiBoeXBlcmNhbGwgaW50ZXJmYWNlIG9uZSBuZWVkcyB0byBiZSByb290PyBJ
ZiBzbywgd2UgbWF5IHdhbnQKPiB0byBjb25zaWRlciByZWxheGluZy9hdm9pZGluZy9ieXBhc3Np
bmcgdGhpcyBpbiBzb21lIHNlbnNpYmxlCj4gd2F5LgoKSW5zdGFsbGluZyB0byBiaW4gaXMgZmlu
ZSB3aXRoIG1lLCBidXQgcmVsYXhpbmcgdGhlIHJvb3QgcmVzdHJpY3Rpb24KbWlnaHQgYmUgbW9y
ZSBkaWZmaWN1bHQgYW5kL29yIHF1ZXN0aW9uYWJsZS4KCkkgd2FzIHRoaW5raW5nIG9mICJtb3Vu
dGluZyIgdGhlIHhlbi1zeXNmcyB0byBlaXRoZXIgWGVuc3RvcmUgb3IKdGhlIGtlcm5lbCdzIHN5
c2ZzIChwcm9iYWJseSB0aGUgbGF0dGVyLCBhcyBYZW5zdG9yZSBpbiBhIHN0dWJkb20Kd291bGQg
bmVlZCB0byBlbmFibGUgYWNjZXNzIHRvIHhlbi1zeXNmcyBmb3IgdGhhdCBzdHViZG9tICx0b28p
LgoKVGhpcyB3b3VsZCB0aGVuIGVuYWJsZSBhY2Nlc3Npbmcgc29tZSBvciBhbGwgZW50cmllcyBm
cm9tIG5vbi1yb290LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
