Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E6E2F72
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 12:52:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNahm-0005t8-5N; Thu, 24 Oct 2019 10:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNahk-0005t2-Le
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:50:56 +0000
X-Inumbo-ID: 26727079-f64c-11e9-949b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26727079-f64c-11e9-949b-12813bfff9fa;
 Thu, 24 Oct 2019 10:50:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80CC0BCC9;
 Thu, 24 Oct 2019 10:50:54 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <23985.33157.424790.599253@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9dba76f6-a964-8d8e-62f0-08429a2b0725@suse.com>
Date: Thu, 24 Oct 2019 12:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <23985.33157.424790.599253@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTI6NDgsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQzMDYxOiByZWdyZXNz
aW9ucyAtIHRyb3VibGU6IGJyb2tlbi9mYWlsL3Bhc3MiKToKPj4gT24gMjQuMTAuMTkgMDg6NDcs
IG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPj4+ICAgIHRlc3QtYXJtNjQtYXJtNjQtZXhh
bWluZSAgICAxMSBleGFtaW5lLXNlcmlhbC9ib290bG9hZGVyIGZhaWwgUkVHUi4gdnMuIDE0Mjc1
MAo+Pgo+PiBJJ20gbm90IHN1cmUgd2hhdCBoYXMgZ29uZSB3cm9uZyBoZXJlPyBUaGUgc2VyaWFs
IGxvZ3Mgc2VlbSB0byBiZSBmaW5lCj4+IGZvciBtZSwgYnV0IG1heWJlIEknbSBtaXNzaW5nIHNv
bWV0aGluZz8KPiAKPiBUaGVyZSBpcyBhIGtub3duIGJ1ZyB3aXRoIHR3byBvZiBvdXIgYXJtNjQg
Ym94ZXMsIHdoZXJlIHRoZXkgbG9zZSBzb21lCj4gb2YgdGhlIG91dHB1dCBkdXJpbmcgYm9vdC4g
IFRoaXMgaXMgbm90IGltcG9ydGFudCBmb3Igb3BlcmF0aW9uYWwgdXNlCj4gb2YgdGhvc2UgYm94
ZXMgaW4gYSBub3JtYWwgY29udGV4dCwgYnV0IGluIG91ciBjb250ZXh0IGJlaW5nIGFibGUgdG8K
PiBnZXQgYWxsIHRoZSBib290IG1lc3NhZ2VzIGlzIGltcG9ydGFudCBmb3IgZGVidWdnaW5nIGh5
cGVydmlzb3JzIGFuZAo+IGtlcm5lbHMsIHNvIG9zc3Rlc3QgaGFzIGEgdGVzdCB0aGF0IHRoaXMg
d29ya3MgcHJvcGVybHkuICBJdCBpcyB0aGF0Cj4gdGVzdCB0aGF0IGZhaWxzLgo+IAo+IElmIHRo
aXMgaXMgdGhlIG9ubHkgZmFpbHVyZSwgd2Ugc2hvdWxkIGZvcmNlIHB1c2guCgpBZ3JlZWQuIENh
biB5b3UgZG8gc28sIHBsZWFzZT8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
