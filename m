Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B842014BCC4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:25:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSib-0000Qo-Pv; Tue, 28 Jan 2020 15:23:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwSia-0000Qg-LI
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:23:56 +0000
X-Inumbo-ID: 322c9012-41e2-11ea-8714-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 322c9012-41e2-11ea-8714-12813bfff9fa;
 Tue, 28 Jan 2020 15:23:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65222ADB3;
 Tue, 28 Jan 2020 15:23:55 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-7-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db575271-12fa-a905-c5b7-72f6aae941e1@suse.com>
Date: Tue, 28 Jan 2020 16:23:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200124153103.18321-7-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86 / vmx: use a MEMF_no_refcount
 domheap page for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDEuMjAyMCAxNjozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IHZteF9hbGxvY192bGFw
aWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkgb2RkIGxvb2tpbmcgY29k
ZQo+IHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21oZWFwIHBhZ2UgYW5kIHRoZW4g
c2hhcmVzIHdpdGggdGhlIGd1ZXN0Cj4gYXMgaWYgaXQgd2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhp
cyB0aGVuIHJlcXVpcmVzIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkKPiB0byBjYWxsIGEgc3Bl
Y2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0gY29kZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCku
Cj4gCj4gQnkgdXNpbmcgYSBNRU1GX25vX3JlZmNvdW50IGRvbWhlYXAgcGFnZSBpbnN0ZWFkLCB0
aGUgb2RkIGxvb2tpbmcgY29kZSBpbgo+IHZteF9hbGxvY192bGFwaWNfbWFwcGluZygpIGNhbiBz
aW1wbHkgdXNlIGdldF9wYWdlX2FuZF90eXBlKCkgdG8gc2V0IHVwIGEKPiB3cml0YWJsZSBtYXBw
aW5nIGJlZm9yZSBpbnNlcnRpb24gaW4gdGhlIFAyTSBhbmQgdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoKQo+IGNhbiBzaW1wbHkgcmVsZWFzZSB0aGUgcGFnZSB1c2luZyBwdXRfcGFnZV9hbGxvY19y
ZWYoKSBmb2xsb3dlZCBieQo+IHB1dF9wYWdlX2FuZF90eXBlKCkuIFRoaXMgdGhlbiBhbGxvd3Mg
ZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCkgdG8gYmUKPiBwdXJnZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
