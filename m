Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2D188AA
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOgsc-0000oB-0v; Thu, 09 May 2019 11:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DbYa=TJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hOgsZ-0000o6-O5
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 11:06:23 +0000
X-Inumbo-ID: 7912d7ae-724a-11e9-9795-fff56a3998ba
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7912d7ae-724a-11e9-9795-fff56a3998ba;
 Thu, 09 May 2019 11:06:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0bo4niuos+1s+qJtNAMv4eyTOEfeijCJzR4PgkUZvZXsRhAanQHwUCmDEpUmivNjzYKNthehjc
 y15eRzLOq087CWUYX7ExOAsTnwTmqef1v3o+qIYUiQ8bkejE/CzGrtxXysiqzQumGIsSaWOOCA
 47ubafWjBejhvlNdvYj+dXx6KzehA6M9mJY4R1r1NsUSzoXdiNEzz7tqVuPaq1TZmlEvM1CKJs
 bk8myUxxKwd09qFk+XZXW0Gm7pqEe7I8K1L0d2zwjU3UacFNH4ryl6XcI++eX7gY6W3c/Gvnyj
 RqI=
X-SBRS: 2.7
X-MesageID: 236837
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,449,1549947600"; 
   d="scan'208";a="236837"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23764.2442.337734.122162@mariner.uk.xensource.com>
Date: Thu, 9 May 2019 12:05:46 +0100
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <fa19ab5c-0d20-a198-74f4-6ee2fbf00c92@citrix.com>
References: <20190508113947.11920-1-george.dunlap@citrix.com>
 <d56ae8a0-7770-cb30-7996-a0d68d85e073@suse.com>
 <fa19ab5c-0d20-a198-74f4-6ee2fbf00c92@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add explicit check-in policy
 section
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim  \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBNQUlOVEFJTkVS
UzogQWRkIGV4cGxpY2l0IGNoZWNrLWluIHBvbGljeSBzZWN0aW9uIik6Cj4gT24gNS84LzE5IDEy
OjU5IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gMi4gSW4gdGhlIGNhc2UgdGhlIHN1Ym1p
dHRlciBpcyBhIG1haW50YWluZXIgb2YgYSBtb2RpZmllZCBmaWxlIGl0IG11c3QKPiA+IGhhdmUg
YW4gQWNrIG9yIFJldmlldyBmcm9tIGVpdGhlciBhICJuZXN0ZWQiIG1haW50YWluZXIgb3IgYSBE
ZXNpZ25hdGVkCj4gPiByZXZpZXdlciBvZiB0aGF0IGZpbGUuCj4gCj4gVGhhdCBjaGFuZ2VzIHRo
ZSBjdXJyZW50IG1lYW5pbmcgb2YgIkRlc2lnbmF0ZWQgUmV2aWV3ZXIiIHNvbWV3aGF0LiAgQXQK
PiB0aGUgbW9tZW50LCBpdCBvbmx5IG1lYW5zICJTZW5kIHRoaXMgcGVyc29uIGFuIGVtYWlsIjsg
aWYgd2UgZGlkIHRoYXQsCj4gaXQgd291bGQgbWVhbiwgIlRoaXMgcGVyc29uIGlzIG1vcmUgdHJ1
c3RlZCB0byBkbyByZXZpZXdzIHRoYW4gb3RoZXJzIi4KPiAKPiBOb3Qgc3VyZSB3aGF0IEkgdGhp
bmsgYWJvdXQgdGhhdCB5ZXQuCgpJIHRoaW5rIHRoaXMgaXMgYSBiYWQgaWRlYS4gIFRoZSBwdXJw
b3NlIHdhcyB0byBwcm92aWRlIGEgd2F5IGZvcgpzb21lb25lIHRvIGJlIGVtYWlsZWQgd2hpY2gg
ZG9lc24ndCBpbnZvbHZlIGdpdmluZyB0aGVtIGF1dGhvcml0eSwKYW5kIHdoaWNoIGlzIHRoZXJl
Zm9yZSBhIHN0YXR1cyB3aGljaCBjYW4gYmUgZ3JhbnRlZCBvbiByZXF1ZXN0IGFuZApkb2VzIG5v
dCByZXF1aXJlIGFueSBhc3Nlc3NtZW50IGV0Yy4KCklmIHdlIGNoYW5lIHRoaXMgd2Ugd2lsbCBo
YXZlIHRvIGludmVudCBhIG5ldyBzdGF0dXMgdG8gcGVyZm9ybSB0aGlzCmZ1bmN0aW9uLgoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
