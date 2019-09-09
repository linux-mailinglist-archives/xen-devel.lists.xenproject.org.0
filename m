Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC356AD6B0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Gnj-0003Hs-Fo; Mon, 09 Sep 2019 10:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7Gni-0003Hn-60
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:21:38 +0000
X-Inumbo-ID: 9a7f8a35-d2eb-11e9-ac0a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9a7f8a35-d2eb-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 10:21:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A10B1000;
 Mon,  9 Sep 2019 03:21:36 -0700 (PDT)
Received: from [10.37.9.253] (unknown [10.37.9.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F41383F71F;
 Mon,  9 Sep 2019 03:21:31 -0700 (PDT)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20190906143021.28261-1-roger.pau@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a2a91dfb-c305-9ada-d818-684ae048056d@arm.com>
Date: Mon, 9 Sep 2019 11:21:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906143021.28261-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/2] libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzYvMTkgMzozMCBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEhlbGxvLAo+
IAo+IEZpcnN0IHBhdGNoIGlzIGEgcHJlcGFyYXRvcnkgY2hhbmdlIHRvIGFsc28gbWFrZSB1c2Ug
b2YgdGhlIHBoeXNjYXBzIG9uCj4gQVJNLCBzZWNvbmQgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBw
aHlzY2FwIChIQVApIGluIG9yZGVyIGZvciB0aGUKPiB0b29sc3RhY2sgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gdXNlIEhBUCBpZiB0aGUgdXNlciBoYXNuJ3QgbWFkZSBhCj4gc2VsZWN0aW9uLgo+IAo+
IFRoYW5rcywgUm9nZXIuCj4gCj4gUm9nZXIgUGF1IE1vbm5lICgyKToKPiAgICBzeXNjdGw6IHJl
cG9ydCBleGlzdGluZyBwaHlzY2FwcyBvbiBBUk0KCkkgaGF2ZSBjb21taXR0ZWQgdGhpcyBwYXRj
aC4KCj4gICAgc3lzY3RsL2xpYnhsOiBjaG9vc2UgYSBzYW5lIGRlZmF1bHQgZm9yIEhBUAoKVGhp
cyBvbmUgcmVxdWlyZXMgYW4gQWNrIGZyb20gdGhlIHRvb2xzIG1haW50YWluZXJzLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
