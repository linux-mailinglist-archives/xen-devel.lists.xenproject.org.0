Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16821ABA
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 17:36:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRerG-0006Eb-Om; Fri, 17 May 2019 15:33:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3oPk=TR=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRerF-0006EV-5A
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:33:17 +0000
X-Inumbo-ID: 16acd5df-78b9-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16acd5df-78b9-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 15:33:15 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Zn3TPycnbeOSnDhzvOIWdMqnbX/v408rtncoQ+1QQzKkjDHhWqDv8OtrqvYsoXtqZitrRA6TWE
 Lp8qigHhQC9PcDMTh8gvs0VOCoZBJN00Q485rxI9hxGPkmIMGGig67llyaW4h/nACc25T2jCIq
 6vlMJlbkf4nM0zWiqkVJWSq9zTrw/gISO0Xn63CCgEe4/g6lD95ApApJIX3hkGkmQJyBwJ9/6y
 26jyTgd95yy0ZP4HteDhzTHWGG6VaQiNjom+YMZ8+xNn4EDnakuCcvikARjhqDkji/NMRdN6uH
 DH4=
X-SBRS: 2.7
X-MesageID: 586032
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="586032"
Date: Fri, 17 May 2019 16:33:11 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20190517153311.GM2798@zion.uk.xensource.com>
References: <20190513153414.GU2798@zion.uk.xensource.com>
 <26874323-BD77-48C7-AA7F-83B964CDDBEC@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26874323-BD77-48C7-AA7F-83B964CDDBEC@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Anyone using blktap2?
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
Cc: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Alistair
 Francis <alistair.francis@xilinx.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDI6MzY6NDFBTSAtMDQwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+ID4gT24gTWF5IDEzLCAyMDE5LCBhdCAxMTozNCwgV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IEhlbGxvCj4gPiAKPiA+IFNlZWluZyB0aGF0IHlvdSB3
