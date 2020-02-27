Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5217142F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:35:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FWV-00071R-RI; Thu, 27 Feb 2020 09:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kU4J=4P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7FWU-00071M-RS
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:32:02 +0000
X-Inumbo-ID: 018fb8d2-5944-11ea-9615-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 018fb8d2-5944-11ea-9615-12813bfff9fa;
 Thu, 27 Feb 2020 09:32:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1BF34ACD7;
 Thu, 27 Feb 2020 09:31:59 +0000 (UTC)
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200226212612.GA4663@embeddedor>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <77d23b72-e16b-e63a-7700-3afe6c77d327@suse.com>
Date: Thu, 27 Feb 2020 10:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226212612.GA4663@embeddedor>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Replace zero-length array with
 flexible-array member
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAgMjI6MjYsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gVGhlIGN1cnJl
bnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBhcnJheSBsYW5ndWFnZQo+
IGV4dGVuc2lvbiB0byB0aGUgQzkwIHN0YW5kYXJkLCBidXQgdGhlIHByZWZlcnJlZCBtZWNoYW5p
c20gdG8gZGVjbGFyZQo+IHZhcmlhYmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzIHRoZXNlIG9uZXMg
aXMgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXJbMV1bMl0sCj4gaW50cm9kdWNlZCBpbiBDOTk6Cj4g
Cj4gc3RydWN0IGZvbyB7Cj4gICAgICAgICAgaW50IHN0dWZmOwo+ICAgICAgICAgIHN0cnVjdCBi
b28gYXJyYXlbXTsKPiB9Owo+IAo+IEJ5IG1ha2luZyB1c2Ugb2YgdGhlIG1lY2hhbmlzbSBhYm92
ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlciB3YXJuaW5nCj4gaW4gY2FzZSB0aGUgZmxleGlibGUg
YXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBpbiB0aGUgc3RydWN0dXJlLCB3aGljaAo+IHdpbGwg
aGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQgYmVoYXZpb3IgYnVncyBmcm9t
IGJlaW5nCj4gaW5hZHZlcnRlbnRseSBpbnRyb2R1Y2VkWzNdIHRvIHRoZSBjb2RlYmFzZSBmcm9t
IG5vdyBvbi4KPiAKPiBBbHNvLCBub3RpY2UgdGhhdCwgZHluYW1pYyBtZW1vcnkgYWxsb2NhdGlv
bnMgd29uJ3QgYmUgYWZmZWN0ZWQgYnkKPiB0aGlzIGNoYW5nZToKPiAKPiAiRmxleGlibGUgYXJy
YXkgbWVtYmVycyBoYXZlIGluY29tcGxldGUgdHlwZSwgYW5kIHNvIHRoZSBzaXplb2Ygb3BlcmF0
b3IKPiBtYXkgbm90IGJlIGFwcGxpZWQuIEFzIGEgcXVpcmsgb2YgdGhlIG9yaWdpbmFsIGltcGxl
bWVudGF0aW9uIG9mCj4gemVyby1sZW5ndGggYXJyYXlzLCBzaXplb2YgZXZhbHVhdGVzIHRvIHpl
cm8uIlsxXQo+IAo+IFRoaXMgaXNzdWUgd2FzIGZvdW5kIHdpdGggdGhlIGhlbHAgb2YgQ29jY2lu
ZWxsZS4KPiAKPiBbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy9aZXJvLUxl
bmd0aC5odG1sCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8yMQo+
IFszXSBjb21taXQgNzY0OTc3MzI5MzJmICgiY3hnYjMvbDJ0OiBGaXggdW5kZWZpbmVkIGJlaGF2
aW91ciIpCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0Bl
bWJlZGRlZG9yLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
