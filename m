Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA333CBAD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 04:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98164.186128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzzJ-0004MJ-Rd; Tue, 16 Mar 2021 03:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98164.186128; Tue, 16 Mar 2021 03:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzzJ-0004Lu-OT; Tue, 16 Mar 2021 03:03:17 +0000
Received: by outflank-mailman (input) for mailman id 98164;
 Tue, 16 Mar 2021 03:03:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Go/K=IO=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1lLzzH-0004Ln-Tl
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 03:03:16 +0000
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fe11349-e078-40b5-8cc3-fefd06a08e1a;
 Tue, 16 Mar 2021 03:03:12 +0000 (UTC)
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
X-Inumbo-ID: 9fe11349-e078-40b5-8cc3-fefd06a08e1a
Date: Tue, 16 Mar 2021 03:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1615863790;
	bh=1ozaoiLet6V8xjl3FNLvNaYIC5oh6jcsq22ig7I+GYc=;
	h=Date:To:From:Reply-To:Subject:From;
	b=LSIeRsZVzBUFgTrE/MXAls1J2HkEHwwkF9nREdfeSb8Rud6LIGcAFkeoGXXQpsM7U
	 1mlnulJ6ekpfplczqk5QeXgqfFa3FsHxv0r3NfPL/uSj0KotuX/R8XxZ+3Nz2rUvnV
	 Ubq5E9ySzRKtEe1q3CKr7ISzZwrjm/+63Qy8cdUE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: AMD Ryzen 4000 (Mobile) cpufreq issues
Message-ID: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_MchBWW3k7cKLYYrkfEGk1OM0ngEv8cXg5kxrsaP2FY"
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

This is a multi-part message in MIME format.

--b1_MchBWW3k7cKLYYrkfEGk1OM0ngEv8cXg5kxrsaP2FY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgWGVuIERldmVsb3BlcnMsCgpJdCBhcHBlYXJzIEFNRCBSeXplbiA0MDAwIGJhc2VkIENQVXMg
YXJlIG5vdCBzdXBwb3J0ZWQgYnkgYHhlbnBtYCwgcnVubmluZyBgeGVucG0gZ2V0LWNwdWZyZXEt
c3RhdGVzYCByZXR1cm5zIG5vdGhpbmcgYW5kIGBnZXQtY3B1ZnJlcS1wYXJhYCByZXR1cm5zIGBm
YWlsZWQgdG8gZ2V0IGNwdWZyZXEgcGFyYW1ldGVyYAoKVGhpcyB3YXMgc29tZXdoYXQgZXhwZWN0
ZWQgYXMgUnl6ZW4gNDAwMCBzZXJpZXMgQ1BVcyBhcmUgcXVpdGUgbmV3LCBzbyBhcyBhIHdvcmth
cm91bmQgSSB0cmllZCBwdXR0aW5nIGBjcHVmcmVxPWRvbTAta2VybmVsIGRvbTBfbWF4X3ZjcHVz
PTggZG9tMF92Y3B1c19waW5gIG9udG8gQ01ETElORSwgZnJvbSB3aGF0IEkndmUgcmVhZCB0aGlz
IHNob3VsZCBlc3NlbnRpYWxseSBwYXNzIGNvbnRyb2wgZm9yIENQVSBmcmVxdWVuY3kgc2NhbGlu
ZyBkb3duIHRvIGRvbTAncyBrZXJuZWwgKDUuMTEuNCkuCgpIb3dldmVyIGFjcGktY3B1ZnJlcSBk
b2Vzbid0IGxvYWQsIHdoZW4gdHJ5aW5nIHRvIGluc21vZCBpdCBJIGdldCB0aGUgZm9sbG93aW5n
IGVycm9yIGBpbnNtb2Q6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0IG1vZHVsZSBhY3BpLWNwdWZy
ZXEua286IE5vIHN1Y2ggZGV2aWNlYAoKSSBjYW4ndCBzZWVtIHRvIHNlZSBhbnl0aGluZyByZWxh
dGVkIHRvIFhlbiByZWxpbnF1aXNoaW5nIGNvbnRyb2wgdG8gZG9tMCBpbiBYZW4ncyBjb25zb2xl
LCBhbnkgaGVscCB3b3VsZCBiZSBhcHByZWNpYXRlZAoKQ2hlZXJz

--b1_MchBWW3k7cKLYYrkfEGk1OM0ngEv8cXg5kxrsaP2FY
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBYZW4gRGV2ZWxvcGVycyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JdCBh
cHBlYXJzIEFNRCBSeXplbiA0MDAwIGJhc2VkIENQVXMgYXJlIG5vdCBzdXBwb3J0ZWQgYnkgYHhl
bnBtYCwgcnVubmluZyBgeGVucG0gZ2V0LWNwdWZyZXEtc3RhdGVzYCByZXR1cm5zIG5vdGhpbmcg
YW5kIGBnZXQtY3B1ZnJlcS1wYXJhYCByZXR1cm5zIGBmYWlsZWQgdG8gZ2V0IGNwdWZyZXEgcGFy
YW1ldGVyYDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoaXMgd2FzIHNvbWV3aGF0IGV4
cGVjdGVkIGFzIFJ5emVuIDQwMDAgc2VyaWVzIENQVXMgYXJlIHF1aXRlIG5ldywgc28gYXMgYSB3
b3JrYXJvdW5kIEkgdHJpZWQgcHV0dGluZyBgY3B1ZnJlcT1kb20wLWtlcm5lbCBkb20wX21heF92
Y3B1cz04IGRvbTBfdmNwdXNfcGluYCBvbnRvIENNRExJTkUsIGZyb20gd2hhdCBJJ3ZlIHJlYWQg
dGhpcyBzaG91bGQgZXNzZW50aWFsbHkgcGFzcyBjb250cm9sIGZvciBDUFUgZnJlcXVlbmN5IHNj
YWxpbmcgZG93biB0byBkb20wJ3Mga2VybmVsICg1LjExLjQpLjxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pkhvd2V2ZXIgYWNwaS1jcHVmcmVxIGRvZXNuJ3QgbG9hZCwgd2hlbiB0cnlpbmcg
dG8gaW5zbW9kIGl0IEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3IgYGluc21vZDogRVJST1I6IGNv
dWxkIG5vdCBpbnNlcnQgbW9kdWxlIGFjcGktY3B1ZnJlcS5rbzogTm8gc3VjaCBkZXZpY2VgPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBjYW4ndCBzZWVtIHRvIHNlZSBhbnl0aGluZyBy
ZWxhdGVkIHRvIFhlbiByZWxpbnF1aXNoaW5nIGNvbnRyb2wgdG8gZG9tMCBpbiBYZW4ncyBjb25z
b2xlLCBhbnkgaGVscCB3b3VsZCBiZSBhcHByZWNpYXRlZDxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PkNoZWVyczxicj48L2Rpdj4=


--b1_MchBWW3k7cKLYYrkfEGk1OM0ngEv8cXg5kxrsaP2FY--


