Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C4B383F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096097.1450894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGTk-0007Va-IE; Wed, 27 Aug 2025 13:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096097.1450894; Wed, 27 Aug 2025 13:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGTk-0007T8-Ed; Wed, 27 Aug 2025 13:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1096097;
 Wed, 27 Aug 2025 13:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83xn=3H=yandex.ru=vyacheslav.legoshin@srs-se1.protection.inumbo.net>)
 id 1urGTi-0007Sw-4C
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:46:19 +0000
Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net
 [178.154.239.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3417e85b-834c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:46:16 +0200 (CEST)
Received: from mail-nwsmtp-mxback-production-main-39.sas.yp-c.yandex.net
 (mail-nwsmtp-mxback-production-main-39.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c28:10dc:0:640:3d32:0])
 by forward502b.mail.yandex.net (Yandex) with ESMTPS id 5A344816A8;
 Wed, 27 Aug 2025 16:46:13 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c10:2b98:0:640:daad:0
 [2a02:6b8:c10:2b98:0:640:daad:0])
 by mail-nwsmtp-mxback-production-main-39.sas.yp-c.yandex.net (mxback/Yandex)
 with HTTPS id 9kZT9b2xna60-0ASENIeG; Wed, 27 Aug 2025 16:46:12 +0300
Received: by uxaevus5beodspug.sas.yp-c.yandex.net (sendbernar/Yandex) with
 HTTPS id c96e7e7f26969abb109ba87de6241108; 
 Wed, 27 Aug 2025 16:46:11 +0300
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
X-Inumbo-ID: 3417e85b-834c-11f0-aeb2-fb57b961d000
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1756302372; bh=luM0Wbye4pv4wFbpXJiiVrXfyyViUq0dIySfALoVDng=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=fJBGDjtnmAafpPSSddO3rPH7C/XFPwA35jqnNMSg3qJEwErK9T1hpECl7Ade8RCst
	 YheAu4onfVrAwkpnygarIB41MPkNAJtWrzkWf8emaYRSldBU+ZzhCAB12R2hae3br7
	 znDKva0KWsPSpVd+WrwJO7QT5dzawb5mT2rnEUog=
