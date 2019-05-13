Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B11B34C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 11:54:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ7co-0000yN-9z; Mon, 13 May 2019 09:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LC6n=TN=citrix.com=prvs=029733b21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hQ7cn-0000yG-70
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:52:01 +0000
X-Inumbo-ID: bd0770b0-7564-11e9-805f-67390c51a794
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd0770b0-7564-11e9-805f-67390c51a794;
 Mon, 13 May 2019 09:51:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85378786"
Date: Mon, 13 May 2019 10:51:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vasilis Liaskovitis <vliaskovitis@suse.com>
Message-ID: <20190513095136.GA15831@perard.uk.xensource.com>
References: <20190509154128.9196-1-vliaskovitis@suse.com>
 <20190509154128.9196-4-vliaskovitis@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509154128.9196-4-vliaskovitis@suse.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v3 3/4] libxl: add libxl_get_parameters()
 function
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
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, dgdegra@tycho.nsa.gov
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6NDE6MjdQTSArMDIwMCwgVmFzaWxpcyBMaWFza292
aXRpcyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwuYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsLmMKPiBpbmRleCBlYzcxNTc0ZTk5Li4xMjQwMzNlNWEzIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bC5jCj4gQEAgLTY2
OSw2ICs2NjksMjEgQEAgaW50IGxpYnhsX3NldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBj
aGFyICpwYXJhbXMpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50IGxpYnhsX2dldF9w
YXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpwYXJhbXMsIGNoYXIgKnZhbHVlcykKPiAr
ewo+ICsgICAgaW50IHJldDsKPiArICAgIEdDX0lOSVQoY3R4KTsKPiArCj4gKyAgICByZXQgPSB4
Y19nZXRfcGFyYW1ldGVycyhjdHgtPnhjaCwgcGFyYW1zLCB2YWx1ZXMpOwoKUGxlYXNlIG5hbWUg
dGhlIHZhcmlhYmxlIGByJyBpbnN0ZWFkIG9mICdyZXQnLiBTZWUgQ09ESU5HX1NUWUxFIGFzIGZv
cgp3aHkuCgo+ICsgICAgaWYgKHJldCA8IDApIHsKPiArICAgICAgICBMT0dFVihFUlJPUiwgcmV0
LCAiZ2V0dGluZyBwYXJhbWV0ZXJzIik7CgpMT0dFViB0YWtlcyBgZXJybm8nIGFzIHNlY29uZCBw
YXJhbWV0ZXIsIHRoZSB2YWx1ZSBvZiBgcmV0JyBzZWVtcyB0byBiZQotMSBvciAwLCBhbmQgeGNf
Z2V0X3BhcmFtZXRlcnMgc2hvdWxkIHNldCBgZXJybm8nLiAgU28sIHVzaW5nIHRoZSBtYWNybwpM
T0dFKCkgc2hvdWxkIGJlIGVub3VnaC4KCj4gKyAgICAgICAgR0NfRlJFRTsKPiArICAgICAgICBy
ZXR1cm4gcmV0Oy8vRVJST1JfRkFJTDsKCkFsbW9zdCEgSSB0aGluayBFUlJPUl9GQUlMIHNob3Vs
ZCBiZSByZXR1cm5lZCBoZXJlLCBub3QgYSByZXR1cm4gdmFsdWUKZnJvbSBhIGxpYnhjIGNhbGwu
Cgo+ICsgICAgfQo+ICsgICAgR0NfRlJFRTsKPiArICAgIHJldHVybiAwOwoKSW5zdGVhZCBvZiBo
YXZpbmcgdG8gd3JpdGUgR0NfRlJFRSB0d2ljZSwgeW91IGNvdWxkOgoKICAgIGlmIChyIDwgMCkg
ewogICAgICAgTE9HLi4uCiAgICAgICByYyA9IEVSUk9SX0ZBSUw7CiAgICAgICBnb3RvIG91dDsK
ICAgIH0KICAgIHJjPTA7CiAgb3V0OgogICAgR0NfRlJFRTsKICAgIHJldHVybiByYzsKCj4gK30K
PiArCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
