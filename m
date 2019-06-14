Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6045B82
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:33:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkPN-0001CA-KR; Fri, 14 Jun 2019 11:30:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbkPL-0001Bx-LT
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:30:11 +0000
X-Inumbo-ID: c378b11a-8e97-11e9-b27f-4beb0b95ffd7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c378b11a-8e97-11e9-b27f-4beb0b95ffd7;
 Fri, 14 Jun 2019 11:30:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 05:30:07 -0600
Message-Id: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 05:30:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/3] x86: S3 resume adjustments
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogeDg2L0FDUEk6IHJlLXBhcmsgcHJldmlvdXNseSBwYXJrZWQgQ1BVcyB1cG9uIHJlc3VtZSBm
cm9tIFMzCjI6IHg4Ni9BQ1BJOiByZXN0b3JlIFZFU0EgbW9kZSB1cG9uIHJlc3VtZSBmcm9tIFMz
CjM6IHg4NjogYSBsaXR0bGUgYml0IG9mIDE2LWJpdCB2aWRlbyBtb2RlIHNldHRpbmcgY29kZSBj
bGVhbnVwCgpQYXRjaCAyIGlzIG1lYW50IHRvIGFkZHJlc3MgYW4gaXNzdWUgSSd2ZSBvYnNlcnZl
ZCB3aGlsZSB0ZXN0aW5nCnBhdGNoIDEsIGFuZCBwYXRjaCAzIGlzIHNpbXBseSBhIGNvbGxlY3Rp
b24gYSBtaXNjIGNoYW5nZXMgbm90aWNlZAp3aGlsZSBwdXR0aW5nIHRvZ2V0aGVyIHBhdGNoIDIg
YXMgcG9zc2libHkgd29ydGh3aGlsZSB0byBtYWtlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
