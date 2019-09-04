Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB4A7F30
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ROQ-0002A7-Ga; Wed, 04 Sep 2019 09:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qwq=W7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1i5ROO-0002A2-HE
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:15:57 +0000
X-Inumbo-ID: 98e91bf4-cef4-11e9-b299-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98e91bf4-cef4-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567588554;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=devvDzd++G9AK6d3xsk9Z5UJatMqMg7tgy9kCJKCyeI=;
 b=WFBof1XJQVrmG+Zx1BjjXtdxRT13QaP9B9j9dB+2WDRpsiPelHtcTY4/c9iigl3sky
 1TD96cwxRZ+IADkEPU5RncTeawwtvyKqRYljqqXTp+lS7CYEWdRAMblQPHz05T4V1ZH9
 7BhWeF8BcxO8V1RpGUuyVEKnarHhdACIa939DB5ptBXyVfsO8dVvJoaQ4VUCHfIBVZwt
 LJ97k2KLEEeJUcBVjcpMPY6A6xqp3ixoMYZUB0h2KilgmU+AGcazVIvRueSD7nuUJ4sE
 QyRQSzSE/Sih04SGB3rUn5EqdRAQvDSmUC/f45pKjhyR4N83tPmDIv+hf5zBoiqPZhO4
 zzxg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GhOjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.27.0 SBL|AUTH)
 with ESMTPSA id x0a054v849ESSwc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 4 Sep 2019 11:14:28 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 11:14:23 +0200
Message-Id: <20190904091423.23963-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBwbGFpbiBjcmFzaGtlcm5lbD1zaXplIGlzIGFwcGFyZW50bHkgbm90IHN1cHBvcnRlZCBieSB0
aGUgY29kZQphbnltb3JlLiBJbiBjYXNlIGtkdW1wIGV2ZXIgd29ya2VkIGxpa2UgdGhhdCwgdGhl
IGNvZGUgd2hpY2ggcmVtb3ZlZApzdXBwb3J0IGZvciB0aGlzIG5vdGF0aW9uIGRpZCBub3QgdXBk
YXRlIHRoZSBkb2N1bWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZA
YWVwZmxlLmRlPgotLS0KIGRvY3MvbWlzYy9rZXhlY19hbmRfa2R1bXAudHh0IHwgMTQgKystLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9rZXhlY19hbmRfa2R1bXAudHh0IGIvZG9jcy9taXNj
L2tleGVjX2FuZF9rZHVtcC50eHQKaW5kZXggMDg0MmIzZDU4Zi4uZmVhNjJmZmE1YyAxMDA2NDQK
LS0tIGEvZG9jcy9taXNjL2tleGVjX2FuZF9rZHVtcC50eHQKKysrIGIvZG9jcy9taXNjL2tleGVj
X2FuZF9rZHVtcC50eHQKQEAgLTExNiwxNyArMTE2LDcgQEAgdG8gcnVuIHdpdGhvdXQgZGlzcnVw
dGluZyB0aGUgbWVtb3J5IHVzZWQgYnkgdGhlIGZpcnN0IGtlcm5lbC4gVGhpcyBhcmVhIGlzCiBj
YWxsZWQgdGhlIGNyYXNoIGtlcm5lbCByZWdpb24gYW5kIGlzIHJlc2VydmVkIHVzaW5nIHRoZSBj
cmFzaGtlcm5lbAogY29tbWFuZCBsaW5lIHBhcmFtZXRlciB0byB0aGUgWGVuIGh5cGVydmlzb3Iu
IEl0IGhhcyB0d28gZm9ybXM6CiAKLSAgaSkgY3Jhc2hrZXJuZWw9c2l6ZQotCi0gICAgIFRoaXMg
aXMgdGhlIHNpbXBsZXN0IGFuZCByZWNvbW1lbmRlZCB3YXkgdG8gcmVzZXJ2ZSB0aGUgY3Jhc2gg
a2VybmVsCi0gICAgIHJlZ2lvbi4gSnVzdCBzcGVjaWZ5IGhvdyBsYXJnZSB0aGUgcmVnaW9uIHNo
b3VsZCBiZSBhbmQgdGhlIGh5cGVydmlzb3IKLSAgICAgd2lsbCBmaW5kIGEgZ29vZCBsb2NhdGlv
biBmb3IgaXQuIEEgZ29vZCBzaXplIHRvIHN0YXJ0IHdpdGggaXMgMTI4TWIKLQotICAgICBlLmcu
Ci0KLSAgICAgY3Jhc2hrZXJuZWw9MTI4TQotCi0gIGlpKSBjcmFzaGtlcm5lbD1zaXplQGJhc2UK
KyAgaSkgY3Jhc2hrZXJuZWw9c2l6ZUBiYXNlCiAKICAgICAgIEluIHRoaXMgZm9ybSB0aGUgYmFz
ZSBhZGRyZXNzIGlzIHByb3ZpZGVkIGluIGFkZGl0aW9uIHRvCiAgICAgICB0aGUgc2l6ZS4gVXNl
IHRoaXMgaWYgYXV0by1wbGFjZW1lbnQgZG9lc24ndCB3b3JrIGZvciBzb21lIHJlYXNvbi4KQEAg
LTEzNiw3ICsxMjYsNyBAQCBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHRvIHRoZSBYZW4gaHlwZXJ2
aXNvci4gSXQgaGFzIHR3byBmb3JtczoKIAogICAgICAgZS5nLiBjcmFzaGtlcm5lbD0xMjhNQDI1
Nk0KIAotICBpaWkpIGNyYXNoa2VybmVsPXNpemUsYmVsb3c9b2Zmc2V0CisgIGlpKSBjcmFzaGtl
cm5lbD1zaXplLGJlbG93PW9mZnNldAogCiAgICAgICBUaGlzIGFsbG93cyB1cyB0byBwbGFjZSB0
aGUgY3Jhc2gga2VybmVsIHdpdGhpbiB0aGUgdXN1YWJsZSBhZGRyZXNzCiAgICAgICBzcGFjZSB3
aXRob3V0IGhhdmluZyB0byB3b3JyeSBhYm91dCBhIHNwZWNpZmljIHBoeWlzY2FsIGFkZHJlc3Mu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
