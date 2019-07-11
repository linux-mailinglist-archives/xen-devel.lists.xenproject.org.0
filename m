Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18C65FDD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 21:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hleMA-0001bE-G9; Thu, 11 Jul 2019 19:03:50 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.156])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1hleM9-0001b7-AB
 for xen-devel@lists.xensource.com; Thu, 11 Jul 2019 19:03:49 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 48/37-10299-318872D5;
 Thu, 11 Jul 2019 19:03:47 +0000
Authentication-Results: mx.messagelabs.com; spf=none (spf record not 
 found) smtp.mailfrom=invisiblethingslab.com; dkim=pass (good signature) 
 header.i=@messagingengine.com header.s=fm3; dmarc=none (no record) 
 header.from=invisiblethingslab.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRWlGSWpSXmKPExsXilM9yV1e4Qz3
 WYPJZbot7U96zOzB6bO/bxR7AGMWamZeUX5HAmrHh82vmgk3SFceeH2BvYDwh2sXIxSEksJJR
 omXnHcYuRk4gJ1/iz8Vf7CAJFoG5rBLvlrQygyQkBDwlWmbdZQJJSAisYZX4tPoXI4QzgUli3
 98bjBCz5jJK3Dzfwg7SwiKgKjH9Sh/YXDag9rPnz7J1MXJwiAgYSNy8rgdSzyxwiFni4bfXLC
 A1wgKOEje2fwSr5xXQkZhzbjM7xNBjzBJXDi9kgkgISpyc+QSsgVlAXeLPvEvMIEOZBaQllv/
 jgAjLSzRvnQ12NqeAv8S7qcvYQGxRARWJP3OWsk9gFJmFZNIsJJNmIUyahWTSAkaWVYwWSUWZ
 6RkluYmZObqGBga6hobGuia65pZ6iVW6SXqppbrJqXklRYlASb3E8mK94src5JwUvbzUkk2Mw
 OhJKWTx38F4a9YbvUOMkhxMSqK8k/nUY4X4kvJTKjMSizPii0pzUosPMcpwcChJ8Aq2A+UEi1
 LTUyvSMnOAkQyTluDgURLhLWwDSvMWFyTmFmemQ6ROMdpz7D86bxEzx+XrIHLt9iVAsvH57sX
 MQix5+XmpUuK8uSBtAiBtGaV5cENhiecSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeTSBT
 eDLzSuB2vwI6iwnoLFU/NZCzShIRUlINTDarpl7ULj/FuO6Q5VHrzJzpRyK+t2UIlfWu5Hbaa
 T6XuWLLxH/5qtKnLiXr7GtLUIoIZZsewfGk/V2oY2byzD/bnre+aVvaJvbIRHHmBP6dXnFfjJ
 Yc4DIS0HZuX7lsQuSFl1WGLfYFjttlLlf8mJC4zFCg3/tc+eJM7dBXzuzLd5Rufu8orhDzylb
 k74JekYIFNpf//YzrSFWLy1QVNfxYyuyX5BdvYfw7OE+ttz+wtfvNoudvdnZbS/qvPqaw01D1
 omzOisJ3JhtNvycJ37Ga47TkQ+jys96qW+6wxYut9+o8HnBUgTWMQ3+dtp+K62ets1JzmO23b
 Djz2+TTcs6HZbXyCneOJL19XxWlxFKckWioxVxUnAgAXmVa3bcDAAA=
X-Env-Sender: marmarek@invisiblethingslab.com
X-Msg-Ref: server-22.tower-244.messagelabs.com!1562871826!112856!1
X-Originating-IP: [66.111.4.221]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5352 invoked from network); 11 Jul 2019 19:03:47 -0000
Received: from new1-smtp.messagingengine.com (HELO
 new1-smtp.messagingengine.com) (66.111.4.221)
 by server-22.tower-244.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2019 19:03:47 -0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B7AD336F2;
 Thu, 11 Jul 2019 15:03:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 11 Jul 2019 15:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=K+UP2QcdAkAYz+Jvw7sjdXVtre/Cp6p6fEve1sw85
 34=; b=loXV48k+jqFUFJv69YS6RJ2F8u4QRr2PkFcjWCNQBK+QpafgAqQmdWlmY
 jNTjfoNhAfcgmezaly/nEfvFdeLOZ1NgUfqpM/G03WtXFEBeRIwF1yuLpN2u20U9
 q0cTJVqFHl6s92ogQtg6EULSpMPPy/caQk4zuyCbQPA20KfEnXiuDrzvkxEzxAnk
 Od/7prax22A/gysoLlB9fEVQmTJtvlhPMOLiW4mk74/ahEzx1Aan92Bns2tDRB9o
 DXWvKJKF5kfO2a+xVHS/VZNbgQsqvrhZe35ehuVsbHsT8mIIIkVyMsLlxJYB3PZg
 nWwr8TuyGXgknOCdlhBWUh8pwKLHQ==
