Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1552DCB47
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 18:33:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLV9T-0006S8-MZ; Fri, 18 Oct 2019 16:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hxM9=YL=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iLV9S-0006Rs-5P
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 16:30:54 +0000
X-Inumbo-ID: a2705bae-f1c4-11e9-bbab-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2705bae-f1c4-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 16:30:45 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iLV91-0002jI-Ro; Fri, 18 Oct 2019 18:30:28 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 4EF5F1C03AB;
 Fri, 18 Oct 2019 18:30:27 +0200 (CEST)
Date: Fri, 18 Oct 2019 16:30:27 -0000
From: "tip-bot2 for Jiri Slaby" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <20191011115108.12392-24-jslaby@suse.cz>
References: <20191011115108.12392-24-jslaby@suse.cz>
MIME-Version: 1.0
Message-ID: <157141622703.29376.5110416025078659520.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: x86/asm] x86/asm/64: Change all ENTRY+END to
 SYM_CODE_*
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
Cc: Juergen Gross <jgross@suse.com>, linux-arch@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Maran Wilson <maran.wilson@oracle.com>, Peter Zijlstra <peterz@infradead.org>,
 Jiri Kosina <jkosina@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>,
 x86-ml <x86@kernel.org>, "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Ingo Molnar <mingo@kernel.org>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Borislav Petkov <bp@suse.de>, Jiri Slaby <jslaby@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9hc20gYnJh
