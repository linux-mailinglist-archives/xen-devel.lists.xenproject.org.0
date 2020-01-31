Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E434D14F02E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:53:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYZH-00035c-A6; Fri, 31 Jan 2020 15:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYZF-00035X-Cx
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:50:49 +0000
X-Inumbo-ID: 734bc672-4441-11ea-8bda-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 734bc672-4441-11ea-8bda-12813bfff9fa;
 Fri, 31 Jan 2020 15:50:48 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYZD-0005rV-JF; Fri, 31 Jan 2020 15:50:47 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYZD-0004xB-9H; Fri, 31 Jan 2020 15:50:47 +0000
Date: Fri, 31 Jan 2020 15:50:43 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200131155043.d4a2rwarveiynl6t@debian>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-5-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121084330.18309-5-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 4/9] xen: add basic hypervisor filesystem
 support
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDk6NDM6MjVBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKWy4uLl0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9oeXBmcy5jIGIveGVuL2NvbW1v
bi9oeXBmcy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi42NzYy
ZDIwZGZkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9jb21tb24vaHlwZnMuYwo+IEBAIC0w
LDAgKzEsMzY1IEBACj4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiArICoKPiArICogaHlwZnMu
Ywo+ICsgKgo+ICsgKiBTaW1wbGUgc3lzZnMtbGlrZSBmaWxlIHN5c3RlbSBmb3IgdGhlIGh5cGVy
dmlzb3IuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9saWIuaD4KClRoaXMgc2hvdWxkIGNv
bWUgYWZ0ZXIgaHlwZnMuaC4KCklmIGl0IGhhcyBjb21lIGZpcnN0IGl0IHByb2JhYmx5IG1lYW5z
IG9uZSBvZiB0aGUgaGVhZGVycyBiZWxvdyBoYXNuJ3QKaW5jbHVkZWQgaXQgcHJvcGVybHk/Cgo+
ICsjaW5jbHVkZSA8eGVuL2Vyci5oPgo+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+
ICsjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgo+ICsjaW5jbHVkZSA8eGVuL2h5cGZzLmg+Cj4g
KyNpbmNsdWRlIDx4ZW4vcndsb2NrLmg+Cj4gKyNpbmNsdWRlIDxwdWJsaWMvaHlwZnMuaD4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
