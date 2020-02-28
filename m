Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974217376C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:45:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eyi-0002mw-Om; Fri, 28 Feb 2020 12:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eyg-0002mm-LU
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:42:50 +0000
X-Inumbo-ID: d4064748-5a27-11ea-9923-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4064748-5a27-11ea-9923-12813bfff9fa;
 Fri, 28 Feb 2020 12:42:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4FDE1B1FD;
 Fri, 28 Feb 2020 12:42:49 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
Date: Fri, 28 Feb 2020 13:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228120753.38036-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMzowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgdXNh
Z2Ugb2YgdGhlIHBlci1DUFUgc2NyYXRjaCBjcHVtYXNrIGlzIGRhbmdlcm91cyBzaW5jZQo+IHRo
ZXJlJ3Mgbm8gd2F5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlIG1hc2sgaXMgYWxyZWFkeSBiZWluZyB1
c2VkIGV4Y2VwdAo+IGZvciBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIGFsbCB0aGUgY2FsbGVy
cyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4KPiAKPiBUaGlzIGlzIHVuc2FmZSBhbmQgbm90IHJl
bGlhYmxlLCBzbyBpbnRyb2R1Y2UgYSBtaW5pbWFsIGdldC9wdXQKPiBpbmZyYXN0cnVjdHVyZSB0
byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0aGUgc2NyYXRjaCBtYXNrIGFuZCB1c2FnZQo+IGlu
IGludGVycnVwdCBjb250ZXh0Lgo+IAo+IE1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mIHNjcmF0Y2hf
Y3B1bWFzayB0byBzbXAuYyBpbiBvcmRlciB0byBwbGFjZSB0aGUKPiBkZWNsYXJhdGlvbiBhbmQg
dGhlIGFjY2Vzc29ycyBhcyBjbG9zZSBhcyBwb3NzaWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
