Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02C13AE04
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 16:50:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOPy-0007Oe-A7; Tue, 14 Jan 2020 15:47:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irOPw-0007OZ-Ek
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 15:47:44 +0000
X-Inumbo-ID: 31c09e6c-36e5-11ea-83e9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31c09e6c-36e5-11ea-83e9-12813bfff9fa;
 Tue, 14 Jan 2020 15:47:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65C10AB7D;
 Tue, 14 Jan 2020 15:47:39 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
Date: Tue, 14 Jan 2020 16:47:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109134825.31482-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxNDo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1Zwo+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnCj4gQEAgLTgxLDYgKzgxLDEyIEBA
IGNvbmZpZyBQRVJGX0FSUkFZUwo+ICAJLS0taGVscC0tLQo+ICAJICBFbmFibGVzIHNvZnR3YXJl
IHBlcmZvcm1hbmNlIGNvdW50ZXIgYXJyYXkgaGlzdG9ncmFtcy4KPiAgCj4gK2NvbmZpZyBERUJV
R19CVUdWRVJCT1NFCj4gKwlib29sICJWZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKPiArCWRlZmF1
bHQgREVCVUcKPiArCS0tLWhlbHAtLS0KPiArCSAgSW4gY2FzZSBhIEJVR19PTiB0cmlnZ2VycyBh
ZGRpdGlvbmFsbHkgcHJpbnQgdGhlIHRyaWdnZXJpbmcKPiArCSAgY29uZGl0aW9uIG9uIHRoZSBj
b25zb2xlLgo+ICAKPiAgY29uZmlnIFZFUkJPU0VfREVCVUcKCldoaWxlIEkgY2FuIHNlZSByZWFz
b25zIHRvIHB1dCB0aGlzIGhlcmUsIGRvaW5nIHNvIG1lYW5zIHRoZSBvcHRpb24Kd2lsbCBiZSB1
bmF2YWlsYWJsZSBpbiBub24tRVhQRVJUIHJlbGVhc2UgYnVpbGRzLiBJcyBpdCBpbnRlbmRlZCB0
bwpiZSB0aGF0IHdheT8KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2xpYi5oCj4gQEAgLTgsNyArOCwxMiBAQAo+ICAjaW5jbHVkZSA8eGVuL3N0
cmluZy5oPgo+ICAjaW5jbHVkZSA8YXNtL2J1Zy5oPgo+ICAKPiArI2RlZmluZSBCVUdfT05fVkVS
Qk9TRShwKSBkbyB7IGlmICh1bmxpa2VseShwKSkgQlVHX1ZFUkJPU0UoI3ApOyAgfSB3aGlsZSAo
MCkKPiArI2lmZGVmIENPTkZJR19ERUJVR19CVUdWRVJCT1NFCj4gKyNkZWZpbmUgQlVHX09OKHAp
ICBCVUdfT05fVkVSQk9TRShwKQoKTG9va3MgbGlrZSB0aGlzIHdpbGwgZmFpbCB0byBidWlsZCBv
biBBcm0/IEFsc28gLSBhbnkgcGFydGljdWxhcgpyZWFzb24gZm9yIHRoZSBpbnRyb2R1Y3Rpb24g
b2YgdGhlIHNlcGFyYXRlIEJVR19PTl9WRVJCT1NFKCksCndoZW4gQlVHX09OKCkgY291bGQgZGly
ZWN0bHkgdXNlIEJVR19WRVJCT1NFKCk/IEkgZG9uJ3QgdGhpbmsgd2UKd2FudCB0byBlbmNvdXJh
Z2UgdXNlIG9mIEJVR19PTl9WRVJCT1NFKCkgZWxzZXdoZXJlIC4uLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
