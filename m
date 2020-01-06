Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFA13157C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:55:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUgC-0003dv-FB; Mon, 06 Jan 2020 15:52:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioUgA-0003dq-Pp
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:52:30 +0000
X-Inumbo-ID: 866b558c-309c-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 866b558c-309c-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 15:52:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 129C5AD0F;
 Mon,  6 Jan 2020 15:52:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106132859.25882-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4362297f-0c88-6aaf-9b8b-23520e650b4c@suse.com>
Date: Mon, 6 Jan 2020 16:53:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106132859.25882-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Coverity: Improve model for {,
 un}map_domain_page()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZmlyc3QgYXR0
ZW1wdCByZXN1bHRlZCBpbiBzZXZlcmFsICJGcmVlIG9mIGFkZHJlc3Mtb2YKPiBleHByZXNzaW9u
IChCQURfRlJFRSkiIGlzc3VlcywgYmVjYXVzZSBvZiBjb2RlIHdoaWNoIHJlbGllcyBvbiB0aGUg
ZmFjdCB0aGF0Cj4gYW55IHBvaW50ZXIgaW4gdGhlIHNhbWUgcGFnZSBpcyBvayB0byBwYXNzIHRv
IHVubWFwX2RvbWFpbl9wYWdlKCkKPiAKPiBNb2RlbCB0aGlzIHByb3BlcnR5IHRvIHJlbW92ZSB0
aGUgaXNzdWVzLgo+IAo+IENvdmVyaXR5IElEczogMTEzNTM1NiAxMTM1MzZ7MCwxfSAxNDAxMzAw
IDE0MTgwOXswLDF9IDE0Mzg4NjQKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
