Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA48783C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 13:09:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2iV-0004Wu-Je; Fri, 09 Aug 2019 11:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iEig=WF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hw2iU-0004Wp-2n
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 11:05:50 +0000
X-Inumbo-ID: a31fc6f4-ba95-11e9-ae6e-5f44fa89d337
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a31fc6f4-ba95-11e9-ae6e-5f44fa89d337;
 Fri, 09 Aug 2019 11:05:46 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ENjs5KuCf52Q0Ka1KwKP6qDPHufXObk/asjJyATbDiqKWOXL7BHCgtYcnsGm4xCkLV1FtzY6LP
 VD77IlVXbz/kCiqWk16dKPYdX2wsd+Q+f6mgxRw6pafByBjdURbzfK/Dy8EOCCQ0nKX0MNJ1+t
 SRoeNsdT/Uuzk+FcnfJn6vGe6To/aBrGJ4U3KrKAbbilDpr9aSMLXSGcjU4CXR7KD78sh7/Qv8
 D/SRj/XYRxu2fmwMvLMo/XPHpD3U/yuphfr9+Bg+y6DvmYv7xIPT4Ry/3HeYXOgifqBxtDQ0nP
 zyU=
X-SBRS: 2.7
X-MesageID: 4084360
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4084360"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23885.21353.328881.739407@mariner.uk.xensource.com>
Date: Fri, 9 Aug 2019 12:05:13 +0100
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ded65ae3-a819-4d8b-248d-59d69f9fc731@suse.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
 <23885.19951.531473.98515@mariner.uk.xensource.com>
 <ded65ae3-a819-4d8b-248d-59d69f9fc731@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIHRvb2xzL3Rl
c3RzL2NwdS1wb2xpY3k6IGRpc2FibGUgLVdmb3JtYXQtb3ZlcmZsb3ciKToKPiBXb3VsZCB5b3Ug
bWluZCBjbGFyaWZ5aW5nIHdoaWNoIDEyIHlvdSBtZWFuIHRvIGNoYW5nZSB0byAxMz8KPiBUaGUg
b25lIGluICIlLjEycyIgd291bGQsIGlmIGNoYW5nZWQgYW5kIGFmYWljdCwgdGhlbgo+IGxlZ2l0
aW1hdGVseSB0cmlnZ2VyIHRoZSB3YXJuaW5nLiBBbmQgd2UndmUgYWxyZWFkeSBvYmplY3RlZAo+
IHRvIHRoZSBhcnJheSB0byBnZXQgZ3Jvd24uCgpJIG1lYW50IHRoZSBhcnJheS4gIEkgbWlzc2Vk
IHRoYXQgb2JqZWN0aW9uLiAgSSBqdXN0IHdlbnQgYW5kIHJlYWQgdGhlCnRocmVhZAogIHRlc3Rz
L2NwdS1wb2xpY3k6IGZpeCBmb3JtYXQtb3ZlcmZsb3cgd2FybmluZyBieSBudWxsIHRlcm1pbmF0
aW5nIHN0cmluZ3MKYW5kIGl0IGRpZCBjb25jbHVkZSB0aGF0IHRoZSBjb21waWxlciB3YXMgd3Jv
bmcgdG8gY29tcGxhaW4uCgpCdXQgZm9yIG1lIGl0IGRvZXNuJ3QgZm9sbG93IHRoYXQgdGhlIG9y
aWdpbmFsIGNvZGUgaXMgbmVjZXNzYXJpbHkgdGhlCmJlc3Qgd2F5IG9mIGRvaW5nIHRoaW5ncywg
YW5kIEkgZGlkbid0IHNlZSBhbnlvbmUgZ2l2aW5nIGFuIGFyZ3VtZW50CndoeSBzaW1wbHkgaW5j
cmVhc2luZyB0aGUgYXJyYXkgd2FzIGEgYmFkIGlkZWEuCgpDICJwcmVmZXJzIiBudWxsLXRlcm1p
bmF0ZWQgc3RyaW5ncyBpbiB0aGF0IHRoZXkgd29yayBzb21ld2hhdCBiZXR0ZXIKd2l0aCBhIHZh
cmlldHkgb2YgcHJpbWl0aXZlcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
