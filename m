Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A3C8B1F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 16:25:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFfWB-0000Ip-VB; Wed, 02 Oct 2019 14:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFfWA-0000Ik-Fw
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:22:14 +0000
X-Inumbo-ID: 07122ec2-e520-11e9-9718-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 07122ec2-e520-11e9-9718-12813bfff9fa;
 Wed, 02 Oct 2019 14:22:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBFFCAC7B;
 Wed,  2 Oct 2019 14:22:12 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b3fca72-718e-51c1-c1ae-91c51f154db8@suse.com>
Date: Wed, 2 Oct 2019 16:22:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 03/10] ioreq: add fields to allow
 internal ioreq servers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEludGVybmFsIGlv
cmVxIHNlcnZlcnMgYXJlIHBsYWluIGZ1bmN0aW9uIGhhbmRsZXJzIGltcGxlbWVudGVkIGluc2lk
ZQo+IG9mIHRoZSBoeXBlcnZpc29yLiBOb3RlIHRoYXQgbW9zdCBmaWVsZHMgdXNlZCBieSBjdXJy
ZW50IChleHRlcm5hbCkKPiBpb3JlcSBzZXJ2ZXJzIGFyZSBub3QgbmVlZGVkIGZvciBpbnRlcm5h
bCBvbmVzLCBhbmQgaGVuY2UgaGF2ZSBiZWVuCj4gcGxhY2VkIGluc2lkZSBvZiBhIHN0cnVjdCBh
bmQgcGFja2VkIGluIGFuIHVuaW9uIHRvZ2V0aGVyIHdpdGggdGhlCj4gb25seSBpbnRlcm5hbCBz
cGVjaWZpYyBmaWVsZCwgYSBmdW5jdGlvbiBwb2ludGVyIHRvIGEgaGFuZGxlci4KPiAKPiBUaGlz
IGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGhhdmUgUENJIGNvbmZpZyBhY2Nlc3NlcyBmb3J3YXJk
ZWQgdG8KPiBleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIG9yIHRvIGludGVybmFsIG9uZXMgKGllOiBR
RU1VIGVtdWxhdGVkIGRldmljZXMKPiB2cyB2UENJIHBhc3N0aHJvdWdoKSwgYW5kIGlzIHRoZSBm
aXJzdCBzdGVwIGluIG9yZGVyIHRvIGFsbG93Cj4gdW5wcml2aWxlZ2VkIGRvbWFpbnMgdG8gdXNl
IHZQQ0kuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
