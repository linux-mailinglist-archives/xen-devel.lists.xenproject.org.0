Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD112F959
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:51:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOFx-0005XM-FJ; Fri, 03 Jan 2020 14:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOFv-0005XH-OB
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:48:51 +0000
X-Inumbo-ID: 22ee7978-2e38-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22ee7978-2e38-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 14:48:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47242AD17;
 Fri,  3 Jan 2020 14:48:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4503eb28-fb43-a3bf-29d0-6e9a3e419dfb@suse.com>
Date: Fri, 3 Jan 2020 15:49:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224151932.6304-11-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtNDM5LDYgKzQ0
OSwzNCBAQCBkZWYgdmVyaWZ5X3JlY29yZF9zdGF0aWNfZGF0YV9lbmQoc2VsZiwgY29udGVudCk6
Cj4gICAgICAgICAgICAgIHJhaXNlIFJlY29yZEVycm9yKCJTdGF0aWMgZGF0YSBlbmQgcmVjb3Jk
IGZvdW5kIGluIHYyIHN0cmVhbSIpCj4gIAo+ICAKPiArICAgIGRlZiB2ZXJpZnlfcmVjb3JkX3g4
Nl9jcHVpZF9wb2xpY3koc2VsZiwgY29udGVudCk6Cj4gKyAgICAgICAgIiIiIHg4NiBDUFVJRCBw
b2xpY3kgcmVjb3JkICIiIgo+ICsKPiArICAgICAgICBpZiBzZWxmLnZlcnNpb24gPCAzOgo+ICsg
ICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigieDg2IENQVUlEIHBvbGljeSByZWNvcmQgZm91
bmQgaW4gdjIgc3RyZWFtIikKPiArCj4gKyAgICAgICAgc3ogPSBjYWxjc2l6ZShYODZfQ1BVSURf
UE9MSUNZX0ZPUk1BVCkKPiArICAgICAgICBjb250ZW50c3ogPSBsZW4oY29udGVudCkKPiArCj4g
KyAgICAgICAgaWYgY29udGVudHN6IDwgc3ogb3IgKGNvbnRlbnRzeiAlIHN6KSAhPSAwOgo+ICsg
ICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiUmVjb3JkIGxlbmd0aCAldSwgZXhwZWN0ZWQg
bXVsdGlwbGUgb2YgJXUiICUKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGNvbnRl
bnRzeiwgc3opKQo+ICsKPiArCj4gKyAgICBkZWYgdmVyaWZ5X3JlY29yZF94ODZfbXNyX3BvbGlj
eShzZWxmLCBjb250ZW50KToKPiArICAgICAgICAiIiIgeDg2IE1TUiBwb2xpY3kgcmVjb3JkICIi
Igo+ICsKPiArICAgICAgICBpZiBzZWxmLnZlcnNpb24gPCAzOgo+ICsgICAgICAgICAgICByYWlz
ZSBSZWNvcmRFcnJvcigieDg2IE1TUiBwb2xpY3kgcmVjb3JkIGZvdW5kIGluIHYyIHN0cmVhbSIp
Cj4gKwo+ICsgICAgICAgIHN6ID0gY2FsY3NpemUoWDg2X01TUl9QT0xJQ1lfRk9STUFUKQo+ICsg
ICAgICAgIGNvbnRlbnRzeiA9IGxlbihjb250ZW50KQo+ICsKPiArICAgICAgICBpZiBjb250ZW50
c3ogPCBzeiBvciAoY29udGVudHN6ICUgc3opICE9IDA6Cj4gKyAgICAgICAgICAgIHJhaXNlIFJl
Y29yZEVycm9yKCJSZWNvcmQgbGVuZ3RoICV1LCBleHBlY3RlZCBtdWx0aXBsZSBvZiAldSIgJQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY29udGVudHN6LCBzeikpCgpXaGlsZSBJ
IGNhbid0IGV2ZW4gc2VlIGEgdGhlb3JldGljYWwgY2FzZSBvZiB0aGUgQ1BVSUQgYXJyYXkKaGF2
aW5nIHplcm8gZWxlbWVudHMsIGlzIGl0IHJlYWxseSBlbnRpcmVseSBpbXBsYXVzaWJsZSB0byBo
YXZlCmFuIGVtcHR5IE1TUnMgYXJyYXk/IEkuZS4gd291bGRuJ3QgdGhlIGxlZnQgc2lkZSBvZiB0
aGUgIm9yIgpiZXR0ZXIgZ28gYXdheT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
