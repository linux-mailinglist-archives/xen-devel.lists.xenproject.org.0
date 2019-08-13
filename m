Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E18BF08
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:54:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxa2Y-0000lM-PO; Tue, 13 Aug 2019 16:52:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxa2X-0000lG-72
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:52:53 +0000
X-Inumbo-ID: c9597100-bdea-11e9-b334-a7fd6cf04a19
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c9597100-bdea-11e9-b334-a7fd6cf04a19;
 Tue, 13 Aug 2019 16:52:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A86337;
 Tue, 13 Aug 2019 09:52:50 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41723F706;
 Tue, 13 Aug 2019 09:52:49 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
Date: Tue, 13 Aug 2019 17:52:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFyaW8sCgpPbiA4LzEzLzE5IDQ6MjcgUE0sIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9u
IEZyaSwgMjAxOS0wOC0wOSBhdCAxMTozMCAtMDcwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+PiBPbiBGcmksIDkgQXVnIDIwMTksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gQ2FuIHlv
dSBoZWxwIG1lIHdpdGggdGhpcywgZS5nLiwgYnkgcHJvdmlkaW5nIHNvbWUgbW9yZSBpbmZvIGFu
ZCwKPj4+IGlmCj4+PiBwb3NzaWJsZSwgbG9ncz8KPj4KPj4gSSBhbSBhdHRhY2hpbmcgdGhlIGxv
Z3MuCj4+Cj4gVGhhbmtzIQo+IAo+PiBJbnRlcmVzdGluZ2x5LCBJIGdldCBhIGJ1bmNoIG9mOgo+
Pgo+PiAoWEVOKSAqKiogTE9BRElORyBET01VIGNwdXM9MSBtZW1vcnk9NDAwMDBLQiAqKioKPj4g
KFhFTikgc2NoZWRfbnVsbC5jOjQ1ODogTm90IGluc2VydGluZyBkMnYwIChub3Qgb25saW5lISkK
Pj4KPj4gTWF5YmUgd2UgYXJlIG1pc3NpbmcgYSBjYWxsIHRvIG9ubGluZSB0aGUgdmNwdXMgc29t
ZXdoZXJlIGluCj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYzpjb25zdHJ1Y3RfZG9tYWlu
Pwo+Pgo+IEFjdHVhbGx5LCB0aG9zZSBsaW5lcyBhcmUgbm9ybWFsLCBiZWNhdXNlIHZDUFVzIGFy
ZSBjcmVhdGVkIG9mZmxpbmUuCj4gKHNlZSB0aGUgc2V0X2JpdChfVlBGX2Rvd24pIGluIHZjcHVf
Y3JlYXRlKCkpLgo+IAo+IFRoZSBwcm9ibGVtIGlzIHdoeSBhcmVuJ3QgdGhleSBjb21pbmcgdXAu
IEJhc2ljYWxseSwgeW91J3JlIG1pc3NpbmcgYQo+IGNhbGwgdG8gdmNwdV93YWtlKCkuCj4gCj4g
SW4gbXkgKHg4NiBhbmQgImRvbTBmdWxsIikgdGVzdGJveCwgdGhpcyBzZWVtcyB0byBjb21lIGZy
b20KPiBkb21haW5fdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKGRvbTApIGNhbGxlZCBieQo+
IHhlbi9hcmNoL3g4Ni9zZXR1cC5jOmluaXRfZG9uZSgpLCBhdCB0aGUgdmVyeSBlbmQgb2YgX19z
dGFydF94ZW4oKS4KPiAKPiBJIGRvbid0IGtub3cgaWYgZG9tYWluIGNvbnN0cnVjdGlvbiBpbiBh
biBBUk0gZG9tMGxlc3Mgc3lzdGVtIHdvcmtzCj4gc2ltaWxhcmx5LCB0aG91Z2guIFdoYXQgd2Ug
d2FudCwgaXMgc29tZW9uZSBjYWxsaW5nIGVpdGhlciB2Y3B1X3dha2UoKQo+IG9yIHZjcHVfdW5w
YXVzZSgpLCBhZnRlciBoYXZpbmcgY2xlYXJlZCBfVlBGX2Rvd24gZnJvbSBwYXVzZV9mbGFncy4K
Ckxvb2tpbmcgYXQgY3JlYXRlX2RvbVVzKCkgdGhlcmUgaXMgYSBjYWxsIHRvIApkb21haW5fdW5w
YXVzZV9ieV9jb250cm9sbGVyIGZvciBlYWNoIGRvbVVzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
