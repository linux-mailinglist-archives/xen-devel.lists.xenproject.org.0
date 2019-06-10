Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64EE3BB75
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 19:55:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haOTC-0007f9-6x; Mon, 10 Jun 2019 17:52:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CttF=UJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1haOTB-0007f1-GE
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 17:52:33 +0000
X-Inumbo-ID: 8533f9a8-8ba8-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8533f9a8-8ba8-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 17:52:32 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rhfQejIGciIb2uhMqVrqUEd/gd//ECCJqjbhfy975OsWxWUVytvvJ+9I+54NB/gH4jhGj15IfM
 QZWXXGuuq4QJej9yK/Vs3CQwAz6AZ6mFP832GlFx8hG7s3bbw4NoT0jj8S9xKE7FtidJdeQcj8
 cZrIxvvLAhUKIV55KaTITRPLBK7s15Y1+lw2zGyF65XAUEypiFiGLTbhEpzA+e3/aWWLfNUDkW
 +81GuBsZlxho/BXqPWJBW2p3/wFGz+gc3g6gOvXBqq0qpmw515MN7HAeNNuTwU1IzrcaXcfWgC
 9qw=
X-SBRS: 2.7
X-MesageID: 1517940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,576,1557201600"; 
   d="scan'208";a="1517940"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 10 Jun 2019 18:52:28 +0100
Message-ID: <1560189148-25219-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] automation: Add an 'all' target for container
 maintenance
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Doug
 Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBj
YXJkb2UuY29tPgotLS0KIGF1dG9tYXRpb24vYnVpbGQvTWFrZWZpbGUgfCA4ICsrKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2F1dG9tYXRpb24vYnVpbGQvTWFrZWZpbGUgYi9hdXRvbWF0aW9uL2J1aWxkL01ha2VmaWxl
CmluZGV4IDc3M2IxNjAuLjdjNzYxMmIgMTAwNjQ0Ci0tLSBhL2F1dG9tYXRpb24vYnVpbGQvTWFr
ZWZpbGUKKysrIGIvYXV0b21hdGlvbi9idWlsZC9NYWtlZmlsZQpAQCAtMSwxMyArMSwxMiBAQAog
CiAjIHRoZSBiYXNlIG9mIHdoZXJlIHRoZXNlIGNvbnRhaW5lcnMgd2lsbCBhcHBlYXIKIFJFR0lT
VFJZIDo9IHJlZ2lzdHJ5LmdpdGxhYi5jb20veGVuLXByb2plY3QveGVuCitDT05UQUlORVJTID0g
JChzdWJzdCAuZG9ja2VyZmlsZSwsJCh3aWxkY2FyZCAqLyouZG9ja2VyZmlsZSkpCiAKIGhlbHA6
CiAJQGVjaG8gIkJ1aWxkcyBjb250YWluZXJzIGZvciBidWlsZGluZyBYZW4gYmFzZWQgb24gZGlm
ZmVyZW50IGRpc3Ryb3MiCiAJQGVjaG8gIlRvIGJ1aWxkIG9uZSBydW4gJ21ha2UgRElTVFJPL1ZF
UlNJT04nLiBBdmFpbGFibGUgY29udGFpbmVyczoiCi0JQCQoZm9yZWFjaCBmaWxlLCQoc29ydCAk
KHN1YnN0IC5kb2NrZXJmaWxlLCwkKHdpbGRjYXJkICovKi5kb2NrZXJmaWxlKSkpLCBcCi0JCWVj
aG8gJHtmaWxlfSA7IFwKLQkpCisJQCQoZm9yZWFjaCBmaWxlLCQoc29ydCAkKENPTlRBSU5FUlMp
KSxlY2hvICR7ZmlsZX07KQogCUBlY2hvICJUbyBwdXNoIGNvbnRhaW5lciBidWlsZHMsIHNldCB0
aGUgZW52IHZhciBQVVNIIgogCiAlOiAlLmRvY2tlcmZpbGUgIyMgQnVpbGRzIGNvbnRhaW5lcnMK
QEAgLTE1LDMgKzE0LDYgQEAgaGVscDoKIAlAaWYgWyAhIC16ICQke1BVU0greH0gXTsgdGhlbiBc
CiAJCWRvY2tlciBwdXNoICQoUkVHSVNUUlkpLyQoQEQpOiQoQEYpOyBcCiAJZmkKKworLlBIT05Z
OiBhbGwKK2FsbDogJChDT05UQUlORVJTKQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