Authentication-Results: mail-nwsmtp-mxback-production-main-39.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: =?utf-8?B?0JLRj9GH0LXRgdC70LDQsiDQm9C10LPQvtGI0LjQvQ==?= <vyacheslav.legoshin@yandex.ru>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <aK7LTO1Msvm0hDtH@Mac.lan>
References: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru> <aK7LTO1Msvm0hDtH@Mac.lan>
Subject: Re: [XEN PATCH] x86/vhpet: Add option to always fire hpet timer on resume
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 27 Aug 2025 16:46:11 +0300
Message-Id: <87291756300136@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj7CoDwvZGl2PjxkaXY+MjcuMDguMjAyNSwgMTI6MDksICJSb2dlciBQYXUgTW9ubsOpIiAm
bHQ7cm9nZXIucGF1QGNpdHJpeC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPk9uIFdlZCwg
QXVnIDI3LCAyMDI1IGF0IDA5OjAxOjA4QU0gKzAzMDAsIFZ5YWNoZXNsYXYgTGVnb3NoaW4gd3Jv
dGU6PC9wPjxibG9ja3F1b3RlPsKgVGhlIGZvbGxvd2luZyBpc3N1ZSB3YXMgb2JzZXJ2ZWQgb24g
V2luZG93cyAxMCAyMUgyIHg2NCs6IHdoZW4gdGhlIGRvbWFpbiBzdGF0ZTxiciAvPsKgaXMgc2F2
ZWQgd2hpbGUgYWxsIGNvcmVzIGFyZSBleGVjdXRpbmcgdGhlICdoYWx0JyBpbnN0cnVjdGlvbiw8
L2Jsb2NrcXVvdGU+PHA+PGJyIC8+SSBhc3N1bWUgdGhpcyB3aGVuIGV4ZWN1dGluZyBgeGwgc2F2
ZWAgb3IgZXF1aXZhbGVudCBjb21tYW5kIGZyb20gYTxiciAvPmRpZmZlcmVudCB0b29sc3RhY2s/
PC9wPjwvYmxvY2txdW90ZT48ZGl2Plllcywgc25hcHNob3Qgd2FzIHRha2VuIHdpdGggJ3hsIHNh
dmUnLjwvZGl2PjxibG9ja3F1b3RlPjxwPklJUkMgaW4gdGhhdCBjYXNlIHRoZSBndWVzdCB3b3Vs
ZCBiZSBwYXVzZWQgd2hpbGUgdGhlIG1lbW9yeSBkdW1wIHRvPGJyIC8+ZGlzayBpcyBkb25lLCBh
bmQgaGVuY2UgZ3Vlc3QgdkNQVXMgd29uJ3QgYmUgZXhlY3V0aW5nIHRoZSBgaGFsdGA8YnIgLz5p
bnN0cnVjdGlvbiwgdGhleSB3b3VsZG4ndCBiZSBleGVjdXRpbmcgYXQgYWxsLjwvcD48L2Jsb2Nr
cXVvdGU+PGRpdj5ZZXMsIHRoZSBkb21haW4gd2FzIHBhdXNlZCwgSSBtYWRlIGEgbWlzdGFrZSBp
biB3b3JkaW5nLjwvZGl2PjxibG9ja3F1b3RlPjxibG9ja3F1b3RlPsKgYW5kIHRoZSBtZW1vcnk8
YnIgLz7CoHNhdmUgdGFrZXMgYSByZWxhdGl2ZWx5IGxvbmcgdGltZSAodGVucyBvZiBzZWNvbmRz
KSwgdGhlIEhQRVQgY291bnRlciBtYXk8YnIgLz7CoG92ZXJmbG93IGFzIGZvbGxvd3M6PGJyIC8+
wqBjb3VudGVyID0gMTEyNDNmM2U0YTxiciAvPsKgY29tcGFyYXRvciA9IDkxMGNiNzBmPGJyIC8+
wqA8YnIgLz7CoEluIHN1Y2ggY2FzZXMsIHRoZSBmaXggaW1wbGVtZW50ZWQgaW4gY29tbWl0PGJy
IC8+wqBiMTQ0Y2Y0NWQ1MGI2MDNjMjkwOWZjMzJjNmFiZjczNTlmODZmMWFhIGRvZXMgbm90IHdv
cmsgKGJlY2F1c2UgdGhlICdkaWZmJyBpczxiciAvPsKgbm90IG5lZ2F0aXZlKSwgcmVzdWx0aW5n
IGluIHRoZSBndWVzdCBWTSBiZWNvbWluZyB1bnJlc3BvbnNpdmUgZm9yPGJyIC8+wqBhcHByb3hp
bWF0ZWx5IDMwIHNlY29uZHMuPGJyIC8+wqA8YnIgLz7CoFRoaXMgcGF0Y2ggYWRkcyBhbiBvcHRp
b24gdG8gYWx3YXlzIGFkanVzdCB0aGUgSFBFVCB0aW1lciB0byBmaXJlIGltbWVkaWF0ZWx5PGJy
IC8+wqBhZnRlciByZXN0b3JlLjwvYmxvY2txdW90ZT48cD48YnIgLz5XaGF0IGhhcHBlbnMgaWYg
dGhlIGd1ZXN0IGlzIGxlZnQgcnVubmluZyBhZnRlciB0aGUgc2F2ZT8gSSBhc3N1bWU8YnIgLz50
aGF0IHVzaW5nIGB4bCBzYXZlIC1jICZsdDtkb21haW4mZ3Q7YCB3b3VsZCBsZWF2ZSB0aGUgZG9t
YWluIGluIGEgc2ltaWxhcmx5PGJyIC8+d2VkZ2VkIHN0YXRlLCBhbmQgeW91ciBwcm9wb3NlZCB3
b3JrYXJvdW5kIHdvbid0IGJlIGVmZmVjdGl2ZSB0aGVyZSw8YnIgLz5zaW5jZSB0aGVyZSdzIG5v
IHJlc3RvcmluZyBwcm9jZXNzPyBPciB0aGF0J3Mgbm90IHRoZSBjYXNlIHRoZXJlPGJyIC8+YmVj
YXVzZSBYZW4gaXMgc3RpbGwga2VlcGluZyB0cmFjayBvZiB0aGUgaW50ZXJuYWwgdGltZXIsIGFu
ZCB3b3VsZDxiciAvPnNldCBhbiBpbnRlcnJ1cHQgYXMgcGVuZGluZyBhbnl3YXk/PC9wPjwvYmxv
Y2txdW90ZT48ZGl2PkkndmUgc2VlbiBicm9rZW4gc25hcHNob3RzLCBidXQgd2FzIG5vdCBwYXlp
bmcgYXR0ZW50aW9uIHRvIHRoZSBzdGF0ZSBvZiB0aGU8L2Rpdj48ZGl2PnJ1bm5pbmcgZG9tYWlu
IGFmdGVyIHRoZSBzYXZlLiBTbyB1bmZvcnR1bmF0ZWx5IEkgY2FuJ3QgYW5zd2VyIHRoaXMgcXVl
c3Rpb24uPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSdsbCB0cnkgdG8gcmVwcm9kdWNlIGl0LCBi
dXQgaXQgaXMgbGlrZSBvbmUgc25hcHNob3QgcGVyIG1vbnRoIG9yIGxlc3MuPC9kaXY+PGRpdj5B
bHNvLCBpZiB0aGVyZSBpcyBubyAnaGFsdCcgLSB0aGVuIHRoZSBkb21haW4gaXMgcmVzdG9yZWQg
d2l0aG91dCBhbnkgaXNzdWVzPC9kaXY+PGRpdj4oZXZlbiBpZiBJIGJyZWFrIHRoZSBzYXZlZCBI
UEVUIHN0YXRlIGludGVudGlvbmFsbHkpLjwvZGl2PjxibG9ja3F1b3RlPjxwPlNob3VsZCB3ZSBt
YXliZSBzdG9yZSB0aGUgbGFzdCBndWVzdCB0aW1lIGF0IGNvbnRleHQgc2F2ZSwgYW5kIGNoZWNr
PGJyIC8+YWdhaW5zdCB0aGF0IHRvIHNlZSB3aGV0aGVyIGNvbXBhcmF0b3JzIHNob3VsZCBoYXZl
IHRyaWdnZXJlZCwgaW5zdGVhZDxiciAvPm9mIHBsYXlpbmcgdGhpcyBnYW1lcz88L3A+PC9ibG9j
a3F1b3RlPjxkaXY+PGRpdj48ZGl2PkF0IGZpcnN0IEkgdHJpZWQgdG8gY2hhbmdlIG1lbW9yeSBz
YXZlIGFuZCBIVk0gc2F2ZSBvcmRlciAoY3VycmVudGx5IHNhdmUoKTwvZGl2PjxkaXY+ZnJvbSB0
b29scy9saWJzL2d1ZXN0L3hnX3NyX3NhdmUuYyBmaXJzdCBzYXZlcyB0aGUgbWVtb3J5IGFuZCBv
bnkgYWZ0ZXIgdGhhdDwvZGl2PjxkaXY+aXQgc2F2ZXMgSFZNIHN0YXRlIChIUEVUIGluY2x1ZGVk
LCB3aGljaCB3YXMgY291bnRpbmcgZm9yd2FyZCBhbGwgdGhhdCB0aW1lKS48L2Rpdj48ZGl2PkJ1
dCBzaW5jZSB0aGUgZG9tYWluIHBhdXNpbmcgYW5kIEhQRVQgc3RhdGUgc2F2ZSBjYW4ndCBiZSBk
b25lIGF0b21pY2FsbHk8L2Rpdj48ZGl2PihhdCBsZWFzdCBBRkFJSyksIHRoZXJlIGFsd2F5cyB3
aWxsIGJlIGEgY2FzZSBsaWtlOjwvZGl2PjxkaXY+MSkgV2luZG93cyBzZXRzIGNvbXBhdG9yIHRv
IDB4ZmZmZmZmZmY8L2Rpdj48ZGl2PjIpIENvdW50ZXIgcmVhY2hlcyAweDFmZmZmZmZmZTwvZGl2
PjxkaXY+MykgWGVuIHBhdXNlcyB0aGUgZG9tYWluPC9kaXY+PGRpdj40KSBYZW4gc2F2ZXMgSFBF
VCBzdGF0ZTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkgdGhpbmsgdGhlcmUgaXMgbm8gd2F5IHRv
IHNheSBmb3Igc3VyZSwgaWYgaXQgaXMgYW4gb3ZlcmZsb3cgb3IgaXQgaXMganVzdDwvZGl2Pjxk
aXY+YSBsb25nIHdhaXQuIFN1Y2ggYSBsb25nIHdhaXQgaXMgYWxtb3N0IGltcG9zc2libGUgKGF0
IGxlYXN0IG9uIFdJbmRvd3MpLDwvZGl2PjxkaXY+YnV0IG5vdGhpbmcgcHJldmVudHMgb3RoZXIg
Z3Vlc3QgT1MgZnJvbSBpdC48L2Rpdj48ZGl2PkFsc28sIGlmIHRoZXJlIGlzIGEgVk0gd2l0aCBo
dWdlIG1lbW9yeSBzcGFjZSBhbmQgdGhlIGRpc2sgZGV2aWNlIGlzIHZlcnkgc2xvdzwvZGl2Pjxk
aXY+wqBvciBidXN5KSAtIEhQRVQgY291bnRlciBtYXkgcmVhY2ggYW55IHZhbHVlLjwvZGl2Pjwv
ZGl2PjwvZGl2Pg==

