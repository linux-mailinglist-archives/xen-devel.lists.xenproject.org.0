Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDCFD0966
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI75q-000626-AS; Wed, 09 Oct 2019 08:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g1i0=YC=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iI75o-000621-SG
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:13:08 +0000
X-Inumbo-ID: 9d422acc-ea6c-11e9-8c93-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d422acc-ea6c-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 08:13:04 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id ADABC2001A4;
 Wed,  9 Oct 2019 19:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1570608781; bh=hErnnRNBTorTZRDhoH6DbJzVzgu7ZAzuGffDRKk/jPs=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=dvf5vsC2ZmHOTJyHAn/5GvFtOztK2MdwiwH1qdaG9f0MsK6ZKqwlgmdz8oAR1iAV1
 YUmOxdPAC184txWukpxkl2TEQGM8UIg5PoJJmxi2SuMvNjptwYt/NOZjhMsy6ug8EL
 8VjtThouWHbbiMOY7YmaETgXs9OqVgJmO5dRcCtY=
Date: Wed, 09 Oct 2019 19:12:58 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: M A Young <m.a.young@durham.ac.uk>
Message-Id: <1570608778.2508.1@crc.id.au>
In-Reply-To: <alpine.LFD.2.21.1910090855001.4406@algedi.dur.ac.uk>
References: <1570594496.2508.0@crc.id.au>
 <alpine.LFD.2.21.1910090855001.4406@algedi.dur.ac.uk>
X-Mailer: geary/3.34.0
MIME-Version: 1.0
Subject: Re: [Xen-devel] /sys/hypervisor entries for Xen (Domain-0, PV,
 PVH and HVM)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIE1pY2hhZWwsCgpJbiB0aGUgbWVhbnRpbWUsIHdlJ3JlIGxvb2tpbmcgYXQganVzdCBk