X-ME-Sender: <xms:EIgnXTFdaZzcl381L30pIioDnqAR2k4PFqeHuHNRadfUsYQ_dNlv1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeekgddufeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpedfmhgr
 rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdfuceomhgrrh
 hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgr
 ihhnpehfvgguohhrrghprhhojhgvtghtrdhorhhgnecukfhppedukeehrddvudefrdduhe
 ehrdduiedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:EIgnXWzVjLPcvSGKlLybUtkrOMZ9rqFJuzRy6DPA-8Hnnd5CIl6vIw>
 <xmx:EIgnXSqbVCxXK7I1dL4fbsznugwfk8XNPYJzThxBDCJT1uZi69yuSA>
 <xmx:EIgnXZfa39gXcSigfM3CUTmsnz5IobY-tcwidKPeF9xjePaVTjNdlw>
 <xmx:EYgnXczmlJQy5UPf6VCKSObazCVfe_5qY6Fqkwx2ZvHYAzyuf7wDvvAvTrs>
Received: from mail-itl (unknown [185.213.155.162])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0387C380079;
 Thu, 11 Jul 2019 15:03:41 -0400 (EDT)
Date: Thu, 11 Jul 2019 14:03:39 -0500
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Adam Williamson <adamwill@fedoraproject.org>
Message-ID: <20190711190339.GC1013@mail-itl>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <e0145933-8563-8a45-40a6-7f192c7b9d80@cardoe.com>
 <1762aadf92b784edc79cb6ad4d9f0f243b1b8847.camel@fedoraproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1762aadf92b784edc79cb6ad4d9f0f243b1b8847.camel@fedoraproject.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 Doug Goldstein <cardoe@cardoe.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xensource.com, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMTA6NTg6MDNBTSAtMDcwMCwgQWRhbSBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFRodSwgMjAxOS0wNy0xMSBhdCAwOTo1NyAtMDUwMCwgRG91ZyBHb2xkc3Rl
