Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9492DAF4
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 12:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVvwX-00059i-Kb; Wed, 29 May 2019 10:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYmT=T5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hVvwW-00059d-CY
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 10:36:24 +0000
X-Inumbo-ID: 97a7a0ce-81fd-11e9-9a46-ab78844788c7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97a7a0ce-81fd-11e9-9a46-ab78844788c7;
 Wed, 29 May 2019 10:36:18 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: VoxlVVB2J67lWPAUlvYDDI9zF6fyNpIulkT4TwXeV4q5p+kWarjhGM/+Kb/XwyW2ah30fyAPhx
 T0duxx0NHDaPHZQGw+ZWNm1a+dHdDGBtg6YUgPkEnnYN+Et49EO/0Hm92iqXtwDqYGk/XWCvJY
 U2f/4jbqxr23bIrDqux2JxQZSmx1EGniqVV2952GmvW5IXZsNnE6/+u1c48Os2EIMxnYK6PYDf
 HcBf6VyiWG605xwF5ZfNp/ToNdRzbqoIQc5qmY1WXOiU8s0Nw9I12CNI2MHoYU/RxwsxqDsTJX
 wjU=
X-SBRS: 2.7
X-MesageID: 1034112
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,526,1549947600"; 
   d="scan'208";a="1034112"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23790.24705.165611.622568@mariner.uk.xensource.com>
