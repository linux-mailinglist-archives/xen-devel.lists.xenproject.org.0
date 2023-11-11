Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BF7E8962
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 07:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630840.984041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1h5B-0000zY-FK; Sat, 11 Nov 2023 06:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630840.984041; Sat, 11 Nov 2023 06:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1h5B-0000x0-BW; Sat, 11 Nov 2023 06:03:01 +0000
Received: by outflank-mailman (input) for mailman id 630840;
 Sat, 11 Nov 2023 01:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVGi=GY=proton.me=adresseinconnue@srs-se1.protection.inumbo.net>)
 id 1r1cW8-0005lG-3t
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 01:10:33 +0000
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1964223a-802f-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 02:10:29 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1964223a-802f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1699665026; x=1699924226;
	bh=aDMexFQmGPG6u56g0VnujM80HkyA9ltlhNf9uFT+QoI=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NDfO1+ahS3gZZLJrsxgDr0ni0trRwwuXnzPVvtHRXpy0JwzgsrbaLaZnQ2U3jSgWt
	 rtSrlDfWl//gaOg3dehDyxD98D1uwPZR2zoxqfWi2wRhVNI1lAo4NnmB5RjIX9Fndu
	 an/HGzEZSlfo5oNEik0s38EZHmT6tyKkWhLK+GkSUUTlKfggq+WkjgPsK4rVjLN2If
	 +8dvTKRQzN2Hfgj7ysVvTIr+kDflKkSq02dVPM7TdEeKtcn/HZHd1fUcv6dVlkIO8j
	 +N+G1NI7yBdQ34VOsfnFzEUdox01F38CIrxZ9xgl6I3ZAd/L4ngGBumv1WTG5UqePD
	 sySwU7JcvNReA==
Date: Sat, 11 Nov 2023 01:10:13 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: adresseinconnue <adresseinconnue@proton.me>
Subject: Bug report: Qubes 4.2 RC4
Message-ID: <Sy3bgLQNkkk1ursClxwxZTiZVRZ88NIlc7gspd7nCdFlrqWKGLunFkzrETElI5XTJmq3q6akcY-oGyHcOE-oRHZYx5dTekuh1SuziXaO9zk=@proton.me>
Feedback-ID: 49686843:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_bEnBJz2iQnlCCqk5O5CvkYXUonLRpT2CSkb6i2QI8A"

This is a multi-part message in MIME format.

--b1_bEnBJz2iQnlCCqk5O5CvkYXUonLRpT2CSkb6i2QI8A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sIEkgaGF2ZSBmaWxlZCBhIGJ1ZyByZXBvcnQgW29uIEdpdEh1Yl0oaHR0cHM6Ly94ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcpIGFib3V0IG15IFdpRmkgY2FyZC4gVGhlIHJlcG9y
dCByZWZlcmVuY2VzIGEgdmVyeSBkZXRhaWxlZCBpbml0aWFsIHBvc3Qgb24gdGhlIFF1YmVzIGZv
cnVtIGFib3V0IHRoZSBzaXR1YXRpb24sIHdoaWNoIHlvdSBjYW4gW2ZpbmQgaGVyZV0oaHR0cHM6
Ly94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcpLiBUaGFuayB5b3UgZm9yIGxvb2tpbmcg
aW50byB0aGlzLg==

--b1_bEnBJz2iQnlCCqk5O5CvkYXUonLRpT2CSkb6i2QI8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5IZWxsbywgSSBoYXZlIGZpbGVkIGEgYnVnIHJlcG9ydCA8YSBocmVmPSJodHRwczovL3hl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIgdGl0bGU9Im9uIEdpdEh1YiI+b24gR2l0SHVi
PC9hPiBhYm91dCBteSBXaUZpIGNhcmQuIFRoZSByZXBvcnQgcmVmZXJlbmNlcyBhIHZlcnkgZGV0
YWlsZWQgaW5pdGlhbCBwb3N0IG9uIHRoZSBRdWJlcyBmb3J1bSBhYm91dCB0aGUgc2l0dWF0aW9u
LCB3aGljaCB5b3UgY2FuIDxhIGhyZWY9Imh0dHBzOi8veGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnIiB0aXRsZT0iZmluZCBoZXJlIj5maW5kIGhlcmU8L2E+LiBUaGFuayB5b3UgZm9yIGxv
b2tpbmcgaW50byB0aGlzLjxicj48L2Rpdj4NCg0K


--b1_bEnBJz2iQnlCCqk5O5CvkYXUonLRpT2CSkb6i2QI8A--


