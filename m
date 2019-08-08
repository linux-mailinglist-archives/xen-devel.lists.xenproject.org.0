Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837E8614D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:05:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvh88-00025r-1Q; Thu, 08 Aug 2019 12:02:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvh86-00025m-2Q
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:02:50 +0000
X-Inumbo-ID: 7041c7b6-b9d4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7041c7b6-b9d4-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:02:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F028AF3F;
 Thu,  8 Aug 2019 12:02:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
 <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
 <c0530730-1a7b-5673-4c4d-9d6179384025@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1b44be52-db6a-673c-b1b6-840c0f52ed3f@suse.com>
Date: Thu, 8 Aug 2019 14:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0530730-1a7b-5673-4c4d-9d6179384025@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMTI6MjAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMDgvMjAxOSAx
MDozNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDguMDguMTkgMTA6MzMsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAwOC8wOC8yMDE5IDA1OjUwLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IE9uIDA3LjA4LjE5IDIwOjExLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pgo+Pj4+
PiA8c25pcD4KPj4+Pj4gSXRzIG5vdCBleGFjdGx5IHRoZSBlYXNpZXN0IHRvIGR1bXAgdG8gZm9s
bG93Lgo+Pj4+Pgo+Pj4+PiBGaXJzdCBvZiBhbGwgLSBJIGRvbid0IHNlZSB3aHkgdGhlIGhvbGQv
YmxvY2sgdGltZSBhcmUgcHJpbnRlZCBsaWtlCj4+Pj4+IHRoYXQuwqAgSXQKPj4+Pj4gbWlnaHQg
YmUgYSBob2xkb3ZlciBmcm9tIHRoZSAzMmJpdCBidWlsZCwgcHJlIFBSSWQ2NCBzdXBwb3J0LsKg
IFRoZXkKPj4+Pj4gc2hvdWxkCj4+Pj4+IHByb2JhYmx5IHVzZSBQUklfc3RpbWUgYW55d2F5Lgo+
Pj4+Cj4+Pj4gRmluZSB3aXRoIG1lLgo+Pj4+Cj4+Pj4+IFRoZSBkb21pZCByZW5kZXJpbmcgaXMg
dW5mb3J0dW5hdGUuwqAgSWRlYWxseSB3ZSdkIHVzZSAlcGQgYnV0IHRoYXQKPj4+Pj4gd291bGQK
Pj4+Pj4gaW52b2x2ZSByZWFycmFuZ2luZyB0aGUgbG9naWMgdG8gZ2V0IGEgc3RydWN0IGRvbWFp
biogaW4gaGFuZC4KPj4+Pj4gU2VlaW5nIGFzCj4+Pj4+IHlvdSdyZSB0aGUgbGFzdCBwZXJzb24g
dG8gbW9kaWZ5IHRoaXMgY29kZSwgaG93IGhhcmQgd291bGQgdGhhdCBiZSB0bwo+Pj4+PiBkbz8K
Pj4+Pgo+Pj4+IEl0IHdvdWxkIGNvbXBsZXRlbHkgYnJlYWsgdGhlIHN0cnVjdCB0eXBlIGFnbm9z
dGljIGRlc2lnbi4KPj4+Cj4+PiBPay7CoCBBcyBhbiBhbHRlcm5hdGl2ZWx5LCBob3cgYWJvdXQg
JXBkciB3aGljaCB0YWtlcyBhIHJhdyBkb21pZD/CoCBJdAo+Pj4gd291bGQgYmUgYSB0cml2aWFs
IGFkanVzdG1lbnQgaW4gdGhlIHZzbnByaW50ZiBjb2RlLCBhbmQgY291bGQgcGxhdXNpYmx5Cj4+
PiBiZSB1c2VmdWwgZWxzZXdoZXJlIHdoZXJlIHdlIGhhdmUgYSBkb21pZCBhbmQgbm90IGEgZG9t
YWluIHBvaW50ZXIuCj4+Cj4+IExvY2sgcHJvZmlsaW5nIGhhcyBubyBrbm93bGVkZ2UgdGhhdCBp
dCBpcyB3b3JraW5nIG9uIGEgc3RydWN0IGRvbWFpbi4KPj4gSXQgaXMganVzdCB3b3JraW5nIG9u
IGEgbG9jayBpbiBhIHN0cnVjdCBhbmQgYW4gaW5kZXggdG8gZGlmZmVyZW50aWF0ZQo+PiB0aGUg
c3RydWN0IGluc3RhbmNlLiBVc2luZyB0aGUgZG9taWQgYXMgdGhlIGluZGV4IGlzIGp1c3QgZm9y
IG1ha2luZyBpdAo+PiBtb3JlIGVhc3kgdG8gdW5kZXJzdGFuZCB0aGUgcHJpbnRvdXQuCj4+Cj4+
IEkgd291bGRuJ3Qgd2FudCBlLmcuIGEgcGVyLWV2ZW50IGxvY2sgdG8gYmUgbmFtZWQgIklETEUi
IGp1c3QgYmVjYXVzZQo+PiBpdCBoYXBwZW5zIHRvIGJlIGluZGV4IDMyNzY3Lgo+IAo+IE9rLCBi
dXQgY2xlYXJseSB0aGVyZSBpcyBzb21ldGhpbmcgd2hpY2ggZGlzdGluZ3Vpc2hlcyBkb21haW4g
aW5kaWNlcwo+IGZyb20gb3RoZXIgaW5kaWNlcz8KCk5vdCBmb3IgbG9jayBwcm9maWxpbmcuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
