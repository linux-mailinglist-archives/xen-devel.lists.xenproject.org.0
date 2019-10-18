Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14DDCB12
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 18:33:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLV9E-0006PV-LO; Fri, 18 Oct 2019 16:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hxM9=YL=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iLV9D-0006PP-6j
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 16:30:39 +0000
X-Inumbo-ID: 9db1dd2c-f1c4-11e9-bbab-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9db1dd2c-f1c4-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 16:30:37 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iLV97-0002pv-Sb; Fri, 18 Oct 2019 18:30:34 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 9FD261C0494;
 Fri, 18 Oct 2019 18:30:30 +0200 (CEST)
Date: Fri, 18 Oct 2019 16:30:30 -0000
From: "tip-bot2 for Jiri Slaby" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <20191011115108.12392-15-jslaby@suse.cz>
References: <20191011115108.12392-15-jslaby@suse.cz>
MIME-Version: 1.0
Message-ID: <157141623045.29376.2755641744903920106.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: x86/asm] xen/pvh: Annotate data appropriately
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
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Ingo Molnar <mingo@kernel.org>, x86-ml <x86@kernel.org>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>,
 Jiri Slaby <jslaby@suse.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9hc20gYnJh
bmNoIG9mIHRpcDoKCkNvbW1pdC1JRDogICAgIDFkZTViZGNlMGMzZjgyOTRkMGFhYmM0OGZiNTQ5
NzgxNDU4OTQyMmYKR2l0d2ViOiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy90aXAvMWRl
NWJkY2UwYzNmODI5NGQwYWFiYzQ4ZmI1NDk3ODE0NTg5NDIyZgpBdXRob3I6ICAgICAgICBKaXJp
IFNsYWJ5IDxqc2xhYnlAc3VzZS5jej4KQXV0aG9yRGF0ZTogICAgRnJpLCAxMSBPY3QgMjAxOSAx
Mzo1MDo1NCArMDI6MDAKQ29tbWl0dGVyOiAgICAgQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRl
PgpDb21taXR0ZXJEYXRlOiBGcmksIDE4IE9jdCAyMDE5IDEwOjQ2OjA2ICswMjowMAoKeGVuL3B2
aDogQW5ub3RhdGUgZGF0YSBhcHByb3ByaWF0ZWx5CgpVc2UgdGhlIG5ldyBTWU1fREFUQV9TVEFS
VF9MT0NBTCwgYW5kIFNZTV9EQVRBX0VORCogbWFjcm9zIHRvIGdldDoKCiAgMDAwMCAgICAgOCBP
QkpFQ1QgIExPQ0FMICBERUZBVUxUICAgIDYgZ2R0CiAgMDAwOCAgICAzMiBPQkpFQ1QgIExPQ0FM
ICBERUZBVUxUICAgIDYgZ2R0X3N0YXJ0CiAgMDAyOCAgICAgMCBPQkpFQ1QgIExPQ0FMICBERUZB
VUxUICAgIDYgZ2R0X2VuZAogIDAwMjggICAyNTYgT0JKRUNUICBMT0NBTCAgREVGQVVMVCAgICA2
IGVhcmx5X3N0YWNrCiAgMDEyOCAgICAgMCBPQkpFQ1QgIExPQ0FMICBERUZBVUxUICAgIDYgZWFy
bHlfc3RhY2sKClNpZ25lZC1vZmYtYnk6IEppcmkgU2xhYnkgPGpzbGFieUBzdXNlLmN6PgpTaWdu
ZWQtb2ZmLWJ5OiBCb3Jpc2xhdiBQZXRrb3YgPGJwQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogQW5keSBTaGV2Y2hl
bmtvIDxhbmR5QGluZnJhZGVhZC5vcmc+CkNjOiBEYXJyZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVh
ZC5vcmc+CkNjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPgpDYzogSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkNjOiBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZwpDYzogcGxhdGZvcm0tZHJpdmVyLXg4NkB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogeDg2LW1s
IDx4ODZAa2VybmVsLm9yZz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpMaW5r
OiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkxMDExMTE1MTA4LjEyMzkyLTE1LWpzbGFi
eUBzdXNlLmN6Ci0tLQogYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQuUyB8IDE0ICsrKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMgYi9hcmNoL3g4Ni9wbGF0
Zm9ybS9wdmgvaGVhZC5TCmluZGV4IDFmODgyNWIuLjRlNjM0ODAgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMKKysrIGIvYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQu
UwpAQCAtMTUwLDExICsxNTAsMTIgQEAgRU5EKHB2aF9zdGFydF94ZW4pCiAKIAkuc2VjdGlvbiAi
LmluaXQuZGF0YSIsImF3IgogCS5iYWxpZ24gOAotZ2R0OgorU1lNX0RBVEFfU1RBUlRfTE9DQUwo
Z2R0KQogCS53b3JkIGdkdF9lbmQgLSBnZHRfc3RhcnQKIAkubG9uZyBfcGEoZ2R0X3N0YXJ0KQog
CS53b3JkIDAKLWdkdF9zdGFydDoKK1NZTV9EQVRBX0VORChnZHQpCitTWU1fREFUQV9TVEFSVF9M
T0NBTChnZHRfc3RhcnQpCiAJLnF1YWQgMHgwMDAwMDAwMDAwMDAwMDAwICAgICAgICAgICAgLyog
TlVMTCBkZXNjcmlwdG9yICovCiAjaWZkZWYgQ09ORklHX1g4Nl82NAogCS5xdWFkIEdEVF9FTlRS
WSgweGEwOWEsIDAsIDB4ZmZmZmYpIC8qIFBWSF9DU19TRUwgKi8KQEAgLTE2MywxNSArMTY0LDE0
IEBAIGdkdF9zdGFydDoKICNlbmRpZgogCS5xdWFkIEdEVF9FTlRSWSgweGMwOTIsIDAsIDB4ZmZm
ZmYpIC8qIFBWSF9EU19TRUwgKi8KIAkucXVhZCBHRFRfRU5UUlkoMHg0MDkwLCAwLCAweDE4KSAg
ICAvKiBQVkhfQ0FOQVJZX1NFTCAqLwotZ2R0X2VuZDoKK1NZTV9EQVRBX0VORF9MQUJFTChnZHRf
c3RhcnQsIFNZTV9MX0xPQ0FMLCBnZHRfZW5kKQogCiAJLmJhbGlnbiAxNgotY2FuYXJ5OgotCS5m
aWxsIDQ4LCAxLCAwCitTWU1fREFUQV9MT0NBTChjYW5hcnksIC5maWxsIDQ4LCAxLCAwKQogCi1l
YXJseV9zdGFjazoKK1NZTV9EQVRBX1NUQVJUX0xPQ0FMKGVhcmx5X3N0YWNrKQogCS5maWxsIEJP
T1RfU1RBQ0tfU0laRSwgMSwgMAotZWFybHlfc3RhY2tfZW5kOgorU1lNX0RBVEFfRU5EX0xBQkVM
KGVhcmx5X3N0YWNrLCBTWU1fTF9MT0NBTCwgZWFybHlfc3RhY2tfZW5kKQogCiAJRUxGTk9URShY
ZW4sIFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSwKIAkgICAgICAgICAgICAgX0FTTV9QVFIgKHB2
aF9zdGFydF94ZW4gLSBfX1NUQVJUX0tFUk5FTF9tYXApKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
