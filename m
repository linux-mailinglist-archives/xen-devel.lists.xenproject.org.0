Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD71EC35
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQrEv-00074j-N2; Wed, 15 May 2019 10:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ez+k=TP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQrEu-00074e-2K
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:34:24 +0000
X-Inumbo-ID: ffc79594-76fc-11e9-bb70-83019d3d38df
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffc79594-76fc-11e9-bb70-83019d3d38df;
 Wed, 15 May 2019 10:34:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 9tagBSbFEJnPhMV+eiJHopzCvQTQ4qRUegBGij3zco63kktsxNTWcIOv/nshKOIgYSf1zyYQX0
 fx/UKZOaOf8MS2axulHrPewNAtJKTyRXP0ZEhMmEof/iivgSVYFfDGTIeKbPLwXEer0Uk8LfZB
 n8gj1Ha17Tsaq/r7A1eTbCR/xSuv+mSqG45sXow2xj5U9H1OFU9WUvhqq8TmG9FH6BPDHjMAiX
 e2WYe245ZZ14S9sKwKOBKz74LZDVXnLi5DG+dCsHGwh9dpPDl1Y4GTEKOSjE82P8em1s1G5x0e
 wSA=
X-SBRS: 2.7
X-MesageID: 449207
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="449207"
Date: Wed, 15 May 2019 12:34:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <20190515103407.kezb3vnmyhceem7w@Air-de-Roger>
References: <osstest-136291-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-136291-mainreport@xen.org>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 136291: regressions - FAIL
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6MjQ6NDRBTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzYyOTEgeGVuLXVuc3RhYmxlLXNtb2tlIHJlYWwgW3Jl
YWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEz
NjI5MS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2Nl
ZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJl
IHJ1bjoKPiAgYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAg
ICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM2MTc5CgpUaGUgZXJyb3IgaXM6CgpwMm0uYzogSW4g
ZnVuY3Rpb24gJ2FsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5JzoKcDJtLmM6NTAyOjI2OiBlcnJv
cjogJ3BhZ2Vfb3JkZXInIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlv
biBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogICAgICAgICBpZiAoIHByZXBvcHVsYXRl
ICYmIHBhZ2Vfb3JkZXIgIT0gUEFHRV9PUkRFUl80SyApCgpJIHRoaW5rIHRoZSBhYm92ZSBwYXRj
aCBzaG91bGQgc29sdmUgaXQsIEFGQUlDVCBpdCdzIG5vdCBhIHJlYWwKdW5pbml0aWFsaXplZCB1
c2FnZS4KCi0tLTg8LS0tCkZyb20gZmQxMmZhZjA4OGVhNjc5ZmRmYjg2YjQ3NTg0MDM2OTJlZTk5
ZTA2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KRGF0ZTogV2VkLCAxNSBNYXkgMjAxOSAxMjozMjozOCArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIGFsdHAybTogcGxhY2F0ZSB1bmluaXRpYWxpemVkIHZhcmlhYmxlIGVy
cm9yCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpnY2MgcmVwb3J0czoKCnAybS5j
OiBJbiBmdW5jdGlvbiAnYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnknOgpwMm0uYzo1MDI6MjY6
IGVycm9yOiAncGFnZV9vcmRlcicgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1
bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAgICAgICAgIGlmICggcHJlcG9w
dWxhdGUgJiYgcGFnZV9vcmRlciAhPSBQQUdFX09SREVSXzRLICkKClBsYWNhdGUgdGhlIGVycm9y
IGJ5IGluaXRpYWxpemluZyBwYWdlX29yZGVyIHRvIDAuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJt
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJt
LmMKaW5kZXggNTdjNWVlZGE5MS4uMTMzMTA2OTYyYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMjM1Miw3ICsyMzUyLDcg
QEAgaW50IGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICphcDJt
LCBnZm5fdCBnZm4sIG1mbl90ICptZm4sCiAgICAgaWYgKCAhbWZuX3ZhbGlkKCptZm4pICYmICFw
Mm1faXNfaG9zdHAybShhcDJtKSApCiAgICAgewogICAgICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
aHAybSA9IHAybV9nZXRfaG9zdHAybShhcDJtLT5kb21haW4pOwotICAgICAgICB1bnNpZ25lZCBp
bnQgcGFnZV9vcmRlcjsKKyAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIgPSAwOwogICAg
ICAgICBpbnQgcmM7CiAKICAgICAgICAgKm1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhocDJt
LCBnZm5feChnZm4pLCB0LCBhLAotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
