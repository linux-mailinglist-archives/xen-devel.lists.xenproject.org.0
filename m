Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76391118216
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:21:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaiE-0003jA-Lu; Tue, 10 Dec 2019 08:17:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieaiD-0003j5-E5
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:17:41 +0000
X-Inumbo-ID: 8854286a-1b25-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8854286a-1b25-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 08:17:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CC40B321;
 Tue, 10 Dec 2019 08:17:39 +0000 (UTC)
To: SeongJae Park <sj38.park@gmail.com>, sjpark@amazon.com
References: <20191210080628.5264-1-sjpark@amazon.de>
 <20191210080628.5264-2-sjpark@amazon.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7260cdce-7488-5045-0572-021a0ef191ac@suse.com>
Date: Tue, 10 Dec 2019 09:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210080628.5264-2-sjpark@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMDk6MDYsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gR3JhbnRpbmcgcGFnZXMg
Y29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVtcyBjb25maWd1cmVkCj4g
d2l0aCBpbnN1ZmZpY2llbnQgc3BhcmUgbWVtb3J5IGZvciB0aG9zZSBwYWdlcywgaXQgY2FuIGNh
dXNlIGEgbWVtb3J5Cj4gcHJlc3N1cmUgc2l0dWF0aW9uLiAgSG93ZXZlciwgZmluZGluZyB0aGUg
b3B0aW1hbCBhbW91bnQgb2YgdGhlIHNwYXJlCj4gbWVtb3J5IGlzIGNoYWxsZW5naW5nIGZvciBs
YXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCj4gdXRpbGl6YXRpb24gcGF0dGVy
bnMuICBBbHNvLCBzdWNoIGEgc3RhdGljIGNvbmZpZ3VyYXRpb24gbWlnaHQgbGFjayBhCj4gZmxl
eGliaWxpdHkuCj4gCj4gVG8gbWl0aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRk
cyBhIG1lbW9yeSByZWNsYWltIGNhbGxiYWNrIHRvCj4gJ3hlbmJ1c19kcml2ZXInLiAgVXNpbmcg
dGhpcyBmYWNpbGl0eSwgJ3hlbmJ1cycgd291bGQgYmUgYWJsZSB0byBtb25pdG9yCj4gYSBtZW1v
cnkgcHJlc3N1cmUgYW5kIHJlcXVlc3Qgc3BlY2lmaWMgZGV2aWNlcyBvZiBzcGVjaWZpYyBiYWNr
ZW5kCj4gZHJpdmVycyB3aGljaCBjYXVzaW5nIHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2b2x1bnRh
cmlseSByZWxlYXNlIGl0cwo+IG1lbW9yeS4KPiAKPiBUaGF0IHNhaWQsIHRoaXMgY29tbWl0IHNp
bXBseSByZXF1ZXN0cyBldmVyeSBjYWxsYmFjayByZWdpc3RlcmVkIGRyaXZlcgo+IHRvIHJlbGVh
c2UgaXRzIG1lbW9yeSBmb3IgZXZlcnkgZG9tYWluLCByYXRoZXIgdGhhbiBpc3N1ZWluZyB0aGUK
PiByZXF1ZXN0cyB0byB0aGUgZHJpdmVycyBhbmQgdGhlIGRvbWFpbiBpbiBjaGFyZ2UuICBTdWNo
IHRoaW5ncyB3aWxsIGJlCj4gZG9uZSBpbiBhIGZ1dHVyLiAgQWxzbywgdGhpcyBjb21taXQgZm9j
dXNlcyBvbiBtZW1vcnkgb25seS4gIEhvd2V2ZXIsIGl0Cj4gd291bGQgYmUgYWJsdCB0byBiZSBl
eHRlbmRlZCBmb3IgZ2VuZXJhbCByZXNvdXJjZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VvbmdK
YWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
