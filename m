Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03988772
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 03:00:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwFgB-0007Bu-I4; Sat, 10 Aug 2019 00:56:19 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.153])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hwFg9-0007Bp-IF
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 00:56:17 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 36/FE-29283-F261E4D5;
 Sat, 10 Aug 2019 00:56:15 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-12.tower-244.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsWyw31vlK6+mF+
 sweUnfBb3prxnd2D02N63iz2AMYo1My8pvyKBNWP9/ctMBS9EK/6+usbawPhVsIuRk4NXwE/i
 9OoZTCA2o0CWxPklvWwgtrCAjsTErctYQGw2ASOJpoMfgGwuDhGBzYwSza0vwIpYBFQl/hz+B
 tbMLyAjseNlH1icWUBTonX7b/YuRg4OUQF9iQsfMyB2CUqcnPmEBaJEXmL72znMExi5ZyHpmI
 WkbBaSsgWMzKsYLZOKMtMzSnITM3N0DQ0MdA0NjXXNdI2MTfUSq3ST9FJLdZNT80qKEoGyeon
 lxXrFlbnJOSl6eaklmxiBYZRSyPZ6B2PLrDd6hxglOZiURHm3//WNFeJLyk+pzEgszogvKs1J
 LT7EKMPBoSTB6yziFyskWJSanlqRlpkDDGmYtAQHj5IIbwJImre4IDG3ODMdInWKUZfj8vV5i
 5iFWPLy81KlxHmzQIoEQIoySvPgRsDi6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4YkC
 k8mXklcJteAR3BBHQE9xNfkCNKEhFSUg1Mk+bPv/pET7cr/kujAof7y0+v0pIdv4s7NrZ9DWX
 /ZvaG5fZrw7DoyHyOgAURsTY88ouPflwX5fTo6WkzI59bGhKetvGsj6IOB70+Xyqg17T33Ha2
 Te5Byr3zdA0mMR4tSnLaNXHG1cX3reREnmW8vBi2eD5zioPKn4a6WZ/K/fewZhdOVPv39tNXp
 gm/ec+bbEtN3D8vzb47+tX5Q8wCB9TDu8JOGR+x2P9e03mFxFkZeW/VP5c6HcKqQ0MP7r/C9f
 5Om3ZT5ebq1AxLi/KcC+u7lRYu7rz2L+XdUw/2lxeey9/9d8Z5/Y6udd/dNMv6bsvMfPzbf2p
 qkcXThSwblt/7t9kwwHCFVNQ3Jr98JZbijERDLeai4kQAm5VVaCoDAAA=
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-12.tower-244.messagelabs.com!1565398573!174029!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5472 invoked from network); 10 Aug 2019 00:56:15 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-12.tower-244.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Aug 2019 00:56:15 -0000
Message-ID: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: test@lists.fedoraproject.org, devel@lists.fedoraproject.org, Fedora
 Cloud SIG <cloud@lists.fedoraproject.org>, xen-devel@lists.xensource.com, 
 coreos@lists.fedoraproject.org
Date: Fri, 09 Aug 2019 17:56:11 -0700
Organization: Fedora Project
User-Agent: Evolution 3.33.90 (3.33.90-1.fc31) 
MIME-Version: 1.0
Subject: [Xen-devel] Xen / EC2 release criteria proposal
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

