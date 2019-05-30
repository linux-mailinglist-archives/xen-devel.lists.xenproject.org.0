Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F40E2FD88
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 16:21:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWLsz-00036p-Bn; Thu, 30 May 2019 14:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fq1a=T6=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hWLsy-00036Z-5E
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 14:18:28 +0000
X-Inumbo-ID: c9a33f00-82e5-11e9-82a2-030d3ed30760
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9a33f00-82e5-11e9-82a2-030d3ed30760;
 Thu, 30 May 2019 14:18:26 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 095733011FC2; Thu, 30 May 2019 17:18:25 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D0D8C306E4AC;
 Thu, 30 May 2019 17:18:24 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 May 2019 17:18:14 +0300
Message-Id: <cover.1559224640.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/9] Per vcpu vm_event channels
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaHNldCBhZGRzIGEgbmV3IG1lY2hhbmlzbSBvZiBzZW5kaW5nIHN5bmNocm9ub3Vz
IHZtX2V2ZW50CnJlcXVlc3RzIGFuZCBoYW5kbGluZyB2bV9ldmVudCByZXNwb25zZXMgd2l0aG91
dCB1c2luZyBhIHJpbmcuCkFzIGVhY2ggc3luY2hyb25vdXMgcmVxdWVzdCBwYXVzZXMgdGhlIHZj
cHUgdW50aWwgdGhlIGNvcnJlc3BvbmRpbmcKcmVzcG9uc2UgaXMgaGFuZGxlZCwgaXQgY2FuIGJl
IHN0b3JlZCBpbiBhIHNsb3R0ZWQgbWVtb3J5IGJ1ZmZlcgoob25lIHBlciB2Y3B1KSBzaGFyZWQg
YmV0d2VlbiB0aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGNvbnRyb2xsaW5nIGRvbWFpbi4KClRoZSBt
YWluIGFkdmFudGFnZXMgb2YgdGhpcyBhcHByb2FjaCBhcmU6Ci0gdGhlIGFiaWxpdHkgdG8gZHlu
YW1pY2FseSBhbGxvY2F0ZSB0aGUgbmVjZXNzYXJ5IG1lbW9yeSB1c2VkIHRvIGhvbGQKdGhlIHJl
cXVlc3RzL3Jlc3BvbnNlcyAodGhlIHNpemUgb2Ygdm1fZXZlbnRfcmVxdWVzdF90L3ZtX2V2ZW50
X3Jlc3BvbnNlX3QKY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2Ug
bGltaXRhdGlvbikKLSB0aGUgcmluZydzIHdhaXRxdWV1ZSBsb2dpYyBpcyB1bm5lY2Vzc2FyeSBp
biB0aGlzIGNhc2UgYmVjYXVzZSB0aGUKdmNwdSBzZW5kaW5nIHRoZSByZXF1ZXN0IGlzIGJsb2Nr
ZWQgdW50aWwgYSByZXNwb25zZSBpcyByZWNlaXZlZC4KCgoKUGV0cmUgUGlyY2FsYWJ1ICg5KToK
ICB0b29scy9saWJ4YzogQ29uc2lzdGVudCB1c2FnZSBvZiB4Y192bV9ldmVudF8qIGludGVyZmFj
ZQogIHZtX2V2ZW50OiBEZWZpbmUgVk1fRVZFTlQgdHlwZQogIHZtX2V2ZW50OiBNYWtlIOKAmGxv
Y2Fs4oCZIGZ1bmN0aW9ucyDigJhzdGF0aWPigJkKICB2bV9ldmVudDogUmVtb3ZlICJyaW5nIiBz
dWZmaXggZnJvbSB2bV9ldmVudF9jaGVja19yaW5nCiAgdm1fZXZlbnQ6IFNpbXBsaWZ5IHZtX2V2
ZW50IGludGVyZmFjZQogIHZtX2V2ZW50OiBNb3ZlIHN0cnVjdCB2bV9ldmVudF9kb21haW4gdG8g
dm1fZXZlbnQuYwogIHZtX2V2ZW50OiBEZWNvdXBsZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIGZy
b20gaW50ZXJmYWNlLgogIHZtX2V2ZW50OiBBZGQgdm1fZXZlbnRfbmcgaW50ZXJmYWNlCiAgeGVu
LWFjY2VzczogQWRkIHN1cHBvcnQgZm9yIHZtX2V2ZW50X25nIGludGVyZmFjZQoKIHRvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oICAgICAgICB8ICA1NiArLS0tCiB0b29scy9saWJ4Yy94Y19t
ZW1fcGFnaW5nLmMgICAgICAgICAgfCAgMjMgKy0KIHRvb2xzL2xpYnhjL3hjX21lbXNoci5jICAg
ICAgICAgICAgICB8ICAzNCAtLS0KIHRvb2xzL2xpYnhjL3hjX21vbml0b3IuYyAgICAgICAgICAg
ICB8ICA0NiArKy0KIHRvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaCAgICAgICAgICAgICB8ICAxNiAr
LQogdG9vbHMvbGlieGMveGNfdm1fZXZlbnQuYyAgICAgICAgICAgIHwgMTc1ICsrKysrKystLS0t
LQogdG9vbHMvdGVzdHMveGVuLWFjY2Vzcy9NYWtlZmlsZSAgICAgIHwgICA3ICstCiB0b29scy90
ZXN0cy94ZW4tYWNjZXNzL3ZtLWV2ZW50LW5nLmMgfCAyMTAgKysrKysrKysrKysrKysKIHRvb2xz
L3Rlc3RzL3hlbi1hY2Nlc3Mvdm0tZXZlbnQuYyAgICB8IDE5MyArKysrKysrKysrKysrCiB0b29s
cy90ZXN0cy94ZW4tYWNjZXNzL3hlbi1hY2Nlc3MuYyAgfCA0MDggKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tCiB0b29scy90ZXN0cy94ZW4tYWNjZXNzL3hlbi1hY2Nlc3MuaCAgfCAgOTEgKysr
KysrCiB0b29scy94ZW5wYWdpbmcveGVucGFnaW5nLmMgICAgICAgICAgfCAgNDIgKy0tCiB4ZW4v
YXJjaC9hcm0vbWVtX2FjY2Vzcy5jICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9t
bS5jICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fcGFnaW5nLmMgICAgICAg
ICB8ICAgMiArLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgICAgICAgIHwgICA1ICst
CiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICAgICAgfCAgMTEgKy0KIHhlbi9jb21t
b24vTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL2RvbWN0bC5j
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwogeGVuL2NvbW1vbi9tZW1fYWNjZXNzLmMgICAgICAg
ICAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL21vbml0b3IuYyAgICAgICAgICAgICAgICAgfCAg
IDQgKy0KIHhlbi9jb21tb24vdm1fZXZlbnQuYyAgICAgICAgICAgICAgICB8IDUyNyArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi92bV9ldmVudF9uZy5jICAg
ICAgICAgICAgIHwgNDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgICB8IDEwMSArKystLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5
LmggICAgICAgICAgfCAgIDIgKwogeGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggICAgICAg
IHwgIDQ3ICsrKysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICB8ICAyNSAr
LQogeGVuL2luY2x1ZGUveGVuL3ZtX2V2ZW50LmggICAgICAgICAgIHwgIDgwICsrKysrLQogMzAg
ZmlsZXMgY2hhbmdlZCwgMTcyMCBpbnNlcnRpb25zKCspLCA4NTcgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdHMveGVuLWFjY2Vzcy92bS1ldmVudC1uZy5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdHMveGVuLWFjY2Vzcy92bS1ldmVudC5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvdGVzdHMveGVuLWFjY2Vzcy94ZW4tYWNjZXNzLmgKIGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vY29tbW9uL3ZtX2V2ZW50X25nLmMKCi0tIAoyLjcuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
