Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF524D81
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 13:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT2Tp-0007pB-LM; Tue, 21 May 2019 10:58:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT2To-0007p6-4k
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:58:48 +0000
X-Inumbo-ID: 676b207a-7bb7-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 676b207a-7bb7-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:58:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Msym7895zR0IM3accnTyqRhOzKebSbTQI5vPPGmaN4xWU44KtVwnDRReEz2Gg/+q4hVAZhb1Ee
 YyUr/hBXS1cqCfBetMtMtYogH6dnhTL8qRf1kQ8QHM5KnbBufiwBtLYUPehhD/2it4mhxQnM1V
 aB1r7gOKvi3zymPUzPoL/akpzGDjk77R2Tc6JQmZdKJYeFwHi+UQUUWCnaTpeJLDsGoMfEi2qF
 K3RzPeGcLfXeeuiY598itJGs1ac9oklvSMAv2l81l8DSQ1W6xBhI3ybenW8Akf/djLcxkP1mN0
 prs=
X-SBRS: 2.7
X-MesageID: 685929
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,494,1549947600"; 
   d="scan'208";a="685929"
Date: Tue, 21 May 2019 11:58:42 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190521105842.GG1846@zion.uk.xensource.com>
References: <20190517223152.29839-1-alistair.francis@wdc.com>
 <23778.57361.772390.248245@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23778.57361.772390.248245@mariner.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2 1/2] autotools: Updage config.guess and
 config.sub
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDY6MTI6NDlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQWxpc3RhaXIgRnJhbmNpcyB3cml0ZXMgKCJbUEFUQ0ggdjIgMS8yXSBhdXRvdG9vbHM6
IFVwZGFnZSBjb25maWcuZ3Vlc3MgYW5kIGNvbmZpZy5zdWIiKToKPiA+IFRoZSBhdXRvY29uZiBt
YW51YWwgWzFdIHNwZWNpZmllcyB0aGF0IGFzIHdlIGRlZmluZSBBQ19DQU5PTklDQUxfSE9TVCB3
ZQo+ID4gbXVzdCBzdXBwbHkgY29uZmlnLmd1ZXNzIGFuZCBjb25maWcuc3ViLiBJbiB3aGljaCBj
YXNlIGxldCdzIHVwZGF0ZSB0aGVtCj4gPiBmcm9tIFsyXSBjb21taXQ6IGI5ODQyNGMyNCAiY29u
ZmlnLmd1ZXNzOiBSZW1vdmUgc3BhY2UgYWZ0ZXIgIiNlbmRpZiIsIGFzCj4gPiBHbnVsaWIgYW5k
IHNvbWUiCj4gPiAKPiA+IFRoaXMgYWxsb3dzIHVzIHRvIHN1cHBvcnQgbW9yZSBhY2hpdGVjdHVy
ZXMgKFJJU0MtVikgYW5kIG90aGVyIGdlbmVyYWwKPiA+IGltcHJvdmVtZW50cy4KPiAKPiBJIGhh
dmUgbm90IHZlcmlmaWVkIHRoZSBjb250ZW50cyBvZiB0aHNpIHBhdGNoIGFnYWluc3QgdGhlIGdu
dWxpYiBnaXQKPiByZXBvc2l0b3J5LiAgVGhhdCBpcyBhIHRoaW5nIHRoYXQgc2hvdWxkIGJlIGRv
bmUuICBCdXQgaXQncyBwcm9iYWJseQo+IGVhc2llc3QgdG8gZG8gdGhhdCBhdCB0aGUgdGltZSBv
ZiBjb21taXR0aW5nIHRoaXMuCj4gCgpJIGhhdmUgZG9uZSB0aGUgY2hlY2tpbmcuIFRoZXkgbWF0
Y2ggdGhlIGZpbGVzIGluIHRoZSB1cHN0cmVhbQpyZXBvc2l0b3J5LgoKSSBoYXZlIHB1c2hlZCB0
aGlzIHBhdGNoIHRvIHN0YWdpbmcuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
