Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F6D09A6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:26:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI7G7-00072w-Tt; Wed, 09 Oct 2019 08:23:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QBY0=YC=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iI7G6-00072r-Go
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:23:46 +0000
X-Inumbo-ID: 1adb80ae-ea6e-11e9-97e1-12813bfff9fa
Received: from hermes1.dur.ac.uk (unknown [129.234.7.138])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1adb80ae-ea6e-11e9-97e1-12813bfff9fa;
 Wed, 09 Oct 2019 08:23:43 +0000 (UTC)
Received: from smtphost1.dur.ac.uk (smtphost1.dur.ac.uk [129.234.7.143])
 by hermes1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x998Mfqp015760;
 Wed, 9 Oct 2019 09:22:45 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x998MWSE022003
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2019 09:22:34 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id B7F0A284027; Wed,  9 Oct 2019 09:22:27 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id A4753282B2B;
 Wed,  9 Oct 2019 09:22:27 +0100 (BST)
Date: Wed, 9 Oct 2019 09:22:27 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <1570608778.2508.1@crc.id.au>
Message-ID: <alpine.LFD.2.21.1910090916290.4406@algedi.dur.ac.uk>
References: <1570594496.2508.0@crc.id.au>
 <alpine.LFD.2.21.1910090855001.4406@algedi.dur.ac.uk>
 <1570608778.2508.1@crc.id.au>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x998Mfqp015760
Subject: Re: [Xen-devel] /sys/hypervisor entries for Xen (Domain-0, PV,
 PVH and HVM)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5LCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cgo+IEZvciBub3csIHRoZSBv
bmx5IGJpZyBpc3N1ZSB0aGF0IHJlbWFpbnMgaXMgdGhhdCB0aGUgY3VycmVudCBweWdydWIgd2ls
bAo+IGFsd2F5cyBib290IHRoZSBzZWNvbmQgaW1hZ2UgaW4gdGhlIGxpc3QgZHVlIHRvIHB5Z3J1
YiBpbmNvcnJlY3RseSBwYXJzaW5nIHRoZQo+IGZhaWxvdmVyIHNlY3Rpb25zIG9mIHRoZSBGZWRv
cmEgZ3J1Yi5jZmcgd2hlcmUgdGhlIGZhaWxvdmVyIHdpbGwgc2V0Cj4gJ2RlZmF1bHQ9MScgY2F1
c2luZyB0aGlzIGJlaGF2aW91ci4KCkkgZGlkIHBvc3QgYSB2ZXJ5IGhhY2t5IHBhdGNoIHRvIGlt
cHJvdmUgdGhpcyB0byB4ZW4tZGV2ZWwgYW5kIHNob3VsZCAKaGF2ZSBhIG1vcmUgYWNjZXB0YWJs
ZSBzZXQgb2YgcGF0Y2hlcyBmb3IgdGhpcyBzb29uLgoKCU1pY2hhZWwgWW91bmcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
