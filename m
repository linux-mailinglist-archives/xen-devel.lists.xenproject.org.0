Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F635FB7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYXKs-0001Up-KU; Wed, 05 Jun 2019 14:56:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYXKq-0001Uk-JZ
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:56:16 +0000
X-Inumbo-ID: 1105475d-87a2-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1105475d-87a2-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 14:56:15 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0FZxJ5bZi9JJGWQqrnEwW8kPXmBhif463Iixxlt9evASc7RWZVaWKL+PHkLHZKBr4g/ewZlnds
 MlJtKgBYImlYHrnmqq131H5AvqY38UEWWbK2vJLJcpzWbhOmOnaAAzpAX2VEkCzShASDrEqjT/
 XldZXO7arJ22R+5J05ufx92bJqsqAEnepmSwkMaOZV5r9mah7d5dT4B24aJg2xgFQsl6/vm/VQ
 OGEtXEzFXfziOz4yREa5mRoH3KykpdnicH7vk/0RtFEBW2usq/fvzX0745RToXoSM/re7d2nRV
 cXQ=
X-SBRS: 2.7
X-MesageID: 1350635
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1350635"
Date: Wed, 5 Jun 2019 16:56:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190605145601.xgh6x2pz4xw3jgfu@Air-de-Roger>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-11-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558945891-3015-11-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 10/10] x86/microcode: always
 collect_cpu_info() during boot
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
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDQ6MzE6MzFQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gRnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IAo+IEN1
cnJlbnRseSBjcHVfc2lnIHN0cnVjdCBpcyBub3QgdXBkYXRlZCBkdXJpbmcgYm9vdCB3aGVuIGVp
dGhlcjoKPiAKPiAgICAgMS4gdWNvZGVfc2NhbiBpcyBzZXQgdG8gZmFsc2UgKGUuZy4gbm8gInVj
b2RlPXNjYW4iIGluIGNtZGxpbmUpCj4gICAgIDIuIGluaXRyZCBkb2VzIG5vdCBjb250YWluIGEg
bWljcm9jb2RlIGJsb2IKPiAKPiBUaGVzZSB3aWxsIHJlc3VsdCBpbiBjcHVfc2lnLnJldiBiZWlu
ZyAwIHdoaWNoIGFmZmVjdHMgQVBJQydzCj4gY2hlY2tfZGVhZGxpbmVfZXJyYXRhKCkgYW5kIHJl
dHBvbGluZV9zYWZlKCkgZnVuY3Rpb25zLgo+IAo+IEZpeCB0aGlzIGJ5IGdldHRpbmcgdWNvZGUg
cmV2aXNpb24gZWFybHkgZHVyaW5nIGJvb3QgYW5kIFNNUCBicmluZyB1cC4KPiBXaGlsZSBhdCBp
dC4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbGFzdCAiV2hpbGUgYXQgaXQiIHNlbnRlbmNlLiBD
YW4gaXQgYmUKcmVtb3ZlZD8KCklzIHRoaXMgYW4gaXNzdWUgd2l0aCBjdXJyZW50IGNvZGU/IElm
IHNvIHRoaXMgY291bGQgYmUgbWVyZ2VkIGFoZWFkIG9mCnRoZSByZXN0IG9mIHRoZSBzZXJpZXMs
IGFuZCBzaG91bGQgbGlrZWx5IGJlIHBhdGNoIDEuCgpPVE9IIGlmIHRoZSBpc3N1ZSB0aGlzIHBh
dGNoIGlzIGZpeGluZyBpcyBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzCnBsZWFzZSBtZXJnZSB0
aGUgZml4IHdpdGggdGhlIHJlc3BlY3RpdmUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIHRoZQpidWcu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
