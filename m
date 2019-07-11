Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9B66113
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 23:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlgTQ-0001pX-43; Thu, 11 Jul 2019 21:19:28 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.108])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hlgTN-0001pS-Ts
 for xen-devel@lists.xensource.com; Thu, 11 Jul 2019 21:19:26 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 2C/DE-10882-BD7A72D5;
 Thu, 11 Jul 2019 21:19:23 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-16.tower-284.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsWyw31vlO7t5eq
 xBmt2cVncm/Ke3YHRY3vfLvYAxijWzLyk/IoE1oxX208wFnzmqdhw+yhTA+M2ri5GTg5eAT+J
 b6fvs4LYjAJZEueX9LKB2MICjhI3tn9kBLHZBIwkmg5+YOli5OIQEWhklHhyehk7iMMs0M0ss
 Xbee2aQKhYBVYljv5tZQGxOgUCJrStOg3UICdxhlri0aQdYEb+AjMSOl31gK5gFNCVat/9mB7
 FFBXQl5h1uY4U4SVDi5MwnLBA18hLb385hnsDINwtJyywkZbOQlC1gZF7FaJFUlJmeUZKbmJm
 ja2hgoGtoaKRraGmha2hhrpdYpZukl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGJIpBcd2
 72D8NfON3iFGSQ4mJVHeyXzqsUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeE8vA8oJFqWmp1akZ
 eYA4wMmLcHBoyTCmw+S5i0uSMwtzkyHSJ1iVJQS5zUCSQiAJDJK8+DaYDF5iVFWSpiXkYGBQY
 inILUoN7MEVf4VozgHo5Iw7yuQKTyZeSVw018BLWYCWqzqpwayuCQRISXVwLRLUS4wdOfGjAf
 xq21fOoTxdfam6azfKccb1y6uwynDV26tV8HYfDJwTiaXic9dBu3zqSvEJ6/zck/MXFh3OEJ1
 /Y7vHM2rlx6/e8PiRPT55ef2OOwR3DVPs1D73VwbbfWtUa+snp6ZWnsv9MSnabXfQmr3sVyYf
 bZHrnNOhZe9oc2B/NuxXxO8a0tO60cs8Vc8Vpy/Z0fI8sKIGeePyno8SeCWM126eY7oRJ6YeT
 f/ccmbGTSkWfpk+U3rk+I/oHR8i97diXbb9C5eenlWeTW3mNBHJh2xFsvizx/esk2d9dz2mNx
 ta+kNH1SLxGxmc3E2KG86caFxg6bMCQ4PdoaPEbP37bpT99pJmEt6qRJLcUaioRZzUXEiAFJF
 62xEAwAA
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-16.tower-284.messagelabs.com!1562879960!1053260!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21673 invoked from network); 11 Jul 2019 21:19:23 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-16.tower-284.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jul 2019 21:19:23 -0000
Message-ID: <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: Peter Robinson <pbrobinson@gmail.com>, For testing and quality
 assurance of Fedora releases <test@lists.fedoraproject.org>
Date: Thu, 11 Jul 2019 14:19:19 -0700
In-Reply-To: <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
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

