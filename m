Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01CB086B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 07:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Hsh-0002fZ-DM; Thu, 12 Sep 2019 05:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+knL=XH=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8Hsf-0002fU-5a
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 05:42:57 +0000
X-Inumbo-ID: 2a4825fb-d520-11e9-83e2-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a4825fb-d520-11e9-83e2-12813bfff9fa;
 Thu, 12 Sep 2019 05:42:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 22:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189884973"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 11 Sep 2019 22:42:50 -0700
Date: Thu, 12 Sep 2019 13:46:53 +0800
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com
Message-ID: <20190912054651.GA26373@gao-cwp>
References: <20190906074058.21782-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906074058.21782-1-jgross@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, marmarek@invisiblethingslab.com,
 olekstysh@gmail.com, paul.durrant@citrix.com, JBeulich@suse.com,
 puwen@hygon.cn, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDk6NDA6NThBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPlRoaXMgZW1haWwgb25seSB0cmFja3MgYmlnIGl0ZW1zIGZvciB4ZW4uZ2l0IHRyZWUu
IFBsZWFzZSByZXBseSBmb3IgaXRlbXMgeW91Cj53b3VsZCBsaWtlIHRvIHNlZSBpbiA0LjEzIHNv
IHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRlYSB3aGF0IGlzIGdvaW5nIG9uIGFuZAo+cHJpb3JpdGlz
ZSBhY2NvcmRpbmdseS4KPgo+PT09IHg4NiA9PT0gCj4KPiogIEhWTSBndWVzdCBDUFUgdG9wb2xv
Z3kgc3VwcG9ydCAoUkZDKQo+ICAtICBDaGFvIEdhbwoKTm8gcGxhbiB0byBjb250aW51ZSB0aGlz
IG9uZSBkdWUgdG8gc29tZSByZWFzb24uIFBsZWFzZSBkcm9wIHRoaXMgb25lLgoKPgo+KiAgSW1w
cm92ZSBsYXRlIG1pY3JvY29kZSBsb2FkaW5nICh2OSkKPiAgLSAgQ2hhbyBHYW8KPgoKV29ya2lu
ZyBvbiB0aGUgdjEwLiBJIHdvdWxkIGxpa2UgdG8gZ2V0IGl0IG1lcmdlZCBpbiA0LjEzLgoKVGhh
bmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
