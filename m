Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831F13A5BD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:17:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJEX-0002W2-Nw; Tue, 14 Jan 2020 10:15:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irJEX-0002Vw-07
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:15:37 +0000
X-Inumbo-ID: cb647253-36b6-11ea-8364-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb647253-36b6-11ea-8364-12813bfff9fa;
 Tue, 14 Jan 2020 10:15:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8213DABBD;
 Tue, 14 Jan 2020 10:15:31 +0000 (UTC)
To: Julien Grall <jgrall@amazon.com>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-2-julien@xen.org>
 <f5dcdf24-f71c-164b-e770-594ea01bbe1e@suse.com>
 <15d8bf61-5648-ea6b-2c65-f9ed28c349c0@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7124bc05-6f69-10dd-3e42-1650835716a3@suse.com>
Date: Tue, 14 Jan 2020 11:15:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <15d8bf61-5648-ea6b-2c65-f9ed28c349c0@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xen/x86: Remove unused forward
 declaration in asm-x86/irq.h
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxMTowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE0LzAxLzIwMjAg
MDk6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMy4wMS4yMDIwIDIyOjMzLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+
Pj4KPj4+IE5vbmUgb2YgdGhlIHByb3RvdHlwZXMgd2l0aGluIHRoZSBoZWFkZXIgYXNtLXg4Ni9p
cnEuaCBhY3R1YWxseSByZXF1aXJlcwo+Pj4gdGhlIGZvcndhcmQgZGVjbGFyYXRpb24gb2YgInN0
cnVjdCBwaXJxIi4gU28gcmVtb3ZlIGl0Lgo+Pj4KPj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBp
bnRlbmRlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPgo+Pgo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
Pgo+PiBJdCBpcyBnZW5lcmFsbHkgbmljZSB0byBpZGVudGlmeSBpZiB0aGlzIHdhcyBtaXNzZWQg
Y2xlYW51cCAodGhlCj4+IG5lZWQgaW5kZWVkIHdlbnQgYXdheSBpbiA0LjEyKSwgb3IgaWYgc3Vj
aCBoYXMgbmV2ZXIgcmVhbGx5IGJlZW4KPj4gbmVlZGVkLgo+IAo+IFllcyBpdCBpcyBuaWNlIHRv
IGhhdmUgYnV0IHRoaXMgaXMgYSBiZXN0IGVmZm9ydCBiYXNpcyBmb3IgY2xlYW51cC4gVGhleSAK
PiBhcmUgbm90IGZpeGVzIGFuZCB0aGVyZWZvcmUgbm90IGdvaW5nIHRvIGJlIGJhY2twb3J0ZWQu
IFNvIEkgZG9uJ3QgZmVlbCAKPiB0aGUgbmVlZCB0byBicm93c2UgbW9yZSB0aGFuIDE1IHllYXJz
IHdvcnRoIG9mIGhpc3RvcnkgYW5kIGNoZWNrIHdoZXRoZXIgCj4gYSBjbGVhbnVwIHdlcmUgbWlz
c2VkLgoKMTUgeWVhcnM/IEl0IHRvb2sgbWUgbGVzcyB0aGFuIGEgbWludXRlIChhIHNpbmdsZSBn
cmVwKSB0byBmaWd1cmUKdGhlIHZlcnNpb24gdGhpcyBiZWNhbWUgdW5uZWNlc3NhcnkgaW4uIEFu
ZCBJIHdvdWxkbid0IGFzayBmb3IKc3VjaCBvbiBhIHByZXR0eSBzaW1wbGUgcGF0Y2ggbGlrZSB0
aGlzIG9uZSBpZiBJIGFudGljaXBhdGVkIGEKbG90IG9mIGVmZm9ydCB0byBiZSBuZWVkZWQuCgo+
IFdoYXQgbWF0dGVyIGZvciBjbGVhbnVwIGlzIHRoZSBjdXJyZW50IGNvbnRleHQgYW5kIHdoZXRo
ZXIgdGhleSBtYWtlIAo+IHNlbnNlIG5vdy4KCkkgZGlzYWdyZWUuIEhpc3Rvcnkgb2Z0ZW4gaGVs
cHMgdW5kZXJzdGFuZCB3aGV0aGVyIHNvbWV0aGluZyB3YXMgZG9uZQppbiBhIGNlcnRhaW4gd2F5
IHdpdGhvdXQgYW4gb2J2aW91cyAoZnJvbSBjdXJyZW50IHN0YXRlIG9mIHRoaW5ncykKcmVhc29u
LgoKPiBBbnl3YXksIEkgd291bGQgYmUgaGFwcHkgdG8gYWRkIGEgd29yZCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UgaWYgeW91IAo+IHBvaW50IG1lIHRvIHRoZSBjb21taXQgcmVtb3ZpbmcgdGhlIG5l
ZWQuCgpNZSBoYXZpbmcgdG9sZCB5b3UgdGhlIHZlcnNpb24gaXQgZGlzYXBwZWFyZWQgaW4gd291
bGQgaGF2ZSBtYWRlIHRoaXMKdmVyeSBsb3cgZWZmb3J0IHRvIHlvdS4gQW55d2F5OiBjNzU5ZmI1
YmMzMDMgKCJ4ODY6IG1vdmUKaHZtX2RvbWFpbl91c2VfcGlycSB0byBodm0gZmlsZXMiKS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
