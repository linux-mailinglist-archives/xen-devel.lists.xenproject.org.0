Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DDC20C5E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 18:04:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIqH-0007Ti-9y; Thu, 16 May 2019 16:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRIqF-0007TT-T3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:02:47 +0000
X-Inumbo-ID: 0a65a43a-77f4-11e9-a407-2769bc7f4487
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a65a43a-77f4-11e9-a407-2769bc7f4487;
 Thu, 16 May 2019 16:02:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ds0mE4OSK8pwH/eQDfHJpJYe1EXk5ntbp20b1ZvgwiIJ9Hqe7GIdKF9tjSiiegVDJWmHbGW6NY
 ObFdyExuRs25pNqmGH2JoUZAcVC8euQYyaC1uh0hVC4urstvYKASi6ACtHV8hrvYehMjtI1mZ3
 wmLIRfK0KVDcj7BV1JfCZWdNkSJfPrqZ4lcLe6UKDZl5MXi2/LRooMy7dcamp8enJJheQULQuC
 smnBf3x47W2CDBb29oqw81wmo8u8ZYwP73sp2P2ZGz1FBOHBqvxf+tLt/2FOtiSxwYXGUjpjgS
 YA8=
X-SBRS: 2.7
X-MesageID: 535163
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="535163"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23773.35203.225345.431062@mariner.uk.xensource.com>
Date: Thu, 16 May 2019 17:02:11 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcHJlcGFyYXRpb25zIGZvciA0
LjExLjIiKToKPiBPaCwgYW5kIDY3N2U2NGRiZTMxNTM0MzYyMGMzYjI2NmU5ZWIxNjYyM2IxMTgw
MzggInRvb2xzL29jYW1sOiBEdXAyCj4gL2Rldi9udWxsIHRvIHN0ZGluIGluIGRhZW1vbml6ZSgp
IiBhZ2FpbiBmb3IgNC4xMiBhbmQgZWFybGllci4KClRoaXMgaXMgYWxyZWFkeSBpbiA0LjEyLiAg
SXQncyBxdWl0ZSBhbGFybWluZyBzbyBJIGRlY2lkZWQgdG8gYmFja3BvcnQKaXQgYWxsIHRoZSB3
YXkgdG8gNC43IChsYXN0IHJlbGVhc2UgaW4gc2VjdXJpdHkgc3VwcG9ydCkuCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
