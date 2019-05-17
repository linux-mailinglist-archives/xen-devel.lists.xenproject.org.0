Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB421B09
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 17:56:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfBi-00088x-I2; Fri, 17 May 2019 15:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRfBh-00088s-2D
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:54:25 +0000
X-Inumbo-ID: 09eb3e98-78bc-11e9-980b-57852c90175d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09eb3e98-78bc-11e9-980b-57852c90175d;
 Fri, 17 May 2019 15:54:23 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ZGP+uDse4is2UlKBwam8P8vlzdHdL5calBExussUf0RJNaZ1KQowi24+acXwx0k/QdDMPR5dRJ
 Zz6Ymqsdy5wK5gy8CX/9/BgMffcY+l0K4ahtNJPnqqbVQqimxN4TAq3tcmCRY7q5MbySdCcKbn
 /gKW71KgvWOSDDwgPmCARpA+6uY5CeN+6kfX8QId2fMXxTWVkaWaF3FGp5WHZiJ8YUFgx/xERI
 XRbix5jsVvLWCke/1obyTFNulLIWAjFbG7uZCEAeSekyc81BDnzTfcVoLG/4fXRPD/ID40+/Sz
 KLM=
X-SBRS: 2.7
X-MesageID: 578205
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="578205"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23774.55565.453626.345334@mariner.uk.xensource.com>
Date: Fri, 17 May 2019 16:53:49 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbcWVtdS11cHN0cmVhbS00LjEx
LXRlc3RpbmcgdGVzdF0gMTM2MTg0OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBPbiA1LzE2LzE5
IDExOjM3IEFNLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+PiBUZXN0cyB3aGljaCBkaWQgbm90
IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiA+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291
bGQgbm90IGJlIHJ1bjoKPiA+PiAgIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20gIDcgeGVu
LWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+ID4+ICAgdGVzdC1h
cm02NC1hcm02NC14bCAgICAgICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBS
RUdSLiB2cy4gMTI1NTc1Cj4gPj4gICB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICA3IHhl
bi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKPiA+PiAgIHRlc3Qt
YXJtNjQtYXJtNjQteGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwg
UkVHUi4gdnMuIDEyNTU3NQouLgo+ID4gSSBjYW4ndCBmaWd1cmUgb3V0IHdoeSBYZW4gY29uc2lz
dGVudGx5IGZhaWxzIHRvIGJvb3Qgb24gcm9jaGVzdGVyKiBpbgo+ID4gdGhlIHFlbXUtdXBzdHJl
YW0tNC4xMS10ZXN0aW5nIGZsaWdodHMuIFRoZSB4ZW4tNC4xMS10ZXN0aW5nIHNlZW1zIHRvCj4g
PiBwYXNzLgo+ID4gCj4gPiBBdCBib290LCB0aGUgYm9vdCBsb2FkZXIgc2VlbXMgdG8gbG9hZCBi
bG9icywgYnV0IHdoZW4gaXQncyB0aW1lIHRvIFhlbgo+ID4gdG8gc2hpbmUsIHRoZXJlIGFyZSBu
byBvdXRwdXQgZnJvbSBYZW4gb24gdGhlIHNlcmlhbC4KPiAKPiBUaGUgc2VyaWFsIGNvbnNvbGUg
aXMgaW5pdGlhbGl6aW5nIGZhaXJseSBsYXRlIGluIHRoZSBwcm9jZXNzLiBBbnkgCj4gdXNlZnVs
IG1lc3NhZ2UgKHN1Y2ggYXMgbWVtb3J5IHNldHVwIG9yIGV2ZW4gcGFydCBvZiB0aGUgaW50ZXJy
dXB0cykgCj4gd2lsbCBiZSBoaWRlIG91dC4gRm9yIGdldHRpbmcgdGhlbSwgeW91IG5lZWQgZWFy
bHlwcmludGsuIFVuZm9ydHVuYXRlbHkgCj4gdGhleSBjYW4ndCBiZSBjb25maWd1cmVkIGF0IHJ1
bnRpbWUgdG9kYXkgOiguCgo6LS8uICBDYW4gd2UgY29uZmlndXJlIHRoZSBlYXJseXByaW50ayBh
dCBjb21waWxlLXRpbWUgPyAgV2UgYWx3YXlzCndhbnQgaXQgdG8gYmUgc2VyaWFsLi4uCgo+ID4g
RG8geW91IGtub3cgd2hhdCBjb3VsZCBjYXVzZSB4ZW4gdG8gZmFpbCB0byBib290Pwo+IAo+IEl0
IGlzIGhhcmQgdG8gc2F5IHdpdGhvdXQgdGhlIGxvZy4gTG9va2luZyBhdCB0aGUgZGlmZmVyZW50
IHdpdGggYSBYZW4gCj4gNC4xMSBmbGlnaHRzIG9uIHJvY2hlc3RlcjAgWzFdLCBpdCBzZWVtcyB0
aGUgLmNvbmZpZyBpcyBzbGlnaHRseSAKPiBkaWZmZXJlbnQuIDQuMTEgZmxpZ2h0IGhhcyBDT05G
SUdfTElWRVBBVENIIHNldC4KClRoZSBvc3N0ZXN0IGhpc3Rvcnkgc2hvd3MgdGhpcyBhcyBhIDEw
MCUgcmVwZWF0YWJsZSBib290IGZhaWx1cmUgYnV0Cm9ubHkgaW4gdGhlIHFlbXUgZmxpZ2h0cy4K
CkNvbXBhcmluZyAxMzYyMzEgKHBhc3MsIHhlbi00LjExLXRlc3RpbmcpIHdpdGggMTM2MTg0IChm
YWlsLApxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyksIHRoZXJlIGFyZSBubyBkaWZmZXJlbmNl
cyBpbiB0aGUgdGVzdCBqb2IKcnVudmFycy4gIEJvdGggdXNlZCB0aGUgc2FtZSB2ZXJzaW9uIG9m
IG9zc3Rlc3QuCgpCdXQgaW4gdGhlIGJ1aWxkLWFybTY0IChYZW4gYnVpbGQpIGpvYiBydW52YXJz
IEkgc2VlIHRoZSBmb2xsb3dpbmcKZGlmZmVyZW5jZXM6CgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAxMzYyMzEgICAgICAgICAgICAgICAxMzYxODQKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAgICAgICAgICAgICAgZmFpbAogICAgICAgICAgICAgICAgICAgICAgICAgICB4
ZW4tNC4xMS10ZXN0aW5nICAgICBxZW11LSo0LjExKgpidWlsZC1hcm02NCAoWGVuIGJ1aWxkKQoK
IGVuYWJsZV9saXZlcGF0Y2ggICAgICAgICAgdHJ1ZSAgICAgICAgICAgICAgICAgKHVuc2V0KQog
W35idWlsdF9dcmV2aXNpb25fcWVtdXUgICAyMGM3NmY5YTVmYmYuLi4gICAgICAyODcxMzU1YTY5
NTcuLi4KIFt+YnVpbHRfXXJldmlzaW9uX3hlbiAgICAgYTZlMDc0OTVjMTcxLi4uICAgICAgM2Iw
NjJmNTA0MGExLi4uCiB+cGF0aF94ZW5scHRkaXN0ICAgICAgICAgIGJ1aWxkL3hlbmxwdGRpc3Qu
dGFyLmd6ICAodW5zZXQpCgpidWlsZC1hcm02NC1wdm9wcyAoa2VybmVsIGJ1aWxkKQoKIH5ob3N0
ICAgICAgICAgICAgICAgICAgICAgcm9jaGVzdGVyMSAgICAgICAgICAgbGF4dG9uMQoKIH4gaW5k
aWNhdGVzIHZhcmlhYmxlIHNldCBieSBvc3N0ZXN0IGR1cmluZyB0aGUgdGVzdCBydW4uCgpUaGUg
cWVtdSByZXZpc2lvbiBpcyBjbGVhcmx5IG5vdCByZWxldmFudC4gIEkgZGlkIHRoaXMKICAgZ2l0
LWRpZmYgLS1zdGF0IGE2ZTA3NDk1YzE3MS4uM2IwNjJmNTA0MGExCmluIHhlbi5naXQgYW5kIHRo
ZSBkaWZmZXJlbmNlcyByZWFsbHkgZG9uJ3Qgc2VlbSBsaWtlIHRoZXkgd291bGQgYmUKcmVsZXZh
bnQuCgpJIHRoaW5rIHRoZXJlZm9yZSB0aGF0IHdlIG5lZWQgdG8gYmxhbWUgdGhlIGxpdmVwYXRj
aCBzZXR0aW5nLiAgVGhpcwpjb21lcyBmcm9tIG9zc3Rlc3QncyBmbGlnaHQgY29uc3RydWN0aW9u
IGNvZGUuICBvc3N0ZXN0IGlzIGNvbmZpZ3VyZWQKdG8gZW5hYmxlIGxpdmUgcGF0Y2hpbmcsIGlu
IHRoZSBidWlsZCwgb25seSBvbiB0aGUgeGVuLSogYnJhbmNoZXMuCgpVbmZvcnR1bmF0ZWx5IGR1
ZSB0byB0aGUgeGVuL2NtZGxpbmUgcmVncmVzc2lvbiwgdGhlIG9zc3Rlc3QgYmlzZWN0b3IKZG9l
cyBub3Qgc2VlbSB0byBoYXZlIGEgdXNlZnVsIGVub3VnaCBiYXNlbGluZS4gIEkgaGF2ZSBybSdk
IHRoZSBzdGFtcApmaWxlcyBhbmQgaXQgbWF5IG1hbmFnZSB0byBkbyBiZXR0ZXIgYnV0IEkgZG91
YnQgaXQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
