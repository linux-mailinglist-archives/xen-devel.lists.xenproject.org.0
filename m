Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53CF97C7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 18:56:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUaMt-0003yD-Mt; Tue, 12 Nov 2019 17:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Np2b=ZE=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iUaMr-0003xk-TA
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 17:54:17 +0000
X-Inumbo-ID: 6d3066fe-0575-11ea-9631-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d3066fe-0575-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 17:54:09 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iUaMW-0000f1-PT; Tue, 12 Nov 2019 18:53:56 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 5C1721C0357;
 Tue, 12 Nov 2019 18:53:56 +0100 (CET)
Date: Tue, 12 Nov 2019 17:53:56 -0000
From: "tip-bot2 for Daniel Kiper" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <20191112134640.16035-3-daniel.kiper@oracle.com>
References: <20191112134640.16035-3-daniel.kiper@oracle.com>
MIME-Version: 1.0
Message-ID: <157358123601.29376.5713242923411470070.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: x86/boot] x86/boot: Introduce
 kernel_info.setup_type_max
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: linux-efi <linux-efi@vger.kernel.org>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, dave.hansen@linux.intel.com,
 "H. Peter Anvin \(Intel\)" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 eric.snowberg@oracle.com, Jonathan Corbet <corbet@lwn.net>,
 Daniel Kiper <daniel.kiper@oracle.com>, x86-ml <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, kanth.ghatraju@oracle.com,
 xen-devel@lists.xenproject.org, Borislav Petkov <bp@suse.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Philipson <ross.philipson@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 ard.biesheuvel@linaro.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9ib290IGJy
