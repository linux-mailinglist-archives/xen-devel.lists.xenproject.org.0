Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB8E9DE4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 15:52:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPpGL-0002IZ-J3; Wed, 30 Oct 2019 14:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPpGK-0002IS-DX
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 14:47:52 +0000
X-Inumbo-ID: 3ee9b03a-fb24-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ee9b03a-fb24-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 14:47:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBFB2ACBD;
 Wed, 30 Oct 2019 14:47:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191030130143.30964-1-aisaila@bitdefender.com>
 <50a1845a-b909-6cd0-1c9e-a2cb33fb41db@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ff7c17b-8ab1-bf95-866e-deea0c9f5f88@suse.com>
Date: Wed, 30 Oct 2019 15:47:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <50a1845a-b909-6cd0-1c9e-a2cb33fb41db@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86/hvm: Update code in
 HVMOP_altp2m_set_suppress_ve
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxNToxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8xMC8yMDE5
IDEzOjAyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4gT3JpZ2luYWxseSB0aGUg
Z2ZuIGFuZCBhbHRwMm1faWR4IGFyZSBhc3NpZ25lZCBmcm9tIHRoZSBhLnUubWVtX2FjY2VzcyB1
bmlvbi4KPj4gVGhpcyB3b3JrcyBiZWNhdXNlIGl0J3MgdGhlIHNhbWUgbWVtb3J5IHVzZWQuIFRo
aXMgcGF0Y2ggYWRkcmVzc2VzIHRoaXMKPj4gaXNzdWUgYnkgY2hhbmdpbmcgdGhlIG1lbV9hY2Nl
c3MgdW5pb24gd2l0aCB0aGUgc3VwcHJlc3NfdmUgdW5pb24gZm9yCj4+IGNvbnNpc3RlbmN5Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiAKPiBDQyBKdWVyZ2VuLiBUaGlzIHdhbnRzIGJhY2twb3J0aW5nLCBzbyBzaG91
bGQgYmUgaW5jbHVkZWQgaW4gNC4xMwoKSSB3b3VsZG4ndCBoYXZlIHBpY2tlZCB0aGlzIHVwIGFz
IGJhY2twb3J0aW5nIGNhbmRpZGF0ZSwgYXMKdGhlIGdlbmVyYXRlZCBjb2RlIGlzIGNvcnJlY3Qs
IGFuZCB0aGUgcHVibGljIGludGVyZmFjZSBpc24ndApzdXBwb3NlZCB0byBjaGFuZ2UgaW4gdGhl
IHN0YWJsZSB0cmVlcy4gSS5lLiBJIHZpZXcgdGhpcyBhcyBhCnB1cmVseSBjb3NtZXRpYyBjaGFu
Z2UsIGFsYmVpdCBhIHByZXR0eSBoZWxwZnVsIG9uZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
