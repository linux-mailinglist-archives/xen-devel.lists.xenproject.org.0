Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93323CBE57
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 16:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGP0V-0007gM-S7; Fri, 04 Oct 2019 14:56:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xmxh=X5=kernel.org=krzk@srs-us1.protection.inumbo.net>)
 id 1iGP0U-0007gB-J6
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 14:56:34 +0000
X-Inumbo-ID: 27feacda-e6b7-11e9-975c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27feacda-e6b7-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9147222C0;
 Fri,  4 Oct 2019 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570200993;
 bh=hIPFF5VMuG2Mz/13SIGk14a7hhEIb6Ib26/KDy0UBVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2hKH17bqrpHslxjgS1J/aWaE8hlOnq2RZqnEWPhAH97UgJ69Q0e/TYA4/T0faMShC
 hmvyV2AburVcNMqHY77cZnfcj/+C0P9Xq5YW0XPB1cPYifcjQr2PkI0wK061gsO0hs
 93eZ/JxMGXEkivkhmxHzGQhOqoEZidcSyRmDZxqI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, keyrings@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
 esc.storagedev@microsemi.com, linux-rockchip@lists.infradead.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
 ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri,  4 Oct 2019 16:55:43 +0200
Message-Id: <20191004145544.5066-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004145544.5066-1-krzk@kernel.org>
References: <20191004145544.5066-1-krzk@kernel.org>
Subject: [Xen-devel] [RESEND TRIVIAL 2/3] treewide: Fix Kconfig indentation
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKICAgICQgc2VkIC1lICdz
L14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGNlcnRzL0tjb25maWcgICAgICAgICAgICAg
ICAgICB8IDE0ICsrKysrKy0tLS0tLS0KIGluaXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8
IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBrZXJuZWwvdHJhY2UvS2NvbmZpZyAgICAg
ICAgICAgfCAgOCArKysrLS0tLQogbGliL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGxpYi9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0KIGxpYi9LY29uZmlnLmtnZGIgICAgICAgICAgICAgICB8ICA4ICsr
KystLS0tCiBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQogc2FtcGxlcy9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDIgKy0KIHNl
Y3VyaXR5L2FwcGFybW9yL0tjb25maWcgICAgICB8ICAyICstCiBzZWN1cml0eS9pbnRlZ3JpdHkv
S2NvbmZpZyAgICAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLS0tLQogc2VjdXJpdHkvaW50ZWdy
aXR5L2ltYS9LY29uZmlnIHwgMTIgKysrKysrLS0tLS0tCiBzZWN1cml0eS9zYWZlc2V0aWQvS2Nv
bmZpZyAgICAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLS0tLQogMTIgZmlsZXMgY2hhbmdlZCwg
OTQgaW5zZXJ0aW9ucygrKSwgOTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY2VydHMvS2Nv
bmZpZyBiL2NlcnRzL0tjb25maWcKaW5kZXggYzk0ZTkzZDhiY2NmLi4wMzU4YzY2ZDNkN2MgMTAw
NjQ0Ci0tLSBhL2NlcnRzL0tjb25maWcKKysrIGIvY2VydHMvS2NvbmZpZwpAQCAtNiwxNCArNiwx
NCBAQCBjb25maWcgTU9EVUxFX1NJR19LRVkKIAlkZWZhdWx0ICJjZXJ0cy9zaWduaW5nX2tleS5w
ZW0iCiAJZGVwZW5kcyBvbiBNT0RVTEVfU0lHCiAJaGVscAotICAgICAgICAgUHJvdmlkZSB0aGUg
ZmlsZSBuYW1lIG9mIGEgcHJpdmF0ZSBrZXkvY2VydGlmaWNhdGUgaW4gUEVNIGZvcm1hdCwKLSAg
ICAgICAgIG9yIGEgUEtDUyMxMSBVUkkgYWNjb3JkaW5nIHRvIFJGQzc1MTIuIFRoZSBmaWxlIHNo
b3VsZCBjb250YWluLCBvcgotICAgICAgICAgdGhlIFVSSSBzaG91bGQgaWRlbnRpZnksIGJvdGgg
dGhlIGNlcnRpZmljYXRlIGFuZCBpdHMgY29ycmVzcG9uZGluZwotICAgICAgICAgcHJpdmF0ZSBr
ZXkuCisJIFByb3ZpZGUgdGhlIGZpbGUgbmFtZSBvZiBhIHByaXZhdGUga2V5L2NlcnRpZmljYXRl
IGluIFBFTSBmb3JtYXQsCisJIG9yIGEgUEtDUyMxMSBVUkkgYWNjb3JkaW5nIHRvIFJGQzc1MTIu
IFRoZSBmaWxlIHNob3VsZCBjb250YWluLCBvcgorCSB0aGUgVVJJIHNob3VsZCBpZGVudGlmeSwg
Ym90aCB0aGUgY2VydGlmaWNhdGUgYW5kIGl0cyBjb3JyZXNwb25kaW5nCisJIHByaXZhdGUga2V5
LgogCi0gICAgICAgICBJZiB0aGlzIG9wdGlvbiBpcyB1bmNoYW5nZWQgZnJvbSBpdHMgZGVmYXVs
dCAiY2VydHMvc2lnbmluZ19rZXkucGVtIiwKLSAgICAgICAgIHRoZW4gdGhlIGtlcm5lbCB3aWxs
IGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGUgdGhlIHByaXZhdGUga2V5IGFuZAotICAgICAgICAgY2Vy
dGlmaWNhdGUgYXMgZGVzY3JpYmVkIGluIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW9kdWxl
LXNpZ25pbmcucnN0CisJIElmIHRoaXMgb3B0aW9uIGlzIHVuY2hhbmdlZCBmcm9tIGl0cyBkZWZh
dWx0ICJjZXJ0cy9zaWduaW5nX2tleS5wZW0iLAorCSB0aGVuIHRoZSBrZXJuZWwgd2lsbCBhdXRv
bWF0aWNhbGx5IGdlbmVyYXRlIHRoZSBwcml2YXRlIGtleSBhbmQKKwkgY2VydGlmaWNhdGUgYXMg
ZGVzY3JpYmVkIGluIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW9kdWxlLXNpZ25pbmcucnN0
CiAKIGNvbmZpZyBTWVNURU1fVFJVU1RFRF9LRVlSSU5HCiAJYm9vbCAiUHJvdmlkZSBzeXN0ZW0t
d2lkZSByaW5nIG9mIHRydXN0ZWQga2V5cyIKZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZpZyBiL2lu
aXQvS2NvbmZpZwppbmRleCBiNGRhYWQyYmFjMjMuLmUxYTZmMzFkYTI4MSAxMDA2NDQKLS0tIGEv
aW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtMTY5LDEwICsxNjksMTAgQEAgY29u
ZmlnIEJVSUxEX1NBTFQKICAgICAgICBzdHJpbmcgIkJ1aWxkIElEIFNhbHQiCiAgICAgICAgZGVm
YXVsdCAiIgogICAgICAgIGhlbHAKLSAgICAgICAgICBUaGUgYnVpbGQgSUQgaXMgdXNlZCB0byBs
aW5rIGJpbmFyaWVzIGFuZCB0aGVpciBkZWJ1ZyBpbmZvLiBTZXR0aW5nCi0gICAgICAgICAgdGhp
cyBvcHRpb24gd2lsbCB1c2UgdGhlIHZhbHVlIGluIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgYnVp
bGQgaWQuCi0gICAgICAgICAgVGhpcyBpcyBtb3N0bHkgdXNlZnVsIGZvciBkaXN0cmlidXRpb25z
IHdoaWNoIHdhbnQgdG8gZW5zdXJlIHRoZQotICAgICAgICAgIGJ1aWxkIGlzIHVuaXF1ZSBiZXR3
ZWVuIGJ1aWxkcy4gSXQncyBzYWZlIHRvIGxlYXZlIHRoZSBkZWZhdWx0LgorCSAgVGhlIGJ1aWxk
IElEIGlzIHVzZWQgdG8gbGluayBiaW5hcmllcyBhbmQgdGhlaXIgZGVidWcgaW5mby4gU2V0dGlu
ZworCSAgdGhpcyBvcHRpb24gd2lsbCB1c2UgdGhlIHZhbHVlIGluIHRoZSBjYWxjdWxhdGlvbiBv
ZiB0aGUgYnVpbGQgaWQuCisJICBUaGlzIGlzIG1vc3RseSB1c2VmdWwgZm9yIGRpc3RyaWJ1dGlv
bnMgd2hpY2ggd2FudCB0byBlbnN1cmUgdGhlCisJICBidWlsZCBpcyB1bmlxdWUgYmV0d2VlbiBi
dWlsZHMuIEl0J3Mgc2FmZSB0byBsZWF2ZSB0aGUgZGVmYXVsdC4KIAogY29uZmlnIEhBVkVfS0VS
TkVMX0daSVAKIAlib29sCkBAIC0xMzI3LDkgKzEzMjcsOSBAQCBtZW51Y29uZmlnIEVYUEVSVAog
CXNlbGVjdCBERUJVR19LRVJORUwKIAloZWxwCiAJICBUaGlzIG9wdGlvbiBhbGxvd3MgY2VydGFp
biBiYXNlIGtlcm5lbCBvcHRpb25zIGFuZCBzZXR0aW5ncwotICAgICAgICAgIHRvIGJlIGRpc2Fi
bGVkIG9yIHR3ZWFrZWQuIFRoaXMgaXMgZm9yIHNwZWNpYWxpemVkCi0gICAgICAgICAgZW52aXJv
bm1lbnRzIHdoaWNoIGNhbiB0b2xlcmF0ZSBhICJub24tc3RhbmRhcmQiIGtlcm5lbC4KLSAgICAg
ICAgICBPbmx5IHVzZSB0aGlzIGlmIHlvdSByZWFsbHkga25vdyB3aGF0IHlvdSBhcmUgZG9pbmcu
CisJICB0byBiZSBkaXNhYmxlZCBvciB0d2Vha2VkLiBUaGlzIGlzIGZvciBzcGVjaWFsaXplZAor
CSAgZW52aXJvbm1lbnRzIHdoaWNoIGNhbiB0b2xlcmF0ZSBhICJub24tc3RhbmRhcmQiIGtlcm5l
bC4KKwkgIE9ubHkgdXNlIHRoaXMgaWYgeW91IHJlYWxseSBrbm93IHdoYXQgeW91IGFyZSBkb2lu
Zy4KIAogY29uZmlnIFVJRDE2CiAJYm9vbCAiRW5hYmxlIDE2LWJpdCBVSUQgc3lzdGVtIGNhbGxz
IiBpZiBFWFBFUlQKQEAgLTE0MzksMTEgKzE0MzksMTEgQEAgY29uZmlnIEJVRwogCWJvb2wgIkJV
RygpIHN1cHBvcnQiIGlmIEVYUEVSVAogCWRlZmF1bHQgeQogCWhlbHAKLSAgICAgICAgICBEaXNh
YmxpbmcgdGhpcyBvcHRpb24gZWxpbWluYXRlcyBzdXBwb3J0IGZvciBCVUcgYW5kIFdBUk4sIHJl
ZHVjaW5nCi0gICAgICAgICAgdGhlIHNpemUgb2YgeW91ciBrZXJuZWwgaW1hZ2UgYW5kIHBvdGVu
dGlhbGx5IHF1aWV0bHkgaWdub3JpbmcKLSAgICAgICAgICBudW1lcm91cyBmYXRhbCBjb25kaXRp
b25zLiBZb3Ugc2hvdWxkIG9ubHkgY29uc2lkZXIgZGlzYWJsaW5nIHRoaXMKLSAgICAgICAgICBv
cHRpb24gZm9yIGVtYmVkZGVkIHN5c3RlbXMgd2l0aCBubyBmYWNpbGl0aWVzIGZvciByZXBvcnRp
bmcgZXJyb3JzLgotICAgICAgICAgIEp1c3Qgc2F5IFkuCisJICBEaXNhYmxpbmcgdGhpcyBvcHRp
b24gZWxpbWluYXRlcyBzdXBwb3J0IGZvciBCVUcgYW5kIFdBUk4sIHJlZHVjaW5nCisJICB0aGUg
c2l6ZSBvZiB5b3VyIGtlcm5lbCBpbWFnZSBhbmQgcG90ZW50aWFsbHkgcXVpZXRseSBpZ25vcmlu
ZworCSAgbnVtZXJvdXMgZmF0YWwgY29uZGl0aW9ucy4gWW91IHNob3VsZCBvbmx5IGNvbnNpZGVy
IGRpc2FibGluZyB0aGlzCisJICBvcHRpb24gZm9yIGVtYmVkZGVkIHN5c3RlbXMgd2l0aCBubyBm
YWNpbGl0aWVzIGZvciByZXBvcnRpbmcgZXJyb3JzLgorCSAgSnVzdCBzYXkgWS4KIAogY29uZmln
IEVMRl9DT1JFCiAJZGVwZW5kcyBvbiBDT1JFRFVNUApAQCAtMTQ1OSw4ICsxNDU5LDggQEAgY29u
ZmlnIFBDU1BLUl9QTEFURk9STQogCXNlbGVjdCBJODI1M19MT0NLCiAJZGVmYXVsdCB5CiAJaGVs
cAotICAgICAgICAgIFRoaXMgb3B0aW9uIGFsbG93cyB0byBkaXNhYmxlIHRoZSBpbnRlcm5hbCBQ
Qy1TcGVha2VyCi0gICAgICAgICAgc3VwcG9ydCwgc2F2aW5nIHNvbWUgbWVtb3J5LgorCSAgVGhp
cyBvcHRpb24gYWxsb3dzIHRvIGRpc2FibGUgdGhlIGludGVybmFsIFBDLVNwZWFrZXIKKwkgIHN1
cHBvcnQsIHNhdmluZyBzb21lIG1lbW9yeS4KIAogY29uZmlnIEJBU0VfRlVMTAogCWRlZmF1bHQg
eQpkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL0tjb25maWcgYi9rZXJuZWwvdHJhY2UvS2NvbmZp
ZwppbmRleCBlMDg1MjdmNTBkMmEuLjAzOTMwMDNmMTAyZiAxMDA2NDQKLS0tIGEva2VybmVsL3Ry
YWNlL0tjb25maWcKKysrIGIva2VybmVsL3RyYWNlL0tjb25maWcKQEAgLTc2LDcgKzc2LDcgQEAg
Y29uZmlnIEZUUkFDRV9OTUlfRU5URVIKIAogY29uZmlnIEVWRU5UX1RSQUNJTkcKIAlzZWxlY3Qg
Q09OVEVYVF9TV0lUQ0hfVFJBQ0VSCi0gICAgICAgIHNlbGVjdCBHTE9CCisJc2VsZWN0IEdMT0IK
IAlib29sCiAKIGNvbmZpZyBDT05URVhUX1NXSVRDSF9UUkFDRVIKQEAgLTMwOCw3ICszMDgsNyBA
QCBjb25maWcgVFJBQ0VSX1NOQVBTSE9UCiAJICAgICAgY2F0IHNuYXBzaG90CiAKIGNvbmZpZyBU
UkFDRVJfU05BUFNIT1RfUEVSX0NQVV9TV0FQCi0gICAgICAgIGJvb2wgIkFsbG93IHNuYXBzaG90
IHRvIHN3YXAgcGVyIENQVSIKKwlib29sICJBbGxvdyBzbmFwc2hvdCB0byBzd2FwIHBlciBDUFUi
CiAJZGVwZW5kcyBvbiBUUkFDRVJfU05BUFNIT1QKIAlzZWxlY3QgUklOR19CVUZGRVJfQUxMT1df
U1dBUAogCWhlbHAKQEAgLTY3NSw3ICs2NzUsNyBAQCBjb25maWcgTU1JT1RSQUNFX1RFU1QKIAkg
IFNheSBOLCB1bmxlc3MgeW91IGFic29sdXRlbHkga25vdyB3aGF0IHlvdSBhcmUgZG9pbmcuCiAK
IGNvbmZpZyBUUkFDRVBPSU5UX0JFTkNITUFSSwotICAgICAgICBib29sICJBZGQgdHJhY2Vwb2lu
dCB0aGF0IGJlbmNobWFya3MgdHJhY2Vwb2ludHMiCisJYm9vbCAiQWRkIHRyYWNlcG9pbnQgdGhh
dCBiZW5jaG1hcmtzIHRyYWNlcG9pbnRzIgogCWhlbHAKIAkgVGhpcyBvcHRpb24gY3JlYXRlcyB0
aGUgdHJhY2Vwb2ludCAiYmVuY2htYXJrOmJlbmNobWFya19ldmVudCIuCiAJIFdoZW4gdGhlIHRy
YWNlcG9pbnQgaXMgZW5hYmxlZCwgaXQga2lja3Mgb2ZmIGEga2VybmVsIHRocmVhZCB0aGF0CkBA
IC03MjQsNyArNzI0LDcgQEAgY29uZmlnIFJJTkdfQlVGRkVSX1NUQVJUVVBfVEVTVAogICAgICAg
IGJvb2wgIlJpbmcgYnVmZmVyIHN0YXJ0dXAgc2VsZiB0ZXN0IgogICAgICAgIGRlcGVuZHMgb24g
UklOR19CVUZGRVIKICAgICAgICBoZWxwCi0gICAgICAgICBSdW4gYSBzaW1wbGUgc2VsZiB0ZXN0
IG9uIHRoZSByaW5nIGJ1ZmZlciBvbiBib290IHVwLiBMYXRlIGluIHRoZQorCSBSdW4gYSBzaW1w
bGUgc2VsZiB0ZXN0IG9uIHRoZSByaW5nIGJ1ZmZlciBvbiBib290IHVwLiBMYXRlIGluIHRoZQog
CSBrZXJuZWwgYm9vdCBzZXF1ZW5jZSwgdGhlIHRlc3Qgd2lsbCBzdGFydCB0aGF0IGtpY2tzIG9m
ZgogCSBhIHRocmVhZCBwZXIgY3B1LiBFYWNoIHRocmVhZCB3aWxsIHdyaXRlIHZhcmlvdXMgc2l6
ZSBldmVudHMKIAkgaW50byB0aGUgcmluZyBidWZmZXIuIEFub3RoZXIgdGhyZWFkIGlzIGNyZWF0
ZWQgdG8gc2VuZCBJUElzCmRpZmYgLS1naXQgYS9saWIvS2NvbmZpZyBiL2xpYi9LY29uZmlnCmlu
ZGV4IDE4M2Y5MmEyOTdjYS4uYjdlYjk4MzQyZTM5IDEwMDY0NAotLS0gYS9saWIvS2NvbmZpZwor
KysgYi9saWIvS2NvbmZpZwpAQCAtNTczLDcgKzU3Myw3IEBAIGNvbmZpZyBPSURfUkVHSVNUUlkK
IAkgIEVuYWJsZSBmYXN0IGxvb2t1cCBvYmplY3QgaWRlbnRpZmllciByZWdpc3RyeS4KIAogY29u
ZmlnIFVDUzJfU1RSSU5HCi0gICAgICAgIHRyaXN0YXRlCisJdHJpc3RhdGUKIAogIwogIyBnZW5l
cmljIHZkc28KZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25maWcuZGVi
dWcKaW5kZXggYTAyNTBlNTM5NTRhLi5mOTgzM2VhNTEzODkgMTAwNjQ0Ci0tLSBhL2xpYi9LY29u
ZmlnLmRlYnVnCisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCkBAIC0xMjgsOCArMTI4LDggQEAgY29u
ZmlnIERZTkFNSUNfREVCVUcKIAkgIGxpbmVubyA6IGxpbmUgbnVtYmVyIG9mIHRoZSBkZWJ1ZyBz
dGF0ZW1lbnQKIAkgIG1vZHVsZSA6IG1vZHVsZSB0aGF0IGNvbnRhaW5zIHRoZSBkZWJ1ZyBzdGF0
ZW1lbnQKIAkgIGZ1bmN0aW9uIDogZnVuY3Rpb24gdGhhdCBjb250YWlucyB0aGUgZGVidWcgc3Rh
dGVtZW50Ci0gICAgICAgICAgZmxhZ3MgOiAnPXAnIG1lYW5zIHRoZSBsaW5lIGlzIHR1cm5lZCAn
b24nIGZvciBwcmludGluZwotICAgICAgICAgIGZvcm1hdCA6IHRoZSBmb3JtYXQgdXNlZCBmb3Ig
dGhlIGRlYnVnIHN0YXRlbWVudAorCSAgZmxhZ3MgOiAnPXAnIG1lYW5zIHRoZSBsaW5lIGlzIHR1
cm5lZCAnb24nIGZvciBwcmludGluZworCSAgZm9ybWF0IDogdGhlIGZvcm1hdCB1c2VkIGZvciB0
aGUgZGVidWcgc3RhdGVtZW50CiAKIAkgIEZyb20gYSBsaXZlIHN5c3RlbToKIApAQCAtMTcyLDcg
KzE3Miw3IEBAIGNvbmZpZyBERUJVR19JTkZPCiAJYm9vbCAiQ29tcGlsZSB0aGUga2VybmVsIHdp
dGggZGVidWcgaW5mbyIKIAlkZXBlbmRzIG9uIERFQlVHX0tFUk5FTCAmJiAhQ09NUElMRV9URVNU
CiAJaGVscAotICAgICAgICAgIElmIHlvdSBzYXkgWSBoZXJlIHRoZSByZXN1bHRpbmcga2VybmVs
IGltYWdlIHdpbGwgaW5jbHVkZQorCSAgSWYgeW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGluZyBr
ZXJuZWwgaW1hZ2Ugd2lsbCBpbmNsdWRlCiAJICBkZWJ1Z2dpbmcgaW5mbyByZXN1bHRpbmcgaW4g
YSBsYXJnZXIga2VybmVsIGltYWdlLgogCSAgVGhpcyBhZGRzIGRlYnVnIHN5bWJvbHMgdG8gdGhl
IGtlcm5lbCBhbmQgbW9kdWxlcyAoZ2NjIC1nKSwgYW5kCiAJICBpcyBuZWVkZWQgaWYgeW91IGlu
dGVuZCB0byB1c2Uga2VybmVsIGNyYXNoZHVtcCBvciBiaW5hcnkgb2JqZWN0CkBAIC0yNjksMTMg
KzI2OSwxMyBAQCBjb25maWcgU1RSSVBfQVNNX1NZTVMKIAkgIGdldF93Y2hhbigpIGFuZCBzdWNo
bGlrZS4KIAogY29uZmlnIFJFQURBQkxFX0FTTQotICAgICAgICBib29sICJHZW5lcmF0ZSByZWFk
YWJsZSBhc3NlbWJsZXIgY29kZSIKLSAgICAgICAgZGVwZW5kcyBvbiBERUJVR19LRVJORUwKLSAg
ICAgICAgaGVscAotICAgICAgICAgIERpc2FibGUgc29tZSBjb21waWxlciBvcHRpbWl6YXRpb25z
IHRoYXQgdGVuZCB0byBnZW5lcmF0ZSBodW1hbiB1bnJlYWRhYmxlCi0gICAgICAgICAgYXNzZW1i
bGVyIG91dHB1dC4gVGhpcyBtYXkgbWFrZSB0aGUga2VybmVsIHNsaWdodGx5IHNsb3dlciwgYnV0
IGl0IGhlbHBzCi0gICAgICAgICAgdG8ga2VlcCBrZXJuZWwgZGV2ZWxvcGVycyB3aG8gaGF2ZSB0
byBzdGFyZSBhIGxvdCBhdCBhc3NlbWJsZXIgbGlzdGluZ3MKLSAgICAgICAgICBzYW5lLgorCWJv
b2wgIkdlbmVyYXRlIHJlYWRhYmxlIGFzc2VtYmxlciBjb2RlIgorCWRlcGVuZHMgb24gREVCVUdf
S0VSTkVMCisJaGVscAorCSAgRGlzYWJsZSBzb21lIGNvbXBpbGVyIG9wdGltaXphdGlvbnMgdGhh
dCB0ZW5kIHRvIGdlbmVyYXRlIGh1bWFuIHVucmVhZGFibGUKKwkgIGFzc2VtYmxlciBvdXRwdXQu
IFRoaXMgbWF5IG1ha2UgdGhlIGtlcm5lbCBzbGlnaHRseSBzbG93ZXIsIGJ1dCBpdCBoZWxwcwor
CSAgdG8ga2VlcCBrZXJuZWwgZGV2ZWxvcGVycyB3aG8gaGF2ZSB0byBzdGFyZSBhIGxvdCBhdCBh
c3NlbWJsZXIgbGlzdGluZ3MKKwkgIHNhbmUuCiAKIGNvbmZpZyBERUJVR19GUwogCWJvb2wgIkRl
YnVnIEZpbGVzeXN0ZW0iCkBAIC01MDgsMTEgKzUwOCwxMSBAQCBjb25maWcgREVCVUdfT0JKRUNU
U19QRVJDUFVfQ09VTlRFUgogCiBjb25maWcgREVCVUdfT0JKRUNUU19FTkFCTEVfREVGQVVMVAog
CWludCAiZGVidWdfb2JqZWN0cyBib290dXAgZGVmYXVsdCB2YWx1ZSAoMC0xKSIKLSAgICAgICAg
cmFuZ2UgMCAxCi0gICAgICAgIGRlZmF1bHQgIjEiCi0gICAgICAgIGRlcGVuZHMgb24gREVCVUdf
T0JKRUNUUwotICAgICAgICBoZWxwCi0gICAgICAgICAgRGVidWcgb2JqZWN0cyBib290IHBhcmFt
ZXRlciBkZWZhdWx0IHZhbHVlCisJcmFuZ2UgMCAxCisJZGVmYXVsdCAiMSIKKwlkZXBlbmRzIG9u
IERFQlVHX09CSkVDVFMKKwloZWxwCisJICBEZWJ1ZyBvYmplY3RzIGJvb3QgcGFyYW1ldGVyIGRl
ZmF1bHQgdmFsdWUKIAogY29uZmlnIERFQlVHX1NMQUIKIAlib29sICJEZWJ1ZyBzbGFiIG1lbW9y
eSBhbGxvY2F0aW9ucyIKQEAgLTYzMSw3ICs2MzEsNyBAQCBjb25maWcgREVCVUdfVk0KIAlkZXBl
bmRzIG9uIERFQlVHX0tFUk5FTAogCWhlbHAKIAkgIEVuYWJsZSB0aGlzIHRvIHR1cm4gb24gZXh0
ZW5kZWQgY2hlY2tzIGluIHRoZSB2aXJ0dWFsLW1lbW9yeSBzeXN0ZW0KLSAgICAgICAgICB0aGF0
IG1heSBpbXBhY3QgcGVyZm9ybWFuY2UuCisJICB0aGF0IG1heSBpbXBhY3QgcGVyZm9ybWFuY2Uu
CiAKIAkgIElmIHVuc3VyZSwgc2F5IE4uCiAKQEAgLTE0MjEsNyArMTQyMSw3IEBAIGNvbmZpZyBE
RUJVR19XUV9GT1JDRV9SUl9DUFUKIAkgIGJlIGltcGFjdGVkLgogCiBjb25maWcgREVCVUdfQkxP
Q0tfRVhUX0RFVlQKLSAgICAgICAgYm9vbCAiRm9yY2UgZXh0ZW5kZWQgYmxvY2sgZGV2aWNlIG51
bWJlcnMgYW5kIHNwcmVhZCB0aGVtIgorCWJvb2wgIkZvcmNlIGV4dGVuZGVkIGJsb2NrIGRldmlj
ZSBudW1iZXJzIGFuZCBzcHJlYWQgdGhlbSIKIAlkZXBlbmRzIG9uIERFQlVHX0tFUk5FTAogCWRl
cGVuZHMgb24gQkxPQ0sKIAlkZWZhdWx0IG4KQEAgLTIxNDIsNyArMjE0Miw3IEBAIGNvbmZpZyBE
RUJVR19BSURfRk9SX1NZWkJPVAogICAgICAgIGJvb2wgIkFkZGl0aW9uYWwgZGVidWcgY29kZSBm
b3Igc3l6Ym90IgogICAgICAgIGRlZmF1bHQgbgogICAgICAgIGhlbHAKLSAgICAgICAgIFRoaXMg
b3B0aW9uIGlzIGludGVuZGVkIGZvciB0ZXN0aW5nIGJ5IHN5emJvdC4KKwkgVGhpcyBvcHRpb24g
aXMgaW50ZW5kZWQgZm9yIHRlc3RpbmcgYnkgc3l6Ym90LgogCiBzb3VyY2UgImFyY2gvJChTUkNB
UkNIKS9LY29uZmlnLmRlYnVnIgogCmRpZmYgLS1naXQgYS9saWIvS2NvbmZpZy5rZ2RiIGIvbGli
L0tjb25maWcua2dkYgppbmRleCBiYmUzOTdkZjA0YTMuLjkzMzY4MGI1OWUyZCAxMDA2NDQKLS0t
IGEvbGliL0tjb25maWcua2dkYgorKysgYi9saWIvS2NvbmZpZy5rZ2RiCkBAIC02NCw5ICs2NCw5
IEBAIGNvbmZpZyBLR0RCX0xPV19MRVZFTF9UUkFQCiAgICAgICAgZGVwZW5kcyBvbiBYODYgfHwg
TUlQUwogICAgICAgIGRlZmF1bHQgbgogICAgICAgIGhlbHAKLSAgICAgICAgIFRoaXMgd2lsbCBh
ZGQgYW4gZXh0cmEgY2FsbCBiYWNrIHRvIGtnZGIgZm9yIHRoZSBicmVha3BvaW50Ci0gICAgICAg
ICBleGNlcHRpb24gaGFuZGxlciB3aGljaCB3aWxsIGFsbG93IGtnZGIgdG8gc3RlcCB0aHJvdWdo
IGEKLSAgICAgICAgIG5vdGlmeSBoYW5kbGVyLgorCSBUaGlzIHdpbGwgYWRkIGFuIGV4dHJhIGNh
bGwgYmFjayB0byBrZ2RiIGZvciB0aGUgYnJlYWtwb2ludAorCSBleGNlcHRpb24gaGFuZGxlciB3
aGljaCB3aWxsIGFsbG93IGtnZGIgdG8gc3RlcCB0aHJvdWdoIGEKKwkgbm90aWZ5IGhhbmRsZXIu
CiAKIGNvbmZpZyBLR0RCX0tEQgogCWJvb2wgIktHREJfS0RCOiBpbmNsdWRlIGtkYiBmcm9udGVu
ZCBmb3Iga2dkYiIKQEAgLTk2LDcgKzk2LDcgQEAgY29uZmlnIEtEQl9ERUZBVUxUX0VOQUJMRQog
CiAJICBUaGUgY29uZmlnIG9wdGlvbiBtZXJlbHkgc2V0cyB0aGUgZGVmYXVsdCBhdCBib290IHRp
bWUuIEJvdGgKIAkgIGlzc3VpbmcgJ2VjaG8gWCA+IC9zeXMvbW9kdWxlL2tkYi9wYXJhbWV0ZXJz
L2NtZF9lbmFibGUnIG9yCi0gICAgICAgICAgc2V0dGluZyB3aXRoIGtkYi5jbWRfZW5hYmxlPVgg
a2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb24gd2lsbAorCSAgc2V0dGluZyB3aXRoIGtkYi5jbWRf
ZW5hYmxlPVgga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb24gd2lsbAogCSAgb3ZlcnJpZGUgdGhl
IGRlZmF1bHQgc2V0dGluZ3MuCiAKIGNvbmZpZyBLREJfS0VZQk9BUkQKZGlmZiAtLWdpdCBhL21t
L0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IGE1ZGFlOWE3ZWI1MS4uZTZlMTZkMGVmNTQ0IDEw
MDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTE2MCw5ICsxNjAsOSBA
QCBjb25maWcgTUVNT1JZX0hPVFBMVUdfU1BBUlNFCiAJZGVwZW5kcyBvbiBTUEFSU0VNRU0gJiYg
TUVNT1JZX0hPVFBMVUcKIAogY29uZmlnIE1FTU9SWV9IT1RQTFVHX0RFRkFVTFRfT05MSU5FCi0g
ICAgICAgIGJvb2wgIk9ubGluZSB0aGUgbmV3bHkgYWRkZWQgbWVtb3J5IGJsb2NrcyBieSBkZWZh
dWx0IgotICAgICAgICBkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCi0gICAgICAgIGhlbHAKKwli
b29sICJPbmxpbmUgdGhlIG5ld2x5IGFkZGVkIG1lbW9yeSBibG9ja3MgYnkgZGVmYXVsdCIKKwlk
ZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCisJaGVscAogCSAgVGhpcyBvcHRpb24gc2V0cyB0aGUg
ZGVmYXVsdCBwb2xpY3kgc2V0dGluZyBmb3IgbWVtb3J5IGhvdHBsdWcKIAkgIG9ubGluaW5nIHBv
bGljeSAoL3N5cy9kZXZpY2VzL3N5c3RlbS9tZW1vcnkvYXV0b19vbmxpbmVfYmxvY2tzKSB3aGlj
aAogCSAgZGV0ZXJtaW5lcyB3aGF0IGhhcHBlbnMgdG8gbmV3bHkgYWRkZWQgbWVtb3J5IHJlZ2lv
bnMuIFBvbGljeSBzZXR0aW5nCkBAIC0yMjcsMTQgKzIyNywxNCBAQCBjb25maWcgQ09NUEFDVElP
TgogCXNlbGVjdCBNSUdSQVRJT04KIAlkZXBlbmRzIG9uIE1NVQogCWhlbHAKLSAgICAgICAgICBD
b21wYWN0aW9uIGlzIHRoZSBvbmx5IG1lbW9yeSBtYW5hZ2VtZW50IGNvbXBvbmVudCB0byBmb3Jt
Ci0gICAgICAgICAgaGlnaCBvcmRlciAobGFyZ2VyIHBoeXNpY2FsbHkgY29udGlndW91cykgbWVt
b3J5IGJsb2NrcwotICAgICAgICAgIHJlbGlhYmx5LiBUaGUgcGFnZSBhbGxvY2F0b3IgcmVsaWVz
IG9uIGNvbXBhY3Rpb24gaGVhdmlseSBhbmQKLSAgICAgICAgICB0aGUgbGFjayBvZiB0aGUgZmVh
dHVyZSBjYW4gbGVhZCB0byB1bmV4cGVjdGVkIE9PTSBraWxsZXIKLSAgICAgICAgICBpbnZvY2F0
aW9ucyBmb3IgaGlnaCBvcmRlciBtZW1vcnkgcmVxdWVzdHMuIFlvdSBzaG91bGRuJ3QKLSAgICAg
ICAgICBkaXNhYmxlIHRoaXMgb3B0aW9uIHVubGVzcyB0aGVyZSByZWFsbHkgaXMgYSBzdHJvbmcg
cmVhc29uIGZvcgotICAgICAgICAgIGl0IGFuZCB0aGVuIHdlIHdvdWxkIGJlIHJlYWxseSBpbnRl
cmVzdGVkIHRvIGhlYXIgYWJvdXQgdGhhdCBhdAotICAgICAgICAgIGxpbnV4LW1tQGt2YWNrLm9y
Zy4KKwkgIENvbXBhY3Rpb24gaXMgdGhlIG9ubHkgbWVtb3J5IG1hbmFnZW1lbnQgY29tcG9uZW50
IHRvIGZvcm0KKwkgIGhpZ2ggb3JkZXIgKGxhcmdlciBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMpIG1l
bW9yeSBibG9ja3MKKwkgIHJlbGlhYmx5LiBUaGUgcGFnZSBhbGxvY2F0b3IgcmVsaWVzIG9uIGNv
bXBhY3Rpb24gaGVhdmlseSBhbmQKKwkgIHRoZSBsYWNrIG9mIHRoZSBmZWF0dXJlIGNhbiBsZWFk
IHRvIHVuZXhwZWN0ZWQgT09NIGtpbGxlcgorCSAgaW52b2NhdGlvbnMgZm9yIGhpZ2ggb3JkZXIg
bWVtb3J5IHJlcXVlc3RzLiBZb3Ugc2hvdWxkbid0CisJICBkaXNhYmxlIHRoaXMgb3B0aW9uIHVu
bGVzcyB0aGVyZSByZWFsbHkgaXMgYSBzdHJvbmcgcmVhc29uIGZvcgorCSAgaXQgYW5kIHRoZW4g
d2Ugd291bGQgYmUgcmVhbGx5IGludGVyZXN0ZWQgdG8gaGVhciBhYm91dCB0aGF0IGF0CisJICBs
aW51eC1tbUBrdmFjay5vcmcuCiAKICMKICMgc3VwcG9ydCBmb3IgcGFnZSBtaWdyYXRpb24KQEAg
LTMwMSwxMCArMzAxLDEwIEBAIGNvbmZpZyBLU00KIAkgIHJvb3QgaGFzIHNldCAvc3lzL2tlcm5l
bC9tbS9rc20vcnVuIHRvIDEgKGlmIENPTkZJR19TWVNGUyBpcyBzZXQpLgogCiBjb25maWcgREVG
QVVMVF9NTUFQX01JTl9BRERSCi0gICAgICAgIGludCAiTG93IGFkZHJlc3Mgc3BhY2UgdG8gcHJv
dGVjdCBmcm9tIHVzZXIgYWxsb2NhdGlvbiIKKwlpbnQgIkxvdyBhZGRyZXNzIHNwYWNlIHRvIHBy
b3RlY3QgZnJvbSB1c2VyIGFsbG9jYXRpb24iCiAJZGVwZW5kcyBvbiBNTVUKLSAgICAgICAgZGVm
YXVsdCA0MDk2Ci0gICAgICAgIGhlbHAKKwlkZWZhdWx0IDQwOTYKKwloZWxwCiAJICBUaGlzIGlz
IHRoZSBwb3J0aW9uIG9mIGxvdyB2aXJ0dWFsIG1lbW9yeSB3aGljaCBzaG91bGQgYmUgcHJvdGVj
dGVkCiAJICBmcm9tIHVzZXJzcGFjZSBhbGxvY2F0aW9uLiAgS2VlcGluZyBhIHVzZXIgZnJvbSB3
cml0aW5nIHRvIGxvdyBwYWdlcwogCSAgY2FuIGhlbHAgcmVkdWNlIHRoZSBpbXBhY3Qgb2Yga2Vy
bmVsIE5VTEwgcG9pbnRlciBidWdzLgpkaWZmIC0tZ2l0IGEvc2FtcGxlcy9LY29uZmlnIGIvc2Ft
cGxlcy9LY29uZmlnCmluZGV4IDJjM2UwN2FkZGQzOC4uYzU5MzdjNTE3NWQyIDEwMDY0NAotLS0g
YS9zYW1wbGVzL0tjb25maWcKKysrIGIvc2FtcGxlcy9LY29uZmlnCkBAIC0xMyw3ICsxMyw3IEBA
IGNvbmZpZyBTQU1QTEVfVFJBQ0VfRVZFTlRTCiAJICBUaGlzIGJ1aWxkIHRyYWNlIGV2ZW50IGV4
YW1wbGUgbW9kdWxlcy4KIAogY29uZmlnIFNBTVBMRV9UUkFDRV9QUklOVEsKLSAgICAgICAgdHJp
c3RhdGUgIkJ1aWxkIHRyYWNlX3ByaW50ayBtb2R1bGUgLSB0ZXN0cyB2YXJpb3VzIHRyYWNlX3By
aW50ayBmb3JtYXRzIgorCXRyaXN0YXRlICJCdWlsZCB0cmFjZV9wcmludGsgbW9kdWxlIC0gdGVz
dHMgdmFyaW91cyB0cmFjZV9wcmludGsgZm9ybWF0cyIKIAlkZXBlbmRzIG9uIEVWRU5UX1RSQUNJ
TkcgJiYgbQogCWhlbHAKIAkgVGhpcyBidWlsZHMgYSBtb2R1bGUgdGhhdCBjYWxscyB0cmFjZV9w
cmludGsoKSBhbmQgY2FuIGJlIHVzZWQgdG8KZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2FwcGFybW9y
L0tjb25maWcgYi9zZWN1cml0eS9hcHBhcm1vci9LY29uZmlnCmluZGV4IGE0MjJhMzQ5ZjkyNi4u
MWYwZTcxMmM1ZTUwIDEwMDY0NAotLS0gYS9zZWN1cml0eS9hcHBhcm1vci9LY29uZmlnCisrKyBi
L3NlY3VyaXR5L2FwcGFybW9yL0tjb25maWcKQEAgLTMyLDcgKzMyLDcgQEAgY29uZmlnIFNFQ1VS
SVRZX0FQUEFSTU9SX0hBU0hfREVGQVVMVAogICAgICAgIGRlcGVuZHMgb24gU0VDVVJJVFlfQVBQ
QVJNT1JfSEFTSAogICAgICAgIGRlZmF1bHQgeQogICAgICAgIGhlbHAKLSAgICAgICAgIFRoaXMg
b3B0aW9uIHNlbGVjdHMgd2hldGhlciBzaGExIGhhc2hpbmcgb2YgbG9hZGVkIHBvbGljeQorCSBU
aGlzIG9wdGlvbiBzZWxlY3RzIHdoZXRoZXIgc2hhMSBoYXNoaW5nIG9mIGxvYWRlZCBwb2xpY3kK
IAkgaXMgZW5hYmxlZCBieSBkZWZhdWx0LiBUaGUgZ2VuZXJhdGlvbiBvZiBzaGExIGhhc2hlcyBm
b3IKIAkgbG9hZGVkIHBvbGljeSBwcm92aWRlIHN5c3RlbSBhZG1pbmlzdHJhdG9ycyBhIHF1aWNr
IHdheQogCSB0byB2ZXJpZnkgdGhhdCBwb2xpY3kgaW4gdGhlIGtlcm5lbCBtYXRjaGVzIHdoYXQg
aXMgZXhwZWN0ZWQsCmRpZmYgLS1naXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvS2NvbmZpZyBiL3Nl
Y3VyaXR5L2ludGVncml0eS9LY29uZmlnCmluZGV4IDBiYWU2YWRiNjNhOS4uZjdmMmRmMDgyZjUx
IDEwMDY0NAotLS0gYS9zZWN1cml0eS9pbnRlZ3JpdHkvS2NvbmZpZworKysgYi9zZWN1cml0eS9p
bnRlZ3JpdHkvS2NvbmZpZwpAQCAtMzQsMTAgKzM0LDEwIEBAIGNvbmZpZyBJTlRFR1JJVFlfQVNZ
TU1FVFJJQ19LRVlTCiAJYm9vbCAiRW5hYmxlIGFzeW1tZXRyaWMga2V5cyBzdXBwb3J0IgogCWRl
cGVuZHMgb24gSU5URUdSSVRZX1NJR05BVFVSRQogCWRlZmF1bHQgbgotICAgICAgICBzZWxlY3Qg
QVNZTU1FVFJJQ19LRVlfVFlQRQotICAgICAgICBzZWxlY3QgQVNZTU1FVFJJQ19QVUJMSUNfS0VZ
X1NVQlRZUEUKLSAgICAgICAgc2VsZWN0IENSWVBUT19SU0EKLSAgICAgICAgc2VsZWN0IFg1MDlf
Q0VSVElGSUNBVEVfUEFSU0VSCisJc2VsZWN0IEFTWU1NRVRSSUNfS0VZX1RZUEUKKwlzZWxlY3Qg
QVNZTU1FVFJJQ19QVUJMSUNfS0VZX1NVQlRZUEUKKwlzZWxlY3QgQ1JZUFRPX1JTQQorCXNlbGVj
dCBYNTA5X0NFUlRJRklDQVRFX1BBUlNFUgogCWhlbHAKIAkgIFRoaXMgb3B0aW9uIGVuYWJsZXMg
ZGlnaXRhbCBzaWduYXR1cmUgdmVyaWZpY2F0aW9uIHVzaW5nCiAJICBhc3ltbWV0cmljIGtleXMu
CkBAIC01MywxNCArNTMsMTQgQEAgY29uZmlnIElOVEVHUklUWV9UUlVTVEVEX0tFWVJJTkcKIAkg
ICBrZXlyaW5nLgogCiBjb25maWcgSU5URUdSSVRZX1BMQVRGT1JNX0tFWVJJTkcKLSAgICAgICAg
Ym9vbCAiUHJvdmlkZSBrZXlyaW5nIGZvciBwbGF0Zm9ybS9maXJtd2FyZSB0cnVzdGVkIGtleXMi
Ci0gICAgICAgIGRlcGVuZHMgb24gSU5URUdSSVRZX0FTWU1NRVRSSUNfS0VZUwotICAgICAgICBk
ZXBlbmRzIG9uIFNZU1RFTV9CTEFDS0xJU1RfS0VZUklORwotICAgICAgICBoZWxwCi0gICAgICAg
ICBQcm92aWRlIGEgc2VwYXJhdGUsIGRpc3RpbmN0IGtleXJpbmcgZm9yIHBsYXRmb3JtIHRydXN0
ZWQga2V5cywgd2hpY2gKLSAgICAgICAgIHRoZSBrZXJuZWwgYXV0b21hdGljYWxseSBwb3B1bGF0
ZXMgZHVyaW5nIGluaXRpYWxpemF0aW9uIGZyb20gdmFsdWVzCi0gICAgICAgICBwcm92aWRlZCBi
eSB0aGUgcGxhdGZvcm0gZm9yIHZlcmlmeWluZyB0aGUga2V4ZWMnZWQga2VybmVkIGltYWdlCi0g
ICAgICAgICBhbmQsIHBvc3NpYmx5LCB0aGUgaW5pdHJhbWZzIHNpZ25hdHVyZS4KKwlib29sICJQ
cm92aWRlIGtleXJpbmcgZm9yIHBsYXRmb3JtL2Zpcm13YXJlIHRydXN0ZWQga2V5cyIKKwlkZXBl
bmRzIG9uIElOVEVHUklUWV9BU1lNTUVUUklDX0tFWVMKKwlkZXBlbmRzIG9uIFNZU1RFTV9CTEFD
S0xJU1RfS0VZUklORworCWhlbHAKKwkgUHJvdmlkZSBhIHNlcGFyYXRlLCBkaXN0aW5jdCBrZXly
aW5nIGZvciBwbGF0Zm9ybSB0cnVzdGVkIGtleXMsIHdoaWNoCisJIHRoZSBrZXJuZWwgYXV0b21h
dGljYWxseSBwb3B1bGF0ZXMgZHVyaW5nIGluaXRpYWxpemF0aW9uIGZyb20gdmFsdWVzCisJIHBy
b3ZpZGVkIGJ5IHRoZSBwbGF0Zm9ybSBmb3IgdmVyaWZ5aW5nIHRoZSBrZXhlYydlZCBrZXJuZWQg
aW1hZ2UKKwkgYW5kLCBwb3NzaWJseSwgdGhlIGluaXRyYW1mcyBzaWduYXR1cmUuCiAKIGNvbmZp
ZyBMT0FEX1VFRklfS0VZUwogICAgICAgIGRlcGVuZHMgb24gSU5URUdSSVRZX1BMQVRGT1JNX0tF
WVJJTkcKZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2ludGVncml0eS9pbWEvS2NvbmZpZyBiL3NlY3Vy
aXR5L2ludGVncml0eS9pbWEvS2NvbmZpZwppbmRleCA4Mzg0NzZkNzgwZTUuLmVjOTI1OWJkODEx
NSAxMDA2NDQKLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9LY29uZmlnCisrKyBiL3NlY3Vy
aXR5L2ludGVncml0eS9pbWEvS2NvbmZpZwpAQCAtMTU5LDEzICsxNTksMTMgQEAgY29uZmlnIElN
QV9BUFBSQUlTRQogCSAgSWYgdW5zdXJlLCBzYXkgTi4KIAogY29uZmlnIElNQV9BUkNIX1BPTElD
WQotICAgICAgICBib29sICJFbmFibGUgbG9hZGluZyBhbiBJTUEgYXJjaGl0ZWN0dXJlIHNwZWNp
ZmljIHBvbGljeSIKLSAgICAgICAgZGVwZW5kcyBvbiAoS0VYRUNfU0lHICYmIElNQSkgfHwgSU1B
X0FQUFJBSVNFIFwKKwlib29sICJFbmFibGUgbG9hZGluZyBhbiBJTUEgYXJjaGl0ZWN0dXJlIHNw
ZWNpZmljIHBvbGljeSIKKwlkZXBlbmRzIG9uIChLRVhFQ19TSUcgJiYgSU1BKSB8fCBJTUFfQVBQ
UkFJU0UgXAogCQkgICAmJiBJTlRFR1JJVFlfQVNZTU1FVFJJQ19LRVlTCi0gICAgICAgIGRlZmF1
bHQgbgotICAgICAgICBoZWxwCi0gICAgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBsb2FkaW5n
IGFuIElNQSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcG9saWN5Ci0gICAgICAgICAgYmFzZWQgb24g
cnVuIHRpbWUgc2VjdXJlIGJvb3QgZmxhZ3MuCisJZGVmYXVsdCBuCisJaGVscAorCSAgVGhpcyBv
cHRpb24gZW5hYmxlcyBsb2FkaW5nIGFuIElNQSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcG9saWN5
CisJICBiYXNlZCBvbiBydW4gdGltZSBzZWN1cmUgYm9vdCBmbGFncy4KIAogY29uZmlnIElNQV9B
UFBSQUlTRV9CVUlMRF9QT0xJQ1kKIAlib29sICJJTUEgYnVpbGQgdGltZSBjb25maWd1cmVkIHBv
bGljeSBydWxlcyIKZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NhZmVzZXRpZC9LY29uZmlnIGIvc2Vj
dXJpdHkvc2FmZXNldGlkL0tjb25maWcKaW5kZXggMThiNWZiOTA0MTdiLi5hYjFhMmM2OWIwYjgg
MTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L3NhZmVzZXRpZC9LY29uZmlnCisrKyBiL3NlY3VyaXR5L3Nh
ZmVzZXRpZC9LY29uZmlnCkBAIC0xLDE1ICsxLDE1IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKIGNvbmZpZyBTRUNVUklUWV9TQUZFU0VUSUQKLSAgICAgICAgYm9v
bCAiR2F0ZSBzZXRpZCB0cmFuc2l0aW9ucyB0byBsaW1pdCBDQVBfU0VUe1UvR31JRCBjYXBhYmls
aXRpZXMiCi0gICAgICAgIGRlcGVuZHMgb24gU0VDVVJJVFkKLSAgICAgICAgc2VsZWN0IFNFQ1VS
SVRZRlMKLSAgICAgICAgZGVmYXVsdCBuCi0gICAgICAgIGhlbHAKLSAgICAgICAgICBTYWZlU2V0
SUQgaXMgYW4gTFNNIG1vZHVsZSB0aGF0IGdhdGVzIHRoZSBzZXRpZCBmYW1pbHkgb2Ygc3lzY2Fs
bHMgdG8KLSAgICAgICAgICByZXN0cmljdCBVSUQvR0lEIHRyYW5zaXRpb25zIGZyb20gYSBnaXZl
biBVSUQvR0lEIHRvIG9ubHkgdGhvc2UKLSAgICAgICAgICBhcHByb3ZlZCBieSBhIHN5c3RlbS13
aWRlIHdoaXRlbGlzdC4gVGhlc2UgcmVzdHJpY3Rpb25zIGFsc28gcHJvaGliaXQKLSAgICAgICAg
ICB0aGUgZ2l2ZW4gVUlEcy9HSURzIGZyb20gb2J0YWluaW5nIGF1eGlsaWFyeSBwcml2aWxlZ2Vz
IGFzc29jaWF0ZWQKLSAgICAgICAgICB3aXRoIENBUF9TRVR7VS9HfUlELCBzdWNoIGFzIGFsbG93
aW5nIGEgdXNlciB0byBzZXQgdXAgdXNlciBuYW1lc3BhY2UKLSAgICAgICAgICBVSUQgbWFwcGlu
Z3MuCisJYm9vbCAiR2F0ZSBzZXRpZCB0cmFuc2l0aW9ucyB0byBsaW1pdCBDQVBfU0VUe1UvR31J
RCBjYXBhYmlsaXRpZXMiCisJZGVwZW5kcyBvbiBTRUNVUklUWQorCXNlbGVjdCBTRUNVUklUWUZT
CisJZGVmYXVsdCBuCisJaGVscAorCSAgU2FmZVNldElEIGlzIGFuIExTTSBtb2R1bGUgdGhhdCBn
YXRlcyB0aGUgc2V0aWQgZmFtaWx5IG9mIHN5c2NhbGxzIHRvCisJICByZXN0cmljdCBVSUQvR0lE
IHRyYW5zaXRpb25zIGZyb20gYSBnaXZlbiBVSUQvR0lEIHRvIG9ubHkgdGhvc2UKKwkgIGFwcHJv
dmVkIGJ5IGEgc3lzdGVtLXdpZGUgd2hpdGVsaXN0LiBUaGVzZSByZXN0cmljdGlvbnMgYWxzbyBw
cm9oaWJpdAorCSAgdGhlIGdpdmVuIFVJRHMvR0lEcyBmcm9tIG9idGFpbmluZyBhdXhpbGlhcnkg
cHJpdmlsZWdlcyBhc3NvY2lhdGVkCisJICB3aXRoIENBUF9TRVR7VS9HfUlELCBzdWNoIGFzIGFs
bG93aW5nIGEgdXNlciB0byBzZXQgdXAgdXNlciBuYW1lc3BhY2UKKwkgIFVJRCBtYXBwaW5ncy4K
IAotICAgICAgICAgIElmIHlvdSBhcmUgdW5zdXJlIGhvdyB0byBhbnN3ZXIgdGhpcyBxdWVzdGlv
biwgYW5zd2VyIE4uCisJICBJZiB5b3UgYXJlIHVuc3VyZSBob3cgdG8gYW5zd2VyIHRoaXMgcXVl
c3Rpb24sIGFuc3dlciBOLgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
