Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B66C2F0B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDgB-0000FL-4c; Tue, 01 Oct 2019 08:38:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFDgA-0000FC-GZ
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:38:42 +0000
X-Inumbo-ID: df17fda6-e426-11e9-96f5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id df17fda6-e426-11e9-96f5-12813bfff9fa;
 Tue, 01 Oct 2019 08:38:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1C44AF27;
 Tue,  1 Oct 2019 08:38:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
Date: Tue, 1 Oct 2019 10:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930191610.27545-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAyMToxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDbGFuZyBpbiBwYXJ0
aWN1bGFyIGhhcyBhIGhhYml0IG9mIG91dC1vZi1saW5pbmcgdGhlc2UgYW5kIGNyZWF0aW5nIG11
bHRpcGxlCj4gbG9jYWwgY29waWVzIG9mIF9tZm4oKSBhbmQgbWZuX3goKSwgZXRjLiAgT3ZlcnJp
ZGUgdGhpcyBiZWhhdmlvdXIuCgpJcyBzcGVjaWFsIGNhc2luZyB0aGUgdHlwZXNhZmUgaGVscGVy
cyB0aGVuIHRoZSByaWdodCBhcHByb2FjaD8gVGhlCmZ1bmRhbWVudGFsIGlkZWEgYWZ0ZXIgYWxs
IGlzIHRvIGxldCB0aGUgY29tcGlsZXIgZGVjaWRlLiBJIGNlcnRhaW5seQphZ3JlZSB0aGF0IG5v
dCBpbmxpbmluZyBzdWNoIHRyaXZpYWwgZnVuY3Rpb25zIGRlc3BpdGUgdGhlIGlubGluZQprZXl3
b3JkIGxvb2tzIGZhciBmcm9tIG9wdGltYWwsIGJ1dCBpZiB0aGVyZSdzIHN1Y2ggYSBnZW5lcmFs
IGlzc3VlCndpdGggY2xhbmcsIHNob3VsZG4ndCB3ZSBtYWtlICJpbmxpbmUiIGV4cGFuZCB0byAi
YWx3YXlzX2lubGluZSIKdW5pZm9ybWx5PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
