Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D53701B9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 15:51:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpYgt-0001JK-Lv; Mon, 22 Jul 2019 13:49:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1DzW=VT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hpYgr-0001JB-Nh
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 13:49:21 +0000
X-Inumbo-ID: 8182f929-ac87-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8182f929-ac87-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 13:49:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RmJsBKw4dyOtrQllUt5jvWkH8wWETWB4nYKXwqdOXFmmB/uks7G+tZyWUUT97zQAch6Ed1U8N9
 2xEt+5FcJSUyQgoeYzHF6BzWVXnD0/EGzPZkIdGvkrEbWAah5RwYNFfTf+MDxkgzp3JOh3N8Bh
 aQ45mIhfvyTugVvS+8gm45ntHNQcfEq86d7RQcff3hVG80Y89cybGdSBMPrUqucF/1ahVTvcNd
 yBzivegatLTv7ovfwI0hP6ITbXehsCY0xv+AbFkp5hgepE7dvhCIC8iufufKs9XcmJdc8UmHhW
 n8M=
X-SBRS: 2.7
X-MesageID: 3299383
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3299383"
Date: Mon, 22 Jul 2019 14:49:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190722134912.GF1208@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-10-anthony.perard@citrix.com>
 <20190715142219.m2t67v2dcyabqp2p@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715142219.m2t67v2dcyabqp2p@MacBook-Air-de-Roger.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDQ6MjI6MTlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEp1bCAwNCwgMjAxOSBhdCAwMzo0MjowN1BNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IEFDUEkgVGltZXIgZG9lcyBub3Qgd29yayBpbiBhIFBWSCBn
dWVzdCwgYnV0IGxvY2FsIEFQSUMgd29ya3Mgb24gYm90aAo+IAo+IFRoaXMgaXMgbm90IGFjY3Vy
YXRlLiBJdCdzIG5vdCB0aGF0IHRoZSBBQ1BJIHRpbWVyIGRvZXNuJ3Qgd29yaywgaXQncwo+IGp1
c3QgdGhhdCBpdCdzIG5vdCBwcmVzZW50LiBUaGUgUE1fVE1SX0JMSyBzaG91bGQgYmUgc2V0IHRv
IDAgdG8KPiBpbmRpY2F0ZSB0aGUgbGFjayBvZiBQTSB0aW1lciBzdXBwb3J0LCBvciBlbHNlIHRo
ZXJlJ3Mgc29tZXRoaW5nCj4gYnJva2VuLgoKSSdsbCByZXdvcmQgdGhhdCBmaXJzdCBzZW50ZW5j
ZS4KCk9WTUYgZG9lc24ndCBsb29rIGF0IHRoZSBQTV9UTVJfQkxLIHZhbHVlIHdoZW4gaW5pdGlh
bGl6aW5nIHRoYXQgdGltZXIsCml0IG9ubHkgbG9va3MgYXQgdGhlIFBDSSBob3N0IGJyaWRnZSBk
ZXZpY2UgSUQgYmVjYXVzZSBPVk1GIGlzIGJ1aWx0CndpdGggUUVNVSBpbiBtaW5kIGFuZCB0aGVy
ZSBhcmUgb25seSB0d28gcG9zc2libGVzIGNob2ljZXMsIFFFTVUgaXMKcnVubmluZyB3aXRoIGEg
cGlpeCBvciBxMzUgbWFjaGluZSB0eXBlLCBJIHRoaW5rLgoKPiA+IFBWSCBhbmQgSFZNLgo+ID4g
Cj4gPiBOb3RlIHRoYXQgdGhlIHVzZSBvZiBTZWNQZWlEeGVUaW1lckxpYkNwdSBtaWdodCBiZSBh
biBpc3N1ZSB3aXRoIGEKPiA+IGRyaXZlciBvZiB0eXBlIERYRV9SVU5USU1FX0RSSVZFUi4gSSd2
ZSBhdHRlbXB0ZGUgdG8gZmluZCBvdXQgd2hpY2ggb2YKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeIGF0dGVtcHRlZAo+ID4gdGhlIERYRV9SVU5USU1FX0RSSVZF
UiB1c2VzIHRoZSBUaW1lckxpYiBhdCBydW50aW1lLiBJJ3ZlIGRvbmUgdGhhdCBieQo+ID4gcmVw
bGFjaW5nIHRoZSBUaW1lckxpYiBldmFsdWF0aW9uIGluCj4gPiBbTGlicmFyeUNsYXNzZXMuY29t
bW9uLkRYRV9SVU5USU1FX0RSSVZFUl0gYnkgYSBkaWZmZXJlbnQgb25lIGFuZAo+ID4gY2hlY2sg
ZXZlcnkgbW9kdWxlIHRoYXQgdXNlcyBpdCAod2l0aCB0aGUgLS1yZXBvcnQtZmlsZT1yZXBvcnQg
YnVpbGQKPiAgIF4gY2hlY2tpbmcKPiA+IG9wdGlvbikuCj4gPiAKPiA+IFJlc2V0U3lzdGVtUnVu
dGltZUR4ZSBpcyBjYWxsaW5nIHRoZSBUaW1lckxpYiBBUEkgYXQgcnVudGltZSB0byBkbyB0aGUK
PiA+IG9wZXJhdGlvbiAiRWZpUmVzZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2ZXIgY29tcGxldGUg
aWYgdGhlIE9TIGhhdmUKPiA+IGRpc2FibGVkIHRoZSBMb2NhbCBBUElDIFRpbWVyLgo+IAo+IFRo
YW5rcywgUm9nZXIuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
