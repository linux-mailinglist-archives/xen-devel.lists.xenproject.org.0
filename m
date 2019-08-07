Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDAB84B76
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvL1F-0006iF-3V; Wed, 07 Aug 2019 12:26:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvL1D-0006i1-CL
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:26:15 +0000
X-Inumbo-ID: 8befe572-b90e-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8befe572-b90e-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:26:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B960628;
 Wed,  7 Aug 2019 05:26:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1197F3F575;
 Wed,  7 Aug 2019 05:26:12 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
 <20190807101028.28778-2-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8a7de44d-4fc6-cbe6-1c52-066fc4919302@arm.com>
Date: Wed, 7 Aug 2019 13:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807101028.28778-2-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/2] xen/arm: extend
 fdt_property_interrupts to support DomU
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gMDcvMDgvMjAxOSAxMToxMCwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IEV4
dGVuZCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB0byBkZWFsIHdpdGggb3RoZXIgZG9tYWluIHRo
YW4gdGhlIGh3ZG9tLgo+IAo+IFRoZSBwcm90b3R5cGUgb2YgZmR0X3Byb3BlcnR5X2ludGVycnVw
dHMoKSBoYXMgYmVlbiBtb2RpZmllZAo+IHRvIHN1cHBvcnQgYm90aCBod2RvbSBhbmQgZG9tVSBp
biBvbmUgZnVuY3Rpb24uCgpUbyBiZSBwZWRhbnRpYywgdGhlIGN1cnJlbnQgcHJvdG90eXBlIGZv
ciBmZHRfcHJvcGVydHlfaW50ZXJydXB0cygpIGNhbiBhbHJlYWR5IApkZWFsIHdpdGggZWl0aGVy
IGh3ZG9tIGFuZCBEb21VLiBXaGF0IHlvdXIgcGF0Y2ggZG9lcyBpcyBwYXNzaW5nIGtpbmZvLCBz
byB5b3UgCm9ubHkgdXNlIHBhcmFtZXRlciByYXRoZXIgdGhhbiB0d28uIFNvIGhvdyBhYm91dDoK
CiJUaGUgZG9tYWluIGFuZCBmZHQgY2FuIGJlIGZvdW5kIGluIHRoZSBzdHJ1Y3R1cmUga2luZm8u
IFJhdGhlciB0aGFuIGFkZGluZyBhIGFuIApleHRyYSBhcmd1bWVudCBmb3IgdGhlIGRvbWFpbiwg
cGFzcyBkaXJlY3RseSBraW5mby4gVGhpcyBhbHNvIHJlcXVpcmVzIHRvIGFkYXB0IApmZHRfcHJv
cGVydHlfaW50ZXJydXB0cygpIHByb3RvdHlwZS4iCgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJhdG9y
eSBmb3IgdGhlIG5leHQgcGF0Y2ggd2hpY2ggY29uc29saWRhdGVzCj4gbWFrZV90aW1lcl9ub2Rl
IGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZSIuCgpJbiB2MywgSSBwb2ludGVkIG91dCB0aGF0IGl0
IGlzIGEgYml0IHJpc2t5IHRvIHdyaXRlIGRvd24gdGhlIHRpdGxlIG9mIGEgcGF0Y2ggCnRoYXQg
ZG9lcyBub3QgcHJlY2VkZWQgaXQgKG9yIGJlZW4gY29tbWl0dGVkKS4gSW1hZ2luZSB3ZSBjYW4g
ZGVjaWRlIHRvIHJlbmFtZSAKaXQuIEZ1cnRoZXJtb3JlLCAibmV4dCBwYXRjaCIgaW1wbGllcyB0
aGV5IGFyZSBjb21taXR0ZWQgb25lIGFmdGVyIHRoZSBvdGhlci4KCkl0IGlzIGZhaXJseSBjb21t
b24gdG8gYXBwbHkgcGFydCBvZiB0aGUgc2VyaWVzIGlmIHRoZSByZXN0IG5lZWRzIHNvbWUgcmV3
b3JrLiAKU28gYSBiZXR0ZXIgKGFuZCBzYWZlciB3b3JkaW5nKSBpcyAiQSBmb2xsb3ctdXAgcGF0
Y2ggd2lsbCBuZWVkIHRvIGNyZWF0ZSB0aGUgCmludGVycnVwdHMgZm9yIGVpdGhlciBEb20wIG9y
IERvbVUiLgoKPiBPcmlnaW5hbCBnb2FsIGlzIHRvIGNvbnNvbGlkYXRlIG1ha2VfdGltZXIgZnVu
Y3Rpb25zLgoKV2l0aCBteSBzdWdnZXN0aW9uIGFib3ZlLCB0aGlzIHNlbnRlbmNlIGNhbiBiZSBk
cm9wcGVkLgoKVGhlIHJlc3Qgb2YgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIEkgYW0gaGFw
cHkgdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSAKd2hpbGUgY29tbWl0dGluZyBpdC4KCkxl
dCBtZSBrbm93IHlvdXIgcHJlZmVyZW5jZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
