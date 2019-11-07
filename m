Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F0F280D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 08:34:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iScHA-000834-UU; Thu, 07 Nov 2019 07:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iScH9-00082w-Ua
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 07:32:15 +0000
X-Inumbo-ID: b769563e-0130-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b769563e-0130-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 07:32:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45B2CB4EC;
 Thu,  7 Nov 2019 07:32:13 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <e2f2efa0-8f52-087a-9c72-2c8b176cc092@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dce97340-6a31-10d4-ddd3-45f34d2fd277@suse.com>
Date: Thu, 7 Nov 2019 08:32:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e2f2efa0-8f52-087a-9c72-2c8b176cc092@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxOToyOSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA2LzEx
LzIwMTkgMTY6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiB1cGRhdGVfcGFnaW5nX21vZGUoKSBp
biB0aGUgQU1EIElPTU1VIGNvZGUgZXhwZWN0cyB0byBiZSBpbnZva2VkIHdpdGgKPj4gdGhlIFBD
SSBkZXZpY2VzIGxvY2sgaGVsZC4gVGhlIGNoZWNrIG9jY3VycmluZyBvbmx5IHdoZW4gdGhlIG1v
ZGUKPj4gYWN0dWFsbHkgbmVlZHMgdXBkYXRpbmcsIHRoZSB2aW9sYXRpb24gb2YgdGhpcyBydWxl
IGJ5IHRoZSBtYWpvcml0eQo+PiBvZiBjYWxsZXJzIGRpZCBnbyB1bm5vdGljZWQgdW50aWwgcGVy
LWRvbWFpbiBJT01NVSBzZXR1cCB3YXMgY2hhbmdlZAo+PiB0byBkbyBhd2F5IHdpdGggb24tZGVt
YW5kIGNyZWF0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzLgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IHRo
ZSBvbmx5IGhhbGYgd2F5IHJlYXNvbmFibGUgZml4IHRvIHRoaXMgdGhhdCBJIGNvdWxkCj4+IGNv
bWUgdXAgd2l0aCByZXF1aXJlcyBtb3JlIHJlLXdvcmsgdGhhbiB3b3VsZCBzZWVtIGRlc2lyYWJs
ZSBhdCB0aGlzCj4+IHRpbWUgb2YgdGhlIHJlbGVhc2UgcHJvY2VzcywgYnV0IGFkZHJlc3Npbmcg
dGhlIGlzc3VlIHNlZW1zCj4+IHVuYXZvaWRhYmxlIHRvIG1lIGFzIGl0cyBtYW5pZmVzdGF0aW9u
IGlzIGEgcmVncmVzc2lvbiBmcm9tIHRoZQo+PiBJT01NVSBwYWdlIHRhYmxlIHNldHVwIHJlLXdv
cmsuIFRoZSBjaGFuZ2UgYWxzbyBpc24ndCB3aXRob3V0IHJpc2sKPj4gb2YgZnVydGhlciByZWdy
ZXNzaW9ucyAtIGlmIGluIHBhdGNoIDIgSSd2ZSBtaXNzZWQgYSBjb2RlIHBhdGggdGhhdAo+PiB3
b3VsZCBhbHNvIG5lZWQgdG8gaW52b2tlIHRoZSBuZXcgaG9vaywgdGhlbiB0aGlzIG1pZ2h0IG1l
YW4gbm9uLQo+PiB3b3JraW5nIGd1ZXN0cyAod2l0aCBwYXNzZWQtdGhyb3VnaCBkZXZpY2VzIG9u
IEFNRCBoYXJkd2FyZSkuCj4+Cj4+IDE6IEFNRC9JT01NVTogZG9uJ3QgbmVlZGxlc3NseSB0cmln
Z2VyIGVycm9ycy9jcmFzaGVzIHdoZW4gdW5tYXBwaW5nIGEgcGFnZQo+PiAyOiBpbnRyb2R1Y2Ug
R0ZOIG5vdGlmaWNhdGlvbiBmb3IgdHJhbnNsYXRlZCBkb21haW5zCj4+IDM6IEFNRC9JT01NVTog
dXNlIG5vdGlmeV9kZm4oKSBob29rIHRvIHVwZGF0ZSBwYWdpbmcgbW9kZQo+IAo+IEkganVzdCB0
ZXN0ZWQgYW5kIEkgZG9uJ3QgZ2V0IHRoZSAgInBjaWRldnMiIG1lc3NhZ2UgYW55IG1vcmUuCgpU
aGFua3MgZm9yIHRlc3RpbmcgdGhlIHNlcmllcy4KCj4gSSBhc3N1bWUgdGhpcyBvbmx5IHdhcyBh
IGZpeCBmb3IgdGhhdCBpc3N1ZSwgc28gaXQncyBwcm9iYWJseSBleHBlY3RlZAo+IHRoYXQgdGhl
IG90aGVyIGlzc3VlOgo+ICAgIEFNRC1WaTogSU5WQUxJRF9ERVZfUkVRVUVTVCAwMDAwMDgwMCA4
YTAwMDAwMCBmODAwMDg0MCAwMDAwMDBmZAo+ICAgIGFuZCBtYWxmdW5jdGlvbmluZyBkZXZpY2Ug
aW4gb25lIG9mIHRoZSBndWVzdHMuCj4gaXMgc3RpbGwgYXJvdW5kLgoKSW5kZWVkLiBTb21lb25l
IChwb3NzaWJseSBtZSkgc3RpbGwgbmVlZHMgdG8gbG9vayBpbnRvIHRoZSBvdGhlciBvbmUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
