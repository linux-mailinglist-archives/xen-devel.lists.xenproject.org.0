Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4A23A19
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 16:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSjJt-0007kx-6N; Mon, 20 May 2019 14:31:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSjJr-0007kr-N4
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:31:15 +0000
X-Inumbo-ID: eb9c8302-7b0b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id eb9c8302-7b0b-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 14:31:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA7B80D;
 Mon, 20 May 2019 07:31:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31FCF3F5AF;
 Mon, 20 May 2019 07:31:12 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com> <87a7fh8cr4.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <25b160f5-2f7d-40d9-8feb-9ea63a8a153f@arm.com>
Date: Mon, 20 May 2019 15:31:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87a7fh8cr4.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wNS8yMDE5IDE0OjQxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gRmlyc3Qgb2YgYWxsLCBwbGVhc2UgYWRk
IGEgY292ZXIgbGV0dGVyIHdoZW4geW91IHNlbmQgYSBzZXJpZXMuIFRoaXMKPj4gaGVscCBmb3Ig
dGhyZWFkaW5nIGFuZCBhbHNvIGEgcGxhY2UgdG8gY29tbWVuZCBvbiBnZW5lcmFsIGZlZWRiYWNr
Lgo+IE9oLCBva2F5LiBUaGF0IHdhcyBxdWl0ZSBzaW1wbGUgY2hhbmdlIGFuZCBJIGRpZG4ndCB3
YW50ZWQgdG8gc3BhbSB3aXRoCj4gZXh0cmEgZW1haWxzLiBJIHdpbGwgaW5jbHVkZSBjb3ZlciBs
ZXR0ZXIgbmV4dCB0aW1lLgo+IAo+PiBGdXJ0aGVybW9yZSwgcGxlYXNlIHVzZSBzY3JpcHRzL3th
ZGQsIGdldH1fbWFpbnRhaW5lcnMucGwgdG8gZmluZCB0aGUKPj4gY29ycmVjdCBtYWludGFpbmVy
cy4gV2hpbGUgSSBhZ3JlZSB0aGF0IENDaW5nIFJFU1QgaXMgYSBnb29kIGlkZWEsIHlvdQo+PiBo
YXZlbid0IENDZWQgYWxsIG9mIHRoZW0uCj4gUHJvYmxlbSBpcyB0aGF0IEkgdXNlZCB0aGlzIHNj
cmlwdDoKPiAKPiAkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiBkZWZjb25maWdfdjIv
djItMDAwMi1hcm0tcmVuYW1lLXRpbnk2NC5jb25mLXRvLXRpbnk2NF9kZWZjb25maWcucGF0Y2gK
Ci1mIGlzIHRvIGJlIHVzZWQgb24gYWN0dWFsIGZpbGUgaW4gdGhlIHNvdXJjZSB0cmVlLiBTbyB0
aGUgcmVzdWx0IGJlbG93IG1ha2VzIApzZW5zZS4gRm9yIGFjdHVhbCBwYXRjaCwgeW91IGhhdmUg
dG8gZHJvcCB0aGUgLWYuCgoKPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
Pgo+IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4geGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gCj4gSSB3YXMgcXVpdGUgc3VycHJpc2VkIGJ5IHJlc3VsdCBteXNlbGYuIEhv
bmVzdGx5LCBJIHdhbnRlZCB0byBDQyBvbmx5Cj4geW91IGFuZCBTdGVmYW5vLCBidXQgZGVjaWRl
ZCB0byBwbGF5IGJ5IHRoZSBydWxlcy4KPiAKPiAKPiBBbHNvLCBhZGRfbWFpbnRhaW5lcnMucGwg
anVzdCBpZ25vcmVzIHRoaXMgcGF0Y2ggYXQgYWxsOgo+IAo+ICUgc2NyaXB0cy9hZGRfbWFpbnRh
aW5lcnMucGwgLXYgMiAtZCBkZWZjb25maWdfdjIKPiBQcm9jZXNzaW5nOiB2Mi0wMDAxLW1ha2Vm
aWxlLWFkZC1zdXBwb3J0LWZvci1fZGVmY29uZmlnLXRhcmdldHMucGF0Y2gKPiBQcm9jZXNzaW5n
OiB2Mi0wMDAyLWFybS1yZW5hbWUtdGlueTY0LmNvbmYtdG8tdGlueTY0X2RlZmNvbmZpZy5wYXRj
aAo+IC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbDogZmlsZSAnZGVmY29uZmlnX3YyL3YyLTAw
MDItYXJtLXJlbmFtZS10aW55NjQuY29uZi10by10aW55NjRfZGVmY29uZmlnLnBhdGNoJyBkb2Vz
bid0IGFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRvIG9wdGlvbnM/CgpJIGhhdmUganVz
dCB0cmllZCBpdCBhbmQgY2FuJ3QgZmluZCB0aGUgc2FtZSBlcnJvci4gQ291bGQgeW91IHByb3Zp
ZGUgbW9yZSAKZGV0YWlscz8gU3VjaCBhcyB3aGVyZSB0byBkbyBjYWxsIGZyb20gdGhlIGV4YWN0
IGNvbnRlbnQgb2YgZWFjaCBwYXRjaGVzLi4uCgo+IAo+Pgo+PiBPbiAxNi8wNS8yMDE5IDE0OjM3
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9y
dHMgKl9kZWZjb25maWcgcnVsZXMgaXQgaXMgZ29vZCB0byBiZSBhYmxlCj4+PiB0byBjb25maWd1
cmUgbWluaW1hbCBYRU4gaW1hZ2Ugd2l0aAo+Pgo+PiBJIGFtIGFmcmFpZCB0aGlzIGlzIG5vdCBj
b3JyZWN0LiB0aW55NjQgd2lsbCBub3QgYmUgYWJsZSB0byBnZW5lcmF0ZSBhCj4+IG1pbmltYWwg
Y29uZmlnIHRvIGJvb3Qgb24gYW55IHBsYXRmb3JtIHN1cHBvcnRlZCBieSBYZW4uCj4+Cj4+IEl0
IGlzIG1lYW50IHRvIGJlIHVzZWQgYXMgYSBiYXNlIGZvciB0YWlsb3JpbmcgeW91ciBwbGF0Zm9y
bSB3aGVyZSBhbGwKPj4gdGhlIG9wdGlvbnMgYXJlIHR1cm5lZCBvZmYgYnkgZGVmYXVsdC4KPj4K
Pj4gU28gSSB0aGluayBvZmZlcmluZyBhIGRpcmVjdCBhY2Nlc3MgaXMgbGlrZWx5IGdvaW5nIHRv
IGJlIG1pc3VzZWQgaW4KPj4gbW9zdCBvZiB0aGUgY2FzZXMgd2l0aG91dCBwcm9wZXIgZG9jdW1l
bnRhdGlvbi4KPiAKPiBJbiB0aGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgU3RlZmFubyBzdWdn
ZXN0ZWQgdG8gdXNlIG9sZGRlZmNvbmZpZzoKPiAKPiAiICAgQWRkIGEgdGlueSBrY29uZmlnIGNv
bmZpZ3VyYXRpb24uIEVuYWJsZWQgb25seSB0aGUgY3JlZGl0IHNjaGVkdWxlci4KPiAgICAgIEl0
IG9ubHkgY2FycmllcyBub24tZGVmYXVsdCBvcHRpb25zICh1c2UgbWFrZSBtZW51Y29uZmlnIG9y
IG1ha2UKPiAgICAgIG9sZGRlZmNvbmZpZyB0byBwcm9kdWNlIGEgY29tcGxldGUgLmNvbmZpZyBm
aWxlKS4gIgo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBzaWduaWZpY2FudCBkaWZmZXJlbmNlIGJldHdl
ZW4KCkRpZCB5b3UgYWN0dWFsbHkgdHJ5IHRoZSB0d28gYXBwcm9hY2ggYW5kIHNlZSBob3cgdGhl
eSBkaWZmZXI/Cgo+IAo+ICMgY3AgdGlueTY0LmNvbmYgLmNvbmZpZyAmJiBtYWtlIG9sZGRlZmNv
bmZpZwoKVGhpcyBvbmUgd2lsbCBhc2sgeW91IGRldGFpbHMgb24gdGhlIGNvbmZpZ3VyYXRpb24g
eW91IHdhbnQgd2hpbGUuLi4KCj4gCj4gYW5kCj4gCj4gIyBtYWtlIHRpbnk2NF9kZWZjb25maWcK
Ci4uLiB0aGlzIG9uZSB3aWxsIGhpZGUgdGhlIHF1ZXN0aW9ucy4KCj4gCj4gQW55d2F5cywgaXQg
aXMgdXAgdG8geW91IHRvIGFjY2VwdCBvciBkZWNsaW5lIHRoaXMgcGFydGljdWxhciBwYXRjaC4g
SQo+IG1vc3RseSBpbnRlcmVzdGVkIGluIHRoZSBmaXJzdCBwYXRjaCBpbiB0aGUgc2VyaWVzLCBi
ZWNhdXNlIG91ciBidWlsZAo+IHN5c3RlbSBkZXBlbmRzIG9uIGl0LiBUaGlzIHZlcnkgcGF0Y2gg
SSBzZW50IG91dCBvbmx5IGJlY2F1c2UgSSB3YW50ZWQKPiB0byB0aWR5IHVwIHRoaW5ncyBhIGJp
dC4gQnV0IGlmIHlvdSBhcmUgc2F5aW5nIHRoYXQgaXQgaXMgaW50ZW5kZWQgdG8KPiBzdG9yZSBt
aW5pbWFsIGNvbmZpZyBpbiB0aGlzIHdheSwgSSdtIG9rYXkgd2l0aCBpdC4KClRoZSBwb2ludCBv
ZiByZXZpZXcgaXMgdG8gZGlzY3VzcyBvbiB0aGUgYXBwcm9hY2ggYW5kIGZpbmQgYSBjb21tb24g
YWdyZWVtZW50LgoKSWYgeW91IHJlYWQgbXkgcHJldmlvdXMgZS1tYWlsLCBJIGRpZG4ndCBjb21w
bGV0ZWx5IHJlamVjdCB0aGUgYXBwcm9hY2ggaW4gbXkgCnByZXZpb3VzIGUtbWFpbC4gSSBwb2lu
dGVkIG91dCB0aGF0IHRoZSB1c2VyIG1heSBiZSBtaXNsZWQgb2YgdGhlIG5hbWUgYW5kIGhlbmNl
IApkb2N1bWVudGF0aW9uIHdvdWxkIGJlIHVzZWZ1bC4KCkJ1dAoKCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
