Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85BADB35
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:32:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Kg9-0000yr-Bd; Mon, 09 Sep 2019 14:30:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Kg7-0000ma-L7
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:30:03 +0000
X-Inumbo-ID: 4f171792-d30e-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f171792-d30e-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 14:30:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B377BB6CD;
 Mon,  9 Sep 2019 14:30:01 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-26-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac7a15ef-5601-4799-8a42-ce04ceaf0adc@suse.com>
Date: Mon, 9 Sep 2019 16:30:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-26-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 25/48] xen/sched: add runstate counters
 to struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgY291bnRlcnMg
dG8gc3RydWN0IHNjaGVkX3VuaXQgc3VtbWluZyB1cCBydW5zdGF0ZXMgb2YgYXNzb2NpYXRlZAo+
IHZjcHVzLgoKV2hhdCB1c2UgYXJlIHRoZXkgKGdvaW5nIHRvIGJlKT8gU29tZSBqdXN0aWZpY2F0
aW9uIG9mIHRoZWlyCmludHJvZHVjdGlvbiBhbmQgdGhlIGFzc29jaWF0ZWQgKGhvd2V2ZXIgc21h
bGwgb3IgbGFyZ2UpCm92ZXJoZWFkIG9mIG1haW50YWluaW5nIHRoZW0gd291bGQgYmUgbmljZSBo
ZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
