Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83366FDF8A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:59:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc5k-0000oT-3U; Fri, 15 Nov 2019 13:56:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVc5j-0000oM-8p
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:56:51 +0000
X-Inumbo-ID: c554f8fe-07af-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c554f8fe-07af-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:56:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E9E4AFF4;
 Fri, 15 Nov 2019 13:56:49 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <cc10107e-ce08-44ee-1dc0-695020396b11@suse.com>
 <dc06f24a-0db3-ec91-7195-771752ca48e3@eikelenboom.it>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f8cdc546-71c9-ff13-4869-dbbb48926303@suse.com>
Date: Fri, 15 Nov 2019 14:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <dc06f24a-0db3-ec91-7195-771752ca48e3@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTQ6NTEsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiBPbiAwOC8xMS8y
MDE5IDA3OjA2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAzMC4xMC4xOSAxOTowNiwgQW50
aG9ueSBQRVJBUkQgd3JvdGU6Cj4+PiBQYXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0
IGJyYW5jaDoKPj4+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVy
YXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4LWV2X3FtcC1tdWx0aS1jb25uZWN0LXYyCj4+Pgo+
Pj4gSGksCj4+Pgo+Pj4gUUVNVSdzIFFNUCBzb2NrZXQgZG9lc24ndCBhbGxvdyBtdWx0aXBsZSBj
b25jdXJyZW50IGNvbm5lY3Rpb24uIEFsc28sIGl0Cj4+PiBsaXN0ZW4oKSBvbiB0aGUgc29ja2V0
IHdpdGggYSBgYmFja2xvZycgb2Ygb25seSAxLiBPbiBMaW51eCBhdCBsZWFzdCwgb25jZSB0aGF0
Cj4+PiBiYWNrbG9nIGlzIGZpbGxlZCBjb25uZWN0KCkgd2lsbCByZXR1cm4gRUFHQUlOIGlmIHRo
ZSBzb2NrZXQgZmQgaXMKPj4+IG5vbi1ibG9ja2luZy4gbGlieGwgbWF5IGF0dGVtcHQgbWFueSBj
b25jdXJyZW50IGNvbm5lY3QoKSBhdHRlbXB0IGlmIGZvcgo+Pj4gZXhhbXBsZSBhIGd1ZXN0IGlz
IHN0YXJ0ZWQgd2l0aCBzZXZlcmFsIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLCBhbmQgYQo+Pj4g
Y29ubmVjdCgpIGZhaWx1cmUgbGVhZCB0byBhIGZhaWx1cmUgdG8gc3RhcnQgdGhlIGd1ZXN0Lgo+
Pj4KPj4+IFNpbmNlIHdlIGNhbid0IGNoYW5nZSB0aGUgbGlzdGVuKCkncyBgYmFja2xvZycgdGhh
dCBRRU1VIHVzZSwgd2UgbmVlZCBvdGhlcgo+Pj4gd2F5cyB0byB3b3JrYXJvdW5kIHRoZSBpc3N1
ZS4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlIGEgbG9jayB0byBhY3F1aXJlCj4+PiBiZWZv
cmUgYXR0ZW1wdGluZyB0byBjb25uZWN0KCkgdG8gdGhlIFFNUCBzb2NrZXQuIFNpbmNlIHRoZSBs
b2NrIG1pZ2h0IGJlIGhlbGQKPj4+IGZvciB0byBsb25nLCB0aGUgc2VyaWVzIGFsc28gaW50cm9k
dWNlIGEgd2F5IHRvIGNhbmNlbCB0aGUgYWNxdWlzaXRpb24gb2YgdGhlCj4+PiBsb2NrLCB0aGlz
IG1lYW5zIGtpbGxpbmcgdGhlIHByb2Nlc3MgdGhhdCB0cmllcyB0byBnZXQgdGhlIGxvY2suCj4+
Pgo+Pj4gU2VlIHRocmVhZFsxXSBmb3IgZGlzY3Vzc2VkIGFsdGVybmF0aXZlLgo+Pj4gWzFdIGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0x
MC9tc2cwMTgxNS5odG1sCj4+Pgo+Pj4gQ2hlZXJzLAo+Pj4KPj4+IEFudGhvbnkgUEVSQVJEICg2
KToKPj4+ICAgICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9jaGlsZF9raWxsX2RlcmVnaXN0
ZXIKPj4+ICAgICBsaWJ4bDogTW92ZSBsaWJ4bF9fZXZfZGV2bG9jayBkZWNsYXJhdGlvbgo+Pj4g
ICAgIGxpYnhsOiBSZW5hbWUgZXZfZGV2bG9jayB0byBldl9zbG93bG9jawo+Pj4gICAgIGxpYnhs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X3Nsb3dsb2NrX2Rpc3Bvc2UKPj4+ICAgICBsaWJ4bDogbGli
eGxfX2V2X3FtcF9zZW5kIG5vdyB0YWtlcyBhbiBlZ2MKPj4+ICAgICBsaWJ4bF9xbXA6IEhhdmUg
YSBsb2NrIGZvciBRTVAgc29ja2V0IGFjY2Vzcwo+Pj4KPj4+ICAgIHRvb2xzL2xpYnhsL2xpYnhs
X2Rpc2suYyAgICAgICAgfCAgMTYgKystLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfZG0uYyAg
ICAgICAgICB8ICAgOCArLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfZG9tX3NhdmUuYyAgICB8
ICAgMiArLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyB8ICAgMiArLQo+
Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICAgICB8ICAxOCArKy0tLQo+Pj4gICAg
dG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyAgICAgICB8ICAgNiArLQo+Pj4gICAgdG9vbHMvbGli
eGwvbGlieGxfZm9yay5jICAgICAgICB8ICA0OCArKysrKysrKysrKysKPj4+ICAgIHRvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmMgICAgfCAgNDEgKysrKysrKy0tLQo+Pj4gICAgdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaCAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfcGNpLmMgICAgICAgICB8ICAgOCArLQo+Pj4g
ICAgdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgICAgICAgICB8IDExOSArKysrKysrKysrKysrKysr
KysrKysrKystLS0tLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfdXNiLmMgICAgICAgICB8ICAy
OCArKysrLS0tCj4+PiAgICAxMiBmaWxlcyBjaGFuZ2VkLCAzMDEgaW5zZXJ0aW9ucygrKSwgMTI1
IGRlbGV0aW9ucygtKQo+Pj4KPj4KPj4gRm9yIHRoZSBzZXJpZXM6Cj4+Cj4+IFJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4KPj4KPj4gSnVlcmdlbgo+
IAo+IEhpIEp1ZXJnZW4sCj4gCj4gU2luY2UgYSBsb3QgbW9yZSByZWNlbnQgcGF0Y2hlcyBoYXZl
IGJlZW4gY29tbWl0dGVkLCBidXQgdGhlc2UgZG9uJ3Qgc2VlbSB0by4KPiBJIHdhcyB3b25kZXJp
bmcgaWYgdGhlc2UgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3MuCgpIaSBTYW5kZXIsCgpJJ20gbm8g
Y29tbWl0dGVyLCAianVzdCIgdGhlIG9uZSB3aG8gYWxsb3dzIHRoZSBjb21taXR0ZXJzIHRvIHRh
a2UgYQpwYXRjaCBvciBzZXJpZXMgYXQgdGhhdCBwaGFzZSBvZiB0aGUgcmVsZWFzZS4uLgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
