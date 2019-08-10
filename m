Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4A88BE2
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 17:26:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwTBV-0006a1-Po; Sat, 10 Aug 2019 15:21:33 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.156])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <mike@flyn.org>) id 1hwSII-0002ab-AF
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 14:24:30 +0000
Received: from [85.158.142.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 38/65-17447-C93DE4D5;
 Sat, 10 Aug 2019 14:24:28 +0000
Authentication-Results: mx.messagelabs.com; spf=none (spf record not 
 found) smtp.mailfrom=flyn.org; dkim=none (message not signed); 
 dmarc=none (no record) header.from=flyn.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRWlGSWpSXmKPExsXCIf7ARnfOZb9
 YgwczRC3uTXnP7sDosb1vF3sAYxRrZl5SfkUCa8a+TSkFC7gqbi39xtbAuJuji5GTQ0JAWmLa
 1IPs5LEVJSb2f2PtYuTiEBI4xCgx8/Q2RghnAqNE74urzCBVQgK5Er+blrGC2CwCqhKzVraCd
 bMJaEn8nb0WLC4i4Cvx8NgxFpBmZoHJjBLbruwESwgLGEhsv/MLyObg4BUwlNg4tQZipp/Eqb
 YzYCW8AoISJ2c+YQGxmYFm3vj3kgmknBno0uX/wJ7kFPCXmD2lixHEFhVQkfgzZyn7BEbRWUi
 6ZyHpnoXQvYCReRWjRVJRZnpGSW5iZo6uoYGBrqGhsa6prrGpXmKVbpJeaqlucmpeSVEiUFIv
 sbxYr7gyNzknRS8vtWQTIzBmUgpZlXcwbp71Ru8QoyQHk5Io7/a/vrFCfEn5KZUZicUZ8UWlO
 anFhxhlODiUJHhrL/rFCgkWpaanVqRl5gDjFyYtwcGjJMKbCJLmLS5IzC3OTIdInWK057h8fd
 4iZo4XVxcDyZOrlgDJpx1tS5iFWPLy81KlxHkXg7QJgLRllObBDYWlm0uMslLCvIwMDAxCPAW
 pRbmZJajyrxjFORiVhHmvg0zhycwrgdv9CugsJqCzuJ/4gpxVkoiQkmpg2rvQWmEry5s26yvZ
 cd2lm99bXb11kbcj2XQb664aEau5MzSmvT7oM5WL8azu699pRZ6v5PL26JzkO+ptLVWTuHnrv
 afyIv9WbFUWXH2raM3FQ1OvKky3fcebEpa7gGPf1dyZVlUL087cW2hUr7afddb0QNbjAo/VWf
 6u/6M05cxM1T2eDQ2Pdkz/qXGbKzhrV9NPwxC5u8HRN44ePaD/JZy9tPO+iYzfqw1fNW7d2zP
 HPiRHqiF7+l+uM7Y7nz6M7O2PkS+6vzjD8adE48ZVrDZ8pXe9tM+r85hc+CxmfuJXg0Tj/Ir0
 2/HC8257iRcc2WbdyCGlw3X6r26UhOCzzi8ztpy18o/88Kfnzp7iXiWW4oxEQy3mouJEACc/R
 u2yAwAA
X-Env-Sender: mike@flyn.org
X-Msg-Ref: server-26.tower-244.messagelabs.com!1565447066!190623!1
X-Originating-IP: [8.23.224.60]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 sa_preprocessor: VHJ1c3RlZCBJUDogOC4yMy4yMjQuNjAgPT4gMzA5ODU=\n
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14285 invoked from network); 10 Aug 2019 14:24:28 -0000
Received: from smtp-auth.no-ip.com (HELO out.smtp-auth.no-ip.com) (8.23.224.60)
 by server-26.tower-244.messagelabs.com with DHE-RSA-AES256-SHA encrypted SMTP;
 10 Aug 2019 14:24:28 -0000
X-No-IP: flyn.org@noip-smtp
X-No-IP: flyn.org@noip-smtp
X-No-IP: flyn.org@noip-smtp
X-No-IP: flyn.org@noip-smtp
X-No-IP: flyn.org@noip-smtp
X-Report-Spam-To: abuse@no-ip.com
Received: from www.flyn.org (unknown [68.134.9.136])
 (Authenticated sender: flyn.org@noip-smtp)
 by smtp-auth.no-ip.com (Postfix) with ESMTPA id 56641232;
 Sat, 10 Aug 2019 07:24:26 -0700 (PDT)
Received: from imp.flyn.org (localhost [127.0.0.1])
 by www.flyn.org (Postfix) with ESMTP id 6FD77E40091;
 Sat, 10 Aug 2019 10:24:24 -0400 (EDT)
