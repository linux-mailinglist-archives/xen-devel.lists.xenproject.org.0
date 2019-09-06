Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3815DAB951
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:34:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EKp-000337-Uq; Fri, 06 Sep 2019 13:31:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6EKp-000332-9B
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:31:31 +0000
X-Inumbo-ID: a1a38006-d0aa-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1a38006-d0aa-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 13:31:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37618B021;
 Fri,  6 Sep 2019 13:31:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190905190418.15142-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09dc64fe-56c7-c81a-9b78-eb8c94a7748e@suse.com>
Date: Fri, 6 Sep 2019 15:31:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905190418.15142-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Don't explicitly map the VGA
 region as UC-
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAyMTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBbGwgNjQtYml0IGNh
cGFibGUgcHJvY2Vzc29ycyB1c2UgUEFULCBhbmQgd2l0aCBQQVQsIGl0IGlzIGV4cGxpY2l0bHkK
PiBwZXJtaXR0ZWQgdG8gaGF2ZSBtYXBwaW5ncyB3aXRoIGEgY2FjaGVhYmlsaXR5IGRpZmZlcmVu
dCB0byBNVFJScy4KPiAKPiBPbiBhIG5hdGl2ZSBzeXN0ZW0gd2l0aCBhIHJlYWwgbGVnYWN5IFZH
QSByZWdpb24sIE1UUlJzIHdpbGwgY2F1c2UgdGhlIHJlZ2lvbgo+IHRvIGJlIFVDLS4KCk1pbm9y
IGNvcnJlY3Rpb246IE1UUlJzIGNhbid0IGJlIHVzZWQgdG8gc3BlY2lmeSBVQy0uIFVDLSBpcyB1
c2VkIGluClBBVCB0byBhbGxvdyBXQyBmcm9tIE1UUlJzIHRvIGJlIHJldGFpbmVkLCByYXRoZXIg
dGhhbiBiZWNvbWluZyBVQy4KQW5kIGhlbmNlIHNlbnNpYmxlIEJJT1NlcyB3b3VsZCBtYWtlIHRo
aXMgcmFuZ2UgV0MgaW4gdGhlIE1UUlJzLCBub3QKVUMuCgpUaGUgbWFpbiBxdWVzdGlvbiBoZXJl
IGlzIHdoZXRoZXIgd2UgY2FuIHJlbHkgb24gZmlybXdhcmUgdG8gYWN0dWFsbHkKc2V0IE1UUlJz
IGNvcnJlY3RseS4KCj4gIFdoZW4gYm9vdGluZyB2aXJ0dWFsaXNlZCwgdGhpcyByYW5nZSBtYXkg
YmUgUkFNIGFuZCBub3QgYSBsZWdhY3kKPiBWR0EgcmVnaW9uLCBhdCB3aGljaCBwb2ludCBpdCB3
YW50cyB0byBiZSBXQi4KClRvIGxpbWl0IHRoZSBlZmZlY3Qgb2YgaW1wcm9wZXIgTVRSUiBzZXR0
aW5ncywgZGlkIHlvdSBjb25zaWRlciB1c2luZwpXVCBpbnN0ZWFkPyBGdXJ0aGVybW9yZSwgZGlk
IHlvdSBjb25zaWRlciBkeW5hbWljYWxseSBjaGFuZ2luZyB0aGUKaW52b2x2ZWQgUFRFcyBkZXBl
bmRpbmcgb24gd2hldGhlciB3ZSBydW4gdmlydHVhbGl6ZWQgb3Vyc2VsdmVzPwoKPiBVc2UgV0Ig
bWFwcGluZyBpbiB0aGUgcGFnZXRhYmxlcywgc3VjaCB0aGF0IGluIHN5c3RlbXMgd2l0aG91dCBh
IGxlZ2FjeSBWR0EKPiByZWdpb24sIHRoZSBSQU0gYmV0d2VlbiAweGEwMDAwIGFuZCAweGMwMDAw
IGRvZXNuJ3QgYmVjb21lIHVubmVjZXNzZXJpbHkgVUMtLgoKTWF5IEkgc3VnZ2VzdCBzL1JBTS9y
YW5nZS8gPyBUaGVyZSdzIG5vIGd1YXJhbnRlZSB0aGF0IHdoZW4gdGhlcmUncwpubyBWR0EgdGhl
cmUsIHRoYXQgaXQgd291bGQgYmUgUkFNIGluc3RlYWQuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
