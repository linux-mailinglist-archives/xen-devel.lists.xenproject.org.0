Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5019F8EC4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:41:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUV6-0000gt-8L; Tue, 12 Nov 2019 11:38:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BaEJ=ZE=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1iUUV4-0000go-AP
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:38:22 +0000
X-Inumbo-ID: ebb7c51a-0540-11ea-b678-bc764e2007e4
Received: from mail3.bemta25.messagelabs.com (unknown [195.245.230.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb7c51a-0540-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1573558697; i=@ts.fujitsu.com;
 bh=V/ZQCMtY6j8j+Pk9gzh9iCClK9zZHxWKyo6/nnf1f9I=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=kwt4U0BYZSkbhz87QrojPnSwd1g1y0JwMzxqvcOdpIQB6zqyqF50kRnDSZw47ip8l
 kzokFPjFNXq6m7rUL58gFy9flwmciIX9vqrWVEXKKvFPmlfjMjoFAKL78jyAxwzzPW
 7WQA4Bh09tUQQ1jfLaDgAmQkP6RPvyWSPnPY99oaqPQ3ZJWI/a2CcWQb/vQh++0Uoj
 sxJfQOyXrxZvs+io/8L6r2UEgs3YFt8mAfWkMhGWRioH5KZVjsGVGtA9PUlExFtUEO
 OXMvOPm4NSuZE5iktqJ4wL+BhOQU3bo5T1pL/T7mewfnmgpiWtVg1fGLcpmwBacvUs
 BzBr5g53HfvXg==
Received: from [46.226.52.197] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-west-1.aws.symcld.net id AA/7B-04581-9A99ACD5;
 Tue, 12 Nov 2019 11:38:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0V0581S
 swYMGbovvWyYzOTB6HP5whSWAMYo1My8pvyKBNWPj1U9MBZtYKn4snMzUwHiduYuRk0NIYA6j
 xJOndRD2fEaJR1d8QWw2AQOJXa8OgdWICLhK9Px/BmYLC4RIbOv5DmazCKhK3Jm6jBHE5hUwl
 Hj2/RgThC0ocXLmExYQm1lAXqLjciMrhK0jsWD3J7YJjFyzkJTNQlI2C0nZAkbmVYwWSUWZ6R
 kluYmZObqGBga6hoZGuoaWlrpGRpZ6iVW6SXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIH
 BklJw/OkOxk9f3+odYpTkYFIS5VXsPhUrxJeUn1KZkVicEV9UmpNafIhRhoNDSYLXfgZQTrAo
 NT21Ii0zBxi4MGkJDh4lEd4ikDRvcUFibnFmOkTqFKMux+Xr8xYxC7Hk5eelSonzPp0OVCQAU
 pRRmgc3AhZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86aCTOHJzCuB2/QK6AgmoCMOnD
 0GckRJIkJKqoFpz0vfq8uvvCy89iq8zFTFRXurkknVb/mDH0z9XO7d+ctS+KpzSdfCLwWPeL/
 d+G126EmUxcvIqHXh/l+0ox5GnG3MtWUo8Khjun7q8duTB34/cDZRsnHaM9GrrWGKxo5Tnx//
 MGJVF17+d5GyyUvT16cvNlaGblj9eq753U3LirtClzz70nBm1utZ8TekSs9PyXDWPbtIrX56p
 tWBeJ6kk2/Zfn7WOGg24VjcNYH1/lJbA19Xzi4xVMmb/tF8zgqR+9NfM5bxFez/85/J9qPaOf
 s2q4lT9yYwV54+8spcuUaqd8uxqoh0tkuHLPq5k7YxJPS97bFX001p/NSyUX+ybv2XhT8k5TY
 Zv5q1+mFyrBJLcUaioRZzUXEiAPw7AR4dAwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-2.tower-285.messagelabs.com!1573558696!12947!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26739 invoked from network); 12 Nov 2019 11:38:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-2.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Nov 2019 11:38:17 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id xACBcDTw005046;
 Tue, 12 Nov 2019 11:38:16 GMT
Received: from amur.mch.fsc.net (unknown [10.172.102.131])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 0C27EA15098;
 Tue, 12 Nov 2019 12:38:05 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Tue, 12 Nov 2019 12:38:04 +0100
Message-ID: <3020959.C8KU84B5rM@amur.mch.fsc.net>
MIME-Version: 1.0
Subject: [Xen-devel] [xen-4.13.0-rc] kexec/kdump failure with cpu Intel(R)
 Xeon(R) Gold 6242 CPU
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

SGksCgpvbiBhIG5ldyBtYWNoaW5lIHdpdGggY3B1IEludGVsKFIpIFhlb24oUikgR29sZCA2MjQy
IENQVSB0aGUga2V4ZWMva2R1bXAKZG9lc24ndCB3b3JrIHdpdGggY3VycmVudCB4ZW4tNC4xMy4w
LXJjLgpUaGUgbGFzdCBvdXRwdXQgb2YgdGhlIHhlbiBjb25zb2xlIGlzOgoKKFhFTikgSGFyZHdh
cmUgRG9tMCBjcmFzaGVkOiBFeGVjdXRpbmcga2V4ZWMgaW1hZ2Ugb24gY3B1NQooWEVOKSBTaG90
IGRvd24gYWxsIENQVXMKCkFmdGVyIHNob3J0IGRlbGF5IHRoZSBzeXN0ZW0gcmVib290cy4KCkl0
IHNlZW1zIHRoZSBmaXhlcyBtZW50aW9uZWQgaW4gdGhlIHRocmVhZApodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE5NDguaHRt
bAphcmVuJ3QgZW5vdWdoLgoKSSBidWlsdCB4ZW4tNC4xMSB3aXRoIHRoZSBwYXRjaGVzIGJ1dCBu
byBzdWNjZXNzLgpPbiBhbiBvbGRlciBzeXN0ZW0gd2l0aCB4ZW4tNC40IHRoZSBrZHVtcCB3b3Jr
cy4KCkFueSBoZWxwIGlzIGFwcHJlY2lhdGVkLgpUaGFua3MuCgpEaWV0bWFyLgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
