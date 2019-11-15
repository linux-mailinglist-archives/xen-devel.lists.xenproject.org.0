Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A6FFE621
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:03:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhmf-0005YP-Vm; Fri, 15 Nov 2019 20:01:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhme-0005Xr-CH
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:01:32 +0000
X-Inumbo-ID: b2eb62ec-07e2-11ea-adbe-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b2eb62ec-07e2-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 20:01:24 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:01:06 -0500
Message-ID: <20191115200115.44890-3-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 02/11] xen: arm: fix typo in the
 description of struct pending_irq->desc
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Ian Campbell <ian.campbell@citrix.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Julien Grall <julien.grall@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KCnMvaXQvaWYvIG1h
a2VzIG1vcmUgc2Vuc2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gQ2FtcGJlbGwgPGlhbi5jYW1wYmVs
bEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAY2l0
cml4LmNvbT4gWzFdCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUBldS5jaXRyaXguY29tPiBbMl0KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTUtMTEvbXNnMDA5ODYuaHRtbApbMl0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTEyL21z
ZzAyNjQ1Lmh0bWwKCi0tLQp2MzoKICAqIFJlYmFzZSAobm8gY29uZmxpY3RzKQogICogQWRkIFJl
dmlld2VkLWJ5IGFuZCBBY2tlZC1ieSBmcm9tIGEgZmV3IHllYXJzIGFnbwotLS0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vdmdpYy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS92Z2ljLmgg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL3ZnaWMuaAppbmRleCA0NDdkMjRlYTU5Li5jZTFlM2M0YmJk
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3ZnaWMuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3ZnaWMuaApAQCAtNzcsNyArNzcsNyBAQCBzdHJ1Y3QgcGVuZGluZ19pcnEKICNk
ZWZpbmUgR0lDX0lSUV9HVUVTVF9NSUdSQVRJTkcgICA0CiAjZGVmaW5lIEdJQ19JUlFfR1VFU1Rf
UFJJU1RJTkVfTFBJICA1CiAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7Ci0gICAgc3RydWN0IGly
cV9kZXNjICpkZXNjOyAvKiBvbmx5IHNldCBpdCB0aGUgaXJxIGNvcnJlc3BvbmRzIHRvIGEgcGh5
c2ljYWwgaXJxICovCisgICAgc3RydWN0IGlycV9kZXNjICpkZXNjOyAvKiBvbmx5IHNldCBpZiB0
aGUgaXJxIGNvcnJlc3BvbmRzIHRvIGEgcGh5c2ljYWwgaXJxICovCiAgICAgdW5zaWduZWQgaW50
IGlycTsKICNkZWZpbmUgR0lDX0lOVkFMSURfTFIgICAgICAgICAodWludDhfdCl+MAogICAgIHVp
bnQ4X3QgbHI7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
