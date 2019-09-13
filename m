Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CBB1A25
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 10:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hEz-0005Oh-2N; Fri, 13 Sep 2019 08:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8hEx-0005Oc-9F
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 08:47:39 +0000
X-Inumbo-ID: 22d8c502-d603-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d8c502-d603-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 08:47:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A36BB662;
 Fri, 13 Sep 2019 08:47:36 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f3ef22a-0a56-ac77-3deb-513031c8baaa@suse.com>
Date: Fri, 13 Sep 2019 10:47:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 00/16] improve late microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gVGhpcyBzZXJpZXMgaW5jbHVk
ZXMgYmVsb3cgY2hhbmdlczoKPiAgMS4gUGF0Y2ggMS0xMTogaW50cm9kdWNlIGEgZ2xvYmFsIG1p
Y3JvY29kZSBjYWNoZSBhbmQgc29tZSBjbGVhbnVwCj4gIDIuIFBhdGNoIDEyOiBzeW5jaHJvbml6
ZSBsYXRlIG1pY3JvY29kZSBsb2FkaW5nCj4gIDMuIFBhdGNoIDEzOiBzdXBwb3J0IHBhcmFsbGVs
IG1pY3JvY29kZXMgdXBkYXRlIG9uIGRpZmZlcmVudCBjb3Jlcwo+ICA0LiBQYXRjaCAxNDogYmxv
Y2sgI05NSSBoYW5kbGluZyBkdXJpbmcgbWljcm9jb2RlIGxvYWRpbmcKPiAgNS4gUGF0Y2ggMTU6
IGRpc2FibGUgbGF0ZSB1Y29kZSBsb2FkaW5nIGR1ZSB0byBCREY5MAo+ICA2LiBQYXRjaCAxNjog
Y2FsbCB3YmludmQoKSBjb25kaXRpb25hbGx5CgpJIGRvbid0IGtub3cgd2h5IGl0IGRpZG4ndCBv
Y2N1ciB0byBtZSBlYXJsaWVyLCBidXQgd2hhdCBhYm91dApwYXJrZWQgLyBvZmZsaW5lZCBDUFVz
PyBUaGV5J2xsIGhhdmUgdGhlaXIgdWNvZGUgdXBkYXRlZCB3aGVuIHRoZXkKZ2V0IGJyb3VnaHQg
YmFjayBvbmxpbmUsIGJ1dCB1bnRpbCB0aGVuIHRoZWlyIHVjb2RlIHdpbGwgZGlzYWdyZWUKd2l0
aCB0aGF0IG9mIHRoZSBvbmxpbmUgQ1BVcy4gRm9yIHRydWx5IG9mZmxpbmUgQ1BVcyB0aGlzIG1h
eSBiZQpmaW5lLCBidXQgcGFya2VkIG9uZXMgc2hvdWxkIHByb2JhYmx5IGJlIHVwZGF0ZWQsIHBl
cmhhcHMgdmlhIHRoZQpzYW1lIGFwcHJvYWNoIGFzIHVzZWQgd2hlbiBDLXN0YXRlIGRhdGEgYmVj
b21lcyBhdmFpbGFibGUgKHNlZQpzZXRfY3hfcG1pbmZvKCkpPwoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
