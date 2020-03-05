Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B517A35B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 11:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9nzu-0005E5-7J; Thu, 05 Mar 2020 10:44:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9nzt-0005E0-F1
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 10:44:57 +0000
X-Inumbo-ID: 5a4842d6-5ece-11ea-a559-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a4842d6-5ece-11ea-a559-12813bfff9fa;
 Thu, 05 Mar 2020 10:44:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 941BEB438;
 Thu,  5 Mar 2020 10:44:55 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6cd2f1e6-a03b-b70b-1b6c-e170481b5c7c@suse.com>
Date: Thu, 5 Mar 2020 11:44:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] preparations for 4.11.4
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKdGhlIHJlbGVhc2UgaXMgZHVlIGJ5IHRoZSBlbmQgb2YgTWFyY2guIFBsZWFzZSBwb2lu
dCBvdXQgYmFja3BvcnRzCnlvdSBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZSBzdGFn
aW5nIGJyYW5jaCwgYnV0IHdoaWNoIHlvdQpjb25zaWRlciByZWxldmFudC4gVGhlc2UgY29tbWl0
cyBJJ3ZlIHF1ZXVlZCBhbHJlYWR5IG9uIHRvcCBvZgp3aGF0IHdhcyBqdXN0IHB1c2hlZCAoYWxi
ZWl0IEkgZGlkbid0IGNoZWNrIHRoZWlyIGFwcGxpY2FiaWxpdHkKeWV0IHRvIHRoaXMgb2xkZXN0
IG9mIG91ciBmdWxseSBtYWludGFpbmVkIHRyZWVzOyB0aGUgbGF0dGVyIHR3bwpsaWtlbHkgYXJl
bid0LCBmb3IgZXhhbXBsZSk6CgoxNWMzOWM3YzkxM2YJeDg2L3ZQTVU6IGRvbid0IGJsaW5kbHkg
YXNzdW1lIElBMzJfUEVSRl9DQVBBQklMSVRJRVMgTVNSIGV4aXN0cwo5OGVkMWY0M2NjMmMJc2No
ZWQ6IGZpeCBlcnJvciBwYXRoIGluIGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KCkKNzNiNDdl
ZWEyMTA0CXg4Ni9kb20wOiBpbXByb3ZlIFBWSCBpbml0cmQgYW5kIG1ldGFkYXRhIHBsYWNlbWVu
dApmYWYwZDYwNmE2ZWIJaW9tbXU6IGZpeCBjaGVjayBmb3IgYXV0b3RyYW5zbGF0ZWQgaGFyZHdh
cmUgZG9tYWluCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
