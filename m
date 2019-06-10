Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B63BD16
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:48:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQEf-0001iR-1E; Mon, 10 Jun 2019 19:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQEd-0001h9-Lj
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:45:39 +0000
X-Inumbo-ID: 50c1bbe4-8bb8-11e9-b720-fb7c340b43eb
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50c1bbe4-8bb8-11e9-b720-fb7c340b43eb;
 Mon, 10 Jun 2019 19:45:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 812CD344;
 Mon, 10 Jun 2019 12:45:35 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A011A3F73C;
 Mon, 10 Jun 2019 12:45:34 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
 <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
 <c84036fb-27c9-8fb1-ec3b-f43a8e66515f@arm.com>
Message-ID: <cb9dca07-8b44-e644-2383-e37f8c12aa57@arm.com>
Date: Mon, 10 Jun 2019 20:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c84036fb-27c9-8fb1-ec3b-f43a8e66515f@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzI5LzE5IDc6MTggUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAy
OS8wNS8yMDE5IDE4OjU4LCBPbGVrc2FuZHIgd3JvdGU6Cj4+Cj4+IE9uIDI5LjA1LjE5IDIwOjQ0
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBPbGVrc2FuZHIsCj4+Cj4+IEhpLCBKdWxpZW4K
Pj4KPj4KPj4+Cj4+PiBPbiAyMS8wNS8yMDE5IDE4OjM3LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+Cj4+Pj4KPj4+PiBUaGUgImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5
IGlzIGEgc3BlY2lhbCBmb3JtIGZvciB1c2Ugd2hlbgo+Pj4+IGEgbm9kZSBuZWVkcyB0byByZWZl
cmVuY2UgbXVsdGlwbGUgaW50ZXJydXB0IHBhcmVudHMuID4KPj4+PiBBY2NvcmRpbmcgdG8gdGhl
Ogo+Pj4KPj4+IE5JVDogcy90aGUvLwo+Pj4KPj4+PiBMaW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0cy50eHQgCj4+Pj4K
Pj4+Pgo+Pj4+IEJ1dCwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gImludGVycnVwdHMtZXh0ZW5kZWQi
IHByb3BlcnR5IGlzIHVzZWQgZm9yCj4+Pj4gIm91dHNpZGUgL3NvYyBub2RlIiB3aXRoIGEgc2lu
Z2xlIGludGVycnVwdCBwYXJlbnQgYXMgYW4gZXF1aXZhbGVudCBvZgo+Pj4+IHBhaXJzICgiaW50
ZXJydXB0LXBhcmVudCIgKyAiaW50ZXJydXB0cyIpLgo+Pj4+Cj4+Pj4gVGhlIGdvb2QgZXhhbXBs
ZSBoZXJlIGlzIEFSQ0ggdGltZXIgbm9kZSBmb3IgUi1DYXIgR2VuMy9HZW4yIGZhbWlseSwKPj4+
Cj4+PiBOSVQ6IHMvVGhlL0EvIEkgdGhpbmsKPj4+Cj4+Pj4gd2hpY2ggaXMgbWFuZGF0b3J5IGRl
dmljZSBmb3IgWGVuIHVzYWdlIG9uIEFSTS4gQW5kIHdpdGhvdXQgYWJpbGl0eQo+Pj4+IHRvIGhh
bmRsZSBzdWNoIG5vZGVzLCBYZW4gZmFpbHMgdG8gb3BlcmF0ZS4KPj4+Pgo+Pj4+IFNvLCB0aGlz
IHBhdGNoIGFkZHMgcmVxdWlyZWQgc3VwcG9ydCBmb3IgWGVuIHRvIGJlIGFibGUgdG8gaGFuZGxl
Cj4+Pj4gbm9kZXMgd2l0aCB0aGF0IHByb3BlcnR5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4K
Pj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4+Cj4+IFRoYW5rIHlvdSEgSSBhc3N1bWUgeW91IG1lYW50IFJldmlld2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgCj4+IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gKQo+IAo+IFllcyBzb3JyeSwgSSB3
YXMgYWRkaW5nIGlzIHJldmlld2VkLWJ5IG9uIHNvbWUgb2YgbXkgcGF0Y2hlcyBhbmQgCj4gbWVj
aGFuaWNhbGx5IGNvcGllZCBoZXJlLiBBcG9sb2dpZXMgZm9yIHRoZSBpbmNvbnZlbmllbmNlLgo+
IAo+Pgo+PiBTaGFsbCBJIHNlbmQgbmV3IHZlcnNpb24gd2l0aCBwcm9wb3NlZCBjaGFuZ2VzPwo+
IAo+IE5vIG5lZWQsIEkgY2FuIGRvIHRoZSBjaGFuZ2Ugd2hpbGUgY29tbWl0dGluZyAoYXNzdW1p
bmcgU3RlZmFubyBoYXMgbm8gCj4gb3RoZXIgY29tbWVudHMpLgoKTm93IGFwcGxpZWQgdG8gbXkg
c3RhZ2luZyBicmFuY2guIEl0IHdpbGwgYmUgY29tbWl0dGVkIHRvbmlnaHQuCgpUaGFuayB5b3Ug
Zm9yIHRoZSBwYXRjaGVzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
