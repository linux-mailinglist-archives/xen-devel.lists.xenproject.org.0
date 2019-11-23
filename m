Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E5107CCC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 05:33:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYN2y-0001Zk-6f; Sat, 23 Nov 2019 04:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hfW9=ZP=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1iYN2x-0001Zf-2P
 for xen-devel@lists.xen.org; Sat, 23 Nov 2019 04:29:23 +0000
X-Inumbo-ID: d1705bec-0da9-11ea-a36f-12813bfff9fa
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1705bec-0da9-11ea-a36f-12813bfff9fa;
 Sat, 23 Nov 2019 04:29:20 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id xAN4T7fj083450
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 22 Nov 2019 23:29:12 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id xAN4T6cL083449;
 Fri, 22 Nov 2019 20:29:06 -0800 (PST) (envelope-from ehem)
Date: Fri, 22 Nov 2019 20:29:06 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: J??rgen Gro?? <jgross@suse.com>
Message-ID: <20191123042906.GA79247@mattapan.m5p.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
 <005596b6-9228-801b-300a-57807a96d051@suse.com>
 <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=0.0 required=10.0 tests=none autolearn=unavailable
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mattapan.m5p.com
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Rishi <2rushikeshj@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDQ6NDY6MjFQTSArMDEwMCwgSj8/cmdlbiBHcm8/PyB3
cm90ZToKPiBPbiAyMS4xMS4xOSAxNjozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAyMS4x
MS4yMDE5IDE1OjI0LCBKPz9yZ2VuIEdybz8/IHdyb3RlOgo+ID4+IFNvOiBubywganVzdCBnaXZp
bmcgZG9tMCBhY2Nlc3MgdG8gdGhlIG1hbmFnZW1lbnQgaGFyZHdhcmUgaXNuJ3QgZ29pbmcKPiA+
PiB0byBmbHkuIFlvdSBuZWVkIHRvIGhhdmUgYSBwcm9wZXIgdmlydHVhbGl6YXRpb24gbGF5ZXIg
Zm9yIHRoYXQgcHVycG9zZS4KPiA+IAo+ID4gT3IsIGxpa2UgSSBoYWQgZG9uZSBpbiBvdXIgWGVu
b0xpbnV4IGZvcndhcmQgcG9ydCwgeW91IG5lZWQgdG8KPiA+IGdvIHRocm91Z2ggaG9vcHMgdG8g
bWFrZSB0aGUgY29yZXRlbXAgZHJpdmVyIGFjdHVhbGx5IHVuZGVyc3RhbmQKPiA+IHRoZSBlbnZp
cm9ubWVudCBpdCdzIHJ1bm5pbmcgaW4uCj4gCj4gVGhpcyB3aWxsIHN0aWxsIG5vdCBndWFyYW50
ZWUgeW91J2xsIGJlIGFibGUgdG8gcmVhY2ggYWxsIHBoeXNpY2FsCj4gY3B1cy4gSUlSQyB5b3Ug
cGlubmVkIHRoZSB2Y3B1IHRvIHRoZSByZXNwZWN0aXZlIHBoeXNpY2FsIGNwdSBmb3IKPiBwZXJm
b3JtaW5nIGl0cyBkdXR5LCBidXQgd2l0aCBjcHVwb29scyB0aGlzIG1pZ2h0IG5vdCBiZSBwb3Nz
aWJsZSBmb3IKPiBhbGwgcGh5c2ljYWwgY3B1cyBpbiB0aGUgc3lzdGVtLgoKU2ltaWxhciB0byB0
aGUgaXNzdWUgb2YgTUNFIHN1cHBvcnQsIG1pZ2h0IGl0IGluc3RlYWQgYmUgYmV0dGVyIHRvIGhh
dmUKKmxlc3MqIHZpcnR1YWxpemF0aW9uIGhlcmUgaW5zdGVhZCBvZiBtb3JlPyAgVGhlIG9yaWdp
bmFsIGlkZWEgYmVoaW5kIFhlbgp3YXMgdG8gbGVhdmUgdGhlIGhhcmQgdG8gdmlydHVhbGl6ZSBi
aXRzIHZpc2libGUgYW5kIHdvcmsgd2l0aCBEb21haW4gMC4KCk1pZ2h0IGl0IGJlIGJldHRlciB0
byBleHBvc2UgdGhpcyBmdW5jdGlvbmFsaXR5IHRvIERvbWFpbiAwLCB0aGVuCmludGVyY2VwdCB0
aGUga2VybmVsIGNhbGxzPyAgSnVzdCBuZWVkcyAxIHZjcHUgd2hpY2ggY2FuIGJlIHNjaGVkdWxl
ZCBvbgphbnkgcHJvY2Vzc29yIGFuZCB0aGF0IGNhbiBiZSBtb3ZlZCBhcm91bmQgdG8gcmV0cmll
dmUgdGhlIGRhdGEuICBUaGlzCndheSBYZW4gd291bGRuJ3QgbmVlZCBhIHByb3BlciBkcml2ZXIg
Zm9yIHRoZSBtYW5hZ2VtZW50IGhhcmR3YXJlLgoKCi0tIAooXF9fXyhcX19fKFxfX19fX18gICAg
ICAgICAgLS09PiA4LSkgRUhNIDw9LS0gICAgICAgICAgX19fX19fLylfX18vKV9fXy8pCiBcQlMg
KCAgICB8ICAgICAgICAgZWhlbStzaWdtc2dAbTVwLmNvbSAgUEdQIDg3MTQ1NDQ1ICAgICAgICAg
fCAgICApICAgLwogIFxfQ1NcICAgfCAgX19fX18gIC1PICNpbmNsdWRlIDxzdGRkaXNjbGFpbWVy
Lmg+IE8tICAgX19fX18gIHwgICAvICBfLwo4QTE5XF9fX1xffF8vNThEMiA3RTNEIERERjQgN0JB
NiA8LVBHUC0+IDQxRDEgQjM3NSAzN0QwIDg3MTRcX3xfL19fXy81NDQ1CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
