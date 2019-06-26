Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C960456F7E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 19:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgBaP-0008Hc-59; Wed, 26 Jun 2019 17:19:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tj5m=UZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hgBaO-0008HX-7z
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 17:19:56 +0000
X-Inumbo-ID: 9ae384b6-9836-11e9-a12c-77bd19b7a97d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ae384b6-9836-11e9-a12c-77bd19b7a97d;
 Wed, 26 Jun 2019 17:19:51 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L0a8Eq1E9Z6Kn5YfX7ryOUqreKhYQ54MK6EpijmH7Albeh+N03zoiBkbN8+BVO/PeyOzqpbNPP
 b5VZhR9vdH8Dbd/LPgg+aRycCNBI9OGPkMys0iZyOMKerzihERWLTMBnEDtgV2KfrIuLt701+o
 LoPtm6uYbLJa0m5PIGoAAk0a71pyFwbiusMTj0kCyUqSNG6o/l1BSE3kfo6c5Bkei+hy8SL0ab
 aDmG4f6My6ha8y3vKduzMvqTQpmTV7xht88B03CxTFsTABv4qyHPs5YsJbo/VfIKptWJ9YhgK0
 bpY=
X-SBRS: 2.7
X-MesageID: 2275185
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2275185"
Date: Wed, 26 Jun 2019 18:19:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190626171947.GF13449@perard.uk.xensource.com>
References: <20190409164038.25484-1-paul.durrant@citrix.com>
 <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9c1360d-cebc-5c2a-a019-eca2f8f7f461@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] xen-block: support feature-large-sector-size
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDY6NDg6NTBQTSArMDIwMCwgTWF4IFJlaXR6IHdyb3Rl
Ogo+IE9uIDA5LjA0LjE5IDE4OjQwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBBIHJlY2VudCBY
ZW4gY29tbWl0IFsxXSBjbGFyaWZpZWQgdGhlIHNlbWFudGljcyBvZiBzZWN0b3IgYmFzZWQgcXVh
bnRpdGllcwo+ID4gdXNlZCBpbiB0aGUgYmxraWYgcHJvdG9jb2wgc3VjaCB0aGF0IGl0IGlzIG5v
dyBzYWZlIHRvIGNyZWF0ZSBhIHhlbi1ibG9jawo+ID4gZGV2aWNlIHdpdGggYSBsb2dpY2FsX2Js
b2NrX3NpemUgIT0gNTEyLCBhcyBsb25nIGFzIHRoZSBkZXZpY2Ugb25seQo+ID4gY29ubmVjdHMg
dG8gYSBmcm9udGVuZCBhZHZlcnRpemluZyAnZmVhdHVyZS1sYXJnZS1ibG9jay1zaXplJy4KPiA+
IAo+ID4gVGhpcyBwYXRjaCBtb2RpZmllcyB4ZW4tYmxvY2sgYWNjb3JkaW5nbHkuIEl0IGFsc28g
dXNlcyBhIHN0YWNrIHZhcmlhYmxlCj4gPiBmb3IgdGhlIEJsb2NrQmFja2VuZCBpbiB4ZW5fYmxv
Y2tfcmVhbGl6ZSgpIHRvIGF2b2lkIHJlcGVhdGVkIGRlcmVmZXJlbmNpbmcKPiA+IG9mIHRoZSBC
bG9ja0NvbmYgcG9pbnRlciwgYW5kIGNoYW5nZXMgdGhlIHBhcmFtZXRlcnMgb2YKPiA+IHhlbl9i
bG9ja19kYXRhcGxhbmVfY3JlYXRlKCkgc28gdGhhdCB0aGUgQmxvY2tCYWNrZW5kIHBvaW50ZXIg
YW5kIHNlY3Rvcgo+ID4gc2l6ZSBhcmUgcGFzc2VkIGV4cGljaXRseSByYXRoZXIgdGhhbiBpbXBs
aWNpdGx5IHZpYSB0aGUgQmxvY2tDb25mLgo+ID4gCj4gPiBUaGVzZSBtb2RpZmljYXRpb25zIGhh
dmUgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBhIHJlY2VudCBXaW5kb3dzIFBWIFhFTlZCRAo+ID4gZHJp
dmVyIFsyXSB1c2luZyBhIHhlbi1kaXNrIGRldmljZSB3aXRoIGEgNGtCIGxvZ2ljYWwgYmxvY2sg
c2l6ZS4KPiA+IAo+ID4gWzFdIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1jb21taXQ7aD02N2UxYzA1MGUzNmIyYzk5MDBjY2E4MzYxOGU1NjE4OWVmZmJhZDk4Cj4g
PiBbMl0gaHR0cHM6Ly93aW5wdmRydmJ1aWxkLnhlbnByb2plY3Qub3JnOjgwODAvam9iL1hFTlZC
RC1tYXN0ZXIvMTI2Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiBDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cj4gPiBDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgo+ID4gQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4gPiBDYzogTWF4IFJl
aXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGh3L2Jsb2NrL2RhdGFwbGFuZS94
ZW4tYmxvY2suYyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLS0KPiA+ICBody9ibG9jay9kYXRh
cGxhbmUveGVuLWJsb2NrLmggfCAgMyArKy0KPiA+ICBody9ibG9jay94ZW4tYmxvY2suYyAgICAg
ICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPiAKPiBUaGFua3Ms
IGFkZGVkIOKAnGJ5IGZyb250ZW5k4oCdIHRvIHRoZSBlcnJvciBtZXNzYWdlIGFuZCBhcHBsaWVk
IHRvIG15IGJsb2NrCj4gYnJhbmNoOgo+IAo+IGh0dHBzOi8vZ2l0LnhhbmNsaWMubW9lL1hhbkNs
aWMvcWVtdS9jb21taXRzL2JyYW5jaC9ibG9jawoKOigsIEkndmUganVzdCBzZW50IGEgcHVsbCBy
ZXF1ZXN0IHdpdGggdGhhdCBwYXRjaDoKaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMTkwNjI0
MTUzMjU3LjIwMTYzLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS8yMDE5MDYyNDE1MzI1Ny4y
MDE2My0yLWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20vCgpJIGd1ZXNzIEkgbmVlZCB0byBzdGFy
dCBzZW5kaW5nIGFuIGVtYWlsIGV2ZXJ5IHRpbWUgSSd2ZSBhZGRlZCBhIHBhdGNoCnRvIG15IHF1
ZXVlLgoKQ2hlZXJzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
