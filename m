Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDCA896C7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 07:27:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx2oQ-00018P-6g; Mon, 12 Aug 2019 05:24:06 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.172])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <dusty@dustymabe.com>) id 1hwrQd-0002NF-73
 for xen-devel@lists.xensource.com; Sun, 11 Aug 2019 17:14:47 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.eu-west-1.aws.symcld.net id 8A/61-10387-50D405D5;
 Sun, 11 Aug 2019 17:14:45 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-30.tower-304.messagelabs.com: domain of dustymabe.com designates 
 66.111.4.224 as permitted sender) smtp.mailfrom=dustymabe.com; dkim=pass 
 (good signature) header.i=@dustymabe.com header.s=fm1; dkim=pass (good 
 signature) header.i=@messagingengine.com header.s=fm3; dmarc=none (no 
 record) header.from=dustymabe.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRWlGSWpSXmKPExsXilM/yQJfFNyD
 W4NspM4t7U96zOzB6bO/bxR7AGMWamZeUX5HAmtHWvJi9YA9fxe8f21gbGG9wdzFycQgJrGSU
 ODhpE3MXIyeQky+x/u9XdpAEi8BNFonV/7ZBObNYJU4/2c8GUiUh4Ckx72gLI0hCQqCLReLKl
 SYWCGcCk8Tc4zuYIAYfY5RonvmGHaRFWMBAYvudX6wgCRGBh4wSbzZMYYXY6Cdxqu0MmM0moC
 Zxf98zMJtXwEHi5oH5YM0sAqoSay69B7qQg0NUIFyiYYI9RImgxMmZT1hAbE4Bf4nZU7oYQWx
 mAXWJP/MuMUPY4hK3nsxngrDlJba/ncM8gVFkFpL2WUhaZiFpmYWkZQEjyypGi6SizPSMktzE
 zBxdQwMDXUNDI10jIG1kaqSXWKWbrJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERhBKQUn/
 uxgfD7zjd4hRkkOJiVR3lPL/GOF+JLyUyozEosz4otKc1KLDzHKcHAoSfCK+QTECgkWpaanVq
 Rl5gCjGSYtwcGjJAKR5i0uSMwtzkyHSJ1i1OW4fH3eImYhlrz8vFQpcV4fkCIBkKKM0jy4EbD
 EcolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+iN9AUnsy8ErhNr4COYAI6gvuJL8gRJYkI
 KakGJg6Dh/b2t5/s2jrrel0oe8vaZ+5unP9/WR5fsd3IZzZ/xXttpc25lf0Ksy87P+Dcuu1Nr
 OLmRBm1f55FZgVXNFVn3u20Xb8tOqPsDluWYnBwVsMHrQsmP/LSuPhdbM5kC6UdrmBbf03T0L
 b6sYhLlHZYRuu2fdbGnkZcE2TkX1ucLuxsrTveEHCC7Ud2bx+TwuJbt5T1itqXmiv7SmW8c7m
 iVLhDw2ni1nnbxGXyzCyW5f104cxnnP7ulbiaUuEziX8d2d55i792ZpzyeuH1dZ7LbI83p9LO
 nfG8HyA4f9kOx8YTGXuTBR8VpOnYOagHXZvuM7ncI+vmmnM+mTf87KNLqn0EXDQMl6ZYPVRiK
 c5INNRiLipOBAAftlT8pwMAAA==
