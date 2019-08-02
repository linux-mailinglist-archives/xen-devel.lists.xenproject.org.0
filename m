Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D467F7BE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXCO-0006nj-92; Fri, 02 Aug 2019 13:02:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htXCM-0006ne-De
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:02:18 +0000
X-Inumbo-ID: bfed9f92-b525-11e9-98cb-174a70040bfa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bfed9f92-b525-11e9-98cb-174a70040bfa;
 Fri, 02 Aug 2019 13:02:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C74471570;
 Fri,  2 Aug 2019 06:02:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E30C3F71F;
 Fri,  2 Aug 2019 06:02:14 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Lars Kurth <lars.kurth@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
Date: Fri, 2 Aug 2019 14:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDIvMDgvMjAxOSAxMzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIu
MDguMjAxOSAxMzoxNCwgTGFycyBLdXJ0aCB3cm90ZToKPj4+IDEuNS40IFNlbmRpbmcgUGF0Y2hl
cyBNYW51YWxseQo+PiBUaGlzIHNob3VsZCBiZSByZW1vdmVkIG9yIHN0YXRlIE5PVCBUTyBETyB0
aGlzCj4gCj4gUGxlYXNlIGRvbid0LiBJJ20gbm90IG1lYW5pbmcgdG8gc3RhcnQgdXNpbmcgZ2l0
IGZvciBwYXRjaCBzdWJtaXNzaW9uCj4gYW55IHRpbWUgc29vbiAoaWYgZXZlciksIGFuZCBJIGRv
bid0IHNlZSB3aHkgdGhpcyBzaG91bGQgYmUgYQo+IHJlcXVpcmVtZW50LgpXZWxsLCBzb21lb25l
IHVzaW5nIHRoaXMgaXMgbGlrZWx5IHRvIG1lc3MgaXQgdXAuIFNvIEkgYWdyZWUgd2l0aCBMYXJz
IGFuZCB0aGlzIApzaG91bGQgYXQgbGVhc3QgZGlzYWdyZWUgYW5kIGRpc2NvdXJhZ2UgdG8gdXNl
IGl0LgoKSWYgdGhleSBzdGlsbCBwbGFuIHRvIHVzZSBpdCB0aGVuIHRoZXkgYXJlIG9uIHRoZWly
IG93bi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
