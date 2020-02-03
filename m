Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7BD15065F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:51:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybAB-0002tM-3a; Mon, 03 Feb 2020 12:49:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iybA9-0002tH-T4
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:49:13 +0000
X-Inumbo-ID: 93e63cc0-4683-11ea-8e55-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93e63cc0-4683-11ea-8e55-12813bfff9fa;
 Mon, 03 Feb 2020 12:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CAC50AD48;
 Mon,  3 Feb 2020 12:49:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34f1a05a-fc31-dfc7-adc5-cdad9adab318@suse.com>
Date: Mon, 3 Feb 2020 13:49:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203124127.GV4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAwMywgMjAyMCBhdCAwMTozMDo1NVBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6
Cj4+IE9uIDAzLzAyLzIwMjAgMTM6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBN
b24sIEZlYiAwMywgMjAyMCBhdCAwOTozMzo1MUFNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20g
d3JvdGU6Cj4+Pj4gSGkgUm9nZXIsCj4+Pj4KPj4+PiBMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBh
biBpc3N1ZSB3aXRoIHRoZSBQQ0ktcGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCj4+
Pj4gSW4gdGhlIGd1ZXN0IEkgZ2V0Ogo+Pj4+ICAgICBbIDExNDMuMzEzNzU2XSB4aGNpX2hjZCAw
MDAwOjAwOjA1LjA6IHhIQ0kgaG9zdCBub3QgcmVzcG9uZGluZyB0byBzdG9wIGVuZHBvaW50IGNv
bW1hbmQuCj4+Pj4gICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhD
SSBob3N0IGNvbnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkCj4+Pj4gICAgIFsg
MTE0My4zNDczNjRdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogSEMgZGllZDsgY2xlYW5pbmcgdXAK
Pj4+PiAgICAgWyAxMTQzLjM1NjQwN10gdXNiIDEtMjogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBu
dW1iZXIgMgo+Pj4+Cj4+Pj4gQmlzZWN0aW9uIHR1cm5lZCB1cCBhcyB0aGUgY3VscHJpdDogCj4+
Pj4gICAgY29tbWl0IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThlYzgyZmY3YTUKPj4+
PiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4g
cG9zc2libGUKPj4+Cj4+PiBTb3JyeSB0byBoZWFyIHRoYXQsIGxldCBzZWUgaWYgd2UgY2FuIGZp
Z3VyZSBvdXQgd2hhdCdzIHdyb25nLgo+Pgo+PiBObyBwcm9ibGVtLCB0aGF0IGlzIHdoeSBJIHRl
c3Qgc3R1ZmYgOikKPj4KPj4+PiBJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0IGNvbW1pdCBh
bmQgbm93IGl0IHdvcmtzIGZpbmUgYWdhaW4uCj4+Pgo+Pj4gRG9lcyB0aGUgc2FtZSBjb250cm9s
bGVyIHdvcmsgZmluZSB3aGVuIHVzZWQgaW4gZG9tMD8KPj4KPj4gV2lsbCB0ZXN0IHRoYXQsIGJ1
dCBhcyBhbGwgb3RoZXIgcGNpIGRldmljZXMgaW4gZG9tMCB3b3JrIGZpbmUsCj4+IEkgYXNzdW1l
IHRoaXMgY29udHJvbGxlciB3b3VsZCBhbHNvIHdvcmsgZmluZSBpbiBkb20wIChhcyBpdCBoYXMg
YWxzbwo+PiB3b3JrZWQgZmluZSBmb3IgYWdlcyB3aXRoIFBDSS1wYXNzdGhyb3VnaCB0byB0aGF0
IGd1ZXN0IGFuZCBzdGlsbCB3b3Jrcwo+PiBmaW5lIHdoZW4gcmV2ZXJ0aW5nIHRoZSByZWZlcmVu
Y2VkIGNvbW1pdCkuCj4gCj4gSXMgdGhpcyB0aGUgb25seSBkZXZpY2UgdGhhdCBmYWlscyB0byB3
b3JrIHdoZW4gZG9pbmcgcGNpLXBhc3N0aHJvdWdoLAo+IG9yIG90aGVyIGRldmljZXMgYWxzbyBk
b24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBjaGFuZ2UgYXBwbGllZD8KPiAKPiBIYXZlIHlv
dSB0ZXN0ZWQgb24gb3RoZXIgYm94ZXM/Cj4gCj4+IEkgZG9uJ3Qga25vdyBpZiB5b3VyIGNoYW5n
ZSBjYW4gc29tZWhvdyBoYXZlIGEgc2lkZSBlZmZlY3QKPj4gb24gbGF0ZW5jeSBhcm91bmQgdGhl
IHByb2Nlc3Npbmcgb2YgcGNpLXBhc3N0aHJvdWdoID8KPiAKPiBIbSwgdGhlIG1lbnRpb25lZCBj
b21taXQgc2hvdWxkIHNwZWVkIHVwIGJyb2FkY2FzdCBJUElzLCBidXQgSSBkb24ndAo+IHNlZSBo
b3cgaXQgY291bGQgc2xvdyBkb3duIG90aGVyIGludGVycnVwdHMuIEFsc28gSSB3b3VsZCB0aGlu
ayB0aGUKPiBkb21haW4gaXMgbm90IHJlY2VpdmluZyBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmlj
ZSwgcmF0aGVyIHRoYW4KPiBpbnRlcnJ1cHRzIGJlaW5nIHNsb3cuCj4gCj4gQ2FuIHlvdSBhbHNv
IHBhc3RlIHRoZSBvdXRwdXQgb2YgbHNwY2kgLXYgZm9yIHRoYXQgeEhDSSBkZXZpY2UgZnJvbQo+
IGRvbTA/CgpJZiB0aGlzIGlzIEFNRCBoYXJkd2FyZSwgdGhlbiBhbm90aGVyIHRoaW5nIHRvIHRy
eSBqdXN0IHRvIGdldCBhbgphZGRpdGlvbmFsIGRhdGEgcG9pbnQgd291bGQgYmUgbGltaXRpbmcg
b2YgQ1BVcyB1c2VkICgibWF4Y3B1cz0iKSwKYXMgdGhhdCBvdWdodCB0byBzdXBwcmVzcyB0aGUg
YWN0dWFsIHNlbmRpbmcgb2YgQUxMQlVUIElQSXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
