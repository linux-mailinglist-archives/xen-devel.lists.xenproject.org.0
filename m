Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F013B7E3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYc5-0005ML-3O; Wed, 15 Jan 2020 02:40:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYc3-0005KO-Fh
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:55 +0000
X-Inumbo-ID: 622226d8-3740-11ea-ac27-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 622226d8-3740-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 24F73221FB;
 Tue, 14 Jan 2020 21:40:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=XUoyc5ge8gaoTt+kRNb24DcZvfyliS+0TeVNbGt1z
 Go=; b=POz2yF36uHzf/SR9NODc43HYlKrTD5msV8YN9IdwlMLYv+UyvgIiaV9wj
 uro8X9GGX2h/HCTjEPHfjSndERd/FlE8vc/oV9xRIdUiV/Lg1RUhmHpf0spfeHNk
 03+CwWiRFymX0HLDHzOPDpnt6Zj2Zg1hu/oad4sqBFj2rpW2ivMTFpn9dPElyQiN
 APgotZssDSQB38J4u8KM07hgkEP23u1xnf3wb74W+tiZmw0o/4Uw5vAWPSK4XbO3
 y5/8P1InIXjyT/zPZnzGtUA/hfIH6ZNwT+3EOejKfqeDHj49yjBlRflpKq81XxGf
 66vidmhp2Avg1+ZgikjcLFJe3aEqA==
X-ME-Sender: <xms:mHseXirOn4xQ1FqZdaTmvJSYGjaIysSPePwGnE9afzCMYReQ2g5GKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:mHseXoYHx9ZO5LBK6wp5uR8j90ykobNhwsmbb3N_FsVXt2d2eOMocQ>
 <xmx:mHseXqQTatFdIPbyjRj2_eKQ9ZfqQ9Z_IVyxf4JhaG329pcHfcpuDg>
 <xmx:mHseXv41kdUerKit6OOs2uG_RH7rSseUSqSn_iMj0vBecvSbkZAQLA>
 <xmx:mXseXob14hpvxxsdd9q8TFwmazEc2s1xT3twW_nbOBnmutUfWkBXKA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 162A130607D0;
 Tue, 14 Jan 2020 21:40:23 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:52 +0100
