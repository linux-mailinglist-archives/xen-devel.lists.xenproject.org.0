Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23789030E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:31:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hycHP-0001jE-Rl; Fri, 16 Aug 2019 13:28:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hycHO-0001j9-IN
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:28:30 +0000
X-Inumbo-ID: bae3f08c-c029-11e9-8bb7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bae3f08c-c029-11e9-8bb7-12813bfff9fa;
 Fri, 16 Aug 2019 13:28:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06886344;
 Fri, 16 Aug 2019 06:28:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEF483F694;
 Fri, 16 Aug 2019 06:28:25 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
 <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
Date: Fri, 16 Aug 2019 14:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8wOC8yMDE5IDEzOjE3LCBMYXJzIEt1cnRoIHdyb3RlOgo+IO+7v09uIDE2LzA4LzIw
MTksIDExOjAxLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
ICAgICAgIEZyb20gbXkgdW5kZXJzdGFuZGluZywgYW55IHVzZSBvbiBtaW5pLW9zLmdpdCAmIGNv
IHdpbGwgYmUgbGVnaXRpbWF0ZS4gSG93ZXZlciwKPiAgICAgIHdlIHN0aWxsIHByaW50IHRoZSBX
QVJOSU5HIGluIHRob3NlIGNhc2VzLgo+ICAgICAgCj4gICAgICBVc3VhbGx5IFdBUk5JTkcgbWVh
bnMgc29tZXRoaW5nIG5lZWRzIGF0dGVudGlvbi4gQXMgbW9zdCBvZiB0aGUgdXNlcnMgd2lsbAo+
ICAgICAgbGlrZWx5IGNvcHkvcGFzdGUgZnJvbSB0aGUgd2lraSwgd2UgYXJlIGdvaW5nIHRvIGhh
dmUgcmVwb3J0IGFza2luZyB3aHkgdGhlCj4gICAgICBXQVJOSU5HIGlzIHRoZXJlLgo+ICAgICAg
Cj4gICAgICBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdHJ5IHRvIGRvd25ncmFkZSB0
aGUgbWVzc2FnZSBhIGJpdCB3aGVuIHBvc3NpYmxlLgo+ICAgICAgRm9yIGluc3RhbmNlLCB3ZSBj
b3VsZCBjaGVjayBpZiB0aGUgc2VjdGlvbiAiVEhFIFJFU1QiIGlzIHByZXNlbnQgaW4gdGhlIGZp
bGUKPiAgICAgIE1BSU5UQUlORVJTLiBJZiBub3QsIHRoaXMgaXMgbGlrZWx5IG5vdCBhIGZpbGUg
d2UgYXJlIGFibGUgdG8gc3VwcG9ydC4KPiAgICAgIAo+IEkgdGhvdWdodCBhYm91dCB0aGlzIGFu
ZCBpdCBpcyBub3QgYXMgZWFzeSBhcyBpdCBzZWVtcywgYmVjYXVzZSB0aGUgc2NyaXB0IG9ubHkg
cGFyc2VzCj4gTTogLi4uICZjIGxpbmVzCgpUaGUgc2NyaXB0IGlzIGFibGUgdG8gcGFyc2UgdGhl
IHNlY3Rpb24gbmFtZS4gU2VlIGdldF9tYWludGFpbmVyX3JvbGUoKS4KCkFsdGhvdWdoLCBJIGFt
IG5vdCBzdXJlIGhvdyBlYXJseSB0aGUgZnVuY3Rpb24gY2FuIGdldCBjYWxsZWQuCgpCdXQuLi4K
Cj4gCj4gTWF5YmUgdGhlIGJlc3Qgd2F5IHRvIGFkZHJlc3MgdGhpcyB3b3VsZCBiZSB0byBpbmNs
dWRlIHNvbWUgaWRlbnRpZmllciBpbnRvIHRoZQo+IE1BSU5UQUlORVJTIGZpbGUgKGFmdGVyIHRo
ZSBoZWFkZXIgd2l0aCBhbGwgdGhlIGRlZmluaXRpb25zKS4KPiAKPiBGT1JNQVQ6IHhlbi1wcm9q
ZWN0LW1haW50YWluZXJzIDx2ZXJzaW9uPgo+IChub3RlIHRoYXQgdGhpcyBpcyBub3QgY3VycmVu
dGx5IHBpY2tlZCB1cCBieSB0aGUgdG9vbCkKPiAKPiBPcgo+IAo+IFY6IHhlbi1wcm9qZWN0LW1h
aW50YWluZXJzIDx2ZXJzaW9uPgo+IChub3RlIHRoYXQgdGhpcyB3b3VsZCBiZSBwaWNrZWQgdXAg
YnkgdGhlIHRvb2wpCgpBbnkgb2YgdGhlc2Ugc29sdXRpb25zIGFyZSBhbHNvIGEgcG90ZW50aWFs
IGFsdGVybmF0aXZlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
