Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B741CE4BF3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 15:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNzVH-0002g6-SB; Fri, 25 Oct 2019 13:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNzVG-0002g0-Pn
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 13:19:42 +0000
X-Inumbo-ID: 1a45f0b7-f72a-11e9-94c9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a45f0b7-f72a-11e9-94c9-12813bfff9fa;
 Fri, 25 Oct 2019 13:19:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F123DB68A;
 Fri, 25 Oct 2019 13:19:40 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb278e2c-bae7-2a76-35c6-852e038eae1c@suse.com>
Date: Fri, 25 Oct 2019 15:19:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015154736.19882-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/4] iommu: fixes for interrupt remapping
 enabling
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMjAxOSAxNzo0NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGNvbnRhaW4gZml4ZXMgZm9yIGlzc3VlcyBmb3VuZCB3aGVu
IGVuYWJsaW5nCj4gaW50ZXJydXB0IHJlbWFwcGluZyBhbmQgdGhlIElPLUFQSUMgYWxyZWFkeSBo
YXMgdW5tYXNrZWQgcGlucy4gV2hpbGUgSSdtCj4gbm90IGF3YXJlIG9mIGFueSBzeXN0ZW0gbWFs
ZnVuY3Rpb25pbmcgKGFwYXJ0IGZyb20gcmVwb3J0aW5nIElPTU1VCj4gaW50ZXJydXB0IHJlbWFw
cGluZyBmYXVsdHMpIEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRob3NlIGluCj4g
NC4xMy4KPiAKPiBUaGUgc2VyaWVzIGNhbiBhbHNvIGJlIGZvdW5kIGF0Ogo+IAo+IGdpdDovL3hl
bmJpdHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgaW9tbXVfaW50cl92Mwo+IAo+IFRo
YW5rcywgUm9nZXIuCj4gCj4gUm9nZXIgUGF1IE1vbm5lICg0KToKPiAgIGlvbW11L2FtZDogc3Vw
cG9ydCBhbGwgZGVsaXZlcnkgbW9kZXMgd2l0aCB4MkFQSUMKPiAgIHgyQVBJQzogc2ltcGxpZnkg
cmVzdW1lCj4gICB4MkFQSUM6IHRyYW5zbGF0ZSBJTy1BUElDIGVudHJpZXMgd2hlbiBlbmFibGlu
ZyB0aGUgSU9NTVUKPiAgIGlvbW11OiB0cmFuc2xhdGUgSU8tQVBJQyBwaW5zIHdoZW4gZW5hYmxp
bmcgaW50ZXJydXB0IHJlbWFwcGluZwoKQXMgbWVudGlvbmVkIGluIHJlcGx5IHRvICMxLCBJIHRo
aW5rIHRoYXQgb25lIHNob3VsZCBnbyBsYXN0LiBUaGUKb3RoZXIgdGhyZWUgYXJlIHJlYWR5IHRv
IGJlIGNvbW1pdHRlZCwgYnV0IEknZCBsaWtlIHRvIGRvdWJsZSBjaGVjawp0aGF0IHRoZXJlJ3Mg
bm8gZGVwZW5kZW5jeSBvZiBhbnkgb2YgdGhlbSBvbiB0aGUgMXN0LgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
