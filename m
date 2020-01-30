Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17514D98A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:13:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7jR-0007JM-Q6; Thu, 30 Jan 2020 11:11:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix7jQ-0007J2-1e
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:11:32 +0000
X-Inumbo-ID: 44cf25dc-4351-11ea-8a39-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44cf25dc-4351-11ea-8a39-12813bfff9fa;
 Thu, 30 Jan 2020 11:11:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7jO-0002JH-LL; Thu, 30 Jan 2020 11:11:30 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7jO-0004bz-B2; Thu, 30 Jan 2020 11:11:30 +0000
Date: Thu, 30 Jan 2020 00:30:47 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200130003047.pg3dxgy4vtqjhayo@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-6-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-6-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 05/12] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiAgCj4gK3ZvaWQgX19zZXRfZml4bWFwX3goCj4gKyAgICBlbnVtIGZpeGVkX2FkZHJlc3Nlc194
IGlkeCwgdW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gK3sKPiArICAg
IEJVR19PTihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3ggfHwgaWR4IDw9IEZJWF9Y
X1JFU0VSVkVEKTsKPiArICAgIG1hcF9wYWdlc190b194ZW4oX19maXhfeF90b192aXJ0KGlkeCks
IF9tZm4obWZuKSwgMSwgZmxhZ3MpOwo+ICsKPiArICAgIC8qIEdlbmVyYXRlIGEgc3ltYm9sIHRv
IGJlIHVzZWQgaW4gbGlua2VyIHNjcmlwdCAqLwo+ICsgICAgYXNtICggIi5lcXUgRklYQUREUl9Y
X1NJWkUsICVjMDsgLmdsb2JhbCBGSVhBRERSX1hfU0laRSIKPiArICAgICAgICAgIDo6ICJpIiAo
X19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3ggPDwgUEFHRV9TSElGVCkgKTsKClRoZSAoX19lbmQg
PDwgU0hJRlQpIHBhcnQgY2FuIGJlIHJlcGxhY2VkIHdpdGggRklYQUREUl9YX1NJWkUgKHRoZSBt
YWNybwpkZWZpbmVkIGluIGZpeG1hcC5oKSBkaXJlY3RseS4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
