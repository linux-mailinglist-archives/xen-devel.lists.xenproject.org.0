Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9421C6C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 19:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRgaM-0000Jv-0P; Fri, 17 May 2019 17:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7l41=TR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hRgaK-0000Jq-Ig
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 17:23:56 +0000
X-Inumbo-ID: 8a9eb072-78c8-11e9-b9df-fbca121471c7
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9eb072-78c8-11e9-b9df-fbca121471c7;
 Fri, 17 May 2019 17:23:53 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: K3vBdh0S9PxTS8OBfKsl+Mzgz82rZJQiV0zROK05BTrTy3YX+chxkzmBlF+yWwQESZ9Q3t+iQj
 t1zShZaCJ5stJpiMY/E5W5/tZY2ebVg54dGzKC7xsH5d9ta9thUZ96rsmq6VaWya+dBEYp+WPw
 2S813zvTMxPZvEzKt4ot05ELtyAB/hXYYUsJq4P5Io3mAGp+mUcBr65srMAWKRS6p6bmeczcaI
 /GsCh+M20B0x9E3z7n3cdOH/xDP/sp444F54Au7N1QBIIV98lxHu92vuVcHhTU7b8GN6D7m5Jc
 IYg=
X-SBRS: 2.7
X-MesageID: 592949
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="592949"
Date: Fri, 17 May 2019 18:23:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190517172344.GE1245@perard.uk.xensource.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTA6Mzg6NTRQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFudGhvbnksCj4gCj4gVGhhbmsgeW91IGZvciBDQ2luZyBtZS4KPiAKPiBPbiA1
LzE2LzE5IDExOjM3IEFNLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDE1
LCAyMDE5IGF0IDA3OjQ4OjE3UE0gKzAwMDAsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToK
PiA+ID4gZmxpZ2h0IDEzNjE4NCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFtyZWFs
XQo+ID4gPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3Mv
MTM2MTg0Lwo+ID4gPiAKPiA+ID4gUmVncmVzc2lvbnMgOi0oCj4gPiA+IAo+ID4gPiBUZXN0cyB3
aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiA+ID4gaW5jbHVkaW5nIHRl
c3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gPiA+ICAgYnVpbGQtYXJtNjQtcHZvcHMgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbiAgaW4gMTM0NTk0
Cj4gPiA+ICAgYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAg
ICAgICAgICAgICAgIGJyb2tlbiAgaW4gMTM0NTk0Cj4gPiA+ICAgYnVpbGQtYXJtNjQteHNtICAg
ICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbiAgaW4gMTM0
NTk0Cj4gPiA+ICAgYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
YnJva2VuIGluIDEzNDU5NCBSRUdSLiB2cy4gMTI1NTc1Cj4gPiA+ICAgYnVpbGQtYXJtNjQtcHZv
cHMgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIGluIDEzNDU5NCBSRUdSLiB2cy4g
MTI1NTc1Cj4gPiA+ICAgYnVpbGQtYXJtNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwo
NCkgYnJva2VuIGluIDEzNDU5NCBSRUdSLiB2cy4gMTI1NTc1Cj4gPiA+ICAgdGVzdC1hcm02NC1h
cm02NC1saWJ2aXJ0LXhzbSAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTI1NTc1Cj4gPiA+ICAgdGVzdC1hcm02NC1hcm02NC14bCAgICAgICAgICAgNyB4ZW4tYm9v
dCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI1NTc1Cj4gPiA+ICAgdGVzdC1hcm02
NC1hcm02NC14bC14c20gICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdS
LiB2cy4gMTI1NTc1Cj4gPiA+ICAgdGVzdC1hcm02NC1hcm02NC14bC1jcmVkaXQyICAgNyB4ZW4t
Ym9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI1NTc1Cj4gPiA+IAo+ID4gCj4g
PiBJYW4sIEp1bGllbiwKPiA+IAo+ID4gSSBjYW4ndCBmaWd1cmUgb3V0IHdoeSBYZW4gY29uc2lz
dGVudGx5IGZhaWxzIHRvIGJvb3Qgb24gcm9jaGVzdGVyKiBpbgo+ID4gdGhlIHFlbXUtdXBzdHJl
YW0tNC4xMS10ZXN0aW5nIGZsaWdodHMuIFRoZSB4ZW4tNC4xMS10ZXN0aW5nIHNlZW1zIHRvCj4g
PiBwYXNzLgo+ID4gCj4gPiBBdCBib290LCB0aGUgYm9vdCBsb2FkZXIgc2VlbXMgdG8gbG9hZCBi
bG9icywgYnV0IHdoZW4gaXQncyB0aW1lIHRvIFhlbgo+ID4gdG8gc2hpbmUsIHRoZXJlIGFyZSBu
byBvdXRwdXQgZnJvbSBYZW4gb24gdGhlIHNlcmlhbC4KPiAKPiBUaGUgc2VyaWFsIGNvbnNvbGUg
aXMgaW5pdGlhbGl6aW5nIGZhaXJseSBsYXRlIGluIHRoZSBwcm9jZXNzLiBBbnkgdXNlZnVsCj4g
bWVzc2FnZSAoc3VjaCBhcyBtZW1vcnkgc2V0dXAgb3IgZXZlbiBwYXJ0IG9mIHRoZSBpbnRlcnJ1
cHRzKSB3aWxsIGJlIGhpZGUKPiBvdXQuIEZvciBnZXR0aW5nIHRoZW0sIHlvdSBuZWVkIGVhcmx5
cHJpbnRrLiBVbmZvcnR1bmF0ZWx5IHRoZXkgY2FuJ3QgYmUKPiBjb25maWd1cmVkIGF0IHJ1bnRp
bWUgdG9kYXkgOiguCgpJIHRoaW5rIEkgbWFuYWdlZCB0byBydW4gdGhlIGpvYiB3aXRoIGVhcmx5
cHJpbnRrIG9uIHJvY2hlc3RlciwgYnV0ClhlbiBoYXZlIGJvb3RlZDoKaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjQ1MS8KClNvIHRoYXQgcHJvYmFi
bHkgd2Fzbid0IHZlcnkgdXNlZnVsLgoKKEkgaGFkIHRvIGhhY2sgb3NzdGVzdCBpbiBvcmRlciB0
byBjb21waWxlIHhlbiB3aXRoIGVhcmx5IHByaW50ay4pCgotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
