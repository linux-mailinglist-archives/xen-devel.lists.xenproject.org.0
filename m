Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603CEDC5C4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:08:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLRw4-0000rf-Ra; Fri, 18 Oct 2019 13:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hxM9=YL=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iLRgF-0007me-OF
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 12:48:31 +0000
X-Inumbo-ID: 94295f06-f1a5-11e9-beca-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94295f06-f1a5-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 12:48:27 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iLRg3-00078X-N5; Fri, 18 Oct 2019 14:48:19 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 477681C009C;
 Fri, 18 Oct 2019 14:48:19 +0200 (CEST)
Date: Fri, 18 Oct 2019 12:48:19 -0000
From: "tip-bot2 for Masami Hiramatsu" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <156777562873.25081.2288083344657460959.stgit@devnote2>
References: <156777562873.25081.2288083344657460959.stgit@devnote2>
MIME-Version: 1.0
Message-ID: <157140289913.29376.11199090886356756663.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 18 Oct 2019 13:04:51 +0000
Subject: [Xen-devel] [tip: x86/core] x86/asm: Allow to pass macros to
 __ASM_FORM()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9jb3JlIGJy
YW5jaCBvZiB0aXA6CgpDb21taXQtSUQ6ICAgICBmNzkxOWZkOTQzYWJmMGM3N2FlZDQ0NDFlYTk4
OTdhMzIzZDEzMmY1CkdpdHdlYjogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdGlwL2Y3
OTE5ZmQ5NDNhYmYwYzc3YWVkNDQ0MWVhOTg5N2EzMjNkMTMyZjUKQXV0aG9yOiAgICAgICAgTWFz
YW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KQXV0aG9yRGF0ZTogICAgRnJpLCAw
NiBTZXAgMjAxOSAyMjoxMzo0OCArMDk6MDAKQ29tbWl0dGVyOiAgICAgUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDb21taXR0ZXJEYXRlOiBUaHUsIDE3IE9jdCAyMDE5IDIx
OjMxOjU3ICswMjowMAoKeDg2L2FzbTogQWxsb3cgdG8gcGFzcyBtYWNyb3MgdG8gX19BU01fRk9S
TSgpCgpVc2UgX19zdHJpbmdpZnkoKSBhdCBfX0FTTV9GT1JNKCkgc28gdGhhdCB1c2VyIGNhbiBw
YXNzCmNvZGUgaW5jbHVkaW5nIG1hY3JvcyB0byBfX0FTTV9GT1JNKCkuCgpTaWduZWQtb2ZmLWJ5
OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBaaWpsc3RyYSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiBCb3JpcyBPc3Ry
b3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdv
QGtlcm5lbC5vcmc+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogQm9y
aXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogSm9zaCBQ
b2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+Ckxpbms6IGh0dHBzOi8vbGttbC5rZXJuZWwu
b3JnL3IvMTU2Nzc3NTYyODczLjI1MDgxLjIyODgwODMzNDQ2NTc0NjA5NTkuc3RnaXRAZGV2bm90
ZTIKLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20uaCB8IDggKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20uaAppbmRl
eCAzZmY1NzdjLi4xYjU2M2Y5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20u
aAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20uaApAQCAtNyw5ICs3LDExIEBACiAjIGRl
ZmluZSBfX0FTTV9GT1JNX1JBVyh4KSAgICAgeAogIyBkZWZpbmUgX19BU01fRk9STV9DT01NQSh4
KSB4LAogI2Vsc2UKLSMgZGVmaW5lIF9fQVNNX0ZPUk0oeCkJIiAiICN4ICIgIgotIyBkZWZpbmUg
X19BU01fRk9STV9SQVcoeCkgICAgICN4Ci0jIGRlZmluZSBfX0FTTV9GT1JNX0NPTU1BKHgpICIg
IiAjeCAiLCIKKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdpZnkuaD4KKworIyBkZWZpbmUgX19BU01f
Rk9STSh4KQkiICIgX19zdHJpbmdpZnkoeCkgIiAiCisjIGRlZmluZSBfX0FTTV9GT1JNX1JBVyh4
KSAgICAgX19zdHJpbmdpZnkoeCkKKyMgZGVmaW5lIF9fQVNNX0ZPUk1fQ09NTUEoeCkgIiAiIF9f
c3RyaW5naWZ5KHgpICIsIgogI2VuZGlmCiAKICNpZm5kZWYgX194ODZfNjRfXwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