bmNoIG9mIHRpcDoKCkNvbW1pdC1JRDogICAgIGJjN2IxMWMwNGVlOWM5YjA0NTFlYmY4NWJmNjRl
MGRlNjlmZGJiMTcKR2l0d2ViOiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy90aXAvYmM3
YjExYzA0ZWU5YzliMDQ1MWViZjg1YmY2NGUwZGU2OWZkYmIxNwpBdXRob3I6ICAgICAgICBKaXJp
IFNsYWJ5IDxqc2xhYnlAc3VzZS5jej4KQXV0aG9yRGF0ZTogICAgRnJpLCAxMSBPY3QgMjAxOSAx
Mzo1MTowMyArMDI6MDAKQ29tbWl0dGVyOiAgICAgQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRl
PgpDb21taXR0ZXJEYXRlOiBGcmksIDE4IE9jdCAyMDE5IDExOjU4OjI2ICswMjowMAoKeDg2L2Fz
bS82NDogQ2hhbmdlIGFsbCBFTlRSWStFTkQgdG8gU1lNX0NPREVfKgoKQ2hhbmdlIGFsbCBhc3Nl
bWJseSBjb2RlIHdoaWNoIGlzIG1hcmtlZCB1c2luZyBFTkQgKGFuZCBub3QgRU5EUFJPQykuClN3
aXRjaCBhbGwgdGhlc2UgdG8gdGhlIGFwcHJvcHJpYXRlIG5ldyBhbm5vdGF0aW9uIFNZTV9DT0RF
X1NUQVJUIGFuZApTWU1fQ09ERV9FTkQuCgpTaWduZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IDxqc2xh
YnlAc3VzZS5jej4KU2lnbmVkLW9mZi1ieTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4g
W3hlbiBiaXRzXQpDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBDYW8g
amluIDxjYW9qLmZuc3RAY24uZnVqaXRzdS5jb20+CkNjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFA
enl0b3IuY29tPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBKaXJpIEtv
c2luYSA8amtvc2luYUBzdXNlLmN6PgpDYzogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhh
dC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBsaW51eC1hcmNo
QHZnZXIua2VybmVsLm9yZwpDYzogTWFyYW4gV2lsc29uIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNv
bT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6ICJTdGV2ZW4gUm9zdGVkdCAo
Vk13YXJlKSIgPHJvc3RlZHRAZ29vZG1pcy5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4KQ2M6IHg4Ni1tbCA8eDg2QGtlcm5lbC5vcmc+CkNjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5
MTAxMTExNTEwOC4xMjM5Mi0yNC1qc2xhYnlAc3VzZS5jegotLS0KIGFyY2gveDg2L2VudHJ5L2Vu
dHJ5XzY0LlMgICAgICAgIHwgNTIgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogYXJj
aC94ODYvZW50cnkvZW50cnlfNjRfY29tcGF0LlMgfCAgOCArKy0tLQogYXJjaC94ODYva2VybmVs
L2Z0cmFjZV82NC5TICAgICAgfCAgNCArLQogYXJjaC94ODYva2VybmVsL2hlYWRfNjQuUyAgICAg
ICAgfCAxMiArKystLS0tCiBhcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TICAgICAgICB8ICA4ICsr
LS0tCiBhcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyAgICAgICAgICB8ICA4ICsrLS0tCiA2IGZpbGVz
IGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCmlu
ZGV4IDE1NjhkYTYuLjEzZTRmZTMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0
LlMKKysrIGIvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUwpAQCAtNDYsMTEgKzQ2LDExIEBACiAu
c2VjdGlvbiAuZW50cnkudGV4dCwgImF4IgogCiAjaWZkZWYgQ09ORklHX1BBUkFWSVJUCi1FTlRS
WShuYXRpdmVfdXNlcmdzX3N5c3JldDY0KQorU1lNX0NPREVfU1RBUlQobmF0aXZlX3VzZXJnc19z
eXNyZXQ2NCkKIAlVTldJTkRfSElOVF9FTVBUWQogCXN3YXBncwogCXN5c3JldHEKLUVORChuYXRp
dmVfdXNlcmdzX3N5c3JldDY0KQorU1lNX0NPREVfRU5EKG5hdGl2ZV91c2VyZ3Nfc3lzcmV0NjQp
CiAjZW5kaWYgLyogQ09ORklHX1BBUkFWSVJUICovCiAKIC5tYWNybyBUUkFDRV9JUlFTX0ZMQUdT
IGZsYWdzOnJlcQpAQCAtMTQyLDcgKzE0Miw3IEBAIEVORChuYXRpdmVfdXNlcmdzX3N5c3JldDY0
KQogICogd2l0aCB0aGVtIGR1ZSB0byBidWdzIGluIGJvdGggQU1EIGFuZCBJbnRlbCBDUFVzLgog
ICovCiAKLUVOVFJZKGVudHJ5X1NZU0NBTExfNjQpCitTWU1fQ09ERV9TVEFSVChlbnRyeV9TWVND
QUxMXzY0KQogCVVOV0lORF9ISU5UX0VNUFRZCiAJLyoKIAkgKiBJbnRlcnJ1cHRzIGFyZSBvZmYg
b24gZW50cnkuCkBAIC0yNzMsMTMgKzI3MywxMyBAQCBzeXNjYWxsX3JldHVybl92aWFfc3lzcmV0
OgogCXBvcHEJJXJkaQogCXBvcHEJJXJzcAogCVVTRVJHU19TWVNSRVQ2NAotRU5EKGVudHJ5X1NZ
U0NBTExfNjQpCitTWU1fQ09ERV9FTkQoZW50cnlfU1lTQ0FMTF82NCkKIAogLyoKICAqICVyZGk6
IHByZXYgdGFzawogICogJXJzaTogbmV4dCB0YXNrCiAgKi8KLUVOVFJZKF9fc3dpdGNoX3RvX2Fz
bSkKK1NZTV9DT0RFX1NUQVJUKF9fc3dpdGNoX3RvX2FzbSkKIAlVTldJTkRfSElOVF9GVU5DCiAJ
LyoKIAkgKiBTYXZlIGNhbGxlZS1zYXZlZCByZWdpc3RlcnMKQEAgLTMyMSw3ICszMjEsNyBAQCBF
TlRSWShfX3N3aXRjaF90b19hc20pCiAJcG9wcQklcmJwCiAKIAlqbXAJX19zd2l0Y2hfdG8KLUVO
RChfX3N3aXRjaF90b19hc20pCitTWU1fQ09ERV9FTkQoX19zd2l0Y2hfdG9fYXNtKQogCiAvKgog
ICogQSBuZXdseSBmb3JrZWQgcHJvY2VzcyBkaXJlY3RseSBjb250ZXh0IHN3aXRjaGVzIGludG8g
dGhpcyBhZGRyZXNzLgpAQCAtMzMwLDcgKzMzMCw3IEBAIEVORChfX3N3aXRjaF90b19hc20pCiAg
KiByYng6IGtlcm5lbCB0aHJlYWQgZnVuYyAoTlVMTCBmb3IgdXNlciB0aHJlYWQpCiAgKiByMTI6
IGtlcm5lbCB0aHJlYWQgYXJnCiAgKi8KLUVOVFJZKHJldF9mcm9tX2ZvcmspCitTWU1fQ09ERV9T
VEFSVChyZXRfZnJvbV9mb3JrKQogCVVOV0lORF9ISU5UX0VNUFRZCiAJbW92cQklcmF4LCAlcmRp
CiAJY2FsbAlzY2hlZHVsZV90YWlsCQkJLyogcmRpOiAncHJldicgdGFzayBwYXJhbWV0ZXIgKi8K
QEAgLTM1NywxNCArMzU3LDE0IEBAIEVOVFJZKHJldF9mcm9tX2ZvcmspCiAJICovCiAJbW92cQkk
MCwgUkFYKCVyc3ApCiAJam1wCTJiCi1FTkQocmV0X2Zyb21fZm9yaykKK1NZTV9DT0RFX0VORChy
ZXRfZnJvbV9mb3JrKQogCiAvKgogICogQnVpbGQgdGhlIGVudHJ5IHN0dWJzIHdpdGggc29tZSBh
c3NlbWJsZXIgbWFnaWMuCiAgKiBXZSBwYWNrIDEgc3R1YiBpbnRvIGV2ZXJ5IDgtYnl0ZSBibG9j
ay4KICAqLwogCS5hbGlnbiA4Ci1FTlRSWShpcnFfZW50cmllc19zdGFydCkKK1NZTV9DT0RFX1NU
QVJUKGlycV9lbnRyaWVzX3N0YXJ0KQogICAgIHZlY3Rvcj1GSVJTVF9FWFRFUk5BTF9WRUNUT1IK
ICAgICAucmVwdCAoRklSU1RfU1lTVEVNX1ZFQ1RPUiAtIEZJUlNUX0VYVEVSTkFMX1ZFQ1RPUikK
IAlVTldJTkRfSElOVF9JUkVUX1JFR1MKQEAgLTM3MywxMCArMzczLDEwIEBAIEVOVFJZKGlycV9l
bnRyaWVzX3N0YXJ0KQogCS5hbGlnbgk4CiAJdmVjdG9yPXZlY3RvcisxCiAgICAgLmVuZHIKLUVO
RChpcnFfZW50cmllc19zdGFydCkKK1NZTV9DT0RFX0VORChpcnFfZW50cmllc19zdGFydCkKIAog
CS5hbGlnbiA4Ci1FTlRSWShzcHVyaW91c19lbnRyaWVzX3N0YXJ0KQorU1lNX0NPREVfU1RBUlQo
c3B1cmlvdXNfZW50cmllc19zdGFydCkKICAgICB2ZWN0b3I9RklSU1RfU1lTVEVNX1ZFQ1RPUgog
ICAgIC5yZXB0IChOUl9WRUNUT1JTIC0gRklSU1RfU1lTVEVNX1ZFQ1RPUikKIAlVTldJTkRfSElO
VF9JUkVUX1JFR1MKQEAgLTM4NSw3ICszODUsNyBAQCBFTlRSWShzcHVyaW91c19lbnRyaWVzX3N0
YXJ0KQogCS5hbGlnbgk4CiAJdmVjdG9yPXZlY3RvcisxCiAgICAgLmVuZHIKLUVORChzcHVyaW91
c19lbnRyaWVzX3N0YXJ0KQorU1lNX0NPREVfRU5EKHNwdXJpb3VzX2VudHJpZXNfc3RhcnQpCiAK
IC5tYWNybyBERUJVR19FTlRSWV9BU1NFUlRfSVJRU19PRkYKICNpZmRlZiBDT05GSUdfREVCVUdf
RU5UUlkKQEAgLTUxMSw3ICs1MTEsNyBAQCBFTkQoc3B1cmlvdXNfZW50cmllc19zdGFydCkKICAq
IHwgcmV0dXJuIGFkZHJlc3MJCQkJCXwKICAqICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwogICovCi1FTlRSWShpbnRlcnJ1cHRfZW50cnkpCitT
WU1fQ09ERV9TVEFSVChpbnRlcnJ1cHRfZW50cnkpCiAJVU5XSU5EX0hJTlRfRlVOQwogCUFTTV9D
TEFDCiAJY2xkCkBAIC01NzksNyArNTc5LDcgQEAgRU5UUlkoaW50ZXJydXB0X2VudHJ5KQogCVRS
QUNFX0lSUVNfT0ZGCiAKIAlyZXQKLUVORChpbnRlcnJ1cHRfZW50cnkpCitTWU1fQ09ERV9FTkQo
aW50ZXJydXB0X2VudHJ5KQogX0FTTV9OT0tQUk9CRShpbnRlcnJ1cHRfZW50cnkpCiAKIApAQCAt
Nzk1LDcgKzc5NSw3IEBAIF9BU01fTk9LUFJPQkUoY29tbW9uX2ludGVycnVwdCkKICAqIEFQSUMg
aW50ZXJydXB0cy4KICAqLwogLm1hY3JvIGFwaWNpbnRlcnJ1cHQzIG51bSBzeW0gZG9fc3ltCi1F
TlRSWShcc3ltKQorU1lNX0NPREVfU1RBUlQoXHN5bSkKIAlVTldJTkRfSElOVF9JUkVUX1JFR1MK
IAlwdXNocQkkfihcbnVtKQogLkxjb21tb25fXHN5bToKQEAgLTgwMyw3ICs4MDMsNyBAQCBFTlRS
WShcc3ltKQogCVVOV0lORF9ISU5UX1JFR1MgaW5kaXJlY3Q9MQogCWNhbGwJXGRvX3N5bQkvKiBy
ZGkgcG9pbnRzIHRvIHB0X3JlZ3MgKi8KIAlqbXAJcmV0X2Zyb21faW50cgotRU5EKFxzeW0pCitT
WU1fQ09ERV9FTkQoXHN5bSkKIF9BU01fTk9LUFJPQkUoXHN5bSkKIC5lbmRtCiAKQEAgLTk2OCw3
ICs5NjgsNyBAQCBhcGljaW50ZXJydXB0IElSUV9XT1JLX1ZFQ1RPUgkJCWlycV93b3JrX2ludGVy
cnVwdAkJc21wX2lycV93b3JrX2ludGVycnVwdAogICogI0RGOiBpZiB0aGUgdGhyZWFkIHN0YWNr
IGlzIHNvbWVob3cgdW51c2FibGUsIHdlJ2xsIHN0aWxsIGdldCBhIHVzZWZ1bCBPT1BTLgogICov
CiAubWFjcm8gaWR0ZW50cnkgc3ltIGRvX3N5bSBoYXNfZXJyb3JfY29kZTpyZXEgcGFyYW5vaWQ9
MCBzaGlmdF9pc3Q9LTEgaXN0X29mZnNldD0wIGNyZWF0ZV9nYXA9MCByZWFkX2NyMj0wCi1FTlRS
WShcc3ltKQorU1lNX0NPREVfU1RBUlQoXHN5bSkKIAlVTldJTkRfSElOVF9JUkVUX1JFR1Mgb2Zm
c2V0PVxoYXNfZXJyb3JfY29kZSo4CiAKIAkvKiBTYW5pdHkgY2hlY2sgKi8KQEAgLTEwMTgsNyAr
MTAxOCw3IEBAIEVOVFJZKFxzeW0pCiAJLmVuZGlmCiAKIF9BU01fTk9LUFJPQkUoXHN5bSkKLUVO
RChcc3ltKQorU1lNX0NPREVfRU5EKFxzeW0pCiAuZW5kbQogCiBpZHRlbnRyeSBkaXZpZGVfZXJy
b3IJCQlkb19kaXZpZGVfZXJyb3IJCQloYXNfZXJyb3JfY29kZT0wCkBAIC0xMTM1LDcgKzExMzUs
NyBAQCBTWU1fQ09ERV9FTkQoeGVuX2RvX2h5cGVydmlzb3JfY2FsbGJhY2spCiAgKiBXZSBkaXN0
aW5ndWlzaCBiZXR3ZWVuIGNhdGVnb3JpZXMgYnkgY29tcGFyaW5nIGVhY2ggc2F2ZWQgc2VnbWVu
dCByZWdpc3RlcgogICogd2l0aCBpdHMgY3VycmVudCBjb250ZW50czogYW55IGRpc2NyZXBhbmN5
IG1lYW5zIHdlIGluIGNhdGVnb3J5IDEuCiAgKi8KLUVOVFJZKHhlbl9mYWlsc2FmZV9jYWxsYmFj
aykKK1NZTV9DT0RFX1NUQVJUKHhlbl9mYWlsc2FmZV9jYWxsYmFjaykKIAlVTldJTkRfSElOVF9F
TVBUWQogCW1vdmwJJWRzLCAlZWN4CiAJY21wdwklY3gsIDB4MTAoJXJzcCkKQEAgLTExNjUsNyAr
MTE2NSw3IEBAIEVOVFJZKHhlbl9mYWlsc2FmZV9jYWxsYmFjaykKIAlQVVNIX0FORF9DTEVBUl9S
RUdTCiAJRU5DT0RFX0ZSQU1FX1BPSU5URVIKIAlqbXAJZXJyb3JfZXhpdAotRU5EKHhlbl9mYWls
c2FmZV9jYWxsYmFjaykKK1NZTV9DT0RFX0VORCh4ZW5fZmFpbHNhZmVfY2FsbGJhY2spCiAjZW5k
aWYgLyogQ09ORklHX1hFTl9QViAqLwogCiAjaWZkZWYgQ09ORklHX1hFTl9QVkhWTQpAQCAtMTM4
NCw3ICsxMzg0LDcgQEAgU1lNX0NPREVfRU5EKGVycm9yX2V4aXQpCiAgKgklcjE0OiBVc2VkIHRv
IHNhdmUvcmVzdG9yZSB0aGUgQ1IzIG9mIHRoZSBpbnRlcnJ1cHRlZCBjb250ZXh0CiAgKgkgICAg
ICB3aGVuIFBBR0VfVEFCTEVfSVNPTEFUSU9OIGlzIGluIHVzZS4gIERvIG5vdCBjbG9iYmVyLgog
ICovCi1FTlRSWShubWkpCitTWU1fQ09ERV9TVEFSVChubWkpCiAJVU5XSU5EX0hJTlRfSVJFVF9S
RUdTCiAKIAkvKgpAQCAtMTcxOSwyMSArMTcxOSwyMSBAQCBubWlfcmVzdG9yZToKIAkgKiBhYm91
dCBlc3BmaXg2NCBvbiB0aGUgd2F5IGJhY2sgdG8ga2VybmVsIG1vZGUuCiAJICovCiAJaXJldHEK
LUVORChubWkpCitTWU1fQ09ERV9FTkQobm1pKQogCiAjaWZuZGVmIENPTkZJR19JQTMyX0VNVUxB
VElPTgogLyoKICAqIFRoaXMgaGFuZGxlcyBTWVNDQUxMIGZyb20gMzItYml0IGNvZGUuICBUaGVy
ZSBpcyBubyB3YXkgdG8gcHJvZ3JhbQogICogTVNScyB0byBmdWxseSBkaXNhYmxlIDMyLWJpdCBT
WVNDQUxMLgogICovCi1FTlRSWShpZ25vcmVfc3lzcmV0KQorU1lNX0NPREVfU1RBUlQoaWdub3Jl
X3N5c3JldCkKIAlVTldJTkRfSElOVF9FTVBUWQogCW1vdgkkLUVOT1NZUywgJWVheAogCXN5c3Jl
dAotRU5EKGlnbm9yZV9zeXNyZXQpCitTWU1fQ09ERV9FTkQoaWdub3JlX3N5c3JldCkKICNlbmRp
ZgogCi1FTlRSWShyZXdpbmRfc3RhY2tfZG9fZXhpdCkKK1NZTV9DT0RFX1NUQVJUKHJld2luZF9z
dGFja19kb19leGl0KQogCVVOV0lORF9ISU5UX0ZVTkMKIAkvKiBQcmV2ZW50IGFueSBuYWl2ZSBj
b2RlIGZyb20gdHJ5aW5nIHRvIHVud2luZCB0byBvdXIgY2FsbGVyLiAqLwogCXhvcmwJJWVicCwg
JWVicApAQCAtMTc0Myw0ICsxNzQzLDQgQEAgRU5UUlkocmV3aW5kX3N0YWNrX2RvX2V4aXQpCiAJ
VU5XSU5EX0hJTlRfRlVOQyBzcF9vZmZzZXQ9UFRSRUdTX1NJWkUKIAogCWNhbGwJZG9fZXhpdAot
RU5EKHJld2luZF9zdGFja19kb19leGl0KQorU1lNX0NPREVfRU5EKHJld2luZF9zdGFja19kb19l
eGl0KQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkvZW50cnlfNjRfY29tcGF0LlMgYi9hcmNo
L3g4Ni9lbnRyeS9lbnRyeV82NF9jb21wYXQuUwppbmRleCA1YzdlNzE2Li5kYTI5NjQzIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NF9jb21wYXQuUworKysgYi9hcmNoL3g4Ni9l
bnRyeS9lbnRyeV82NF9jb21wYXQuUwpAQCAtMTk2LDcgKzE5Niw3IEBAIEVORFBST0MoZW50cnlf
U1lTRU5URVJfY29tcGF0KQogICogZXNwICB1c2VyIHN0YWNrCiAgKiAwKCVlc3ApIGFyZzYKICAq
LwotRU5UUlkoZW50cnlfU1lTQ0FMTF9jb21wYXQpCitTWU1fQ09ERV9TVEFSVChlbnRyeV9TWVND
QUxMX2NvbXBhdCkKIAkvKiBJbnRlcnJ1cHRzIGFyZSBvZmYgb24gZW50cnkuICovCiAJc3dhcGdz
CiAKQEAgLTMxMSw3ICszMTEsNyBAQCBzeXNyZXQzMl9mcm9tX3N5c3RlbV9jYWxsOgogCXhvcmwJ
JXIxMGQsICVyMTBkCiAJc3dhcGdzCiAJc3lzcmV0bAotRU5EKGVudHJ5X1NZU0NBTExfY29tcGF0
KQorU1lNX0NPREVfRU5EKGVudHJ5X1NZU0NBTExfY29tcGF0KQogCiAvKgogICogMzItYml0IGxl
Z2FjeSBzeXN0ZW0gY2FsbCBlbnRyeS4KQEAgLTMzOSw3ICszMzksNyBAQCBFTkQoZW50cnlfU1lT
Q0FMTF9jb21wYXQpCiAgKiBlZGkgIGFyZzUKICAqIGVicCAgYXJnNgogICovCi1FTlRSWShlbnRy
eV9JTlQ4MF9jb21wYXQpCitTWU1fQ09ERV9TVEFSVChlbnRyeV9JTlQ4MF9jb21wYXQpCiAJLyoK
IAkgKiBJbnRlcnJ1cHRzIGFyZSBvZmYgb24gZW50cnkuCiAJICovCkBAIC00MTYsNCArNDE2LDQg
QEAgRU5UUlkoZW50cnlfSU5UODBfY29tcGF0KQogCS8qIEdvIGJhY2sgdG8gdXNlciBtb2RlLiAq
LwogCVRSQUNFX0lSUVNfT04KIAlqbXAJc3dhcGdzX3Jlc3RvcmVfcmVnc19hbmRfcmV0dXJuX3Rv
X3VzZXJtb2RlCi1FTkQoZW50cnlfSU5UODBfY29tcGF0KQorU1lNX0NPREVfRU5EKGVudHJ5X0lO
VDgwX2NvbXBhdCkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9mdHJhY2VfNjQuUyBiL2Fy
Y2gveDg2L2tlcm5lbC9mdHJhY2VfNjQuUwppbmRleCAzYWZhYWY1Li42MGY4OTRiIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvZnRyYWNlXzY0LlMKKysrIGIvYXJjaC94ODYva2VybmVsL2Z0
cmFjZV82NC5TCkBAIC0yOTYsNyArMjk2LDcgQEAgRU5UUlkoZnRyYWNlX2dyYXBoX2NhbGxlcikK
IAlyZXRxCiBFTkRQUk9DKGZ0cmFjZV9ncmFwaF9jYWxsZXIpCiAKLUVOVFJZKHJldHVybl90b19o
YW5kbGVyKQorU1lNX0NPREVfU1RBUlQocmV0dXJuX3RvX2hhbmRsZXIpCiAJVU5XSU5EX0hJTlRf
RU1QVFkKIAlzdWJxICAkMjQsICVyc3AKIApAQCAtMzEyLDUgKzMxMiw1IEBAIEVOVFJZKHJldHVy
bl90b19oYW5kbGVyKQogCW1vdnEgKCVyc3ApLCAlcmF4CiAJYWRkcSAkMjQsICVyc3AKIAlKTVBf
Tk9TUEVDICVyZGkKLUVORChyZXR1cm5fdG9faGFuZGxlcikKK1NZTV9DT0RFX0VORChyZXR1cm5f
dG9faGFuZGxlcikKICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2hlYWRfNjQu
UyBiL2FyY2gveDg2L2tlcm5lbC9oZWFkXzY0LlMKaW5kZXggMTBmMzA2ZS4uNGJiYzc3MCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2hlYWRfNjQuUworKysgYi9hcmNoL3g4Ni9rZXJuZWwv
aGVhZF82NC5TCkBAIC05MSw3ICs5MSw3IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJR04oc3RhcnR1
cF82NCkKIAlqbXAgMWYKIFNZTV9DT0RFX0VORChzdGFydHVwXzY0KQogCi1FTlRSWShzZWNvbmRh
cnlfc3RhcnR1cF82NCkKK1NZTV9DT0RFX1NUQVJUKHNlY29uZGFyeV9zdGFydHVwXzY0KQogCVVO
V0lORF9ISU5UX0VNUFRZCiAJLyoKIAkgKiBBdCB0aGlzIHBvaW50IHRoZSBDUFUgcnVucyBpbiA2
NGJpdCBtb2RlIENTLkwgPSAxIENTLkQgPSAwLApAQCAtMjQxLDcgKzI0MSw3IEBAIEVOVFJZKHNl
Y29uZGFyeV9zdGFydHVwXzY0KQogCXB1c2hxCSVyYXgJCSMgdGFyZ2V0IGFkZHJlc3MgaW4gbmVn
YXRpdmUgc3BhY2UKIAlscmV0cQogLkxhZnRlcl9scmV0OgotRU5EKHNlY29uZGFyeV9zdGFydHVw
XzY0KQorU1lNX0NPREVfRU5EKHNlY29uZGFyeV9zdGFydHVwXzY0KQogCiAjaW5jbHVkZSAidmVy
aWZ5X2NwdS5TIgogCkBAIC0yNTEsMTEgKzI1MSwxMSBAQCBFTkQoc2Vjb25kYXJ5X3N0YXJ0dXBf
NjQpCiAgKiB1cCBhbHJlYWR5IGV4Y2VwdCBzdGFjay4gV2UganVzdCBzZXQgdXAgc3RhY2sgaGVy
ZS4gVGhlbiBjYWxsCiAgKiBzdGFydF9zZWNvbmRhcnkoKSB2aWEgLkxqdW1wX3RvX0NfY29kZS4K
ICAqLwotRU5UUlkoc3RhcnRfY3B1MCkKK1NZTV9DT0RFX1NUQVJUKHN0YXJ0X2NwdTApCiAJVU5X
SU5EX0hJTlRfRU1QVFkKIAltb3ZxCWluaXRpYWxfc3RhY2soJXJpcCksICVyc3AKIAlqbXAJLkxq
dW1wX3RvX0NfY29kZQotRU5EKHN0YXJ0X2NwdTApCitTWU1fQ09ERV9FTkQoc3RhcnRfY3B1MCkK
ICNlbmRpZgogCiAJLyogQm90aCBTTVAgYm9vdHVwIGFuZCBBQ1BJIHN1c3BlbmQgY2hhbmdlIHRo
ZXNlIHZhcmlhYmxlcyAqLwpAQCAtMjcyLDcgKzI3Miw3IEBAIFNZTV9EQVRBKGluaXRpYWxfc3Rh
Y2ssIC5xdWFkIGluaXRfdGhyZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUgLSBTSVpFT0ZfUFRSRUdT
KQogCV9fRklOSVREQVRBCiAKIAlfX0lOSVQKLUVOVFJZKGVhcmx5X2lkdF9oYW5kbGVyX2FycmF5
KQorU1lNX0NPREVfU1RBUlQoZWFybHlfaWR0X2hhbmRsZXJfYXJyYXkpCiAJaSA9IDAKIAkucmVw
dCBOVU1fRVhDRVBUSU9OX1ZFQ1RPUlMKIAkuaWYgKChFWENFUFRJT05fRVJSQ09ERV9NQVNLID4+
IGkpICYgMSkgPT0gMApAQCAtMjg4LDcgKzI4OCw3IEBAIEVOVFJZKGVhcmx5X2lkdF9oYW5kbGVy
X2FycmF5KQogCS5maWxsIGVhcmx5X2lkdF9oYW5kbGVyX2FycmF5ICsgaSpFQVJMWV9JRFRfSEFO
RExFUl9TSVpFIC0gLiwgMSwgMHhjYwogCS5lbmRyCiAJVU5XSU5EX0hJTlRfSVJFVF9SRUdTIG9m
ZnNldD0xNgotRU5EKGVhcmx5X2lkdF9oYW5kbGVyX2FycmF5KQorU1lNX0NPREVfRU5EKGVhcmx5
X2lkdF9oYW5kbGVyX2FycmF5KQogCiBTWU1fQ09ERV9TVEFSVF9MT0NBTChlYXJseV9pZHRfaGFu
ZGxlcl9jb21tb24pCiAJLyoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMg
Yi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCmluZGV4IGMyMDljNzAuLjAwNjAxMjAgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMKKysrIGIvYXJjaC94ODYveGVuL3hlbi1h
c21fNjQuUwpAQCAtMjAsMTEgKzIwLDExIEBACiAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgog
CiAubWFjcm8geGVuX3B2X3RyYXAgbmFtZQotRU5UUlkoeGVuX1xuYW1lKQorU1lNX0NPREVfU1RB
UlQoeGVuX1xuYW1lKQogCXBvcCAlcmN4CiAJcG9wICVyMTEKIAlqbXAgIFxuYW1lCi1FTkQoeGVu
X1xuYW1lKQorU1lNX0NPREVfRU5EKHhlbl9cbmFtZSkKIF9BU01fTk9LUFJPQkUoeGVuX1xuYW1l
KQogLmVuZG0KIApAQCAtNTcsNyArNTcsNyBAQCB4ZW5fcHZfdHJhcCBlbnRyeV9JTlQ4MF9jb21w
YXQKIHhlbl9wdl90cmFwIGh5cGVydmlzb3JfY2FsbGJhY2sKIAogCV9fSU5JVAotRU5UUlkoeGVu
X2Vhcmx5X2lkdF9oYW5kbGVyX2FycmF5KQorU1lNX0NPREVfU1RBUlQoeGVuX2Vhcmx5X2lkdF9o
YW5kbGVyX2FycmF5KQogCWkgPSAwCiAJLnJlcHQgTlVNX0VYQ0VQVElPTl9WRUNUT1JTCiAJcG9w
ICVyY3gKQEAgLTY2LDcgKzY2LDcgQEAgRU5UUlkoeGVuX2Vhcmx5X2lkdF9oYW5kbGVyX2FycmF5
KQogCWkgPSBpICsgMQogCS5maWxsIHhlbl9lYXJseV9pZHRfaGFuZGxlcl9hcnJheSArIGkqWEVO
X0VBUkxZX0lEVF9IQU5ETEVSX1NJWkUgLSAuLCAxLCAweGNjCiAJLmVuZHIKLUVORCh4ZW5fZWFy
bHlfaWR0X2hhbmRsZXJfYXJyYXkpCitTWU1fQ09ERV9FTkQoeGVuX2Vhcmx5X2lkdF9oYW5kbGVy
X2FycmF5KQogCV9fRklOSVQKIAogaHlwZXJjYWxsX2lyZXQgPSBoeXBlcmNhbGxfcGFnZSArIF9f
SFlQRVJWSVNPUl9pcmV0ICogMzIKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4taGVhZC5T
IGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKaW5kZXggYzFkOGI5MC4uMWQwY2VlMyAxMDA2NDQK
LS0tIGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFk
LlMKQEAgLTIyLDcgKzIyLDcgQEAKIAogI2lmZGVmIENPTkZJR19YRU5fUFYKIAlfX0lOSVQKLUVO
VFJZKHN0YXJ0dXBfeGVuKQorU1lNX0NPREVfU1RBUlQoc3RhcnR1cF94ZW4pCiAJVU5XSU5EX0hJ
TlRfRU1QVFkKIAljbGQKIApAQCAtNTIsMTMgKzUyLDEzIEBAIEVOVFJZKHN0YXJ0dXBfeGVuKQog
I2VuZGlmCiAKIAlqbXAgeGVuX3N0YXJ0X2tlcm5lbAotRU5EKHN0YXJ0dXBfeGVuKQorU1lNX0NP
REVfRU5EKHN0YXJ0dXBfeGVuKQogCV9fRklOSVQKICNlbmRpZgogCiAucHVzaHNlY3Rpb24gLnRl
eHQKIAkuYmFsaWduIFBBR0VfU0laRQotRU5UUlkoaHlwZXJjYWxsX3BhZ2UpCitTWU1fQ09ERV9T
VEFSVChoeXBlcmNhbGxfcGFnZSkKIAkucmVwdCAoUEFHRV9TSVpFIC8gMzIpCiAJCVVOV0lORF9I
SU5UX0VNUFRZCiAJCS5za2lwIDMyCkBAIC02OSw3ICs2OSw3IEBAIEVOVFJZKGh5cGVyY2FsbF9w
YWdlKQogCS50eXBlIHhlbl9oeXBlcmNhbGxfIyNuLCBAZnVuY3Rpb247IC5zaXplIHhlbl9oeXBl
cmNhbGxfIyNuLCAzMgogI2luY2x1ZGUgPGFzbS94ZW4taHlwZXJjYWxscy5oPgogI3VuZGVmIEhZ
UEVSQ0FMTAotRU5EKGh5cGVyY2FsbF9wYWdlKQorU1lNX0NPREVfRU5EKGh5cGVyY2FsbF9wYWdl
KQogLnBvcHNlY3Rpb24KIAogCUVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9HVUVTVF9PUywgICAg
ICAgLmFzY2l6ICJsaW51eCIpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
