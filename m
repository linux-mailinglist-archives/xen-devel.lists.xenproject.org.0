Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C7233664
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 19:19:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXqZC-0001vd-0B; Mon, 03 Jun 2019 17:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W6tT=UC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hXqZ9-0001vX-SS
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 17:16:11 +0000
X-Inumbo-ID: 45aca0a6-8623-11e9-8217-73305da1b468
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45aca0a6-8623-11e9-8217-73305da1b468;
 Mon, 03 Jun 2019 17:16:06 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: RC5e0JlrI/c4CwyspHlRVTR+cBynKuqdgFOzy/AHzSyH2mgqps3IVrExvvEg6/AiO3CRt9Wz/F
 tZdLKyPOB3nKBLbnY24hJmICtQKMwCy8qy16OZ14qVNBISEDkuwIvEGIiSiMuLwBd2bTW450vl
 qjzq+D9+lDunvlnvUBpWnsxsz/dB4EKxVMYdAuNgUqS12OhxNGzDIdaNQiYRgr8EEJmNUT7s8o
 YsJdHbwm0CjQrcKKIqE4XDGlK2xJn7fHKzCmP/ob/Cmwkta5xvTXEbCag/Vui4V1/baJKbI/5P
 XY8=
X-SBRS: 2.7
X-MesageID: 1258762
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1258762"
Date: Mon, 3 Jun 2019 18:15:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190603171558.GF2126@perard.uk.xensource.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDU6NTI6MTJQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IFRoZSBzYW1lIGVycm9yIGNhbm5vdCBiZSByZXByb2R1Y2VkIG9uIGxheHRvbiouIExv
b2tpbmcgYXQgdGhlIHRlc3QgaGlzdG9yeSwKPiBpdCBsb29rcyBsaWtlIHFlbXUtdXBzdHJlYW0t
NC4xMi10ZXN0aW5nIGZsaWdodCBoYXMgcnVuIHN1Y2Nlc3NmdWxseSBhIGZldwo+IHRpbWVzIG9u
IHJvY2hlc3RlciouIFNvIHdlIG1heSBoYXZlIGZpeGVkIHRoZSBlcnJvciBpbiBYZW4gNC4xMi4K
PiAKPiBQb3RlbnRpYWwgY2FuZGlkYXRlcyB3b3VsZCBiZToKPiAgICAtIDAwYzk2ZDc3NDIgInhl
bi9hcm06IG1tOiBTZXQtdXAgcGFnZSBwZXJtaXNzaW9uIGZvciBYZW4gbWFwcGluZ3MgZWFybGll
ciBvbiIKPiAgICAtIGY2MDY1OGM2YWUgInhlbi9hcm06IFN0b3AgcmVsb2NhdGluZyBYZW4iCj4g
Cj4gSWFuLCBpcyBpdCBzb21ldGhpbmcgdGhlIGJpc2VjdG9yIGNvdWxkIGF1dG9tYXRpY2FsbHkg
bG9vayBhdD8KPiBJZiBub3QsIEkgd2lsbCBuZWVkIHRvIGZpbmQgc29tZSB0aW1lIGFuZCBib3Jy
b3cgdGhlIGJvYXJkIHRvIGJpc2VjdCB0aGUKPiBpc3N1ZXMuCgpJIGF0dGVtcHRlZCB0byBkbyB0
aGF0IGJpc2VjdGlvbiBteXNlbGYsIGFuZCB0aGUgZmlyc3QgY29tbWl0IHRoYXQgZ2l0CndhbnRl
ZCB0byB0cnksIGEgY29tbW9uIGNvbW1pdCB0byBib3RoIGJyYW5jaGVzLCBib290cyBqdXN0IGZp
bmUuCgpJdCB0dXJucyBvdXQgdGhhdCB0aGUgZmlyc3QgY29tbWl0IHRoYXQgZmFpbHMgdG8gYm9v
dCBvbiByb2NoZXN0ZXIgaXMKICBlMjAyZmViNzEzIHhlbi9jbWRsaW5lOiBGaXggYnVnZ3kgc3Ry
bmNtcChzLCBMSVRFUkFMLCBzcyAtIHMpIGNvbnN0cnVjdAooZXZlbiB3aXRoIHRoZSAiZWI4YWNi
YTgyYSB4ZW46IEZpeCBiYWNrcG9ydCBvZiAuLiIgYXBwbGllZCkKCgpJIGRpZCB0cnkgYSBmZXcg
Y29tbWl0cyBmcm9tIHN0YWJsZS00LjEyIGJyYW5jaGVzIGFuZCB0aGV5IGFsbCBib290ZWQKanVz
dCBmaW5lIG9uIHJvY2hlc3Rlci4KCgpOb3cgYWJvdXQgdGhlIHBvdGVudGlhbCBjYW5kaWRhdGVz
Ogo+ICAgIC0gMDBjOTZkNzc0MiAieGVuL2FybTogbW06IFNldC11cCBwYWdlIHBlcm1pc3Npb24g
Zm9yIFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uIgoKVGhpcyBjb21taXQgYWxvbmUsIGNoZXJyeS1w
aWNrZWQgb24gdG9wIG9mIHN0YWJsZS00LjExIG1ha2VzIHhlbiBib290IG9uCnJvY2hlc3Rlci4K
Cj4gICAgLSBmNjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuIgoKV2l0aCB0
aGF0IGNvbW1pdCBhcHBsaWVkLCB4ZW4gZG9lc24ndCBidWlsZC4gU28gSSBjb3VsZG4ndCB0cnkg
dG8gYm9vdAppdC4gKG1tLmM6IEluIGZ1bmN0aW9uIOKAmHNldHVwX3BhZ2V0YWJsZXPigJk6IG1t
LmM6NjUzOjQyOiBlcnJvcjog4oCYeGVuX3BhZGRy4oCZIHVuZGVjbGFyZWQgKQoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
