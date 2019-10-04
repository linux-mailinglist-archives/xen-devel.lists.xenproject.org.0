Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F29CB2CF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 02:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGBlG-0006nw-NE; Fri, 04 Oct 2019 00:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=raGW=X5=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iGBlF-0006no-KJ
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 00:47:57 +0000
X-Inumbo-ID: 97c34892-e640-11e9-973b-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 97c34892-e640-11e9-973b-12813bfff9fa;
 Fri, 04 Oct 2019 00:47:53 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 20:47:45 -0400
Message-ID: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.27.13.130]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=4.3 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
ZmlsZQppcyBtZWFudCB0byBjb3ZlciB0aGUgUmFzcGJlcnJ5IFBpIDQgcGxhdGZvcm0uCgpbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NTQwNy8KWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9jb21taXQvNTNmZGQ3YjhjOGNiOWM4NzE5MGNh
YWI0ZmQ0NTlmODllMWI0YTdmOAoKU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxz
dGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgotLS0KIHhlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMKaW5kZXggZTIyZDJiMzE4NC4uYjY5N2ZhMmM2YyAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jCisrKyBi
L3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYwpAQCAtMTksMTMgKzE5
LDEzIEBACiAKICNpbmNsdWRlIDxhc20vcGxhdGZvcm0uaD4KIAotc3RhdGljIGNvbnN0IGNoYXIg
KmNvbnN0IGJyY21fYmNtMjgzOF9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9CitzdGF0aWMgY29u
c3QgY2hhciAqY29uc3QgcnBpNF9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9CiB7Ci0gICAgImJy
Y20sYmNtMjgzOCIsCisgICAgImJyY20sYmNtMjcxMSIsCiAgICAgTlVMTAogfTsKIAotc3RhdGlj
IGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggYnJjbV9iY20yODM4X2JsYWNrbGlzdF9kZXZb
XSBfX2luaXRjb25zdCA9CitzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCBycGk0
X2JsYWNrbGlzdF9kZXZbXSBfX2luaXRjb25zdCA9CiB7CiAgICAgLyoKICAgICAgKiBUaGUgYXV4
IFNQSXMgc2hhcmUgYW4gSVJRIGFuZCBhIHBhZ2Ugd2l0aCB0aGUgYXV4IFVBUlQuCkBAIC00MCw5
ICs0MCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIGJyY21fYmNtMjgz
OF9ibGFja2xpc3RfZGV2W10gX19pbml0Y29uc3QgPQogICAgIHsgLyogc2VudGluZWwgKi8gfSwK
IH07CiAKLVBMQVRGT1JNX1NUQVJUKGJyY21fYmNtMjgzOCwgIlJhc3BiZXJyeSBQaSA0IikKLSAg
ICAuY29tcGF0aWJsZSAgICAgPSBicmNtX2JjbTI4MzhfZHRfY29tcGF0LAotICAgIC5ibGFja2xp
c3RfZGV2ICA9IGJyY21fYmNtMjgzOF9ibGFja2xpc3RfZGV2LAorUExBVEZPUk1fU1RBUlQocnBp
NCwgIlJhc3BiZXJyeSBQaSA0IikKKyAgICAuY29tcGF0aWJsZSAgICAgPSBycGk0X2R0X2NvbXBh
dCwKKyAgICAuYmxhY2tsaXN0X2RldiAgPSBycGk0X2JsYWNrbGlzdF9kZXYsCiBQTEFURk9STV9F
TkQKIAogLyoKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
