Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D4EC1101
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 16:12:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEDO7-0001o1-GJ; Sat, 28 Sep 2019 14:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJPU=XX=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iEDO5-0001k9-OC
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 14:07:53 +0000
X-Inumbo-ID: 58333dde-e1f9-11e9-b588-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by localhost (Halon) with ESMTPS
 id 58333dde-e1f9-11e9-b588-bc764e2007e4;
 Sat, 28 Sep 2019 14:07:47 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id EE8AD2000FD;
 Sun, 29 Sep 2019 00:07:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1569679664; bh=zqWbhThSXTsQpCCyJfgv2DxOfCwdmKn/7YHsf+Isfpg=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=ZMKHflPkGs5tfzMiDvB391J7GZs6mmnWgfIpgQG08+w+NFBIwAeO/ODLxcFePWuQJ
 GhD7cxFDH+c9l+gWPA5HaGnKYdMROUCZW7Jo1Q3/b6tBxwsqPw4cV0gglhe+NSAiUo
 VhAj50gU6YfwaXPEYzuFNIqqlYhPC6ZthObwbYy4=
Date: Sun, 29 Sep 2019 00:07:43 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org, jgross@suse.com
Message-Id: <1569679663.2427.0@crc.id.au>
In-Reply-To: <20190928050923.23540-1-jgross@suse.com>
References: <20190928050923.23540-1-jgross@suse.com>
X-Mailer: geary/3.34.0
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, wl@xen.org, andrew.cooper3@citrix.com,
 marmarek@invisiblethingslab.com, olekstysh@gmail.com, paul.durrant@citrix.com,
 JBeulich@suse.com, puwen@hygon.cn, roger.pau@citrix.com,
 Volodymyr_Babchuk@epam.com, chao.gao@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIHJpc2sgb2Ygc291bmRpbmcgbGlrZSBhIGJyb2tlbiByZWNvcmQsIGlzIHRoZXJlIGFu
