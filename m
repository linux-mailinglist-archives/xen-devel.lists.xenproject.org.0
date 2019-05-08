Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96917D5F
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 17:34:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOOYH-0003wh-DD; Wed, 08 May 2019 15:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOOYG-0003wc-Bb
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:32:12 +0000
X-Inumbo-ID: 7236cf5c-71a6-11e9-9931-ebd2ee5795a5
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7236cf5c-71a6-11e9-9931-ebd2ee5795a5;
 Wed, 08 May 2019 15:32:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC16120644;
 Wed,  8 May 2019 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557329530;
 bh=3AZH03BDgtWyJ7IJUpWPDWiGZvH+4SV9K2pU5OINcYg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oRJPWT5q0k/GrDlRaYSVZmqKbWFnsQB5Xre/Tx6gykIPjb9b4bA6eqZShpCNUq6KV
 voaYhSZqKD2BJMQacgcLPQn9p+w5JJeU21ZQ+4Swkt9nm1mg/TSqZLbXKG4g7tJcv9
 yClTkpIzMIrTfX72YgcXE8Vz3y1v0483LhDadDEU=
Date: Wed, 8 May 2019 08:32:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20190508113947.11920-1-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.21.1905080830450.9403@sstabellini-ThinkPad-T480s>
References: <20190508113947.11920-1-george.dunlap@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add explicit check-in policy
 section
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA4IE1heSAyMDE5LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ICsJQ2hlY2staW4gcG9s
aWN5Cj4gKwk9PT09PT09PT09PT09PT0KPiArCj4gK0luIG9yZGVyIGZvciBhIHBhdGNoIHRvIGJl
IGNoZWNrZWQgaW4sIGluIGdlbmVyYWwsIHNldmVyYWwgY29uZGl0aW9ucwo+ICttdXN0IGJlIG1l
dDoKPiArCj4gKzEuIEluIG9yZGVyIHRvIGdldCBhIGNoYW5nZSB0byBhIGdpdmVuIGZpbGUgY29t
bWl0dGVkLCBpdCBtdXN0IGhhdmUKPiArICAgdGhlIGFwcHJvdmFsIG9mIGF0IGxlYXN0IG9uZSBt
YWludGFpbmVyIG9mIHRoYXQgZmlsZS4KPiArCj4gKyAgIEEgcGF0Y2ggb2YgY291cnNlIG5lZWRz
IGFja3MgZnJvbSB0aGUgbWFpbnRhaW5lcnMgb2YgZWFjaCBmaWxlIHRoYXQKPiArICAgaXQgY2hh
bmdlczsgc28gYSBwYXRjaCB3aGljaCBjaGFuZ2VzIHhlbi9hcmNoL3g4Ni90cmFwcy5jLAo+ICsg
ICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMsIGFuZCB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRp
LmMgd291bGQKPiArICAgcmVxdWlyZSBhbiBBY2sgZnJvbSBlYWNoIG9mIHRoZSB0aHJlZSBzZXRz
IG9mIG1haW50YWluZXJzLgo+ICsKPiArICAgU2VlIGJlbG93IGZvciBydWxlcyBvbiBuZXN0ZWQg
bWFpbnRhaW5lcnNoaXAuCj4gKwo+ICsyLiBJdCBtdXN0IGhhdmUgYW4gQWNrZWQtYnkgb3IgYSBS
ZXZpZXdlZC1ieSBmcm9tIHNvbWVvbmUgb3RoZXIgdGhhbgo+ICsgICB0aGUgc3VibWl0dGVyLgo+
ICsKPiArMy4gU3VmZmljaWVudCB0aW1lIG11c3QgaGF2ZSBiZWVuIGdpdmVuIGZvciBhbnlvbmUg
dG8gcmVzcG9uZC4gIFRoaXMKPiArICAgZGVwZW5kcyBpbiBsYXJnZSBwYXJ0IHVwb24gdGhlIHVy
Z2VuY3kgYW5kIG5hdHVyZSBvZiB0aGUgcGF0Y2guCj4gKyAgIEZvciBhIHN0cmFpZ2h0Zm9yd2Fy
ZCB1bmNvbnRyb3ZlcnNpYWwgcGF0Y2gsIGEgZGF5IG9yIHR3byBpcwo+ICsgICBzdWZmaWNpZW50
OyBmb3IgYSBjb250cm92ZXJzaWFsIHBhdGNoLCBsb25nZXIgKG1heWJlIGEgd2Vlaykgd291bGQK
PiArICAgYmUgYmV0dGVyLgo+ICsKPiArNC4gVGhlcmUgbXVzdCBiZSBubyAib3BlbiIgb2JqZWN0
aW9ucy4KPiArCj4gK0luIGEgY2FzZSB3aGVyZSBvbmUgcGVyc29uIHN1Ym1pdHMgYSBwYXRjaCBh
bmQgYSBtYWludGFpbmVyIGdpdmVzIGFuCj4gK0FjaywgdGhlIEFjayBzdGFuZHMgaW4gZm9yIGJv
dGggdGhlIGFwcHJvdmFsIHJlcXVpcmVtZW50ICgjMSkgYW5kIHRoZQo+ICtBY2tlZC1ieS1ub24t
c3VibWl0dGVyIHJlcXVpcmVtZW50ICgjMikuCj4gKwo+ICtJbiBhIGNhc2Ugd2hlcmUgYSBtYWlu
dGFpbmVyIHRoZW1zZWx2ZXMgc3VibWl0cyBhIHBhdGNoLCB0aGUKPiArU2lnbmVkLW9mZi1ieSBt
ZWV0cyB0aGUgYXBwcm92YWwgcmVxdXJpbWVudCAoIzEpOyBzbyBhbiBBY2sgb3IgUmV2aWV3Cj4g
K2Zyb20gYW55b25lIGluIHRoZSBjb21tdW5pdHkgc3VmZmljZXMgZm9yIHJlcXVpcmVtZW50ICMy
LgoKTm90IHRoYXQgSSBhbSBvcHBvc2VkIHRvIGl0LCBidXQgdGhpcyBpcyBub3QgaG93IEp1bGll
biBhbmQgSSBoYXZlIGJlZW4Kd29ya2luZyBzbyBmYXI6IHdoZW4gb25lIG9mIHVzIHNlbmRzIGEg
cGF0Y2ggdGhlIG90aGVyIG5lZWRzIHRvIHJldmlldwppdCBvciBhdCBsZWFzdCBhY2sgaXQuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
