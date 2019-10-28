Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16842E70EC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 13:05:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3iJ-0000ZN-9e; Mon, 28 Oct 2019 12:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZLsx=YV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iP3iH-0000ZI-Df
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 12:01:33 +0000
X-Inumbo-ID: aebfcb98-f97a-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aebfcb98-f97a-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 12:01:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9A21F1;
 Mon, 28 Oct 2019 05:01:32 -0700 (PDT)
Received: from [10.1.196.50] (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CA0A3F6C4;
 Mon, 28 Oct 2019 05:01:31 -0700 (PDT)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20191021012755.2671-1-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cb80ccce-6286-e5b6-e872-c0a4ec77c8d0@arm.com>
Date: Mon, 28 Oct 2019 12:01:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021012755.2671-1-stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3] xen/arm: platform: fix
 Raspberry Pi compatible string
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMS8xMC8yMDE5IDAyOjI3LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gQm90
aCB1cHN0cmVhbSBbMV0gYW5kIGRvd25zdHJlYW0gWzJdIExpbnV4IGtlcm5lbHMgdXNlICJicmNt
LGJjbTI3MTEiCj4gYXMgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciBSYXNwYmVycnkgUGkgNC4g
QWRkIHRoaXMgc3RyaW5nIHRvIG91cgo+IHBsYXRmb3JtIGNvbXBhdGlibGUgbGlzdC4KPiAKPiBU
aGUgYnJjbSxiY20yODM4IGNvbnZlbnRpb24gaXMgYWJhbmRvbmVkLiBSZW1vdmUgaXQuCj4gCj4g
UmVuYW1lIHRoZSB2YXJpYWJsZXMgd2l0aGluIHRoZSBmaWxlIHRvIGEgcnBpNF8qIHByZWZpeCBz
aW5jZSB0aGUgZmlsZQo+IGlzIG1lYW50IHRvIGNvdmVyIHRoZSBSYXNwYmVycnkgUGkgNCBwbGF0
Zm9ybS4KPiAKPiBJZiB5b3UgYXJlIHVzaW5nIGEgZGV2aWNlIHRyZWUgd2l0aCB0aGUgb2xkIGNv
bXBhdGlibGUgc3RyaW5nCj4gYnJjbSxiY20yODM4LCB5b3Ugd2lsbCBuZWVkIHRvIHVwZ3JhZGUg
eW91ciBkZXZpY2UgdHJlZSB0byBvbmUgdGhhdCBoYXMKPiB0aGUgbmV3IGJyY20sYmNtMjcxMSBj
b21wYXRpYmxlIHN0cmluZy4KPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC8xMTE2NTQwNy8KPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4
L2NvbW1pdC81M2ZkZDdiOGM4Y2I5Yzg3MTkwY2FhYjRmZDQ1OWY4OWUxYjRhN2Y4Cj4gCj4gU2ln
bmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVy
d29ya3MuY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgpASnVlcmdlbjogUlBJNCBzdXBwb3J0IGhhcyBiZWVuIGFkZGVkIGR1cmluZyBYZW4gNC4xMyBk
ZXZlbG9wbWVudC4gVGhpcyBpcyBzdGlsbCAKaW4gZGV2ZWxvcG1lbnQgKGkuZS4gaXQgY2FuJ3Qg
d29yayBvdXQtb2YtYm94IGF0IGxlYXN0IG9uIHRoZSBrZXJuZWwgc2lkZSksIGJ1dCAKaXQgd291
bGQgYmUgZ29vZCBpZiB3ZSBjYW4gZW5hYmxlIHN1cHBvcnQgZm9yIG1vcmUgcmVjZW50IGtlcm5l
bC4gVGhpcyB3b3VsZCAKaGVscCB0byBkcmF3IG1vcmUgdXNlcnMgdG8gWGVuIGFuZCBhbHNvIHBv
c3NpYmx5IHJlZHVjZSB0aGUgbnVtYmVyIG9mIGhhY2tzIApuZWNlc3NhcnkgaW4gTGludXgvRGV2
aWNlLVRyZWUgd2hlbiB1c2luZyBYZW4gb24gUlBJNC4KClRoaXMgcGF0Y2ggb25seSB0b3VjaGVz
IFJQSTQgc3BlY2lmaWMgY29kZSwgc28gaXQgd2lsbCBub3QgYWZmZWN0IHRoZSByZXN0IG9mIAp0
aGUgc3VwcG9ydGVkIHBsYXRmb3JtLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
