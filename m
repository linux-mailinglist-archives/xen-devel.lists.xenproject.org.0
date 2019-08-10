Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FAE88BB5
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 16:05:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwRwM-00013s-Vd; Sat, 10 Aug 2019 14:01:50 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.154])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <prvs=118d5313b=msw@amzn.com>) id 1hwRwL-00013n-6v
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 14:01:49 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 4D/3E-18403-B4ECE4D5;
 Sat, 10 Aug 2019 14:01:47 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-27.tower-244.messagelabs.com: domain of amzn.com designates 
 207.171.184.29 as permitted sender) smtp.mailfrom=amzn.com; dkim=none 
 (message not signed); dmarc=pass (p=none adkim=r aspf=r) 
 header.from=amzn.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileJIrShJLcpLzFFi42I5v3qHrK73Ob9
 Yg7d7hSzuTXnP7sDosb1vF3sAYxRrZl5SfkUCa8a/y9UFj4Ur7t2+xNrAOE2gi5GTQ0LAX2Jn
 43P2LkYuDiGBK4wS0xZNYIFw3jBKnDvSwgjh7GOUOPyghQXOufb8OitIv5DAKUaJht/eEHa6x
 IKHi4FmcXCwCKhKfDgvDWKyCShI/PmjAmKKCBhI3LyuBzKFWWAPo0Tn3JtsIJ3CAjYSay7/ZQ
 axeQWcJVr3noea7idxqu0MK0RcUOLkzCcsIDazgI7Egt2f2EBmMgtISyz/xwES5gR6ZvaULkY
 QW1RAWeLAtuNMILaAgIDEhlcP2CcwisxCMmkWkkmzECYtYGRexWiZVJSZnlGSm5iZo2toYKBr
 aGisawokDfUSq3ST9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiB0ZFSyJq/g/HdzDd6h
 xglOZiURHm3//WNFeJLyk+pzEgszogvKs1JLT7EKMPBoSTBO/2sX6yQYFFqempFWmYOMFJh0h
 IcPEoivNUgad7igsTc4sx0iNQpRl2Opx1tS5iFWPLy81KlxHlrzgAVCYAUZZTmwY2AJY1LjLJ
 SwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR554FM4cnMK4Hb9AroCCagI7if+IIcUZKIkJJqYLKa
 fmb7nofWAR3XZaI1jYTs9lbeY3iw511+sfczkZ/Zjrv/FX1n1SwXUvC/Ul/T4HFM8gpXyaW9r
 z3vxzHZJnfsejdNJXr3eenli/KPpNWk1c1+4HjYinGtwpk/kmWhnl+8TBybJ+odMg4I6wieXe
 S3b2e5XoaJ9MbFd+8buYquux6/9tMj8cn5b/RX/l3nYBvAs+24w5F+48BdZukVU7K+yal9umG
 wMnTuw/P/p5TvjJ2cPMX30rxHr1hS9UNaJ4lcVNitaLTAvFVz5xP29eqx66N6nk88sWyZfmf2
 81xrRePNrcdnl9ae+V2w8dXHa92n3uu8lhR5tvv4yQnRkZeclRrtvih+LV+U8mWD8QklluKMR
 EMt5qLiRABcU/WglQMAAA==
X-Env-Sender: prvs=118d5313b=msw@amzn.com
X-Msg-Ref: server-27.tower-244.messagelabs.com!1565445705!191374!1
X-Originating-IP: [207.171.184.29]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,FROM_AMAZON
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19600 invoked from network); 10 Aug 2019 14:01:47 -0000
Received: from smtp-fw-9102.amazon.com (HELO smtp-fw-9102.amazon.com)
 (207.171.184.29)
 by server-27.tower-244.messagelabs.com with RC4-SHA encrypted SMTP;
 10 Aug 2019 14:01:47 -0000
X-IronPort-AV: E=Sophos;i="5.64,369,1559520000"; d="scan'208";a="692629282"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Aug 2019 14:01:43 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id C9816A2638; Sat, 10 Aug 2019 14:01:41 +0000 (UTC)
Received: from EX13D20UWC002.ant.amazon.com (10.43.162.163) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 10 Aug 2019 14:01:40 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D20UWC002.ant.amazon.com (10.43.162.163) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 10 Aug 2019 14:01:40 +0000
Received: from udb72c6a76a7559.ant.amazon.com (10.95.170.155) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Sat, 10 Aug 2019 14:01:37 +0000
Received: by udb72c6a76a7559.ant.amazon.com (sSMTP sendmail emulation);
 Sat, 10 Aug 2019 17:01:35 +0300
