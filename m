Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292311830
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 13:32:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM9u2-0008LV-5M; Thu, 02 May 2019 11:29:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EvB=TC=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1hM9u1-0008LQ-5S
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 11:29:25 +0000
X-Inumbo-ID: 87571ab4-6ccd-11e9-a9c9-431904742aae
Received: from mx2.freebsd.org (unknown [8.8.178.116])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87571ab4-6ccd-11e9-a9c9-431904742aae;
 Thu, 02 May 2019 11:29:21 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 66BA56E928;
 Thu,  2 May 2019 11:29:19 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id A02C08A6B7;
 Thu,  2 May 2019 11:29:18 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [80.30.173.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id DC976B396;
 Thu,  2 May 2019 11:29:17 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Thu, 2 May 2019 13:29:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190502112915.kxtbuaqtiged25yz@Air-de-Roger>
References: <osstest-135317-mainreport@xen.org>
 <23753.31236.827372.481563@mariner.uk.xensource.com>
 <20190502072827.mq6xqwgmfk2mt55y@Air-de-Roger>
 <23754.52115.257898.383814@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23754.52115.257898.383814@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: A02C08A6B7
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.98 / 15.00];
 local_wl_from(0.00)[FreeBSD.org];
 NEURAL_HAM_MEDIUM(-1.00)[-0.998,0];
 NEURAL_HAM_SHORT(-0.99)[-0.986,0];
 ASN(0.00)[asn:11403, ipnet:2610:1c1:1::/48, country:US];
 NEURAL_HAM_LONG(-1.00)[-1.000,0]
Subject: Re: [Xen-devel] build-amd64-xen-freebsd (Re: [freebsd-master test]
 135317: regressions - FAIL)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6NTA6NTlBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm7vv70gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtmcmVlYnNk
LW1hc3RlciB0ZXN0XSAxMzUzMTc6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gT24gV2VkLCBN
YXkgMDEsIDIwMTkgYXQgMTE6NTA6NDRBTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiA+
IEkgZ3Vlc3MgdGhpcyBtdXN0IGJlIGEgaG9zdC1zcGVjaWZpYyBGcmVlQlNEIGtlcm5lbCBidWcg
PyAgUm9nZXIsIGFyZQo+ID4gPiB5b3UgaW52ZXN0aWdhdGluZyA/Cj4gPiAKPiA+IEhtLCBJJ20g
bm90IHN1cmUgSSBmb2xsb3cgd2h5IHRoaXMgaXMgaG9zdC1zcGVjaWZpYy4gSXQgaGFzIGhhcHBl
bmVkCj4gPiBvbiBib3RoIGZpYW5vMSBhbmQgZ29kZWxsbzEuIEFGQUlDVCB0aGlzIGlzIGEgcmVn
cmVzc2lvbiBpbiB0aGUKPiA+IEZyZWVCU0Qga2VybmVsLgo+IAo+IEkgdGhvdWdodCBpdCBtdXN0
IGJlIGhvc3Qtc3BlY2lmaWMgYmVjYXVzZSBJIHRob3VnaHQKPiBidWlsZC1hbWQ2NC14ZW4tZnJl
ZWJzZCB3b3VsZCBiZSBkb25lIHdpdGggdGhlIHByZXZpb3VzLCBhbm9pbnRlZCwKPiB2ZXJzaW9u
IG9mIGZyZWVic2QuICBCdXQgaW4gZmFjdCBpdCBpcyBkb25lIHdpdGggdGhlIGZyZXNobHkgYnVp
bHQKPiBmcmVlYnNkIHZlcnNpb24uICBTbyB0aGlzIHJlYXNvbmluZyB3YXMgd3JvbmcuCj4gCj4g
PiBEbyB5b3Uga25vdyBpZiBvc3N0ZXN0IGhhcyBzdGFydGVkIGEgYmlzZWN0aW9uIG9mIHRoaXM/
IEknbSBub3Qgc2VlaW5nCj4gPiBhbnl0aGluZyBvbiB0aGUgc3VtbWFyeSBwYWdlLgo+IAo+IEl0
IGhhcyBjb21wbGV0ZWQgaXQuICBTZWUgYXR0YWNoZWQuCgpPaCB0aGFua3MhIEkndmUgYWxyZWFk
eSByZXBvcnRlZCB0aGlzIHVwc3RyZWFtLgoKSXMgdGhlcmUgYW55d2F5IEkgY291bGQgZ2V0IENj
J2VkIG9uIGJpc2VjdGlvbnMgb2YgZnJlZWJzZC0qIGJyYW5jaGVzPwpJIGFscmVhZHkgZ2V0IEND
J2VkIG9uIG5vcm1hbCBmbGlnaHQgcmVwb3J0cy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