IHByb2dyZXNzIHdpdGggCmludmVzdGlnYXRpb25zIG9uIHRoZSBBTUQgUnl6ZW4gM3h4eCBzZXJp
ZXMgYW5kIFdpbmRvd3MgSFZNIHN5c3RlbXM/ClN0ZXZlbiBIYWlnaAoK8J+TpyBuZXR3aXpAY3Jj
LmlkLmF1ICAgICDwn5K7IGh0dHBzOi8vd3d3LmNyYy5pZC5hdQrwn5OeICs2MTMgOTAwMSA2MDkw
ICAgICAgIPCfk7EgKzYxNCAxMjkzIDU4OTcKCgpPbiBTYXQsIFNlcCAyOCwgMjAxOSBhdCAwNzow
OSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBcyBtdWx0aXBsZSBy
YXRoZXIgaW1wb3J0YW50IHBhdGNoIHNlcmllcyBhcmUgdmVyeSBzaG9ydCBiZWZvcmUgYmVpbmcg
Cj4gcmVhZHkKPiBJIGhhdmUgZGVjaWRlZCB0byBwdXNoIHRoZSBoYXJkIGNvZGUgZnJlZXplIG9u
ZSB3ZWVrIGJhY2sgdG8gT2N0b2JlciAKPiA0dGguCj4gCj4gVGhpcyBlbWFpbCBvbmx5IHRyYWNr
cyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciAKPiBpdGVtcyB5
b3UKPiB3b3VsZCBsaWtlIHRvIHNlZSBpbiA0LjEzIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRl
YSB3aGF0IGlzIGdvaW5nIAo+IG9uIGFuZAo+IHByaW9yaXRpc2UgYWNjb3JkaW5nbHkuCj4gCj4g
WW91J3JlIHdlbGNvbWUgdG8gcHJvdmlkZSBkZXNjcmlwdGlvbiBhbmQgdXNlIGNhc2VzIG9mIHRo
ZSBmZWF0dXJlIAo+IHlvdSdyZQo+IHdvcmtpbmcgb24uCj4gCj4gPSBUaW1lbGluZSA9Cj4gCj4g
V2Ugbm93IGFkb3B0IGEgZml4ZWQgY3V0LW9mZiBkYXRlIHNjaGVtZS4gV2Ugd2lsbCByZWxlYXNl
IGFib3V0IGV2ZXJ5IAo+IDggbW9udGhzLgo+IFRoZSB1cGNvbWluZyA0LjEzIHRpbWVsaW5lIGFy
ZSBhcyBmb2xsb3dlZDoKPiAKPiAqIExhc3QgcG9zdGluZyBkYXRlOiBTZXB0ZW1iZXIgMTN0aCwg
MjAxOQo+IC0tLT4gV2UgYXJlIGhlcmUKPiAqIEhhcmQgY29kZSBmcmVlemU6IE9jdG9iZXIgNHRo
LCAyMDE5Cj4gKiBSQzE6IFRCRAo+ICogUmVsZWFzZTogTm92ZW1iZXIgN3RoLCAyMDE5Cj4gCj4g
Tm90ZSB0aGF0IHdlIGRvbid0IGhhdmUgZnJlZXplIGV4Y2VwdGlvbiBzY2hlbWUgYW55bW9yZS4g
QWxsIHBhdGNoZXMKPiB0aGF0IHdpc2ggdG8gZ28gaW50byA0LjEzIG11c3QgYmUgcG9zdGVkIGlu
aXRpYWxseSBubyBsYXRlciB0aGFuIHRoZQo+IGxhc3QgcG9zdGluZyBkYXRlIGFuZCBmaW5hbGx5
IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuIEFsbAo+IHBhdGNoZXMgcG9zdGVk
IGFmdGVyIHRoYXQgZGF0ZSB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcXVldWVkIGludG8gbmV4dAo+
IHJlbGVhc2UuCj4gCj4gUkNzIHdpbGwgYmUgYXJyYW5nZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgZnJl
ZXplLgo+IAo+IFdlIHJlY2VudGx5IGludHJvZHVjZWQgYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNr
IGFsbCB0aGUgdGFza3MgKG5vdCAKPiBvbmx5IGJpZykKPiBmb3IgdGhlIHByb2plY3QuIFNlZTog
Cj4gaHR0cHM6Ly94ZW5wcm9qZWN0LmF0bGFzc2lhbi5uZXQvcHJvamVjdHMvWEVOL2lzc3Vlcy4K
PiAKPiBTb21lIG9mIHRoZSB0YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBh
IGNvcnJlc3BvbmRpbmcgCj4gamlyYSB0YXNrCj4gcmVmZXJyZWQgYnkgWEVOLU4uCj4gCj4gSSBo
YXZlIHN0YXJ0ZWQgdG8gaW5jbHVkZSB0aGUgdmVyc2lvbiBudW1iZXIgb2Ygc2VyaWVzIGFzc29j
aWF0ZWQgdG8gCj4gZWFjaAo+IGZlYXR1cmUuIENhbiBlYWNoIG93bmVyIHNlbmQgYW4gdXBkYXRl
IG9uIHRoZSB2ZXJzaW9uIG51bWJlciBpZiB0aGUgCj4gc2VyaWVzCj4gd2FzIHBvc3RlZCB1cHN0
cmVhbT8KPiAKPiA9IFByb2plY3RzID0KPiAKPiA9PSBIeXBlcnZpc29yID09Cj4gCj4gKiAgQ29y
ZSBzY2hlZHVsaW5nICh2NCkKPiAgIC0gIEp1ZXJnZW4gR3Jvc3MKPiAKPiA9PT0geDg2ID09PQo+
IAo+ICogIEludGVsIFByb2Nlc3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEp
Cj4gICAtICBMdXdlaSBLYW5nCj4gCj4gKiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpCj4g
ICAtICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiAKPiAqICBJbXByb3ZlIGxhdGUgbWlj
cm9jb2RlIGxvYWRpbmcgKHYxMikKPiAgIC0gIENoYW8gR2FvCj4gCj4gKiAgRml4ZXMgdG8gI0RC
IGluamVjdGlvbgo+ICAgLSAgQW5kcmV3IENvb3Blcgo+IAo+ICogIENQVUlEL01TUiBYZW4vdG9v
bHN0YWNrIGltcHJvdmVtZW50cwo+ICAgLSAgQW5kcmV3IENvb3Blcgo+IAo+ICogIEltcHJvdmVt
ZW50cyB0byBkb21haW5fY3Jhc2goKQo+ICAgLSAgQW5kcmV3IENvb3Blcgo+IAo+ICogIEVJQlJT
Cj4gICAtICBBbmRyZXcgQ29vcGVyCj4gCj4gKiAgWGVuIGlvcmVxIHNlcnZlciAodjIpCj4gICAt
ICBSb2dlciBQYXUgTW9ubmUKPiAKPiA9PT0gQVJNID09PQo+IAo+ID09IENvbXBsZXRlZCA9PQo+
IAo+ICogIERyb3AgdG1lbQo+ICAgLSAgV2VpIExpdQo+IAo+ICogIEFkZCBzdXBwb3J0IGZvciBI
eWdvbiBEaHlhbmEgRmFtaWx5IDE4aCBwcm9jZXNzb3IKPiAgIC0gIFB1IFdlbgo+IAo+ICogIGh5
cGVydmlzb3IgeDg2IGluc3RydWN0aW9uIGVtdWxhdG9yIGFkZGl0aW9ucyBmb3IgQVZYNTEyCj4g
ICAtICBKYW4gQmV1bGljaAo+IAo+ICogIHgyQVBJQyBzdXBwb3J0IGZvciBBTUQKPiAgIC0gIEph
biBCZXVsaWNoCj4gCj4gKiAgYWRkIHBlci1kb21haW4gSU9NTVUgY29udHJvbAo+ICAgLSAgUGF1
bCBEdXJyYW50Cj4gCj4gKiAgVEVFIG1lZGlhdG9yIChhbmQgT1AtVEVFKSBzdXBwb3J0IGluIFhF
Tgo+ICAgLSAgVm9sb2R5bXlyIEJhYmNodWsKPiAKPiAqICBSZW5lc2FzIElQTU1VLVZNU0Egc3Vw
cG9ydCArIExpbnV4J3MgaW9tbXVfZndzcGVjCj4gICAtICBPbGVrc2FuZHIgVHlzaGNoZW5rbwo+
IAo+IAo+IEp1ZXJnZW4gR3Jvc3MKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
