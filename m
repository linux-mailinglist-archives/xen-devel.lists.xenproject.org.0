Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC318C818
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 08:24:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFBy8-0004W7-LG; Fri, 20 Mar 2020 07:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFBy7-0004W2-VI
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 07:21:23 +0000
X-Inumbo-ID: 66d5af1a-6a7b-11ea-bcee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66d5af1a-6a7b-11ea-bcee-12813bfff9fa;
 Fri, 20 Mar 2020 07:21:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB874ACDF;
 Fri, 20 Mar 2020 07:21:20 +0000 (UTC)
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
Date: Fri, 20 Mar 2020 08:21:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAyMDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE5
LzAzLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDE5
LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+PiBPbiBU
aHUsIE1hciAxOSwgMjAyMCBhdCAwNDoyMToyM1BNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4gwqAgPj4gV2h5IGNhbid0IHlvdSBrZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVyZT8KPj4+
Pgo+Pj4+IEJlY2F1c2UgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0
ZV9waHlzbWFwLCBhbmQKPj4+PiBjaGFuZ2VzIHRvIHRoZSBwaHltYXAgcmVxdWlyZSBhbiBBU0lE
IGZsdXNoIG9uIEFNRCBoYXJkd2FyZS4KPj4+Cj4+PiBJIGFtIGFmcmFpZCB0aGlzIGRvZXMgbm90
IHlldCBleHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBiZQo+Pj4gdXBk
YXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBBTUQgaGFyZHdhcmUuCj4+Cj4+IEN1cnJlbnQg
YmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24K
Pj4gZXZlcnkgVExCIGZsdXNoLgo+Pgo+PiBmbHVzaF90bGJfbWFzayBpcyB0b28gd2lkZWx5IHVz
ZWQgb24geDg2IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdzIG5vCj4+IG5lZWQgdG8gZmx1c2ggdGhl
IEFTSURzLiBUaGlzIHByZXZlbnRzIHVzaW5nIGFzc2lzdGVkIGZsdXNoZXMgKGJ5IEwwKQo+PiB3
aGVuIHJ1bm5pbmcgbmVzdGVkLCBzaW5jZSB0aG9zZSBhc3Npc3RlZCBmbHVzaGVzIHBlcmZvcm1l
ZCBieSBMMAo+PiBkb24ndCBmbHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4+Cj4+IEkgY291bGQg
a2VlcCBjdXJyZW50IGJlaGF2aW9yIGFuZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNvIGZsdXNo
aW5nIHRoZQo+PiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhlIGZ1bmN0aW9uIGRv
ZXNuJ3QgaGF2ZSBhbnl0aGluZyBpbgo+PiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBpdCBhbHNv
IGZsdXNoZXMgdGhlIGluLWd1ZXN0IFRMQnMgZm9yIEhWTS4KPiAKPiBJIGFncmVlIHRoZSBuYW1l
IGlzIGNvbmZ1c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1wbGVtZW50YXRpb24gdG8gdW5k
ZXJzdGFuZCB3aGF0IGl0IGRvZXMuCj4gCj4gSG93IGFib3V0IHJlbmFtaW5nIChvciBpbnRyb2R1
Y2luZykgdGhlIGZ1bmN0aW9uIHRvIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX21hc2soKSBvciBmbHVz
aF90bGJfYWxsX2d1ZXN0c19jcHVtYXNrKCkpID8KCkFuZCB0aGlzIHdvdWxkIHRoZW4gZmx1c2gg
X29ubHlfIGd1ZXN0IFRMQnM/Cgo+PiBJIHdvdWxkIHJhdGhlciBwcmVmZXIgdGhlIGRlZmF1bHQg
dG8gYmUgdG8gbm90IGZsdXNoIHRoZQo+PiBBU0lEcywgc28gdGhhdCB1c2VycyBuZWVkIHRvIHNw
ZWNpZnkgc28gYnkgcGFzc2luZyB0aGUgZmxhZyB0bwo+PiBmbHVza19tYXNrLgo+IFRoYXQncyB4
ODYgY2hvaWNlLiBGb3IgY29tbW9uLCBJIHdvdWxkIHJhdGhlciBubyBpbnRyb2R1Y2UgdGhvc2Ug
ZmxhZ3MgdW50aWwgd2UgaGF2ZSBhbm90aGVyIGFyY2ggdGhhdCBtYWtlIHVzZSBvZiBpdC4KClRo
ZSBmbGFncyBzaG91bGQgcGVyaGFwcyBpbmRlZWQgcmVtYWluIHg4Ni1zcGVjaWZpYywgYnV0IHN1
aXRhYmxlCndyYXBwZXJzIHVzYWJsZSBmcm9tIGNvbW1vbiBjb2RlIHNob3VsZCBleGlzdCAoYXMg
eW91IHN1Z2dlc3QKYmVsb3cpLgoKSmFuCgo+Pj4gVGhpcyB3b3VsZCBhY3R1YWxseSBtYXRjaCB0
aGUgYmVoYXZpb3Igb2YgZmx1c2hfdGxiX21hc2soKSBvbiBBcm0gd2hlcmUgYWxsCj4+PiB0aGUg
Z3Vlc3QgVExCcyB3b3VsZCBiZSByZW1vdmVkLgo+Pgo+PiBUaGF0J3MgaG93IGl0IHVzZWQgdG8g
YmUgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCwgYW5kIHRoZSB3aG9sZSBwb2ludAo+PiBpcyB0byBz
cGxpdCB0aGUgQVNJRCBmbHVzaGVzIGludG8gYSBzZXBhcmF0ZSBmbGFnLCBzbyBpdCdzIG5vdCBk
b25lCj4+IGZvciBldmVyeSBUTEIgZmx1c2guCj4gCj4gV2VsbCwgdGxiX2ZsdXNoX21hc2soKSBp
cyBvbmx5IGltcGxlbWVudGVkIGZvciB0aGUgYmVuZWZpdCBvZiBjb21tb24gY29kZS4gSXQgaGFz
IG5vIG90aGVyIHVzZXJzIG9uIEFybS4KPiAKPiBJdCBmZWVscyB0byBtZSB0aGF0IHdlIHdhbnQg
YW4gaGVscGVyIHRoYXQgd2lsbCBudWtlIGFsbCB0aGUgZ3Vlc3QgVExCcyBvbiBhIGdpdmVuIHNl
dCBvZiBDUFVzIChzZWUgYWJvdmUgZm9yIHNvbWUgbmFtZSBzdWdnZXN0aW9uKS4KPiAKPiBPbiB4
ODYsIHlvdSBjb3VsZCBpbXBsZW1lbnQgaXQgdXNpbmcgZmx1c2hfbWFzaygpLiBPbiBBcm0sIHRo
aXMgY291bGQgYmUgYSByZW5hbWUgb2YgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uIGZsdXNoX3RsYl9t
YXNrKCkuCj4gCj4gQ2hlZXJzLAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
