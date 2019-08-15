Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4528E57C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 09:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyA2z-0001AW-7l; Thu, 15 Aug 2019 07:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fU+k=WL=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hyA2y-0001AR-7s
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 07:19:44 +0000
X-Inumbo-ID: 0bc3e88e-bf2d-11e9-87dd-bc764e2007e4
Received: from hermes1.dur.ac.uk (unknown [129.234.7.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bc3e88e-bf2d-11e9-87dd-bc764e2007e4;
 Thu, 15 Aug 2019 07:19:41 +0000 (UTC)
Received: from smtphost2.dur.ac.uk (smtphost2.dur.ac.uk [129.234.7.144])
 by hermes1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x7F7J7U3004078;
 Thu, 15 Aug 2019 08:19:11 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost2.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x7F7Iwop023278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2019 08:18:58 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id 6729128317B; Thu, 15 Aug 2019 08:18:53 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id 556C1282ECC;
 Thu, 15 Aug 2019 08:18:53 +0100 (BST)
Date: Thu, 15 Aug 2019 08:18:53 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
Message-ID: <alpine.LFD.2.21.1908150815100.25503@algedi.dur.ac.uk>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x7F7J7U3004078
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxNSBBdWcgMjAxOSwgU3RldmVuIEhhaWdoIHdyb3RlOgoKPiBIYXZpbmcgYSBiaXQg
b2YgYSBsb29rIGhlcmUuLi4uCj4gCj4gTXkgdGVzdCBzeXN0ZW0gZ3J1YmVudiBmaWxlIGhhczoK
PiAjIEdSVUIgRW52aXJvbm1lbnQgQmxvY2sKPiBzYXZlZF9lbnRyeT0wCj4ga2VybmVsb3B0cz1y
b290PVVVSUQ9NTM0NmI0ZDktODg1Zi00NjczLThhZmYtMDRhMTZiZjE5NzFhIHJvCj4gcm9vdGZs
YWdzPXN1YnZvbD1yb290IHNlbGludXg9MCByaGdiIHF1aWV0Cj4gYm9vdF9zdWNjZXNzPTEKCkl0
IGxvb2tzIGxpa2UgdGhlIGVkaXQKCiAgICAgICAgICAgICAgICAgICAgIHJhaXNlIFJ1bnRpbWVF
cnJvcigic3ludGF4IGVycm9yOiBjYW5ub3QgbmVzdCAKbWVudWVudHJ5CiglZCAlcykiICUgKGxl
bihpbWcpLGltZykpCiAgICAgICAgICAgICAgICAgaW1nID0gW10KICAgICAgICAgICAgICAgICB0
aXRsZSA9IHRpdGxlX21hdGNoLmdyb3VwKDEpCisgICAgICAgICAgICAgICAgaWYgdGl0bGUgPT0g
ZGVmYXVsdF90aXRsZToKKyAgICAgICAgICAgICAgICAgICAgc2V0YXR0cihzZWxmLCAnZGVmYXVs
dCcsIGltZ19jb3VudCkKKyAgICAgICAgICAgICAgICBpbWdfY291bnQgKz0gMQogICAgICAgICAg
ICAgICAgIGNvbnRpbnVlCiAKICAgICAgICAgICAgIGlmIGwuc3RhcnRzd2l0aCgic3VibWVudSIp
OgoKYWxzbyBuZWVkcyBhIHRlc3QgZm9yIGRlZmF1bHRfdGl0bGUgPT0gaW1nX2NvdW50IHRob3Vn
aCB0aGVyZSBtYXkgYmUgCnZhcmlhYmxlIHR5cGVzIHRvIGNvbnNpZGVyIGluIHRoYXQgY29tcGFy
aXNvbi4KCglNaWNoYWVsIFlvdW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
