Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBE118F72
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 19:04:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iejpZ-00013m-FE; Tue, 10 Dec 2019 18:01:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=boxn=2A=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iejpX-00013d-ON
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 18:01:51 +0000
X-Inumbo-ID: 236d880e-1b77-11ea-b6f1-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236d880e-1b77-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 18:01:50 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iejpT-0007Na-K6; Tue, 10 Dec 2019 19:01:47 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 23F3D1C290C;
 Tue, 10 Dec 2019 19:01:47 +0100 (CET)
Date: Tue, 10 Dec 2019 18:01:46 -0000
From: "tip-bot2 for Krzysztof Kozlowski" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <1574306470-10305-1-git-send-email-krzk@kernel.org>
References: <1574306470-10305-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <157600090696.30329.14792453915019294290.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: x86/cleanups] x86/Kconfig: Fix Kconfig indentation
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
 Stefano Stabellini <sstabellini@kernel.org>, x86-ml <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9jbGVhbnVw
cyBicmFuY2ggb2YgdGlwOgoKQ29tbWl0LUlEOiAgICAgYjAzYjAxNmZlNTRlZGQxYjUyN2Q3NDll
MTM5YjJmYzk0MDdhYzQxNApHaXR3ZWI6ICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Rp
cC9iMDNiMDE2ZmU1NGVkZDFiNTI3ZDc0OWUxMzliMmZjOTQwN2FjNDE0CkF1dGhvcjogICAgICAg
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KQXV0aG9yRGF0ZTogICAgVGh1
LCAyMSBOb3YgMjAxOSAwNDoyMTowOSArMDE6MDAKQ29tbWl0dGVyOiAgICAgQm9yaXNsYXYgUGV0
a292IDxicEBzdXNlLmRlPgpDb21taXR0ZXJEYXRlOiBUdWUsIDEwIERlYyAyMDE5IDE4OjQzOjIx
ICswMTowMAoKeDg2L0tjb25maWc6IEZpeCBLY29uZmlnIGluZGVudGF0aW9uCgpBZGp1c3QgaW5k
ZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4K
Y29kaW5nIHN0eWxlIHdpdGggY29tbWFuZCBsaWtlOgoKJCBzZWQgLWUgJ3MvXiAgICAgICAgL1x0
LycgLWkgKi9LY29uZmlnCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEJvcmlzbGF2IFBldGtvdiA8YnBAc3VzZS5kZT4K
Q2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhh
dC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4KQ2M6IHg4Ni1tbCA8eDg2QGtlcm5lbC5vcmc+CkNjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8x
NTc0MzA2NDcwLTEwMzA1LTEtZ2l0LXNlbmQtZW1haWwta3J6a0BrZXJuZWwub3JnCi0tLQogYXJj
aC94ODYvS2NvbmZpZyAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiBhcmNoL3g4Ni94ZW4vS2NvbmZpZyB8ICA4ICsrLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDM4IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDVlODk0OTkuLmQ3YmJlZDUgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtNDM5
LDggKzQzOSw4IEBAIGNvbmZpZyBYODZfTVBQQVJTRQogCSAgKGVzcCB3aXRoIDY0Yml0IGNwdXMp
IHdpdGggYWNwaSBzdXBwb3J0LCBNQURUIGFuZCBEU0RUIHdpbGwgb3ZlcnJpZGUgaXQKIAogY29u
ZmlnIEdPTERGSVNICi0gICAgICAgZGVmX2Jvb2wgeQotICAgICAgIGRlcGVuZHMgb24gWDg2X0dP
TERGSVNICisJZGVmX2Jvb2wgeQorCWRlcGVuZHMgb24gWDg2X0dPTERGSVNICiAKIGNvbmZpZyBS
RVRQT0xJTkUKIAlib29sICJBdm9pZCBzcGVjdWxhdGl2ZSBpbmRpcmVjdCBicmFuY2hlcyBpbiBr
ZXJuZWwiCkBAIC01NjEsOSArNTYxLDkgQEAgY29uZmlnIFg4Nl9VVgogIyBQbGVhc2UgbWFpbnRh
aW4gdGhlIGFscGhhYmV0aWMgb3JkZXIgaWYgYW5kIHdoZW4gdGhlcmUgYXJlIGFkZGl0aW9ucwog
CiBjb25maWcgWDg2X0dPTERGSVNICi0gICAgICAgYm9vbCAiR29sZGZpc2ggKFZpcnR1YWwgUGxh
dGZvcm0pIgotICAgICAgIGRlcGVuZHMgb24gWDg2X0VYVEVOREVEX1BMQVRGT1JNCi0gICAgICAg
LS0taGVscC0tLQorCWJvb2wgIkdvbGRmaXNoIChWaXJ0dWFsIFBsYXRmb3JtKSIKKwlkZXBlbmRz
IG9uIFg4Nl9FWFRFTkRFRF9QTEFURk9STQorCS0tLWhlbHAtLS0KIAkgRW5hYmxlIHN1cHBvcnQg
Zm9yIHRoZSBHb2xkZmlzaCB2aXJ0dWFsIHBsYXRmb3JtIHVzZWQgcHJpbWFyaWx5CiAJIGZvciBB
bmRyb2lkIGRldmVsb3BtZW50LiBVbmxlc3MgeW91IGFyZSBidWlsZGluZyBmb3IgdGhlIEFuZHJv
aWQKIAkgR29sZGZpc2ggZW11bGF0b3Igc2F5IE4gaGVyZS4KQEAgLTgwNiw5ICs4MDYsOSBAQCBj
b25maWcgS1ZNX0dVRVNUCiAJICB0aW1pbmcgaW5mcmFzdHJ1Y3R1cmUgc3VjaCBhcyB0aW1lIG9m
IGRheSwgYW5kIHN5c3RlbSB0aW1lCiAKIGNvbmZpZyBBUkNIX0NQVUlETEVfSEFMVFBPTEwKLSAg
ICAgICAgZGVmX2Jvb2wgbgotICAgICAgICBwcm9tcHQgIkRpc2FibGUgaG9zdCBoYWx0cG9sbCB3
aGVuIGxvYWRpbmcgaGFsdHBvbGwgZHJpdmVyIgotICAgICAgICBoZWxwCisJZGVmX2Jvb2wgbgor
CXByb21wdCAiRGlzYWJsZSBob3N0IGhhbHRwb2xsIHdoZW4gbG9hZGluZyBoYWx0cG9sbCBkcml2
ZXIiCisJaGVscAogCSAgSWYgdmlydHVhbGl6ZWQgdW5kZXIgS1ZNLCBkaXNhYmxlIGhvc3QgaGFs
dHBvbGwuCiAKIGNvbmZpZyBQVkgKQEAgLTg4NywxNiArODg3LDE2IEBAIGNvbmZpZyBIUEVUX0VN
VUxBVEVfUlRDCiAJZGVwZW5kcyBvbiBIUEVUX1RJTUVSICYmIChSVEM9eSB8fCBSVEM9bSB8fCBS
VENfRFJWX0NNT1M9bSB8fCBSVENfRFJWX0NNT1M9eSkKIAogY29uZmlnIEFQQl9USU1FUgotICAg
ICAgIGRlZl9ib29sIHkgaWYgWDg2X0lOVEVMX01JRAotICAgICAgIHByb21wdCAiSW50ZWwgTUlE
IEFQQiBUaW1lciBTdXBwb3J0IiBpZiBYODZfSU5URUxfTUlECi0gICAgICAgc2VsZWN0IERXX0FQ
Ql9USU1FUgotICAgICAgIGRlcGVuZHMgb24gWDg2X0lOVEVMX01JRCAmJiBTRkkKLSAgICAgICBo
ZWxwCi0gICAgICAgICBBUEIgdGltZXIgaXMgdGhlIHJlcGxhY2VtZW50IGZvciA4MjU0LCBIUEVU
IG9uIFg4NiBNSUQgcGxhdGZvcm1zLgotICAgICAgICAgVGhlIEFQQlQgcHJvdmlkZXMgYSBzdGFi
bGUgdGltZSBiYXNlIG9uIFNNUAotICAgICAgICAgc3lzdGVtcywgdW5saWtlIHRoZSBUU0MsIGJ1
dCBpdCBpcyBtb3JlIGV4cGVuc2l2ZSB0byBhY2Nlc3MsCi0gICAgICAgICBhcyBpdCBpcyBvZmYt
Y2hpcC4gQVBCIHRpbWVycyBhcmUgYWx3YXlzIHJ1bm5pbmcgcmVnYXJkbGVzcyBvZiBDUFUKLSAg
ICAgICAgIEMgc3RhdGVzLCB0aGV5IGFyZSB1c2VkIGFzIHBlciBDUFUgY2xvY2tldmVudCBkZXZp
Y2Ugd2hlbiBwb3NzaWJsZS4KKwlkZWZfYm9vbCB5IGlmIFg4Nl9JTlRFTF9NSUQKKwlwcm9tcHQg
IkludGVsIE1JRCBBUEIgVGltZXIgU3VwcG9ydCIgaWYgWDg2X0lOVEVMX01JRAorCXNlbGVjdCBE
V19BUEJfVElNRVIKKwlkZXBlbmRzIG9uIFg4Nl9JTlRFTF9NSUQgJiYgU0ZJCisJaGVscAorCSBB
UEIgdGltZXIgaXMgdGhlIHJlcGxhY2VtZW50IGZvciA4MjU0LCBIUEVUIG9uIFg4NiBNSUQgcGxh
dGZvcm1zLgorCSBUaGUgQVBCVCBwcm92aWRlcyBhIHN0YWJsZSB0aW1lIGJhc2Ugb24gU01QCisJ
IHN5c3RlbXMsIHVubGlrZSB0aGUgVFNDLCBidXQgaXQgaXMgbW9yZSBleHBlbnNpdmUgdG8gYWNj
ZXNzLAorCSBhcyBpdCBpcyBvZmYtY2hpcC4gQVBCIHRpbWVycyBhcmUgYWx3YXlzIHJ1bm5pbmcg
cmVnYXJkbGVzcyBvZiBDUFUKKwkgQyBzdGF0ZXMsIHRoZXkgYXJlIHVzZWQgYXMgcGVyIENQVSBj
bG9ja2V2ZW50IGRldmljZSB3aGVuIHBvc3NpYmxlLgogCiAjIE1hcmsgYXMgZXhwZXJ0IGJlY2F1
c2UgdG9vIG1hbnkgcGVvcGxlIGdvdCBpdCB3cm9uZy4KICMgVGhlIGNvZGUgZGlzYWJsZXMgaXRz
ZWxmIHdoZW4gbm90IG5lZWRlZC4KQEAgLTEwMzUsOCArMTAzNSw4IEBAIGNvbmZpZyBTQ0hFRF9N
Q19QUklPCiAJICBJZiB1bnN1cmUgc2F5IFkgaGVyZS4KIAogY29uZmlnIFVQX0xBVEVfSU5JVAot
ICAgICAgIGRlZl9ib29sIHkKLSAgICAgICBkZXBlbmRzIG9uICFTTVAgJiYgWDg2X0xPQ0FMX0FQ
SUMKKwlkZWZfYm9vbCB5CisJZGVwZW5kcyBvbiAhU01QICYmIFg4Nl9MT0NBTF9BUElDCiAKIGNv
bmZpZyBYODZfVVBfQVBJQwogCWJvb2wgIkxvY2FsIEFQSUMgc3VwcG9ydCBvbiB1bmlwcm9jZXNz
b3JzIiBpZiAhUENJX01TSQpAQCAtMTE4NSw4ICsxMTg1LDggQEAgY29uZmlnIFg4Nl9MRUdBQ1lf
Vk04NgogCSAgSWYgdW5zdXJlLCBzYXkgTiBoZXJlLgogCiBjb25maWcgVk04NgotICAgICAgIGJv
b2wKLSAgICAgICBkZWZhdWx0IFg4Nl9MRUdBQ1lfVk04NgorCWJvb2wKKwlkZWZhdWx0IFg4Nl9M
RUdBQ1lfVk04NgogCiBjb25maWcgWDg2XzE2QklUCiAJYm9vbCAiRW5hYmxlIHN1cHBvcnQgZm9y
IDE2LWJpdCBzZWdtZW50cyIgaWYgRVhQRVJUCkBAIC0xMjA3LDEwICsxMjA3LDEwIEBAIGNvbmZp
ZyBYODZfRVNQRklYNjQKIAlkZXBlbmRzIG9uIFg4Nl8xNkJJVCAmJiBYODZfNjQKIAogY29uZmln
IFg4Nl9WU1lTQ0FMTF9FTVVMQVRJT04KLSAgICAgICBib29sICJFbmFibGUgdnN5c2NhbGwgZW11
bGF0aW9uIiBpZiBFWFBFUlQKLSAgICAgICBkZWZhdWx0IHkKLSAgICAgICBkZXBlbmRzIG9uIFg4
Nl82NAotICAgICAgIC0tLWhlbHAtLS0KKwlib29sICJFbmFibGUgdnN5c2NhbGwgZW11bGF0aW9u
IiBpZiBFWFBFUlQKKwlkZWZhdWx0IHkKKwlkZXBlbmRzIG9uIFg4Nl82NAorCS0tLWhlbHAtLS0K
IAkgVGhpcyBlbmFibGVzIGVtdWxhdGlvbiBvZiB0aGUgbGVnYWN5IHZzeXNjYWxsIHBhZ2UuICBE
aXNhYmxpbmcKIAkgaXQgaXMgcm91Z2hseSBlcXVpdmFsZW50IHRvIGJvb3Rpbmcgd2l0aCB2c3lz
Y2FsbD1ub25lLCBleGNlcHQKIAkgdGhhdCBpdCB3aWxsIGFsc28gZGlzYWJsZSB0aGUgaGVscGZ1
bCB3YXJuaW5nIGlmIGEgcHJvZ3JhbQpAQCAtMTY0OCw5ICsxNjQ4LDkgQEAgY29uZmlnIEFSQ0hf
UFJPQ19LQ09SRV9URVhUCiAJZGVwZW5kcyBvbiBYODZfNjQgJiYgUFJPQ19LQ09SRQogCiBjb25m
aWcgSUxMRUdBTF9QT0lOVEVSX1ZBTFVFCi0gICAgICAgaGV4Ci0gICAgICAgZGVmYXVsdCAwIGlm
IFg4Nl8zMgotICAgICAgIGRlZmF1bHQgMHhkZWFkMDAwMDAwMDAwMDAwIGlmIFg4Nl82NAorCWhl
eAorCWRlZmF1bHQgMCBpZiBYODZfMzIKKwlkZWZhdWx0IDB4ZGVhZDAwMDAwMDAwMDAwMCBpZiBY
ODZfNjQKIAogY29uZmlnIFg4Nl9QTUVNX0xFR0FDWV9ERVZJQ0UKIAlib29sCkBAIC0xOTkxLDEx
ICsxOTkxLDExIEBAIGNvbmZpZyBFRkkKIAkgIHBsYXRmb3Jtcy4KIAogY29uZmlnIEVGSV9TVFVC
Ci0gICAgICAgYm9vbCAiRUZJIHN0dWIgc3VwcG9ydCIKLSAgICAgICBkZXBlbmRzIG9uIEVGSSAm
JiAhWDg2X1VTRV8zRE5PVwotICAgICAgIHNlbGVjdCBSRUxPQ0FUQUJMRQotICAgICAgIC0tLWhl
bHAtLS0KLSAgICAgICAgICBUaGlzIGtlcm5lbCBmZWF0dXJlIGFsbG93cyBhIGJ6SW1hZ2UgdG8g
YmUgbG9hZGVkIGRpcmVjdGx5CisJYm9vbCAiRUZJIHN0dWIgc3VwcG9ydCIKKwlkZXBlbmRzIG9u
IEVGSSAmJiAhWDg2X1VTRV8zRE5PVworCXNlbGVjdCBSRUxPQ0FUQUJMRQorCS0tLWhlbHAtLS0K
KwkgIFRoaXMga2VybmVsIGZlYXR1cmUgYWxsb3dzIGEgYnpJbWFnZSB0byBiZSBsb2FkZWQgZGly
ZWN0bHkKIAkgIGJ5IEVGSSBmaXJtd2FyZSB3aXRob3V0IHRoZSB1c2Ugb2YgYSBib290bG9hZGVy
LgogCiAJICBTZWUgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3QgZm9yIG1v
cmUgaW5mb3JtYXRpb24uCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vS2NvbmZpZyBiL2FyY2gv
eDg2L3hlbi9LY29uZmlnCmluZGV4IGJhNWE0MTguLjFhZGVkNjMgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3hlbi9LY29uZmlnCisrKyBiL2FyY2gveDg2L3hlbi9LY29uZmlnCkBAIC02MiwxMCArNjIs
MTAgQEAgY29uZmlnIFhFTl81MTJHQgogCSAgYm9vdCBwYXJhbWV0ZXIgInhlbl81MTJnYl9saW1p
dCIuCiAKIGNvbmZpZyBYRU5fU0FWRV9SRVNUT1JFCi0gICAgICAgYm9vbAotICAgICAgIGRlcGVu
ZHMgb24gWEVOCi0gICAgICAgc2VsZWN0IEhJQkVSTkFURV9DQUxMQkFDS1MKLSAgICAgICBkZWZh
dWx0IHkKKwlib29sCisJZGVwZW5kcyBvbiBYRU4KKwlzZWxlY3QgSElCRVJOQVRFX0NBTExCQUNL
UworCWRlZmF1bHQgeQogCiBjb25maWcgWEVOX0RFQlVHX0ZTCiAJYm9vbCAiRW5hYmxlIFhlbiBk
ZWJ1ZyBhbmQgdHVuaW5nIHBhcmFtZXRlcnMgaW4gZGVidWdmcyIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
