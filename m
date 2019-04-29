Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935FE40E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 15:56:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL6iy-000615-AK; Mon, 29 Apr 2019 13:53:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL6iw-00060x-TI
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 13:53:38 +0000
X-Inumbo-ID: 2f4466a4-6a86-11e9-976d-6f6e9b57d762
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f4466a4-6a86-11e9-976d-6f6e9b57d762;
 Mon, 29 Apr 2019 13:53:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84641286"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Pawel Wieczorkiewicz
 <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-4-wipawel@amazon.de>
 <58c4bf01-f646-b14d-37f1-4300bb4099ee@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <181dd494-4c5f-b5d2-fc87-5e14a2c949dc@citrix.com>
Date: Mon, 29 Apr 2019 14:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <58c4bf01-f646-b14d-37f1-4300bb4099ee@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 4/4] livepatch-build: Handle
 newly created object files
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yOS8xOSAxOjUzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA4LzA0LzIwMTkg
MDk6MzIsIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+PiBVcCB0byBub3cgdGhlIGxpdmVw
YXRjaC1idWlsZCBpZ25vcmVzIG5ld2x5IGNyZWF0ZWQgb2JqZWN0IGZpbGVzLgo+PiBXaGVuIHBh
dGNoIGFwcGxpZXMgbmV3IC5jIGZpbGUgYW5kIGF1Z21lbnRzIGl0cyBNYWtlZmlsZSB0byBidWls
ZCBpdAo+PiB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlIGlzIG5vdCB0YWtlbiBpbnRvIGFjY291
bnQgZm9yIGZpbmFsIGxpbmtpbmcKPj4gc3RlcC4KPj4KPj4gU3VjaCBuZXdseSBjcmVhdGVkIG9i
amVjdCBmaWxlcyBjYW4gYmUgZGV0ZWN0ZWQgYnkgY29tcGFyaW5nIHBhdGNoZWQvCj4+IGFuZCBv
cmlnaW5hbC8gZGlyZWN0b3JpZXMgYW5kIGNvcGllZCBvdmVyIHRvIHRoZSBvdXRwdXQgZGlyZWN0
b3J5IGZvcgo+PiB0aGUgZmluYWwgbGlua2luZyBzdGVwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4+IFJldmlld2VkLWJ5OiBB
bmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4+IFJldmlld2VkLWJ5
OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+PiBSZXZpZXdlZC1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gCj4gVGhpcyBsb29rcyB0byByZXNvbHZl
Ogo+IAo+IGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L2Jyb3dzZS9YRU4tOTAKPiAK
PiAoSSB0aGluaz8pCj4gCgpZZXMsIEkgZXhwZWN0IGl0IHdvdWxkLgoKLS0gClJvc3MgTGFnZXJ3
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
