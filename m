Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103548A339
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 18:25:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxD5B-000107-WE; Mon, 12 Aug 2019 16:22:06 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.41])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <adamwill@fedoraproject.org>) id 1hxD5A-000102-OT
 for xen-devel@lists.xensource.com; Mon, 12 Aug 2019 16:22:04 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id E2/FC-10039-B22915D5;
 Mon, 12 Aug 2019 16:22:03 +0000
Authentication-Results: mx.messagelabs.com; spf=neutral 
 (server-48.tower-264.messagelabs.com: 184.71.189.90 is neither permitted 
 nor denied by domain of fedoraproject.org) 
 smtp.mailfrom=fedoraproject.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsWyw31vlK7WpMB
 Yg+szrS3uTXnP7sDosb1vF3sAYxRrZl5SfkUCa8bXFzNZCxayViy+vZe9gXEpSxcjJwevgJ/E
 tJkfmUFsRoEsifNLetlAbGEBG4k1l/+CxdkEjCSaDn4AqxcR8JV4eOwYkM3FwSwwhVHi264Vj
 CAJFgFViX1XT7N2MXJwcAoESjSscQOpERKYxiRx9fRlsKH8AjISO172gdnMApoSrdt/s4PUiw
 roS1z4mAFxj6DEyZlPWCBK5CW2v53DPIGRbxaSjllIymYhKVvAyLyK0SKpKDM9oyQ3MTNH19D
 AQNfQ0EjX0NJE19DEWC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBhTCg7172Cc
 c+ON3iFGSQ4mJVHeotjAWCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvKcmAOUEi1LTUyvSMnOAk
 QGTluDgURLh3TcRKM1bXJCYW5yZDpE6xajLcfbfvEXMQix5+XmpUuK8bSAzBECKMkrz4EbAov
 QSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeN5BVPJl5JXCbXgEdwQR0BPcTX5AjShIRUlI
 NTH4LLy2K/fLF9ObqI3LGC5fXMWz3Kfg0oSDtvFHuy/K3d7Y8Mmc648l75eVbXvYbEf+fahz9
 9u+7S1/6FtZ/U6Wuvvw8ScGLUy/cbhur9gQugeUTPs+SLXu4YpZUaI147oHG6I/C02I3LuIWO
 CAkYed6pf6237HOLyYSc3ZFXo4p2st52nL/0q7o+3e71kQFzKtotGrKXJcRLM969Iz2Mam+3y
 V/fpfO0Sk3SYu3ePs/mfffzt0iOWUunxXsv374obROpPSQyTIjlxWf/LgeO5t5GM6PWLJAT9r
 s19PrOoqtASq7XD/277tWvV2k3fZk8O9XR1v9Xu2V4HixiTcqTctv8ysu5kyJiZvllmQpdymx
 FGckGmoxFxUnAgDKWYzvTQMAAA==
X-Env-Sender: adamwill@fedoraproject.org
X-Msg-Ref: server-48.tower-264.messagelabs.com!1565626921!573391!1
X-Originating-IP: [184.71.189.90]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 received_headers: No Received headers
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22581 invoked from network); 12 Aug 2019 16:22:02 -0000
Received: from happyassassin.net (HELO mail.happyassassin.net) (184.71.189.90)
 by server-48.tower-264.messagelabs.com with
 ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Aug 2019 16:22:02 -0000
Message-ID: <3905b22832e8eea7042d2606057b8000f0a6a81e.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: Development discussions related to Fedora <devel@lists.fedoraproject.org>
Date: Mon, 12 Aug 2019 09:21:59 -0700
In-Reply-To: <CAJYncsj+DkiQFPS_mXry9BCqVKtBNQrV7xk7txihZceZ7mdP2A@mail.gmail.com>
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
 <20190810140135.GA22251@udb72c6a76a7559.ant.amazon.com>
 <649ecd21246e958320bd217fe846d0424b8c2801.camel@fedoraproject.org>
 <CAJYncsj+DkiQFPS_mXry9BCqVKtBNQrV7xk7txihZceZ7mdP2A@mail.gmail.com>
Organization: Fedora Project
User-Agent: Evolution 3.33.90 (3.33.90-1.fc31) 
MIME-Version: 1.0
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
Cc: Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 coreos@lists.fedoraproject.org, test@lists.fedoraproject.org,
 xen-devel@lists.xensource.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAyMDE5LTA4LTEwIGF0IDIwOjEyICswMjAwLCBEcmlkaSBCb3VrZWxtb3VuZSB3cm90
ZToKPiBTb3JyeSBmb3IgdGhlIHRvcCBwb3N0aW5nLCAic21hcnQiIHBob25lLi4uCj4gCj4gV2hh
dCBhYm91dCBRdWJlcyBPUz8gSXNuJ3QgdGhlaXIgZG9tMCB1c2luZyB4ZW4sIGJhc2VkIG9uIEZl
ZG9yYT8KPiAKPiBEbyB0aGV5IHVzZSBYZW4gYXMgcGFja2FnZWQgYnkgRmVkb3JhPyBJZiBub3Qs
IGNvdWxkbid0IHRoZXkgY29udHJpYnV0ZQo+IHdoYXRldmVyIHRoZXkgZG8gdGhhdCBGZWRvcmEg
ZG9lc24ndCBoZXJlPwo+IAo+IEl0IG1pZ2h0IGJlIHdvcnRoIGdldHRpbmcgaW4gdG91Y2ggd2l0
aCB0aGVtLiBUaGV5IGxvb2sgbGlrZSBhIHNpZ25pZmljYW50Cj4gWGVuIHVzZXIsIG9uIEZlZG9y
YS4KCkkgaGF2ZSBubyBpZGVhLCBidXQgdGhvc2Ugc2VlbSBsaWtlIHJlYXNvbmFibGUgcXVlc3Rp
b25zLiBJJ2xsIHNlZSBpZiBJCmNhbiB0cmFjayBkb3duIGEgY29udGFjdCBwb2ludCBmb3IgdGhl
bS4gVGhhbmtzIQotLSAKQWRhbSBXaWxsaWFtc29uCkZlZG9yYSBRQSBDb21tdW5pdHkgTW9ua2V5
CklSQzogYWRhbXcgfCBUd2l0dGVyOiBBZGFtV19GZWRvcmEgfCBYTVBQOiBhZGFtdyBBVCBoYXBw
eWFzc2Fzc2luIC4gbmV0Cmh0dHA6Ly93d3cuaGFwcHlhc3Nhc3Npbi5uZXQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