Date: Sat, 10 Aug 2019 17:01:35 +0300
From: Matt Wilson <msw@amzn.com>
To: Adam Williamson <adamwill@fedoraproject.org>
Message-ID: <20190810140135.GA22251@udb72c6a76a7559.ant.amazon.com>
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: Bulk
Subject: Re: [Xen-devel] Xen / EC2 release criteria proposal
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: devel@lists.fedoraproject.org, Fedora
 Cloud SIG <cloud@lists.fedoraproject.org>, coreos@lists.fedoraproject.org,
 test@lists.fedoraproject.org, xen-devel@lists.xensource.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDU6NTY6MTFQTSAtMDcwMCwgQWRhbSBXaWxsaWFtc29u
IHdyb3RlOgpbLi4uXQo+IFNvIGl0IHNlZW1zIGxpa2UgdGhpcyB3b3VsZCBhbHNvIGJlIGEgZ29v
ZCBvcHBvcnR1bml0eSB0byByZXZpc2l0IGFuZAo+IG5haWwgZG93biBtb3JlIHNwZWNpZmljYWxs
eSBleGFjdGx5IHdoYXQgb3VyIGNsb3VkIHJlcXVpcmVtZW50cyBhcmUuCj4gYmNvdHRvbiBzdWdn
ZXN0ZWQgIHRoYXQgd2UgcmVxdWlyZSB0d28gc2FtcGxlIGluc3RhbmNlIHR5cGVzIHRvIGJlCj4g
dGVzdGVkLCBjNS5sYXJnZSAoS1ZNKSBhbmQgdDMubGFyZ2UgKFhlbikuIChJJ3ZlIGFsc28gbWFp
bGVkIFRob21hcwo+IENhbWVyb24sIGV4LW9mIFJlZCBIYXQsIG5vdyBvZiBBbWF6b24sIGZvciBo
aXMgb3BpbmlvbiwgYXMgaXQgc2VlbWVkCj4gbGlrZSBpdCBtaWdodCBiZSB3b3J0aHdoaWxlIC0g
aGUncyBwcm9taXNlZCB0byBnZXQgYmFjayB0byBtZSkuCj4gCj4gU28sIGZvciBub3csIGxldCBt
ZSBwcm9wb3NlIHRoaXMgYXMgYSB0cmlhbCBiYWxsb29uOiB3ZSByZXdyaXRlIHRoZQo+IGFib3Zl
IGNyaXRlcmlvbiB0byBzYXk6Cj4gCj4gIlJlbGVhc2UtYmxvY2tpbmcgY2xvdWQgZGlzayBpbWFn
ZXMgbXVzdCBiZSBwdWJsaXNoZWQgdG8gQW1hem9uIEVDMiBhcwo+IEFNSXMsIGFuZCB0aGVzZSBt
dXN0IGJvb3Qgc3VjY2Vzc2Z1bGx5IGFuZCBtZWV0IG90aGVyIHJlbGV2YW50IHJlbGVhc2UKPiBj
cml0ZXJpYSBvbiBjNS5sYXJnZSBhbmQgdDMubGFyZ2UgaW5zdGFuY2UgdHlwZXMuIgoKSGkgQWRh
bSwKClRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cC4gSXQncyBnb29kIHRvIHJldmlzaXQgdGhp
bmdzIGZyb20gdGltZSB0bwp0aW1lIGFzIHRoZSB3b3JsZCBjaGFuZ2VzLgoKT2YgdGhlIHR3byBp
bnN0YW5jZXMgdGhhdCB5b3UgcHJvcG9zZSwgbmVpdGhlciBydW5zIG9uIFhlbi4gVGhlIFQyCmlu
c3RhbmNlcyBydW4gb24gWGVuLCBidXQgVDMgdXNlcyB0aGUgS1ZNLWJhc2VkIE5pdHJvIGh5cGVy
dmlzb3IuCgpUbyBlbnN1cmUgdGhhdCBhIExpbnV4IGJhc2VkIEFNSSBmdW5jdGlvbnMgYWNyb3Nz
IGFsbCBvZiB0aGUgZGV2aWNlcwphbmQgb3BlcmF0aW5nIG1vZGVzIG9mIEVDMiwgeW91IG5lZWQg
dG8gY292ZXI6Cgp4ODYgcGxhdGZvcm1zCi0tLS0tLS0tLS0tLS0KKiBYZW4gZG9tVSB3aXRoIG9u
bHkgUFYgaW50ZXJmYWNlcyAoZS5nLiwgTTMgaW5zdGFuY2VzKQoqIFhlbiBkb21VIHdpdGggSW50
ZWwgODI1OTkgdmlydHVhbCBmdW5jdGlvbnMgZm9yIEVuaGFuY2VkIE5ldHdvcmtpbmcKICAoZS5n
LiwgQzMgaW5zdGFuY2VzIHJ1bm5pbmcgaW4gYSBWUEMpCiogWGVuIGRvbVUgd2l0aCBFbmhhbmNl
ZCBOZXR3b3JraW5nIEFkYXB0ZXIgKGUuZy4sIFI0IGluc3RhbmNlcykKKiBYZW4gZG9tVSB3aXRo
IE5WTWUgbG9jYWwgaW5zdGFuY2Ugc3RvcmFnZSAoZS5nLiwgdmlydHVhbGl6ZWQgSTMKICBpbnN0
YW5jZXMpCiogWGVuIGRvbVUgd2l0aCBtb3JlIHRoYW4gMzIgdkNQVXMgKGUuZy4sIGM0Ljh4bGFy
Z2UpCiogWGVuIGRvbVUgd2l0aCBmb3VyIE5VTUEgbm9kZXMgKGUuZy4sIHgxLjMyeGxhcmdlKQoq
IFhlbiBkb21VIHdpdGggbWF4aW11bSBSQU0gYXZhaWxhYmxlIGluIEVDMiAoeDFlLjMyeGxhcmdl
KQoqIEtWTSBndWVzdCB3aXRoIGNvbnNpc3RlbnQgcGVyZm9ybWFuY2UgKGUuZy4sIGM1Lmxhcmdl
KQoqIEtWTSBndWVzdCB3aXRoIGJ1cnN0YWJsZSBwZXJmb3JtYW5jZSAoZS5nLiwgdDMubGFyZ2Up
CiogS1ZNIGd1ZXN0IHdpdGggbG9jYWwgTlZNZSBzdG9yYWdlIChlLmcuLCBjNWQubGFyZ2UpCiog
S1ZNIGd1ZXN0IHdpdGggMTAwIEdicHMgbmV0d29ya2luZyBhbmQgRWxhc3RpYyBGYWJyaWMgQWRh
cHRlcgogIChjNW4uMTh4bGFyZ2UpCiogS1ZNIGd1ZXN0IG9uIEFNRCBwcm9jZXNzb3JzIChlLmcu
LCBtNWEubGFyZ2UpCiogS1ZNIGd1ZXN0IG9uIEFNRCBwcm9jZXNzb3JzIHdpdGggbWF4aW11bSBO
VU1BIG5vZGVzIChlLmcuLAogIG01YS4yNHhsYXJnZSkKKiBCYXJlIG1ldGFsIEJyb2Fkd2VsbCAo
aTMubWV0YWwpCiogQmFyZSBtZXRhbCBTa3lsYWtlIChtNS5tZXRhbCkKKiBCYXJlIG1ldGFsIENh
c2NhZGUgTGFrZSAoYzUubWV0YWwpCgpBcm0gcGxhdGZvcm1zCi0tLS0tLS0tLS0tLS0KKiBLVk0g
Z3Vlc3Qgb24gQXJtIHdpdGggMSBDUFUgY2x1c3RlciAoYTEueGxhcmdlKQoqIEtWTSBndWVzdCBv
biBBcm0gd2l0aCAyIENQVSBjbHVzdGVycyAoYTEuMnhsYXJnZSkKKiBLVk0gZ3Vlc3Qgb24gQXJt
IHdpdGggNCBDUFUgY2x1c3RlcnMgKGExLjR4bGFyZ2UpCgpOb3QgYWxsIG9mIHRoZXNlIGFyZSBn
b2luZyB0byBjYXVzZSBhbiBpbWFnZSB0byBmYWlsIHRvIGJvb3QgdXAgdG8gdGhlCnBvaW50IHdo
ZXJlIGEgY3VzdG9tZXIgY2FuIFNTSCBpbi4gQnV0IGEgZ29vZCBudW1iZXIgb2YgdGhlc2UgaGF2
ZQpjYXVzZWQgZWFybHkgYm9vdCBwcm9ibGVtcyBpbiB0aGUgcGFzdCAoZS5nLiwgPjMyIHZDUFVz
IG9uIFBWSFZNIFhlbikuCgotLW1zdwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
