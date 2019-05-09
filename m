Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263118AE9
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjHj-0005tD-5f; Thu, 09 May 2019 13:40:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOjHi-0005t5-BU
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:40:30 +0000
X-Inumbo-ID: 01e165bf-7260-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 01e165bf-7260-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:40:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 07:40:28 -0600
Message-Id: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 07:40:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 0/3] x86/mm: guest_physmap_add_*() adjustments
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMSBpcyByZWFsbHkgaW5kZXBlbmRlbnQsIGJ1dCBwYXRjaCAyIHJlbGllcyBvbiBpdCBi
ZWluZyBpbiBwbGFjZS4KUGF0Y2ggMiBpdHNlbGYgd2FzIGFkZGVkIGFzIGEgcmVzdWx0IG9mIHRo
ZSBkaXNjdXNzaW9uIG9mIHBhdGNoIDMncwp2MSAod2hpY2ggd2FzIHByZXZpb3VzbHkgYSBzdGFu
ZGFsb25lIG9uZSkuCgoxOiBzaG9ydC1jaXJjdWl0IEhWTS1vbmx5IG1vZGUgZmxhZ3Mgd2hlbiAh
SFZNCjI6IG1ha2UgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBIVk0tb25seQozOiBzdWJzdW1l
IHNldF9ncGZuX2Zyb21fbWZuKCkgaW50byBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCkKCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
