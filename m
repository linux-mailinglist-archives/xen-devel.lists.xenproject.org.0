Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E915F730D3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:03:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHpx-00063a-Qo; Wed, 24 Jul 2019 14:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eNHf=VV=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqHpv-00063T-IC
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:01:43 +0000
X-Inumbo-ID: 90048e00-ae1b-11e9-874a-7fb1dbfc3ad1
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90048e00-ae1b-11e9-874a-7fb1dbfc3ad1;
 Wed, 24 Jul 2019 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 598D69C01E2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 10:01:41 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 10axKOG_H0Gi for <xen-devel@lists.xenproject.org>;
 Wed, 24 Jul 2019 10:01:40 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id D29EE9C0263
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 10:01:40 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hMwCBPwFuA-X for <xen-devel@lists.xenproject.org>;
 Wed, 24 Jul 2019 10:01:40 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B2E539C01E2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 10:01:40 -0400 (EDT)
Message-ID: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2019 10:01:40 -0400
Organization: Savoir-faire Linux
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: [Xen-devel] CPU frequency throttling based on the temperature
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpNeSBvYmplY3RpdmUgaXMgdG8gZ2V0IENQVSBmcmVxdWVuY3kgdGhyb3R0bGluZyBi
YXNlZCBvbiB0aGUKdGVtcGVyYXR1cmUgaW4gYSBYZW4vT3BlbldSVChkb20wKSBzeXN0ZW0uCgpB
ZnRlciB0byBleHBlbmQgaG91cnMgcmVhZGluZyBYZW4ncyB3aWtpLCBtYWlsaW5nIGxpc3QgYXJj
aGl2ZXMsCmNvbW1pdHMsIGdvb2dsaW5nIGFuZCBhc2tpbmcgaW4gdGhlIElSQyBjaGFubmVsIEkn
bSBjb21pbmcgaGVyZSBhc2tpbmcKZm9yIGhlbHAgYmVjYXVzZSBJIGhvcGUgdGhlcmUgaXMgc29t
ZXRoaW5nIEkgbWlzcyBhbmQgeW91IGNvdWxkIHBvaW50Cml0LgoKTXkgZmlyc3QgcXVlc3Rpb24g
aXMsIHRoZXJlIGlzIGFueSB3YXkgdG8gZG8gQ1BVIGZyZXF1ZW5jeSB0aHJvdHRsaW5nCmJhc2Vk
IG9uIHRoZSB0ZW1wZXJhdHVyZT8KCklmIHRoZSBhbnN3ZXIgZm9yIGZpcnN0IHF1ZXN0aW9uIGlz
IG5vdCwgdGhlbiB0aGVyZSBpcyBhbnkgd2F5IHRvIGdldAp0aGUgQ1BVIHRlbXBlcmF0dXJlIGZy
b20gRG9tMD8gKHRoaXMgd2F5IHdlIGNvdWxkIHVzZSBJbnRlbCdzIHRoZXJtYWxkCmFuZCBtb2Rp
ZnkgaXQgdG8gdXNlIHhlbnBtIHRvIGNoYW5nZSB0aGUgY3B1ZnJlcSkuCgpJZiBvbmUgYW5kIHR3
byBhcmUgbm90LCBkbyB5b3UgdGhpbmsgdGhhdCB0aGUgcmlnaHQgcGF0aCBpcyB0byBtb2RpZnkK
IGxpbnV4L2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jIG9yIHlvdSBoYXZlIGFueSBv
dGhlciBpZGVhcz8KClRoYW5rcwoKLS0gCkZyZWR5IFB1bGlkbywKQ29uc3VsdGFudCBlbiBsb2dp
Y2llbCBsaWJyZQpJbmZyYXN0cnVjdHVyZSwgSW5mb251YWdpcXVlIGV0IGFyY2hpdGVjdHVyZSBk
ZSBzeXN0w6htZXMKU2F2b2lyLWZhaXJlIExpbnV4LCBNb250csOpYWwsIFFjCkJ1cmVhdSA6ICgr
IDEpIDUxNCAyNzYtNTQ2OCBwLjQxMCAKCk1lc3NhZ2UgZGUgY29uZmlkZW50aWFsaXTDqSA6CkNl
IGNvdXJyaWVsIChkZSBtw6ptZSBxdWUgbGVzIGZpY2hpZXJzIGpvaW50cykgZXN0IHN0cmljdGVt
ZW50IHLDqXNlcnbDqSDDoApsJ3VzYWdlIGRlIGxhIHBlcnNvbm5lIG91IGRlIGwnZW50aXTDqSDD
oCBxdWkgaWwgZXN0IGFkcmVzc8OpIGV0IHBldXQKY29udGVuaXIgZGUgbCdpbmZvcm1hdGlvbiBw
cml2aWzDqWdpw6llIGV0IGNvbmZpZGVudGllbGxlLgpUb3V0ZSBkaXZ1bGdhdGlvbiwgZGlzdHJp
YnV0aW9uIG91IGNvcGllIGRlIGNlIGNvdXJyaWVsIGVzdCBzdHJpY3RlbWVudApwcm9oaWLDqWUu
ClNpIHZvdXMgYXZleiByZcOndSBjZSBjb3VycmllbCBwYXIgZXJyZXVyLCB2ZXVpbGxleiBub3Vz
IGVuIGF2aXNlciBzdXItCmxlLWNoYW1wLCBkw6l0cnVpcmUgdG91dGVzIGxlcyBjb3BpZXMgZXQg
bGUgc3VwcHJpbWVyIGRlIHZvdHJlIHN5c3TDqG1lCmluZm9ybWF0aXF1ZS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
