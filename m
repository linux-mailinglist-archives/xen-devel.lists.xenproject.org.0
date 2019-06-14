Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B251546304
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:36:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboD4-0006KH-KF; Fri, 14 Jun 2019 15:33:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hboD2-0006KB-Kb
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:33:44 +0000
X-Inumbo-ID: ca4bc13c-8eb9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ca4bc13c-8eb9-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:33:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 09:33:42 -0600
Message-Id: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 09:33:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/4] x86 MCE adjustments for AMD / general
 per-CPU accessor cleanup
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

QWZ0ZXIgcGF0Y2ggMSwgd2hpY2ggcmVhbGx5IGlzIHRoZSBvbmUgSSB3YXMgYWZ0ZXIgaGVyZSwg
SSBkaWQgcmVhbGl6ZQp0aGF0IHRoZSBudW1iZXIgb2YgdXNlcyBvZiBfX2dldF9jcHVfdmFyKCkg
aGFkIHNocnVuayBlbm91Z2gKdGhhdCBpdCBzZWVtZWQgd29ydGh3aGlsZSB0byB0YWtlIHRoZSB0
aW1lIGFuZCBjb252ZXJ0IHRoZQpyZW1haW5pbmcgdXNlcywgc3VjaCB0aGF0IHRoZSBjb25zdHJ1
Y3QgY291bGQgZmluYWxseSBiZSBkcm9wcGVkLgoKMTogeDg2L21jaGVjazogYWxsb3cgdmFyeWlu
ZyBiYW5rIGNvdW50cyBwZXIgQ1BVCjI6IHg4Ni9tY2hlY2s6IHJlcGxhY2UgcmVtYWluaW5nIHVz
ZXMgb2YgX19nZXRfY3B1X3ZhcigpCjM6IHg4NjogcmVwbGFjZSByZW1haW5pbmcgdXNlcyBvZiBf
X2dldF9jcHVfdmFyKCkKNDogZHJvcCBfX2dldF9jcHVfdmFyKCkgYW5kIF9fZ2V0X2NwdV9wdHIo
KQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
