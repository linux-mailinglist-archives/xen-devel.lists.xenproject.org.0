Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7541321E4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 10:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iokmr-0004YM-R9; Tue, 07 Jan 2020 09:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iokmr-0004YH-4Q
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 09:04:29 +0000
X-Inumbo-ID: b0ad8adc-312c-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ad8adc-312c-11ea-a1e1-bc764e2007e4;
 Tue, 07 Jan 2020 09:04:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBA27B22A;
 Tue,  7 Jan 2020 09:04:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <972bb727-be43-3326-27d5-004947446b0d@suse.com>
 <1d05df41-2e97-5e5c-5bcc-8d1b84961b95@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31d0b774-c1c0-2158-e2bf-9d0d7b28afc3@suse.com>
Date: Tue, 7 Jan 2020 10:04:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1d05df41-2e97-5e5c-5bcc-8d1b84961b95@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC v3 8/8] x86emul: support MCOMMIT
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAyMDo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE2OjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGRlcGVuZGVuY3kgb24gYSBuZXcgRUZF
UiBiaXQgaW1wbGllcyB0aGF0IHdlIG5lZWQgdG8gc2V0IHRoYXQgYml0Cj4+IG91cnNlbHZlcyBp
biBvcmRlciB0byBiZSBhYmxlIHRvIHN1Y2Nlc3NmdWxseSBpbnZva2UgdGhlIGluc24uCj4+Cj4+
IEFsc28gb25jZSBhZ2FpbiBpbnRyb2R1Y2UgdGhlIFNWTSByZWxhdGVkIGNvbnN0YW50cyBhdCB0
aGlzIG9jY2FzaW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4+IC0tLQo+PiBSRkM6IFRoZSBleGFjdCBtZWFuaW5nIG9mIHRoZSBQTSBzdGF0
aW5nICJhbnkgZXJyb3JzIGVuY291bnRlcmVkIGJ5Cj4+ICAgICAgdGhvc2Ugc3RvcmVzIGhhdmUg
YmVlbiBzaWduYWxlZCB0byBhc3NvY2lhdGVkIGVycm9yIGxvZ2dpbmcKPj4gICAgICByZXNvdXJj
ZXMiIGlzIHVuY2xlYXIuIERlcGVuZGluZyBvbiB3aGF0IHRoaXMgZW50YWlscywgYmxpbmRseQo+
PiAgICAgIGVuYWJsaW5nIEVGRVIuTUNPTU1JVCBtYXkgbm90IGJlIGEgZ29vZCBpZGVhLiBIZW5j
ZSB0aGUgUkZDLgo+IAo+IEZyb20gd2hhdCBJIGdhdGhlciwgdGhpcyBpcyBvbmx5IGdvaW5nIHRv
IGJlIHVzZWZ1bCBpbiBjb21iaW5hdGlvbiB3aXRoCj4gZnV0dXJlIGZlYXR1cmVzLgo+IAo+IFdo
aWxlIEkgaGF2ZSBubyBzcGVjaWZpYyBjb25jZXJucyBjb2RlIHdpc2UsIEknZCByZWNvbW1lbmQg
ZGVmZXJyaW5nIHRoZQo+IHBhdGNoIHVudGlsIHdlIGhhdmUgYSBiZXR0ZXIgaWRlYSBvZiBob3cg
aXQgaXMgc3VwcG9zZWQgdG8gYmUgdXNlZC7CoAoKUmlnaHQgLSBoZW5jZSB0aGUgUkZDLiBJIGhh
dmUgYSBzdXBwb3NlZC10by1iZS11c2VkIGlucXVpcnkgcGVuZGluZwp3aXRoIEFNRC4KCj4gKEVz
cGVjaWFsbHkgZ2l2ZW4gdGhlIFBDT01NSVQgZGViYWNsZSBvbiBJbnRlbC4pCgo7LSkKCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
