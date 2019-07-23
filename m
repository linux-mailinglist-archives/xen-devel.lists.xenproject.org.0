Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56D722E5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 01:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq40d-00017a-OZ; Tue, 23 Jul 2019 23:15:51 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.156])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hq40b-00017V-R0
 for xen-devel@lists.xensource.com; Tue, 23 Jul 2019 23:15:49 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 2A/42-17447-425973D5;
 Tue, 23 Jul 2019 23:15:48 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-8.tower-244.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsWyw31vlK7yVPN
 Yg/X9lhb3prxnd2D02N63iz2AMYo1My8pvyKBNePN5H/sBZMFK079+c3SwHiPt4uRk4NXwE9i
 4ZF2dhCbUSBL4vySXjYQW1jAUeLG9o+MIDabgJFE08EPLF2MXBwiAlsYJf5Onc4M4jALdDNLX
 F6zhwWkikVAVWLKpxWsIDangL/ElmMtYEVCAgtZJNbe38sEkuAXkJHY8bIPbAWzgKZE6/bfYK
 tFBXQl5h1uY4U4SVDi5MwnLBA18hLb385hnsDINwtJyywkZbOQlC1gZF7FaJFUlJmeUZKbmJm
 ja2hgoGtoaKxrqmtsqpdYpZukl1qqm5yaV1KUCJTUSywv1iuuzE3OSdHLSy3ZxAgMyZRCVuUd
 jJtnvdE7xCjJwaQkyuuUYh4rxJeUn1KZkVicEV9UmpNafIhRhoNDSYL312SgnGBRanpqRVpmD
 jA+YNISHDxKIrwBIGne4oLE3OLMdIjUKUZFKXHeNSAJAZBERmkeXBssJi8xykoJ8zIyMDAI8R
 SkFuVmlqDKv2IU52BUEuZtAZnCk5lXAjf9FdBiJqDFe1XMQBaXJCKkpBqY3Neqa4XrdL9adHV
 D3zKm/D9ZSYl7f3jEl/Fs2rDL5+zFLTZ1EfMygsxZ9+1TfPTojF5RRkvujkX2rU/eifJbLn9w
 RNm1g+9q+sZTR1///yB9wjfzksgsgWlvXwTIT84vv9W50KTKN+NAinzsMg89IbleDYdF9vcmb
 nVpWKvKO/P8vB3qN7/GXdix6l32BEHG0694LC5ZZvxTPaxvc2fv6VXTQh4oB+v0R0ntiuIKWs
 jdudS6lC9+9T2mspefj8+7s/my1apTDSvSNv9YPKMsoCvwxdMT6bofTaT1z/du2dFmwpg8aVn
 tARX3pQdvsAhNdOOav/d8k6L+JysVc5638cKhk5OmT1mjJReX9LPFRYmlOCPRUIu5qDgRAH1Z
 nW9EAwAA
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-8.tower-244.messagelabs.com!1563923746!170795!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27216 invoked from network); 23 Jul 2019 23:15:47 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-8.tower-244.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2019 23:15:47 -0000
Message-ID: <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Peter Robinson <pbrobinson@gmail.com>, 
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>
Date: Tue, 23 Jul 2019 16:15:44 -0700
In-Reply-To: <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
Organization: Fedora Project
User-Agent: Evolution 3.33.3 (3.33.3-2.fc31) 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA3LTExIGF0IDE0OjE5IC0wNzAwLCBBZGFtIFdpbGxpYW1zb24gd3JvdGU6
Cj4gT24gVGh1LCAyMDE5LTA3LTExIGF0IDIxOjQzICswMTAwLCBQZXRlciBSb2JpbnNvbiB3cm90
ZToKPiA+ID4gT24gTW9uLCAyMDE5LTA3LTA4IGF0IDA5OjExIC0wNzAwLCBBZGFtIFdpbGxpYW1z
b24gd3JvdGU6Cj4gPiA+ID4gSXQncyB3b3J0aCBub3RpbmcgdGhhdCBhdCBsZWFzdCBwYXJ0IG9m
IHRoZSBqdXN0aWZpY2F0aW9uIGZvciB0aGUKPiA+ID4gPiBjcml0ZXJpb24gaW4gdGhlIGZpcnN0
IHBsYWNlIHdhcyB0aGF0IEFtYXpvbiB3YXMgdXNpbmcgWGVuIGZvciBFQzIsIGJ1dAo+ID4gPiA+
IHRoYXQgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlLCBtb3N0IGlmIG5vdCBhbGwgRUMyIGluc3RhbmNl
IHR5cGVzIG5vCj4gPiA+ID4gbG9uZ2VyIHVzZSBYZW4uCj4gPiA+IAo+ID4gPiBJIGRvbid0IGtu
b3cgd2hlcmUgeW91IGdvdCB0aGF0IHBhcnRpY3VsYXIgcGllY2Ugb2YgaW5mb3JtYXRpb24uIEl0
Cj4gPiA+IGlzbid0IGNvcnJlY3QuIE1vc3QgRUMyIGluc3RhbmNlIHR5cGVzIHN0aWxsIHVzZSBY
ZW4uIFRoZSB2YXN0IG1ham9yaXR5Cj4gPiA+IG9mIEVDMiBpbnN0YW5jZXMsIGJ5IHZvbHVtZSwg
YXJlIFhlbi4KPiA+IAo+ID4gQ29ycmVjdCwgaXQncyBvbmx5IHNwZWNpZmljIHR5cGVzIG9mIG5l
dyBoeXBlcnZpc29ycyB0aGF0IHVzZSBrdm0KPiA+IGJhc2VkLCBwbHVzIG5ldyBIVyBsaWtlIGFh
cmNoNjQuCj4gPiAKPiA+IFRoYXQgYmVpbmcgc2FpZCBJIGRvbid0IGJlbGlldmUgdGVzdGluZyB3
ZSBjYW4gYm9vdCBvbiB4ZW4gaXMgYWN0dWFsbHkKPiA+IHVzZWZ1bCB0aGVzZSBkYXlzIGZvciB0
aGUgQVdTIHVzZSBjYXNlLCBpdCdzIGxpa2VseSBkaWZmZXJlbnQgZW5vdWdoCj4gPiB0aGF0IHRo
ZSB0ZXN0aW5nIGlzbid0IHVzZWZ1bCwgd2UnZCBiZSBtdWNoIGJldHRlciB0ZXN0aW5nIHRoYXQg
Y2xvdWQKPiA+IGltYWdlcyBhY3R1YWxseSB3b3JrIG9uIEFXUyB0aGFuIHRlc3RpbmcgaWYgaXQg
Ym9vdHMgb24geGVuLgo+IAo+IFllYWgsIHRoYXQncyB3aGVyZSBJIHdhcyBnb2luZyB0byBnbyBu
ZXh0ICh0aGVyZSBoYXMgYWxyZWFkeSBiZWVuIGEKPiB0aHJlYWQgYWJvdXQgdGhpcyB0aGlzIG1v
cm5pbmcpLiBJZiB3aGF0IHdlIGNhcmUgYWJvdXQgaXMgdGhhdCBGZWRvcmEKPiBib290cyBvbiBF
QzIsIHRoYXQncyB3aGF0IHdlIHNob3VsZCBoYXZlIGluIHRoZSBjcml0ZXJpYSwgYW5kIHdoYXQg
d2UKPiBzaG91bGQgdGVzdC4KPiAKPiBJSVJDLCB3aGF0IHdlIGhhdmUgcmlnaHQgbm93IGlzIGEg
c29tZXdoYXQgdmFndWUgc2V0dXAgd2hlcmUgd2UganVzdAo+IGhhdmUgJ2xvY2FsJywgJ2VjMicg
YW5kICdvcGVuc3RhY2snIGNvbHVtbnMuIFRoZSBpbnN0cnVjdGlvbnMgZm9yCj4gIkFtYXpvbiBX
ZWIgU2VydmljZXMiIGp1c3Qgc2F5ICJMYXVuY2ggYW4gaW5zdGFuY2Ugd2l0aCB0aGUgQU1JIHVu
ZGVyCj4gdGVzdCIuIFNvIHdlIGNvdWxkIHByb2JhYmx5IHN0YW5kIHRvIHRpZ2h0ZW4gdGhhdCB1
cCBhIGJpdCwgYW5kIGRlZmluZQo+IHNwZWNpZmljIGluc3RhbmNlIHR5cGUocykgdGhhdCB3ZSB3
YW50IHRvIHRlc3QvYmxvY2sgb24uCgpPSywgc28sIHRvIG1vdmUgZm9yd2FyZCB3aXRoIHRoaXMg
KGFuZCBsb29waW5nIGluIGNsb3VkIGxpc3QpOiBkb2VzCnNvbWVvbmUgd2FudCB0byBwcm9wb3Nl
IGEgc2V0IChpZGVhbGx5IHNtYWxsIC0gMiB3b3VsZCBiZSBncmVhdCwgb25lClhlbiBhbmQgb25l
IG5vbi1YZW4sIGlmIHdlIGNhbiBjb3ZlciBtb3N0IGNvbW1vbiB1c2FnZXMgdGhhdCB3YXkhKSBv
ZgpFQzIgaW5zdGFuY2UgdHlwZXMgd2Ugc2hvdWxkIHRlc3Qgb24/IFdpdGggdGhhdCwgd2UgY291
bGQgdHdlYWsgdGhlCmNyaXRlcmlhIGEgYml0IHRvIHNwZWNpZnkgdGhvc2UgaW5zdGFuY2UgdHlw
ZXMsIHR3ZWFrIHRoZSBDbG91ZAp2YWxpZGF0aW9uIHBhZ2UgYSBiaXQsIGFuZCB0aGVuIGRyb3Ag
dGhlIFhlbiBjcml0ZXJpb24gYW5kIHRlc3QgY2FzZS4KClRoYW5rcyBldmVyeW9uZSEKLS0gCkFk
YW0gV2lsbGlhbXNvbgpGZWRvcmEgUUEgQ29tbXVuaXR5IE1vbmtleQpJUkM6IGFkYW13IHwgVHdp
dHRlcjogQWRhbVdfRmVkb3JhIHwgWE1QUDogYWRhbXcgQVQgaGFwcHlhc3Nhc3NpbiAuIG5ldApo
dHRwOi8vd3d3LmhhcHB5YXNzYXNzaW4ubmV0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
