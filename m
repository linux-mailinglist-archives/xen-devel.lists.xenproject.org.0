Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BEB6179
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXCe-0000TV-SS; Wed, 18 Sep 2019 10:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAXCd-0000Sl-GQ
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:28:51 +0000
X-Inumbo-ID: 1ad20a31-d9ff-11e9-962b-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1ad20a31-d9ff-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:28:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06A1337;
 Wed, 18 Sep 2019 03:28:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097213F59C;
 Wed, 18 Sep 2019 03:28:47 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
Date: Wed, 18 Sep 2019 11:28:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wOS8yMDE5IDEwOjUyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4g
Cj4gCj4+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTE6NDksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDE4LjA5LjIwMTkgMDk6MzUsIFBhd2VsIFdpZWN6b3Jr
aWV3aWN6IHdyb3RlOgo+Pj4gVGhpcyBpcyBuZWVkZWQgZm9yIG1vcmUgcHJlY2lzZSBwYXRjaGFi
aWxpdHkgdmVyaWZpY2F0aW9uLgo+Pj4gT25seSBub24tc3BlY2lhbCAucm9kYXRhIHNlY3Rpb25z
IHNob3VsZCBiZSBzdWJqZWN0Cj4+PiBmb3Igc3VjaCBhIG5vbi1yZWZlcmVuY2VkIGNoZWNrIGlu
IGtwYXRjaF92ZXJpZnlfcGF0Y2hhYmlsaXR5KCkuCj4+PiBDdXJyZW50IGNoZWNrIChub24tc3Rh
bmRhcmQsIG5vbi1yZWxhLCBub24tZGVidWcpIGlzIHRvbyB3ZWFrIGFuZAo+Pj4gYWxsb3dzIGFs
c28gbm9uLXJvZGF0YSBzZWN0aW9ucyB3aXRob3V0IHJlZmVyZW5jZWQgc3ltYm9scyB0byBzbGlw
Cj4+PiB0aHJvdWdoLgo+Pj4KPj4+IERldGVjdCAucm9kYXRhIHNlY3Rpb24gYnkgY2hlY2tpbmcg
c2VjdGlvbidzIHR5cGUgKFNIVF9QUk9HQklUUyksCj4+PiBmbGFncyAobm8gZXhlYywgbm8gd3Jp
dGUpIGFuZCBmaW5hbGx5IG5hbWUgcHJlZml4Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhd2Vs
IFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPj4+IFJldmlld2VkLWJ5OiBBbmRy
YS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4+PiBSZXZpZXdlZC1ieTog
QmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KPj4+IFJldmlld2VkLWJ5OiBOb3JiZXJ0
IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPj4+IC0tLQo+Pj4gY29tbW9uLmMgICAgICAg
ICAgICAgfCAgNyArKysrKysrCj4+PiBjb21tb24uaCAgICAgICAgICAgICB8ICAxICsKPj4+IGNy
ZWF0ZS1kaWZmLW9iamVjdC5jIHwgMTMgKysrKysrLS0tLS0tLQo+Pj4gMyBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBTZWVpbmcgdGhhdCBJIGhh
dmUgYmVlbiBDYy1lZCBoZXJlIC0gd2hhdCB0cmVlIGlzIHRoaXMgYWdhaW5zdD8gSQo+PiBkb24n
dCByZWNvZ25pemUgdGhlIGZpbGUgbmFtZXMgYXMgYW55dGhpbmcgSSdtIGEgbWFpbnRhaW5lciBm
b3IuCj4+Cj4+IEphbgo+IAo+IFlvdSBoYXZlIGJlZW4gcHJvYmFibHkgYWRkZWQgYmVjYXVzZSBJ
IGhhdmUgdXNlZCB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4gCj4gJCBzY3JpcHRzLy4vYWRkX21h
aW50YWluZXJzLnBsIC1kIH4vZ2l0L2xpdmVwYXRjaC1idWlsZC10b29scwoKJy1kJyBvbmx5IHRl
bGxzIHlvdSB3aGVyZSB0aGUgcGF0Y2hlcyBmaWxlcyBhcmUuIFRoZSBzY3JpcHQgd2lsbCBsb29r
IHVwIGZvciB0aGUgCk1BSU5UQUlORVJTIGZpbGUgaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5LgoK
IEZyb20geW91IGNvbW1hbmQgbGluZSwgaXQgd291bGQgYmUgeGVuLmdpdC4gU28gaXQgaXMgbm90
IG5vcm1hbCB0aGUgd3JvbmcgCm1haW50YWluZXJzIGFyZSBDQ2VkLgoKV2hhdCB5b3Ugd2FudCBp
czoKCjQyc2g+IGNkIGxpdmVwYXRjaC1idWlsZC10b29scwo0MnNoPiAuLi94ZW4vc2NyaXB0cy9h
ZGRfbWFpbnRhaW5lcnMucGwgLWQgLgoKTm90ZSB0aGF0IHlvdSB3b3VsZCBuZWVkIHRoZSBwYXRj
aCBbMV0gaW4gb3JkZXIgdG8gZ2V0IHRoZSBzY3JpcHQgd29ya2luZy4KCkNoZWVycywKClsxXSBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDkvbXNnMDExMzkuaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
