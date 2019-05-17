Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F382181B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbrG-0006S8-UU; Fri, 17 May 2019 12:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRbrF-0006S3-R3
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:21:05 +0000
X-Inumbo-ID: 3c5ebfb2-789e-11e9-9bb1-a746dda293be
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5ebfb2-789e-11e9-9bb1-a746dda293be;
 Fri, 17 May 2019 12:21:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 06:21:02 -0600
Message-Id: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 06:21:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/2] x86: cater for CPUID leaf 7 subleaf 1
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgSSd2ZSBhbHNvIGFscmVhZHkgY29kZWQgdXAgdGhlIHBhdGNoIHRvIGFjdHVhbGx5IHN1
cHBvcnQKdGhlIG5ldyBCRmxvYXQxNiBpbnNucywgdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gc3Vi
bWl0dGluZyB0aGlzCndpdGhvdXQgaGF2aW5nIHRlc3RlZCBpdC4gQnV0IHRoZSB0d28gcHJlcGFy
YXRvcnkgcGF0Y2hlcyBtYXkKdHVybiBvdXQgdXNlZnVsIGVhcmxpZXIgb24uIFRoZXkncmUgYmFz
ZWQgb24gdGhlIGZ1bGwgQVZYNTEyCmVtdWxhdG9yIHNlcmllcywgYnV0IHNob3VsZG4ndCBiZSBv
dmVybHkgZGlmZmljdWx0IHRvIHJlLWJhc2UKYWhlYWQgb2YgaXQuCgoxOiB4ODYvQ1BVSUQ6IHN1
cHBvcnQgbGVhZiA3IHN1YmxlYWYgMSAvIEFWWDUxMl9CRjE2CjI6IHg4NmVtdWw6IHN1cHBvcnQg
Q1BVSUQgc3VibGVhdmVzIGZvciB2Y3B1X2hhc18qKCkKCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