aW4gd3JvdGU6Cj4gPiBPbiA3LzgvMTkgMTE6MTEgQU0sIEFkYW0gV2lsbGlhbXNvbiB3cm90ZToK
PiA+ID4gT24gVHVlLCAyMDE5LTA1LTIxIGF0IDExOjE0IC0wNzAwLCBBZGFtIFdpbGxpYW1zb24g
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiAiVGhlIHJlbGVhc2UgbXVzdCBib290IHN1Y2Nlc3NmdWxs
eSBhcyBYZW4gRG9tVSB3aXRoIHJlbGVhc2VzIHByb3ZpZGluZwo+ID4gPiA+ID4gPiA+ID4gYSBm
dW5jdGlvbmFsLCBzdXBwb3J0ZWQgWGVuIERvbTAgYW5kIHdpZGVseSB1c2VkIGNsb3VkIHByb3Zp
ZGVycwo+ID4gPiA+ID4gPiA+ID4gdXRpbGl6aW5nIFhlbi4iCj4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+IGFuZCBjaGFuZ2UgdGhlICdtaWxlc3RvbmUnIGZvciB0aGUgdGVzdCBjYXNl
IC0KPiA+ID4gPiA+ID4gPiA+IGh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9RQTpUZXN0
Y2FzZV9Cb290X01ldGhvZHNfWGVuX1BhcmFfVmlydCAtCj4gPiA+ID4gPiA+ID4gPiBmcm9tIEZp
bmFsIHRvIE9wdGlvbmFsLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBUaG91Z2h0
cz8gQ29tbWVudHM/IFRoYW5rcyEKPiA+ID4gPiA+ID4gPiBJIHdvdWxkIHByZWZlciBmb3IgaXQg
dG8gcmVtYWluIGFzIGl0IGlzLgo+ID4gPiA+ID4gPiBUaGlzIGlzIG9ubHkgcHJhY3RpY2FsIGlm
IGl0J3MgZ29pbmcgdG8gYmUgdGVzdGVkLCBhbmQgdGVzdGVkIHJlZ3VsYXJseQo+ID4gPiA+ID4g
PiAtIG5vdCAqb25seSogb24gdGhlIGZpbmFsIHJlbGVhc2UgY2FuZGlkYXRlLCByaWdodCBiZWZv
cmUgd2Ugc2lnbiBvZmYKPiA+ID4gPiA+ID4gb24gdGhlIHJlbGVhc2UuIEl0IG5lZWRzIHRvIGJl
IHRlc3RlZCByZWd1bGFybHkgdGhyb3VnaG91dCB0aGUgcmVsZWFzZQo+ID4gPiA+ID4gPiBjeWNs
ZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJlICJub21pbmF0ZWQgZm9yIHRlc3RpbmciLgo+ID4g
PiA+ID4gV291bGQgdGhlIHByb3Bvc2FsIGFib3ZlIHdvcmsgZm9yIHlvdT8gSSB0aGluayBpdCBz
YXRpc2ZpZXMgd2hhdCB5b3UgYXJlCj4gPiA+ID4gPiBsb29raW5nIGZvci4gV2Ugd291bGQgYWxz
byBoYXZlIHNvbWVvbmUgd2hvIG1vbml0b3JzIHRoZXNlIHRlc3QgcmVzdWx0cwo+ID4gPiA+ID4g
cHJvLWFjdGl2ZWx5Lgo+ID4gPiA+IEluIHRoZW9yeSwgeWVhaCwgYnV0IGdpdmVuIHRoZSBoaXN0
b3J5IGhlcmUgSSdtIHNvbWV3aGF0IHNjZXB0aWNhbC4gSSdkCj4gPiA+ID4gYWxzbyBzYXkgd2Ug
c3RpbGwgaGF2ZW4ndCByZWFsbHkgZ290IGEgY29udmluY2luZyBjYXNlIGZvciB3aHkgd2UKPiA+
ID4gPiBzaG91bGQgY29udGludWUgdG8gYmxvY2sgdGhlIHJlbGVhc2UgKGF0IGxlYXN0IGluIHRo
ZW9yeSkgb24gRmVkb3JhCj4gPiA+ID4gd29ya2luZyBpbiBYZW4gd2hlbiB3ZSBkb24ndCBibG9j
ayBvbiBhbnkgb3RoZXIgdmlydCBzdGFjayBhcGFydCBmcm9tCj4gPiA+ID4gb3VyICdvZmZpY2lh
bCcgb25lLCBhbmQgd2UgZG9uJ3QgYmxvY2sgb24gYWxsIHNvcnRzIG9mIG90aGVyIHN0dWZmIHdl
J2QKPiA+ID4gPiAibGlrZSB0byBoYXZlIHdvcmtpbmciIGVpdGhlci4gUmVnYXJkbGVzcyBvZiB0
aGUgdGVzdGluZyBpc3N1ZXMsIEknZAo+ID4gPiA+IGxpa2UgdG8gc2VlIHRoYXQgdG9vIGlmIHdl
J3JlIGdvaW5nIHRvIGtlZXAgYmxvY2tpbmcgb24gWGVuLi4uCj4gPiA+IFNvLCB0aGlzIGRpZWQg
aGVyZS4gQXMgdGhpbmdzIHN0YW5kOiBJIHByb3Bvc2VkIHJlbW92aW5nIHRoZSBYZW4KPiA+ID4g
Y3JpdGVyaW9uLCBMYXJzIG9wcG9zZWQsIHdlIGRpc2N1c3NlZCB0aGUgdGVzdGluZyBzaXR1YXRp
b24gYSBiaXQsIGFuZAo+ID4gPiBJIHNhaWQgb3ZlcmFsbCBJJ20gc3RpbGwgaW5jbGluZWQgdG8g
cmVtb3ZlIHRoZSBjcml0ZXJpb24gYmVjYXVzZQo+ID4gPiB0aGVyZSdzIG5vIGNsZWFyIGp1c3Rp
ZmljYXRpb24gZm9yIGl0IGZvciBGZWRvcmEgYW55IG1vcmUuIFhlbiB3b3JraW5nCj4gPiA+IChv
ciByYXRoZXIsIEZlZG9yYSB3b3JraW5nIG9uIFhlbikgaXMganVzdCBub3QgYSBrZXkgcmVxdWly
ZW1lbnQgZm9yCj4gPiA+IEZlZG9yYSBhdCBwcmVzZW50LCBBRkFJQ1MuCj4gPiA+IAo+ID4gPiBJ
dCdzIHdvcnRoIG5vdGluZyB0aGF0IGF0IGxlYXN0IHBhcnQgb2YgdGhlIGp1c3RpZmljYXRpb24g
Zm9yIHRoZQo+ID4gPiBjcml0ZXJpb24gaW4gdGhlIGZpcnN0IHBsYWNlIHdhcyB0aGF0IEFtYXpv
biB3YXMgdXNpbmcgWGVuIGZvciBFQzIsIGJ1dAo+ID4gPiB0aGF0IGlzIG5vIGxvbmdlciB0aGUg
Y2FzZSwgbW9zdCBpZiBub3QgYWxsIEVDMiBpbnN0YW5jZSB0eXBlcyBubwo+ID4gPiBsb25nZXIg
dXNlIFhlbi4gQW5vdGhlciBjb25zaWRlcmF0aW9uIGlzIHRoYXQgdGhlcmUgd2FzIGEgdGltZSB3
aGVuIEtWTQo+ID4gPiB3YXMgc3RpbGwgcHJldHR5IG5ldyBzdHVmZiBhbmQgVmlydHVhbEJveCB3
YXMgbm90IGFzIHBvcHVsYXIgYXMgaXQgaXMKPiA+ID4gbm93LCBhbmQgWGVuIHdhcyBzdGlsbCB3
aWRlbHkgdXNlZCBmb3IgZ2VuZXJhbCBob2JieWlzdCB2aXJ0dWFsaXphdGlvbgo+ID4gPiBwdXJw
b3NlczsgSSBkb24ndCBiZWxpZXZlIHRoYXQncyByZWFsbHkgdGhlIGNhc2UgYW55IG1vcmUuCj4g
PiAKPiA+IFNvIEknbGwganVzdCBwb2ludCBvdXQgdGhpcyBpcyBmYWxzZS4gQW1hem9uIHZlcnkg
bXVjaCB1c2VzIFhlbiBzdGlsbCAKPiA+IGFuZCBpcyBpbnZlc3RpbmcgaW4gWGVuIHN0aWxsLiBJ
biBmYWN0IEknbSB3cml0aW5nIHRoaXMgZW1haWwgZnJvbSB0aGUgCj4gPiBYZW5TdW1taXQgd2hl
cmUgQW1hem9uIGlzIGN1cnJlbnRseSBkaXNjdXNzaW5nIHRoZWlyIGZ1dHVyZSBkZXZlbG9wbWVu
dCAKPiA+IGVmZm9ydHMgZm9yIHRoZSBYZW4gUHJvamVjdC4KPiAKPiBTb3JyeSBhYm91dCB0aGF0
LCBpdCB3YXMganVzdCBiYXNlZCBvbiBteSBiZXN0IGVmZm9ydHMgYXQgdHJ5aW5nIHRvCj4gZmln
dXJlIGl0IG91dDsgQW1hem9uIGluc3RhbmNlIHR5cGVzIGRvbid0IGFsbCBleHBsaWNpdGx5IHN0
YXRlIGV4YWN0bHkKPiBob3cgdGhleSB3b3JrLgo+IAo+IFdoaWNoIEVDMiBpbnN0YW5jZSB0eXBl
cyBzdGlsbCB1c2UgWGVuPwoKSSBkb24ndCBrbm93IHdoYXQgbmV3IGluc3RhbmNlIHR5cGVzIHVz
ZSBYZW4sIGJ1dCBkZWZpbml0ZWx5IHRoZXJlIGFyZQpleGlzdGluZyBwcmV2aW91cyBpbnN0YW5j
ZSBnZW5lcmF0aW9ucyB0aGF0IGFyZSBzdGlsbCBydW5uaW5nIGFuZCBub3QKZ29pbmcgYXdheSBh
bnl0aW1lIHNvb24uIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIHRoZXkgYXJlIHN0aWxsIGdyZWF0
Cm1ham9yaXR5IG9mIEVDMi4KCi0tIApCZXN0IFJlZ2FyZHMsCk1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraQpJbnZpc2libGUgVGhpbmdzIExhYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
