Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB91120410
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:36:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoca-00069D-9b; Mon, 16 Dec 2019 11:33:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igocZ-000698-EO
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:33:03 +0000
X-Inumbo-ID: d12d0b0c-1ff7-11ea-938a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d12d0b0c-1ff7-11ea-938a-12813bfff9fa;
 Mon, 16 Dec 2019 11:33:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2C7CAAA6;
 Mon, 16 Dec 2019 11:33:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
 <799bdacb-6090-7ebe-64ef-b8803f099810@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59a8a5cf-2033-69e1-d103-b0c3d21c725c@suse.com>
Date: Mon, 16 Dec 2019 12:33:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <799bdacb-6090-7ebe-64ef-b8803f099810@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/3] x86: Protected Processor Inventory
 Number (PPIN) support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAyMDo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8xMS8yMDE5
IDE1OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gMTogaW5jbHVkZSB0aGUgUFBJTiBpbiBNQ0Ug
cmVjb3JkcyB3aGVuIGF2YWlsYWJsZQo+PiAyOiBleHBsaWNpdGx5IGRpc2FsbG93IGd1ZXN0IGFj
Y2VzcyB0byBQUElOCj4+IDM6IHByb3ZpZGUgRG9tMCBhY2Nlc3MgdG8gUFBJTiB2aWEgWEVOUEZf
cmVzb3VyY2Vfb3AKPj4KPj4gSSBoYXZlIHlldCB0byBnZXQgYXJvdW5kIHRvIHBvc3QgdGhlIExp
bnV4IHNpZGUgY29uc3VtZXIKPj4gcGF0Y2ggb2YgdGhlIGludGVyZmFjZSBhZGRpdGlvbiBpbiBw
YXRjaCAxLgo+IAo+IFdoYXQgYWJvdXQgcHJpbnRpbmcgdGhlIFBQSU4gaW5mb3JtYXRpb24gd2hl
biBYZW4gd3JpdGVzIE1DRSBkZXRhaWxzIHRvCj4gdGhlIGNvbnNvbGU/CgpEbyB5b3UgbWVhbiBp
biB4ODZfbWNpbmZvX2R1bXAoKSwgb3IgbWNfcGFuaWMoKSwgb3IgeWV0IHNvbWV3aGVyZQplbHNl
PyBJbiBhbnkgZXZlbnQgaWYgd2UgZGlkIHNvIEknZCB3YW50IHRvIGFycmFuZ2UgZm9yIGVhY2gg
UFBJTgp0byBnZXQgbG9nZ2VkIGF0IG1vc3Qgb25jZSwgdG8gcmVkdWNlIHVubmVjZXNzYXJ5IHJl
ZHVuZGFuY3kuIE9mCmNvdXJzZSB0aGVyZSdzIGEgY29tbWVudCBhaGVhZCBvZiB4ODZfbWNpbmZv
X2R1bXAoKSBtZW50aW9uaW5nCnRoYXQgdGhlIG91dHB1dCBpcyB0byBiZSBwYXJzZWFibGUgYnkg
bWNlbG9nLCBzbyBJJ20gbm90IHN1cmUgaWYKd2UgY2FuIHJlYXNvbmFibHkgY2hhbmdlIHdoYXQg
d2UgcHJvZHVjZS4gT3RvaCBJJ20gYWxzbyBub3Qgc3VyZQp0aGUgY29tbWVudCBoYXNuJ3QgYmVj
b21lIHN0YWxlIHdpdGggaXRzIChwcmVzdW1lZCkgcG9ydGluZyBmcm9tCkxpbnV4IGFueXdheS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
