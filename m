Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A7A4D2D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 03:49:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4bN0-0004dT-N9; Mon, 02 Sep 2019 01:43:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4bMy-0004dO-UO
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 01:43:01 +0000
X-Inumbo-ID: fb42e66e-cd22-11e9-b95f-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb42e66e-cd22-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 01:42:56 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id CA9B820007F;
 Mon,  2 Sep 2019 11:42:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567388569; bh=nXvk3EiTvumc1LISpsTMeqiwDs7ay9C5MvTqk1pvR6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=txloH/PGt5V6EhTIY5Mk/Sd6xLFkc9bq7XjZr98tz+Fe+STiJV04e/CiryZ5wUIal
 QDEqr6jd6mhbejBOF8+AL9nGNMD6KEO3Mu1TzGWKuEHbs586PJdxH6lw8JaWSLOzBM
 wrF/yAOj95xxoFu3T12fJQUTWUrbH7dWSUgza790=
MIME-Version: 1.0
Date: Mon, 02 Sep 2019 11:42:46 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Andreas Kinzler <hfp@posteo.de>
In-Reply-To: <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <71fad1413643be2df5f2291270b60448@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOC0yMSAwNjo1NywgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDIwLjA4LjIw
MTkgMjI6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDIwLzA4LzIwMTkgMjE6MzYsIEFu
ZHJlYXMgS2luemxlciB3cm90ZToKPj4+IE9uIDIwLjA4LjIwMTkgMjA6MTIsIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4+Pj4+IFhlbiB2ZXJzaW9uIDQuMTAuMi4gZG9tMCBrZXJuZWwgNC4xMy4xNi4g
VGhlIEJJT1MgdmVyc2lvbiBpcyAKPj4+Pj4gdW5jaGFuZ2VkCj4+Pj4+IGZyb20gMjcwMFggKHdv
cmtpbmcpIHRvIDM3MDBYIChjcmFzaGluZykuCj4+Pj4gU28geW91J3ZlIGRvbmUgYSBaZW4gdjEg
PT4gWmVuIHYyIENQVSB1cGdyYWRlIGFuZCBhbiBleGlzdGluZyAKPj4+PiBzeXN0ZW0/Cj4+PiBX
aXRoICJleGlzdGluZyBzeXN0ZW0iIHlvdSBtZWFuIHRoZSBXaW5kb3dzIGluc3RhbGxhdGlvbj8K
Pj4gSSBtZWFudCBzYW1lIGNvbXB1dGVyLCBub3Qgc2FtZSBWTS4KPiAKPiBUcmllZCB3aXRoIDIg
bWFpbmJvYXJkczogQXNyb2NrIFgzNzAgUHJvNCBhbmQgQXNyb2NrUmFjayBYNDcwRDRVLgo+IFlv
dSBuZWVkIHRvIGZsYXNoIHRoZSBCSU9TIGZvciBaZW4yLiBYNDcwRDRVIEJJT1MgMy4xIHdvcmtz
IHdpdGggMjcwMFgKPiBidXQgbm90IHdpdGggMzcwMFguIFgzNzAgUHJvNCB3aXRoIHNvbWV3aGF0
IG9sZGVyIEJJT1Mgd29ya2VkIGZvcgo+IDI3MDBYIGFuZCBkb2VzIG5vdCB3b3JrIHdpdGggY3Vy
cmVudCAoNi4wMCkgQklPUyBhbmQgMzcwMFguCj4gCj4+PiBZZXMsIGJ1dCBpdCBpcyBub3QgcmVs
ZXZhbnQuIFRoZSBzYW1lIEJTT0RzIGhhcHBlbiBpZiB5b3UgYm9vdCB0aGUgCj4+PiBIVk0KPj4+
IHdpdGgganVzdCB0aGUgaXNvIGluc3RhbGxhdGlvbiBtZWRpdW0gYW5kIG5vIGRpc2tzLgo+PiBU
aGF0J3MgYSB1c2VmdWwgZGF0YXBvaW50LsKgIEkgd291bGRuJ3QgZXhwZWN0IHRoaXMgdG8gYmUg
cmVsZXZhbnQsIAo+PiBnaXZlbgo+PiBob3cgV2luZG93J3MgSEFMIHdvcmtzLgo+IAo+IEl0IHNo
b3VsZCBtYWtlIGRlYnVnZ2luZyBmb3IgeW91IHF1aXRlICJzaW1wbGUiIGJlY2F1c2UgaXQgY2Fu
IGJlCj4gcmVwcm9kdWNlZCB2ZXJ5IGVhc2lseS4KCkp1c3QgdG8gYWRkIGEgZGF0YSBwb2ludCB0
byB0aGlzIC0gSSBhbHNvIHNlZSB0aGlzIHByb2JsZW0gb24gYSBSeXplbiA5IAozOTAweC4KCnhs
IGRtZXNnIHNob3dzOgooWEVOKSBkMnYwIFZJUklESUFOIENSQVNIOiBhYyAwIGEwYTAgZmZmZmY4
MDI5MzI1NDc1MCBhZWEKKFhFTikgZDN2MCBWSVJJRElBTiBDUkFTSDogYWMgMCBhMGEwIGZmZmZm
ODAwOTNhNDA3NTAgYWVhCihYRU4pIGQ1djAgVklSSURJQU4gQ1JBU0g6IGFjIDAgYTBhMCBmZmZm
ZjgwMjhlNDIyMzUwIGFlYQooWEVOKSBkNnYwIFZJUklESUFOIENSQVNIOiBhYyAwIGEwYTAgZmZm
ZmY4MDMwOTQzMTc1MCBhZWEKKFhFTikgZDEwdjAgVklSSURJQU4gQ1JBU0g6IGFjIDAgYTBhMCBm
ZmZmZjgwMTI4MjNlNzUwIGFlYQooWEVOKSBkMTF2MCBWSVJJRElBTiBDUkFTSDogYWMgMCBhMGEw
IGZmZmZmODAzMmU2NTczNTAgYWVhCgpXaW5kb3dzIHVzdWFsbHkgaGFzIGEgc3RvcGNvZGUgb2Yg
IkhBTCBNRU1PUlkgQUxMT0NBVElPTiIgd2hlbiBpdCBibHVlIApzY3JlZW5zLgoKIEZyb20geGwg
aW5mbzoKaHdfY2FwcyAgICAgICAgICAgICAgICA6IAoxNzhiZjNmZjpmNmQ4MzIwYjoyZTUwMDgw
MDoyNDQwMzdmZjowMDAwMDAwZjoyMTljOTFhOTowMDQwMDAwNDowMDAwMDUwMAp2aXJ0X2NhcHMg
ICAgICAgICAgICAgIDogaHZtIGh2bV9kaXJlY3Rpbwp4ZW5fdmVyc2lvbiAgICAgICAgICAgIDog
NC4xMS4yCnhlbl9jYXBzICAgICAgICAgICAgICAgOiB4ZW4tMy4wLXg4Nl82NCB4ZW4tMy4wLXg4
Nl8zMnAgaHZtLTMuMC14ODZfMzIgCmh2bS0zLjAteDg2XzMycCBodm0tMy4wLXg4Nl82NAoKSXMg
dGhlcmUgYW55IGZ1cnRoZXIgaW5mbyB0aGF0IGNhbiBiZSBwcm92aWRlZD8gTm90IGJlaW5nIGFi
bGUgdG8gCnZpcnR1YWxpc2UgV2luZG93cyBpcyBhIGJpdCBvZiBhIFBJVEEuLi4KCi0tIApTdGV2
ZW4gSGFpZ2gKCj8gbmV0d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8vd3d3LmNyYy5pZC5hdQo/
ICs2MSAoMykgOTAwMSA2MDkwICAgID8gMDQxMiA5MzUgODk3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
