Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB21178DF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 22:53:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieQuM-0005XE-0V; Mon, 09 Dec 2019 21:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+0jl=Z7=amazon.com=prvs=239a55c6d=elnikety@srs-us1.protection.inumbo.net>)
 id 1ieQuL-0005X9-2P
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 21:49:33 +0000
X-Inumbo-ID: c81ea8c4-1acd-11ea-a914-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c81ea8c4-1acd-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 21:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575928173; x=1607464173;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qmiEaSe7WnfcTLIUbg2jHFCDWc83+OyWdT7eF5w/INk=;
 b=MqWV3clOsBGgSMAuCTC5J1pNVorvfnJAUEuzYfIRZXLkB0dhPuGreFbL
 44r4wNlGWJlT0VClT+RNdFYMNirjuhcihPLRrP65X7u3LSENA7GgW2Wpi
 pluskIEvE98b4kl8aTy3ffjjBUNQWaBvpB6xC/nUyGoJ+mW1DwP342rii g=;
IronPort-SDR: ZmVuZ+fRwLtbrZZKQ/Gi5InWwqH5s0dqDXJWRyROmnj2X7VIQsOLrkMq+jEeFfZtKGnXyc9s5h
 7nPu62pBgWLA==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; d="scan'208";a="12531071"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Dec 2019 21:49:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65FACA1D62; Mon,  9 Dec 2019 21:49:18 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 21:49:17 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.100) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 21:49:12 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