SGV5IGZvbGtzISBJJ20gc3RhcnRpbmcgYSBuZXcgdGhyZWFkIGZvciB0aGlzIHRvIHRyaW0gdGhl
IHJlY2lwaWVudApsaXN0IGEgYml0IGFuZCBpbmNsdWRlIGRldmVsQCBhbmQgY29yZW9zQC4KClRo
ZSBTdG9yeSBTbyBGYXI6IHRoZXJlIGlzIGEgRmVkb3JhIHJlbGVhc2UgY3JpdGVyaW9uIHdoaWNo
IHJlcXVpcmVzCkZlZG9yYSB0byBib290IG9uIFhlbjoKCiJUaGUgcmVsZWFzZSBtdXN0IGJvb3Qg
c3VjY2Vzc2Z1bGx5IGFzIFhlbiBEb21VIHdpdGggcmVsZWFzZXMgcHJvdmlkaW5nCmEgZnVuY3Rp
b25hbCwgc3VwcG9ydGVkIFhlbiBEb20wIGFuZCB3aWRlbHkgdXNlZCBjbG91ZCBwcm92aWRlcnMK
dXRpbGl6aW5nIFhlbi4iCgpXZSAoUUEgZ3JvdXApIGhhZCBhIGRpc2N1c3Npb24gYWJvdXQgcmVt
b3ZpbmcgdGhpcyBjcml0ZXJpb24gZW50aXJlbHkuClRoYXQgaGFzIG5vdyBtb3JwaGVkIGludG8g
dGhlIGlkZWEgdGhhdCB3ZSBzaG91bGQgdHdlYWsgaXQgdG8gYmUKZm9jdXNlZCBleGNsdXNpdmVs
eSBvbiB0aGUgIndpZGVseSB1c2VkIGNsb3VkIHByb3ZpZGVycyB1dGlsaXppbmcKWGVuIi4uLmJ5
IHdoaWNoIHdlIG1lYW4gRUMyLiBBdCB0aGUgdGltZSB0aGlzIGNyaXRlcmlvbiB3YXMgaW52ZW50
ZWQsCmFsbCBFQzIgaW5zdGFuY2UgdHlwZXMgdXNlZCBYZW47IG5vdywgc29tZSBzdGlsbCB1c2Ug
WGVuLCBhbmQgc29tZSB1c2UKS1ZNLgoKU28gaXQgc2VlbXMgbGlrZSB0aGlzIHdvdWxkIGFsc28g
YmUgYSBnb29kIG9wcG9ydHVuaXR5IHRvIHJldmlzaXQgYW5kCm5haWwgZG93biBtb3JlIHNwZWNp
ZmljYWxseSBleGFjdGx5IHdoYXQgb3VyIGNsb3VkIHJlcXVpcmVtZW50cyBhcmUuCmJjb3R0b24g
c3VnZ2VzdGVkICB0aGF0IHdlIHJlcXVpcmUgdHdvIHNhbXBsZSBpbnN0YW5jZSB0eXBlcyB0byBi
ZQp0ZXN0ZWQsIGM1LmxhcmdlIChLVk0pIGFuZCB0My5sYXJnZSAoWGVuKS4gKEkndmUgYWxzbyBt
YWlsZWQgVGhvbWFzCkNhbWVyb24sIGV4LW9mIFJlZCBIYXQsIG5vdyBvZiBBbWF6b24sIGZvciBo
aXMgb3BpbmlvbiwgYXMgaXQgc2VlbWVkCmxpa2UgaXQgbWlnaHQgYmUgd29ydGh3aGlsZSAtIGhl
J3MgcHJvbWlzZWQgdG8gZ2V0IGJhY2sgdG8gbWUpLgoKU28sIGZvciBub3csIGxldCBtZSBwcm9w
b3NlIHRoaXMgYXMgYSB0cmlhbCBiYWxsb29uOiB3ZSByZXdyaXRlIHRoZQphYm92ZSBjcml0ZXJp
b24gdG8gc2F5OgoKIlJlbGVhc2UtYmxvY2tpbmcgY2xvdWQgZGlzayBpbWFnZXMgbXVzdCBiZSBw
dWJsaXNoZWQgdG8gQW1hem9uIEVDMiBhcwpBTUlzLCBhbmQgdGhlc2UgbXVzdCBib290IHN1Y2Nl
c3NmdWxseSBhbmQgbWVldCBvdGhlciByZWxldmFudCByZWxlYXNlCmNyaXRlcmlhIG9uIGM1Lmxh
cmdlIGFuZCB0My5sYXJnZSBpbnN0YW5jZSB0eXBlcy4iCgpOb3RlczoKCjEuIFRoZSB0ZXN0IG1h
dHJpeCB0ZW1wbGF0ZSBoYXMgYW4gT3BlbnN0YWNrIGNvbHVtbiwgYnV0IHdlIG5ldmVyCmFjdHVh
bGx5IGNvdmVyZWQgT3BlbnN0YWNrIGluIHRoZSByZWxlYXNlIGNyaXRlcmlhLiBJIHRoaW5rIHdl
IHNob3VsZApjb250aW51ZSB0byBsZWF2ZSBpdCBvdXQgb2YgdGhlIGNyaXRlcmlhIGFuZCBhbHNv
IHJlbW92ZSB0aGUgY29sdW1uCmZyb20gdGhlIG1hdHJpeC4gSW4gdGhlIHBhc3Qgd2UgdGVzdGVk
IE9wZW5zdGFjayBib290IGluIHRoZSBpbmZyYQpPcGVuc3RhY2ssIGJ1dCB0aGF0IGhhcyBnb25l
IGF3YXkgb3IgaXMgZ29pbmcgYXdheS4uLnRoYXQgbWVhbnMgYSkgd2UKY2FuJ3QgdGVzdCBvbiBP
cGVuc3RhY2sgc28gZWFzaWx5IGFueSBtb3JlIGFuZCBiKSBhIGxvdCBvZiB0aGUgcmVhc29uCnRv
IGJvdGhlciB0ZXN0aW5nIG9uIE9wZW5zdGFjayBpcyBnb25lLiBUaGlzIGlzIHVwIGZvciBkZWJh
dGUsIGJ1dCBpZgp3ZSBiZWxpZXZlIGl0J3MgaW1wb3J0YW50IHRvIHRlc3Qgb24gT3BlbnN0YWNr
IGFuZCBibG9jayBvbiB3b3JraW5nIGluCnRoYXQgZW52aXJvbm1lbnQgd2UgbmVlZCB0byBoYXZl
IGEgcmVsaWFibGUgd2F5IHRvICpkbyogdGhhdC4KCjIuIFRoZSB0ZXN0IG1hdHJpeCB0ZW1wbGF0
ZSBhbHNvIGhhcyBhICdMb2NhbCcgY29sdW1uIHdoaWNoIGlzIGZvcgp0ZXN0aW5nIGxvY2FsbHkg
d2l0aCB0ZXN0Y2xvdWQsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8Kc3BlY2lmaWNhbGx5
IHJlcXVpcmUgdGhhdCB0byB3b3JrIGluIHRoZSBjcml0ZXJpYS4gSXQncyBtb3JlIG9mIGEKdGVz
dGluZyBjb252ZW5pZW5jZSB0aGluZywgc28gZXZlbiBpZiBuby1vbmUgdGVzdHMgb24gRUMyIHdl
IGF0IGxlYXN0CnRlc3QgdGhhdCB0aGUgaW1hZ2UgYm9vdHMgaW4gdGVzdGNsb3VkOyB0ZXN0Y2xv
dWQgaXNuJ3QgYW4gZW52aXJvbm1lbnQKeW91J2QgYWN0dWFsbHkgdXNlIHRvIGRvIGFueXRoaW5n
IHByYWN0aWNhbCBpbi4KCjMuIEkgYmVsaWV2ZSB0aGlzIHdvcmRpbmcgaXMgZ2VuZXJpYyBlbm91
Z2ggdG8gY292ZXIgdXMgaWYgd2UsIGUuZy4sCndhbnQgdG8gc3RhcnQgYmxvY2tpbmcgb24gQ29y
ZU9TIGltYWdlcy4gQWxsIHdlIGhhdmUgdG8gZG8gaXMgZGVjbGFyZQp0aGF0IHNvbWUgQ29yZU9T
IGltYWdlIGlzICdyZWxlYXNlLWJsb2NraW5nJywgYW5kIGl0J3MgaW5zdGFudGx5CmNvdmVyZWQg
YnkgdGhpcyByZXF1aXJlbWVudC4KLS0gCkFkYW0gV2lsbGlhbXNvbgpGZWRvcmEgUUEgQ29tbXVu
aXR5IE1vbmtleQpJUkM6IGFkYW13IHwgVHdpdHRlcjogQWRhbVdfRmVkb3JhIHwgWE1QUDogYWRh
bXcgQVQgaGFwcHlhc3Nhc3NpbiAuIG5ldApodHRwOi8vd3d3LmhhcHB5YXNzYXNzaW4ubmV0CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
