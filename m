Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91A1348EF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEug-0000Sj-Tb; Wed, 08 Jan 2020 17:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEuf-0000Sc-RZ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:14:33 +0000
X-Inumbo-ID: 5603e6bc-323a-11ea-b85f-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5603e6bc-323a-11ea-b85f-12813bfff9fa;
 Wed, 08 Jan 2020 17:14:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806060"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:29 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:13:57 -0800
Message-Id: <cover.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBzZXJpZXMgaW1wbGVtZW50cyBWTSBmb3JraW5nIGZvciBJbnRlbCBIVk0g
Z3Vlc3RzIHRvIGFsbG93IGZvcgp0aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVudGljYWwgVk1zIHdp
dGhvdXQgdGhlIGFzc29zY2lhdGVkIGhpZ2ggc3RhcnR1cCBjb3N0cwpvZiBib290aW5nIG9yIHJl
c3RvcmluZyB0aGUgVk0gZnJvbSBhIHNhdmVmaWxlLgoKSklSQSBpc3N1ZTogaHR0cHM6Ly94ZW5w
cm9qZWN0LmF0bGFzc2lhbi5uZXQvYnJvd3NlL1hFTi04OQoKVGhlIGZvcmsgb3BlcmF0aW9uIGlz
IGltcGxlbWVudGVkIGFzIHBhcnQgb2YgdGhlICJ4bCBmb3JrLXZtIiBjb21tYW5kOgogICAgeGwg
Zm9yay12bSAtQyA8Y29uZmlnX2ZpbGVfZm9yX2Zvcms+IC1RIDxxZW11X3NhdmVfZmlsZT4gPHBh
cmVudF9kb21pZD4KICAgIApCeSBkZWZhdWx0IGEgZnVsbHkgZnVuY3Rpb25hbCBmb3JrIGlzIGNy
ZWF0ZWQuIFRoZSB1c2VyIGlzIGluIGNoYXJnZSBob3dldmVyIHRvCmNyZWF0ZSB0aGUgYXBwcm9w
cmlhdGUgY29uZmlnIGZpbGUgZm9yIHRoZSBmb3JrIGFuZCB0byBnZW5lcmF0ZSB0aGUgUUVNVSBz
YXZlCmZpbGUgYmVmb3JlIHRoZSBmb3JrLXZtIGNhbGwgaXMgbWFkZS4gVGhlIGNvbmZpZyBmaWxl
IG5lZWRzIHRvIGdpdmUgdGhlCmZvcmsgYSBuZXcgbmFtZSBhdCBtaW5pbXVtIGJ1dCBvdGhlciBz
ZXR0aW5ncyBtYXkgYWxzbyByZXF1aXJlIGNoYW5nZXMuCgpUaGUgaW50ZXJmYWNlIGFsc28gYWxs
b3dzIHRvIHNwbGl0IHRoZSBmb3JraW5nIGludG8gdHdvIHN0ZXBzOgogICAgeGwgZm9yay12bSAt
LWxhdW5jaC1kbSBubyBcCiAgICAgICAgICAgICAgIC1wIDxwYXJlbnRfZG9taWQ+CiAgICB4bCBm
b3JrLXZtIC0tbGF1bmNoLWRtIGxhdGUgXAogICAgICAgICAgICAgICAtQyA8Y29uZmlnX2ZpbGVf
Zm9yX2Zvcms+IFwKICAgICAgICAgICAgICAgLVEgPHFlbXVfc2F2ZV9maWxlPiBcCiAgICAgICAg
ICAgICAgIDxmb3JrX2RvbWlkPgoKVGhlIHNwbGl0IGNyZWF0aW9uIG1vZGVsIGlzIHVzZWZ1bCB3
aGVuIHRoZSBWTSBuZWVkcyB0byBiZSBjcmVhdGVkIGFzIGZhc3QgYXMKcG9zc2libGUuIFRoZSBm
b3JrZWQgVk0gY2FuIGJlIHVucGF1c2VkIHdpdGhvdXQgdGhlIGRldmljZSBtb2RlbCBiZWluZyBs
YXVuY2hlZAp0byBiZSBtb25pdG9yZWQgYW5kIGFjY2Vzc2VkIHZpYSBWTUkuIE5vdGUgaG93ZXZl
ciB0aGF0IHdpdGhvdXQgaXRzIGRldmljZQptb2RlbCBydW5uaW5nIChkZXBlbmRpbmcgb24gd2hh
dCBpcyBleGVjdXRpbmcgaW4gdGhlIFZNKSBpdCBpcyBib3VuZCB0bwptaXNiZWhhdmUgb3IgZXZl
biBjcmFzaCB3aGVuIGl0cyB0cnlpbmcgdG8gYWNjZXNzIGRldmljZXMgdGhhdCB3b3VsZCBiZQpl
bXVsYXRlZCBieSBRRU1VLiBXZSBhbnRpY2lwYXRlIHRoYXQgZm9yIGNlcnRhaW4gdXNlLWNhc2Vz
IHRoaXMgd291bGQgYmUgYW4KYWNjZXB0YWJsZSBzaXR1YXRpb24sIGluIGNhc2UgZm9yIGV4YW1w
bGUgd2hlbiBmdXp6aW5nIGlzIHBlcmZvcm1lZCBvZiBjb2RlCnNlZ21lbnRzIHRoYXQgZG9uJ3Qg
YWNjZXNzIHN1Y2ggZGV2aWNlcy4KCkxhdW5jaGluZyB0aGUgZGV2aWNlIG1vZGVsIHJlcXVpcmVz
IHRoZSBRRU1VIFhlbiBzYXZlZmlsZSB0byBiZSBnZW5lcmF0ZWQKbWFudWFsbHkgZnJvbSB0aGUg
cGFyZW50IFZNLiBUaGlzIGNhbiBiZSBhY2NvbXBsaXNoZWQgc2ltcGx5IGJ5IGNvbm5lY3Rpbmcg
dG8KaXRzIFFNUCBzb2NrZXQgYW5kIGlzc3VpbmcgdGhlICJ4ZW4tc2F2ZS1kZXZpY2VzLXN0YXRl
IiBjb21tYW5kLiBGb3IgZXhhbXBsZQp1c2luZyB0aGUgc3RhbmRhcmQgdG9vbCBzb2NhdCB0aGVz
ZSBjb21tYW5kcyBjYW4gYmUgdXNlZCB0byBnZW5lcmF0ZSB0aGUgZmlsZToKICAgIHNvY2F0IC0g
VU5JWC1DT05ORUNUOi92YXIvcnVuL3hlbi9xbXAtbGlieGwtPHBhcmVudF9kb21pZD4KICAgIHsg
ImV4ZWN1dGUiOiAicW1wX2NhcGFiaWxpdGllcyIgfQogICAgeyAiZXhlY3V0ZSI6ICJ4ZW4tc2F2
ZS1kZXZpY2VzLXN0YXRlIiwgXAogICAgICAgICJhcmd1bWVudHMiOiB7ICJmaWxlbmFtZSI6ICIv
cGF0aC90by9zYXZlL3FlbXVfc3RhdGUiLCBcCiAgICAgICAgICAgICAgICAgICAgICAgICJsaXZl
IjogZmFsc2V9IH0KCkF0IHJ1bnRpbWUgdGhlIGZvcmtlZCBWTSBzdGFydHMgcnVubmluZyB3aXRo
IGFuIGVtcHR5IHAybSB3aGljaCBnZXRzIGxhemlseQpwb3B1bGF0ZWQgd2hlbiB0aGUgVk0gZ2Vu
ZXJhdGVzIEVQVCBmYXVsdHMsIHNpbWlsYXIgdG8gaG93IGFsdHAybSB2aWV3cyBhcmUKcG9wdWxh
dGVkLiBJZiB0aGUgbWVtb3J5IGFjY2VzcyBpcyBhIHJlYWQtb25seSBhY2Nlc3MsIHRoZSBwMm0g
ZW50cnkgaXMKcG9wdWxhdGVkIHdpdGggYSBtZW1vcnkgc2hhcmVkIGVudHJ5IHdpdGggaXRzIHBh
cmVudC4gRm9yIHdyaXRlIG1lbW9yeSBhY2Nlc3NlcwpvciBpbiBjYXNlIG1lbW9yeSBzaGFyaW5n
IHdhc24ndCBwb3NzaWJsZSAoZm9yIGV4YW1wbGUgaW4gY2FzZSBhIHJlZmVyZW5jZSBpcwpoZWxk
IGJ5IGEgdGhpcmQgcGFydHkpLCBhIG5ldyBwYWdlIGlzIGFsbG9jYXRlZCBhbmQgdGhlIHBhZ2Ug
Y29udGVudHMgYXJlCmNvcGllZCBvdmVyIGZyb20gdGhlIHBhcmVudCBWTS4gRm9ya3MgY2FuIGJl
IGZ1cnRoZXIgZm9ya2VkIGlmIG5lZWRlZCwgdGh1cwphbGxvd2luZyBmb3IgZnVydGhlciBtZW1v
cnkgc2F2aW5ncy4KCkEgVk0gZm9yayByZXNldCBoeXBlcmNhbGwgaXMgYWxzbyBhZGRlZCB0aGF0
IGFsbG93cyB0aGUgZm9yayB0byBiZSByZXNldCB0byB0aGUKc3RhdGUgaXQgd2FzIGp1c3QgYWZ0
ZXIgYSBmb3JrLCBhbHNvIGFjY2Vzc2libGUgdmlhIHhsOgogICAgeGwgZm9yay12bSAtLWZvcmst
cmVzZXQgLXAgPGZvcmtfZG9taWQ+CgpUaGlzIGlzIGFuIG9wdGltaXphdGlvbiBmb3IgY2FzZXMg
d2hlcmUgdGhlIGZvcmtzIGFyZSB2ZXJ5IHNob3J0LWxpdmVkIGFuZCBydW4Kd2l0aG91dCBhIGRl
dmljZSBtb2RlbCwgc28gcmVzZXR0aW5nIHNhdmVzIHNvbWUgdGltZSBjb21wYXJlZCB0byBjcmVh
dGluZyBhCmJyYW5kIG5ldyBmb3JrIHByb3ZpZGVkIHRoZSBmb3JrIGhhcyBub3QgYXF1aXJlZCBh
IGxvdCBvZiBtZW1vcnkuIElmIHRoZSBmb3JrCmhhcyBhIGxvdCBvZiBtZW1vcnkgZGVkdXBsaWNh
dGVkIGl0IGlzIGxpa2VseSBnb2luZyB0byBiZSBmYXN0ZXIgdG8gY3JlYXRlIGEKbmV3IGZvcmsg
ZnJvbSBzY3JhdGNoIGFuZCBhc3luY2hyb25vdXNseSBkZXN0cm95aW5nIHRoZSBvbGQgb25lLgoK
VGhlIHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBib3RoIExpbnV4IGFuZCBXaW5kb3dzIFZN
cyBhbmQgZnVuY3Rpb25zIGFzCmV4cGVjdGVkLiBWTSBmb3JraW5nIHRpbWUgaGFzIGJlZW4gbWVh
c3VyZWQgdG8gYmUgMC4wMDA3cywgZGV2aWNlIG1vZGVsIGxhdW5jaAp0byBiZSBhcm91bmQgMXMg
ZGVwZW5kaW5nIGxhcmdlbHkgb24gdGhlIG51bWJlciBvZiBkZXZpY2VzIGJlaW5nIGVtdWxhdGVk
LiBGb3JrCnJlc2V0cyBoYXZlIGJlZW4gbWVhc3VyZWQgdG8gYmUgMC4wMDAxcyB1bmRlciB0aGUg
b3B0aW1hbCBjaXJjdW1zdGFuY2VzLgoKUGF0Y2hlcyAxLTIgaW1wbGVtZW50IGNoYW5nZXMgdG8g
ZXhpc3RpbmcgaW50ZXJuYWwgWGVuIEFQSXMgdG8gbWFrZSBWTSBmb3JraW5nCnBvc3NpYmxlLgoK
UGF0Y2hlcyAzLTE0IGFyZSBjb2RlLWNsZWFudXBzIGFuZCBhZGp1c3RtZW50cyBvZiB0byBYZW4g
bWVtb3J5IHNoYXJpbmcKc3Vic3lzdGVtIHdpdGggbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKUGF0
Y2ggMTUgYWRkcyB0aGUgaHlwZXJ2aXNvci1zaWRlIGNvZGUgaW1wbGVtZW50aW5nIFZNIGZvcmtp
bmcuCgpQYXRjaCAxNiBpcyBpbnRlZ3JhdGlvbiBvZiBtZW1fYWNjZXNzIHdpdGggZm9ya2VkIFZN
cy4KClBhdGNoIDE3IGltcGxlbWVudHMgdGhlIFZNIGZvcmsgcmVzZXQgb3BlcmF0aW9uIGh5cGVy
dmlzb3Igc2lkZSBiaXRzLgoKUGF0Y2ggMTggYWRkcyB0aGUgdG9vbHN0YWNrLXNpZGUgY29kZSBp
bXBsZW1lbnRpbmcgVk0gZm9ya2luZyBhbmQgcmVzZXQuCgpUYW1hcyBLIExlbmd5ZWwgKDE4KToK
ICB4ODYvaHZtOiBpbnRyb2R1Y2UgaHZtX2NvcHlfY29udGV4dF9hbmRfcGFyYW1zCiAgeGVuL3g4
NjogTWFrZSBoYXBfZ2V0X2FsbG9jYXRpb24gYWNjZXNzaWJsZQogIHg4Ni9tZW1fc2hhcmluZzog
bWFrZSBnZXRfdHdvX2dmbnMgdGFrZSBsb2NrcyBjb25kaXRpb25hbGx5CiAgeDg2L21lbV9zaGFy
aW5nOiBkcm9wIGZsYWdzIGZyb20gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlCiAgeDg2L21lbV9z
aGFyaW5nOiBkb24ndCB0cnkgdG8gdW5zaGFyZSB0d2ljZSBkdXJpbmcgcGFnZSBmYXVsdAogIHg4
Ni9tZW1fc2hhcmluZzogZGVmaW5lIG1lbV9zaGFyaW5nX2RvbWFpbiB0byBob2xkIHNvbWUgc2Nh
dHRlcmVkCiAgICB2YXJpYWJsZXMKICB4ODYvbWVtX3NoYXJpbmc6IFVzZSBJTlZBTElEX01GTiBh
bmQgcDJtX2lzX3NoYXJlZCBpbgogICAgcmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMKICB4ODYvbWVt
X3NoYXJpbmc6IE1ha2UgYWRkX3RvX3BoeXNtYXAgc3RhdGljIGFuZCBzaG9ydGVuIG5hbWUKICB4
ODYvbWVtX3NoYXJpbmc6IENvbnZlcnQgTUVNX1NIQVJJTkdfREVTVFJPWV9HRk4gdG8gYSBib29s
CiAgeDg2L21lbV9zaGFyaW5nOiBSZXBsYWNlIE1FTV9TSEFSSU5HX0RFQlVHIHdpdGggZ2Rwcmlu
dGsKICB4ODYvbWVtX3NoYXJpbmc6IEFTU0VSVCB0aGF0IHAybV9zZXRfZW50cnkgc3VjY2VlZHMK
ICB4ODYvbWVtX3NoYXJpbmc6IEVuYWJsZSBtZW1fc2hhcmluZyBvbiBmaXJzdCBtZW1vcAogIHg4
Ni9tZW1fc2hhcmluZzogU2tpcCB4ZW4gaGVhcCBwYWdlcyBpbiBtZW1zaHIgbm9taW5hdGUKICB4
ODYvbWVtX3NoYXJpbmc6IGNoZWNrIHBhZ2UgdHlwZSBjb3VudCBlYXJsaWVyCiAgeGVuL21lbV9z
aGFyaW5nOiBWTSBmb3JraW5nCiAgeGVuL21lbV9hY2Nlc3M6IFVzZSBfX2dldF9nZm5fdHlwZV9h
Y2Nlc3MgaW4gc2V0X21lbV9hY2Nlc3MKICB4ODYvbWVtX3NoYXJpbmc6IHJlc2V0IGEgZm9yawog
IHhlbi90b29sczogVk0gZm9ya2luZyB0b29sc3RhY2sgc2lkZQoKIGRvY3MvbWFuL3hsLjEucG9k
LmluICAgICAgICAgICAgICB8ICAzNiArKysKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5o
ICAgICB8ICAxMyArCiB0b29scy9saWJ4Yy94Y19tZW1zaHIuYyAgICAgICAgICAgfCAgMjIgKysK
IHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgICB8ICAgNyArCiB0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyAgICAgICAgfCAyMzcgKysrKysrKysrLS0tLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RtLmMgICAgICAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAg
ICAgICAgIHwgIDgzICsrKy0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgICAgfCAg
IDEgKwogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAgICAgIHwgICAxICsKIHRvb2xzL3hs
L3hsLmggICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB0b29scy94bC94bF9jbWR0YWJsZS5j
ICAgICAgICAgICAgfCAgMTIgKwogdG9vbHMveGwveGxfc2F2ZXJlc3RvcmUuYyAgICAgICAgIHwg
IDk2ICsrKysrKwogdG9vbHMveGwveGxfdm1jb250cm9sLmMgICAgICAgICAgIHwgICA4ICsKIHhl
bi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICB8IDI3MSArKysrKysrKysrLS0tLS0tCiB4
ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAgICAgfCAgIDMgKy0KIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMgICAgICB8ICAgNSArLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMgICAgIHwgNTAxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogeGVuL2FyY2gveDg2
L21tL3AybS5jICAgICAgICAgICAgIHwgIDE2ICstCiB4ZW4vY29tbW9uL21lbW9yeS5jICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICB8ICAg
MyArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXAuaCAgICAgICAgIHwgICAxICsKIHhlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oICB8ICAgNiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vaHZtLmggICAgIHwgICAyICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCB8
ICA0MyArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggICAgICAgICB8ICAxNCArLQogeGVu
L2luY2x1ZGUvcHVibGljL21lbW9yeS5oICAgICAgIHwgICA2ICsKIHhlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oICAgICAgICAgICB8ICAgMSArCiAyNyBmaWxlcyBjaGFuZ2VkLCAxMDU4IGluc2VydGlv
bnMoKyksIDMzOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
