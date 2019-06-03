Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BD332C3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXoFm-0001Po-UV; Mon, 03 Jun 2019 14:48:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oBRP=UC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hXoFm-0001Pj-7M
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:48:02 +0000
X-Inumbo-ID: 94424348-860e-11e9-9ebf-d3b4fb52fecc
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94424348-860e-11e9-9ebf-d3b4fb52fecc;
 Mon, 03 Jun 2019 14:47:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: DcjiOx+KdQfuJzRUBkpBu8tCihA1sfhvfolnOuscpgaYBOAzfnE59EGAe//+qHhfz7TCu2BRQg
 +uCbUdG8py14oVGSWlD9yGjGQqR5TM9x5Ab/5HpQuA71ESSaIPJgPTBtVC+PzJa7KLp8z2JftD
 baU2+tRRT5/PVkZ4SByhV//iC4DR9CvoZLPCtU4KqmFQvORC/jXcozywH1zBWaxyuI84iEJ6bu
 LiAHDh3Qy0hlUg6Kr7SWM7PpV0jlz6MejsN0fGlHwPH7UWvCv3AmJdlJZqZBTgjSpneHDTM1Sy
 CjQ=
X-SBRS: 2.7
X-MesageID: 1214579
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1214579"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23797.13054.100903.540173@mariner.uk.xensource.com>
Date: Mon, 3 Jun 2019 15:47:26 +0100
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190521212530.12706-10-volodymyr_babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-10-volodymyr_babchuk@epam.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v5 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vm9sb2R5bXlyIEJhYmNodWsgd3JpdGVzICgiW1hlbi1kZXZlbF0gW1BBVENIIHY1IDA5LzEwXSB0
b29scy9hcm06IHRlZTogYWRkICJ0ZWUiIG9wdGlvbiBmb3IgeGwuY2ZnIik6Cj4gVGhpcyBlbnVt
ZXJhdGlvbiBjb250cm9scyBURUUgdHlwZSBmb3IgYSBkb21haW4uIEN1cnJlbnRseSB0aGVyZSBp
cwo+IHR3byBwb3NzaWJsZSBvcHRpb25zOiBlaXRoZXIgJ25vbmUnIG9yICdvcHRlZScuCj4gCj4g
J25vbmUnIGlzIHRoZSBkZWZhdWx0IHZhbHVlIGFuZCBpdCBiYXNpY2FsbHkgZGlzYWJsZXMgVEVF
IHN1cHBvcnQgYXQKPiBhbGwuCj4gCj4gJ25hdGl2ZScgZW5hYmxlcyBhY2Nlc3MgdG8gYSAicmVh
bCIgT1AtVEVFIGluc3RhbGxlZCBvbiBhIHBsYXRmb3JtLgo+IAo+IEl0IGlzIHBvc3NpYmxlIHRv
IGFkZCBhbm90aGVyIHR5cGVzIGluIHRoZSBmdXR1cmUuCgpDb3VsZCBpbXByb3ZlIHRoaXMgYml0
IG1heWJlID8KCj4gKz1pdGVtIEI8Im9wdGVlIj4KPiArCj4gK0FsbG93IGd1ZXN0IHRvIGFjY2Vz
cyB0byBPUC1URUUgZW5hYmxlZCBvbiB0aGUgcGxhdGZvcm0uIEd1ZXN0IHdpbGwgbm90IGJlIGNy
ZWF0ZWQKPiAraWYgcGxhdGZvcm0gZG9lcyBub3QgaGF2ZSBPUC1URUUgd2l0aCB2aXJ0dWFsaXph
dGlvbiBmZWF0dXJlIG9yIGlmIE9QLVRFRSB3aWxsCj4gK2RlbnkgYWNjZXNzLgoKVG8gbWUgKHdo
byBkb2Vzbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoaXMgc3R1ZmYgdmVyeSB3ZWxsKSB0aGlzCmRv
ZXNuJ3QgYW5zd2VyIGEgdmVyeSBpbXBvcnRhbnQgcXVlc3Rpb246IGlmIEkgZW5hYmxlIHRoaXMs
IHdoYXQgKGlmCmFueSkgaG9zdC9tYWNoaW5lLyZjIHJlc291cmNlcyB3aWxsIHRoaXMgZ3JhbnQg
dGhlIGd1ZXN0IGFjY2VzcyB0byA/CgpJdCBzb3VuZHMgbGlrZSB0aGUgdGhlIGFuc3dlciBzaG91
bGQgYmUgIm5vbmUiLCBiZWNhdXNlIGlmIEkgc2VhcmNoCmZvciAib3AtdGVlIiBvbmxpbmUgSSB3
b3VsZCBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCBpdCBpcyBhbgplbXVsYXRvci4gIE5vcm1hbGx5
IGdyYW50aW5nIGFjY2VzcyB0byBhbiBlbXVsYXRvciBkb2VzIG5vdCBncmFudAphY2Nlc3MgdG8g
aG9zdCByZXNvdXJjZXMuCgpCdXQgaW4gdGhpcyBzZXJpZXMgeW91IHRhbGsgYWJvdXQgaXQgYmVp
bmcgYSBtZWRpYXRvciBzbyBJIHN1c3BlY3QKdGhhdCBpcyBub3QgcmlnaHQuCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
