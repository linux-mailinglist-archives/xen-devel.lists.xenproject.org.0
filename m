Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F1DC85D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLU3z-0007d3-IR; Fri, 18 Oct 2019 15:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RSmm=YL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iLU3x-0007cy-Ov
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:21:09 +0000
X-Inumbo-ID: e8f453dc-f1ba-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e8f453dc-f1ba-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 15:21:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D033CA2;
 Fri, 18 Oct 2019 08:21:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E17D3F718;
 Fri, 18 Oct 2019 08:21:07 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
 <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
 <2474d9869a5c46e39ea862a2c78a04c4@dornerworks.com>
 <8c959176-715b-db7d-cf2f-a810791f676f@arm.com>
 <bac0e5860e8d489cb0606732e943209a@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <01f2e4aa-7c04-72cf-df6f-8939a77562f1@arm.com>
Date: Fri, 18 Oct 2019 16:21:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bac0e5860e8d489cb0606732e943209a@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8xMC8yMDE5IDE3OjE4LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gT24g
VHVlc2RheSwgT2N0b2JlciAxNSwgMjAxOSA3OjAyIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IEhpLAo+IAo+IEhpIQo+IAo+Pgo+PiBPbiAxMC85LzE5IDU6NTkgUE0sIFN0ZXdhcnQgSGlsZGVi
cmFuZCB3cm90ZToKPj4+IEhvd2V2ZXIsIGV2ZW4gd2l0aCBYZW4gbG9va2luZyBmb3IgYmNtMjgz
OCwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8KPj4+IGdyYWIgb25lIG9mIHRob3NlIHJlbGVhc2Vz
IGFuZCBib290IHdpdGhvdXQgcnVubmluZyBpbnRvIG90aGVyIGlzc3Vlcy4KPj4+IFlvdSdkIHN0
aWxsIG5lZWQgYSBjb3VwbGUgb2YgYWRkaXRpb25hbCBwYXRjaGVzIGF0IFs0XS4gQ3VycmVudGx5
IHRoZQo+Pj4gb25seSB3YXkgdGhhdCBJJ20gYXdhcmUgb2YgdG8gc3VjY2Vzc2Z1bGx5IGJvb3Qg
aW50byBkb20wIGFuZCBsYXVuY2gKPj4+IGRvbVUgaXMgdG8gYnVpbGQgdGhlIGRvbTAga2VybmVs
IGZyb20gc291cmNlIHdpdGggdGhlIGV4dHJhIHBhdGNoZXMKPj4+IGFwcGxpZWQgZm91bmQgYXQg
WzRdLgo+Pgo+PiBJcyB0aGVyZSBhbnkgcGxhbiB0byB1cHN0cmVhbSB0aG9zZSBwYXRjaGVzPwo+
IAo+IFR3byBvZiB0aGUgcGF0Y2hlcyBhcmUgYWRkaW5nIGRldmljZSB0cmVlIG5vZGVzICh4ZW4s
eGVuLWJvb3RhcmdzLAo+IGV0YyksIHNvIHRob3NlIGFyZSB1bmxpa2VseSB0byBiZSB1cHN0cmVh
bWVkLiBPbmUgcGF0Y2ggaXMgYQo+IGhhY2svd29ya2Fyb3VuZCB0byBkaXNhYmxlIERNQSBmb3Ig
dGhlIFNEIGNhcmQsIGFsc28gdW5saWtlbHkgdG8gYmUKPiB1cHN0cmVhbWVkLiBGaW5hbGx5LCB0
aGUgbGFzdCBwYXRjaCBhZGRzIGEgY2hlY2sgdG8gYXZvaWQgaW52b2tpbmcKPiB4ZW5fZG1hX29w
cyByZWN1cnNpdmVseS4gVGhpcyBvbmUgY291bGQgcG90ZW50aWFsbHkgYmUgdXBzdHJlYW1lZCwK
PiB0aG91Z2ggd2UgaGF2ZW4ndCBzdWJtaXR0ZWQgb3IgZ2F0aGVyZWQgYW55IGlucHV0IGZyb20g
dGhlIGxpbnV4IG9yCj4gcmFzcGJlcnJ5IHBpIGNvbW11bml0aWVzIHlldC4KPiAKPiBXZSBhcmUg
dHJhY2tpbmcgdGhlIGZvbGxvd2luZyBwYXRjaCBzZXRzIFs1XSBbNl0gWzddIGZvciB1cHN0cmVh
bSwgYW5kCj4gb3VyIGN1cnJlbnQgcGxhbiBpcyBiYXNpY2FsbHkgdG8gd2FpdCB1bnRpbCB0aGV5
IGhhdmUgYmVlbiBtZXJnZWQsIHRyeQo+IGJvb3RpbmcgdGhlIHVwc3RyZWFtIGtlcm5lbCwgdGhl
biBzZWUgaWYgaXQgaXMgc3RpbGwgbmVjZXNzYXJ5IHRvIGFwcGx5Cj4gdGhlIERNQSB3b3JrYXJv
dW5kcy4KPiAKPiBbNV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTE2NTM5
NS8KPiBbNl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTE1OTM3OS8KPiBb
N10gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTE0MTcxOS8KClRoYW5rIHlv
dSBmb3IgdGhlIGluZm9ybWF0aW9uLiBMZXQgU3RlZmFubyBhbmQgSSBrbm93IGlmIHdlIGNhbiBo
ZWxwLgoKPiAKPj4+ICJJZiB5b3UgYXJlIHVzaW5nIGEgZGV2aWNlIHRyZWUgd2l0aCB0aGUgb2xk
IGNvbXBhdGlibGUgc3RyaW5nCj4+PiBicmNtLGJjbTI4MzgsIHlvdSB3aWxsIG5lZWQgdG8gdXBn
cmFkZSB5b3VyIGRldmljZSB0cmVlIHRvIG9uZSB0aGF0IGhhcwo+Pj4gdGhlIG5ldyBicmNtLGJj
bTI3MTEgY29tcGF0aWJsZSBzdHJpbmcuIgo+Pgo+PiBUaGF0J3MgZmluZSB3aXRoIG1lLgo+IAo+
IE9LLCBzaW5jZSBpdCdzIHNpbXBseSBhIG1hdHRlciBvZiBhZGRpbmcgdGhpcyB0byB0aGUgY29t
bWl0IG1lc3NhZ2UsCj4gY2FuIGl0IGJlIGFkZGVkIG9uIGNvbW1pdD8gT3Igc2hvdWxkIEkgc3Bp
biBhIHYzIHdpdGggdGhlIHVwZGF0ZWQKPiBjb21taXQgbWVzc2FnZT8KCkNhbiB5b3UgcGxlYXNl
IHJlc3BpbiB0aGUgcGF0Y2ggYW5kIENDIEp1ZXJnZW4/CkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
