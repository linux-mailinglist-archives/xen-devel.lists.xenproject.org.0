Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FF7679F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:36:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0MJ-0006ci-PI; Fri, 26 Jul 2019 13:34:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr0MH-0006cK-NA
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:34:05 +0000
X-Inumbo-ID: 08c1942e-afaa-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08c1942e-afaa-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:34:04 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lcaQZyBmPcwmsn7Nhha0uYIUeOb63EZg01ZtEewazyTiDPPtYXbY57KZvBIp/+1rHXD3fdhugW
 uvEh9C3vUxeh3v2miqIDwqNVejmRMdoiswH6qRuSV6CamUEtoFpXOvZbNpDDJQo3gvvWIubfNh
 j5p5m+S3TWiPYtuREFXjr/mdoOm/qPJmb4KcnuHTpxSf/v+cTiSlQ0ZHMAE7+YOivztGMyJyZk
 nS7qhSpNpkPbeplyZu2Nvy6JBUrYFMiLiIckLiqSTF7FTYOpYQqAkzTfguyQgsB1lAhnLtzW4W
 kQU=
X-SBRS: 2.7
X-MesageID: 3491062
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3491062"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 15:33:29 +0200
Message-ID: <20190726133331.91482-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190726133331.91482-1-roger.pau@citrix.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] kconfig: include default toolchain values
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBjb25maWcvJChPUykubWsgd2hpY2ggY29udGFpbnMgdGhlIGRlZmF1bHQgdmFsdWVz
IGZvciB0aGUKdG9vbGNoYWluIHZhcmlhYmxlcy4gVGhpcyByZW1vdmVzIHRoZSBuZWVkIHRvIHBh
c3MgSE9TVHtDQy9DWFh9IGFzCnBhcmFtZXRlcnMgZnJvbSB0aGUgaGlnaCBsZXZlbCBtYWtlIHRh
cmdldCBvciB0byBkZWZhdWx0IHRoZW0gdG8KZ2NjL2crKyBpZiB1bnNldC4KClNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNjOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Ci0t
LQogeGVuL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0tCiB4ZW4vdG9v
bHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIHwgNyArKystLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZp
bGUgYi94ZW4vTWFrZWZpbGUKaW5kZXggYzgwOTE0YzMxZC4uZTlmNzAwZjllNyAxMDA2NDQKLS0t
IGEveGVuL01ha2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtMjY3LDE0ICsyNjcsMTQgQEAg
a2NvbmZpZyA6PSBzaWxlbnRvbGRjb25maWcgb2xkY29uZmlnIGNvbmZpZyBtZW51Y29uZmlnIGRl
ZmNvbmZpZyBcCiAJcmFuZGNvbmZpZyAkKG5vdGRpciAkKHdpbGRjYXJkIGFyY2gvJChTUkNBUkNI
KS9jb25maWdzLypfZGVmY29uZmlnKSkKIC5QSE9OWTogJChrY29uZmlnKQogJChrY29uZmlnKToK
LQkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEFS
Q0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9TVENDPSIkKEhPU1RDQykiIEhPU1RDWFg9
IiQoSE9TVENYWCkiICRACisJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFr
ZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpICRACiAKIGluY2x1
ZGUvY29uZmlnLyUuY29uZjogaW5jbHVkZS9jb25maWcvYXV0by5jb25mLmNtZCAkKEtDT05GSUdf
Q09ORklHKQotCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtj
b25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIg
SE9TVENYWD0iJChIT1NUQ1hYKSIgc2lsZW50b2xkY29uZmlnCisJJChNQUtFKSAtZiAkKEJBU0VE
SVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0k
KFNSQ0FSQ0gpIHNpbGVudG9sZGNvbmZpZwogCiAjIEFsbG93IHBlb3BsZSB0byBqdXN0IHJ1biBg
bWFrZWAgYXMgYmVmb3JlIGFuZCBub3QgZm9yY2UgdGhlbSB0byBjb25maWd1cmUKICQoS0NPTkZJ
R19DT05GSUcpOgotCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxl
Lmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVEND
KSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgZGVmY29uZmlnCisJJChNQUtFKSAtZiAkKEJBU0VESVIp
L3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNS
Q0FSQ0gpIGRlZmNvbmZpZwogCiAjIEJyZWFrIHRoZSBkZXBlbmRlbmN5IGNoYWluIGZvciB0aGUg
Zmlyc3QgcnVuCiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYuY21kOiA7CmRpZmYgLS1naXQgYS94
ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIGIveGVuL3Rvb2xzL2tjb25maWcvTWFr
ZWZpbGUua2NvbmZpZwppbmRleCBkYmQ4OTEyMDE1Li4xMzhiZjNmMWI3IDEwMDY0NAotLS0gYS94
ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnCisrKyBiL3hlbi90b29scy9rY29uZmln
L01ha2VmaWxlLmtjb25maWcKQEAgLTM1LDE1ICszNSwxNCBAQCBLQlVJTERfREVGQ09ORklHIDo9
ICQoQVJDSClfZGVmY29uZmlnCiAjIHByb3ZpZGUgb3VyIHNoZWxsCiBDT05GSUdfU0hFTEwgOj0g
JChTSEVMTCkKIAotIyBwcm92aWRlIHRoZSBob3N0IGNvbXBpbGVyCi1IT1NUQ0MgPz0gZ2NjCi1I
T1NUQ1hYID89IGcrKwotCiAjIGZvcmNlIHRhcmdldAogUEhPTlkgKz0gRk9SQ0UKIAogRk9SQ0U6
CiAKKyMgU2V0cyB0b29sY2hhaW4gYmluYXJpZXMgdG8gdXNlCitpbmNsdWRlICQoWEVOX1JPT1Qp
L2NvbmZpZy8kKHNoZWxsIHVuYW1lIC1zKS5taworCiAjIGluY2x1ZGUgdGhlIG9yaWdpbmFsIE1h
a2VmaWxlIGFuZCBNYWtlZmlsZS5ob3N0IGZyb20gTGludXgKIGluY2x1ZGUgJChzcmMpL01ha2Vm
aWxlCiBpbmNsdWRlICQoc3JjKS9NYWtlZmlsZS5ob3N0Ci0tIAoyLjIwLjEgKEFwcGxlIEdpdC0x
MTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
