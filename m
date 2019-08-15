Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C628E7E8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyBod-0002ah-Gd; Thu, 15 Aug 2019 09:13:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyBob-0002ab-VA
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:13:02 +0000
X-Inumbo-ID: de9a6288-bf3c-11e9-8b99-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de9a6288-bf3c-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 09:12:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE4D28;
 Thu, 15 Aug 2019 02:12:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5F43F706;
 Thu, 15 Aug 2019 02:12:55 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e38987a6-a828-5d0d-1ede-9dc0d0363d9c@arm.com>
Date: Thu, 15 Aug 2019 10:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE0LzA4LzIwMTkgMjM6MzUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDEzIEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IEBA
IC0xNjIsNiArMTU2LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2Rl
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4+PiAgICAgICAgICAgYm9vdGluZm8ubWVtLmJh
bmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+ICAgICAgICAgICBib290
aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+ICAgICAgIH0KPj4+ICsKPj4+ICsgICAgaWYgKCBib290
aW5mby5tZW0ubnJfYmFua3MgPT0gTlJfTUVNX0JBTktTICkKPj4+ICsgICAgICAgIHJldHVybiAt
RU5PU1BDOwo+PiBBcmUgeW91IHN1cmUgdGhhdCB0aGlzIGxvZ2ljIGlzIGNvcnJlY3Q/Cj4+Cj4+
IEZvciBleGFtcGxlLCBpZiBOUl9NRU1fQkFOS1MgaXMgMSwgYW5kIHdlIGhhdmUgZXhhY3RseSBv
bmUgbWVtb3J5IG5vZGUKPj4gaW4gZGV2aWNlIHRyZWUsIHRoaXMgZnVuY3Rpb24gd2lsbCBmYWls
LiBCdXQgaXQgc2hvdWxkIG5vdC4gSSB0aGluayB5b3UKPj4gd2FudCB0aGlzIGNvbmRpdGlvbjog
Ym9vdGluZm8ubWVtLm5yX2JhbmtzID4gTlJfTUVNX0JBTktTCj4gCj4gWW91IGFyZSByaWdodCwg
aWYgTlJfTUVNX0JBTktTIGlzIDEgYW5kIHdlIGhhdmUgMSBtZW1vcnkgbm9kZSBpbiBkZXZpY2UK
PiB0cmVlIHRoZSBjb2RlIHdvdWxkIHJldHVybiBhbiBlcnJvciB3aGlsZSBhY3R1YWxseSBpdCBp
cyBub3JtYWwuCj4gCj4gSSB0aGluayB0aGUgcmlnaHQgY2hlY2sgd291bGQgYmU6Cj4gCj4gICAg
aWYgKCBpIDwgYmFua3MgJiYgYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyAp
Cj4gICAgICAgIHJldHVybiAtRU5PU1BDOwoKRldJVywgdGhpcyBjaGVjayBsb29rcyBnb29kIHRv
IG1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
