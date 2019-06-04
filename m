Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67509346E4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 14:33:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY8a8-00013B-Mi; Tue, 04 Jun 2019 12:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY8a6-000136-Pd
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 12:30:22 +0000
X-Inumbo-ID: 844256d4-86c4-11e9-b971-83555c39dd91
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 844256d4-86c4-11e9-b971-83555c39dd91;
 Tue, 04 Jun 2019 12:30:20 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 06:30:19 -0600
Message-Id: <5CF664580200007800235089@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 06:30:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 0/4] adjust special domain creation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMyBmaXhlcyBhIHJlYWxseSBiYWQgYnVnIG9mIG1pbmUsIGFuZCB3aGlsZSBhdCBpdCBJ
IHRob3VnaHQgSQp3b3VsZCBjYXJyeSBvdXQgdGhlIG90aGVyIHJlY2VudGx5IG5vdGljZWQgd29y
ayBpdGVtIGhlcmUgcmlnaHQKYXdheSAocGF0Y2ggNCkuIFBhdGNoZXMgMSBhbmQgMiBhcmUgcHJl
cGFyYXRvcnkuCgoxOiB4ODYvUFY6IHRpZ2h0ZW4gcGFnZSB0YWJsZSBvd25lcnNoaXAgY2hlY2sg
aW4gZW11bC1wcml2LW9wLmM6cmVhZF9jcigpCjI6IFBDSTogbW92ZSBwZGV2X2xpc3QgZmllbGQg
dG8gY29tbW9uIHN0cnVjdHVyZQozOiBhZGp1c3Qgc3BlY2lhbCBkb21haW4gY3JlYXRpb24gKGFu
ZCBjYWxsIGl0IGVhcmxpZXIgb24geDg2KQo0OiBkb21fY293IGlzIG5lZWRlZCBmb3IgbWVtLXNo
YXJpbmcgb25seQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
