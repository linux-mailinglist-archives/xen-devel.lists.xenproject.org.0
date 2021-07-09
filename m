Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE713C2080
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 10:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153441.283503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lZy-0004JG-R0; Fri, 09 Jul 2021 08:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153441.283503; Fri, 09 Jul 2021 08:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lZy-0004HO-N1; Fri, 09 Jul 2021 08:09:46 +0000
Received: by outflank-mailman (input) for mailman id 153441;
 Fri, 09 Jul 2021 08:09:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WfOa=MB=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1m1lZx-0004HI-MN
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 08:09:46 +0000
Received: from pi.kojedz.in (unknown [109.61.102.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03f02284-e08d-11eb-85d8-12813bfff9fa;
 Fri, 09 Jul 2021 08:09:43 +0000 (UTC)
Received: from webmail.srv.kojedz.in (pi.kojedz.in
 [IPv6:2a01:be00:10:201:0:80:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id 64428BC7B
 for <xen-devel@lists.xenproject.org>; Fri,  9 Jul 2021 10:09:41 +0200 (CEST)
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
X-Inumbo-ID: 03f02284-e08d-11eb-85d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
	t=1625818181; bh=P6FFuxV/dGedGQ2EQoFTtuFSDii+Y4ibKb3JQWjZMfA=;
	h=Date:From:To:Subject;
	b=SJf4aX+yAOt0TKROKf1iJr3ck3goKA8i5BztTZG74hUw0tKshnACzUnhKhQsRpcB7
	 w2dnl+4c23YhrYQRvL750p1baEB5uhiaYP/gPa0k833FE4C1piPddLWLTHMAAuOT6v
	 zpjSAAoZt4YG7NbxUooDT9fSXh38Hvn8xsMtG269COwgvogz1tVlVMqiIhll4Iixaj
	 nZJVBSy4kuPgXxAf79Zxb4HXhvF+Q61WhyVbKCx551oIiOr9bKh5Becj0hy4XXxs2S
	 WIUZ6cJLjo89x/4nJVVIhyrf20iJHYFL2WnM4Lbvu7CxgpCNY4kv8txCEpY7H5oVzD
	 5YHozTW3PQWch8HH4yoqFpQqX5O4DntgUWuXfi6fM38yh/1Ho1SwuO0NT9Z3ZOts1b
	 tgyoLBlqN3QagzYsnmbyaw5quhSvWMo36WstMSB5Y9fTMJaIP+js35ekjRO5tDz1JY
	 nI+O3ZjmuAU8gZL86dYRDSUmENpEfGwP2E1s6i7rcYqHOMnCaJijxC7MS3OY/8O4lr
	 K1eRk7ckaryZu6rE1GRUF28HN0FNFLs+MDrYmHE3+9a62jgQ6X5nIFOTW7SeBBgYyI
	 jRCUSaEf8XlTsEVINMbVCc0ijkjJHP0Rm9lxh8Tl01v4DztgvI3FEvjGiwWgvTsZGO
	 Q9wmnyaohCZA1zl5lD/vLBbY=
MIME-Version: 1.0
Date: Fri, 09 Jul 2021 10:09:41 +0200
From: Richard Kojedzinszky <richard@kojedz.in>
To: xen-devel@lists.xenproject.org
Subject: fix vbd rd_sects stat
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
X-Sender: richard@kojedz.in
Content-Type: multipart/mixed;
 boundary="=_166633c9f6f5ab3eb31c6c3714bf1cdc"

--=_166633c9f6f5ab3eb31c6c3714bf1cdc
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0001-xenstat_linux.c-fix-populating-vbd.rd_sect.patch
Content-Disposition: attachment;
 filename=0001-xenstat_linux.c-fix-populating-vbd.rd_sect.patch;
 size=1130

RnJvbSBkMDlkMjdlNDBjZmJkZDJkYmY1YWVmYWE0MGE0ZjQ2Y2NiMjY4MDU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8ZDA5ZDI3ZTQwY2ZiZGQyZGJmNWFlZmFhNDBhNGY0
NmNjYjI2ODA1Ni4xNjI1ODE4MDI1LmdpdC5yaWNoYXJkQGtvamVkei5pbj4KRnJvbTogUmljaGFy
ZCBLb2plZHppbnN6a3kgPHJpY2hhcmRAa29qZWR6LmluPgpEYXRlOiBGcmksIDkgSnVsIDIwMjEg
MTA6MDY6NDUgKzAyMDAKU3ViamVjdDogW1BBVENIXSB4ZW5zdGF0X2xpbnV4LmM6IGZpeCBwb3B1
bGF0aW5nIHZiZC5yZF9zZWN0CgotLS0KIHRvb2xzL2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jIGIvdG9vbHMvbGlicy9z
dGF0L3hlbnN0YXRfbGludXguYwppbmRleCA4NzVhMDYxN2FkLi44OTM5Y2YzYmNkIDEwMDY0NAot
LS0gYS90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jCisrKyBiL3Rvb2xzL2xpYnMvc3Rh
dC94ZW5zdGF0X2xpbnV4LmMKQEAgLTQ3NSw3ICs0NzUsNyBAQCBpbnQgeGVuc3RhdF9jb2xsZWN0
X3ZiZHMoeGVuc3RhdF9ub2RlICogbm9kZSkKIAkJCQkocmVhZF9hdHRyaWJ1dGVzX3ZiZChkcC0+
ZF9uYW1lLCAic3RhdGlzdGljcy93cl9yZXEiLCBidWYsIDI1Nik8PTApIHx8CiAJCQkJKChyZXQg
PSBzc2NhbmYoYnVmLCAiJWxsdSIsICZ2YmQud3JfcmVxcykpICE9IDEpIHx8CiAJCQkJKHJlYWRf
YXR0cmlidXRlc192YmQoZHAtPmRfbmFtZSwgInN0YXRpc3RpY3MvcmRfc2VjdCIsIGJ1ZiwgMjU2
KTw9MCkgfHwKLQkJCQkoKHJldCA9IHNzY2FuZihidWYsICIlbGx1IiwgJnZiZC53cl9zZWN0cykp
ICE9IDEpIHx8CisJCQkJKChyZXQgPSBzc2NhbmYoYnVmLCAiJWxsdSIsICZ2YmQucmRfc2VjdCkp
ICE9IDEpIHx8CiAJCQkJKHJlYWRfYXR0cmlidXRlc192YmQoZHAtPmRfbmFtZSwgInN0YXRpc3Rp
Y3Mvd3Jfc2VjdCIsIGJ1ZiwgMjU2KTw9MCkgfHwKIAkJCQkoKHJldCA9IHNzY2FuZihidWYsICIl
bGx1IiwgJnZiZC53cl9zZWN0cykpICE9IDEpKQogCQkJewotLSAKMi4yMC4xCgo=
--=_166633c9f6f5ab3eb31c6c3714bf1cdc--