X-Env-Sender: dusty@dustymabe.com
X-Msg-Ref: server-30.tower-304.messagelabs.com!1565543683!185080!1
X-Originating-IP: [66.111.4.224]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14102 invoked from network); 11 Aug 2019 17:14:44 -0000
Received: from new2-smtp.messagingengine.com (HELO
 new2-smtp.messagingengine.com) (66.111.4.224)
 by server-30.tower-304.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Aug 2019 17:14:44 -0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30C111201;
 Sun, 11 Aug 2019 13:14:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 11 Aug 2019 13:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dustymabe.com;
 h=subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=B
 saOCVYNnekccMZJ8LBMKxLMYrTPiMFx9Xtdl9pykIo=; b=3wCgnJCqyor3H2YtV
 eeyETAyt9VKDUmP+RsBqAtW5qMCY5rhm/H4ts1ULyvK1UFtEeIYjjzXKafz1SinM
 SXWb+LR/OYs1VbCqwF+bxxf3/h1KWf6y2NoyJ8cCl7BNDv9sqvYmaga0uC6gMtFZ
 5ylBOMwzqh/qIVjtZK2HTnyYK5C9TK1mmy4+uZMZiLYmn9R/HoLKA/8BGh83z6+I
 GDJnlpSS/KPOrZpZBQNmQ+gg5aY2E724avaJupxJpnC//onNBB9DptPdv95df8NW
 t5Cxr1RvlKSR2FZGUp8KkD/T3BKP6Sm6D0Fly1Etqv7PT1bZsd1sENefnyON2WYO
 Vi7Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BsaOCVYNnekccMZJ8LBMKxLMYrTPiMFx9Xtdl9pyk
 Io=; b=kYahxPchY43TOtPa3tVv/5V1v8s0vbQGEPdejhAiLT6y+xcGIRMrBYAmg
 eHwixp4PoQa9xGbmay20gKv7Q5I/YU33oGvWRvPiBZkXkB7c1Nhg7vul2yJLdTOt
 fareQHo6VGlmZ7EU3rP/HVLNDrCj5iYkB8sseyzbOVQ/tZT9Kcz/c91YjKxety9N
 wtwnl7HdJw6M6XapWrN1k8HcSPDG6veaBe5PIBMK8OLkHPxrfJXlCyP+ZHj0xNEs
 pSGpKR1qbNuHwfW/ltUXVfnFWH0OGGb+kOB9GXFYANPGt4y4s99wsoA20aZypbRn
 VUbAGJ9X+vxl+XJseqzr6P/cf6dqA==
X-ME-Sender: <xms:Ak1QXeluWALdrhQoeRM4LbysT3zlXw10WI_bEgYoGP6rwR6vnnJ50Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeffuhhs
 thihucforggsvgcuoeguuhhsthihseguuhhsthihmhgrsggvrdgtohhmqeenucfkpheple
 elrdelvddrheehrddugeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpeguuhhsthihsegu
 uhhsthihmhgrsggvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Ak1QXbUlowbnd5ZpNA_aQL_6G0yDejHtvTcKaa08VHKKi1Lh1pQy1w>
 <xmx:Ak1QXbt9Mkt1Q6AW6bmgXR5RLqlrq0LRaSSyELeM26RVOIMgQJSAGg>
 <xmx:Ak1QXW6Ycj3aON0Htwu1HhCNP5M82ArROP-Zmt-6P9JXApt2YLXDGA>
 <xmx:Ak1QXSGf5RW1d46CywG1p2eXeDqT1CaP_5X6vClnax3BUJG7RmXTZs5hm2w>