aXNhYmxpbmcgQkxTIGJ5IGRlZmF1bHQgaW4gdGhlIApncnViIHBhY2thZ2VzIHdpdGhpbiBGZWRv
cmEgd2hlbiBpdHMgcnVuIG9uIGEgWGVuIGd1ZXN0LiBUaGlzIG1lYW5zIHdlIApzaG91bGQgYXQg
bGVhc3QgYmUgYXQgYSBwb2ludCB3aGVyZSBGZWRvcmEgZ3Vlc3RzIHdpbGwgd29yayByZWxpYWJs
eSAKYWdhaW4gYXMgWGVuIGd1ZXN0cy4KCkl0IHNlZW1zIHRvIGJlIGFncmVlZCB0aGF0IHRoaXMg
d2lsbCBzdGF5IGluIHBsYWNlIHVudGlsIHN1Y2ggcG9pbnQgCndoZXJlIHB5Z3J1YiB1bmRlcnN0
YW5kcyBCTFMgYW5kIHRoaXMgbm8gbG9uZ2VyIGJlY29tZXMgYW4gaXNzdWUgLSBhbmQgCmxpa2Vs
eSB0aGVyZSdkIGJlIHNvbWUgb3ZlcmxhcCB0byBsZXQgdGhlIHVwZGF0ZWQgcHlncnViIHNwcmVh
ZCBhcyBmYXIgCmFzIHBvc3NpYmxlIGJlZm9yZSB5YW5raW5nIG91dCB0aGlzIHdvcmthcm91bmQu
CgpGb3Igbm93LCB0aGUgb25seSBiaWcgaXNzdWUgdGhhdCByZW1haW5zIGlzIHRoYXQgdGhlIGN1
cnJlbnQgcHlncnViIAp3aWxsIGFsd2F5cyBib290IHRoZSBzZWNvbmQgaW1hZ2UgaW4gdGhlIGxp
c3QgZHVlIHRvIHB5Z3J1YiBpbmNvcnJlY3RseSAKcGFyc2luZyB0aGUgZmFpbG92ZXIgc2VjdGlv
bnMgb2YgdGhlIEZlZG9yYSBncnViLmNmZyB3aGVyZSB0aGUgZmFpbG92ZXIgCndpbGwgc2V0ICdk
ZWZhdWx0PTEnIGNhdXNpbmcgdGhpcyBiZWhhdmlvdXIuCgpBc3N1bWluZyB0aGF0IHRoZSBGZWRv
cmEgc2lkZSBpcyByZXNvbHZlZCwgYW5kIHdlIGFsd2F5cyBnZXQgYSBub24tQkxTIApncnViLmNm
ZyBpbiBhIEZlZG9yYSBndWVzdCwgaXMgdGhlcmUgYSBzaW1wbGVyIGZpeCB0aGF0IGNvdWxkIGJl
IAppbmNsdWRlZCBiZWZvcmUgWGVuIDQuMTMgZ2V0cyBsYXVuY2hlZCAoYW5kIGhvcGVmdWxseSBi
YWNrcG9ydGVkKT8KCkknbSBub3Qgc3VyZSBpZiB0aGUgcHJvcG9zZWQgY2hhbmdlcyB0byBGZWRv
cmEgbWFrZXMgdGhpcyBhIGxpdHRsZSAKc2ltcGxlciBpbiBmaXhpbmcgdGhlIGVudGlyZSBpc3N1
ZS4KCihhcG9sb2dpZXMgZm9yIHRvcCBwb3N0aW5nLCBHZWFyeSBkb2Vzbid0IHNlZW0gdG8gbGlr
ZSBsZXR0aW5nIG1lIApib3R0b20gcG9zdCEpCgpTdGV2ZW4gSGFpZ2gKCvCfk6cgbmV0d2l6QGNy
Yy5pZC5hdSAgICAg8J+SuyBodHRwczovL3d3dy5jcmMuaWQuYXUK8J+TniArNjEzIDkwMDEgNjA5
MCAgICAgICDwn5OxICs2MTQgMTI5MyA1ODk3CgoKT24gV2VkLCBPY3QgOSwgMjAxOSBhdCAwOTow
MCwgTSBBIFlvdW5nIDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPiB3cm90ZToKPiBPbiBXZWQsIDkg
T2N0IDIwMTksIFN0ZXZlbiBIYWlnaCB3cm90ZToKPiAKPj4gIEhpIGFsbCwKPj4gCj4+ICBJJ20g
d29ya2luZyBvbiBmaXhpbmcgdXAgdGhlIGdydWIgcGFja2FnZXMgZm9yIEZlZG9yYSBpbiBkZWR1
Y2luZyAKPj4gdGhlIG5ldyBCTFMKPj4gIGxvZ2ljIGluIEZlZG9yYSBhbmQgZGlzYWJsaW5nIGl0
IGluIG5vbi1jb21wYXRpYmxlIGVudmlyb25tZW50cy4KPj4gCj4+ICBCWiBSZXBvcnQ6Cj4+ICBo
dHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3MDM3MDAKPj4gCj4+
ICBDdXJyZW50bHksIGl0IHNlZW1zIHRoYXQgd2UgY2FuIGRlZHVjZSB0aGUgZm9sbG93aW5nIHR3
byBzY2VuYXJpb3M6Cj4+IAo+PiAgaW4gL3N5cy9oeXBlcnZpc29yOgo+PiAKPj4gIDEpIHR5cGUg
PT0geGVuICYmIHV1aWQgPT0gYWxsIHplcm9zLCB0aGVuIHRoaXMgaXMgQkxTIHNhZmUgKHRoZSAK
Pj4gRG9tYWluLTApLgo+PiAgMikgdHlwZSA9PSB4ZW4gJiYgdXVpZCAhPSBhbGwgemVyb3MsIHRo
ZW4gdGhpcyBpcyBCTFMgKnVuc2FmZSogCj4+IChjb3ZlcnMgUFYsIEhWTQo+PiAgYW5kIFBWSCBn
dWVzdHMpLgo+PiAKPj4gIElzIHRoZXJlIGFueSBvdGhlciB2YXJpYWJsZXMgdGhhdCBjb21lIGlu
dG8gZWZmZWN0IHRoYXQgY291bGQgY2F1c2UgCj4+IGEKPj4gIHZhcmlhdGlvbiBpbiB0aGUgYWJv
dmUgY2hlY2tzIGFzIHRvIGVuYWJsZSBvciBkaXNhYmxlIEJMUz8KPj4gCj4+ICBSaWdodCBub3cs
IEknbSBwcm9wb3NpbmcgdGhhdCB3ZSB0cnkgdG8gZGlzYWJsZSB0aGUgbmV3IEJMUyAKPj4gYmVo
YXZpb3VyIGluCj4+ICBGZWRvcmEgZm9yIFBWLCBIVk0gYW5kIFBWSCBndWVzdHMgLSBhcyBweWdy
dWIgaXMgbm90IHVwIHRvIHRoZSB0YXNrIAo+PiBvZiBib290aW5nCj4+ICB0aGVtLiBXZSBpbmNs
dWRlZCBIVk0gYXMgaXQgbWF5IGJlIGNvbW1vbiBmb3IgdXNlcnMgdG8gc3dpdGNoIAo+PiBiZXR3
ZWVuIEhWTSBhbmQKPj4gIFBWSCBjb25maWd1cmF0aW9ucyBmb3IgdGhlIHNhbWUgaW5zdGFsbGVk
IFZNLgo+IAo+IEkgZG8gaGF2ZSBhIGxvbmcgdGVybSBwbGFuIHRvIHRyeSB0byBnZXQgcHlncnVi
IHRvIGhhbmRsZSBCTFMsIHRob3VnaCAKPiBJCj4gZG9uJ3QgZXhwZWN0IHRvIGhhdmUgaXQgd29y
a2luZyBzb29uLgo+IAo+IAlNaWNoYWVsIFlvdW5nCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