Date: Wed, 29 May 2019 11:35:45 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CEE397F02000078002334C9@prv1-mh.provo.novell.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
 <23789.37660.726217.578999@mariner.uk.xensource.com>
 <5CEE397F02000078002334C9@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch,
 osstest, redux
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Juergen Gross <jgross@suse.com>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFN0YWJsZSB0cmVlcyAoNC42IGFuZCA0LjcpLCBidWls
ZGluZyBvbiBzdHJldGNoLCBvc3N0ZXN0LCByZWR1eCIpOgo+IE9uIDI4LjA1LjE5IGF0IDIxOjU5
LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAxLiBUaGF0IG9sZCBpcHhlIGlz
IGp1c3QgdG9vIGJhZGx5IGJyb2tlbi4gIEkgc3BlbnQgYSBsb25nIHdoaWxlCj4gPiB0cnlpbmcg
dG8gYmFja3BvcnQgY29tcGlsZXIgZml4ZXMgYnV0IGl0IGlzIHRvdGFsbHkgcmlkaWN1bG91cy4g
IElNTwo+ID4gb3VyIG9ubHkgc2Vuc2libGUgb3B0aW9uIGlzIHRvIHVwZGF0ZSBhdCBsZWFzdCBv
c3N0ZXN0J3MgYnVpbGRzeCB0byBhCj4gPiBtdWNoIG5ld2VyIGlweGUuCj4gPiAKPiA+IFRoaXMg
Y291bGQgYmUgZG9uZSBieSBjaGVycnkgcGlja2luZwo+ID4gICAgICAzOGFiOTliMjZiZjQyOThh
MzMxMDVlYzY2ZjNmNmEzZjdlMDVhMzI2Cj4gPiAgICAgICAgaXB4ZTogdXBkYXRlIHRvIG5ld2Vy
IGNvbW1pdAo+ID4gKHdoaWNoIGlzIGZyb20geGVuIDQuOCBpc2gpIG9udG8gb3VyIDQuNyBhbmQg
NC42IGJyYW5jaGVzLgo+ID4gCj4gPiBJZiB0aGlzIGlzIGZlbHQgdG9vIGludHJ1c2l2ZSwgdGhl
biBJIGNvdWxkIHNvbWVob3cgbWFrZSBpdAo+ID4gY29uZGl0aW9uYWwgYW5kIGhhdmUgb3NzdGVz
dCB1c2UgaXQuICBUaGlzIGlzIG5vdCBlbnRpcmVseSB0cml2aWFsCj4gPiBiZWNhdXNlIHdlIGhh
dmUgYW4gYWQgaG9jIHBhdGNoIGFwcGxpY2F0aW9uIHRoaW5nLgo+IAo+IFNpbmNlIHRoZSBuZXcg
aXB4ZSBzaG91bGQgaGF2ZSBiZWVuIHByb3ZlbiBzdGFibGUgZW5vdWdoIGluCj4gdGhlIG5ld2Vy
IHRyZWVzLCBJIHRoaW5rIGNoZXJyeS1waWNraW5nIHNhaWQgY29tbWl0IHNob3VsZCBiZQo+IGZp
bmUuCgpUaGF0IHdhc24ndCB3aGF0IEkgd2FzIGV4cGVjdGluZyB5b3UgdG8gc2F5IDotKS4gIEkg
d2lsbCBnbyB3aXRoIHlvdXIKb3BpbmlvbiBzaW5jZSBpdCBpcyBjZXJ0YWlubHkgbGVzcyB3b3Jr
LgoKPiA+IDIuIGh2bWxvYWRlciBmYWlscyB0byBidWlsZCwgSSB0aGluayBiZWNhdXNlIHdlIG5l
ZWQKPiA+ICAgICA3ODI1YWUxMmRmMWY2ZDQ4YzRkMDA5Y2JiZGY1YTU1YWZmMjcyOTFiCj4gPiAg
ICAgICBlcnJubzogaW50cm9kdWNlIEVJU0RJUi9FUk9GUy9FTk9URU1QVFkgdG8gdGhlIEFCSQo+
ID4gICAgIDAzNzIwZWE1NDEzODJhM2NhODBlYWFlYzJhYTExOTMyYjAzYWFjYWYKPiA+ICAgICAg
IGVycm5vOiBkZWNsYXJlIGFsaWFzZXMgdXNpbmcgWEVOX0VSUk5PKCkKPiA+ICAgICA2Nzc5MDIw
NWRmMjZlN2MzZGZlZWY4YjhlNjQxOTRlYmMyNzkyMjBkCj4gPiAgICAgICBwdWJsaWMvZXJybm86
IFJlZHVjZSBjb21wbGV4aXR5IG9mIGluY2x1c2lvbgo+ID4gICAgIDMwNWU5NTdmZmVlOTRmYzA2
YzRiYTUzZWY1NTYyZjFiOGMxYzZiMDIKPiA+ICAgICAgIGh2bWxvYWRlcjogdXNlIHhlbi9lcnJu
by5oIHJhdGhlciB0aGFuIHRoZSBob3N0IHN5c3RlbXMgZXJybm8uaAo+ID4gCj4gPiBJcyBiYWNr
cG9ydGluZyB0aGF0IGxvdCBPSyA/Cj4gCj4gSSB0aGluayBzbywgeWVzLCBhbGJlaXQgSSdtIHB1
enpsZWQgaG93IHRoZXkgd291bGQgZW5kIHVwIGJlaW5nCj4gbmVlZGVkLgoKV2UgbmVlZCB0aGUg
bGFzdCBvZiB0aGVzZSBiZWNhdXNlIGluIHN0cmV0Y2ggTGludXggdGhlIGhvc3Qgc3lzdGVtJ3MK
ZXJybm8gaGVhZGVyIGZpbGVzIHdlcmUgcmVvcmdhbmlzZWQgaW4gYSB3YXkgdGhhdCB3YXMgaW5j
b21wYXRpYmxlCndpdGggdGhlIHdyb25nLWhlYWRlZCB1c2Ugb2YgaG9zdCBoZWFkZXJzIGFuZCAo
b25seSBzb21lKSBob3N0IGhlYWRlcgpkaXJlY3Rvcmllcy4KClRoZSBvdGhlcnMgYXJlIG5lZGVk
IGJlY2F1c2Ugb2YgdGV4dHVhbCBvciBzZW1hbnRpYyBjb25mbGljdHMuCgo+ID4gVGhlcmUgYXJl
IGFsc28gc29tZSBzaW1wbGUgYmFja3BvcnRzIHdlIG5lZWQ6Cj4gPiAgICBjMmExNzg2OWQ1ZGNk
ODQ1ZDY0NmJmNGRiMTIyY2FkNzM1OTZhMmJlCj4gPiAgICAgIGxpYmZzaW1hZ2U6IHJlcGxhY2Ug
ZGVwcmVjYXRlZCByZWFkZGlyX3IoKSB3aXRoIHJlYWRkaXIoKQo+ID4gICAgYjlkYWZmOWQ4MTEy
ODVmMWU0MDY2OWJjNjIxYzIyNDE3OTNmN2E5NQo+ID4gICAgICBsaWJ4bDogcmVwbGFjZSBkZXBy
ZWNhdGVkIHJlYWRkaXJfcigpIHdpdGggcmVhZGRpcigpCj4gPiAgICA2NjhlNGVkZjkyZmNmN2Ni
OTI5ZWVkMjIxMDU5YTNlZWIwMjcyMmMzCj4gPiAgICAgIHN0dWJkb206IG1ha2UgR01QIGF3YXJl
IHRoYXQgaXQncyBiZWluZyBjcm9zcy1jb21waWxlZAo+ID4gICAgMmY5ZWI3M2MyZTJkN2ZkZGE4
ZTI1ODZjMjBmN2RiZDg1NjAwMmViYQo+ID4gICAgICAgc3R1YmRvbTogZml4IHN0dWJkb20tdnRw
bSBidWlsZAo+ID4gCj4gPiAKPiA+IFdpdGggYWxsIG9mIHRoZSBhYm92ZSwgNC42IGJ1aWxkcyBh
Z2Fpbi4gIEkgZ3Vlc3MgNC43IHdpbGwgdG9vLgo+ID4gCj4gPiBGaXhpbmcgdGhhdCB3aWxsIGFs
c28gcHJvYmFibHkgZW5hYmxlIHRoZSA0LjggcHVzaCBnYXRlIHRvIHBhc3MuICBJdAo+ID4gaXMg
Y3VycmVudGx5IGJsb2NrZWQgYmVjYXVzZSBpdCB3YW50cyB0byB0ZXN0IDQuNy0+NC44IG1pZ3Jh
dGlvbiBhbmQKPiA+IGNhbid0IGJ1aWxkIDQuNy4KPiAKPiBBbmQgc2ltaWxhcmx5IGluIHR1cm4g
Zm9yIDQuOSdzIG5lZWQgdG8gaGF2ZSBhIGJ1aWxkaW5nIDQuOCBiYXNlbGluZSwKPiBhZmFpY3Qu
CgpZZXMuICBXZSBoYXZlIGZpeGVkIHRoZSA0LjggYnVpbGQgYnV0IGl0IGhhc24ndCBwYXNzZWQg
aXRzIHB1c2ggZ2F0ZQpzbyA0LjkgaXMgdXNpbmcgdGhlICJ0ZXN0ZWQiIGJyYW5jaC4uLgoKT0ss
IEkgd2lsbCBnbyBhaGVhZCB3aXRoIGFsbCBvZiB0aGUgYWJvdmUgZm9yIDQuNiBhbmQgNC43LiAg
VGhhbmtzLgoKVGhhbmtzIGFsc28gdG8gT2xhZi4gIFlvdXIgZXhwZXJpZW5jZSB3aXRoIHRoZSBp
cHhlIHByb2JsZW1zIHdhcwpzaW1pbGFyIHRvIG1pbmUuICBJIHRoaW5rIGp1c3QgdXBncmFkaW5n
IGlzIHRoZSBiZXN0IGFwcHJvYWNoLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
