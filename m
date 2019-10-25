Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233DE4B39
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:38:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNyoy-0007Yp-Uy; Fri, 25 Oct 2019 12:36:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNyox-0007Yj-2L
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:35:59 +0000
X-Inumbo-ID: fe33900a-f723-11e9-94c7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe33900a-f723-11e9-94c7-12813bfff9fa;
 Fri, 25 Oct 2019 12:35:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9A00B5A7;
 Fri, 25 Oct 2019 12:35:56 +0000 (UTC)
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>
References: <F6091989-2145-435A-8CE8-66BF7172C0C2@citrix.com>
 <f249ef17-359b-1aa4-3704-0f22968b78e0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <007cbbab-2348-f3d7-0c24-bb33fe5fc925@suse.com>
Date: Fri, 25 Oct 2019 14:36:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f249ef17-359b-1aa4-3704-0f22968b78e0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Tagging livepatch-build-tools.git with Xen releases
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxNDoyNywgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT24gMTAvMjUvMTkg
MTI6MDUgUE0sIExhcnMgS3VydGggd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gSSBhbSB3b25kZXJp
bmcgd2hldGhlciB3ZSBzaG91bGQgdGFnIGxpdmVwYXRjaC1idWlsZC10b29scy5naXQgd2l0aCBY
ZW4gCj4+IHJlbGVhc2VzCj4+Cj4gCj4gSSB0aG91Z2h0IHRoaXMgaGFkIGJlZW4gZGlzY3Vzc2Vk
IGJlZm9yZSBidXQgSSBjYW4ndCBmaW5kIGFueXRoaW5nIGluIG15IAo+IGFyY2hpdmVzLgoKSWly
YyB0aGlzIHdhcyBvbiBhIG1lZXRpbmcsIG5vdCBpbiBtYWlsLgoKQW5kIEkgYWdyZWUgd2l0aCBu
b3QgdGFnZ2luZy4gSW4gZmFjdCBJJ3ZlIGJlZW4gd29uZGVyaW5nIGlmIHRhZ2dpbmcKb2YgZS5n
LiBtaW5pLW9zIHJlYWxseSBtYWtlcyBzZW5zZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
