Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E71232BA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:42:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFsA-0001zr-5Q; Tue, 17 Dec 2019 16:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fMX9=2H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihFs8-0001zm-68
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:38:56 +0000
X-Inumbo-ID: b22d36f6-20eb-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22d36f6-20eb-11ea-a914-bc764e2007e4;
 Tue, 17 Dec 2019 16:38:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 664ACAE03;
 Tue, 17 Dec 2019 16:38:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <fe06b109-7a64-a4f1-f8a8-b436b04a6ac1@suse.com>
 <e934e305-cb3b-39d6-8719-6b054f52fcee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c0348ab-c3a4-6706-da66-9861cfce50c6@suse.com>
Date: Tue, 17 Dec 2019 17:39:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e934e305-cb3b-39d6-8719-6b054f52fcee@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] x86/suspend: State cleanup
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

T24gMTcuMTIuMjAxOSAxNzozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8xMi8yMDE5
IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMTIuMjAxOSAyMDowNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEFuZHJldyBDb29wZXIgKDYpOgo+Pj4gICB4ODYvc3VzcGVuZDog
Q2xhcmlmeSBhbmQgaW1wcm92ZSB0aGUgYmVoYXZpb3VyIG9mIGRvX3N1c3BlbmRfbG93bGV2ZWwo
KQo+Pj4gICB4ODYvc3VzcGVuZDogRG9uJ3QgYm90aGVyIHNhdmluZyAlY3IzLCAlc3Mgb3IgZmxh
Z3MKPj4+ICAgeDg2L3N1c3BlbmQ6IERvbid0IHNhdmUgdW5uZWNlc3NhcnkgR1BScwo+Pj4gICB4
ODYvc3VzcGVuZDogUmVzdG9yZSBjcjQgbGF0ZXIgZHVyaW5nIHJlc3VtZQo+Pj4gICB4ODYvc3Vz
cGVuZDogRXhwYW5kIG1hY3JvcyBpbiB3YWtldXBfcHJvdC5TCj4+PiAgIHg4Ni9zdXNwZW5kOiBE
cm9wIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUoKSBjb21wbGV0ZWx5Cj4+Pgo+Pj4gIHhlbi9h
cmNoL3g4Ni9hY3BpL3N1c3BlbmQuYyAgICAgfCAgNTUgKystLS0tLS0tLS0tLS0tLQo+Pj4gIHhl
bi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCAxMzYgKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9ib290L3dha2V1cC5TICAgICAg
fCAgIDIgKy0KPj4+ICAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDE0NyBkZWxl
dGlvbnMoLSkKPj4gQmFzZWQgb24gUm9nZXIncyByZXZpZXcKPj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gT25lIHJlbWFyayBvbiB0aGUgY29tYmluYXRp
b24gb2YgcGF0Y2hlcyAyIGFuZCA1OiBUaGUgbG9hZGluZyBvZgo+PiB0aGUgc3RhY2sgcmVsYXRl
ZCByZWdpc3RlcnMgd291bGQgbm93IHNlZW0gdG8gYmUgYSBmYWlyIGNhbmRpZGF0ZQo+PiBmb3Ig
dXNpbmcgTFNTIChnZW5lcmFsbHkgdG8gYmUgcHJlZmVycmVkIG92ZXIgTU9WLXRvLVNTKS4KPiAK
PiBXZWxsLi4uIFlvdSd2ZSBqdXN0IGZpeGVkIGMvcyBmZmEyMWVhNTMwMyBpbiB0aGUgZW11bGF0
b3IsIGFuZCBpdAo+IGRlbW9uc3RyYXRlcyB3aHkgTFNTIGNhbid0IGJlIHVzZWQuCgpIbW0sIGlu
ZGVlZCwgaG93IGRpZCBJIGZvcmdldD8gKEl0J3MgcmVhbGx5IHZlcnkgY291bnRlci1pbnR1aXRp
dmUKZm9yIHRoaXMgaW5zbiB0byBub3QgYmUgdW5pdmVyc2FsbHkgdXNhYmxlLikKCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