T24gVGh1LCAyMDE5LTA3LTExIGF0IDIxOjQzICswMTAwLCBQZXRlciBSb2JpbnNvbiB3cm90ZToK
PiA+IE9uIE1vbiwgMjAxOS0wNy0wOCBhdCAwOToxMSAtMDcwMCwgQWRhbSBXaWxsaWFtc29uIHdy
b3RlOgo+ID4gPiBJdCdzIHdvcnRoIG5vdGluZyB0aGF0IGF0IGxlYXN0IHBhcnQgb2YgdGhlIGp1
c3RpZmljYXRpb24gZm9yIHRoZQo+ID4gPiBjcml0ZXJpb24gaW4gdGhlIGZpcnN0IHBsYWNlIHdh
cyB0aGF0IEFtYXpvbiB3YXMgdXNpbmcgWGVuIGZvciBFQzIsIGJ1dAo+ID4gPiB0aGF0IGlzIG5v
IGxvbmdlciB0aGUgY2FzZSwgbW9zdCBpZiBub3QgYWxsIEVDMiBpbnN0YW5jZSB0eXBlcyBubwo+
ID4gPiBsb25nZXIgdXNlIFhlbi4KPiA+IAo+ID4gSSBkb24ndCBrbm93IHdoZXJlIHlvdSBnb3Qg
dGhhdCBwYXJ0aWN1bGFyIHBpZWNlIG9mIGluZm9ybWF0aW9uLiBJdAo+ID4gaXNuJ3QgY29ycmVj
dC4gTW9zdCBFQzIgaW5zdGFuY2UgdHlwZXMgc3RpbGwgdXNlIFhlbi4gVGhlIHZhc3QgbWFqb3Jp
dHkKPiA+IG9mIEVDMiBpbnN0YW5jZXMsIGJ5IHZvbHVtZSwgYXJlIFhlbi4KPiAKPiBDb3JyZWN0
LCBpdCdzIG9ubHkgc3BlY2lmaWMgdHlwZXMgb2YgbmV3IGh5cGVydmlzb3JzIHRoYXQgdXNlIGt2
bQo+IGJhc2VkLCBwbHVzIG5ldyBIVyBsaWtlIGFhcmNoNjQuCj4gCj4gVGhhdCBiZWluZyBzYWlk
IEkgZG9uJ3QgYmVsaWV2ZSB0ZXN0aW5nIHdlIGNhbiBib290IG9uIHhlbiBpcyBhY3R1YWxseQo+
IHVzZWZ1bCB0aGVzZSBkYXlzIGZvciB0aGUgQVdTIHVzZSBjYXNlLCBpdCdzIGxpa2VseSBkaWZm
ZXJlbnQgZW5vdWdoCj4gdGhhdCB0aGUgdGVzdGluZyBpc24ndCB1c2VmdWwsIHdlJ2QgYmUgbXVj
aCBiZXR0ZXIgdGVzdGluZyB0aGF0IGNsb3VkCj4gaW1hZ2VzIGFjdHVhbGx5IHdvcmsgb24gQVdT
IHRoYW4gdGVzdGluZyBpZiBpdCBib290cyBvbiB4ZW4uCgpZZWFoLCB0aGF0J3Mgd2hlcmUgSSB3
YXMgZ29pbmcgdG8gZ28gbmV4dCAodGhlcmUgaGFzIGFscmVhZHkgYmVlbiBhCnRocmVhZCBhYm91
dCB0aGlzIHRoaXMgbW9ybmluZykuIElmIHdoYXQgd2UgY2FyZSBhYm91dCBpcyB0aGF0IEZlZG9y
YQpib290cyBvbiBFQzIsIHRoYXQncyB3aGF0IHdlIHNob3VsZCBoYXZlIGluIHRoZSBjcml0ZXJp
YSwgYW5kIHdoYXQgd2UKc2hvdWxkIHRlc3QuCgpJSVJDLCB3aGF0IHdlIGhhdmUgcmlnaHQgbm93
IGlzIGEgc29tZXdoYXQgdmFndWUgc2V0dXAgd2hlcmUgd2UganVzdApoYXZlICdsb2NhbCcsICdl
YzInIGFuZCAnb3BlbnN0YWNrJyBjb2x1bW5zLiBUaGUgaW5zdHJ1Y3Rpb25zIGZvcgoiQW1hem9u
IFdlYiBTZXJ2aWNlcyIganVzdCBzYXkgIkxhdW5jaCBhbiBpbnN0YW5jZSB3aXRoIHRoZSBBTUkg
dW5kZXIKdGVzdCIuIFNvIHdlIGNvdWxkIHByb2JhYmx5IHN0YW5kIHRvIHRpZ2h0ZW4gdGhhdCB1
cCBhIGJpdCwgYW5kIGRlZmluZQpzcGVjaWZpYyBpbnN0YW5jZSB0eXBlKHMpIHRoYXQgd2Ugd2Fu
dCB0byB0ZXN0L2Jsb2NrIG9uLgotLSAKQWRhbSBXaWxsaWFtc29uCkZlZG9yYSBRQSBDb21tdW5p
dHkgTW9ua2V5CklSQzogYWRhbXcgfCBUd2l0dGVyOiBBZGFtV19GZWRvcmEgfCBYTVBQOiBhZGFt
dyBBVCBoYXBweWFzc2Fzc2luIC4gbmV0Cmh0dHA6Ly93d3cuaGFwcHlhc3Nhc3Npbi5uZXQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
