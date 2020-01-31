Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2814F1BB
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:58:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaXR-0007gZ-VD; Fri, 31 Jan 2020 17:57:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixaXQ-0007gU-DI
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:57:04 +0000
X-Inumbo-ID: 1660f632-4453-11ea-8bf6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1660f632-4453-11ea-8bf6-12813bfff9fa;
 Fri, 31 Jan 2020 17:57:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixaXO-0000Xr-QP; Fri, 31 Jan 2020 17:57:02 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixaXO-0005nJ-Gl; Fri, 31 Jan 2020 17:57:02 +0000
Date: Fri, 31 Jan 2020 17:56:59 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200131175659.5nabkw7joiaepku2@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131174930.31045-6-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KE5vdGUgdG8gc2VsZikKCk9uIEZyaSwgSmFuIDMxLCAyMDIwIGF0IDA1OjQ5OjI0UE0gKzAwMDAs
IFdlaSBMaXUgd3JvdGU6ClsuLi5dCj4gK3N0YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9p
ZCh2b2lkKQo+ICt7Cj4gKyAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBpZDsKPiArCgogICAgICAg
aWQucmF3ID0gMDsKCj4gKyAgICBpZC52ZW5kb3IgPSBIVl9YRU5fVkVORE9SX0lEOwo+ICsgICAg
aWQubWFqb3IgPSB4ZW5fbWFqb3JfdmVyc2lvbigpOwo+ICsgICAgaWQubWlub3IgPSB4ZW5fbWlu
b3JfdmVyc2lvbigpOwo+ICsKPiArICAgIHJldHVybiBpZC5yYXc7Cj4gK30KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
