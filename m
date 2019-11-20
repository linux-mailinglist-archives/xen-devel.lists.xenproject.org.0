Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5410373A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:09:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXMsJ-0002e5-N1; Wed, 20 Nov 2019 10:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rHzS=ZM=amazon.de=prvs=22027fa59=wipawel@srs-us1.protection.inumbo.net>)
 id 1iXMsI-0002e0-7v
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:06:14 +0000
X-Inumbo-ID: 61f4f332-0b7d-11ea-984a-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61f4f332-0b7d-11ea-984a-bc764e2007e4;
 Wed, 20 Nov 2019 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574244373; x=1605780373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=f8ZfLlzgy8D/IdkOOLu0s4OSXxHsioGffKvNKvxYRUY=;
 b=YrVtWGnnXOQGCgPwx09HKKGrfnybEzZYWwD0XEIg1ssSlm6mGB8D9B4d
 Qdp3UZ7WIFJAYV/d0fxh9M78rfKegop08pcxjFqea3q40pUjSCmBxKaaL
 Qngb5ocnUCgn2JCLpZDLBfjI+PYz/ofUYqyGSsetvxCZy7lJKLW8iY+Jo 0=;
IronPort-SDR: yXB/ui4VfZrnEhKZjQhZHietOlXjXV95Cpop6WSq1Bx8F4fddjwYL7va6reTMP8YSeAIZvAnLB
 Yunwf+Ns8qug==
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; 
   d="scan'208";a="206012"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 20 Nov 2019 10:06:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id CEC78A2474; Wed, 20 Nov 2019 10:05:57 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 10:05:56 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 10:05:56 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 20 Nov 2019 10:05:56 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH v5 00/12] livepatch: new features and fixes
Thread-Index: AQHVmuxrGXhYisoZe0CA9RwGY7ooHqeTXcSAgACAkwA=
Date: Wed, 20 Nov 2019 10:05:55 +0000
Message-ID: <7F0CE196-9FE7-43B9-B311-6EA0647338A4@amazon.com>
References: <20191114130653.51185-1-wipawel@amazon.de>
 <20191120022543.GA383@char.us.oracle.com>
In-Reply-To: <20191120022543.GA383@char.us.oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.248]
Content-ID: <286F786C2A00AC4FAC18933C0349C5CC@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 00/12] livepatch: new features and fixes
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
 Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, "Pohlack, Martin" <mpohlack@amazon.de>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Jan
 Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDIwLiBOb3YgMjAxOSwgYXQgMDM6MjUsIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gT24gVGh1LCBOb3YgMTQsIDIwMTkgYXQg