ZXJlIHRoZSBsYXN0IHBlb3BsZSB3aG8gY2hhbmdlZCBibGt0YXAyIGluIGEgbWVhbmluZ2Z1bAo+
ID4gd2F5OiBkbyB5b3UgdXNlIGl0IGF0IGFsbD8KPiAKPiBBcyBkaXNjdXNzZWQgRjJGIGluIGEg
WGVuIFN1bW1pdCAyMDE3IGRlc2lnbiBzZXNzaW9uOiBPcGVuWFQgYW5kCj4gQ2l0cml4IFhlblNl
cnZlciB1c2UgYmxrdGFwLiBWSEQgZW5jcnlwdGlvbiBzdXBwb3J0IHdhcyByZWNlbnRseQo+IHVw
c3RyZWFtZWQgZnJvbSBPcGVuWFQgdG8gdGhlIENpdHJpeC1tYWludGFpbmVkIHJlcG8gWzFdIGZv
ciBibGt0YXAzCj4gWzJdLCBub3cgdXNlZCBieSBPcGVuWFQuICBQcmlvciB2ZXJzaW9ucyBvZiBP
cGVuWFQgdXNlIGJsa3RhcDIuCj4gCj4gQ2l0cml4IGNoYW5nZWQgdGhlIGxpY2Vuc2Ugb2YgWEFQ
SSBibGt0YXAgZnJvbSBHUEwgdG8gQlNELCB0byBlbmFibGUKPiBub24tT1NTIGZlYXR1cmVzIGlu
IHRoZSBwYWlkIHZlcnNpb24gb2YgWGVuU2VydmVyLiBUaGUgWEFQSSBibGt0YXAKPiByZXBvIGlz
IGFjdGl2ZWx5IG1haW50YWluZWQsIHdpdGggZG96ZW5zIG9mIGNvbW1pdHMgaW4gMjAxOCBhbmQg
MjAxOSwKPiB0aGUgbW9zdCByZWNlbnQgYmVpbmcgdGhpcyB3ZWVrLgo+IAo+IElmIHRoZSBYQVBJ
IFszXSBibGt0YXAgcmVwb3MgYXJlIHBhcnQgb2YgWGVuIFByb2plY3QsIHNob3VsZCBMaWJYTAo+
IHN1cHBvcnQgYSBYZW4gUHJvamVjdCBmZWF0dXJlIHRoYXQgaXMgYWN0aXZlbHkgbWFpbnRhaW5l
ZCBhbmQgc2hpcHBpbmcKPiBpbiBwcm9kdWN0aW9uIHN5c3RlbXM/IERvZXMgdGhlIGJsa3RhcDMg
cmVwbyBbMV0gbmVlZCB0byBiZSBzZXBhcmF0ZWQKPiBmcm9tIFhBUEk/ICBQZXJoYXBzIGEgdG9w
aWMgZm9yIGRpc2N1c3Npb24gYXQgdGhlIHVwY29taW5nIFhlbiBTdW1taXQuCj4gCgpZZXMgcGxl
YXNlIHByb3Bvc2UgYSB0b3BpYy4KClRvIGFuc3dlciBvbmUgb2YgeW91ciBxdWVzdGlvbnM6CgpU
aGVyZSBpcyBhIHN1cHBvcnRlZCB3YXkgdG8gdXNlIGJsa3RhcCBhZnRlciByZW1vdmluZyB0aGUg
aW4tdHJlZSBjb2RlCi0tIHVzZSBwaHkgYmFja2VuZCBhbmQgbWFrZSB1c2Ugb2YgdGhlIGJsb2Nr
LXRhcCBzY3JpcHQsIHdoaWNoIEkgaGF2ZQpkZWxpYmVyYXRlbHkgbGVmdCBpbnRhY3QgaW4gdHJl
ZS4KClNlZSB0aGUgY29tbWVudCBhdCB0aGUgYmVnaW5uaW5nIG9mIGhvdHBsdWcvTGludXgvYmxv
Y2stdGFwLgoKV2l0aCB0aGlzIG1lY2hhbmlzbSB3ZSBkb24ndCBuZWVkIHRvIGNhcnJ5IGEgY29w
eSBvZiBibGt0YXBYIGluIHRyZWUuCgo+ID4gSSdtIHRoaW5raW5nIGFib3V0IGRyb3BwaW5nIGl0
IChhZ2FpbikuCj4gCj4gV2hhdCB3b3VsZCBiZSB0aGUgcHJvcG9zZWQgbWVjaGFuaXNtIGZvciBY
ZW4gVk0gYmxvY2sgc3RvcmFnZSBiYWNrZWQKPiBieSB0aGluLXByb3Zpc2lvbmVkIFZIRCBmaWxl
cyB3aXRoIHBlci1WTSBlbmNyeXB0aW9uIGtleXM/IFRoaXMKPiBjYXBhYmlsaXR5IHdhcyBzdWZm
aWNpZW50bHkgdmFsdWFibGUgdG8gYmUgdXBzdHJlYW1lZCBieSBDaXRyaXgsIGZyb20KPiBPcGVu
WFQgdG8gWGVuIFByb2plY3QgWEFQSSBpbiAyMDE4LiAgCj4gCj4gV2l0aCB0aGUgaW1taW5lbnQg
YXJyaXZhbCBvZiBXaW5kb3dzIEh5cGVyLVYgYW5kIFdTTDIgTGludXggNC4xOSBvbgo+IGRldmVs
b3BlciBkZXNrdG9wcywgVkhEIHN1cHBvcnQgKGkuZS4gTWljcm9zb2Z0IHN0b3JhZ2UKPiBpbnRl
cm9wZXJhYmlsaXR5KSBpbiBYZW4gbWF5IGJlIGEgZmVhdHVyZSB0byBpbXByb3ZlIHJhdGhlciB0
aGFuCj4gcmVtb3ZlLgoKV2UncmUgbWVyZWx5IHRhbGtpbmcgYWJvdXQgZHJvcHBpbmcgdGhlIChk
ZWFkKSBpbi10cmVlIGNvcHkgb2YgYmxrdGFwMgphbmQgdGhlIGluZmxleGlibGUgY29kZSBpbiBs
aWJ4bC4gTm90aGluZyBzdG9wcyB5b3UgZnJvbSB1c2luZyB0aGUKYWZvcmVtZW50aW9uZWQgbWVj
aGFuaXNtIHRvIGNvbnRpbnVlIHVzaW5nIHdoYXRldmVyIG91dCBvZiB0cmVlIGJsa3RhcAp5b3Ug
aGF2ZS4KCkRldmVsb3BtZW50IG9mIGJsa3RhcFggc2hvdWxkIGJlIGRpc2N1c3NlZCB3aXRoIHJl
c3BlY3RpdmUgZGV2ZWxvcGVycy4gSQpkb24ndCB0aGluayB3ZSB3aWxsIHdhbnQgdG8gY2Fycnkg
YSBjb3B5IGluIHhlbi5naXQuCgpXZWkuCgoKPiAKPiBSaWNoCj4gCj4gWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS94YXBpLXByb2plY3QvYmxrdGFwCj4gCj4gWzJdIGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL0Jsa3RhcDMKPiAKPiBbM10gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9kZXZl
bG9wZXJzL3RlYW1zL3hlbi1hcGkvCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
