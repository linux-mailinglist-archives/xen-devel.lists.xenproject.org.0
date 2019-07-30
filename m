Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF0D7A6ED
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQHF-0000PF-Ur; Tue, 30 Jul 2019 11:26:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4wUk=V3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hsQHE-0000PA-1n
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:26:44 +0000
X-Inumbo-ID: e5e3824a-b2bc-11e9-a0de-cf3162cfba45
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5e3824a-b2bc-11e9-a0de-cf3162cfba45;
 Tue, 30 Jul 2019 11:26:39 +0000 (UTC)
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
IronPort-SDR: nGCDvRMriiZWeY0thFXOF1cv4yPKy8qxlubXsFPoaWvlLjbqXL1SvmCd1v4tO5B6vojl12wbCt
 uMNYoV5NjBOtaq1eN0HldX3KYL847L+Bvvq+aPb3EdcViBNOoTgpcTogwzOfGz0rae/JjJW/uP
 +KIYUodqiFKMNpOhGkMMUv8EzckD+lev18Z0/W0Eyczq4ZBd30JvcJoJGe7WVBPDDpTGlvIqg9
 37g+pSOTsnoMf81l4U7Zbb+6UC9dyVCHVgnrrlYSbTNJgVMHKsyL4+SwQ0A20fi6Q2z9HKafGP
 PJs=
X-SBRS: 2.7
X-MesageID: 3646390
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3646390"
Date: Tue, 30 Jul 2019 12:26:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <20190730112635.GA5791@perard.uk.xensource.com>
References: <osstest-139462-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-139462-mainreport@xen.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [qemu-mainline test] 139462: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDY6MDU6NDRQTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzk0NjIgcWVtdS1tYWlubGluZSByZWFsIFtyZWFsXQo+
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzk0NjIv
Cj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46
Cj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0IDE4IGd1ZXN0LXN0YXJ0L2Rl
Ymlhbmh2bS5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTM5MzAwCgpJbiBRRU1VJ3MgbG9nOgpxZW11
LXN5c3RlbS1pMzg2OiBlcnJvcjogdW5rbm93biBvcGVyYXRpb24gKDE3NSkKClRoaXMgc2VlbXMg
dG8gYmUgYW4gZXJyb3IgbWVzc2FnZSBmcm9tCmh3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2su
YzoxNjEgIHhlbl9ibG9ja19wYXJzZV9yZXF1ZXN0KCkKd2hpY2ggd291bGQgc3VnZ2VzdCB0aGF0
IGEgcmVxdWVzdCB3aXRoIG9wZXJhdGlvbj0xNzUgd2FzIHNlbnQgYnkgdGhlCmd1ZXN0IChtYXgg
b3BlcmF0aW9uIHZhbHVlIHNlZW1zIHRvIGJlIDYpLgoKTWF5YmUgc29tZXRoaW5nIGNoYW5nZWQg
aW4gT1ZNRiwgYW5kIHJldmVhbCBhIGJ1ZyBpbiBpdHMgYmxvY2sgZnJvbnQKaW1wbGVtZW50YXRp
b24uIEkgY2FuIHRoaW5rIG9mIHRoYXQgaHR0cHM6Ly94ZW5wcm9qZWN0LmF0bGFzc2lhbi5uZXQv
YnJvd3NlL1hFTi0xMjguCgpJIGRvbid0IGtub3cgd2hhdCB0aGUgZ3Vlc3QgaXMgZG9pbmcsIHNv
IHdlIHdvdWxkIG5lZWQgbW9yZSBsb2dzLCBmcm9tCm1heWJlIG92bWYuIEFsc28sIHdlIHByb2Jh
Ymx5IHdhbnQgYmV0dGVyIGVycm9yIG1lc3NhZ2UgZnJvbSBRRU1VLCBsaWtlCndoaWNoIGRpc2sg
aGF2ZSBhbiBpc3N1ZS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