YW5jaCBvZiB0aXA6CgpDb21taXQtSUQ6ICAgICAwMGNkMWMxNTRkNTY1YzYyYWQ1ZTA2NWJmMzUz
MGY2OGJkZjU5NDkwCkdpdHdlYjogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdGlwLzAw
Y2QxYzE1NGQ1NjVjNjJhZDVlMDY1YmYzNTMwZjY4YmRmNTk0OTAKQXV0aG9yOiAgICAgICAgRGFu
aWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KQXV0aG9yRGF0ZTogICAgVHVlLCAx
MiBOb3YgMjAxOSAxNDo0NjozOSArMDE6MDAKQ29tbWl0dGVyOiAgICAgQm9yaXNsYXYgUGV0a292
IDxicEBzdXNlLmRlPgpDb21taXR0ZXJEYXRlOiBUdWUsIDEyIE5vdiAyMDE5IDE2OjE2OjU0ICsw
MTowMAoKeDg2L2Jvb3Q6IEludHJvZHVjZSBrZXJuZWxfaW5mby5zZXR1cF90eXBlX21heAoKVGhp
cyBmaWVsZCBjb250YWlucyBtYXhpbWFsIGFsbG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4KCkRv
IG5vdCBidW1wIHNldHVwX2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMg
YmVjYXVzZSBpdAp3aWxsIGJlIGZvbGxvd2VkIGJ5IGFkZGl0aW9uYWwgY2hhbmdlcyBjb21pbmcg
aW50byB0aGUgTGludXgveDg2IGJvb3QKcHJvdG9jb2wuCgpTdWdnZXN0ZWQtYnk6IEguIFBldGVy
IEFudmluIChJbnRlbCkgPGhwYUB6eXRvci5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBLaXBl
ciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEJvcmlzbGF2IFBldGtv
diA8YnBAc3VzZS5kZT4KUmV2aWV3ZWQtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvc3MgUGhpbGlwc29uIDxyb3NzLnBoaWxp
cHNvbkBvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTogSC4gUGV0ZXIgQW52aW4gKEludGVsKSA8aHBh
QHp5dG9yLmNvbT4KQ2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BhbWFjYXBpdGFsLm5ldD4KQ2M6
IGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmcKQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+CkNjOiBkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20KQ2M6IGVy
aWMuc25vd2JlcmdAb3JhY2xlLmNvbQpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+
CkNjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgpDYzoga2FudGguZ2hhdHJhanVAb3JhY2xlLmNvbQpDYzogbGludXgt
ZG9jQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtZWZpIDxsaW51eC1lZmlAdmdlci5rZXJuZWwu
b3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogcmR1bmxh
cEBpbmZyYWRlYWQub3JnCkNjOiByb3NzLnBoaWxpcHNvbkBvcmFjbGUuY29tCkNjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IHg4Ni1tbCA8eDg2QGtlcm5lbC5vcmc+
CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKTGluazogaHR0cHM6Ly9sa21sLmtl
cm5lbC5vcmcvci8yMDE5MTExMjEzNDY0MC4xNjAzNS0zLWRhbmllbC5raXBlckBvcmFjbGUuY29t
Ci0tLQogRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QgICAgICAgICAgICAgfCAgOSArKysrKysr
Ky0KIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIHwgIDUgKysrKysKIGFy
Y2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggIHwgIDMgKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3g4Ni9ib290LnJzdCBiL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0CmluZGV4
IGM2MGZhZmQuLjZjZGQ3NjcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0
CisrKyBiL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0CkBAIC03Myw3ICs3Myw3IEBAIFByb3Rv
Y29sIDIuMTQ6CUJVUk5UIEJZIElOQ09SUkVDVCBDT01NSVQgYWU3ZTEyMzhlNjhmMmE0NzJhMTI1
NjczYWI1MDZkNDkxNThjMTg4CiAJCSh4ODYvYm9vdDogQWRkIEFDUEkgUlNEUCBhZGRyZXNzIHRv
IHNldHVwX2hlYWRlcikKIAkJRE8gTk9UIFVTRSEhISBBU1NVTUUgU0FNRSBBUyAyLjEzLgogCi1Q
cm90b2NvbCAyLjE1OgkoS2VybmVsIDUuNSkgQWRkZWQgdGhlIGtlcm5lbF9pbmZvLgorUHJvdG9j
b2wgMi4xNToJKEtlcm5lbCA1LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mbyBhbmQga2VybmVsX2lu
Zm8uc2V0dXBfdHlwZV9tYXguCiA9PT09PT09PT09PT09CT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogCiAuLiBub3RlOjoKQEAgLTk4
MSw2ICs5ODEsMTMgQEAgT2Zmc2V0L3NpemU6CTB4MDAwOC80CiAgIFRoaXMgZmllbGQgY29udGFp
bnMgdGhlIHNpemUgb2YgdGhlIGtlcm5lbF9pbmZvIGluY2x1ZGluZyBrZXJuZWxfaW5mby5oZWFk
ZXIKICAgYW5kIGtlcm5lbF9pbmZvLmtlcm5lbF9pbmZvX3Zhcl9sZW5fZGF0YS4KIAorPT09PT09
PT09PT09CT09PT09PT09PT09PT09CitGaWVsZCBuYW1lOglzZXR1cF90eXBlX21heAorT2Zmc2V0
L3NpemU6CTB4MDAwYy80Cis9PT09PT09PT09PT0JPT09PT09PT09PT09PT0KKworICBUaGlzIGZp
ZWxkIGNvbnRhaW5zIG1heGltYWwgYWxsb3dlZCB0eXBlIGZvciBzZXR1cF9kYXRhLgorCiAKIFRo
ZSBJbWFnZSBDaGVja3N1bQogPT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3Nl
ZC9rZXJuZWxfaW5mby5TCmluZGV4IDhlYTZmNmUuLjAxOGRhY2IgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TCisrKyBiL2FyY2gveDg2L2Jvb3QvY29t
cHJlc3NlZC9rZXJuZWxfaW5mby5TCkBAIC0xLDUgKzEsNyBAQAogLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgKi8KIAorI2luY2x1ZGUgPGFzbS9ib290cGFyYW0uaD4KKwogCS5z
ZWN0aW9uICIucm9kYXRhLmtlcm5lbF9pbmZvIiwgImEiCiAKIAkuZ2xvYmFsIGtlcm5lbF9pbmZv
CkBAIC0xMiw2ICsxNCw5IEBAIGtlcm5lbF9pbmZvOgogCS8qIFNpemUgdG90YWwuICovCiAJLmxv
bmcJa2VybmVsX2luZm9fZW5kIC0ga2VybmVsX2luZm8KIAorCS8qIE1heGltYWwgYWxsb3dlZCB0
eXBlIGZvciBzZXR1cF9kYXRhLiAqLworCS5sb25nCVNFVFVQX1RZUEVfTUFYCisKIGtlcm5lbF9p
bmZvX3Zhcl9sZW5fZGF0YToKIAkvKiBFbXB0eSBmb3IgdGltZSBiZWluZy4uLiAqLwoga2VybmVs
X2luZm9fZW5kOgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFy
YW0uaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmgKaW5kZXggYTFlYmNk
Ny4uZGJiNDExMiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFy
YW0uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oCkBAIC0xMSw2
ICsxMSw5IEBACiAjZGVmaW5lIFNFVFVQX0FQUExFX1BST1BFUlRJRVMJCTUKICNkZWZpbmUgU0VU
VVBfSkFJTEhPVVNFCQkJNgogCisvKiBtYXgoU0VUVVBfKikgKi8KKyNkZWZpbmUgU0VUVVBfVFlQ
RV9NQVgJCQlTRVRVUF9KQUlMSE9VU0UKKwogLyogcmFtX3NpemUgZmxhZ3MgKi8KICNkZWZpbmUg
UkFNRElTS19JTUFHRV9TVEFSVF9NQVNLCTB4MDdGRgogI2RlZmluZSBSQU1ESVNLX1BST01QVF9G
TEFHCQkweDgwMDAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
