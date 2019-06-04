Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B08534465
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY6fW-0005kw-Ub; Tue, 04 Jun 2019 10:27:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY6fU-0005km-Ue
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:27:48 +0000
X-Inumbo-ID: 65b4e21a-86b3-11e9-a7c8-af94f22f5751
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 65b4e21a-86b3-11e9-a7c8-af94f22f5751;
 Tue, 04 Jun 2019 10:27:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EFFD80D;
 Tue,  4 Jun 2019 03:27:47 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595C03F246;
 Tue,  4 Jun 2019 03:27:45 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
 <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
 <4cbc0130-6892-19c2-9678-1a6513ac58ec@arm.com>
 <alpine.DEB.2.21.1906031552300.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <10817a87-9a61-ee15-9b82-1596b1f90156@arm.com>
Date: Tue, 4 Jun 2019 11:27:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906031552300.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 04/19] xen/arm: Rework
 HSCTLR_BASE
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvNC8xOSAxMjoxMiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFdlZCwgMjkgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gUGluZywgaXQg
d291bGQgYmUgZ29vZCB0byBrbm93IHdoaWNoIGJpdHMgSSBkcm9wcGVkLi4uCj4+Cj4+IE9uIDIx
LzA1LzIwMTkgMTE6MDksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDUv
MjAvMTkgMTE6NTYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBPbiBUdWUsIDE0
IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IFRoZSBjdXJyZW50IHZhbHVlIG9m
IEhTQ1RMUl9CQVNFIGZvciBBcm02NCBpcyBwcmV0dHkgd3JvbmcuIEl0IHdvdWxkCj4+Pj4+IGFj
dHVhbGx5IHR1cm4gb24gU0NUTFJfRUwyLm5BQSAoYml0IDYpIG9uIGhhcmR3YXJlIGltcGxlbWVu
dGluZwo+Pj4+PiBBUk12OC40LUxTRS4KPj4+Pj4KPj4+Pj4gRnVydGhlcm1vcmUsIHRoZSBkb2N1
bWVudGF0aW9uIG9mIHdoYXQgaXMgY2xlYXJlZC9zZXQgaW4gU0NUTFJfRUwyIGlzCj4+Pj4+IGFs
c28gbm90IGNvcnJlY3QgYW5kIGxvb2tzIGxpa2UgdG8gYmUgYSB2ZXJiYXRpbSBjb3B5IGZyb20g
QXJtMzIuCj4+Pj4+Cj4+Pj4+IEhTQ1RMUl9CQVNFIGlzIHJlcGxhY2VkIHdpdGggYSBidW5jaCBv
ZiBwZXItYXJjaGl0ZWN0dXJlIG5ldyBkZWZpbmVzCj4+Pj4+IGhlbHBpbmcgdG8gdW5kZXJzdGFu
ZCBiZXR0ZXIgd2hhdCBpcyB0aGUgaW5pdGlhbGllIHZhbHVlIGZvcgo+Pj4KPj4+IHMvaW5pdGlh
bGllL2luaXRpYWwvCj4+Pgo+Pj4+PiBTQ1RMUl9FTDIvSFNDVExSLgo+Pj4+Pgo+Pj4+PiBOb3Rl
IHRoZSBkZWZpbmVzICpfQ0xFQVIgYXJlIG9ubHkgdXNlZCB0byBjaGVjayB0aGUgc3RhdGUgb2Yg
ZWFjaCBiaXRzCj4+Pj4+IGFyZSBrbm93bi4KPj4+Pgo+Pj4+IFNvIGJhc2ljYWxseSB0aGUgb25s
eSBwdXJwb3NlIG9mIEhTQ1RMUl9DTEVBUiBpcyB0byBleGVjdXRlOgo+Pj4+Cj4+Pj4gIMKgwqAg
I2lmIChIU0NUTFJfU0VUIF4gSFNDVExSX0NMRUFSKSAhPSAweGZmZmZmZmZmVQo+Pj4+Cj4+Pj4g
UmlnaHQ/IEl0IGlzIGdvb2QgdG8gaGF2ZSB0aGUgY2hlY2suCj4+Pj4KPj4+PiBQbGVhc2UgYWRk
IGEgb25lLWxpbmUgY29tbWVudCBvbiB0b3Agb2YgSFNDVExSX0NMRUFSIC0tICJvbmx5IHVzZWQg
dG8KPj4+PiBjaGVjayB0aGF0IHRoZSBzdGF0ZSBvZiBlYWNoIGJpdHMgYXJlIGtub3duIi4KPj4+
Cj4+PiBXZSBkb24ndCBjb21tb25seSBhZGQgYSBjb21tZW50IGV2ZXJ5IHRpbWUgYSBkZWZpbmUg
aXMgdXNlZCBvbmx5IG9uZSB0aW1lLgo+Pj4gU28gd2hhdCdzIHRoZSBiZW5lZml0cyBoZXJlPwo+
Pj4KPj4+IEluIGFsbCBob25lc3R5LCBzdWNoIHdvcmRpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
IHdhcyBwcm9iYWJseSBvdmVyIHRoZQo+Pj4gdG9wLiBJIGFtIHRoaW5raW5nIHRvIHJlcGxhY2Ug
dGhlIHNlbnRlbmNlIHdpdGg6Cj4+Pgo+Pj4gIkxhc3RseSwgYWxsIHRoZSBiaXRzIGFyZSBub3cg
ZGVzY3JpYmVkIGFzIGVpdGhlciBzZXQgb3IgY2xlYXJlZC4gVGhpcwo+Pj4gYWxsb3dzIHVzIHRv
IGNoZWNrIGF0IHByZS1wcm9jZXNzaW5nIHRpbWUgdGhlIGNvbnNpc3RlbmN5IG9mIHRoZSBpbml0
aWFsCj4+PiB2YWx1ZS4iCj4gCj4gVGhpcyBpcyBldmVuIGNsZWFyZXIsIGJ1dCBJIHVuZGVyc3Rv
b2QgdGhhdCBwYXJ0IG9mIHRoZSBjb21taXQgbWVzc2FnZQo+IHdlbGwgZW5vdWdoIGV2ZW4gYmVm
b3JlLiBJIGhhdmUgbm8gY29tcGxhaW50cyB0aGVyZS4gTXkgc3VnZ2VzdGlvbiBmb3IKPiBhbiBp
bi1jb2RlIGNvbW1lbnQgaXMgYmVjYXVzZSB0aGUgcHVycG9zZSBvZiBIU0NUTFJfQ0xFQVIgaXMg
bm90Cj4gaW1tZWRpYXRlbHkgb2J2aW91cyBsb29raW5nIGF0IHRoZSBjb2RlIG9ubHkuICBUaGUg
Y29tbWl0IG1lc3NhZ2UgaXMKPiBmaW5lLiBJIHRoaW5rIHRoYXQgYSBvbmUtbGluZXIgaW4gdGhl
IGNvZGUgdG8gc2F5IHRoYXQgSFNDVExSX0NMRUFSIGlzCj4gIm9ubHkgdXNlZCBhdCBwcmUtcHJv
Y2Vzc2luZyB0aW1lIiB3b3VsZCBiZSBnb29kIHRvIGhhdmUgYW5kIGJlbmVmaWNpYWwKPiBmb3Ig
Y29kZSByZWFkYWJpbGl0eS4KCkl0IGlzIHF1aXRlIGFuIG9kZCBjb21tZW50IGFzIGEgbG90IG9m
IGRlZmluZXMgYXJlIG9ubHkgdXNlZCBmb3IgCnByZS1wcm9jZXNzaW5nIGl0IChpLmUgQ09ORklH
XyBvciBldmVuIG1hY3JvIGdlbmVyYXRpbmcgZnVuY3Rpb24pLi4uIEl0IAppcyBnb2luZyB0byBy
b3QgcXVpY2tseSBidXQgSSBjYW4gYWRkIGl0IGlmIHlvdSB0aGluayBpdCBpbXByb3ZlcyB0aGUg
CmNvZGUuLi4KCj4+Pj4gU2FtZSBoZXJlLCB5b3UgcmVtb3ZlZCB0aGUgcmVzZXJ2ZWQgYml0cywg
YW5kIGFkZGVkIHRoZSBhbGlnbm1lbnQgY2hlY2ssCj4+Pj4gc2FtZSBhcyBmb3IgYWFyY2gzMi4g
SWYgSSBnb3QgaXQgcmlnaHQsIGl0IHdvdWxkIGJlIG5pY2UgdG8gYWRkIGEKPj4+PiBzdGF0ZW1l
bnQgbGlrZSB0aGlzIHRvIHRoZSBjb21taXQgbWVzc2FnZS4KPj4+Cj4+PiBJIGRvbid0IHNlZSB3
aHkgInJlc2VydmVkIGJpdHMiIEkgZHJvcHBlZCBub3Igd2hpY2ggYWxpZ25tZW50IGNoZWNrIEkg
YWRkZWQuCj4+Pgo+Pj4gSXQgd291bGQgYmUgZXh0cmVtZWx5IHVzZWZ1bCBpZiB5b3UgcHJvdmlk
ZSBtb3JlIGRldGFpbHMgaW4geW91ciByZXZpZXcuLi4KPj4+IEluIHRoaXMgY2FzZSwgaXQgd291
bGQgYmUgdGhlIGV4YWN0IGJpdHMgSSBkcm9wcGVkL2FkZGVkLgo+IAo+IEkgbG9va2VkIGF0IHRo
ZSBmdWxsIHZhbHVlIG9mIFNDVExSX0VMMl9TRVQsIGl0J3MgMHgzMGM1MTgzOC4gSQo+IGNvcHkv
cGFzdGUgaGVyZSB0aGUgd2NhbGMgY29tbWFuZCBmb3Igb3VyIG93biBjb252ZW5pZW5jZToKPiAK
PiB3Y2FsYyAtaCAnKDE8PDQpfCgxPDw1KXwoMTw8MTEpfCgxPDwxNil8KDE8PDE4KXwoMTw8MjIp
fCgxPDwyMyl8KDE8PDI4KXwoMTw8MjkpfCgxPDwzKXwoMTw8MTIpJwo+IAo+IEhTQ1RMUl9CQVNF
IGlzIDB4MzBjNTE4NzguIFRoZSBkaWZmZXJlbmNlIGlzIGJpdCA2IHdoaWNoIGlzIFJFUzAuIEl0
Cj4gbG9va3MgbGlrZSBJIHdhcyB3cm9uZyBhYm91dCB0aGUgYWxpZ25tZW50IGNoZWNrLgoKVGhp
cyB3YXMgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZToKCiJUaGUgY3VycmVudCB2YWx1
ZSBvZiBIU0NUTFJfQkFTRSBmb3IgQXJtNjQgaXMgcHJldHR5IHdyb25nLiBJdCB3b3VsZAphY3R1
YWxseSB0dXJuIG9uIFNDVExSX0VMMi5uQUEgKGJpdCA2KSBvbiBoYXJkd2FyZSBpbXBsZW1lbnRp
bmcKQVJNdjguNC1MU0UuIgoKPiAKPiAKPj4+Pgo+Pj4+Cj4+Pj4+ICsjZGVmaW5lIFNDVExSX0VM
Ml9DTEVBUiAoU0NUTFJfRUwyX1JFUzDCoMKgwqDCoCB8IFNDVExSX0F4eF9FTHhfTcKgwqAgfFwK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
Q1RMUl9BeHhfRUx4X0HCoMKgwqAgfCBTQ1RMUl9BeHhfRUx4X0PCoMKgIHxcCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0NUTFJfQXh4X0VM
eF9XWE7CoCB8IFNDVExSX0F4eF9FTHhfRUUpCj4+Pj4+ICsKPj4+Pj4gKyNpZiAoU0NUTFJfRUwy
X1NFVCBeIFNDVExSX0VMMl9DTEVBUikgIT0gMHhmZmZmZmZmZmZmZmZmZmZmVUwKPj4+Pj4gKyNl
cnJvciAiSW5jb25zaXN0ZW50IFNDVExSX0VMMiBzZXQvY2xlYXIgYml0cyIKPj4+Pj4gKyNlbmRp
Zgo+Pj4+PiArCj4+Pj4+ICsjZW5kaWYKPj4+Pj4gIMKgIC8qIEhDUiBIeXAgQ29uZmlndXJhdGlv
biBSZWdpc3RlciAqLwo+Pj4+PiAgwqAgI2RlZmluZSBIQ1JfUlfCoMKgwqDCoMKgwqDCoMKgwqAg
KF9BQygxLFVMKTw8MzEpIC8qIFJlZ2lzdGVyIFdpZHRoLCBBUk02NCBvbmx5Cj4+Pj4+ICovCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
