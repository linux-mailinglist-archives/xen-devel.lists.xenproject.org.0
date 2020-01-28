Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC614B8E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRp0-0002Po-Ml; Tue, 28 Jan 2020 14:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwRoy-0002Pi-CE
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:26:28 +0000
X-Inumbo-ID: 2b84139e-41da-11ea-86e0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b84139e-41da-11ea-86e0-12813bfff9fa;
 Tue, 28 Jan 2020 14:26:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRox-0001WP-DY; Tue, 28 Jan 2020 14:26:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRox-0006BN-3N; Tue, 28 Jan 2020 14:26:27 +0000
Date: Tue, 28 Jan 2020 14:26:23 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200128142623.jtofd5qdu33yiyb4@debian>
References: <20200128062107.14334-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128062107.14334-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] docs: document CONTROL command of
 xenstore protocol
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

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDc6MjE6MDdBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgQ09OVFJPTCBjb21tYW5kIChmb3JtZXIgREVCVUcgY29tbWFuZCkgaXNuJ3Qg
c3BlY2lmaWVkIGluIHRoZQo+IHhlbnN0b3JlIHByb3RvY29sIGRvYy4gQWRkIGl0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpCYWNrcG9ydDogNC45KwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
