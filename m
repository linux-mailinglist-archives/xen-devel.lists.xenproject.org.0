Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816423160
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:33:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfZ8-0001dl-37; Mon, 20 May 2019 10:30:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSfZ5-0001dg-Qq
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:30:43 +0000
X-Inumbo-ID: 5188f168-7aea-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5188f168-7aea-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:30:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: qsj8QPkevqOOIAC1jagUdSKAgqWsxFASMPJjkgh7Zn7ZgjKRUEKIfwvlGi9yHosNegIBDrmdtY
 1D5QYoKXtU0vdEfUH3qh8XLwFJ6IUryzZCjFErnKIfcUiMsi2vmdugLvRauFH6KNj6qOxkTvgc
 cjQPPBfemWRI1wmfqYwHkL6fzxvb1Hi8SKMsIm9eFKIBmmXH2XgFqaDwksZ0Rx0zzKuhep3rDU
 DiDldsZnqFWdamrG5dNNGmRhqelJbSyaBr79yUeRihxerPO5uonKhJSFS3DKquNMdx5r89Jbu6
 xYo=
X-SBRS: 2.7
X-MesageID: 641526
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="641526"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.33200.47146.497482@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 11:30:08 +0100
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <osstest-136385-mainreport@xen.org>
References: <osstest-136385-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEz
NjM4NTogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNjM4NSB4ZW4tNC4xMS10ZXN0
aW5nIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzEzNjM4NS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2gg
Y291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1kZWJpYW5odm0t
YW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEzNTY4Mwo+ICB0ZXN0
LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRlYmlhbmh2bS1pMzg2LXhzbSAxMCBkZWJpYW4taHZtLWlu
c3RhbGwgZmFpbCBSRUdSLiB2cy4gMTM1NjgzCgpUaGVzZSBhcmUgYSBrbm93biBidWcuICBUaGUg
RGViaWFuICJzdHJldGNoIiAoInN0YWJsZSIpIGkzODYga2VybmVsCnNpbXBseSBkb2VzIG5vdCB3
b3JrIHVuZGVyIFhlbiBIVk0uICBJIGRvbid0IHRobmsgdGhpcyBpcyBhbnl0aGluZyB0bwpkbyB3
aXRoIHRoZSA0LjExIFhlbiBjb21taXRzIHVuZGVyIHRlc3QgaGVyZS4gIEl0IGlzIGFwcGVhcmlu
ZyBoZXJlIGluCnRoaXMgZmxpZ2h0IGJlY2F1c2UgSSByZW9yZ2FuaXNlZCB0aGUgYW1kNjQvaTM4
NiB0ZXN0IGpvYnMuCgo+ICB0ZXN0LWFybWhmLWFybWhmLXhsLWNyZWRpdDIgMTYgZ3Vlc3Qtc3Rh
cnQvZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMzU2ODMKCkkgbG9va2VkIGF0IHRoaXMu
ICBJIHRob3VnaHQgaXQgbWlnaHQgYmUgdGhlIGtub3duIHhlbnN0b3JlIG1lbW9yeQpoYW5kbGlu
ZyBidWcgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBiZS4gIEkgbG9va2VkIGF0IHRoZSBsb2dzIGFu
ZCB0aGUKZ3Vlc3Qgc2VlbXMgc2ltcGx5IG5vdCB0byBoYXZlIHN0YXJ0ZWQgYXQgYWxsLiAgVGhl
cmUgaXMgbm90aGluZyBmcm9tCml0IGluIGl0cyBwdiBjb25zb2xlLiAgQWRkaW5nIHNvbWUgQVJN
IGZvbGtzLiAgSSBoYXZlIGEgbWVtb3J5IG9mIHNvbWUKYWxsZWdhdGlvbiB0aGF0IHRoZXJlIGlz
IGEgZnVuZGFtZW50YWwgY2FjaGUgbWlzbWFuYWdlbWVudCBwcm9ibGVtCndoaWNoIG1pZ2h0IGNh
dXNlIHRoaXMsIGluIHdoaWNoIGNhc2Ugd2UgcHJvYmFibHkgb3VnaHQgdG8gZm9yY2UgcHVzaC4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
