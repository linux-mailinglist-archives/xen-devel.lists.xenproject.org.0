Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E987D657
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 09:31:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht5Ui-00045D-2g; Thu, 01 Aug 2019 07:27:24 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.43])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <prvs=1092e60ca=elnikety@amazon.com>)
 id 1ht5Ug-000458-B9
 for xen-devel@lists.xensource.com; Thu, 01 Aug 2019 07:27:22 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 9A/4C-10653-954924D5;
 Thu, 01 Aug 2019 07:27:21 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-4.tower-264.messagelabs.com: domain of amazon.com designates 
 207.171.190.10 as permitted sender) smtp.mailfrom=amazon.com; dkim=pass 
 (good signature) header.i=@amazon.com header.s=amazon201209; dmarc=pass 
 (p=quarantine adkim=r aspf=r) header.from=amazon.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+JIrShJLcpLzFFi42I5v3ofl27EFKd
 YgzUT1S3uTXnP7sDosb1vF3sAYxRrZl5SfkUCa0Zn13TmgkVcFfsPPGNtYNzD0cXIycEi8J1Z
 ovt/OYgtIeAvcf/uNPYuRi4OIYGrjBKdDU9ZIZw3jBI3pn5kgXB2MUocX/mTEaRFSGAPo8T6F
 ykQibWMEhfnPGMBSbAJ6EqsWr4UyObgEBFQluj7EAUSZhZ4zCJx/iZYibCAo8SN7R8ZIUqcJL
 Z2JYCERQSiJC4fncsGEmYRUJGY+qYEJMwrYCsxdfYvZohNi1klpj8+ygqS4BQIlOj/OwPMZhQ
 Qk/h+ag0TxCpxiVtP5jNBfCYgsWTPeWYIW1Ti5eN/rBC2jsTZ608YIWwDia1L94FdLCGgINF9
 mANijI7Egt2fwM5hFrCU2HJcESKsLbFs4WtmiNMEJU7OfAL2lADQpg2vHrBPYJSdheSIWUgmz
 UKYNAvJpFlIJi1gZF3FaJFUlJmeUZKbmJmja2hgoGtoaKRraGmsa2RsrpdYpZuol1qqW55aXK
 JrqJdYXqxXXJmbnJOil5dasokRmCJSCg6+3cH4b+YbvUOMkhxMSqK8nTlOsUJ8SfkplRmJxRn
 xRaU5qcWHGGU4OJQkeHdNAsoJFqWmp1akZeYA0xVMWoKDR0mEdz5Imre4IDG3ODMdInWKUZfj
 8vV5i5iFWPLy81KlxHl/ghQJgBRllObBjYClzkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVh
 HmDQKbwZOaVwG16BXQEE9ARwqxgR5QkIqSkGpikl3PaT3/DaHm04Ep4he5KHxEry7mzHj4RVL
 DZfknz8t+UvyrnqxY9+3DJ3Sxa19PLc6XhEkvT09Hzd58+e9FW3vzfMt6S1iQ2JluR0+kOdgk
 fD3JKPNZPern+5NUUAVnpO2aaC7bNPVJwfGnA9abiVrXPxwU/T+uysWXffPPD6yp25odr8+/t
 +2/I5ekmapKuZbZ9zp3fYnFe98NEZetmfxfm89VteSwyqZdn2haH3P8+wj0aSy+ce7/kgKJnW
 ujx7pzd1i6FfZYdl7ekevGt7NTaa5KmdZft98eHerrrPIuOZO/V9kt/eW2D+eObxpz9p9tPcs
 7pyb5w7KFSkp5jufLu9l3myaYP8uxLlimxFGckGmoxFxUnAgDbTSu+GAQAAA==
X-Env-Sender: prvs=1092e60ca=elnikety@amazon.com
X-Msg-Ref: server-4.tower-264.messagelabs.com!1564644438!221782!1
X-Originating-IP: [207.171.190.10]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29327 invoked from network); 1 Aug 2019 07:27:20 -0000
Received: from smtp-fw-33001.amazon.com (HELO smtp-fw-33001.amazon.com)
 (207.171.190.10)
 by server-4.tower-264.messagelabs.com with RC4-SHA encrypted SMTP;
 1 Aug 2019 07:27:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1564644440; x=1596180440;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ApOmRjk5gXURbHl4regb59gdMnxZoj+WJFc7Iyxz9Go=;
 b=dirQqXRkzLiwfH1+y6TXiWmW+8roeRerXp3BePBZpi9bQ3q+fvEwXdug
 6ZWI61exs7mMZXr1wpX+65Ns2f1TMwDVeq7t6ULzYehjUAcmvecz8ex8q
 j2kSg4GEo+ecalRqhevpBrJ+faAWFRnHUSecjsier4VE4GWhkPYbN7kdv A=;
