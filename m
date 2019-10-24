Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27EE3458
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNdDh-0004Ts-2x; Thu, 24 Oct 2019 13:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNdDf-0004Tk-1a
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:32:03 +0000
X-Inumbo-ID: a908e7ae-f662-11e9-94a1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a908e7ae-f662-11e9-94a1-12813bfff9fa;
 Thu, 24 Oct 2019 13:32:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3546BBB6E;
 Thu, 24 Oct 2019 13:32:01 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <23985.33157.424790.599253@mariner.uk.xensource.com>
 <9dba76f6-a964-8d8e-62f0-08429a2b0725@suse.com>
 <23985.38270.959448.768068@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2acc6846-0a39-5a87-e975-85c3f5822193@suse.com>
Date: Thu, 24 Oct 2019 15:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <23985.38270.959448.768068@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTQ6MTMsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQzMDYxOiByZWdyZXNz
aW9ucyAtIHRyb3VibGU6IGJyb2tlbi9mYWlsL3Bhc3MiKToKPj4gT24gMjQuMTAuMTkgMTI6NDgs
IElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gVGhlcmUgaXMgYSBrbm93biBidWcgd2l0aCB0d28gb2Yg
b3VyIGFybTY0IGJveGVzLCB3aGVyZSB0aGV5IGxvc2Ugc29tZQo+Pj4gb2YgdGhlIG91dHB1dCBk
dXJpbmcgYm9vdC4gIFRoaXMgaXMgbm90IGltcG9ydGFudCBmb3Igb3BlcmF0aW9uYWwgdXNlCj4+
PiBvZiB0aG9zZSBib3hlcyBpbiBhIG5vcm1hbCBjb250ZXh0LCBidXQgaW4gb3VyIGNvbnRleHQg
YmVpbmcgYWJsZSB0bwo+Pj4gZ2V0IGFsbCB0aGUgYm9vdCBtZXNzYWdlcyBpcyBpbXBvcnRhbnQg
Zm9yIGRlYnVnZ2luZyBoeXBlcnZpc29ycyBhbmQKPj4+IGtlcm5lbHMsIHNvIG9zc3Rlc3QgaGFz
IGEgdGVzdCB0aGF0IHRoaXMgd29ya3MgcHJvcGVybHkuICBJdCBpcyB0aGF0Cj4+PiB0ZXN0IHRo
YXQgZmFpbHMuCj4+Pgo+Pj4gSWYgdGhpcyBpcyB0aGUgb25seSBmYWlsdXJlLCB3ZSBzaG91bGQg
Zm9yY2UgcHVzaC4KPj4KPj4gQWdyZWVkLiBDYW4geW91IGRvIHNvLCBwbGVhc2U/Cj4gCj4gQnV0
IGl0IGlzbid0IGluIHRoaXMgZmxpZ2h0LgoKT2gsIHNvcnJ5LCB0aGVuIEkgbWlzdW5kZXJzdG9v
ZCB5b3UuIEkgdGhvdWdodCB0aGUgaXRhbGlhMSBmYWlsdXJlCndvdWxkIGJlIHJlZ2FyZGVkIGFz
IG5vbi1ibG9ja2luZyBkdWUgdG8gb2J2aW91cyBoYXJkd2FyZSBwcm9ibGVtLgoKPiB0ZXN0LWFt
ZDY0LWFtZDY0LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbQo+IGRpZG4ndCBy
dW4gYmVjYXVzZSBvZiB0aGUgcHJvYmxlbSB3aXRoIGl0YWxpYTEuICBGb3JjZSBwdXNoaW5nIHdv
dWxkCj4gYmUgc2F5aW5nIHdlIGRvbid0IG1pbmQgYWJvdXQgdGhhdC4KCkxldHMgd2FpdCBmb3Ig
dGhlIG5leHQgcnVuIHRoZW4uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
