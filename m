Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F91151E8A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 17:52:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1Mz-0000VY-CO; Tue, 04 Feb 2020 16:48:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2C6S=3Y=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iz1Mx-0000VT-3e
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 16:48:11 +0000
X-Inumbo-ID: 1fa29b57-476e-11ea-8fc1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fa29b57-476e-11ea-8fc1-12813bfff9fa;
 Tue, 04 Feb 2020 16:48:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1Mu-0004Mu-Qd; Tue, 04 Feb 2020 16:48:08 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1Mu-0000xN-Gq; Tue, 04 Feb 2020 16:48:08 +0000
Date: Tue, 4 Feb 2020 16:48:05 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200204164805.nb5kqahvv7p6wfb3@debian>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204153704.15934-2-liuwe@microsoft.com>
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDM6MzY6NTVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB3YW50IHRvIGJlIGFibGUgdG8gaGFuZGxlIEFQIHNldHVwIGVycm9yIGluIHRoZSB1cHBl
ciBsYXllci4KPiAKPiBGb3IgWGVuLCByZW1vdmUgYWxsIHBhbmljKCkgYW5kIEJVR19PTigpIGlu
IGluaXRfZXZ0Y2huIGFuZAo+IG1hcF92Y3B1aW5mby4gT25seSBwYW5pYy9CVUdfT04gd2hlbiBY
ZW4gY2FuJ3QgZmFpbCBncmFjZWZ1bGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxp
dXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCgpCVFcgSSBkaXNjb3ZlciBhbiBpc3N1ZTogaW5pdF9l
dnRjaG4gc2V0cyBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRIGV2ZXJ5CnRpbWUgaXQgaXMgY2FsbGVk
LiBUaGF0J3MgdW5uZWNlc3NhcnkgZm9yIEFQcy4gUGVyaGFwcyBpdCB3b3VsZCBiZSBiZXN0CnRv
IGJyZWFrIHRoYXQgZnVuY3Rpb24gaW50byB0d28sIG9uZSBmb3Igc2V0dGluZyBIVk1fUEFSQU1f
Q0FMTEJBQ0tfSVJRLAp0aGUgb3RoZXIgZm9yIGFsbG9jYXRpbmcgYW5kIHNldHRpbmcgY2FsbGJh
Y2suIEJTUCBuZWVkcyB0byBjYWxsIGJvdGgKd2hpbGUgQVBzIG9ubHkgbmVlZHMgdG8gY2FsbCB0
aGUgbGF0dGVyLgoKVGhpcyBpcyBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMgc2VyaWVzLCBidXQgaXQg
aXMgc29tZXRoaW5nIHRvIGNvbnNpZGVyIGluCnRoZSBmdXR1cmUuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
