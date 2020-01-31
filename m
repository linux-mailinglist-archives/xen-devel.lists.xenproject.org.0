Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26914F054
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:02:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYiC-00043L-Tu; Fri, 31 Jan 2020 16:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYiB-0003x6-33
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:00:03 +0000
X-Inumbo-ID: bd68f152-4442-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd68f152-4442-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 16:00:02 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYi9-0006IM-TO; Fri, 31 Jan 2020 16:00:01 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYi9-0005gY-JK; Fri, 31 Jan 2020 16:00:01 +0000
Date: Fri, 31 Jan 2020 15:59:58 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200131155958.62rrepkckq4wzjir@debian>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-7-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121084330.18309-7-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 6/9] tools: add xenfs tool
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDk6NDM6MjdBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgdGhlIHhlbmZzIHRvb2wgZm9yIGFjY2Vzc2luZyB0aGUgaHlwZXJ2aXNvciBm
aWxlc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
