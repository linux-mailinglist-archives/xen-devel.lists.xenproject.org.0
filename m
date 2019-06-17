Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0248404
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 15:33:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcrhC-0004sJ-8k; Mon, 17 Jun 2019 13:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qf//=UQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hcrhA-0004sE-Te
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:29:12 +0000
X-Inumbo-ID: e35d594a-9103-11e9-b0aa-a3307d440a6c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e35d594a-9103-11e9-b0aa-a3307d440a6c;
 Mon, 17 Jun 2019 13:29:10 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MngqMlUwabvz76VrrEbrobVkP1eyWH+xIpuf45ztGggSEmbnwQoWgdMfd4lYKryewxa/MJPMyg
 hPxjF9/rixrkhBpNW8IRcKA4kJutLJvk/jwBJxx6w37DQS46D9rCFc5n9X8Zfq0kqu7n8Hi+Cf
 pbtY5Jj83yujmhPvze0Ptu74L6g6Sta4yLacoYZZidkSTioPkwJ8pdY2LIqHKI8JbtdXO3O+n3
 MYCRfyU/qaEcQBxXPozuS0X/rq5Ah3xmsd0UPVugUdve7bu+SvM152NfyDtQVdHUQyz3QNIoEw
 xx8=
X-SBRS: 2.7
X-MesageID: 1807565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1807565"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23815.38277.145206.191140@mariner.uk.xensource.com>
Date: Mon, 17 Jun 2019 14:28:37 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CE4F0F50200007800231309@prv1-mh.provo.novell.com>
References: <osstest-136566-mainreport@xen.org>
 <5CE4F0F50200007800231309@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.8-testing test] 136566: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC44LXRlc3RpbmcgdGVzdF0gMTM2NTY2OiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBBbSBJIG1pc3Rha2VuIGluIHVuZGVyc3RhbmRpbmcgdGhh
dCB0aGVzZSB0d28gd2lsbCBnbyBhd2F5IG9ubHkgb25jZQo+IHRoZSA0LjcgdHJlZSBnZXRzIGEg
cHVzaCAod2hpY2gsIGV2ZW4gd2hlbiBpdHMgb3duIGJ1aWxkIGZhaWx1cmVzIGhhdmUKPiBnb3Qg
YWRkcmVzc2VkLCB3aWxsIHJlcXVpcmUgYSA0LjYgcHVzaCB0byBvY2N1ciBmaXJzdCksIGFuZCBp
biB0dXJuIHRoZQo+IHJlc3BlY3RpdmUgNC45IGZhaWx1cmVzIHdpbGwgZ28gYXdheSBvbmx5IG9u
Y2Ugd2UgZ2V0IGEgcHVzaCBoZXJlPwoKWWVzLgoKPiAgSWYgc28gLSB3aGF0J3MgdGhlIHN0YXRl
IG9mIHRoZXNlIG9sZCB0cmVlcz8gU28gZmFyIEkgaGFkIGJlZW4KPiB1bmRlciB0aGUgaW1wcmVz
c2lvbiB0aGF0IG5lY2Vzc2FyeSBidWlsZCBmaXggYmFja3BvcnRzIGhhZCBiZWVuCj4gaWRlbnRp
ZmllZCBhbmQgYXBwbGllZCAuLi4KClllcy4KCkhvd2V2ZXIsCgo0LjYgaXMgcXVpdGUgYmFkbHkg
YnJva2VuLiAgU2VlIG15IG1haWwKCiAgU3ViamVjdDogUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVz
dF0gMTM3MDY0OiByZWdyZXNzaW9ucyAtIEZBSUwKICBEYXRlOiBGcmksIDMxIE1heSAyMDE5IDEx
OjMzOjMxICswMTAwCgppbiB3aGljaCBJIHByb3Bvc2VkIGEgZm9yY2UgcHVzaCBkZXNwaXRlIHRo
ZXNlIHNlcmlvdXMgcHJvYmxlbXMuCkknbGwgY2hlY2sgd2l0aCB5b3Ugb24gaXJjIG5vdyB3aGV0
aGVyIHlvdSBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlCnB1c2hlZCBub3cuCgo0LjcgaXMgYnJv
a2VuIHdpdGggSFZNIGd1ZXN0cy4gIFlvdSB3cm90ZSBhYm91dCB0aGlzIHRvZGF5OgoKICBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW3hlbi00LjctdGVzdGluZyB0ZXN0XSAxMzcwNjU6IHJlZ3Jl
c3Npb25zIC0gRkFJTAogIERhdGU6IE1vbiwgMTcgSnVuIDIwMTkgMDg6MDQ6MDAgKzAxMDAKCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