Message-Id: <844c2e98000772126a3168305d692192df90c204.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2Ugd2UgaGF2ZSB0aG9zZSBnZW5lcmF0ZWQgZmlsZXMgY29tbWl0dGVkIHRvIHRoZSByZXBv
ICh3aHk/ISksCnVwZGF0ZSB0aGVtIGFmdGVyIGNoYW5naW5nIGNvbmZpZ3VyZS5hYy4KClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT4KLS0tCiBjb25maWd1cmUgICAgICAgICB8IDE0ICstLS0tLS0tLS0tLS0t
CiBkb2NzL2NvbmZpZ3VyZSAgICB8IDE0ICstLS0tLS0tLS0tLS0tCiBzdHViZG9tL2NvbmZpZ3Vy
ZSB8IDE0ICstLS0tLS0tLS0tLS0tCiB0b29scy9jb25maWcuaC5pbiB8ICAzICsrKwogdG9vbHMv
Y29uZmlndXJlICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQppbmRleCA4M2Y4NGIwLi5lNWQx
NGI3IDEwMDc1NQotLS0gYS9jb25maWd1cmUKKysrIGIvY29uZmlndXJlCkBAIC02NDQsNyArNjQ0
LDYgQEAgaW5mb2RpcgogZG9jZGlyCiBvbGRpbmNsdWRlZGlyCiBpbmNsdWRlZGlyCi1ydW5zdGF0
ZWRpcgogbG9jYWxzdGF0ZWRpcgogc2hhcmVkc3RhdGVkaXIKIHN5c2NvbmZkaXIKQEAgLTcyMyw3
ICs3MjIsNiBAQCBkYXRhZGlyPScke2RhdGFyb290ZGlyfScKIHN5c2NvbmZkaXI9JyR7cHJlZml4
fS9ldGMnCiBzaGFyZWRzdGF0ZWRpcj0nJHtwcmVmaXh9L2NvbScKIGxvY2Fsc3RhdGVkaXI9JyR7
cHJlZml4fS92YXInCi1ydW5zdGF0ZWRpcj0nJHtsb2NhbHN0YXRlZGlyfS9ydW4nCiBpbmNsdWRl
ZGlyPScke3ByZWZpeH0vaW5jbHVkZScKIG9sZGluY2x1ZGVkaXI9Jy91c3IvaW5jbHVkZScKIGRv
Y2Rpcj0nJHtkYXRhcm9vdGRpcn0vZG9jLyR7UEFDS0FHRV9UQVJOQU1FfScKQEAgLTk3NiwxNSAr
OTc0LDYgQEAgZG8KICAgfCAtc2lsZW50IHwgLS1zaWxlbnQgfCAtLXNpbGVuIHwgLS1zaWxlIHwg
LS1zaWwpCiAgICAgc2lsZW50PXllcyA7OwogCi0gIC1ydW5zdGF0ZWRpciB8IC0tcnVuc3RhdGVk
aXIgfCAtLXJ1bnN0YXRlZGkgfCAtLXJ1bnN0YXRlZCBcCi0gIHwgLS1ydW5zdGF0ZSB8IC0tcnVu
c3RhdCB8IC0tcnVuc3RhIHwgLS1ydW5zdCB8IC0tcnVucyBcCi0gIHwgLS1ydW4gfCAtLXJ1IHwg
LS1yKQotICAgIGFjX3ByZXY9cnVuc3RhdGVkaXIgOzsKLSAgLXJ1bnN0YXRlZGlyPSogfCAtLXJ1
bnN0YXRlZGlyPSogfCAtLXJ1bnN0YXRlZGk9KiB8IC0tcnVuc3RhdGVkPSogXAotICB8IC0tcnVu
c3RhdGU9KiB8IC0tcnVuc3RhdD0qIHwgLS1ydW5zdGE9KiB8IC0tcnVuc3Q9KiB8IC0tcnVucz0q
IFwKLSAgfCAtLXJ1bj0qIHwgLS1ydT0qIHwgLS1yPSopCi0gICAgcnVuc3RhdGVkaXI9JGFjX29w
dGFyZyA7OwotCiAgIC1zYmluZGlyIHwgLS1zYmluZGlyIHwgLS1zYmluZGkgfCAtLXNiaW5kIHwg
LS1zYmluIHwgLS1zYmkgfCAtLXNiKQogICAgIGFjX3ByZXY9c2JpbmRpciA7OwogICAtc2JpbmRp
cj0qIHwgLS1zYmluZGlyPSogfCAtLXNiaW5kaT0qIHwgLS1zYmluZD0qIHwgLS1zYmluPSogXApA
QCAtMTEyMiw3ICsxMTExLDcgQEAgZmkKIGZvciBhY192YXIgaW4JZXhlY19wcmVmaXggcHJlZml4
IGJpbmRpciBzYmluZGlyIGxpYmV4ZWNkaXIgZGF0YXJvb3RkaXIgXAogCQlkYXRhZGlyIHN5c2Nv
bmZkaXIgc2hhcmVkc3RhdGVkaXIgbG9jYWxzdGF0ZWRpciBpbmNsdWRlZGlyIFwKIAkJb2xkaW5j
bHVkZWRpciBkb2NkaXIgaW5mb2RpciBodG1sZGlyIGR2aWRpciBwZGZkaXIgcHNkaXIgXAotCQls
aWJkaXIgbG9jYWxlZGlyIG1hbmRpciBydW5zdGF0ZWRpcgorCQlsaWJkaXIgbG9jYWxlZGlyIG1h
bmRpcgogZG8KICAgZXZhbCBhY192YWw9XCQkYWNfdmFyCiAgICMgUmVtb3ZlIHRyYWlsaW5nIHNs
YXNoZXMuCkBAIC0xMjc1LDcgKzEyNjQsNiBAQCBGaW5lIHR1bmluZyBvZiB0aGUgaW5zdGFsbGF0
aW9uIGRpcmVjdG9yaWVzOgogICAtLXN5c2NvbmZkaXI9RElSICAgICAgICByZWFkLW9ubHkgc2lu
Z2xlLW1hY2hpbmUgZGF0YSBbUFJFRklYL2V0Y10KICAgLS1zaGFyZWRzdGF0ZWRpcj1ESVIgICAg
bW9kaWZpYWJsZSBhcmNoaXRlY3R1cmUtaW5kZXBlbmRlbnQgZGF0YSBbUFJFRklYL2NvbV0KICAg
LS1sb2NhbHN0YXRlZGlyPURJUiAgICAgbW9kaWZpYWJsZSBzaW5nbGUtbWFjaGluZSBkYXRhIFtQ
UkVGSVgvdmFyXQotICAtLXJ1bnN0YXRlZGlyPURJUiAgICAgICBtb2RpZmlhYmxlIHBlci1wcm9j
ZXNzIGRhdGEgW0xPQ0FMU1RBVEVESVIvcnVuXQogICAtLWxpYmRpcj1ESVIgICAgICAgICAgICBv
YmplY3QgY29kZSBsaWJyYXJpZXMgW0VQUkVGSVgvbGliXQogICAtLWluY2x1ZGVkaXI9RElSICAg
ICAgICBDIGhlYWRlciBmaWxlcyBbUFJFRklYL2luY2x1ZGVdCiAgIC0tb2xkaW5jbHVkZWRpcj1E
SVIgICAgIEMgaGVhZGVyIGZpbGVzIGZvciBub24tZ2NjIFsvdXNyL2luY2x1ZGVdCmRpZmYgLS1n
aXQgYS9kb2NzL2NvbmZpZ3VyZSBiL2RvY3MvY29uZmlndXJlCmluZGV4IGZkZmMxMTAuLjU5ODgx
M2QgMTAwNzU1Ci0tLSBhL2RvY3MvY29uZmlndXJlCisrKyBiL2RvY3MvY29uZmlndXJlCkBAIC02
MzQsNyArNjM0LDYgQEAgaW5mb2RpcgogZG9jZGlyCiBvbGRpbmNsdWRlZGlyCiBpbmNsdWRlZGly
Ci1ydW5zdGF0ZWRpcgogbG9jYWxzdGF0ZWRpcgogc2hhcmVkc3RhdGVkaXIKIHN5c2NvbmZkaXIK
QEAgLTcxMSw3ICs3MTAsNiBAQCBkYXRhZGlyPScke2RhdGFyb290ZGlyfScKIHN5c2NvbmZkaXI9
JyR7cHJlZml4fS9ldGMnCiBzaGFyZWRzdGF0ZWRpcj0nJHtwcmVmaXh9L2NvbScKIGxvY2Fsc3Rh
dGVkaXI9JyR7cHJlZml4fS92YXInCi1ydW5zdGF0ZWRpcj0nJHtsb2NhbHN0YXRlZGlyfS9ydW4n
CiBpbmNsdWRlZGlyPScke3ByZWZpeH0vaW5jbHVkZScKIG9sZGluY2x1ZGVkaXI9Jy91c3IvaW5j
bHVkZScKIGRvY2Rpcj0nJHtkYXRhcm9vdGRpcn0vZG9jLyR7UEFDS0FHRV9UQVJOQU1FfScKQEAg
LTk2NCwxNSArOTYyLDYgQEAgZG8KICAgfCAtc2lsZW50IHwgLS1zaWxlbnQgfCAtLXNpbGVuIHwg
LS1zaWxlIHwgLS1zaWwpCiAgICAgc2lsZW50PXllcyA7OwogCi0gIC1ydW5zdGF0ZWRpciB8IC0t
cnVuc3RhdGVkaXIgfCAtLXJ1bnN0YXRlZGkgfCAtLXJ1bnN0YXRlZCBcCi0gIHwgLS1ydW5zdGF0
ZSB8IC0tcnVuc3RhdCB8IC0tcnVuc3RhIHwgLS1ydW5zdCB8IC0tcnVucyBcCi0gIHwgLS1ydW4g
fCAtLXJ1IHwgLS1yKQotICAgIGFjX3ByZXY9cnVuc3RhdGVkaXIgOzsKLSAgLXJ1bnN0YXRlZGly
PSogfCAtLXJ1bnN0YXRlZGlyPSogfCAtLXJ1bnN0YXRlZGk9KiB8IC0tcnVuc3RhdGVkPSogXAot
ICB8IC0tcnVuc3RhdGU9KiB8IC0tcnVuc3RhdD0qIHwgLS1ydW5zdGE9KiB8IC0tcnVuc3Q9KiB8
IC0tcnVucz0qIFwKLSAgfCAtLXJ1bj0qIHwgLS1ydT0qIHwgLS1yPSopCi0gICAgcnVuc3RhdGVk
aXI9JGFjX29wdGFyZyA7OwotCiAgIC1zYmluZGlyIHwgLS1zYmluZGlyIHwgLS1zYmluZGkgfCAt
LXNiaW5kIHwgLS1zYmluIHwgLS1zYmkgfCAtLXNiKQogICAgIGFjX3ByZXY9c2JpbmRpciA7Owog
ICAtc2JpbmRpcj0qIHwgLS1zYmluZGlyPSogfCAtLXNiaW5kaT0qIHwgLS1zYmluZD0qIHwgLS1z
YmluPSogXApAQCAtMTExMCw3ICsxMDk5LDcgQEAgZmkKIGZvciBhY192YXIgaW4JZXhlY19wcmVm
aXggcHJlZml4IGJpbmRpciBzYmluZGlyIGxpYmV4ZWNkaXIgZGF0YXJvb3RkaXIgXAogCQlkYXRh
ZGlyIHN5c2NvbmZkaXIgc2hhcmVkc3RhdGVkaXIgbG9jYWxzdGF0ZWRpciBpbmNsdWRlZGlyIFwK
IAkJb2xkaW5jbHVkZWRpciBkb2NkaXIgaW5mb2RpciBodG1sZGlyIGR2aWRpciBwZGZkaXIgcHNk
aXIgXAotCQlsaWJkaXIgbG9jYWxlZGlyIG1hbmRpciBydW5zdGF0ZWRpcgorCQlsaWJkaXIgbG9j
YWxlZGlyIG1hbmRpcgogZG8KICAgZXZhbCBhY192YWw9XCQkYWNfdmFyCiAgICMgUmVtb3ZlIHRy
YWlsaW5nIHNsYXNoZXMuCkBAIC0xMjYzLDcgKzEyNTIsNiBAQCBGaW5lIHR1bmluZyBvZiB0aGUg
aW5zdGFsbGF0aW9uIGRpcmVjdG9yaWVzOgogICAtLXN5c2NvbmZkaXI9RElSICAgICAgICByZWFk
LW9ubHkgc2luZ2xlLW1hY2hpbmUgZGF0YSBbUFJFRklYL2V0Y10KICAgLS1zaGFyZWRzdGF0ZWRp
cj1ESVIgICAgbW9kaWZpYWJsZSBhcmNoaXRlY3R1cmUtaW5kZXBlbmRlbnQgZGF0YSBbUFJFRklY
L2NvbV0KICAgLS1sb2NhbHN0YXRlZGlyPURJUiAgICAgbW9kaWZpYWJsZSBzaW5nbGUtbWFjaGlu
ZSBkYXRhIFtQUkVGSVgvdmFyXQotICAtLXJ1bnN0YXRlZGlyPURJUiAgICAgICBtb2RpZmlhYmxl
IHBlci1wcm9jZXNzIGRhdGEgW0xPQ0FMU1RBVEVESVIvcnVuXQogICAtLWxpYmRpcj1ESVIgICAg
ICAgICAgICBvYmplY3QgY29kZSBsaWJyYXJpZXMgW0VQUkVGSVgvbGliXQogICAtLWluY2x1ZGVk
aXI9RElSICAgICAgICBDIGhlYWRlciBmaWxlcyBbUFJFRklYL2luY2x1ZGVdCiAgIC0tb2xkaW5j
bHVkZWRpcj1ESVIgICAgIEMgaGVhZGVyIGZpbGVzIGZvciBub24tZ2NjIFsvdXNyL2luY2x1ZGVd
CmRpZmYgLS1naXQgYS9zdHViZG9tL2NvbmZpZ3VyZSBiL3N0dWJkb20vY29uZmlndXJlCmluZGV4
IDhmMGJkY2YuLmUyNDQzZTkgMTAwNzU1Ci0tLSBhL3N0dWJkb20vY29uZmlndXJlCisrKyBiL3N0
dWJkb20vY29uZmlndXJlCkBAIC02NjEsNyArNjYxLDYgQEAgaW5mb2RpcgogZG9jZGlyCiBvbGRp
bmNsdWRlZGlyCiBpbmNsdWRlZGlyCi1ydW5zdGF0ZWRpcgogbG9jYWxzdGF0ZWRpcgogc2hhcmVk
c3RhdGVkaXIKIHN5c2NvbmZkaXIKQEAgLTc1MSw3ICs3NTAsNiBAQCBkYXRhZGlyPScke2RhdGFy
b290ZGlyfScKIHN5c2NvbmZkaXI9JyR7cHJlZml4fS9ldGMnCiBzaGFyZWRzdGF0ZWRpcj0nJHtw
cmVmaXh9L2NvbScKIGxvY2Fsc3RhdGVkaXI9JyR7cHJlZml4fS92YXInCi1ydW5zdGF0ZWRpcj0n
JHtsb2NhbHN0YXRlZGlyfS9ydW4nCiBpbmNsdWRlZGlyPScke3ByZWZpeH0vaW5jbHVkZScKIG9s
ZGluY2x1ZGVkaXI9Jy91c3IvaW5jbHVkZScKIGRvY2Rpcj0nJHtkYXRhcm9vdGRpcn0vZG9jLyR7
UEFDS0FHRV9UQVJOQU1FfScKQEAgLTEwMDQsMTUgKzEwMDIsNiBAQCBkbwogICB8IC1zaWxlbnQg
fCAtLXNpbGVudCB8IC0tc2lsZW4gfCAtLXNpbGUgfCAtLXNpbCkKICAgICBzaWxlbnQ9eWVzIDs7
CiAKLSAgLXJ1bnN0YXRlZGlyIHwgLS1ydW5zdGF0ZWRpciB8IC0tcnVuc3RhdGVkaSB8IC0tcnVu
c3RhdGVkIFwKLSAgfCAtLXJ1bnN0YXRlIHwgLS1ydW5zdGF0IHwgLS1ydW5zdGEgfCAtLXJ1bnN0
IHwgLS1ydW5zIFwKLSAgfCAtLXJ1biB8IC0tcnUgfCAtLXIpCi0gICAgYWNfcHJldj1ydW5zdGF0
ZWRpciA7OwotICAtcnVuc3RhdGVkaXI9KiB8IC0tcnVuc3RhdGVkaXI9KiB8IC0tcnVuc3RhdGVk
aT0qIHwgLS1ydW5zdGF0ZWQ9KiBcCi0gIHwgLS1ydW5zdGF0ZT0qIHwgLS1ydW5zdGF0PSogfCAt
LXJ1bnN0YT0qIHwgLS1ydW5zdD0qIHwgLS1ydW5zPSogXAotICB8IC0tcnVuPSogfCAtLXJ1PSog
fCAtLXI9KikKLSAgICBydW5zdGF0ZWRpcj0kYWNfb3B0YXJnIDs7Ci0KICAgLXNiaW5kaXIgfCAt
LXNiaW5kaXIgfCAtLXNiaW5kaSB8IC0tc2JpbmQgfCAtLXNiaW4gfCAtLXNiaSB8IC0tc2IpCiAg
ICAgYWNfcHJldj1zYmluZGlyIDs7CiAgIC1zYmluZGlyPSogfCAtLXNiaW5kaXI9KiB8IC0tc2Jp
bmRpPSogfCAtLXNiaW5kPSogfCAtLXNiaW49KiBcCkBAIC0xMTUwLDcgKzExMzksNyBAQCBmaQog
Zm9yIGFjX3ZhciBpbglleGVjX3ByZWZpeCBwcmVmaXggYmluZGlyIHNiaW5kaXIgbGliZXhlY2Rp
ciBkYXRhcm9vdGRpciBcCiAJCWRhdGFkaXIgc3lzY29uZmRpciBzaGFyZWRzdGF0ZWRpciBsb2Nh
bHN0YXRlZGlyIGluY2x1ZGVkaXIgXAogCQlvbGRpbmNsdWRlZGlyIGRvY2RpciBpbmZvZGlyIGh0
bWxkaXIgZHZpZGlyIHBkZmRpciBwc2RpciBcCi0JCWxpYmRpciBsb2NhbGVkaXIgbWFuZGlyIHJ1
bnN0YXRlZGlyCisJCWxpYmRpciBsb2NhbGVkaXIgbWFuZGlyCiBkbwogICBldmFsIGFjX3ZhbD1c
JCRhY192YXIKICAgIyBSZW1vdmUgdHJhaWxpbmcgc2xhc2hlcy4KQEAgLTEzMDMsNyArMTI5Miw2
IEBAIEZpbmUgdHVuaW5nIG9mIHRoZSBpbnN0YWxsYXRpb24gZGlyZWN0b3JpZXM6CiAgIC0tc3lz
Y29uZmRpcj1ESVIgICAgICAgIHJlYWQtb25seSBzaW5nbGUtbWFjaGluZSBkYXRhIFtQUkVGSVgv
ZXRjXQogICAtLXNoYXJlZHN0YXRlZGlyPURJUiAgICBtb2RpZmlhYmxlIGFyY2hpdGVjdHVyZS1p
bmRlcGVuZGVudCBkYXRhIFtQUkVGSVgvY29tXQogICAtLWxvY2Fsc3RhdGVkaXI9RElSICAgICBt
b2RpZmlhYmxlIHNpbmdsZS1tYWNoaW5lIGRhdGEgW1BSRUZJWC92YXJdCi0gIC0tcnVuc3RhdGVk
aXI9RElSICAgICAgIG1vZGlmaWFibGUgcGVyLXByb2Nlc3MgZGF0YSBbTE9DQUxTVEFURURJUi9y
dW5dCiAgIC0tbGliZGlyPURJUiAgICAgICAgICAgIG9iamVjdCBjb2RlIGxpYnJhcmllcyBbRVBS
RUZJWC9saWJdCiAgIC0taW5jbHVkZWRpcj1ESVIgICAgICAgIEMgaGVhZGVyIGZpbGVzIFtQUkVG
SVgvaW5jbHVkZV0KICAgLS1vbGRpbmNsdWRlZGlyPURJUiAgICAgQyBoZWFkZXIgZmlsZXMgZm9y
IG5vbi1nY2MgWy91c3IvaW5jbHVkZV0KZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZy5oLmluIGIv
dG9vbHMvY29uZmlnLmguaW4KaW5kZXggNWE1OTQ0ZS4uNWFiZjYwOSAxMDA2NDQKLS0tIGEvdG9v
bHMvY29uZmlnLmguaW4KKysrIGIvdG9vbHMvY29uZmlnLmguaW4KQEAgLTEyMyw2ICsxMjMsOSBA
QAogLyogRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIEFOU0kgQyBoZWFkZXIgZmlsZXMuICov
CiAjdW5kZWYgU1REQ19IRUFERVJTCiAKKy8qIFFNUCBwcm94eSBwYXRoICovCisjdW5kZWYgU1RV
QkRPTV9RTVBfUFJPWFlfUEFUSAorCiAvKiBFbmFibGUgbGFyZ2UgaW5vZGUgbnVtYmVycyBvbiBN
YWMgT1MgWCAxMC41LiAgKi8KICNpZm5kZWYgX0RBUldJTl9VU0VfNjRfQklUX0lOT0RFCiAjIGRl
ZmluZSBfREFSV0lOX1VTRV82NF9CSVRfSU5PREUgMQpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmln
dXJlIGIvdG9vbHMvY29uZmlndXJlCmluZGV4IDk3N2E4ODMuLmVmNGI1ZDggMTAwNzU1Ci0tLSBh
L3Rvb2xzL2NvbmZpZ3VyZQorKysgYi90b29scy9jb25maWd1cmUKQEAgLTc3MCw3ICs3NzAsNiBA
QCBpbmZvZGlyCiBkb2NkaXIKIG9sZGluY2x1ZGVkaXIKIGluY2x1ZGVkaXIKLXJ1bnN0YXRlZGly
CiBsb2NhbHN0YXRlZGlyCiBzaGFyZWRzdGF0ZWRpcgogc3lzY29uZmRpcgpAQCAtODExLDYgKzgx
MCw3IEBAIHdpdGhfbGludXhfYmFja2VuZF9tb2R1bGVzCiBlbmFibGVfcWVtdV90cmFkaXRpb25h
bAogZW5hYmxlX3JvbWJpb3MKIHdpdGhfc3lzdGVtX3FlbXUKK3dpdGhfc3R1YmRvbV9xbXBfcHJv
eHkKIHdpdGhfc3lzdGVtX3NlYWJpb3MKIHdpdGhfc3lzdGVtX292bWYKIGVuYWJsZV9pcHhlCkBA
IC04OTYsNyArODk2LDYgQEAgZGF0YWRpcj0nJHtkYXRhcm9vdGRpcn0nCiBzeXNjb25mZGlyPSck
e3ByZWZpeH0vZXRjJwogc2hhcmVkc3RhdGVkaXI9JyR7cHJlZml4fS9jb20nCiBsb2NhbHN0YXRl
ZGlyPScke3ByZWZpeH0vdmFyJwotcnVuc3RhdGVkaXI9JyR7bG9jYWxzdGF0ZWRpcn0vcnVuJwog
aW5jbHVkZWRpcj0nJHtwcmVmaXh9L2luY2x1ZGUnCiBvbGRpbmNsdWRlZGlyPScvdXNyL2luY2x1
ZGUnCiBkb2NkaXI9JyR7ZGF0YXJvb3RkaXJ9L2RvYy8ke1BBQ0tBR0VfVEFSTkFNRX0nCkBAIC0x
MTQ5LDE1ICsxMTQ4LDYgQEAgZG8KICAgfCAtc2lsZW50IHwgLS1zaWxlbnQgfCAtLXNpbGVuIHwg
LS1zaWxlIHwgLS1zaWwpCiAgICAgc2lsZW50PXllcyA7OwogCi0gIC1ydW5zdGF0ZWRpciB8IC0t
cnVuc3RhdGVkaXIgfCAtLXJ1bnN0YXRlZGkgfCAtLXJ1bnN0YXRlZCBcCi0gIHwgLS1ydW5zdGF0
ZSB8IC0tcnVuc3RhdCB8IC0tcnVuc3RhIHwgLS1ydW5zdCB8IC0tcnVucyBcCi0gIHwgLS1ydW4g
fCAtLXJ1IHwgLS1yKQotICAgIGFjX3ByZXY9cnVuc3RhdGVkaXIgOzsKLSAgLXJ1bnN0YXRlZGly
PSogfCAtLXJ1bnN0YXRlZGlyPSogfCAtLXJ1bnN0YXRlZGk9KiB8IC0tcnVuc3RhdGVkPSogXAot
ICB8IC0tcnVuc3RhdGU9KiB8IC0tcnVuc3RhdD0qIHwgLS1ydW5zdGE9KiB8IC0tcnVuc3Q9KiB8
IC0tcnVucz0qIFwKLSAgfCAtLXJ1bj0qIHwgLS1ydT0qIHwgLS1yPSopCi0gICAgcnVuc3RhdGVk
aXI9JGFjX29wdGFyZyA7OwotCiAgIC1zYmluZGlyIHwgLS1zYmluZGlyIHwgLS1zYmluZGkgfCAt
LXNiaW5kIHwgLS1zYmluIHwgLS1zYmkgfCAtLXNiKQogICAgIGFjX3ByZXY9c2JpbmRpciA7Owog
ICAtc2JpbmRpcj0qIHwgLS1zYmluZGlyPSogfCAtLXNiaW5kaT0qIHwgLS1zYmluZD0qIHwgLS1z
YmluPSogXApAQCAtMTI5NSw3ICsxMjg1LDcgQEAgZmkKIGZvciBhY192YXIgaW4JZXhlY19wcmVm
aXggcHJlZml4IGJpbmRpciBzYmluZGlyIGxpYmV4ZWNkaXIgZGF0YXJvb3RkaXIgXAogCQlkYXRh
ZGlyIHN5c2NvbmZkaXIgc2hhcmVkc3RhdGVkaXIgbG9jYWxzdGF0ZWRpciBpbmNsdWRlZGlyIFwK
IAkJb2xkaW5jbHVkZWRpciBkb2NkaXIgaW5mb2RpciBodG1sZGlyIGR2aWRpciBwZGZkaXIgcHNk
aXIgXAotCQlsaWJkaXIgbG9jYWxlZGlyIG1hbmRpciBydW5zdGF0ZWRpcgorCQlsaWJkaXIgbG9j
YWxlZGlyIG1hbmRpcgogZG8KICAgZXZhbCBhY192YWw9XCQkYWNfdmFyCiAgICMgUmVtb3ZlIHRy
YWlsaW5nIHNsYXNoZXMuCkBAIC0xNDQ4LDcgKzE0MzgsNiBAQCBGaW5lIHR1bmluZyBvZiB0aGUg
aW5zdGFsbGF0aW9uIGRpcmVjdG9yaWVzOgogICAtLXN5c2NvbmZkaXI9RElSICAgICAgICByZWFk
LW9ubHkgc2luZ2xlLW1hY2hpbmUgZGF0YSBbUFJFRklYL2V0Y10KICAgLS1zaGFyZWRzdGF0ZWRp
cj1ESVIgICAgbW9kaWZpYWJsZSBhcmNoaXRlY3R1cmUtaW5kZXBlbmRlbnQgZGF0YSBbUFJFRklY
L2NvbV0KICAgLS1sb2NhbHN0YXRlZGlyPURJUiAgICAgbW9kaWZpYWJsZSBzaW5nbGUtbWFjaGlu
ZSBkYXRhIFtQUkVGSVgvdmFyXQotICAtLXJ1bnN0YXRlZGlyPURJUiAgICAgICBtb2RpZmlhYmxl
IHBlci1wcm9jZXNzIGRhdGEgW0xPQ0FMU1RBVEVESVIvcnVuXQogICAtLWxpYmRpcj1ESVIgICAg
ICAgICAgICBvYmplY3QgY29kZSBsaWJyYXJpZXMgW0VQUkVGSVgvbGliXQogICAtLWluY2x1ZGVk
aXI9RElSICAgICAgICBDIGhlYWRlciBmaWxlcyBbUFJFRklYL2luY2x1ZGVdCiAgIC0tb2xkaW5j
bHVkZWRpcj1ESVIgICAgIEMgaGVhZGVyIGZpbGVzIGZvciBub24tZ2NjIFsvdXNyL2luY2x1ZGVd
CkBAIC0xNTMxLDYgKzE1MjAsOSBAQCBPcHRpb25hbCBQYWNrYWdlczoKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVXNlIHN5c3RlbSBzdXBwbGllZCBxZW11IFBBVEggb3IgcWVtdSAodGFrZW4g
ZnJvbQogICAgICAgICAgICAgICAgICAgICAgICAgICAkUEFUSCkgYXMgcWVtdS14ZW4gZGV2aWNl
IG1vZGVsIGluc3RlYWQgb2YgYnVpbGRpbmcKICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5k
IGluc3RhbGxpbmcgb3VyIG93biB2ZXJzaW9uCisgIC0tc3R1YmRvbS1xbXAtcHJveHlbPVBBVEhd
CisgICAgICAgICAgICAgICAgICAgICAgICAgIFVzZSBzdXBwbGllZCBiaW5hcnkgUEFUSCBhcyBh
IFFNUCBwcm94eSBpbnRvCisgICAgICAgICAgICAgICAgICAgICAgICAgIHN0dWJkb21haW4KICAg
LS13aXRoLXN5c3RlbS1zZWFiaW9zWz1QQVRIXQogICAgICAgICAgICAgICAgICAgICAgICAgICBV
c2Ugc3lzdGVtIHN1cHBsaWVkIHNlYWJpb3MgUEFUSCBpbnN0ZWFkIG9mIGJ1aWxkaW5nCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFuZCBpbnN0YWxsaW5nIG91ciBvd24gdmVyc2lvbgpAQCAt
MzM3OCw3ICszMzcwLDcgQEAgZWxzZQogICAgIFdlIGNhbid0IHNpbXBseSBkZWZpbmUgTEFSR0Vf
T0ZGX1QgdG8gYmUgOTIyMzM3MjAzNjg1NDc3NTgwNywKICAgICBzaW5jZSBzb21lIEMrKyBjb21w
aWxlcnMgbWFzcXVlcmFkaW5nIGFzIEMgY29tcGlsZXJzCiAgICAgaW5jb3JyZWN0bHkgcmVqZWN0
IDkyMjMzNzIwMzY4NTQ3NzU4MDcuICAqLwotI2RlZmluZSBMQVJHRV9PRkZfVCAoKCgob2ZmX3Qp
IDEgPDwgMzEpIDw8IDMxKSAtIDEgKyAoKChvZmZfdCkgMSA8PCAzMSkgPDwgMzEpKQorI2RlZmlu
ZSBMQVJHRV9PRkZfVCAoKChvZmZfdCkgMSA8PCA2MikgLSAxICsgKChvZmZfdCkgMSA8PCA2Mikp
CiAgIGludCBvZmZfdF9pc19sYXJnZVsoTEFSR0VfT0ZGX1QgJSAyMTQ3NDgzNjI5ID09IDcyMQog
CQkgICAgICAgJiYgTEFSR0VfT0ZGX1QgJSAyMTQ3NDgzNjQ3ID09IDEpCiAJCSAgICAgID8gMSA6
IC0xXTsKQEAgLTM0MjQsNyArMzQxNiw3IEBAIGVsc2UKICAgICBXZSBjYW4ndCBzaW1wbHkgZGVm
aW5lIExBUkdFX09GRl9UIHRvIGJlIDkyMjMzNzIwMzY4NTQ3NzU4MDcsCiAgICAgc2luY2Ugc29t
ZSBDKysgY29tcGlsZXJzIG1hc3F1ZXJhZGluZyBhcyBDIGNvbXBpbGVycwogICAgIGluY29ycmVj
dGx5IHJlamVjdCA5MjIzMzcyMDM2ODU0Nzc1ODA3LiAgKi8KLSNkZWZpbmUgTEFSR0VfT0ZGX1Qg
KCgoKG9mZl90KSAxIDw8IDMxKSA8PCAzMSkgLSAxICsgKCgob2ZmX3QpIDEgPDwgMzEpIDw8IDMx
KSkKKyNkZWZpbmUgTEFSR0VfT0ZGX1QgKCgob2ZmX3QpIDEgPDwgNjIpIC0gMSArICgob2ZmX3Qp
IDEgPDwgNjIpKQogICBpbnQgb2ZmX3RfaXNfbGFyZ2VbKExBUkdFX09GRl9UICUgMjE0NzQ4MzYy
OSA9PSA3MjEKIAkJICAgICAgICYmIExBUkdFX09GRl9UICUgMjE0NzQ4MzY0NyA9PSAxKQogCQkg
ICAgICA/IDEgOiAtMV07CkBAIC0zNDQ4LDcgKzM0NDAsNyBAQCBybSAtZiBjb3JlIGNvbmZ0ZXN0
LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IGNvbmZ0ZXN0LiRhY19leHQKICAgICBXZSBjYW4ndCBz
aW1wbHkgZGVmaW5lIExBUkdFX09GRl9UIHRvIGJlIDkyMjMzNzIwMzY4NTQ3NzU4MDcsCiAgICAg
c2luY2Ugc29tZSBDKysgY29tcGlsZXJzIG1hc3F1ZXJhZGluZyBhcyBDIGNvbXBpbGVycwogICAg
IGluY29ycmVjdGx5IHJlamVjdCA5MjIzMzcyMDM2ODU0Nzc1ODA3LiAgKi8KLSNkZWZpbmUgTEFS
R0VfT0ZGX1QgKCgoKG9mZl90KSAxIDw8IDMxKSA8PCAzMSkgLSAxICsgKCgob2ZmX3QpIDEgPDwg
MzEpIDw8IDMxKSkKKyNkZWZpbmUgTEFSR0VfT0ZGX1QgKCgob2ZmX3QpIDEgPDwgNjIpIC0gMSAr
ICgob2ZmX3QpIDEgPDwgNjIpKQogICBpbnQgb2ZmX3RfaXNfbGFyZ2VbKExBUkdFX09GRl9UICUg
MjE0NzQ4MzYyOSA9PSA3MjEKIAkJICAgICAgICYmIExBUkdFX09GRl9UICUgMjE0NzQ4MzY0NyA9
PSAxKQogCQkgICAgICA/IDEgOiAtMV07CkBAIC0zNDkzLDcgKzM0ODUsNyBAQCBlbHNlCiAgICAg
V2UgY2FuJ3Qgc2ltcGx5IGRlZmluZSBMQVJHRV9PRkZfVCB0byBiZSA5MjIzMzcyMDM2ODU0Nzc1
ODA3LAogICAgIHNpbmNlIHNvbWUgQysrIGNvbXBpbGVycyBtYXNxdWVyYWRpbmcgYXMgQyBjb21w
aWxlcnMKICAgICBpbmNvcnJlY3RseSByZWplY3QgOTIyMzM3MjAzNjg1NDc3NTgwNy4gICovCi0j
ZGVmaW5lIExBUkdFX09GRl9UICgoKChvZmZfdCkgMSA8PCAzMSkgPDwgMzEpIC0gMSArICgoKG9m
Zl90KSAxIDw8IDMxKSA8PCAzMSkpCisjZGVmaW5lIExBUkdFX09GRl9UICgoKG9mZl90KSAxIDw8
IDYyKSAtIDEgKyAoKG9mZl90KSAxIDw8IDYyKSkKICAgaW50IG9mZl90X2lzX2xhcmdlWyhMQVJH
RV9PRkZfVCAlIDIxNDc0ODM2MjkgPT0gNzIxCiAJCSAgICAgICAmJiBMQVJHRV9PRkZfVCAlIDIx
NDc0ODM2NDcgPT0gMSkKIAkJICAgICAgPyAxIDogLTFdOwpAQCAtMzUxNyw3ICszNTA5LDcgQEAg
cm0gLWYgY29yZSBjb25mdGVzdC5lcnIgY29uZnRlc3QuJGFjX29iamV4dCBjb25mdGVzdC4kYWNf
ZXh0CiAgICAgV2UgY2FuJ3Qgc2ltcGx5IGRlZmluZSBMQVJHRV9PRkZfVCB0byBiZSA5MjIzMzcy
MDM2ODU0Nzc1ODA3LAogICAgIHNpbmNlIHNvbWUgQysrIGNvbXBpbGVycyBtYXNxdWVyYWRpbmcg
YXMgQyBjb21waWxlcnMKICAgICBpbmNvcnJlY3RseSByZWplY3QgOTIyMzM3MjAzNjg1NDc3NTgw
Ny4gICovCi0jZGVmaW5lIExBUkdFX09GRl9UICgoKChvZmZfdCkgMSA8PCAzMSkgPDwgMzEpIC0g
MSArICgoKG9mZl90KSAxIDw8IDMxKSA8PCAzMSkpCisjZGVmaW5lIExBUkdFX09GRl9UICgoKG9m
Zl90KSAxIDw8IDYyKSAtIDEgKyAoKG9mZl90KSAxIDw8IDYyKSkKICAgaW50IG9mZl90X2lzX2xh
cmdlWyhMQVJHRV9PRkZfVCAlIDIxNDc0ODM2MjkgPT0gNzIxCiAJCSAgICAgICAmJiBMQVJHRV9P
RkZfVCAlIDIxNDc0ODM2NDcgPT0gMSkKIAkJICAgICAgPyAxIDogLTFdOwpAQCAtNDUxOSw2ICs0
NTExLDI0IEBAIF9BQ0VPRgogCiAKIAorIyBDaGVjayB3aGV0aGVyIC0td2l0aC1zdHViZG9tLXFt
cC1wcm94eSB3YXMgZ2l2ZW4uCitpZiB0ZXN0ICIke3dpdGhfc3R1YmRvbV9xbXBfcHJveHkrc2V0
fSIgPSBzZXQ7IHRoZW4gOgorICB3aXRodmFsPSR3aXRoX3N0dWJkb21fcW1wX3Byb3h5OworICAg
IHN0dWJkb21fcW1wX3Byb3h5PSIkd2l0aHZhbCIKKworZWxzZQorCisgICAgc3R1YmRvbV9xbXBf
cHJveHk9IiRiaW5kaXIvdmNoYW4tc29ja2V0LXByb3h5IgorCitmaQorCisKK2NhdCA+PmNvbmZk
ZWZzLmggPDxfQUNFT0YKKyNkZWZpbmUgU1RVQkRPTV9RTVBfUFJPWFlfUEFUSCAiJHN0dWJkb21f
cW1wX3Byb3h5IgorX0FDRU9GCisKKworCiAjIENoZWNrIHdoZXRoZXIgLS13aXRoLXN5c3RlbS1z
ZWFiaW9zIHdhcyBnaXZlbi4KIGlmIHRlc3QgIiR7d2l0aF9zeXN0ZW1fc2VhYmlvcytzZXR9IiA9
IHNldDsgdGhlbiA6CiAgIHdpdGh2YWw9JHdpdGhfc3lzdGVtX3NlYWJpb3M7Ci0tIApnaXQtc2Vy
aWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