X-IronPort-AV: E=Sophos;i="5.64,333,1559520000"; d="scan'208";a="815620032"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 01 Aug 2019 07:27:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 06B5BA2CBA; Thu,  1 Aug 2019 07:27:11 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 1 Aug 2019 07:27:11 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 1 Aug 2019 07:27:09 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Thu, 1 Aug 2019 07:27:09 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Ben Cotton <bcotton@redhat.com>
Thread-Topic: [Xen-devel] Criteria / validation proposal: drop Xen
Thread-Index: AQHVCdu6x2IGKoB7BEKKilfR7xIklqZ17lIAgEtNlYCABPRpAIAAGYNHgBL7kACACSYXAIAD9dsA
Date: Thu, 1 Aug 2019 07:27:09 +0000
Message-ID: <B807FFB7-A9B7-4858-B6DF-E07FF29C8E69@amazon.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
 <CA+voJeUC1x53nDh8AMG=tW9AThD7Y-fiBMetTH_0+BTT0O=SHg@mail.gmail.com>
In-Reply-To: <CA+voJeUC1x53nDh8AMG=tW9AThD7Y-fiBMetTH_0+BTT0O=SHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.87]
Content-ID: <0F9358A61185FB4B9234FF9A45BE2C1E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: For testing and quality
 assurance of Fedora releases <test@lists.fedoraproject.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, Dario
 Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Committers <committers@xenproject.org>, Peter Robinson <pbrobinson@gmail.com>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDI5LiBKdWwgMjAxOSwgYXQgMjA6NTgsIEJlbiBDb3R0b24gPGJjb3R0b25AcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gCj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNzoxNiBQTSBBZGFtIFdp
bGxpYW1zb24KPiA8YWRhbXdpbGxAZmVkb3JhcHJvamVjdC5vcmc+IHdyb3RlOgo+PiAKPj4gT0ss
IHNvLCB0byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzIChhbmQgbG9vcGluZyBpbiBjbG91ZCBsaXN0
KTogZG9lcwo+PiBzb21lb25lIHdhbnQgdG8gcHJvcG9zZSBhIHNldCAoaWRlYWxseSBzbWFsbCAt
IDIgd291bGQgYmUgZ3JlYXQsIG9uZQo+PiBYZW4gYW5kIG9uZSBub24tWGVuLCBpZiB3ZSBjYW4g
Y292ZXIgbW9zdCBjb21tb24gdXNhZ2VzIHRoYXQgd2F5ISkgb2YKPj4gRUMyIGluc3RhbmNlIHR5
cGVzIHdlIHNob3VsZCB0ZXN0IG9uPyBXaXRoIHRoYXQsIHdlIGNvdWxkIHR3ZWFrIHRoZQo+PiBj
cml0ZXJpYSBhIGJpdCB0byBzcGVjaWZ5IHRob3NlIGluc3RhbmNlIHR5cGVzLCB0d2VhayB0aGUg
Q2xvdWQKPj4gdmFsaWRhdGlvbiBwYWdlIGEgYml0LCBhbmQgdGhlbiBkcm9wIHRoZSBYZW4gY3Jp
dGVyaW9uIGFuZCB0ZXN0IGNhc2UuCj4+IAo+IAo+IEknZCBzdWdnZXN0IGM1LmxhcmdlIChLVk0s
IGFmYWljdCkgYW5kIHQzLmxhcmdlIChYZW4pLgoKQnV0IHQzIGlzIG5vdCBYZW4uCgo+IAo+IE15
IEFXUyBleHBlcmllbmNlIGlzIHByb2JhYmx5IG5vdCByZXByZXNlbnRhdGl2ZSAoYmVpbmcgbW9z
dGx5IGluIHRoZQo+IEhQQyBzcGFjZSksIGJ1dCB0aGVzZSBzZWVtIGxpa2UgdGhleSdkIGhpdCB0
aGUgdHdvIHVzZSBjYXNlcyBJJ2QKPiBleHBlY3QgdG8gc2VlIGZvciBGZWRvcmEgKGNvbXB1dGUg
YW5kIHNtYWxsIHNlcnZlcnMpLiBJIHdvdWxkIGV4cGVjdAo+IG1vcmUgcGVvcGxlIHdvdWxkIHVz
ZSBNIHJhdGhlciB0aGFuIEMgZm9yIEZlZG9yYSwgYnV0IHRoaXMgZ2V0cyB1cyBhCj4gS1ZNLWJh
c2VkIGluc3RhbmNlLgo+IAo+IEhhcHB5IHRvIGhlYXIgd2h5IEknbSB3cm9uZy4gOi0pCj4gCj4g
LS0KPiBCZW4gQ290dG9uCj4gSGUgLyBIaW0gLyBIaXMKPiBGZWRvcmEgUHJvZ3JhbSBNYW5hZ2Vy
Cj4gUmVkIEhhdAo+IFRaPUFtZXJpY2EvSW5kaWFuYS9JbmRpYW5hcG9saXMKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
