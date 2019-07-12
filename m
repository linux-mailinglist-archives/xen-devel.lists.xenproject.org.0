Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2016764C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 23:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hm3HN-0001p2-CP; Fri, 12 Jul 2019 21:40:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z6fR=VJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hm3HL-0001ox-NC
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 21:40:31 +0000
X-Inumbo-ID: ab54c053-a4ed-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab54c053-a4ed-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 21:40:30 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +0u+cVdI5xzDtd3yyqOe1fkp1Ia3jIJsNY4/Uo3bnw/SglC6HhO6LjaXwn0j+bqF9BYdw5WxPt
 awjmpTVtlCQcnSV6itamfZUufPzLFk9z0T5cP41Zhro7OKytjoMgqhswOK5HcIa9iHl8oAGOx3
 DmAQ3WL3+/03IYaH0J8uUeLEyvRz2tJDLkICBj+FYhgooVXht+ZVxJPXZiuv9yotlMKIuziQGZ
 nk5LhFKCM7pVfkDEJhiFkZBXc+JkpGyELdb/KYoQVOH2nJciIft0TK+Zmj1DHcg/U31wdi/GiF
 Vwo=
X-SBRS: 2.7
X-MesageID: 2992485
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,484,1557201600"; 
   d="scan'208";a="2992485"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23848.65064.511423.772481@mariner.uk.xensource.com>
Date: Fri, 12 Jul 2019 22:39:52 +0100
To: Doug Goldstein <cardoe@cardoe.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] Notes from summit design session on branch management
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVyZSBhcmUgdGhlIHBob3RvcyBJIHRvb2sgb2YgdGhlIGZsaXBjaGFydDoKICBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9wZW9wbGUvaXdqLzIwMTkvc3VtbWl0LWNpLWJyYW5jaC13b3Jrc2hvcC8K
Ck15IG5vdGVzLCBpbiBmYWlybHkgdW5yZWRhY3RlZCBmb3JtLCBhcmUgYmVsb3cuICBXZSBzaG91
bGQgdG8gd3JpdGUKdGhpcyB1cCBpbnRvIGEgcHJvcGVyIHByb3Bvc2FsLgoKLTg8LQoKUGhhc2Ug
MQoKIEEgcm9ib3Qgd2lsbCBjcmVhdGUgYSBHaXRsYWIgTVIgb3V0IG9mIGVhY2ggb2YgY2VydGFp
biBicmFuY2hlcyBvbgogeGVuYml0cwoKIEVhY2ggc3VjaCBicmFuY2ggd2lsbCBiZSByZWJhc2Vk
IG9udG8gc3RhZ2luZyBhbmQgdGhlIHJlc3VsdCBydW4KIHRocm91Z2ggdGhlIGV4aXN0aW5nIEdp
dGxhYiBDSSB0ZXN0cy4KCiBBZnRlciBHaXRsYWIgQ0kgaGFzIGJlZW4gcnVuIG9uIGVhY2ggTVIs
IGlmIGl0IHBhc3NlcywgYSByb2JvdCBwdXNoZXMKIGl0IHRvIHN0YWdpbmcuCgogQWZ0ZXIgdGhp
cyBoYXMgYmVlbiBydW5uaW5nIGZvciBhIHdoaWxlLCB3ZSBhc2sgbWFpbnRhaW5lcnMgdG8gcHVz
aAogdG8gdGhlIG5ldyByb2JvdCBpbnB1dCBicmFuY2hlcyAoYWJvdmUpIHJhdGhlciB0aGFuIGRp
cmVjdGx5IHRvCiBzdGFnaW5nLgoKUGhhc2UgMgoKIEluc3RlYWQgb2YgdGVzdGluZyBzdGFnaW5n
LCBvc3N0ZXN0IHdpbGwgZGlyZWN0bHkgY29tYmluZSBudW1iZXIgb2YKIHRoZSBvdXRzdGFuZGlu
ZyBnaXRsYWIgTVJzIGludG8gYSBzaW5nbGUgY2FuZGlkYXRlIGJyYW5jaCwgYW5kIHRlc3QKIHRo
YXQuICBJZiBpdCBwYXNzZXMsIGl0IGdldHMgcHVzaGVkIHRvIG1hc3Rlci4KCiBJZiBpdCBmYWls
cywgb3NzdGVzdCB1c2VzIHRoZSBHaXRsYWIgQVBJIHRvIHdyaXRlIGEgY29tbWVudCB0byB0aGUg
TVIKIGFib3V0IHRoaXMuICBPdGhlciBtZXRhZGF0YSBzdWNoIGFzIGEgcmVxdWVzdCBieSBhIGNv
bW1pdHRlciB0byByZXRyeQogdGhlIGJyYW5jaCwgb3IgcHJpb3JpdHkgaW5mb3JtYXRpb24sIGNh
biBiZSBoYW5kbGVkIHRoZSBzYW1lIHdheS4KCiBUaGUgc2VsZWN0aW9uIG9mIG91dHN0YW5kaW5n
IGJyYW5jaGVzIHVzZXMgc29tZSBraW5kIG9mIGhldXJpc3RpYyB0bwogdHJ5IHRvIGNvbGxlY3Qg
YSBjb21iaW5hdGlvbiB3aGljaCAoYSkgYml0ZXMgb2YgYSBnb29kIGNodW5rIG9mIHRoZQogb3V0
c3RhbmRpbmcgd29yayBhbmQgKGIpIGlzIGxpa2VseSB0byBwYXNzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
