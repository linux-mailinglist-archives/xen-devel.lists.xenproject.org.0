Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A3E8C78
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 17:12:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPU3l-0001Io-8r; Tue, 29 Oct 2019 16:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U+fg=YW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iPU3k-0001Ij-BG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 16:09:28 +0000
X-Inumbo-ID: 7a6a6898-fa66-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a6a6898-fa66-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 16:09:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45AD7AFBD;
 Tue, 29 Oct 2019 16:09:25 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
 <20191029155436.14376-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8222e356-ee1f-9584-7405-9bc2eb6b68ce@suse.com>
Date: Tue, 29 Oct 2019 17:09:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191029155436.14376-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/4] libxl: gentypes:
 initialise array elements in json
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMTkgMTY6NTQsIElhbiBKYWNrc29uIHdyb3RlOgo+IE9sZWtzYW5kciBHcnl0c292
IGRpc2NvdmVyZWQgdGhhdCB0aGUgbGlieGwganNvbiBpZGwgcGFyc2luZyBmYWlscyB0bwo+IHBy
b3Blcmx5IGluaXRpYWxpc2UgYXJyYXkgZWxlbWVudHMuCj4gCj4gRml4aW5nIHRoaXMgaXMgbm90
IGVudGlyZWx5IHN0cmFpZ2h0Zm9yd2FyZCwgYmVjYXVzZSB0aGUgY29kZSB0byBkbwo+IHRoZSBp
bml0aWFsaXNhdGlvbiBpcyBub3QgY29udmVuaWVudGx5IGF2YWlsYWJsZSBhcyBhIHNlcGFyYXRl
Cj4gZnVuY3Rpb24uCj4gCj4gVG8gZWFzZSBkZWJ1Z2dpbmcgYW5kIHJldmlldywgSSBoYXZlIGJy
b2tlbiB0aGlzIHBhdGNoIHVwIGludG8gNCB2ZXJ5Cj4gc21hbGwgcmVmYWN0b3JpbmdzIHdoaWNo
IGRvIG5vdCBjaGFuZ2UgdGhlIG91dHB1dCwgcGx1cyB0aGUgb25lIHBhdGNoCj4gdG8gY2FsbCB0
aGUgbmV3bHktcHJvdmlkZWQgaW5pdGlhbGlzZXIuCj4gCj4gSSB0aGluayB0aGlzIHZlcnNpb24g
YWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gSnVsaWVuIEdyYWxsIG9uIGVhcmxpZXIKPiB2ZXJzaW9u
cy4gIElNTyBpdCBpcyBhIGNhbmRpYXRlIGZvciA0LjEzLCBhbmQgYWxzbyBiYWNrcG9ydGluZy4K
PiAKPiBJYW4gSmFja3NvbiAoMyk6Cj4gICAgdG9vbHMvbGlieGw6IGdlbnR5cGVzLnB5OiBQcmVm
ZXIgaW5pdF92YWwgdG8gaW5pdF9mbgo+ICAgIGxpYnhsOiBnZW50eXBlcy5weTogQnJlYWsgb3V0
IGZpZWxkX3Bhc3MgaW4gLi4uX2NvcHlfZGVwcmVjYXRlZAo+ICAgIGxpYnhsOiBnZW50eXBlcy5w
eTogQnJlYWsgb3V0IGxpYnhsX0NfdHlwZV9kb19pbml0Cj4gCj4gT2xla3NhbmRyIEdyeXRzb3Yg
KDEpOgo+ICAgIGxpYnhsOiBnZW50eXBlczogaW5pdGlhbGlzZSBhcnJheSBlbGVtZW50cyBpbiBq
c29uCj4gCj4gICB0b29scy9saWJ4bC9nZW50eXBlcy5weSB8IDM1ICsrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCj4gCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
