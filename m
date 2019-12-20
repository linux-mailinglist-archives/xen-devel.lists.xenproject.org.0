Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008D127E54
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:43:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJSs-0007eA-0H; Fri, 20 Dec 2019 14:41:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJSr-0007e2-9w
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:41:13 +0000
X-Inumbo-ID: c26f2b30-2336-11ea-9371-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c26f2b30-2336-11ea-9371-12813bfff9fa;
 Fri, 20 Dec 2019 14:41:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22590B1A0;
 Fri, 20 Dec 2019 14:41:08 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
 <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
Date: Fri, 20 Dec 2019 15:41:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNToyNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8yMC8xOSAy
OjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW4gZXB0X3AybV90eXBlX3RvX2ZsYWdzKCkg
cGFzc2luZyBpbiB0eXBlIGFuZCBhY2Nlc3MgYXMgc2VwYXJhdGUKPj4gcGFyYW1ldGVycyBjYW4g
YmUgY29uc2lkZXJlZCBhbiBvcHRpbWl6YXRpb24sIGFzIGFsbCBjYWxsZXJzIHNldCB0aGUKPj4g
cmVzcGVjdGl2ZSBmaWVsZHMgaW4gdGhlIGVudHJ5IGJlaW5nIHVwZGF0ZWQgYmVmb3JlIHRoZSBj
YWxsLiBSZXRhaW4KPj4gdGhpcyBiZWhhdmlvciBidXQgYWRkIGFzc2VydGlvbnMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJbiB3aGF0
IHdheSBpcyBpdCBhbiBvcHRpbWl6YXRpb24/CgpUaGVyZSdzIG5vIHBvaW50ZXIgZGUtcmVmIG5l
ZWRlZDsgdGhlIHZhbHVlcyB3aWxsIGFscmVhZHkgY29tZSBpbgp2aWEgcmVnaXN0ZXJzLiBBbmQg
ImNhbiBiZSBjb25zaWRlcmVkIiBiZWNhdXNlIHBvc3NpYmx5IHNvbWUKY29tcGlsZXJzIGFyZSBz
bWFydCBlbm91Z2ggdG8gZWxpbWluYXRlIHRoZSBwb2ludGVyIGRlLXJlZiBhZ2FpbgooYnV0IHRo
ZW4gaXQnbGwgc3RpbGwgYmUgYSBiaXRmaWVsZCBleHRyYWN0LCB3aGljaCBjYWxsZXJzIG1heQpi
ZSBhYmxlIHRvIGF2b2lkKS4KCj4gSSBkb24ndCBuZWNlc3NhcmlseSBvcHBvc2UgdGhpcywgYnV0
IGdpdmVuIHRoYXQgMyBvZiB0aGUgNCBjYWxsZXJzCj4gbGl0ZXJhbGx5IGRvIHNvbWV0aGluZyBs
aWtlOgo+IAo+ICAgICBlcHRfcDJtX3R5cGVfdG9fZmxhZ3MocDJtLCAmZSwgZS5zYV9wMm10LCBl
LmFjY2Vzcyk7Cj4gCj4gSXQgc2VlbXMgbGlrZSBqdXN0IGdldHRpbmcgcmlkIG9mIHRoZSBleHRy
YW5lb3VzIGFyZ3VtZW50cyBtaWdodCBhIGJlCj4gYmV0dGVyIG9wdGlvbi4KClRoYXQgd2FzIG15
IG9yaWdpbmFsIGludGVudGlvbiBhcyB3ZWxsLCBidXQgaWlyYyBBbmRyZXcgZGlkbid0IGxpa2UK
aXQgd2hlbiB3ZSBkaXNjdXNzZWQgaXQgYmFjayB0aGVuICh0aGUgY29udGV4dCBoZXJlIGJlaW5n
IFhTQS0zMDQpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
