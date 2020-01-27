Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7314A755
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6Ql-00015Z-8l; Mon, 27 Jan 2020 15:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QvhJ=3Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iw6Qj-00015R-UJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:36:01 +0000
X-Inumbo-ID: b86a806a-411a-11ea-8569-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b86a806a-411a-11ea-8569-12813bfff9fa;
 Mon, 27 Jan 2020 15:36:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E085ABB3;
 Mon, 27 Jan 2020 15:36:00 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <pdurrant@amazon.com>
References: <20200127151907.2877-1-pdurrant@amazon.com>
 <24111.734.509410.455377@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <51a28485-c692-21e9-32a2-24cbb77f7d50@suse.com>
Date: Mon, 27 Jan 2020 16:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <24111.734.509410.455377@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART
 to the xenstore protocol...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAgMTY6MzMsIElhbiBKYWNrc29uIHdyb3RlOgo+IFBhdWwgRHVycmFudCB3cml0
ZXMgKCJbUEFUQ0hdIGRvY3M6IHJldHJvc3BlY3RpdmVseSBhZGQgWFNfRElSRUNUT1JZX1BBUlQg
dG8gdGhlIHhlbnN0b3JlIHByb3RvY29sLi4uIik6Cj4+IC4uLiBzcGVjaWZpY2F0aW9uLgo+Pgo+
PiBUaGlzIHdhcyBhZGRlZCBieSBjb21taXQgMGNhNjRlZDggInhlbnN0b3JlOiBhZGQgc3VwcG9y
dCBmb3IgcmVhZGluZwo+PiBkaXJlY3Rvcnkgd2l0aCBtYW55IGNoaWxkcmVuIiBidXQgbm90IGFk
ZGVkIHRvIHRoZSBzcGVjaWZpY2F0aW9uIGF0IHRoYXQKPj4gcG9pbnQuIEEgdmVyc2lvbiBvZiB4
ZW5zdG9yZWQgc3VwcG9ydGluZyB0aGUgY29tbWFuZCB3YXMgZmlyc3QgcmVsZWFzZWQKPj4gaW4g
WGVuIDQuOS4KPiAKPiBUaGFua3MgZm9yIGRvY3VtZW50aW5nIHRoaXMuICBBIGRvY3MgZml4IGxp
a2UgdGhpcyBzaG91bGQgYmUKPiBiYWNrcG9ydGVkIGlmIGl0IGFwcGxpZXMsIElNTy4KPiAKPiBB
Y2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQmFja3Bv
cnQ6IDQuOSsKPiAKPiBJIHdpbGwgY29tbWl0IGl0IHRvIHN0YWdpbmcgbW9tZW50YXJpbHkuCj4g
Cj4+ICtESVJFQ1RPUllfUEFSVAkJPHBhdGg+fDxpbmRleHw+CQk8Y2hpbGQtbGVhZi1uYW1lPnwq
Cj4+ICsJUGVyZm9ybXMgdGhlIHNhbWUgZnVuY3Rpb24gYXMgRElSRUNUT1JZLCBidXQgcmV0dXJu
cyBhCj4+ICsJc3ViLWxpc3Qgb2YgY2hpbGRyZW4gc3RhcnRpbmcgYXQgPGluZGV4PiBpbiB0aGUg
b3ZlcmFsbAo+PiArCWNoaWxkIGxpc3QgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byBYRU5TVE9S
RV9QQVlMT0FEX01BWAo+PiArCW9jdGV0cyBpbiBsZW5ndGguIElmIDxpbmRleD4gaXMgYmV5b25k
IHRoZSBlbmQgb2YgdGhlCj4+ICsJb3ZlcmFsbCBjaGlsZCBsaXN0IHRoZW4gdGhlIHJldHVybmVk
IHN1Yi1saXN0IHdpbGwgYmUKPj4gKwllbXB0eS4KPiAKPiBJIHdvbmRlciBpZiBpdCBzaG91bGQg
YmUgc29tZWhvdyBtYWRlIG1vcmUgZXhwbGljaXQgdGhhdCBgaW5kZXgnIGlzIGEKPiBjb3VudCBv
ZiBkaXJlY3RvcnkgZW50cmllcywgbm90IGJ5dGVzLiAgTWF5YmUgdGhpcyBpcyBvYnZpb3VzLgoK
QnV0IHRoaXMgaXMgd3JvbmcuIEl0IGlzIGJ5dGVzLCBhbmQgdGhlIGdlbmVyYXRpb24gY291bnQg
cmV0dXJuZWQgaXMKbWlzc2luZyAoc2VlIG15IG9yaWdpbmFsIHBhdGNoIGJhY2sgaW4gMjAxNyku
CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
