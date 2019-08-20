Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663396B00
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 23:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0BCH-0004ek-7Y; Tue, 20 Aug 2019 20:57:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YXB6=WQ=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1i0BCF-0004ef-AZ
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 20:57:39 +0000
X-Inumbo-ID: 229d2246-c38d-11e9-adba-12813bfff9fa
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 229d2246-c38d-11e9-adba-12813bfff9fa;
 Tue, 20 Aug 2019 20:57:35 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 871152400FC
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 22:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1566334654; bh=2MsP85GqOF6PtRtBTQZgXyWoDvebhh3+dCHHBZwBkjI=;
 h=Subject:To:From:Date:From;
 b=DdY0BspIZlWIZL0Cf1Lz8dxJAYYlPwSFWCsaGBsEb8vqyPT9+oySSnHLvs4RkOjKb
 G6oI/PYpqZbSmnW+7wdR6fJR329Chlx9zhT5B3fWr67lhWWa5crY30lZ3osfEOknEU
 MYImpwP0pJzrjbdAmJHQygAFZldrGg3hltZVioFZ4Uvo9StXBRXs+U50qNWyyrcvfN
 kcf2VeiLYysZgWkwr1t1fEMnIIXNMxpKplOuc87/wtC2gn7gDi3z29gG6R0KIgZG0p
 hDRC18EiaizLDjcUG3vpAcCWmTJ4ZKT65eZ72x0Ne5/x+SbcPvr6gasqmcG8575ZlK
 EJ+MC8j9aD9VQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46CjmF3BRgz9rxW;
 Tue, 20 Aug 2019 22:57:33 +0200 (CEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Paul.Durrant@citrix.com
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
Date: Tue, 20 Aug 2019 22:57:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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

T24gMjAuMDguMjAxOSAyMjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wOC8yMDE5
IDIxOjM2LCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+IE9uIDIwLjA4LjIwMTkgMjA6MTIsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gWGVuIHZlcnNpb24gNC4xMC4yLiBkb20wIGtlcm5lbCA0
LjEzLjE2LiBUaGUgQklPUyB2ZXJzaW9uIGlzIHVuY2hhbmdlZAo+Pj4+IGZyb20gMjcwMFggKHdv
cmtpbmcpIHRvIDM3MDBYIChjcmFzaGluZykuCj4+PiBTbyB5b3UndmUgZG9uZSBhIFplbiB2MSA9
PiBaZW4gdjIgQ1BVIHVwZ3JhZGUgYW5kIGFuIGV4aXN0aW5nIHN5c3RlbT8KPj4gV2l0aCAiZXhp
c3Rpbmcgc3lzdGVtIiB5b3UgbWVhbiB0aGUgV2luZG93cyBpbnN0YWxsYXRpb24/Cj4gSSBtZWFu
dCBzYW1lIGNvbXB1dGVyLCBub3Qgc2FtZSBWTS4KClRyaWVkIHdpdGggMiBtYWluYm9hcmRzOiBB
c3JvY2sgWDM3MCBQcm80IGFuZCBBc3JvY2tSYWNrIFg0NzBENFUuCllvdSBuZWVkIHRvIGZsYXNo
IHRoZSBCSU9TIGZvciBaZW4yLiBYNDcwRDRVIEJJT1MgMy4xIHdvcmtzIHdpdGggMjcwMFggCmJ1
dCBub3Qgd2l0aCAzNzAwWC4gWDM3MCBQcm80IHdpdGggc29tZXdoYXQgb2xkZXIgQklPUyB3b3Jr
ZWQgZm9yIDI3MDBYIAphbmQgZG9lcyBub3Qgd29yayB3aXRoIGN1cnJlbnQgKDYuMDApIEJJT1Mg
YW5kIDM3MDBYLgoKPj4gWWVzLCBidXQgaXQgaXMgbm90IHJlbGV2YW50LiBUaGUgc2FtZSBCU09E
cyBoYXBwZW4gaWYgeW91IGJvb3QgdGhlIEhWTQo+PiB3aXRoIGp1c3QgdGhlIGlzbyBpbnN0YWxs
YXRpb24gbWVkaXVtIGFuZCBubyBkaXNrcy4KPiBUaGF0J3MgYSB1c2VmdWwgZGF0YXBvaW50LsKg
IEkgd291bGRuJ3QgZXhwZWN0IHRoaXMgdG8gYmUgcmVsZXZhbnQsIGdpdmVuCj4gaG93IFdpbmRv
dydzIEhBTCB3b3Jrcy4KCkl0IHNob3VsZCBtYWtlIGRlYnVnZ2luZyBmb3IgeW91IHF1aXRlICJz
aW1wbGUiIGJlY2F1c2UgaXQgY2FuIGJlIApyZXByb2R1Y2VkIHZlcnkgZWFzaWx5LgoKUmVnYXJk
cyBBbmRyZWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
