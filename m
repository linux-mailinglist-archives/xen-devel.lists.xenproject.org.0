Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD919939
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 09:53:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP0HC-0000M3-5t; Fri, 10 May 2019 07:49:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP0HB-0000Ly-6g
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 07:49:05 +0000
X-Inumbo-ID: 12cdc130-72f8-11e9-a336-3fb2a2350b53
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12cdc130-72f8-11e9-a336-3fb2a2350b53;
 Fri, 10 May 2019 07:49:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 01:48:59 -0600
Message-Id: <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 01:48:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth.xen@gmail.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
In-Reply-To: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, committers@xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDAzOjI4LCA8bGFycy5rdXJ0aC54ZW5AZ21haWwuY29tPiB3cm90
ZToKPiBIaSBhbGwsCj4gCj4gZm9sbG93aW5nIGEgZGlzY3Vzc2lvbiB3aXRoIGNvbW1pdHRlcnMg
YWJvdXQgR3Vlc3QgdGVzdGluZyBpbiBPU1NURVNULCBpdCAKPiBzdXJmYWNlZCB0aGF0IHdlIGhh
dmUgbm90IHVwZGF0ZWQgd2hhdCBkaXN0cm9zIHdlIHRlc3QgaW4gT1NTVEVTVCBmb3IgYSB2ZXJ5
IAo+IGxvbmcgdGltZS4gQWxsIGFncmVlZCB0aGF0IHdlIHNob3VsZCByZWd1bGFybHkgcmV2aWV3
IHdoYXQgd2UgdGVzdCBhZ2FpbnN0OiAKPiBtYXliZSBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgcmVs
ZWFzZSBjeWNsZQo+IAo+IEluIGFueSBjYXNlLCBjdXJyZW50bHkgd2UgdGVzdCBhZ2FpbnN0Cj4g
Cj4geDg2IEhWTSBndWVzdHM6Cj4gICBkZWJpYW4tOS40LjAte2kzODYsYW1kNjR9LUNELTEuaXNv
Cj4gICByaGVsLXNlcnZlci02LjEtaTM4Ni1kdmQuaXNvCj4gICB3aW4xMHYxNzAzLXg4Ni5pc28K
PiAgIHdpbjcteDY0Lmlzbwo+ICAgd3MxNi14NjQuaXNvCj4gICBGcmVlQlNELTEwLjEtQ1VTVE9N
LXtpMzg2LGFtZDY0fS0yMDE1MDUyNS5yYXcueHoKClRlc3RpbmcgZml4ZWQgc25hcHNob3RzIChj
b21tb25seSB0aGUgb3JpZ2luYWwgcmVsZWFzZSBhZmFpY3QpIGluc3RlYWQKb2YgbGF0ZXN0IHVw
ZGF0ZXMgaXMgcHJldHR5IG1lYW5pbmdsZXNzIGltby4gV2hpbGUgSSB3b3VsZCBsaWtlIHRvCnJl
Y29tbWVuZCB0ZXN0aW5nIGFsbCB0aGUgKGFjdGl2ZSkgZGlzdHJvcyBvZiBwYXJ0aWVzIGFjdGl2
ZWx5IGludm9sdmVkCmluIFhlbiBkZXZlbG9wbWVudCwgSSBoYXZlIHRvIGFkbWl0ZSB0aGF0IEkg
aGF2ZSBubyBpZGVhIGF0IGFsbCBob3cKdGhpcyB3b3VsZCB3b3JrIGZvciBlLmcuIG91ciBTTEUg
dmVyc2lvbnMgKHN1Y2ggdGhhdCBsYXRlc3QgYml0cyB3b3VsZApnZXQgdGVzdGVkKS4KCj4gICBE
ZWJpYW4gSFZNIHtpMzg2LGFtZDY0fSB2aWEgZGViaWFuLWluc3RhbGxlciBuZXRpbnN0IFsxXQo+
IAo+IHg4NiBQViBndWVzdHM6Cj4gICBEZWJpYW4gUFYge2kzODYsYW1kNjR9IHZpYSBkZWJpYW4t
aW5zdGFsbGVyIG5ldGluc3QgWzFdCj4gCj4gQVJNIGd1ZXN0czoKPiAgIERlYmlhbiBQViB2aWEg
ZGViaWFuLWluc3RhbGxlciBuZXRpbnN0IFsxXQo+IAo+IFsxXSB3aGF0ZXZlciBEZWJpYW4gcmVs
ZWFzZSBvc3N0ZXN0IGl0c2VsZiBtb3N0bHkgcnVucwo+IAo+IFNvIEkgYW0gb3BlbmluZyB0aGUg
Zmxvb3IgdG8gc3VnZ2VzdGlvbnMuCj4gCj4gV2l0aCByZWdhcmRzIHRvIFdpbmRvd3MgdGVzdGlu
ZyB3ZSBoYXZlIHNvbWUgcmVzdHJpY3Rpb25zLiBXZSBoYXZlIHRyaWVkIAo+IHNldmVyYWwgdGlt
ZXMgdG8gYnV5IGFkZGl0aW9uYWwgdGVzdCBsaWNlbnNlcywgYnV0IHRoaXMgbmV2ZXIgd2VudCBh
bnl3aGVyZSAKPiAoc29tZSBvZiB0aGUgVk0gbGljZW5zZXMgYXJlIG5vdCBhdmFpbGFibGUgZm9y
IG91ciBlbnZpcm9ubWVudCwgdW5sZXNzIHlvdSAKPiBidWxrIGJ1eSwgd2hpY2ggaXMgdmVyeSBl
eHBlbnNpdmUpLiBUaGUgb25seSBhcHByb2FjaCB0aGF0IHdvdWxkIGFsbG93IHVzIHRvIAo+IHRl
c3QgYWdhaW5zdCBkaWZmZXJlbnQgd2luZG93cyB2ZXJzaW9ucyB3b3VsZCBiZSB0byByZXF1aXJl
IGV2ZXJ5b25lIHdobyBtYXkgCj4gdG91Y2ggT1NTVEVTVCB3aGljaCBpcyBub3QgZG9hYmxlLgo+
IAo+IEkgY2FuIGJyaW5nIHRoaXMgdXAgd2l0aCB0aGUgTVMgb3BlbiBzb3VyY2Ugb2ZmaWNlLCBp
ZiB0aGVyZSBhcmUgc3Ryb25nIAo+IGZlZWxpbmdzIGFib3V0IHRoaXMgYW5kIHRyeSBhZ2FpbgoK
SWYgdGhlcmUncyBhdCBsZWFzdCBhIChub3Qgb3Zlcmx5KSBzbWFsbCBjaGFuY2Ugb2Ygc3VjY2Vl
ZGluZywgSSB0aGluayB0aGlzCm1heSBiZSB3b3J0aCBpdCwgdW5sZXNzIFJpY2gncyBzdWdnZXN0
aW9uIGFscmVhZHkgaGVscHMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
