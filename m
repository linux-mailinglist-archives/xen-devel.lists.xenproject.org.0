Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B121B28
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 18:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfM3-0001Du-1j; Fri, 17 May 2019 16:05:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRfM0-0001Dp-Te
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:05:04 +0000
X-Inumbo-ID: 87966d34-78bd-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87966d34-78bd-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 16:05:03 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: biqjg0a0i0pD971VxjiBrrB6eSh+amhVRn/JpK0ZvhIR+lODWxwlkuR30s3w93PMs09Kvq3uLM
 ecCpCdQkFIYebovelFBut/HPcR4fo5k1Ck7llJhY4yjMg5JfEq8efqIHrEGa1WQUamyNTU4f5a
 xfUgAm5hbYT2WmP6jJg9Q2r8Wi11xEdOXo/33qYxIFlN79MfwzQpE2GEulXyDYbXplIRN7exQE
 KB+pW75IL+nmE55+VKih6dhes+qkoWXhCouX323WYQnOjPZSkrABv1VrUyEp9LsKem/mNitiis
 ylk=
X-SBRS: 2.7
X-MesageID: 566539
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="566539"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23774.56206.649801.21060@mariner.uk.xensource.com>
Date: Fri, 17 May 2019 17:04:30 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <23774.33770.670075.737104@mariner.uk.xensource.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <23773.36109.688404.996152@mariner.uk.xensource.com>
 <0ebf5b95-9175-b45c-3c41-a703115d55f6@citrix.com>
 <23774.33770.670075.737104@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIHByZXBhcmF0aW9ucyBmb3IgNC4x
MS4yIik6Cj4gQW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcHJlcGFyYXRp
b25zIGZvciA0LjExLjIiKToKPiA+IE9uIDE2LzA1LzIwMTkgMTc6MTcsIElhbiBKYWNrc29uIHdy
b3RlOgo+ID4gPiBBbmRyZXcgQ29vcGVyIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBwcmVwYXJh
dGlvbnMgZm9yIDQuMTEuMiIpOgo+ID4gPj4gMTI5MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24n
dCByZS1vcGVuIGEgeGVuY3RybCBoYW5kbGUgZm9yIGV2ZXJ5Cj4gPiA+PiBkb21haW4gaW50cm9k
dWN0aW9uIgouLi4KPiA+ID4+IDdiMjBhODY1YmMxMCAidG9vbHMvb2NhbWw6IFJlbGVhc2UgdGhl
IGdsb2JhbCBsb2NrIGJlZm9yZSBpbnZva2luZyBibG9jawo+ID4gPj4gc3lzY2FsbHMiCi4uLgo+
IFNvIHRoZXNlIGFyZSBidWdmaXhlcywgYnV0IHRoZXkncmUgbm90IHBhcnRpY3VsYXJseSBsb3cg
cmlzayBiYXNlZAo+IGp1c3Qgb24gdGhlIGNvZGUuICBIb3cgbG9uZyBoYXMgWFMgYmVlbiBydW5u
aW5nIHRoZXNlIHBhdGNoZXMgPyAgVGhlCj4gYW5zd2VyIHRvIHRoYXQgbWF5IGdpdmUgbWUgc29t
ZSBjb25maWRlbmNlIHRoYXQgZm9yIHVzZXJzIG9mIFhlbgo+IHN0YWJsZSBicmFuY2hlcywgdGhl
IHBvc3NpYmxlIHJld2FyZCBvZiBmaXhpbmcgYSBteXN0ZXJpb3VzIGJhZAo+IGJlaGF2aW91ciBp
cyBiZXR0ZXIgdG8gdGFrZSB0aGUgcmlzayBvZiB0aGVzZSBwYXRjaGVzIGhhdmluZyBidWdzLgoK
QmFzZWQgb24gdGhpczoKCjEyOjE3IDxhbmR5aGhwPiBYUyBoYXMgYmVlbiB1c2luZyB0aG9zZSBv
Y2FtbCBjaGFuZ2VzIGZvciBsb25nZXIgdGhhbiB0aGV5J3ZlIAogICAgICAgICAgICAgICAgYmVl
biB1cHN0cmVhbQoxMjoxOSA8YW5keWhocD4gYWx0aG91Z2ggaWYgeW91J3JlIHN0aWxsIGhlc2l0
YW50LCBpdCByZWFsbHkgaXNuJ3QgdGhlIGVuZCBvZiAKICAgICAgICAgICAgICAgIHRoZSB3b3Js
ZC4gIFlvdXIgZGVjaXNpb24gaGVyZSBkb2Vzbid0IGFmZmVjdCBYUyAtIHdlJ3ZlIAogICAgICAg
ICAgICAgICAgYWxyZWFkeSBnb3QgdGhlbSBiYWNrcG9ydGVkIGluIHRoZSBwYXRjaHF1ZXVlCgpJ
IGhhdmUgdGFrZW4gMTI5MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24ndCByZS1vcGVuIGEgeGVu
Y3RybApoYW5kbGUuLi4iIHRvIDQuMTEgYW5kIDQuMTAuCgo3YjIwYTg2NWJjMTAgInRvb2xzL29j
YW1sOiBSZWxlYXNlIHRoZSBnbG9iYWwgbG9jay4uLiIgZG9lcyBub3QgYXBwbHkKY2xlYW5seS4g
IERvIHlvdSBoYXBwZW4gdG8gaGF2ZSBhIHZlcnNpb24gZm9yIDQuMTEgYW5kL29yIDQuMTAgPyAg
SSBhbQpub3QgY29udmluY2VkIEkgb3VnaHQgdG8gdHJ5IHRvIGZpeCB0aGUgYmFja3BvcnQgbXlz
ZWxmIHBhcnRpY3VsYXJseQppZiBDaXRyaXggWFMgaGF2ZSBiZWVuIHJ1bm5pbmcgYSB0ZXh0dWFs
bHkgZGlmZmVyZW50IHBhdGNoIGZvciBhIGxvbmcKdGltZS4uLgoKVGhlIHJlc3Qgb2YgdGhpcyBJ
IHRoaW5rIGlzIHN0aWxsIGluIHF1ZXN0aW9uIGFuZCBJTU8gbm90IGEgYmxvY2tlcgpmb3IgNC4x
MS4yLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
