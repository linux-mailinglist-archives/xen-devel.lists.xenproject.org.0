Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4A1659F1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:14:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hsC-0001Du-OR; Thu, 20 Feb 2020 09:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4hsB-0001Dp-A3
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:11:55 +0000
X-Inumbo-ID: 09b965c2-53c1-11ea-84ea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09b965c2-53c1-11ea-84ea-12813bfff9fa;
 Thu, 20 Feb 2020 09:11:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D983B461;
 Thu, 20 Feb 2020 09:11:54 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-9-jgross@suse.com>
 <28a1b6e6-2d55-999a-ff23-caae5d0e8c08@suse.com>
 <7f14b966-2494-870a-b35c-23ea44e9989b@suse.com>
 <6f398a33-30a7-aa98-0981-1a9f7dd2884e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <95ba1296-6175-3375-c078-3c7408d0885c@suse.com>
Date: Thu, 20 Feb 2020 10:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6f398a33-30a7-aa98-0981-1a9f7dd2884e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 8/8] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAgMDk6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIwLjAyLjIwMjAgMDk6
MjIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE5LjAyLjIwIDE3OjQ0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE5LjAyLjIwMjAgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS94
ZW4ubGRzLlMKPj4+PiBAQCAtODksNiArODksMTEgQEAgU0VDVElPTlMKPj4+PiAgICAgICAgICAg
X19zdGFydF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKPj4+PiAgICAgICAgICAgKiguZGF0YS5zY2hl
ZHVsZXJzKQo+Pj4+ICAgICAgICAgICBfX2VuZF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKPj4+PiAr
Cj4+Pj4gKyAgICAgICAuID0gQUxJR04oOCk7Cj4+Pj4gKyAgICAgICBfX3BhcmFtaHlwZnNfc3Rh
cnQgPSAuOwo+Pj4+ICsgICAgICAgKiguZGF0YS5wYXJhbWh5cGZzKQo+Pj4+ICsgICAgICAgX19w
YXJhbWh5cGZzX2VuZCA9IC47Cj4+Pgo+Pj4gRG8geW91IHJlYWxseSBuZWVkIDgtYnl0ZSBhbGln
bm1lbnQgZXZlbiBvbiAzMi1iaXQgQXJtPwo+Pgo+PiBJIGp1c3QgZm9sbG93ZWQgdGhlIGdlbmVy
YWwgcGF0dGVybiBpbiB0aGlzIGZpbGUuCj4gCj4gV2VsbCwgaXQnbGwgYmUgdGhlIEFybSBtYWlu
dGFpbmVycyB0byBqdWRnZSBhbnl3YXkuIEl0IG1lcmVseQo+IGNhdWdodCBteSBleWUuCj4gCj4+
Pj4gQEAgLTk5LDI4ICsxMDEsMzMgQEAgc3RhdGljIGludCBwYXJzZV9nbnR0YWJfbGltaXQoY29u
c3QgY2hhciAqcGFyYW0sIGNvbnN0IGNoYXIgKmFyZywKPj4+PiAgICAgICAgICAgIHJldHVybiAt
RVJBTkdFOwo+Pj4+ICAgIAo+Pj4+ICAgICAgICAqdmFscCA9IHZhbDsKPj4+PiArICAgIHNucHJp
bnRmKHBhcl92YWwsIFBBUl9WQUxfU1osICIlbHUiLCB2YWwpOwo+Pj4+ICAgIAo+Pj4+ICAgICAg
ICByZXR1cm4gMDsKPj4+PiAgICB9Cj4+Pj4gICAgCj4+Pj4gICAgdW5zaWduZWQgaW50IF9fcmVh
ZF9tb3N0bHkgb3B0X21heF9ncmFudF9mcmFtZXMgPSA2NDsKPj4+PiArc3RhdGljIGNoYXIgZ250
dGFiX21heF9mcmFtZXNfdmFsW1BBUl9WQUxfU1pdID0gIjY0IjsKPj4+Cj4+PiBUaGlzIGFuZCB0
aGUgb3RoZXIgb3B0aW9uIGFyZSBwbGFpbiBpbnRlZ2VyIG9uZXMgZnJvbSBhIHByZXNlbnRhdGlv
bgo+Pj4gcG92LCBzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIGdldCBhd2F5IGhlcmUgd2l0aG91dCB0
aGUgZXh0cmEgYnVmZmVycy4KPj4KPj4gVGhlcmUgaXMgbW9yZSB0aGFuIHB1cmUgaW50ZWdlciBz
ZW1hbnRpY3MgaGVyZTogdGhlIHZhbHVlIGlzIGxpbWl0ZWQsCj4+IHNvIEkgY2FuJ3QganVzdCB1
c2UgdGhlIG5vcm1hbCBpbnRlZ2VyIGFzc2lnbm1lbnQuCj4gCj4gV2hpY2ggaXMgd2h5IEkndmUg
c2FpZCAiZnJvbSBhIHByZXNlbnRhdGlvbiBwb3YiLCBpLmUuIHdoZW4gY29uc3VtaW5nCj4gdGhl
IHZhbHVlIGZvciBwYXNzaW5nIGJhY2sgYXMgYSBzdHJpbmcuCgpIbW0sIHRoaXMgbWlnaHQgZXZl
biBiZSBwb3NzaWJsZSB2aWEgbm90IHVzaW5nIHRoZSBjb21tb24gbWFjcm8uCkknbGwgaGF2ZSBh
IGxvb2sgaW50byBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
