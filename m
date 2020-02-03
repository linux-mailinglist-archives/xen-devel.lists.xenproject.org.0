Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE51505A6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:51:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyaDZ-0004sC-7f; Mon, 03 Feb 2020 11:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyaDX-0004s7-89
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:48:39 +0000
X-Inumbo-ID: 1dcc5392-467b-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dcc5392-467b-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 11:48:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACF25AC8C;
 Mon,  3 Feb 2020 11:48:37 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-2-roger.pau@citrix.com>
 <20200128141759.fja7mqmghic2fnrg@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a859940e-fb29-bb13-1337-037c8d8e28f4@suse.com>
Date: Mon, 3 Feb 2020 12:48:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128141759.fja7mqmghic2fnrg@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/7] x86/tlb: fix NEED_FLUSH return type
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNToxNywgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEphbiAyNywgMjAy
MCBhdCAwNzoxMTowOVBNICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IFRoZSByZXR1
cm5lZCB0eXBlIHdhbnRzIHRvIGJlIGJvb2wgaW5zdGVhZCBvZiBpbnQuCj4+Cj4+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xA
eGVuLm9yZz4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
