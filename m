Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E884BDE1C9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 03:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMMUR-0000OU-QR; Mon, 21 Oct 2019 01:28:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VHCT=YO=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iMMUQ-0000OP-FR
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 01:28:06 +0000
X-Inumbo-ID: 06ba41c3-f3a2-11e9-943a-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 06ba41c3-f3a2-11e9-943a-12813bfff9fa;
 Mon, 21 Oct 2019 01:28:04 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Sun, 20 Oct 2019 21:27:55 -0400
Message-ID: <20191021012755.2671-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.27.14.1]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH for-4.13 v3] xen/arm: platform: fix
 Raspberry Pi compatible string
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
Cc: Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCB1cHN0cmVhbSBbMV0gYW5kIGRvd25zdHJlYW0gWzJdIExpbnV4IGtlcm5lbHMgdXNlICJi
cmNtLGJjbTI3MTEiCmFzIHRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgUmFzcGJlcnJ5IFBpIDQu
IEFkZCB0aGlzIHN0cmluZyB0byBvdXIKcGxhdGZvcm0gY29tcGF0aWJsZSBsaXN0LgoKVGhlIGJy
Y20sYmNtMjgzOCBjb252ZW50aW9uIGlzIGFiYW5kb25lZC4gUmVtb3ZlIGl0LgoKUmVuYW1lIHRo
ZSB2YXJpYWJsZXMgd2l0aGluIHRoZSBmaWxlIHRvIGEgcnBpNF8qIHByZWZpeCBzaW5jZSB0aGUg
ZmlsZQppcyBtZWFudCB0byBjb3ZlciB0aGUgUmFzcGJlcnJ5IFBpIDQgcGxhdGZvcm0uCgpJZiB5
b3UgYXJlIHVzaW5nIGEgZGV2aWNlIHRyZWUgd2l0aCB0aGUgb2xkIGNvbXBhdGlibGUgc3RyaW5n
CmJyY20sYmNtMjgzOCwgeW91IHdpbGwgbmVlZCB0byB1cGdyYWRlIHlvdXIgZGV2aWNlIHRyZWUg
dG8gb25lIHRoYXQgaGFzCnRoZSBuZXcgYnJjbSxiY20yNzExIGNvbXBhdGlibGUgc3RyaW5nLgoK
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjU0MDcvClsyXSBodHRw
czovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0LzUzZmRkN2I4YzhjYjljODcx
OTBjYWFiNGZkNDU5Zjg5ZTFiNGE3ZjgKClNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFu
ZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KCi0tLQp2MjoKKiBSZW1vdmUg
YWJhbmRvbmVkIGJjbTI4MzggY29udmVudGlvbgoqIFJlbmFtZSB2YXJpYWJsZXMgd2l0aGluIGZp
bGUgd2l0aCBycGk0XyogcHJlZml4Cgp2MzoKKiBBZGQgbm90ZSB0byBjb21taXQgbWVzc2FnZQoq
IENDIEp1ZXJnZW4KLS0tCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBp
LmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJh
c3BiZXJyeS1waS5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5j
CmluZGV4IGUyMmQyYjMxODQuLmI2OTdmYTJjNmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYworKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L2JyY20tcmFzcGJlcnJ5LXBpLmMKQEAgLTE5LDEzICsxOSwxMyBAQAogCiAjaW5jbHVkZSA8YXNt
L3BsYXRmb3JtLmg+CiAKLXN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBicmNtX2JjbTI4MzhfZHRf
Y29tcGF0W10gX19pbml0Y29uc3QgPQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHJwaTRfZHRf
Y29tcGF0W10gX19pbml0Y29uc3QgPQogewotICAgICJicmNtLGJjbTI4MzgiLAorICAgICJicmNt
LGJjbTI3MTEiLAogICAgIE5VTEwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNl
X21hdGNoIGJyY21fYmNtMjgzOF9ibGFja2xpc3RfZGV2W10gX19pbml0Y29uc3QgPQorc3RhdGlj
IGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggcnBpNF9ibGFja2xpc3RfZGV2W10gX19pbml0
Y29uc3QgPQogewogICAgIC8qCiAgICAgICogVGhlIGF1eCBTUElzIHNoYXJlIGFuIElSUSBhbmQg
YSBwYWdlIHdpdGggdGhlIGF1eCBVQVJULgpAQCAtNDAsOSArNDAsOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGR0X2RldmljZV9tYXRjaCBicmNtX2JjbTI4MzhfYmxhY2tsaXN0X2RldltdIF9faW5p
dGNvbnN0ID0KICAgICB7IC8qIHNlbnRpbmVsICovIH0sCiB9OwogCi1QTEFURk9STV9TVEFSVChi
cmNtX2JjbTI4MzgsICJSYXNwYmVycnkgUGkgNCIpCi0gICAgLmNvbXBhdGlibGUgICAgID0gYnJj
bV9iY20yODM4X2R0X2NvbXBhdCwKLSAgICAuYmxhY2tsaXN0X2RldiAgPSBicmNtX2JjbTI4Mzhf
YmxhY2tsaXN0X2RldiwKK1BMQVRGT1JNX1NUQVJUKHJwaTQsICJSYXNwYmVycnkgUGkgNCIpCisg
ICAgLmNvbXBhdGlibGUgICAgID0gcnBpNF9kdF9jb21wYXQsCisgICAgLmJsYWNrbGlzdF9kZXYg
ID0gcnBpNF9ibGFja2xpc3RfZGV2LAogUExBVEZPUk1fRU5ECiAKIC8qCi0tIAoyLjIzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
