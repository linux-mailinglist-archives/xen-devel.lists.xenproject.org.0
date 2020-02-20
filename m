Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739616586D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 08:32:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4gHS-0006Pa-H8; Thu, 20 Feb 2020 07:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4gHQ-0006PV-U3
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 07:29:52 +0000
X-Inumbo-ID: c7c42de0-53b2-11ea-84e0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7c42de0-53b2-11ea-84e0-12813bfff9fa;
 Thu, 20 Feb 2020 07:29:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EFBCAE61;
 Thu, 20 Feb 2020 07:29:49 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
 <ac088c1e-0326-b72a-e1bf-582493e4e712@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6edb97c6-ed6b-589b-30a5-fb406ddf53a3@suse.com>
Date: Thu, 20 Feb 2020 08:29:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ac088c1e-0326-b72a-e1bf-582493e4e712@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen: add basic hypervisor filesystem
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTc6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAxOS8wMi8y
MDIwIDA4OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiAraW50IGh5cGZzX3dyaXRlX2Jvb2wo
c3RydWN0IGh5cGZzX2VudHJ5X2xlYWYgKmxlYWYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgdWFkZHIsIHVu
c2lnbmVkIAo+PiBsb25nIHVsZW4pCj4+ICt7Cj4+ICvCoMKgwqAgdW5pb24gewo+PiArwqDCoMKg
wqDCoMKgwqAgY2hhciBidWZbOF07Cj4+ICvCoMKgwqDCoMKgwqDCoCB1aW50OF90IHU4Owo+PiAr
wqDCoMKgwqDCoMKgwqAgdWludDE2X3QgdTE2Owo+PiArwqDCoMKgwqDCoMKgwqAgdWludDMyX3Qg
dTMyOwo+PiArwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgdTY0Owo+PiArwqDCoMKgIH0gdTsKPj4g
Kwo+PiArwqDCoMKgIEFTU0VSVChsZWFmLT5lLnR5cGUgPT0gWEVOX0hZUEZTX1RZUEVfVUlOVCAm
JiBsZWFmLT5lLnNpemUgPD0gOCk7Cj4gCj4gU2hvdWxkbid0IHRoaXMgYmUgWEVOX0hZUEZTV19U
WVBFX0JPT0w/IEJ1dCB0aGVuLCB3aHkgYXJlIHdlIGFsbG93aW5nIGEgCj4gYm9vbGVhbiBwYXJh
bWV0ZXIgdG8gYmUgaGVsZCBpbiBhIDY0LWJpdCB2YWx1ZT8KPiAKPiBJSE1PLCBhIGJvb2xlYW4g
c2hvdWxkIHJlYWxseSBiZSBob2xkIGluIGEgYm9vbCBhbmQgbm90aGluZyBlbHNlLgoKWWVzLCBh
cyBhbHJlYWR5IHJlcGxpZWQgdG8gSmFuIEknbGwgbW9kaWZ5IHRoZSBwYXJhbSBoYW5kbGluZyBm
b3IgYm9vbAp3aGljaCBhbGxvd2VkIGxhcmdlciB2YXJpYWJsZXMgYW5kIHdoaWNoIHdhcyB0aGUg
cmVhc29uIEkgYWRkZWQgdGhpcwpwb3NzaWJpbGl0eSBoZXJlLCB0b28uCgpBbmQgeWVzLCB0aGUg
dGVzdCBzaG91bGQgdXNlIFhFTl9IWVBGU1dfVFlQRV9CT09MLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
