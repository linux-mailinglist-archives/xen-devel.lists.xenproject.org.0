Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853F553CD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnlr-000104-Sr; Tue, 25 Jun 2019 15:54:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XKpQ=UY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hfnlq-0000zy-DG
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:54:10 +0000
X-Inumbo-ID: 77817263-9761-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77817263-9761-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 15:54:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o0MMk7sXg8vGmWP+cf62PvUtjByG3PUr7JEEepBh0hgnZWT9FAQLvYjZVAKjY4Z5zfQkqBqwkF
 yu8JCRR6Z0VFeCRzfR1usqjSyogM55W4IKEtQ3LFtkj+81D11ak2klwLqUJdnAySDCgCguYH0b
 SkSsYZ9J/sjA7Pu0qfj1DxXizw5cNIrHg2+jP/RdiU4COojxzD+37gzshpv1+6VvxxPyVtqRwd
 V578VpZUFjtqtsxUmMA7pY8HZV0BJJTqODtw8mIQmM9CJDk0iL2r7jdHQrW1jUNgYy0QJBZOXl
 2Uo=
X-SBRS: 2.7
X-MesageID: 2234252
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2234252"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23826.17279.656820.722725@mariner.uk.xensource.com>
Date: Tue, 25 Jun 2019 16:53:35 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D123CD0020000780023B077@prv1-mh.provo.novell.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
 <23825.64696.25926.318881@mariner.uk.xensource.com>
 <23826.11187.707446.188402@mariner.uk.xensource.com>
 <5D123CD0020000780023B077@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBJJ3ZlIHRha2VuIGEgbG9vay4gVGhlIGd1ZXN0cyBub3cg
dHJpcGxlIGZhdWx0IGR1cmluZyBCSU9TIGluaXRpYWxpemF0aW9uOgoKVGhhbmtzLiAgSHJtLgoK
PiBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGUgcm9tYmlvcyBidWlsZCBpcyBicm9rZW4g
LSBkaWQgeW91IGhhcHBlbgo+IHRvIGNvbXBhcmUgdGhvc2UgYmluYXJpZXM/IE90b2ggSSBjYW4n
dCBzZWVtIHRvIHNwb3QgYW55IGZpeGVzIGluCj4gbWFzdGVyIHRoYXQgd291bGQgbG9vayBsaWtl
IHBvc3NpYmx5IGFkZHJlc3NpbmcgYnVpbGQgaXNzdWVzIHdpdGggYQo+IG5ld2VyIHRvb2wgY2hh
aW4gKG90aGVyIHRoYW4gY2FzZXMgd2hlcmUgdGhlIGJ1aWxkIGl0c2VsZiB3b3VsZCBmYWlsKS4K
Ck5vLCBJIGhhdmVuJ3QgY29tcGFyZWQgdGhlIHJvbWJpb3MgYmluYXJpZXMuCgo+IElycmVzcGVj
dGl2ZSBvZiB0aGlzIEknbSBub3QgcmVhbGx5IG9wcG9zZWQgdG8gYSBmb3JjZSBwdXNoIGFzIHlv
dSd2ZQo+IHN1Z2dlc3RlZCwgZGVzcGl0ZSBiZWluZyBhZnJhaWQgdGhhdCB0aGlzIG1heSBoaWRl
IGFuIGFjdHVhbCBpc3N1ZS4KPiBUaGF0J3MgZXZlbiBtb3JlIHNvIHRoYXQgYnkgbm93IDQuNyBo
YXMgZ29uZSBvdXQgb2Ygc2VjdXJpdHkKPiBzdXBwb3J0LCBhbmQgaGVuY2Ugd2Ugb25seSBuZWVk
IGl0IG5vdyBmb3IgNC44J3MgLXByZXYgdGVzdHMuCgpJbmRlZWQsIHByZWNpc2VseS4gIEFyZSBo
YXBweSB3aXRoIG1lIGRvaW5nIGEgZm9yY2UgcHVzaCBub3cgPwoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
