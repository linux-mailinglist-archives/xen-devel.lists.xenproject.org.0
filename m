Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A956B78
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8P7-0007IT-32; Wed, 26 Jun 2019 13:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8P5-0007Hn-I5
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:56:03 +0000
X-Inumbo-ID: 20f9974c-981a-11e9-89cf-0fb0cceb9b67
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20f9974c-981a-11e9-89cf-0fb0cceb9b67;
 Wed, 26 Jun 2019 13:56:00 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KcNCwSPt9qydr6/xzu4726/LvJrfo05HB4UajRFy5OaAnumXAGAfanTN5eGqr14pqGyXxjWtFd
 DA2GFcBTJ/WXHvVONtnHu6yNHcadibVLKalUPO9fiug3soCdC8Mt3lUrUv5HxQpcmfFP28zDZA
 m4r9idmZ7LgrSSiCrpBA73+Pn+oMftDfaJAWbNWjFCU48PjnXMO/qoDPFSTpeQvo3LG3ePWVDO
 QRyQPNedhedb/VKfGcaAkJS4sT6QLpntTPchH6HgKbwMKGBtw5ufjBH0nmF/zywDF5dHJp9jAu
 sbM=
X-SBRS: 2.7
X-MesageID: 2273616
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2273616"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:44 +0200
Message-ID: <20190626135546.50665-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190626135546.50665-1-roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/5] kconfig: include default toolchain values
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
cmdldC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBL
b25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+Ci0tLQogeGVuL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8
IDYgKysrLS0tCiB4ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIHwgNyArKystLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUKaW5kZXggM2UzZDA4ZDFjYy4uNjIw
YWY3ODgzYyAxMDA2NDQKLS0tIGEveGVuL01ha2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpAQCAt
MjY3LDE0ICsyNjcsMTQgQEAga2NvbmZpZyA6PSBzaWxlbnRvbGRjb25maWcgb2xkY29uZmlnIGNv
bmZpZyBtZW51Y29uZmlnIGRlZmNvbmZpZyBcCiAJcmFuZGNvbmZpZyAkKG5vdGRpciAkKHdpbGRj
YXJkIGFyY2gvJChTUkNBUkNIKS9jb25maWdzLypfZGVmY29uZmlnKSkKIC5QSE9OWTogJChrY29u
ZmlnKQogJChrY29uZmlnKToKLQkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9N
YWtlZmlsZS5rY29uZmlnIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiAk
QAorCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcg
JEAKIAogaW5jbHVkZS9jb25maWcvJS5jb25mOiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYuY21k
ICQoS0NPTkZJR19DT05GSUcpCi0JJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcv
TWFrZWZpbGUua2NvbmZpZyBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIg
c2lsZW50b2xkY29uZmlnCisJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFr
ZWZpbGUua2NvbmZpZyBzaWxlbnRvbGRjb25maWcKIAogIyBBbGxvdyBwZW9wbGUgdG8ganVzdCBy
dW4gYG1ha2VgIGFzIGJlZm9yZSBhbmQgbm90IGZvcmNlIHRoZW0gdG8gY29uZmlndXJlCiAkKEtD
T05GSUdfQ09ORklHKToKLQkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtl
ZmlsZS5rY29uZmlnIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBkZWZj
b25maWcKKwkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29u
ZmlnIGRlZmNvbmZpZwogCiAjIEJyZWFrIHRoZSBkZXBlbmRlbmN5IGNoYWluIGZvciB0aGUgZmly
c3QgcnVuCiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYuY21kOiA7CmRpZmYgLS1naXQgYS94ZW4v
dG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIGIveGVuL3Rvb2xzL2tjb25maWcvTWFrZWZp
bGUua2NvbmZpZwppbmRleCBkYmQ4OTEyMDE1Li4xMzhiZjNmMWI3IDEwMDY0NAotLS0gYS94ZW4v
dG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnCisrKyBiL3hlbi90b29scy9rY29uZmlnL01h
a2VmaWxlLmtjb25maWcKQEAgLTM1LDE1ICszNSwxNCBAQCBLQlVJTERfREVGQ09ORklHIDo9ICQo
QVJDSClfZGVmY29uZmlnCiAjIHByb3ZpZGUgb3VyIHNoZWxsCiBDT05GSUdfU0hFTEwgOj0gJChT
SEVMTCkKIAotIyBwcm92aWRlIHRoZSBob3N0IGNvbXBpbGVyCi1IT1NUQ0MgPz0gZ2NjCi1IT1NU
Q1hYID89IGcrKwotCiAjIGZvcmNlIHRhcmdldAogUEhPTlkgKz0gRk9SQ0UKIAogRk9SQ0U6CiAK
KyMgU2V0cyB0b29sY2hhaW4gYmluYXJpZXMgdG8gdXNlCitpbmNsdWRlICQoWEVOX1JPT1QpL2Nv
bmZpZy8kKHNoZWxsIHVuYW1lIC1zKS5taworCiAjIGluY2x1ZGUgdGhlIG9yaWdpbmFsIE1ha2Vm
aWxlIGFuZCBNYWtlZmlsZS5ob3N0IGZyb20gTGludXgKIGluY2x1ZGUgJChzcmMpL01ha2VmaWxl
CiBpbmNsdWRlICQoc3JjKS9NYWtlZmlsZS5ob3N0Ci0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcp
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