MDE6MDY6NDFQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4+IFRoaXMgc2Vy
aWVzIGludHJvZHVjZXMgbmV3IGZlYXR1cmVzIHRvIHRoZSBsaXZlcGF0Y2ggZnVuY3Rpb25hbGl0
eSBhcwo+PiBicmllZmx5IGRpc2N1c3NlZCBkdXJpbmcgWGVuIERldmVsb3BlciBTdW1taXQgMjAx
OTogW2FdIGFuZCBbYl0uCj4+IEl0IGFsc28gcHJvdmlkZXMgYSBmZXcgZml4ZXMgYW5kIHNvbWUg
c21hbGwgaW1wcm92ZW1lbnRzLgo+PiAKPj4gTWFpbiBjaGFuZ2VzIGluIHY0Ogo+PiAtIEZpeCB2
YXJpb3VzIHR5cG9zIGFuZCBtaW5vciBpc3N1ZXMKPj4gLSBTaW1wbGlmeSBhcmNoX2xpdmVwYXRj
aF97YXBwbHkscmV2ZXJ0fSBieSB1c2luZwo+PiAgY29tbW9uX2xpdmVwYXRjaF97YXBwbHkscmV2
ZXJ0fQo+PiAtIEltcHJvdmUgcHl0aG9uIGJpbmRpbmdzIGFuZCBmaXggZmV3IGlzc3Vlcwo+IAo+
IFRoaXMgaXMgaHR0cHM6Ly9naXRodWIuY29tL2tvbnJhZHdpbGsveGVuLmdpdCAoeW91ciBwYXRj
aGVzIG9uIHRvcCBvZiBzdGFnaW5nKToKPiAKPiBPbiBBUk02NDoKPiByb290QGhpa2V5OTYwOi9o
b21lL2xpbmFybyMgeGwgaW5mbwo+IAoKPHNuaXA+Cgo+IHJvb3RAaGlrZXk5NjA6L2hvbWUvbGlu
YXJvL3hlbi5naXQveGVuL3Rlc3QvbGl2ZXBhdGNoIyB4ZW4tbGl2ZXBhdGNoIGxvYWQgeGVuX2hl
bGxvX3dvcmxkLmxpdmVwYXRjaCAKPiBVcGxvYWRpbmcgeGVuX2hlbGxvX3dvcmxkLmxpdmVwYXRj
aC4uLiBjb21wbGV0ZWQKPiBBcHBseWluZyB4ZW5faGVsbG9fd29ybGQuLi4gZmFpbGVkCj4gRXJy
b3IgMjI6IEludmFsaWQgYXJndW1lbnQKPiBVbmxvYWRpbmcgeGVuX2hlbGxvX3dvcmxkLi4uIGZh
aWxlZAo+IEVycm9yIDIyOiBJbnZhbGlkIGFyZ3VtZW50Cj4gcm9vdEBoaWtleTk2MDovaG9tZS9s
aW5hcm8veGVuLmdpdC94ZW4vdGVzdC9saXZlcGF0Y2gjIGdpdCBsb2cKPiBjb21taXQgOWY1ZjI1
ZjA3YTY0ZTFiNDQ3ZjdiZDEyNDE4MmExYzVlZjQyMmQ2Zgo+IEF1dGhvcjogUGF3ZWwgV2llY3pv
cmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IERhdGU6ICAgVGh1IE5vdiAxNCAxMzowNjo1
MiAyMDE5ICswMDAwCj4gCj4gICAgbGl2ZXBhdGNoOiBBZGQgbWV0YWRhdGEgcnVudGltZSByZXRy
aWV2YWwgbWVjaGFuaXNtCj4gLi4uCj4gCj4gCgo8c25pcD4KCj4gb290QGhpa2V5OTYwOi8jIHhl
bi1saXZlcGF0Y2ggbGlzdAo+IElEICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgc3RhdHVzICAgICB8IG1ldGFkYXRhCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tCj4geGVuX2hlbGxvX3dvcmxk
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgQ0hFQ0tFRCAgICB8IExJVkVQQVRDSF9SVUxFWgo+
IHJvb3RAaGlrZXk5NjA6LyMgeGwgZGVidWcta2V5cyB4Cj4gKFhFTikgJ3gnIHByZXNzZWQgLSBE
dW1waW5nIGFsbCBsaXZlcGF0Y2ggcGF0Y2hlcwo+IChYRU4pIGJ1aWxkLWlkOiA4YmY5ZWM1ZmMw
MDUzZjRkNGZjM2I3ZDI1NmI2NmVjODZmOGU1Y2NjCj4gKFhFTikgIG5hbWU9eGVuX2hlbGxvX3dv
cmxkIHN0YXRlPUNIRUNLRUQoMSkgMDAwMDAwMDAwMGEwMjAwMCAoLmRhdGE9MDAwMDAwMDAwMGEw
MzAwMCwgLnJvZGF0YT0wMDAwMDAwMDAwYTA0MDAwKSB1c2luZyAzIHBhZ2VzLgo+IChYRU4pIGxp
dmVwYXRjaDogbW9kdWxlIG1ldGFkYXRhOgo+IChYRU4pIGxpdmVwYXRjaDogICBMSVZFUEFUQ0hf
UlVMRVoKPiAoWEVOKSAgICAgeGVuX2V4dHJhX3ZlcnNpb24gcGF0Y2ggMDAwMDAwMDAwMDI0MjE1
OCgxMikgd2l0aCAwMDAwMDAwMDAwYTAyMDAwICgxNikKPiAoWEVOKSBidWlsZC1pZD01MDE1OWFk
ZWM3YWFlYzlkYWU4YTZjZTNhYzZjMmQ1ZjllODI1YmZmCj4gKFhFTikgZGVwZW5kLW9uPThiZjll
YzVmYzAwNTNmNGQ0ZmMzYjdkMjU2YjY2ZWM4NmY4ZTVjY2MKPiAoWEVOKSBkZXBlbmQtb24teGVu
PThiZjllYzVmYzAwNTNmNGQ0ZmMzYjdkMjU2YjY2ZWM4NmY4ZTVjY2MKPiByb290QGhpa2V5OTYw
Oi8jIHhlbi1saXZlcGF0Y2ggdW5sb2FkIHhlbl9oZWxsb193b3JsZAo+IFVubG9hZGluZyB4ZW5f
aGVsbG9fd29ybGQuLi4gZmFpbGVkCj4gRXJyb3IgMjI6IEludmFsaWQgYXJndW1lbnQKPiByb290
QGhpa2V5OTYwOi8jIHhlbi1saXZlcGF0Y2ggbGlzdAo+IElEICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgc3RhdHVzICAgICB8IG1ldGFkYXRhCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tCj4g
eGVuX2hlbGxvX3dvcmxkICAgICAgICAgICAgICAgICAgICAgICAgIHwgQ0hFQ0tFRCAgICB8IExJ
VkVQQVRDSF9SVUxFWgo+IAo+IAo+IFRob3VnaHRzPyAKClllcywgdGhpcyBodW5rIGlzIG1pc3Np
bmcgKHNvbWVob3cgaXQgZGlkIG5vdCBtYWtlIGl0IHRvIHRoZSB2NSBwYXRjaHNldCwgc29ycnkp
OgoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYyBiL3Rvb2xzL2xpYnhjL3hjX21p
c2MuYwppbmRleCA3NzQ3ZWE4M2FhLi4wYjIxYTZhY2E0IDEwMDY0NAotLS0gYS90b29scy9saWJ4
Yy94Y19taXNjLmMKKysrIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCkBAIC05NzYsNiArOTc2LDcg
QEAgc3RhdGljIGludCBfeGNfbGl2ZXBhdGNoX2FjdGlvbih4Y19pbnRlcmZhY2UgKnhjaCwKICAg
ICBzeXNjdGwudS5saXZlcGF0Y2gudS5hY3Rpb24uY21kID0gYWN0aW9uOwogICAgIHN5c2N0bC51
LmxpdmVwYXRjaC51LmFjdGlvbi50aW1lb3V0ID0gdGltZW91dDsKICAgICBzeXNjdGwudS5saXZl
cGF0Y2gudS5hY3Rpb24uZmxhZ3MgPSBmbGFnczsKKyAgICBzeXNjdGwudS5saXZlcGF0Y2gudS5h
Y3Rpb24ucGFkID0gMDsKCiAgICAgc3lzY3RsLnUubGl2ZXBhdGNoLnUuYWN0aW9uLm5hbWUgPSBk
ZWZfbmFtZTsKICAgICBzZXRfeGVuX2d1ZXN0X2hhbmRsZShzeXNjdGwudS5saXZlcGF0Y2gudS5h
Y3Rpb24ubmFtZS5uYW1lLCBuYW1lKTsKCgpCZXN0IFJlZ2FyZHMsClBhd2VsIFdpZWN6b3JraWV3
aWN6CgoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5z
dHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1
cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
