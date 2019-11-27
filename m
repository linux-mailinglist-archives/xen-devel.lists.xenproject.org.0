Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C479B10C059
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 23:47:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia63J-00065w-B8; Wed, 27 Nov 2019 22:44:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jeri=ZT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia63H-00065m-Q9
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 22:44:51 +0000
X-Inumbo-ID: 85a3a068-1167-11ea-a55d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85a3a068-1167-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 22:44:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49386206E0;
 Wed, 27 Nov 2019 22:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574894690;
 bh=OWiWVvECwqBlywG2/Vv1jjd7T1xj+HhhMOGVEwCoCJw=;
 h=Date:From:To:cc:Subject:From;
 b=LWUy3DJsAC9zVkZ7GUr1PSc93FpAvR9tMMiTmnvuitMWJ1N0aUon8RAZgd2PbzJs3
 BtNqjmXoLs8aoyD6Aj25peCUwso2zkzjb+CgrwJDQKE5dXgEPvvehZb0KNcdBh9ev5
 iau3cCh8amJuZ4Lm8UMjKY4Bqnz0ytVBmPLKc+kQ=
Date: Wed, 27 Nov 2019 14:44:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1911271437420.27669@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] RFC disable GCC 9 -Waddress-of-packed-member
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKR0NDIDkgaW50cm9kdWNlZCBhIG5ldyB3YXJuaW5nOiBhZGRyZXNzLW9mLXBhY2tl
ZC1tZW1iZXIuIEl0IHdhcm5zIHdoZW4KYSBwb2ludGVyIHBvaW50cyB0byBhIG1lbWJlciBvZiBh
IHBhY2tlZCBzdHJ1Y3QsIGxlYWRpbmcgdG8gYSBidWlsZApmYWlsdXJlIGluIFhlbiAoY3Jvc3Mg
Y29tcGlsaW5nIFhlbiBvbiBBcm0gd2l0aCBHQ0MgOS4yKToKCiAgNTU2IHRyYWNlLmM6IEluIGZ1
bmN0aW9uICdfX3RyYWNlX2h5cGVyY2FsbCc6CiAgNTU3IHRyYWNlLmM6ODI2OjE5OiBlcnJvcjog
dGFraW5nIGFkZHJlc3Mgb2YgcGFja2VkIG1lbWJlciBvZiAnc3RydWN0IDxhbm9ueW1vdXM+JyBt
YXkgcmVzdWx0IGluIGFuIHVuYWxpZ25lZCBwb2ludGVyIHZhbHVlClstV2Vycm9yPWFkZHJlc3Mt
b2YtcGFja2VkLW1lbWJlcl0KICA1NTggICA4MjYgfCAgICAgdWludDMyX3QgKmEgPSBkLmFyZ3M7
CgpMb29raW5nIGF0IHRoZSBjb2RlLCBJIGNhbm5vdCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB3
aGF0IHdlIGFyZSBkb2luZy4KQXQgbGVhc3Qgb24gQXJtLCBpdCBsb29rcyBPSz8gQW55dGhpbmcg
SSBhbSBtaXNzaW5nPwoKSWYgeW91IGNhbiBzcG90IGFueXRoaW5nIHdyb25nIHdpdGggdGhlIFhl
biBjb2RlLCBkbyBsZXQgbWUga25vdy4KT3RoZXJ3aXNlLCBJIGFtIHRoaW5raW5nIG9mIGRpc2Fi
bGluZyB0aGUgd2FybmluZzoKCgpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVz
Lm1rCmluZGV4IDUzMzdlMjAuLjhkNWM3N2MgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysg
Yi94ZW4vUnVsZXMubWsKQEAgLTg2LDYgKzg2LDkgQEAgQ0ZMQUdTICs9ICQoQ0ZMQUdTLXkpCiAj
IGFsbG93IGV4dHJhIENGTEFHUyBleHRlcm5hbGx5IHZpYSBFWFRSQV9DRkxBR1NfWEVOX0NPUkUK
IENGTEFHUyArPSAkKEVYVFJBX0NGTEFHU19YRU5fQ09SRSkKIAorIyBEaXNhYmxlIEdDQyA5IHdh
cm5pbmcgYWJvdXQgcG9pbnRlcnMgdG8gbWVtYmVycyBvZiBhIHBhY2tlZCBzdHJ1Y3QKK0NGTEFH
UyArPSAtV25vLWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcgorCiAjIE1vc3QgQ0ZMQUdTIGFyZSBz
YWZlIGZvciBhc3NlbWJseSBmaWxlczoKICMgIC1zdGQ9Z251ezg5LDk5fSBnZXRzIGNvbmZ1c2Vk
IGJ5ICMtcHJlZml4ZWQgZW5kLW9mLWxpbmUgY29tbWVudHMKICMgIC1mbHRvIG1ha2VzIG5vIHNl
bnNlIGFuZCBhbm5veXMgY2xhbmcKCgpDaGVlcnMsCgpTdGVmYW5vCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
