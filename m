Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF276A6AB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:41:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKsM-0000Wt-AX; Tue, 16 Jul 2019 10:40:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnKsK-0000R8-AQ
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:40:00 +0000
X-Inumbo-ID: 0c1c80ea-a7b6-11e9-a020-bf6c8c405254
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c1c80ea-a7b6-11e9-a020-bf6c8c405254;
 Tue, 16 Jul 2019 10:39:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jL2wE9yza5hREfw1hQKMDfuRr2dX71bn1Ro2Oib4pC0qHhkh8Inl6XTW2oLEdXYjKa6GbUww/3
 gW3cosaSguD298cd3QYne3rNVSADUnhXyLLYLm29vXrq9xATGQOKkHj5/7xI/Xu8gnidPIlINb
 MDpO66Pu6C0kS4mvmq8oEuFgYq8WEJx0zAz262gNVTzt3YX9foabk3Sok8AtPG0TZwktFlaRn5
 qBlbX3UjYZP1r84Gtdp22bBbCtvU8QPl7Ot3XtJeAIbBcyrAnRlfb/4MLAdrCLJGZtFSjIxmPy
 4eA=
X-SBRS: 2.7
X-MesageID: 3082422
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3082422"
Date: Tue, 16 Jul 2019 12:39:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190716103944.vb4bnab7adcq2qu6@Air-de-Roger.citrite.net>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6NTk6MzZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgdGhlIE1XQUlUIGlkbGUgZHJpdmVyIGFscmVhZHkgdGFrZXMgaXQgdG8gbWVh
biBhbiBhY3R1YWwgQyBzdGF0ZSwKPiB0aGUgQUNQSSBpZGxlIGRyaXZlciBzbyBmYXIgdXNlZCBp
dCBhcyBhIGxpc3QgaW5kZXguIFRoZSBsaXN0IGluZGV4LAo+IGhvd2V2ZXIsIGlzIGFuIGltcGxl
bWVudGF0aW9uIGRldGFpbCBvZiBYZW4gYW5kIGFmZmVjdGVkIGJ5IGZpcm13YXJlCj4gc2V0dGlu
Z3MgKGkuZS4gbm90IG5lY2Vzc2FyaWx5IHVuaWZvcm0gZm9yIGEgcGFydGljdWxhciBzeXN0ZW0p
Lgo+IAo+IFdoaWxlIHRvdWNoaW5nIHRoaXMgY29kZSBhbHNvIGF2b2lkIGludm9raW5nIG1lbnVf
Z2V0X3RyYWNlX2RhdGEoKQo+IHdoZW4gdHJhY2luZyBpcyBub3QgYWN0aXZlLiBGb3IgY29uc2lz
dGVuY3kgZG8gdGhpcyBhbHNvIGZvciB0aGUKPiBNV0FJVCBkcml2ZXIuCj4gCj4gTm90ZSB0aGF0
IEknbSBpbnRlbnRpb25hbGx5IG5vdCBhZGRpbmcgYW55IHNvcnRpbmcgbG9naWMgdG8gc2V0X2N4
KCk6Cj4gQmVmb3JlIGFuZCBhZnRlciB0aGlzIHBhdGNoIHdlIGFzc3VtZSBlbnRyaWVzIHRvIGFy
cml2ZSBpbiBvcmRlciwgc28KPiB0aGlzIHdvdWxkIGJlIGFuIG9ydGhvZ29uYWwgY2hhbmdlLgo+
IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhZGQgbWluaW1hbCBkb2N1bWVudGF0aW9uIGZv
ciB0aGUgY29tbWFuZCBsaW5lCj4gb3B0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkp1c3Qgb25lIGNvbW1lbnQsIHJlZ2FyZGxlc3Mgb2Yg
d2hpY2g6CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cgo+IC0tLQo+IHYyOiBBZGp1c3QgeGVucG0gb3V0cHV0IHdvcmRpbmcgYSBsaXR0bGUuIEV4
cGxpY2l0bHkgbG9nICJ1bmxpbWl0ZWQiLgo+IC0tLQo+IFRCRDogSSB3b25kZXIgaWYgd2UgcmVh
bGx5IG5lZWQgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4J3MgaWR4IGZpZWxkCj4gICAgICAgYW55
bW9yZS4gSXQncyB1c2VkIGluIGEgbnVtYmVyIG9mIChxdWVzdGlvbmFibGUpIHBsYWNlcyAuLi4K
PiAKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTM3Niw2ICsxMzc2LDggQEAgVGhp
cyBvcHRpb24gaXMgaWdub3JlZCBpbiAqKnB2LXNoaW0qKiBtbwo+ICAgIyMjIG1heF9jc3RhdGUg
KHg4NikKPiAgID4gYD0gPGludGVnZXI+YAo+ICAgCj4gK1NwZWNpZnkgdGhlIGRlZXBlc3QgQy1z
dGF0ZSBDUFVzIGFyZSBwZXJtaXR0ZWQgdG8gYmUgcGxhY2VkIGluLgo+ICsKPiAgICMjIyBtYXhf
Z3NpX2lycXMgKHg4NikKPiAgID4gYD0gPGludGVnZXI+YAo+ICAgCj4gLS0tIGEvdG9vbHMvbWlz
Yy94ZW5wbS5jCj4gKysrIGIvdG9vbHMvbWlzYy94ZW5wbS5jCj4gQEAgLTY0LDcgKzY0LDcgQEAg
dm9pZCBzaG93X2hlbHAodm9pZCkKPiAgICAgICAgICAgICAgICIgc2V0LXNjaGVkLXNtdCAgICAg
ICAgICAgZW5hYmxlfGRpc2FibGUgZW5hYmxlL2Rpc2FibGUgc2NoZWR1bGVyIHNtdCBwb3dlciBz
YXZpbmdcbiIKPiAgICAgICAgICAgICAgICIgc2V0LXZjcHUtbWlncmF0aW9uLWRlbGF5ICAgICAg
PG51bT4gc2V0IHNjaGVkdWxlciB2Y3B1IG1pZ3JhdGlvbiBkZWxheSBpbiB1c1xuIgo+ICAgICAg
ICAgICAgICAgIiBnZXQtdmNwdS1taWdyYXRpb24tZGVsYXkgICAgICAgICAgICBnZXQgc2NoZWR1
bGVyIHZjcHUgbWlncmF0aW9uIGRlbGF5XG4iCj4gLSAgICAgICAgICAgICIgc2V0LW1heC1jc3Rh
dGUgICAgICAgIDxudW0+ICAgICAgICAgc2V0IHRoZSBDLVN0YXRlIGxpbWl0YXRpb24gKDxudW0+
ID49IDApXG4iCj4gKyAgICAgICAgICAgICIgc2V0LW1heC1jc3RhdGUgICAgICAgIDxudW0+fCd1
bmxpbWl0ZWQnIHNldCB0aGUgQy1TdGF0ZSBsaW1pdGF0aW9uICg8bnVtPiA+PSAwKVxuIgo+ICAg
ICAgICAgICAgICAgIiBzdGFydCBbc2Vjb25kc10gICAgICAgICAgICAgICAgICAgICBzdGFydCBj
b2xsZWN0IEN4L1B4IHN0YXRpc3RpY3MsXG4iCj4gICAgICAgICAgICAgICAiICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dCBhZnRlciBDVFJMLUMgb3IgU0lHSU5UIG9y
IHNldmVyYWwgc2Vjb25kcy5cbiIKPiAgICAgICAgICAgICAgICIgZW5hYmxlLXR1cmJvLW1vZGUg
ICAgIFtjcHVpZF0gICAgICAgZW5hYmxlIFR1cmJvIE1vZGUgZm9yIHByb2Nlc3NvcnMgdGhhdCBz
dXBwb3J0IGl0LlxuIgo+IEBAIC0xOTQsNyArMTk0LDExIEBAIHN0YXRpYyBpbnQgc2hvd19tYXhf
Y3N0YXRlKHhjX2ludGVyZmFjZQo+ICAgICAgIGlmICggKHJldCA9IHhjX2dldF9jcHVpZGxlX21h
eF9jc3RhdGUoeGNfaGFuZGxlLCAmdmFsdWUpKSApCj4gICAgICAgICAgIHJldHVybiByZXQ7Cj4g
ICAKPiAtICAgIHByaW50ZigiTWF4IHBvc3NpYmxlIEMtc3RhdGU6IEMlZFxuXG4iLCB2YWx1ZSk7
Cj4gKyAgICBpZiAoIHZhbHVlIDwgWEVOX1NZU0NUTF9DWF9VTkxJTUlURUQgKQo+ICsgICAgICAg
IHByaW50ZigiTWF4IHBvc3NpYmxlIEMtc3RhdGU6IEMlIlBSSXUzMiJcblxuIiwgdmFsdWUpOwo+
ICsgICAgZWxzZQo+ICsgICAgICAgIHByaW50ZigiQWxsIEMtc3RhdGVzIGFsbG93ZWRcblxuIik7
Cj4gKwo+ICAgICAgIHJldHVybiAwOwo+ICAgfQo+ICAgCj4gQEAgLTExMTcsMTggKzExMjEsMjQg
QEAgdm9pZCBnZXRfdmNwdV9taWdyYXRpb25fZGVsYXlfZnVuYyhpbnQgYQo+ICAgdm9pZCBzZXRf
bWF4X2NzdGF0ZV9mdW5jKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICB7Cj4gICAgICAgaW50
IHZhbHVlOwo+ICsgICAgY2hhciBidWZbMTJdOwo+ICAgCj4gLSAgICBpZiAoIGFyZ2MgIT0gMSB8
fCBzc2NhbmYoYXJndlswXSwgIiVkIiwgJnZhbHVlKSAhPSAxIHx8IHZhbHVlIDwgMCApCj4gKyAg
ICBpZiAoIGFyZ2MgIT0gMSB8fAo+ICsgICAgICAgICAoc3NjYW5mKGFyZ3ZbMF0sICIlZCIsICZ2
YWx1ZSkgPT0gMQo+ICsgICAgICAgICAgPyB2YWx1ZSA8IDAKPiArICAgICAgICAgIDogKHZhbHVl
ID0gWEVOX1NZU0NUTF9DWF9VTkxJTUlURUQsIHN0cmNtcChhcmd2WzBdLCAidW5saW1pdGVkIikp
KSApCj4gICAgICAgewo+IC0gICAgICAgIGZwcmludGYoc3RkZXJyLCAiTWlzc2luZyBvciBpbnZh
bGlkIGFyZ3VtZW50KHMpXG4iKTsKPiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIk1pc3Npbmcs
IGV4Y2Vzcywgb3IgaW52YWxpZCBhcmd1bWVudChzKVxuIik7Cj4gICAgICAgICAgIGV4aXQoRUlO
VkFMKTsKPiAgICAgICB9Cj4gICAKPiArICAgIHNucHJpbnRmKGJ1ZiwgQVJSQVlfU0laRShidWYp
LCAiQyVkIiwgdmFsdWUpOwo+ICsKPiAgICAgICBpZiAoICF4Y19zZXRfY3B1aWRsZV9tYXhfY3N0
YXRlKHhjX2hhbmRsZSwgKHVpbnQzMl90KXZhbHVlKSApCj4gLSAgICAgICAgcHJpbnRmKCJzZXQg
bWF4X2NzdGF0ZSB0byBDJWQgc3VjY2VlZGVkXG4iLCB2YWx1ZSk7Cj4gKyAgICAgICAgcHJpbnRm
KCJtYXggQy1zdGF0ZSBzZXQgdG8gJXNcbiIsIHZhbHVlID49IDAgPyBidWYgOiBhcmd2WzBdKTsK
PiAgICAgICBlbHNlCj4gLSAgICAgICAgZnByaW50ZihzdGRlcnIsICJzZXQgbWF4X2NzdGF0ZSB0
byBDJWQgZmFpbGVkICglZCAtICVzKVxuIiwKPiAtICAgICAgICAgICAgICAgIHZhbHVlLCBlcnJu
bywgc3RyZXJyb3IoZXJybm8pKTsKPiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0
byBzZXQgbWF4IEMtc3RhdGUgdG8gJXMgKCVkIC0gJXMpXG4iLAo+ICsgICAgICAgICAgICAgICAg
dmFsdWUgPj0gMCA/IGJ1ZiA6IGFyZ3ZbMF0sIGVycm5vLCBzdHJlcnJvcihlcnJubykpOwo+ICAg
fQo+ICAgCj4gICB2b2lkIGVuYWJsZV90dXJib19tb2RlKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL2NwdV9pZGxlLmMKPiBAQCAtMTAzLDcgKzEwMyw3IEBAIGJvb2wgbGFwaWNfdGltZXJf
aW5pdCh2b2lkKQo+ICAgfQo+ICAgCj4gICB2b2lkICgqX19yZWFkX21vc3RseSBwbV9pZGxlX3Nh
dmUpKHZvaWQpOwo+IC11bnNpZ25lZCBpbnQgbWF4X2NzdGF0ZSBfX3JlYWRfbW9zdGx5ID0gQUNQ
SV9QUk9DRVNTT1JfTUFYX1BPV0VSIC0gMTsKPiArdW5zaWduZWQgaW50IG1heF9jc3RhdGUgX19y
ZWFkX21vc3RseSA9IFVJTlRfTUFYOwoKTm90IHN1cmUgd2hldGhlciBpdCB3b3VsZCBiZSBjbGVh
cmVyIHRvIGp1c3QgdXNlClhFTl9TWVNDVExfQ1hfVU5MSU1JVEVEIGhlcmUgaW5zdGVhZCBvZiBV
SU5UX01BWC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
