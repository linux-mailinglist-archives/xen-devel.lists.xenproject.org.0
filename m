Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E91321DB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 10:03:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iokjo-0004Oi-6s; Tue, 07 Jan 2020 09:01:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iokjm-0004Od-Mo
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 09:01:18 +0000
X-Inumbo-ID: 43bd900c-312c-11ea-abb7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43bd900c-312c-11ea-abb7-12813bfff9fa;
 Tue, 07 Jan 2020 09:01:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DFF1EACB1;
 Tue,  7 Jan 2020 09:01:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <95425a27-717d-59c8-bcd6-ee8cfea4439c@suse.com>
 <a00f0c75-b158-9a8c-a23f-81f91c570072@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79d51a89-c45b-ab40-15d9-54c4646bdce9@suse.com>
Date: Tue, 7 Jan 2020 10:01:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a00f0c75-b158-9a8c-a23f-81f91c570072@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC v3 4/8] x86emul: support MOVDIR64B insn
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAyMDozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE2OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTm90ZSB0aGF0IFNETSByZXZpc2lvbiAwNzAg
ZG9lc24ndCBzcGVjaWZ5IGV4Y2VwdGlvbiBiZWhhdmlvciBmb3IKPj4gTW9kUk0ubW9kICE9IDBi
MTE7IGFzc3VtaW5nICNVRCBoZXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBSRkM6IFlldCB0byBiZSB0ZXN0ZWQgKG9uY2Ug
U0RFIHN1cHBvcnRzIGl0KS4KPiAKPiBEbyB5b3UgaGF2ZSBhbnkgcGxhbnMgZm9yIGhvdyB0byBz
dXBwb3J0IEVOUUNNRHssU30gd2hpY2ggYXJlIGp1c3QKPiB2YXJpYXRpb25zIG9mIE1PVkRJUjY0
QiB1c2luZyB0aGUgRjIgYW5kIEYzIHByZWZpeGVzIGZvciBiZWhhdmlvdXIKPiBtb2RpZmljYXRp
b24sIGFuZCB3aGV0aGVyIHRob3NlIG1pZ2h0IGFsdGVyIHdoYXQgd2UgZG8gaGVyZT8KPiAKPiBU
aGUgdW5kZXJseWluZyB3cml0ZSBvdXQgaW50byB0aGUgc3lzdGVtIGlzIGdvaW5nIHRvIGJlIGxh
cmdlbHkgdGhlCj4gc2FtZSwgYnV0IGl0IGNhbid0IGJlIHNoYXJlZCB3aXRoIE1PVkRJUjY0QiBi
ZWNhdXNlIGl0IGdlbmVyYXRlcyBhCj4gZGlmZmVyZW50IHR5cGUgb2YgYnVzIHRyYW5zYWN0aW9u
LsKgIEFsc28sIHRoZXkgcmVxdWlyZSBaRiB0byBmaW5kIHRoZWlyCj4gd2F5IGJhY2sgb3V0IG9m
IHRoZSBybXcoKSBoYW5kbGVyLgoKVG8gYmUgaG9uZXN0LCBJIGhhZG4ndCBsb29rZWQgYXQgdGhl
IEVOUUNNRHssU30gZGV0YWlscyBhdCBhbGwgeWV0CihhbmQgaWlyYyB0aGV5IHdlcmVuJ3QgZXZl
biBhdmFpbGFibGUgd2hlbiBJIGZpcnN0IHdvcmtlZCBvbiB0aGlzKS4KSSB3aWxsIHJlLWNvbnNp
ZGVyIHRoZSBhcHByb2FjaCAtIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
