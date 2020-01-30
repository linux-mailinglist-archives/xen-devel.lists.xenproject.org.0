Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799014DB3D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:06:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9Tj-0001D9-6r; Thu, 30 Jan 2020 13:03:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjAx=3T=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1ix9Th-0001D4-5p
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:03:25 +0000
X-Inumbo-ID: e46b1aa6-4360-11ea-b211-bc764e2007e4
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e46b1aa6-4360-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1580389401; i=@ts.fujitsu.com;
 bh=qV2Soxzjhd61mIltzMF6ADxseVj67k3ys2aTWSv6C7o=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=nwtHVkodnIzoEX5GJL+nXyYpdRTunKgC0kfri1VRndIqHgchG2sFv5C64RwDW3GwY
 /y2mdZnJklOqkVGM0ulzOKYAA3AtnZpjnLy6JBHcmdML0DswqDov/Bkz1MiQ3rGkL9
 PAqTMZbj/7G1IqNZYVlASEq9cFt9Bu9sPY8yACodGITvkE1Zi5FytVRPx03CDiIXCd
 HPCpkjC/VNOXVGTchaqVGI4SlcsXAzu9c+r5SZ7qlel4Tt+OnJAa6BkfniURLArHb3
 s4T/rIiMB+hDJB0KG0QHwIvNv8JF1Koc57mi919VxaY+ZcHty8c7QAzoWAPPLja4dK
 5hiIgGhNCedVw==
Received: from [100.112.193.12] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-west-1.aws.symcld.net id C0/17-20876-914D23E5;
 Thu, 30 Jan 2020 13:03:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRWlGSWpSXmKPExsViZ8MxVVfyilG
 cwbMTjBbft0xmcmD0OPzhCksAYxRrZl5SfkUCa8af+V3sBf1sFT27L7A1MLazdjFycQgJzGGU
 OPH+PzuEs4JR4veUlYxdjJwcbAIGErteHWIGsUUEXCV6/j8Dsjk4hAWcJVZ/KQAJswioSnzun
 sUKYvMKGEocftjCDGELSpyc+YQFxGYWkJfouNzICmHrSCzY/YltAiPXLCRls5CUzUJStoCReR
 WjeVJRZnpGSW5iZo6uoYGBrqGhka6hpbGusaleYpVuol5qqW55anGJrqFeYnmxXnFlbnJOil5
 easkmRmCwpBQcVN7BOHPte71DjJIcTEqivLtWGsUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9
 dwEoJ1iUmp5akZaZAwxcmLQEB4+SCG/uJaA0b3FBYm5xZjpE6hSjopQ4bx5IQgAkkVGaB9cGi
 5ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5/UCm8GTmlcBNfwW0mAlo8bdEA5DFJYkIKa
 kGpnDurHWe3YdKd0tr1LT91lu/fde38/c/e0w7Kd9nxGjt1OGy63l3YbxVXKuHj6bn3FtyO0S
 2O1btPf3Vq2ZCkVivqC5vBdd8zW/Vok+m19t+vOWpUK8RqzDp476f7+uz2a/MkRVbXhD5f8G0
 A1x3Z5a8PvClvO+w+sZNjRdjZmi72Pkk1UwrZm84Xu8/wdlJ7cF3to/3d5uce/H06rnfgp/1Y
 sXP/zwv0KX8USHkV7S33RxBq7zktu9JpRWaN6RVW054GlxuPnB24cQ3/H+vVG9c7TTxUVPMnk
 6dqtwLO485/Qh7qza5MXn336LvO9I5/P1L5UINatOsJz5d2LmlwcV6+s0Sl/cXOb5L7goOVWI
 pzkg01GIuKk4EAAwKWaARAwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-17.tower-265.messagelabs.com!1580389400!7546!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25690 invoked from network); 30 Jan 2020 13:03:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-17.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jan 2020 13:03:20 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 00UD3FsP012330;
 Thu, 30 Jan 2020 13:03:20 GMT
Received: from amur.mch.fsc.net (amur.mch.fsc.net [10.172.102.28])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 2B39D9D00F07;
 Thu, 30 Jan 2020 14:03:06 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 14:03:06 +0100
Message-ID: <2704996.bt05f1kDAn@amur.mch.fsc.net>
MIME-Version: 1.0
Subject: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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

SGksCgp3ZSB1c2UgU0xFUzEyIHdpdGgga2VybmVsLWRlZmF1bHQtNC4xMi4xNC05NS40NS4xLng4
Nl82NCBhbmQgCnhlbi00LjExLjNfMDItMi4yMC4xLng4Nl82NAoKVGhlIGR1bXAga2VybmVsIGRv
ZXNuJ3Qgc3RhcnQgYWZ0ZXIgImVjaG8gYyA+IC9wcm9jL3N5c3JxX3RyaWdnZXIiLgpMYXN0IG1l
c3NhZ2VzIG9uIGNvbnNvbGUgYXJlOgpbICAzODUuNzE3NTMyXSBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogRmF0YWwgZXhjZXB0aW9uClsgIDM4NS43MzQ1NjVdIEtlcm5lbCBPZmZzZXQ6IGRp
c2FibGVkCihYRU4pIEhhcmR3YXJlIERvbTAgY3Jhc2hlZDogRXhlY3V0aW5nIGtleGVjIGltYWdl
IG9uIGNwdTU4CihYRU4pIFNob3QgZG93biBhbGwgQ1BVcwoKQWZ0ZXIgYSBzaG9ydCB0aW1lIGEg
cmVib290IGlzIGluaXRpYXRlZC4KV2l0aG91dCB4ZW4gdGhlIGtkdW1wIHdvcmtzLgoKV2Ugc2Vl
IHRoaXMgYmVoYXZpb3VyIG9ubHkgb24gbmV3ZXIgaGFyZHdhcmUsIGZvciBleGFtcGxlIGEgc2Vy
dmVyIHdpdGgKSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyNDIgQ1BVIEAgMi44MEdIegoKSSBidWls
dCB0aGUgZnJlc2ggcmVsZWFzZWQgeGVuLTQuMTMgbXlzZWxmIGFuZCB0cmllZCBpdCBidXQgdGhp
cyBkb2Vzbid0IGhlbHAuCgpJIHRyaWVkIHgyYXBpYz1vZmYgb24gdGhlIHhlbiBzaWRlIGFuZCBu
b3gyYXBpYyBvbiB0aGUgbGludXggc2lkZSBidXQgbm8gc3VjY2Vzcy4KCkFueSBoZWxwIHdvdWxk
IGJlIHZlcnkgd2VsY29tZS4KTWFueSB0aGFua3MKCkRpZXRtYXIuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