Date: Mon, 9 Dec 2019 22:49:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D34UWC003.ant.amazon.com (10.43.162.66) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTY6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDkvMTIvMjAxOSAw
ODo0MSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYnVp
bHRpbi11Y29kZS50eHQgYi9kb2NzL21pc2MvYnVpbHRpbi11Y29kZS50eHQKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uNDNiYjYwZDNlYgo+IAo+IEluc3RlYWQg
b2YgaW50cm9kdWNpbmcgYSBuZXcgZmlsZSwgcGxlYXNlIGV4dGVuZAo+IGRvY3MvYWRtaW4tZ3Vp
ZGUvbWljcm9jb2RlLWxvYWRpbmcucnN0Cj4gCj4gSSBoYXZlIGFuIGluLXByZXAgZG9jcy9oeXBl
cnZpc29yLWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLnJzdCBhcyB3ZWxsLAo+IHdoaWNoIEknbGwg
c2VlIGFib3V0IHBvc3RpbmcuwqAgSXQgd291bGQgYmUgYSBtb3JlIGFwcHJvcHJpYXRlIHBsYWNl
IGZvcgo+IHRoZSB0ZWNobmljYWwgZGV0YWlscy4KPiAKCkFncmVlZCEKCldoaWxlIHRoZSBleGlz
dGluZyBkb2NzL2FkbWluLWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLnJzdCBzcGVha3MgYSAKZGlm
ZmVyZW50IHRvbmUgdGhhbiB3aGF0IEkgYWRkZWQsIHRoYXQgZG9jdW1lbnRhdGlvbiBhbnl3YXkg
bmVlZHMgdG8gYmUgCnVwZGF0ZWQgd2l0aCBidWlsdGluIGlmIHN1Y2ggc3VwcG9ydCB3ZXJlIHRv
IGJlIGFkZGVkLiBJIHdpbGwgYWRqdXN0IAphY2NvcmRpbmdseS4gSWYgZG9jcy9oeXBlcnZpc29y
LWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLnJzdCBtYWtlcyBpdCBpbiAKdGltZSBmb3IgdjIgb2Yg
dGhpcyBwYXRjaCwgSSB3aWxsIHJlZmxlY3QgY2hhbmdlcyB0aGVyZSB0b28uCgo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5j
Cj4+IGluZGV4IDZjZWQyOTNkODguLjdhZmJlNDQyODYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9taWNyb2NvZGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPj4gQEAg
LTk3LDYgKzk3LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgdWNvZGVfbW9kX2Jsb2IgX19pbml0ZGF0YSB1
Y29kZV9ibG9iOwo+PiAgICAqLwo+PiAgIHN0YXRpYyBib29sX3QgX19pbml0ZGF0YSB1Y29kZV9z
Y2FuOwo+PiAgIAo+PiArI2lmZGVmIENPTkZJR19CVUlMVElOX1VDT0RFCj4+ICsvKiBidWlsdGlu
IGlzIHRoZSBkZWZhdWx0IHdoZW4gQlVJTFRJTl9VQ09ERSBpcyBzZXQgKi8KPj4gK3N0YXRpYyBi
b29sX3QgX19pbml0ZGF0YSB1Y29kZV9idWlsdGluID0gMTsKPiAKPiBib29sLCB0cnVlLgo+IAoK
V2lsbCBmaXggaW4gdjIuCgo+PiArCj4+ICtleHRlcm4gY29uc3QgY2hhciBfX2J1aWx0aW5faW50
ZWxfdWNvZGVfc3RhcnRbXSwgX19idWlsdGluX2ludGVsX3Vjb2RlX2VuZFtdOwo+PiArZXh0ZXJu
IGNvbnN0IGNoYXIgX19idWlsdGluX2FtZF91Y29kZV9zdGFydFtdLCBfX2J1aWx0aW5fYW1kX3Vj
b2RlX2VuZFtdOwo+PiArI2VuZGlmCj4+ICsKPj4gICAvKiBCeSBkZWZhdWx0LCB1Y29kZSBsb2Fk
aW5nIGlzIGRvbmUgaW4gTk1JIGhhbmRsZXIgKi8KPj4gICBzdGF0aWMgYm9vbCB1Y29kZV9pbl9u
bWkgPSB0cnVlOwo+PiAgIAo+PiBAQCAtMTEwLDkgKzExOCw5IEBAIHZvaWQgX19pbml0IG1pY3Jv
Y29kZV9zZXRfbW9kdWxlKHVuc2lnbmVkIGludCBpZHgpCj4+ICAgfQo+PiAgIAo+PiAgIC8qCj4+
IC0gKiBUaGUgZm9ybWF0IGlzICdbPGludGVnZXI+fHNjYW49PGJvb2w+LCBubWk9PGJvb2w+XScu
IEJvdGggb3B0aW9ucyBhcmUKPj4gLSAqIG9wdGlvbmFsLiBJZiB0aGUgRUZJIGhhcyBmb3JjZWQg
d2hpY2ggb2YgdGhlIG11bHRpYm9vdCBwYXlsb2FkcyBpcyB0byBiZQo+PiAtICogdXNlZCwgb25s
eSBubWk9PGJvb2w+IGlzIHBhcnNlZC4KPj4gKyAqIFRoZSBmb3JtYXQgaXMgJ1s8aW50ZWdlcj58
c2Nhbj08Ym9vbD58YnVpbHRpbj08Ym9vbD4sIG5taT08Ym9vbD5dJy4gQWxsCj4+ICsgKiBvcHRp
b25zIGFyZSBvcHRpb25hbC4gSWYgdGhlIEVGSSBoYXMgZm9yY2VkIHdoaWNoIG9mIHRoZSBtdWx0
aWJvb3QgcGF5bG9hZHMKPj4gKyAqIGlzIHRvIGJlIHVzZWQsIG9ubHkgbm1pPTxib29sPiBpcyBw
YXJzZWQuCj4+ICAgICovCj4gCj4gUGxlYXNlIGRlbGV0ZSB0aGlzLCBvciBJJ2xsIGRvIGEgcHJl
cmVxIHBhdGNoIHRvIGZpeCBpdCBhbmQgdGhlIGNvbW1hbmQKPiBsaW5lIGRvY3MuwqAgKEJvdGgg
YXJlIGluIGEgcG9vciBzdGF0ZS4pCj4gCgpVbmxlc3MgeW91IGFyZSBwbGFubmluZyB0aGF0IGFs
b25nIHlvdXIgb24tZ29pbmcgCmRvY3MvaHlwZXJ2aXNvci1ndWlkZS9taWNyb2NvZGUtbG9hZGlu
Zy5yc3QgZWZmb3J0LCBJIGNhbiBwaWNrIHVwIHRoaXMgCmNsZWFuLXVwL3ByZXJlcSBwYXRjaCBt
eXNlbGYuIFdoYXQgZG8geW91IGhhdmUgaW4gbWluZD8gKE9yIHBvaW50IG1lIHRvIAphIGdvb2Qg
ZXhhbXBsZSBhbmQgSSB3aWxsIGZpZ3VyZSB0aGluZ3Mgb3V0KS4KCj4+IEBAIC0yMzcsNiArMjQ5
LDQ4IEBAIHZvaWQgX19pbml0IG1pY3JvY29kZV9ncmFiX21vZHVsZSgKPj4gICBzY2FuOgo+PiAg
ICAgICBpZiAoIHVjb2RlX3NjYW4gKQo+PiAgICAgICAgICAgbWljcm9jb2RlX3NjYW5fbW9kdWxl
KG1vZHVsZV9tYXAsIG1iaSk7Cj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfQlVJTFRJTl9VQ09ERQo+
PiArICAgIC8qCj4+ICsgICAgICogRG8gbm90IHVzZSB0aGUgYnVpbHRpbiBtaWNyb2NvZGUgaWY6
Cj4+ICsgICAgICogKGEpIGJ1aWx0aW4gaGFzIGJlZW4gZXhwbGljaXRseSB0dXJuZWQgb2ZmIChl
LmcuLCB1Y29kZT1uby1idWlsdGluKQo+PiArICAgICAqIChiKSBhIG1pY3JvY29kZSBtb2R1bGUg
aGFzIGJlZW4gc3BlY2lmaWVkIG9yIGEgc2NhbiBpcyBzdWNjZXNzZnVsCj4+ICsgICAgICovCj4+
ICsgICAgaWYgKCAhdWNvZGVfYnVpbHRpbiB8fCB1Y29kZV9tb2QubW9kX2VuZCB8fCB1Y29kZV9i
bG9iLnNpemUgKQo+PiArICAgICAgICByZXR1cm47Cj4+ICsKPj4gKyAgICAvKiBTZXQgdWNvZGVf
c3RhcnQvX2VuZCB0byB0aGUgcHJvcGVyIGJsb2IgKi8KPj4gKyAgICBpZiAoIGJvb3RfY3B1X2Rh
dGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCApCj4+ICsgICAgICAgIHVjb2RlX2Jsb2Iu
c2l6ZSA9IChzaXplX3QpKF9fYnVpbHRpbl9hbWRfdWNvZGVfZW5kCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gX19idWlsdGluX2FtZF91Y29kZV9zdGFydCk7Cj4gCj4g
Tm8gbmVlZCB0byBjYXN0IHRoZSByZXN1bHQuwqAgQWxzbywgcHJlZmVycmVkIFhlbiBzdHlsZSB3
b3VsZCBiZSB0byBoYXZlCj4gLSBvbiB0aGUgcHJlY2VkaW5nIGxpbmUuCj4gCgpXaWxsIGZpeCBp
biB2Mi4KCj4+ICsgICAgZWxzZSBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZf
VkVORE9SX0lOVEVMICkKPj4gKyAgICAgICAgdWNvZGVfYmxvYi5zaXplID0gKHNpemVfdCkoX19i
dWlsdGluX2ludGVsX3Vjb2RlX2VuZAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIF9fYnVpbHRpbl9pbnRlbF91Y29kZV9zdGFydCk7Cj4+ICsgICAgZWxzZQo+PiArICAg
ICAgICByZXR1cm47Cj4+ICsKPj4gKyAgICBpZiAoICF1Y29kZV9ibG9iLnNpemUgKQo+PiArICAg
IHsKPj4gKyAgICAgICAgcHJpbnRrKCJObyBidWlsdGluIHVjb2RlISAndWNvZGU9YnVpbHRpbicg
aXMgbnVsbGlmaWVkLlxuIik7Cj4+ICsgICAgICAgIHJldHVybjsKPj4gKyAgICB9Cj4+ICsgICAg
ZWxzZSBpZiAoIHVjb2RlX2Jsb2Iuc2l6ZSA+IE1BWF9FQVJMWV9DUElPX01JQ1JPQ09ERSApCj4+
ICsgICAgewo+PiArICAgICAgICBwcmludGsoIkJ1aWx0aW4gbWljcm9jb2RlIHBheWxvYWQgdG9v
IGJpZyEgKCVsZCwgd2UgY2FuIGRvICVkKVxuIiwKPj4gKyAgICAgICAgICAgICAgIHVjb2RlX2Js
b2Iuc2l6ZSwgTUFYX0VBUkxZX0NQSU9fTUlDUk9DT0RFKTsKPj4gKyAgICAgICAgdWNvZGVfYmxv
Yi5zaXplID0gMDsKPj4gKyAgICAgICAgcmV0dXJuOwo+PiArICAgIH0KPj4gKwo+PiArICAgIHVj
b2RlX2Jsb2IuZGF0YSA9IHhtYWxsb2NfYnl0ZXModWNvZGVfYmxvYi5zaXplKTsKPj4gKyAgICBp
ZiAoICF1Y29kZV9ibG9iLmRhdGEgKQo+PiArICAgICAgICByZXR1cm47Cj4gCj4gQW55IGNoYW5j
ZSB3ZSBjYW4gcmV1c2UgdGhlICJmaXRzIiBsb2dpYyB0byBhdm9pZCBob2xkaW5nIGV2ZXJ5Cj4g
aW5hcHBsaWNhYmxlIGJsb2IgaW4gbWVtb3J5IGFzIHdlbGw/Cj4gCgpJIHRoaW5rIHRoaXMgd291
bGQgYmUgYSB3ZWxjb21lZCBjaGFuZ2UuIEl0IHNlZW1zIHRvIG1lIHRoYXQgd2UgaGF2ZSB0d28g
CndheXMgdG8gZ28gYWJvdXQgaXQuCgoxKSBXZSBmYWN0b3IgdGhlIGNvZGUgaW4gdGhlIGludGVs
LS9hbWQtc3BlY2lmaWMgY3B1X3JlcXVlc3RfbWljcm9jb2RlIAp0byBleHRyYWN0IGxvZ2ljIGZv
ciBmaW5kaW5nIGEgbWF0Y2ggaW50byBpdHMgb3duIG5ldyBmdW5jdGlvbiwgZXhwb3NlIAp0aGF0
IHRocm91Z2ggbWljcm9jb2RlX29wcywgYW5kIGZpbmFsbHkgZG8geGFsbG9jIG9ubHkgZm9yIHRo
ZSBtYXRjaGluZyAKbWljcm9jb2RlIHdoZW4gZWFybHkgbG9hZGluZyBpcyBzY2FuIG9yIGJ1aWx0
aW4uCgoyKSBDYW5ub3Qgd2UganVzdCBkbyBhd2F5IGNvbXBsZXRlbHkgd2l0aCB4YWxsb2M/IEkg
c2VlIHRoYXQgZWFjaCAKaW5kaXZpZHVhbCBtaWNyb2NvZGUgdXBkYXRlIGdldHMgYWxsb2NhdGVk
IGFueXdheSBpbiAKbWljcm9jb2RlX2ludGVsLmMvZ2V0X25leHRfdWNvZGVfZnJvbV9idWZmZXIo
KSBhbmQgaW4gCm1pY3JvY29kZV9hbWQuYy9jcHVfcmVxdWVzdF9taWNyb2NvZGUoKS4gVW5sZXNz
IEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIAp0aGUgeG1hbGxvY19ieXRlcyBmb3IgdWNvZGVfYmxv
Yi5kYXRhIGlzIHJlZHVuZGFudC4KClRob3VnaHRzPwoKPj4gKwo+PiArICAgIGlmICggYm9vdF9j
cHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EICkKPj4gKyAgICAgICAgbWVtY3B5
KHVjb2RlX2Jsb2IuZGF0YSwgX19idWlsdGluX2FtZF91Y29kZV9zdGFydCwgdWNvZGVfYmxvYi5z
aXplKTsKPj4gKyAgICBlbHNlCj4+ICsgICAgICAgIG1lbWNweSh1Y29kZV9ibG9iLmRhdGEsIF9f
YnVpbHRpbl9pbnRlbF91Y29kZV9zdGFydCwgdWNvZGVfYmxvYi5zaXplKTsKPj4gKyNlbmRpZgo+
PiAgIH0KPj4gICAKPj4gICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX29wcyAqbWljcm9jb2RlX29w
czsKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUvTWFrZWZpbGUgYi94ZW4v
YXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAuLjZkNTg1YzU0ODIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi94ZW4v
YXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlCj4+IEBAIC0wLDAgKzEsNDAgQEAKPj4gKyMgQ29w
eXJpZ2h0IChDKSAyMDE5IEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuCj4+ICsj
IEF1dGhvcjogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+Cj4+ICsjCj4+ICsj
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IgbW9kaWZ5Cj4+ICsjIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4+ICsjIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4+ICsjIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4+ICsjCj4+ICsjIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+PiArIyBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZgo+PiArIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UuICBTZWUgdGhlCj4+ICsjIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCj4+ICsKPj4gK29iai15ICs9IGJ1aWx0aW5fdWNvZGUubwo+PiArCj4+ICsjIERp
cmVjdG9yeSBob2xkaW5nIHRoZSBtaWNyb2NvZGUgdXBkYXRlcy4KPj4gK1VDT0RFX0RJUj0kKHBh
dHN1YnN0ICIlIiwlLCQoQ09ORklHX0JVSUxUSU5fVUNPREVfRElSKSkKPj4gK2FtZC1ibG9icyA6
PSAkKHdpbGRjYXJkICQoVUNPREVfRElSKS9hbWQtdWNvZGUvKikKPj4gK2ludGVsLWJsb2JzIDo9
ICQod2lsZGNhcmQgJChVQ09ERV9ESVIpL2ludGVsLXVjb2RlLyopCj4gCj4gVGhpcyBpcyBhIGxp
dHRsZSBkYW5nZXJvdXMuwqAgSSBjYW4gc2VlIHdoeSB5b3Ugd2FudCB0byBkbyBpdCBsaWtlIHRo
aXMsCj4gYW5kIEkgY2FuJ3QgcHJvdmlkZSBhbnkgb2J2aW91cyBzdWdnZXN0aW9ucywgYnV0IGlm
IHRoaXMgZ2xvYiBwaWNrcyB1cAo+IGFueXRoaW5nIHdoaWNoIGlzbid0IGEgbWljcm9jb2RlIGZp
bGUsIGl0IHdpbGwgYnJlYWsgdGhlIGxvZ2ljIHRvIHNlYXJjaAo+IGZvciB0aGUgcmlnaHQgYmxv
Yi4KPiAKCldlIGNhbiBsaW1pdCB0aGUgYW1kLWJsb2JzIGFuZCBpbnRlbC1ibG9iIHRvIGJpbmFy
aWVzIGZvbGxvd2luZyB0aGUgCm5hbWluZyBjb252ZW50aW9uIEF1dGhlbnRpY0FNRC5iaW4gYW5k
IEdlbnVpbmVJbnRlbC5iaW4gZm9yIGFtZCBhbmQgCmludGVsLCByZXNwZWN0aXZlbHkuIFlldCwg
dGhpcyB3b3VsZCBiZSBpbXBvc2luZyBhbiB1bm5lY2Vzc2FyeSAKcmVzdHJpY3Rpb24gb24gYWRt
aW5pc3RyYXRvcnMgd2hvIG1heSB3YW50IHRvIGJlIGlubm92YXRpdmUgd2l0aCBuYW1pbmcgCihv
ciB3YW50IHRvIHVzZSB0aGUgbmFtaW5nIG1pY3JvY29kZV9hbWRfKi5iaW4gb3IgRkYtTU0tU1Mg
aW5zdGVhZCkuCgpBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gaW50cm9kdWNlIENPTkZJR19CVUlMVElO
X1VDT0RFX0lOVEVMIGFuZCAKQ09ORklHX0JVSUxUSU5fVUNPREVfQU1ELiBCb3RoIGRlZmF1bHQg
dG8gZW1wdHkgc3RyaW5ncy4gVGhlbiwgYW4gCmFkbWluaXN0cmF0b3IgY2FuIHNwZWNpZnkgZXhh
Y3RseSB0aGUgbWljcm9jb2RlcyB0byBpbmNsdWRlIHJlbGF0aXZlIHRvIAp0aGUgQ09ORklHX0JV
SUxUSU5fVUNPREVfRElSLiBGb3IgZXhhbXBsZToKQ09ORklHX0JVSUxUSU5fVUNPREVfSU5URUw9
ImludGVsLXVjb2RlLzA2LTNhLTA5IgpDT05GSUdfQlVJTFRJTl9VQ09ERV9BTUQ9ImFtZC11Y29k
ZS9taWNyb2NvZGVfYW1kX2ZhbTE1aC5iaW4iCgpUaG91Z2h0cz8KCj4+ICsKPj4gK2J1aWx0aW5f
dWNvZGUubzogTWFrZWZpbGUgJChhbWQtYmxvYnMpICQoaW50ZWwtYmxvYnMpCj4+ICsJIyBDcmVh
dGUgQU1EIG1pY3JvY29kZSBibG9iIGlmIHRoZXJlIGFyZSBBTUQgdXBkYXRlcyBvbiB0aGUgYnVp
bGQgc3lzdGVtCj4+ICsJaWYgWyAhIC16ICIkKGFtZC1ibG9icykiIF07IHRoZW4gXAo+PiArCQlj
YXQgJChhbWQtYmxvYnMpID4gJEAuYmluIDsgXAo+PiArCQkkKE9CSkNPUFkpIC1JIGJpbmFyeSAt
TyBlbGY2NC14ODYtNjQgLUIgaTM4Njp4ODYtNjQgLS1yZW5hbWUtc2VjdGlvbiAuZGF0YT0uYnVp
bHRpbl9hbWRfdWNvZGUsYWxsb2MsbG9hZCxyZWFkb25seSxkYXRhLGNvbnRlbnRzICRALmJpbiAk
QC5hbWQ7IFwKPj4gKwkJcm0gLWYgJEAuYmluOyBcCj4+ICsJZmkKPj4gKwkjIENyZWF0ZSBJTlRF
TCBtaWNyb2NvZGUgYmxvYiBpZiB0aGVyZSBhcmUgSU5URUwgdXBkYXRlcyBvbiB0aGUgYnVpbGQg
c3lzdGVtCj4+ICsJaWYgWyAhIC16ICIkKGludGVsLWJsb2JzKSIgXTsgdGhlbiBcCj4+ICsJCWNh
dCAkKGludGVsLWJsb2JzKSA+ICRALmJpbjsgXAo+PiArCQkkKE9CSkNPUFkpIC1JIGJpbmFyeSAt
TyBlbGY2NC14ODYtNjQgLUIgaTM4Njp4ODYtNjQgLS1yZW5hbWUtc2VjdGlvbiAuZGF0YT0uYnVp
bHRpbl9pbnRlbF91Y29kZSxhbGxvYyxsb2FkLHJlYWRvbmx5LGRhdGEsY29udGVudHMgJEAuYmlu
ICRALmludGVsOyBcCj4+ICsJCXJtIC1mICRALmJpbjsgXAo+PiArCWZpCj4+ICsJIyBDcmVhdGUg
ZmFrZSBidWlsdGluX3Vjb2RlLm8gaWYgbm8gdXBkYXRlcyB3ZXJlIHByZXNlbnQuIE90aGVyd2lz
ZSwgYnVpbHRpbl91Y29kZS5vIGNhcnJpZXMgdGhlIGF2YWlsYWJsZSB1cGRhdGVzCj4+ICsJaWYg
WyAteiAiJChhbWQtYmxvYnMpIiAtYSAteiAiJChpbnRlbC1ibG9icykiIF07IHRoZW4gXAo+PiAr
CQkkKENDKSAkKENGTEFHUykgLWMgLXggYyAvZGV2L251bGwgLW8gJEA7IFwKPj4gKwllbHNlIFwK
Pj4gKwkJJChMRCkgJChMREZMQUdTKSAtciAtbyAkQCAkQC4qOyBcCj4+ICsJCXJtIC1mICRALio7
IFwKPj4gKwlmaQo+IAo+IEhvdyBhYm91dCB1c2luZyB3ZWFrIHN5bWJvbHMsIHJhdGhlciB0aGFu
IHBsYXlpbmcgZ2FtZXMgbGlrZSB0aGlzPwoKSnVzdCB0byBtYWtlIHN1cmUgd2UgYXJlIG9uIHRo
ZSBzYW1lIHBhZ2UuIFlvdSBhcmUgYWZ0ZXIgYSBkdW1teSBiaW5hcnkgCndpdGggd2VhayBzeW1i
b2xzIHRoYXQgZXZlbnR1YWxseSBnZXQgb3ZlcnJpZGRlbiB3aGVuIEkgbGluayB0aGUgYWN0dWFs
IAptaWNyb2NvZGUgYmluYXJpZXMgaW50byBidWlsdGluX3Vjb2RlLm8/IElmIHNvLCBwb3NzaWJs
ZSBvZiBjb3Vyc2UuIApFeGNlcHQgdGhhdCBJIGRvIG5vdCBwYXJ0aWN1bGFybHkgc2VlIHRoZSBk
b3duc2lkZSBvZiB0aGUgZXhpc3RpbmcgCmFwcHJvYWNoIHdpdGggZHVtbXkgYnVpbHRpbl91Y29k
ZS5vLgoKPiAKPiB+QW5kcmV3Cj4gCgpUaGFua3MgYSBsb3QgZm9yIHRob3NlIGluc2lnaHRmdWwg
Y29tbWVudHMsIEFuZHJldy4KCkNoZWVycywKRXNsYW0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
