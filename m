Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2C10B36
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 18:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLruC-00057e-C0; Wed, 01 May 2019 16:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLruA-00057Z-BW
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 16:16:22 +0000
X-Inumbo-ID: 73fe0bae-6c2c-11e9-a10a-eb74f8c02950
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73fe0bae-6c2c-11e9-a10a-eb74f8c02950;
 Wed, 01 May 2019 16:16:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,418,1549929600"; d="scan'208";a="84872479"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23753.50768.176226.654128@mariner.uk.xensource.com>
Date: Wed, 1 May 2019 17:16:16 +0100
To: osstest service owner <osstest-admin@xenproject.org>
In-Reply-To: <osstest-135435-mainreport@xen.org>
References: <osstest-135435-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.10-testing test] 135435: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMC10ZXN0aW5nIHRlc3RdIDEz
NTQzNTogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNTQzNSB4ZW4tNC4xMC10ZXN0
aW5nIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzEzNTQzNS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2gg
Y291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtICAyMSBsZWFr
LWNoZWNrL2NoZWNrICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM1MDgyCj4gIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtIDIxIGxlYWstY2hlY2sv
Y2hlY2sgZmFpbCBSRUdSLiB2cy4gMTM1MDgyCgpUaGlzIGlzIGEgQ0kgc3lzdGVtIGJ1ZzogY3Jv
biBqb2JzIGFwcGVhcmluZyBpbiB0aGUgbGVhayBjaGVjay4gIFRoaXMKc2VlbXMgdG8gYmUgbW9y
ZSBjb21tb24gbm93IHdpdGggc3RyZXRjaC4gIEZpeGluZyBpdCBpcyBvbiBteSB0b2RvCmxpc3Qu
CgpJbiB0aGUgbWVhbnRpbWUgdGhpcyBqdXN0aWZpZXMgYSBmb3JjZSBwdXNoLCBzbyBJIGhhdmUg
cHVzaGVkIHRoaXM6Cgo+IHZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6Cj4gIHhlbiAgICAg
ICAgICAgICAgICAgIDVhODFkZTRjNmI2MDM2OTc0ZjI5ZTIzMzBhNDkzZjIzYThmMGMxZjAKPiBi
YXNlbGluZSB2ZXJzaW9uOgo+ICB4ZW4gICAgICAgICAgICAgICAgICBiMmJiZDM0MjU3NjU3NmVi
OGExNjVhNmFiZjk1NTlkNzcyZWUyNDJiCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
