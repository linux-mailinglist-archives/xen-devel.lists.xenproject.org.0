Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D43BDDD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:54:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haRGU-00082e-4k; Mon, 10 Jun 2019 20:51:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haRGS-00082R-Gt
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:51:36 +0000
X-Inumbo-ID: 88f66dc4-8bc1-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88f66dc4-8bc1-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:51:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0CF920820;
 Mon, 10 Jun 2019 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560199895;
 bh=iF9pmAo0jwQebAFRb6gjylcwLJaeJFSiLZEmJg+037Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=a2ggYKSrkL94n0M+6LY9yIpwWtWy1HPMzw6DjrmjmjRjwch9p8ZaX97IH6CpfUUQ0
 pYWtHbHUI1SZ6H1H66WP+nGeIuggID5FNwG0arMV0l/EPOqrnGSttrW4m++16JZ7dD
 Jb7MwsqBxKSXSMQhZ/RyTFZ+qbZho6uvKtIlwPqg=
Date: Mon, 10 Jun 2019 13:51:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <471832b3-c328-2275-2abd-845371be819b@arm.com>
Message-ID: <alpine.DEB.2.21.1906101347270.8691@sstabellini-ThinkPad-T480s>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
 <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
 <471832b3-c328-2275-2abd-845371be819b@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIwLzA1LzIwMTkg
MjI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIEZyaSwgMTAgTWF5IDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhbiBpbi1jb2Rl
IGNvbW1lbnQgc28gd2UgY2FuIGRpc2N1c3Mgb24gdGhlIHdvcnRoaW5lc3MuCj4gPiAKPiA+IEkg
c3VnZ2VzdCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgo+ID4gCj4gPiAgIC8qCj4gPiAg
ICAqIEZsdXNoIGFsbCBoeXBlcnZpc29yIG1hcHBpbmdzIGZyb20gdGhlIFRMQiBvZiB0aGUgbG9j
YWwgcHJvY2Vzc29yLiBOb3RlCj4gPiAgICAqIHRoYXQgaW5zdHJ1Y3Rpb24gY2FjaGUgbWFpbnRl
bmFuY2UgbWlnaHQgYWxzbyBiZSByZXF1aXJlZCB3aGVuIHNlbGYKPiA+ICAgICogbW9kaWZ5aW5n
IFhlbiBjb2RlLCBzZWUgRDUtMjUyMiBpbiBBUk0gRERJIDA0ODdELmEgYW5kIEIzLjExLjIgaW4g
QVJNCj4gPiAgICAqIERESSAwNDA2Qy5jLgo+ID4gICAgKi8KPiAKPiBUaGlzIGxvb2tzIHF1aXRl
IG91dC1vZi1jb250ZXh0LCB3aGF0IGlzIHRoZSByZWxhdGlvbiBiZXR3ZWVuIAo+IHNlbGYtbW9k
aWZ5aW5nIGNvZGUgYW5kIFRMQiBmbHVzaD8KCiJGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5n
cyBmcm9tIHRoZSBUTEIgb2YgdGhlIGxvY2FsIHByb2Nlc3NvciIgaXMKdGhlIGRlc2NyaXB0aW9u
IG9mIHRoZSBmdW5jdGlvbiBiZWxvdyAoaXQgY2Fubm90IGJlIHNlZW4gaGVyZSBidXQgaXQncwp0
aGUgZnVuY3Rpb24gb24gdG9wIG9mIHdoaWNoIHRoaXMgY29tbWVudCBpcyBzdXBwb3NlZCB0byBi
ZSBvbiwKZmx1c2hfeGVuX2RhdGFfdGxiX2xvY2FsKS4gVGhlIHJlc3Qgb2YgdGhlIGNvbW1lbnQg
aXMgaW5mb3JtYXRpdmUKcmVnYXJkaW5nIGRpZmZpY3VsdCBjYXNlcyBzdWNoIGFzIHNlbGYtbW9k
aWZ5aW5nIGNvZGUsIHdoaWNoIHdhcyBwcmVzZW50CmluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9m
IHRoZSBjb2RlIGFuZCBJIHdvdWxkIGxpa2UgdG8gcmV0YWluLiBUaGUKcmVsYXRpb24gaXMgdGhh
dCB0aGVyZSBpcyBhIGdvb2QgY2hhbmNlIHlvdSBuZWVkIHRvIGRvIGJvdGguCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