Received: by imp.flyn.org (Postfix, from userid 1101)
 id 270F122A016F; Sat, 10 Aug 2019 10:24:24 -0400 (EDT)
Date: Sat, 10 Aug 2019 10:24:24 -0400
From: "W. Michael Petullo" <mike@flyn.org>
To: Development discussions related to Fedora <devel@lists.fedoraproject.org>
Message-ID: <20190810142424.GA28217@imp.flyn.org>
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Sat, 10 Aug 2019 15:21:32 +0000
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

PiAiVGhlIHJlbGVhc2UgbXVzdCBib290IHN1Y2Nlc3NmdWxseSBhcyBYZW4gRG9tVSB3aXRoIHJl
bGVhc2VzIHByb3ZpZGluZwo+IGEgZnVuY3Rpb25hbCwgc3VwcG9ydGVkIFhlbiBEb20wIGFuZCB3
aWRlbHkgdXNlZCBjbG91ZCBwcm92aWRlcnMKPiB1dGlsaXppbmcgWGVuLiIKCkkgYW0gYSBsb25n
IHRpbWUgWGVuL0ZlZG9yYSB1c2VyLiBJbiBmYWN0LCBJIHJlbHkgb24gRmVkb3JhIGFzIG15IERv
bTAuIEkKYWNrbm93bGVkZ2UgdGhhdCB0aGVyZSBhcmUgbm90IHRvbyBtYW55IG9mIHVzLCBhbmQg
SSBmdXJ0aGVyIGFja25vd2xlZGdlCnRoYXQgbWFuZGF0b3J5IHRlc3Rpbmcgb2Z0ZW4gZ29lcyB1
bnBlcmZvcm1lZC4gVGhlIEZlZG9yYSBYZW4gbWFpbGluZwpsaXN0IGlzIGV4Y2VlZGluZ2x5IGxv
dy12b2x1bWUuCgpNaWNoYWVsIFlvdW5nIGhhcyBpbiB0aGUgcGFzdCBkb25lIGEgbG90IG9mIHRo
ZSBoZWF2eSBsaWZ0aW5nIHN1cnJvdW5kaW5nClhlbiBzdXBwb3J0LCBhbmQgSSBhbSB2ZXJ5IGdy
YXRlZnVsIGZvciBoaXMgd29yay4KClhlbiBEb20wIGlzIHBhcnRpY3VsYXJseSB0ZW51b3VzLiBE
cm9wcGluZyAoZm9yIGEgZ29vZCByZWFzb24pIEdSVUIncwptdWx0aWJvb3QyIG1vZHVsZSBsZWZ0
IFhlbiB1bmFibGUgdG8gYm9vdCB1bmRlciBFRkkgW2UuZy4sIDFdLgoKQWxsIG9mIHRoYXQgc2Fp
ZCwgdGhlcmUgYXJlIGdvb2QgcmVhc29ucyB0byBjaG9vc2UgWGVuIG92ZXIgS1ZNLiBYZW4ncwph
cmNoaXRlY3R1cmUgYW5kIGZ1bGwgc3VwcG9ydCBmb3IgbGlidm1pIGNvbWUgdG8gbWluZC4gKE9m
IGNvdXJzZSwKdGhlcmUgYXJlIGdvb2QgcmVhc29ucyB0byBjaG9vc2UgS1ZNIHRvby4pCgpQZXJo
YXBzIHdlIGNvdWxkIGdvIG9uZSBtb3JlIHJlbGVhc2Ugd2l0aCB0aGUgc3RhdHVzIHF1byB0byBn
aXZlIHRoZQpYZW4vRmVkb3JhIGNvbW11bml0eSBhIGxhc3QgY2hhbmNlIHRvIHJhbGx5IGFuZCBk
ZW1vbnN0cmF0ZSBhIHdpbGxpbmduZXNzCnRvIHBlcmZvcm0gdGhlIG5lY2Vzc2FyeSB0ZXN0aW5n
IGFuZCBtYWludGVuYW5jZS4gSSBzdXNwZWN0IHdlIGFyZQphbGwgcXVpdGUgYnVzeSwgc28gd2Ug
bWlnaHQgZmluZCBvdXJzZWx2ZXMgYWRtaXR0aW5nIHRoYXQgYnJvYWRlciBYZW4Kc3VwcG9ydCB3
aWxsIGJlIHJlbGVnYXRlZCB0byB0aGUgc3RhbmRhcmQgbWVhbnMgb2YgbWFpbnRlbmFuY2UgcmF0
aGVyCnRoYW4gcmlzaW5nIHRvIHRoZSBzdGF0dXMgb2YgYmxvY2tlcnMuCgpbMV0gaHR0cHM6Ly9i
dWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzAzODcyCgotLSAKTWlrZQoKOndx
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
