Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F2845A9C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjb2-0002kn-Pe; Fri, 14 Jun 2019 10:38:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjb1-0002kK-1Y
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:11 +0000
X-Inumbo-ID: 80fb0cd5-8e90-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80fb0cd5-8e90-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 10:38:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AVrirI8daXA0dQzAAXaa8NjaTk2d7Zm4mRxs89Tz7bdyoget3h9BBpycMUN8Czc8eC+Appupcl
 l++iHw++kOHAr+06CRbq8w6kDJEWtzUkI66YeAyjqwLBbZaHZU2UTSiavcDsB+2+u05FrN8aIm
 qXiTk/e7oep+/Jn2paj9ZvsWxrzfWg2PDVbJpzKphtWNkL30lII53dClkBfxus8RlD28okgI+T
 xTeMAz6ACg4zm9phlwT2PpptuVxbkQjs97tqkPMZ6DaPhvqXmtnrX7xpyOpLZRoX/pvyz2DbqI
 5Wk=
X-SBRS: 2.7
X-MesageID: 1752397
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1752397"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:53 +0100
Message-ID: <20190614103801.22619-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614103801.22619-1-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/9] libxl_internal: Remove lost comment
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhdCBjb21tZW50IGFzIGJlZW4gc2VwYXJhdGVkIGZyb20gdGhlIGZ1bmN0aW9uIGl0IGRlZmlu
ZXMgYnkKNDE5N2QzYWJiYjMwNTVkMzc5ODI1NGViN2JhMjM5YmZiNTgyNDM2MCwgYnV0IHRoZW4g
d2FzIG5vdCB1c2VmdWwKYW55bW9yZSB3aGVuIHRoZSBsaWJ4bF9fZGV2aWNlX2Rpc2tfYWRkKCkg
cHJvdG90eXBlIHdhcyByZW1vdmVkIGJ5CjIyZWE4YWQwMmU0NjVlMzJjZDQwODg3Yzc1MGI1NWMz
YTk5N2EyODguCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2Vk
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAzYmU1YzY0NGMxLi41ZjkwYzIxMGFmIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmgKQEAgLTI3MTgsMTMgKzI3MTgsNiBAQCBzdHJ1Y3QgbGlieGxfX211
bHRpZGV2IHsKICAqICAgICAgICAgICAgICAgICAgIERPTkUuCiAgKi8KIAotLyogQU8gb3BlcmF0
aW9uIHRvIGNvbm5lY3QgYSBkaXNrIGRldmljZSwgY2FsbGVkIGJ5Ci0gKiBsaWJ4bF9kZXZpY2Vf
ZGlza19hZGQgYW5kIGxpYnhsX19hZGRfZGlza3MuIFRoaXMgZnVuY3Rpb24gY2FsbHMKLSAqIGxp
YnhsX193YWl0X2RldmljZV9jb25uZWN0aW9uIHRvIHdhaXQgZm9yIHRoZSBkZXZpY2UgdG8KLSAq
IGZpbmlzaCB0aGUgY29ubmVjdGlvbiAobWlnaHQgaW52b2x2ZSBleGVjdXRpbmcgaG90cGx1ZyBz
Y3JpcHRzKS4KLSAqCi0gKiBPbmNlIGZpbmlzaGVkLCBhb2Rldi0+Y2FsbGJhY2sgd2lsbCBiZSBl
eGVjdXRlZC4KLSAqLwogLyoKICAqIEFzIG9mIFhlbiA0LjUgd2UgbWFpbnRhaW4gdmFyaW91cyBp
bmZvcm1hdGlvbiwgaW5jbHVkaW5nIGhvdHBsdWcKICAqIGRldmljZSBpbmZvcm1hdGlvbiwgaW4g
SlNPTiBmaWxlcywgc28gdGhhdCB3ZSBjYW4gdXNlIHRoaXMgSlNPTgotLSAKQW50aG9ueSBQRVJB
UkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
