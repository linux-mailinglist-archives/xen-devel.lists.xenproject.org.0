Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD62C20A7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 14:33:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEupN-00008y-Cz; Mon, 30 Sep 2019 12:30:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEupL-00008t-TO
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 12:30:55 +0000
X-Inumbo-ID: 24ff49f5-e37e-11e9-96cf-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 24ff49f5-e37e-11e9-96cf-12813bfff9fa;
 Mon, 30 Sep 2019 12:30:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BCB3AFE8;
 Mon, 30 Sep 2019 12:30:53 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
 <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
 <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
 <fc49b59e-bbbb-7c64-3b31-2244c76ee2ae@suse.com>
 <800eb65a-a26f-289b-86b3-bace17ce5083@suse.com>
 <b74d4b2e-3851-bdce-affa-9b438302fb29@suse.com>
 <f6ff9de4-9572-08cb-c1c5-24e9903f110e@suse.com>
 <23a364e6-7df1-e687-ba3c-9bf7c7f9a5c1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1966d7a-7335-5ae0-830a-1bdc51477906@suse.com>
Date: Mon, 30 Sep 2019 14:30:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23a364e6-7df1-e687-ba3c-9bf7c7f9a5c1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot
 parameter documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMzo0NSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBGdW5kYW1lbnRhbGx5
LCBlaXRoZXIgdGhlIHRvcG9sb2d5IGxldmVscyBhcmUgc2ltaWxhciBlbm91Z2ggdGhhdCBhCj4g
c2luZ2xlIHNldHRpbmcgaXMgc2Vuc2libGUgdG8gdXNlIGFjcm9zcyBib3RoLCBvciB0aGV5IGFy
ZSBub3QuICBJZiB0aGV5Cj4gYXJlIHNpbWlsYXIgZW5vdWdoLCB0aGVuIEkgdGhpbmsgdXNpbmcg
ImNvcmUgLyB0aHJlYWQiIGFuZCBtYXBwaW5nIHRoZW0KPiBpcyBwcm9iYWJseSB0aGUgYmVzdCBv
cHRpb24uCgpJbmRlZWQgLSBoZW5jZSBteSBjb21tZW50IGhlcmUgYW5kIG5vdCBvbiB0aGUgY29k
ZSBhY3R1YWxseSBwYXJzaW5nCnRoZSBvcHRpb24uIEkuZS4gd2hpbGUgSSdkIGlkZWFsbHkgcHJl
ZmVyIHRvIHNlZSBldmVuIHRoZSB0b2tlbnMgb24KdGhlIGNvbW1hbmQgbGluZSB0byBtYXRjaCB3
aGF0IHRoZXkgbWVhbiBvbiB1bmRlcmx5aW5nIGhhcmR3YXJlLCBJCmNhbiBhY2NlcHQgKHRoZSBy
ZWFzb25zIGZvcikgYSBjb21tb24gc3BlbGxpbmcsIGFzIGxvbmcgYXMgdGhlCnJlc3BlY3RpdmUg
ZG9jIHBhcnRzIHN1ZmZpY2llbnRseSBjbGFyaWZ5IHRoZSBtZWFuaW5nLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
