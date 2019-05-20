Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC223DB2
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSlHy-00042A-LU; Mon, 20 May 2019 16:37:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSlHx-000425-94
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:37:25 +0000
X-Inumbo-ID: 8b7df57d-7b1d-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8b7df57d-7b1d-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 16:37:23 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0hAoqThAt+4eOxgZVA14qRESVwZYSG17xKUhxOvUhnLBnbNFdxz3RG/X/4L6uvFqo6PIZDqt5J
 NCtTrENyOi/fUQAYEL28A+gFV++Qxt2H5KF2NHd+GhOFpxAU5IHWLUgJx8ClHzwDgyMHGKpHWw
 402sU4JT16bliDQ6hjLf0ShckX9iuS1BCqOoIQK89nrDA+/7+CNe50Oro78sf4wxZalkzwDrxN
 UDfRj1MP+4noriKNjgAVQtGWORzQhZujWJvWlX7tfQ3+rO0cy6sHdzVDJr2gwiH/Y7X4jdOPhn
 2Es=
X-SBRS: 2.7
X-MesageID: 665324
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,492,1549947600"; 
   d="scan'208";a="665324"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.55202.449293.616451@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 17:36:50 +0100
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
 <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
 <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBnb2luZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIElNTy4KCkxhcnMgS3VydGggd3Jp
dGVzICgiUmU6IFtQQVRDSF0gQWRkIFRSQUNLSU5HLklNUE9SVFMgdG8geGVuLmdpdCB0byBtb3Jl
IGVhc2lseSBtYW5hZ2UgaW1wb3J0ZWQgZmlsZXMgdGhhdCBuZWVkIHRvIGJlIGtlcHQgaW4gc3lu
YyB3aXRoIGFuIHVwc3RyZWFtIik6Cj4gVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlIG5vdy4gSW4g
dGhhdCBjYXNlLCBJIHRlbmQgdG8gYWdyZWUgdGhhdCAiYXV0byIgaXMgcHJvYmFibHkgbm90IG5l
ZWRlZC4gV291bGQgYmUgcXVpdGUgaGFwcHkgdG8gZHJvcCBpdC4KCkl0IHdpbGwgY29uc2lkZXJh
Ymx5IGNvbXBsaWNhdGUgdGhpbmdzIHRvIGFkZCBhIHdheSB0byBkZWZpbmUKc2VkZGVyeS4gIExl
dCB1cyBsZWF2ZSB0aGF0IHRvIGEgZnV0dXJlIGV4dGVuc2lvbi4KClRoYXQgc3VnZ2VzdHMgdGhh
dCBgbWFudWFsJyBzaG91bGQgYmVjb21lIGBmaWxlOicuCgpBcyBmb3IgZGVsaW1pdGVycwoKPiDv
u79PbiAxNy8wNS8yMDE5LCAwMTozNCwgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOgo+ICAgICA+IEkgYW0gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiwgd2hpY2ggY29sb25z
PyBBcmUgeW91IHNheWluZywgdGhlIGZvcm1hdCBzaG91bGQgYmUKPiAgICAgPiB2ZXJzaW9uOiAx
Cj4gICAgID4gcmVwbzogLi4uCj4gICAgIAo+ICAgICBZZXMuIFRoaXMgd291bGQgbWFrZSBpdCBl
dmVuIG1vcmUgcHJvbWluZW50IHRoYXQgdGhlc2UgYXJlIHRhZ3Mgb2YKPiAgICAgc29tZSBzb3J0
LiBCdXQgdGhpcyB3YXMgb25seSBhIHRob3VnaHQgb2YgbWluZSwgaXQncyBpbiBubyB3YXkgbWVh
bnQKPiAgICAgdG8gYmUgYSByZXF1aXJlbWVudCBJIGhhdmUuCgpJdCB3aWxsIG1ha2Ugd3JpdGlu
ZyBhIHBhcnNlciBlYXNpZXIgaWYgZWFjaCBlbnRyeSBpcyBhIHNpbmdsZSBsaW5lCndpdGggdGhl
IGZpZWxkcyBpbiBhIGRlZmluZWQgb3JkZXIgYW5kIGlmIHdlIGNhbiBzYXkgdGhhdCBhIGByZXBv
OicKbXVzdCBwcmVjZWRlIGV2ZXJ5IGBmaWxlOicgdGhhdCBtZW50aW9ucyBpdC4KCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
