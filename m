Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6E6E42D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:23:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPzt-0003EY-44; Fri, 19 Jul 2019 10:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vi2/=VQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hoPzr-0003ET-Il
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:20:15 +0000
X-Inumbo-ID: ca920b30-aa0e-11e9-8d38-233d7a57342b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca920b30-aa0e-11e9-8d38-233d7a57342b;
 Fri, 19 Jul 2019 10:20:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gYZJS3f6gIfbMnVZXmzteW5i/YhvBjZcqY4K2ruLEv8VkJnxOBH+sM3+s9OuJUJH3m7/SRfydD
 gtBmipG0JhTcDqhYhTT21creU7IIx5pv3Y16GvgdzMyGVZBUyDk3sECA95sZwR3kMemBWijrSg
 Uwhdyr898h7OJineJGI8ms3uU4aoRxiE+eBpwJnr5rbHGgMdyb9l7higKMldi8dENgJ1bieyYx
 hoPFYTJBPsNnHBbNNC3ZxEGTar3ycg5HFbbzKu9dyr4Dgv6hMCAaVFAdMjFUIW33ia5SAi8Y12
 uoM=
X-SBRS: 2.7
X-MesageID: 3264987
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3264987"
Date: Fri, 19 Jul 2019 11:20:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190719102008.GB1208@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6NTc6MDZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNC8wNy8yMDE5IDE1OjQyLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFz
bSBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTU4MTk1YmM1ZQo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTE2L1Jlc2V0
VmVjdG9yVnRmMC5hc20KPiA+ICt2dGZTaWduYXR1cmU6Cj4gPiArICAgIERCICAgICAgJ1YnLCAn
VCcsICdGJywgMAo+ID4gKwo+ID4gK0FMSUdOICAgMTYKPiA+ICsKPiA+ICtyZXNldFZlY3RvcjoK
PiA+ICs7Cj4gPiArOyBSZXNldCBWZWN0b3IKPiA+ICs7Cj4gPiArOyBUaGlzIGlzIHdoZXJlIHRo
ZSBwcm9jZXNzb3Igd2lsbCBiZWdpbiBleGVjdXRpb24KPiA+ICs7Cj4gPiArICAgIG5vcAo+ID4g
KyAgICBub3AKPiAKPiBXaHkgdHdvIG5vcHM/CgpJIGRvbid0IGtub3csIHRoaXMgaXMgZXhpc3Rp
bmcgY29kZSB0aGF0IEkgZHVwbGljYXRlZCB0byBhbGxvdyBhZGRpbmcgYQpuZXcgZW50cnkgcG9p
bnQuIChJIHdhbnRlZCB0byB1c2UgLS1maW5kLWNvcGllcy1oYXJkZXIgd2hlbiBzZW5kaW5nIHRo
ZQpwYXRjaCwgYnV0IGZvcmdvdCB0aGlzIHRpbWUuIFRoaXMgcGFydCBvZiB0aGUgY2h1bmsgd291
bGQgbm90IGJlIHRoZXJlLikKCj4gPiArICAgIGptcCAgICAgRWFybHlCc3BJbml0UmVhbDE2Cj4g
PiArCj4gPiArQUxJR04gICAxNgo+ID4gKwo+ID4gK2ZvdXJHaWdhYnl0ZXM6Cj4gPiArCj4gPiBk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtIGIv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMmExN2ZlZDUyZgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNt
Cj4gPiBAQCAtMCwwICsxLDQ5IEBACj4gPiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gKzsg
QGZpbGUKPiA+ICs7IEFuIGVudHJ5IHBvaW50IHVzZSBieSBYZW4gd2hlbiBhIGd1ZXN0IGlzIHN0
YXJ0ZWQgaW4gUFZIIG1vZGUuCj4gPiArOwo+ID4gKzsgQ29weXJpZ2h0IChjKSAyMDE5LCBDaXRy
aXggU3lzdGVtcywgSW5jLgo+ID4gKzsKPiA+ICs7IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBC
U0QtMi1DbGF1c2UtUGF0ZW50Cj4gPiArOwo+ID4gKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ICsKPiA+ICtCSVRTICAgIDMyCj4gPiArCj4gPiAreGVuUFZITWFpbjoKPiA+ICsgICAgOwo+ID4g
KyAgICA7ICdCUCcgdG8gaW5kaWNhdGUgYm9vdC1zdHJhcCBwcm9jZXNzb3IKPiAKPiBJbmRpY2F0
ZSB0byB3aGF0PwoKQWNjb3JkaW5nIHRvIFVlZmlDcHVQa2cvUmVzZXRWZWN0b3IvVnRmMC9SZWFk
TWUudHh0LCB0aGF0J3MgYSBwYXJhbWV0ZXIKZm9yIHRoZSBTRUMgaW1hZ2UgdGhhdCB0aGlzIFJl
c2V0VmVjdG9yIGxvY2F0ZXMgdGhlbiBydW4uCgo+ID4gKyAgICA7Cj4gPiArICAgIG1vdiAgICAg
ZGksICdCUCcKPiA+ICsKPiA+ICsgICAgOwo+ID4gKyAgICA7IEVTUCB3aWxsIGJlIHVzZWQgYXMg
aW5pdGlhbCB2YWx1ZSBvZiB0aGUgRUFYIHJlZ2lzdGVyCj4gPiArICAgIDsgaW4gTWFpbi5hc20K
PiA+ICsgICAgOwo+ID4gKyAgICB4b3IgICAgIGVzcCwgZXNwCj4gPiArCj4gPiArICAgIG1vdiAg
ICAgZWJ4LCBBRERSX09GKGdkdHIpCj4gPiArICAgIGxnZHQgICAgW2VieF0KPiAKPiBsZ2R0IFtB
RERSX09GKGdkdHIpXQo+IAo+IHNob3VsZCB3b3JrIGZpbmUsIGJlY2F1c2UgeW91J3JlIGluIDMy
Yml0IG1vZGUuCgpZZXMsIHRoYXQgd29ya2VkIGZpbmUsIGJ1dCBhIHN1YnNlcXVlbnQgcGF0Y2gg
aXMgZ29pbmcgdG8gd2FudCB0byBtb2RpZnkKdGhlIGdkdHIgYWRkcmVzcywgc28gSSd2ZSBiZWVu
IGxhenkgYW5kIGRpZG4ndCB1c2UgbGdkdCBbQUREUl9PRigpXQpoZXJlLgpTZWU6IE92bWZQa2cv
WGVuUmVzZXRWZWN0b3I6IEFsbG93IGp1bXBzdGFydCBmcm9tIGVpdGhlciBodm1sb2FkZXIgb3Ig
UFZICmh0dHBzOi8vcGF0Y2hldy5vcmcvRURLMi8yMDE5MDcwNDE0NDIzMy4yNzk2OC0xLWFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20vMjAxOTA3MDQxNDQyMzMuMjc5NjgtOS1hbnRob255LnBlcmFy
ZEBjaXRyaXguY29tLwoKPiBNb3JlIGltcG9ydGFudGx5IGZvciBQVkggaG93ZXZlciwgeW91IGRv
bid0IGNsb2JiZXIgdGhlIHN0YXJ0X2luZm8gcG9pbnRlci4KCkkgd2lsbCBhY3R1YWxseSBzYXZl
IHRoZSBzdGFydF9pbmZvIHBvaW50ZXIgYmVmb3JlIHNldHRpbmcgdGhlIGdkdCwgYnV0CnRoYXQn
cyBkb25lIGluIGEgZGlmZmVyZW50IHBhdGNoOgpPdm1mUGtnL1hlblJlc2V0VmVjdG9yOiBTYXZp
bmcgc3RhcnQgb2YgZGF5IHBvaW50ZXIgZm9yIFBWSCBndWVzdHMKaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9FREsyLzIwMTkwNzA0MTQ0MjMzLjI3OTY4LTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS8y
MDE5MDcwNDE0NDIzMy4yNzk2OC04LWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20vCgo+ID4gKwo+
ID4gKyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFVTFRfQ1IwCj4gPiArICAgIG1vdiAgICAgY3Iw
LCBlYXgKPiA+ICsKPiA+ICsgICAgam1wICAgICBMSU5FQVJfQ09ERV9TRUw6QUREUl9PRiguam1w
VG9OZXdDb2RlU2VnKQo+ID4gKy5qbXBUb05ld0NvZGVTZWc6Cj4gCj4gRG9lcyAxZiAob3Igc29t
ZSBlcXVpdmFsZW50KSBub3Qgd29yaywgb3IgaXMgdGhpcyBhZ2FpbnN0IHRoZSBjb2Rpbmcgc3R5
bGU/CgpJIGRpZG4ndCBmaW5kIHRoZSAke2xhYmVsfWYgc3ludGF4IHdoZW4gcmVhZGluZyB0aGUg
TkFTTSBtYW51YWwuIEJ1dAp1c2luZyAuJHtsYWJlbH0gd291bGQgYmUgdGhlIGNsb3Nlc3QuIFRo
b3NlIGxhYmVscyBzdGFydGluZyB3aXRoIGEgZG90CmFyZSBjYWxsZWQgbG9jYWwgbGFiZWxzLiBU
aGUgYWN0dWFsIGZ1bGwgbGFiZWwsIGlmIG9uZSB3YW50IHRvIHVzZSBpdApmcm9tIGFueXdoZXJl
LCB3b3VsZCBiZSAiWGVuUFZITWFpbi5qbXBUb05ld0NvZGVTZWciIGhlcmUuCgo+ID4gKwo+ID4g
KyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFVTFRfQ1I0Cj4gPiArICAgIG1vdiAgICAgY3I0LCBl
YXgKPiA+ICsKPiA+ICsgICAgbW92ICAgICBheCwgTElORUFSX1NFTAo+ID4gKyAgICBtb3YgICAg
IGRzLCBheAo+ID4gKyAgICBtb3YgICAgIGVzLCBheAo+ID4gKyAgICBtb3YgICAgIGZzLCBheAo+
ID4gKyAgICBtb3YgICAgIGdzLCBheAo+ID4gKyAgICBtb3YgICAgIHNzLCBheAo+IAo+IFVzZSBl
YXggcmF0aGVyIHRoYW4gYXguwqAgVGhlIGluc3RydWN0aW9uIGRlY29kZSB3aWxsIGJlIG11Y2gg
aGFwcGllcgo+IHdpdGggdGhlIHJlc3VsdCwgYW5kIGl0IHJlc3VsdHMgaW4gc2hvcnRlciBhc3Nl
bWJsZWQgY29kZS4KCkkgbG9vayBpbnRvIHRoYXQuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
