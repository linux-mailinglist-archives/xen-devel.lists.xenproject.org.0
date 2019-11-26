Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8541610A04A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:31:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbqY-00016N-26; Tue, 26 Nov 2019 14:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZbqW-000167-Dm
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:29:40 +0000
X-Inumbo-ID: 2dbc106a-1059-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dbc106a-1059-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 14:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23692AD29;
 Tue, 26 Nov 2019 14:29:39 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
 <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
 <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
 <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
 <4991a843-1551-57d2-81ab-fa399d82df00@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3339476d-72bf-4866-1f56-1dccfa2f1b17@suse.com>
Date: Tue, 26 Nov 2019 15:29:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4991a843-1551-57d2-81ab-fa399d82df00@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNToyNCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjYvMTEvMjAx
OSAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjExLjIwMTkgMTM6MjUsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAyNi8xMS8yMDE5IDA4OjQyLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+PiBPbiAyNS4xMS4yMDE5IDIyOjA1LCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+Pj4+PiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+Pj4+IEBAIC0xMjc5
LDcgKzEyNzksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfZGV2aWNlX3Rh
YmxlKAo+Pj4+PiAgICAgICAgICBmb3IgKCBiZGYgPSAwLCBzaXplIC89IHNpemVvZigqZHQpOyBi
ZGYgPCBzaXplOyArK2JkZiApCj4+Pj4+ICAgICAgICAgICAgICBkdFtiZGZdID0gKHN0cnVjdCBh
bWRfaW9tbXVfZHRlKXsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgLnYgPSB0cnVl
LAo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSB0cnVlLAo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSBpb21tdV9pbnRyZW1hcCwKPj4+PiBUaGlzIHdh
cyB2ZXJ5IGludGVudGlvbmFsbHkgInRydWUiLCBhbmQgaWdub3JpbmcgImlvbW11X2ludHJlbWFw
IjoKPj4+Cj4+PiBEZWxpYmVyYXRlIG9yIG5vdCwgaXQgaXMgYSByZWdyZXNzaW9uIGZyb20gNC4x
Mi4KPj4KPj4gSSBhY2NlcHQgaXQncyBhIHJlZ3Jlc3Npb24gKHdoaWNoIHdhbnRzIGZpeGluZyks
IGJ1dCBJIGRvbid0IHRoaW5rCj4+IHRoaXMgaXMgdGhlIHdheSB0byBhZGRyZXNzIGlzLiBJIGNv
dWxkIGJlIGNvbnZpbmNlZCBieSBnb29kCj4+IGFyZ3VtZW50cywgdGhvdWdoLgo+IAo+IERvIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9ucyBob3cgdG8gYWRkcmVzcyB0aGF0PwoKSSdkIGxpa2UgdG8g
cmVwbHkgaW4gdGhlIG90aGVyIGNvbnRleHQsIGFmdGVyIGEgbGl0dGxlIG1vcmUKdGhpbmtpbmcg
YWJvdXQgdGhlIHNpdHVhdGlvbi4gSSB0aGluayBJIHNlZSBhbiBvdmVyc2lnaHQgb2YKbWluZS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
