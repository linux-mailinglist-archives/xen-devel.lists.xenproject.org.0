Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC0151EE9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:06:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1bf-0002dF-To; Tue, 04 Feb 2020 17:03:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2C6S=3Y=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iz1be-0002dA-3b
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:03:22 +0000
X-Inumbo-ID: 3f28bc74-4770-11ea-8fc8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f28bc74-4770-11ea-8fc8-12813bfff9fa;
 Tue, 04 Feb 2020 17:03:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1bc-0004j0-85; Tue, 04 Feb 2020 17:03:20 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1bb-00020R-SV; Tue, 04 Feb 2020 17:03:20 +0000
Date: Tue, 4 Feb 2020 17:03:16 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200204170316.rx5c2wrngt223n3o@debian>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
 <20200204164805.nb5kqahvv7p6wfb3@debian>
 <20200204165621.GL4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204165621.GL4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDU6NTY6MjFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAwNDo0ODowNVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDM6MzY6NTVQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gV2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1
cCBlcnJvciBpbiB0aGUgdXBwZXIgbGF5ZXIuCj4gPiA+IAo+ID4gPiBGb3IgWGVuLCByZW1vdmUg
YWxsIHBhbmljKCkgYW5kIEJVR19PTigpIGluIGluaXRfZXZ0Y2huIGFuZAo+ID4gPiBtYXBfdmNw
dWluZm8uIE9ubHkgcGFuaWMvQlVHX09OIHdoZW4gWGVuIGNhbid0IGZhaWwgZ3JhY2VmdWxseS4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+
Cj4gPiA+IC0tLQo+ID4gCj4gPiBCVFcgSSBkaXNjb3ZlciBhbiBpc3N1ZTogaW5pdF9ldnRjaG4g
c2V0cyBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRIGV2ZXJ5Cj4gPiB0aW1lIGl0IGlzIGNhbGxlZC4g
VGhhdCdzIHVubmVjZXNzYXJ5IGZvciBBUHMuIFBlcmhhcHMgaXQgd291bGQgYmUgYmVzdAo+ID4g
dG8gYnJlYWsgdGhhdCBmdW5jdGlvbiBpbnRvIHR3bywgb25lIGZvciBzZXR0aW5nIEhWTV9QQVJB
TV9DQUxMQkFDS19JUlEsCj4gPiB0aGUgb3RoZXIgZm9yIGFsbG9jYXRpbmcgYW5kIHNldHRpbmcg
Y2FsbGJhY2suIEJTUCBuZWVkcyB0byBjYWxsIGJvdGgKPiA+IHdoaWxlIEFQcyBvbmx5IG5lZWRz
IHRvIGNhbGwgdGhlIGxhdHRlci4KPiAKPiBXZSBjb3VsZCBnYXRlIHRoZSBjYWxsIHRvIEhWTU9Q
X3NldF9wYXJhbSBvbiAhc21wX3Byb2Nlc3Nvcl9pZCgpLCB0aGF0Cj4gd2F5IHRoZSBCU1Agd291
bGQgYmUgdGhlIG9ubHkgb25lIHRvIHNldCBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRLiBJJ20KPiBu
b3Qgc3VyZSBzcGxpdHRpbmcgdGhpcyBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24gaXMgd29ydGgg
aXQuCgpUaGlzIHdvcmtzIHRvby4gQnV0IGFnYWluLCBzb21ldGhpbmcgZm9yIGFub3RoZXIgZGF5
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
