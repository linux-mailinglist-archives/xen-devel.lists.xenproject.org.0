Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327343616D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 18:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYqi-0003g7-QN; Wed, 05 Jun 2019 16:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYYqh-0003fN-8W
 for xen-devel@lists.xen.org; Wed, 05 Jun 2019 16:33:15 +0000
X-Inumbo-ID: 9d2bb0dc-87af-11e9-9585-5fe8972b2c57
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d2bb0dc-87af-11e9-9585-5fe8972b2c57;
 Wed, 05 Jun 2019 16:33:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8352A374;
 Wed,  5 Jun 2019 09:33:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0913F5AF;
 Wed,  5 Jun 2019 09:33:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1901031527420.800@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1904171351420.1370@sstabellini-ThinkPad-X260>
 <f3ba80f6-131b-0c24-a44e-c0f6b32eb429@arm.com>
Message-ID: <b878623f-7e95-ed1b-ab8a-4b5934c91c71@arm.com>
Date: Wed, 5 Jun 2019 17:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3ba80f6-131b-0c24-a44e-c0f6b32eb429@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/5] dom0less device assignment
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
Cc: andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8wNC8yMDE5IDIyOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gNC8xNy8x
OSA5OjUyIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IEdlbnRsZSBwaW5nLgo+IAo+
IEFzIEkgc2FpZCBpbiBbMV0sIEkgZG9uJ3QgcGxhbiB0byByZXZpZXcgdjIgYmVjYXVzZSBJIGFu
c3dlcmVkIHRvIHNvbWUgb2YgdGhlIAo+IGlzc3VlcyBpbiB2MS4gWW91IGhhdmUgZW5vdWdoIHRv
IHJlc3BpbiB0aGlzLgoKQnVtcGluZyB0aGlzLiBPbiBJUkMgeW91IG1lbnRpb24geW91IGhhdmUg
bm8gd2F5IGZvcndhcmQsIGhvd2V2ZXIgSSBoYXZlbid0IHNlZW4gCmFueSBmZWVkYmFjayBvbiBj
b21tZW50cyBJIHByb3ZpZGVkLgoKSSBhbSBoYXBweSB0byBoZWxwIGlmIHNvbWV0aGluZyBpcyBu
b3QgY2xlYXIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