Received: from [192.168.1.101] (99-92-55-146.lightspeed.rlghnc.sbcglobal.net
 [99.92.55.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BEF1380074;
 Sun, 11 Aug 2019 13:14:42 -0400 (EDT)
To: Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 Adam Williamson <adamwill@fedoraproject.org>, test@lists.fedoraproject.org,
 devel@lists.fedoraproject.org, xen-devel@lists.xensource.com,
 coreos@lists.fedoraproject.org
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
From: Dusty Mabe <dusty@dustymabe.com>
Message-ID: <97d8d3bb-e026-51d1-f516-a5e3dbf73034@dustymabe.com>
Date: Sun, 11 Aug 2019 13:14:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 12 Aug 2019 05:24:04 +0000
Subject: Re: [Xen-devel] Xen / EC2 release criteria proposal
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzkvMTkgODo1NiBQTSwgQWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+IEhleSBmb2xrcyEg
SSdtIHN0YXJ0aW5nIGEgbmV3IHRocmVhZCBmb3IgdGhpcyB0byB0cmltIHRoZSByZWNpcGllbnQK
PiBsaXN0IGEgYml0IGFuZCBpbmNsdWRlIGRldmVsQCBhbmQgY29yZW9zQC4KCkhleSBBZGFtIQoK
PiAKPiBUaGUgU3RvcnkgU28gRmFyOiB0aGVyZSBpcyBhIEZlZG9yYSByZWxlYXNlIGNyaXRlcmlv
biB3aGljaCByZXF1aXJlcwo+IEZlZG9yYSB0byBib290IG9uIFhlbjoKPiAKPiAiVGhlIHJlbGVh
c2UgbXVzdCBib290IHN1Y2Nlc3NmdWxseSBhcyBYZW4gRG9tVSB3aXRoIHJlbGVhc2VzIHByb3Zp
ZGluZwo+IGEgZnVuY3Rpb25hbCwgc3VwcG9ydGVkIFhlbiBEb20wIGFuZCB3aWRlbHkgdXNlZCBj
bG91ZCBwcm92aWRlcnMKPiB1dGlsaXppbmcgWGVuLiIKPiAKPiBXZSAoUUEgZ3JvdXApIGhhZCBh
IGRpc2N1c3Npb24gYWJvdXQgcmVtb3ZpbmcgdGhpcyBjcml0ZXJpb24gZW50aXJlbHkuCj4gVGhh
dCBoYXMgbm93IG1vcnBoZWQgaW50byB0aGUgaWRlYSB0aGF0IHdlIHNob3VsZCB0d2VhayBpdCB0
byBiZQo+IGZvY3VzZWQgZXhjbHVzaXZlbHkgb24gdGhlICJ3aWRlbHkgdXNlZCBjbG91ZCBwcm92
aWRlcnMgdXRpbGl6aW5nCj4gWGVuIi4uLmJ5IHdoaWNoIHdlIG1lYW4gRUMyLiBBdCB0aGUgdGlt
ZSB0aGlzIGNyaXRlcmlvbiB3YXMgaW52ZW50ZWQsCj4gYWxsIEVDMiBpbnN0YW5jZSB0eXBlcyB1
c2VkIFhlbjsgbm93LCBzb21lIHN0aWxsIHVzZSBYZW4sIGFuZCBzb21lIHVzZQo+IEtWTS4KPiAK
PiBTbyBpdCBzZWVtcyBsaWtlIHRoaXMgd291bGQgYWxzbyBiZSBhIGdvb2Qgb3Bwb3J0dW5pdHkg
dG8gcmV2aXNpdCBhbmQKPiBuYWlsIGRvd24gbW9yZSBzcGVjaWZpY2FsbHkgZXhhY3RseSB3aGF0
IG91ciBjbG91ZCByZXF1aXJlbWVudHMgYXJlLgo+IGJjb3R0b24gc3VnZ2VzdGVkICB0aGF0IHdl
IHJlcXVpcmUgdHdvIHNhbXBsZSBpbnN0YW5jZSB0eXBlcyB0byBiZQo+IHRlc3RlZCwgYzUubGFy
Z2UgKEtWTSkgYW5kIHQzLmxhcmdlIChYZW4pLiAoSSd2ZSBhbHNvIG1haWxlZCBUaG9tYXMKPiBD
YW1lcm9uLCBleC1vZiBSZWQgSGF0LCBub3cgb2YgQW1hem9uLCBmb3IgaGlzIG9waW5pb24sIGFz
IGl0IHNlZW1lZAo+IGxpa2UgaXQgbWlnaHQgYmUgd29ydGh3aGlsZSAtIGhlJ3MgcHJvbWlzZWQg
dG8gZ2V0IGJhY2sgdG8gbWUpLgo+IAo+IFNvLCBmb3Igbm93LCBsZXQgbWUgcHJvcG9zZSB0aGlz
IGFzIGEgdHJpYWwgYmFsbG9vbjogd2UgcmV3cml0ZSB0aGUKPiBhYm92ZSBjcml0ZXJpb24gdG8g
c2F5Ogo+IAo+ICJSZWxlYXNlLWJsb2NraW5nIGNsb3VkIGRpc2sgaW1hZ2VzIG11c3QgYmUgcHVi
bGlzaGVkIHRvIEFtYXpvbiBFQzIgYXMKPiBBTUlzLCBhbmQgdGhlc2UgbXVzdCBib290IHN1Y2Nl
c3NmdWxseSBhbmQgbWVldCBvdGhlciByZWxldmFudCByZWxlYXNlCj4gY3JpdGVyaWEgb24gYzUu
bGFyZ2UgYW5kIHQzLmxhcmdlIGluc3RhbmNlIHR5cGVzLiIKClNvdW5kcyBnb29kIHRvIG1lIGlm
IHdlIHRyaW0gaXQgZG93biB0byBhIGZldyBpbnN0YW5jZSB0eXBlcyB0aGF0IHdlIHRoaW5rCndp
bGwgY292ZXIgWGVuIGFuZCBLVk0gYmFzZWQgYm9vdGluZyBpbiBFQzIuIEZvciBGZWRvcmEgQ29y
ZU9TIHdlJ2xsIGJlIGRvaW5nCnNvbWUgYXV0b21hdGVkIHRlc3RpbmcgaW4gRUMyLiBJIGRvbid0
IGtub3cgaWYgd2UgaGF2ZSBhIGNlcnRhaW4gc2V0IG9mIGluc3RhbmNlCnR5cGVzIHdlJ2xsIGJl
IHVzaW5nIGZvciB0aGF0LCBidXQgdGhlIGluZm9ybWF0aW9uIHRoYXQgTWF0dCBwcm92aWRlZCBz
aG91bGQKaGVscCB1cyBkZWNpZGUuCgpEdXN0eSAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
