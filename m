Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EDF2996C
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 15:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUAa6-0000ld-TJ; Fri, 24 May 2019 13:49:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0saV=TY=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hUAXH-0000hE-8e
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 13:47:03 +0000
X-Inumbo-ID: 677da4ce-7e2a-11e9-95fa-3bc188cc9035
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 677da4ce-7e2a-11e9-95fa-3bc188cc9035;
 Fri, 24 May 2019 13:47:00 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ftMJB9zkk56dAOyNnBDtzPk1EiZuHDX7xd2x7VV+RQcWWhp1Jux0Fmk9vgZcD97JIeEil/pPZa
 KGSboVZxZN8xw3MFKh08EdDacFuETUyr9Vge4mqCiAF/v/Pbnxl1mcygs2hr7QvELvHSWsPYI/
 wc7dpPN55I+kzNdkUkKLZAxEDbKRdnl4nzBYHLhqQvZHNYkL5dAhhv5zfTBCmEubVajJsIKQ1x
 AzSxven0HKWKE/prS/qfAoXBHRLvhMPSw/VNX7WJ8tsjCnM/JEqXRVOYiNgJZRD+74MK6yd16g
 nkE=
X-SBRS: 2.7
X-MesageID: 860940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="860940"
Date: Fri, 24 May 2019 14:46:57 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190524134657.GA25144@zion.uk.xensource.com>
References: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 24 May 2019 13:49:57 +0000
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: Skip building on older
 versions of GCC
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDI6Mjk6NDZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBHQ0MgNC40IChhcyBpbmNsdWRlZCBpbiBDZW50T1MgNikgaXMgdG9vIG9sZCB0byBo
YW5kbGUgZGVzaWduYXRlZCBpbml0aWFsaXNlcnMKPiBpbiBhbm9ueW1vdXMgdW5pb25zLiAgQXMg
dGhpcyBpcyBqdXN0IGEgZGV2ZWxvcGVyIHRvb2wsIHNraXAgdGhlIHRlc3QgaW4gdGhpcwo+IGNh
c2UsIHJhdGhlciB0aGFuIHNhY3JhZmljaW5nIHRoZSBsZWdpYmlsaXR5L2V4cHJlc2liaWxpdHkg
b2YgdGhlIHRlc3QgY2FzZXMuCj4gCj4gVGhpcyBmaXhlcyB0aGUgR2l0bGFiIENJIHRlc3RzLgo+
IAo+IFdoaWxlIGFkZGluZyB0aGlzIGxvZ2ljIHRvIGNwdS1wb2xjeSwgYWRqdXN0IHRoZSBlcXVp
dmVsZW50IGxvZ2ljIGZyb20KPiB4ODZfZW11bGF0b3Igb24gd2hpY2ggdGhpcyB3YXMgYmFzZWQu
ICBQcmludGluZzoKPiAKPiAgIFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBuZXdlciBjb21w
aWxlciB0aGFuICJnY2MiCj4gCj4gaXNuJ3QgaGVscGZ1bCBmb3IgYW55b25lIHVuZXhwZWN0ZWRs
eSBlbmNvdW50ZXJpbmcgdGhlIGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
