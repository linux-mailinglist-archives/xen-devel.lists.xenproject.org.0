Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6084BC03
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:47:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdbpd-0006jU-H4; Wed, 19 Jun 2019 14:45:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdbpb-0006jP-O3
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:44:59 +0000
X-Inumbo-ID: ccd971ce-92a0-11e9-ac09-fb374ed7e15f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccd971ce-92a0-11e9-ac09-fb374ed7e15f;
 Wed, 19 Jun 2019 14:44:54 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6vE6qVwmxgHlvDips65pDeo/+KoCdK2L7yxzhQ4ioWsQRPt0sWsCB/GecgwXEmuqFcHhSwxTV7
 Iu0DVsjLCRTYNHStAwyvIizqnR+OPOC8AwtJKIXwq1FRHVNPDWQrDsR/edPUp/48BO9Sk/aYn3
 94e7CfwSTJKzy60K5PCPCPhxutLDPT75hm44PL7DJ3hLoAoz8jWt3rDAZVWyjzxkNKXvKHnVAk
 VWlyoa1ObzuvcHOilTwPn4HT0Hpev89PD5y/dDHToUIcGwUXsRRmwqOZLIcDK4vM+d42ZoCbiz
 LqE=
X-SBRS: 2.7
X-MesageID: 1939584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1939584"
Date: Wed, 19 Jun 2019 16:44:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190619144447.fq5esl5reagv4qpc@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-2-roger.pau@citrix.com>
 <5D0A219C0200007800239A00@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0A219C0200007800239A00@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] xz: use initconst for hypervisor build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDU6NTA6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT3IgZWxzZSBjbGFuZyBhZGRzIGEgLmluaXQucm9kYXRhLmNzdDggc2VjdGlvbiB0
byB0aGUgcmVzdWx0aW5nIG9iamVjdAo+ID4gZmlsZSwgd2hpY2ggaXMgbm90IGhhbmRsZWQgYnkg
dGhlIFhlbiBsaW5rZXIgc2NyaXB0IGFuZCBjYW4gZW5kIHVwCj4gPiBiZWZvcmUgdGhlIHRleHQg
c2VjdGlvbiB3aGljaCBjb250YWlucyB0aGUgaGVhZGVycywgdGh1cyByZXN1bHRpbmcgaW4KPiA+
IGEgbm90IHVzYWJsZSBiaW5hcnkuCj4gCj4gVG8gYmUgaG9uZXN0IEknZCBwcmVmZXIgaWYgd2Ug
d2VudCB3aXRoIGp1c3QgdGhlIGNoYW5nZSBzdWdnZXN0ZWQKPiBieSBBbmRyZXcsIGdldHRpbmcg
dGhlIGxpbmtlciBzY3JpcHQgYmFjayBpbiBsaW5lIHdpdGgKPiBTUEVDSUFMX0RBVEFfU0VDVElP
TlMuIFRoZSBzdGF0aWMgY29uc3QgaXRlbXMgaW4gdGhlCj4gZGVjb21wcmVzc29ycyB3ZXJlIGxl
ZnQgdW4tYW5ub3RhdGVkIGludGVudGlvbmFsbHksIHNpbmNlIHRoZQo+IC5yb2RhdGEuKiB0aGlu
Z2llcyB3YW50L25lZWQgdGFraW5nIGNhcmUgb2YgYW55d2F5LiBBZnRlciBhbGwgeW91Cj4gd29u
J3QgKEkgaG9wZSkgc3VnZ2VzdCBhbHNvIGFubm90YXRpbmcgdGhlIHZhcmlvdXMgc3RyaW5nIGxp
dGVyYWxzLgoKT0ssIEkgdGhpbmsgcmVnYXJkbGVzcyBvZiB0aGUgcmVzdCBvZiB0aGUgbGxkIDgg
c2VyaWVzIGl0IGlzIHdvcnRoCnNlbmRpbmcgdGhlIGxpbmtlciBzY3JpcHQgY2hhbmdlIGluIG9y
ZGVyIHRvIHByZXZlbnQgaGF2aW5nIHRoaXMKb3JwaGFuZWQgc2VjdGlvbi4KCkFuZHJldywgc2lu
Y2UgeW91IHdoZXJlIHRoZSBvbmUgdG8gcHJvcG9zZSBpdCwgY291bGQgeW91IHBsZWFzZSBzZW5k
IGEKZm9ybWFsIHBhdGNoPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
