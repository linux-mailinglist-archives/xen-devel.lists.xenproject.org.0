Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A17332D5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXoId-0002Io-PS; Mon, 03 Jun 2019 14:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oBRP=UC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hXoIb-0002Ih-Vs
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:50:58 +0000
X-Inumbo-ID: fb7aa9e2-860e-11e9-bbe0-3f3d6327361d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb7aa9e2-860e-11e9-bbe0-3f3d6327361d;
 Mon, 03 Jun 2019 14:50:52 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: HT3IU51kMMtEKVYrprJrtj3fBjweL/5Bf5LdxyIRcQ6rv8U62nk5pEZT3mioKTVyDrvo9sKkH0
 D37AVq7biYyONUWDNhd0APk4MarQ6iHElzVZQ70lT92FCZkwbPnCw+sQJmW3QPMj3O+3DbNU8a
 ODqqLqzuIA187VbN3MFbG32HgvTYz/vHMFDsJgT8+/b3kOQYxDJqA5Utqysv8HTa4elqcxDLO/
 AzmDfI+azdoi2fJ19xatx5YKMZ1oq9jtmopntPTg5OLcC/F38hIvrj60PUCkDonIqNxP4P5UJQ
 uyU=
X-SBRS: 2.7
X-MesageID: 1221534
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1221534"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23797.13227.269108.213334@mariner.uk.xensource.com>
Date: Mon, 3 Jun 2019 15:50:19 +0100
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190521212530.12706-11-volodymyr_babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-11-volodymyr_babchuk@epam.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v5 10/10] tools/arm: optee: create optee
 firmware node in DT if tee=optee
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vm9sb2R5bXlyIEJhYmNodWsgd3JpdGVzICgiW1hlbi1kZXZlbF0gW1BBVENIIHY1IDEwLzEwXSB0
b29scy9hcm06IG9wdGVlOiBjcmVhdGUgb3B0ZWUgZmlybXdhcmUgbm9kZSBpbiBEVCBpZiB0ZWU9
b3B0ZWUiKToKPiBJZiBURUUgc3VwcG9ydCBpcyBlbmFibGVkIHdpdGggInRlZT1vcHRlZSIgb3B0
aW9uIGluIHhsLmNmZywKPiB0aGVuIHdlIG5lZWQgdG8gaW5mb3JtIGd1ZXN0IGFib3V0IGF2YWls
YWJsZSBURUUsIGJ5IGNyZWF0aW5nCj4gY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBndWVzdCdz
IGRldmljZSB0cmVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KCihyZWx5aW5nIG9uIEp1bGllbidzIHJldmlldyBmb3IgdGhlIGFjdHVhbCBE
VCBkZXRhaWxzKS4KCgpMb29raW5nIGF0IHRoaXMsIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkg
dGhlIGZkdCBwYXJhbWV0ZXIgdG8gYWxsCnRoZXNlIGZ1bmN0aW9ucyBpcyBhIHZvaWQqLiAgV2h5
IGRvZXMgbGliZmR0IG5vdCBpbnRyb2R1Y2UgYQpzdHJ1Y3Qgb3Igc29tZXRoaW5nID8gIChUaGlz
IGlzIGJ5IG5vIG1lYW5zIGEgYmxvY2tlciBmb3IgdGhpcyBwYXRjaC4pCgpUaGFua3MsCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
