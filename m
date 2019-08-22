Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A899847
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0p7f-0007fc-PX; Thu, 22 Aug 2019 15:35:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV1a=WS=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i0p7d-0007fX-Tx
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 15:35:33 +0000
X-Inumbo-ID: 79cbf3f6-c4f2-11e9-951b-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79cbf3f6-c4f2-11e9-951b-bc764e2007e4;
 Thu, 22 Aug 2019 15:35:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="190621295"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga002.jf.intel.com with ESMTP; 22 Aug 2019 08:35:28 -0700
Date: Thu, 22 Aug 2019 23:39:34 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20190822153932.GA29797@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <c7afe7bd-8370-b427-a5ee-e34019866d22@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7afe7bd-8370-b427-a5ee-e34019866d22@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 00/15] improve late microcode loading
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDg6NTE6NDNBTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPkhpIENoYW8sCj4KPk9uIDE5LzA4LzIwMTkgMDI6MjUsIENoYW8gR2FvIHdyb3RlOgo+
PiBQcmV2aW91cyBjaGFuZ2UgbG9nOgo+PiBDaGFuZ2VzIGluIHZlcnNpb24gODoKPj4gIC0gYmxv
Y2sgI05NSSBoYW5kbGluZyBkdXJpbmcgbWljcm9jb2RlIGxvYWRpbmcgKFBhdGNoIDE2KQo+PiAg
LSBEb24ndCBhc3N1bWUgdGhhdCBhbGwgQ1BVcyBpbiB0aGUgc3lzdGVtIGhhdmUgbG9hZGVkIGEg
c2FtZSB1Y29kZS4KPj4gIFNvIHdoZW4gcGFyc2luZyBhIGJsb2IsIHdlIGF0dGVtcHQgdG8gc2F2
ZSBhIHBhdGNoIGFzIGxvbmcgYXMgaXQgbWF0Y2hlcwo+PiAgd2l0aCBjdXJyZW50IGNwdSBzaWdu
YXR1cmUgcmVnYXJkbGVzcyBvZiB0aGUgcmV2aXNpb24gb2YgdGhlIHBhdGNoLgo+PiAgQW5kIGFs
c28gZm9yIGxvYWRpbmcsIHdlIG9ubHkgcmVxdWlyZSB0aGUgcGF0Y2ggdG8gYmUgbG9hZGVkIGlz
bid0IG9sZAo+PiAgdGhhbiB0aGUgY2FjaGVkIG9uZS4KPj4gIC0gc3RvcmUgYW4gdXBkYXRlIGFm
dGVyIHRoZSBmaXJzdCBzdWNjZXNzZnVsIGxvYWRpbmcgb24gYSBDUFUKPj4gIC0gcmVtb3ZlIHRo
ZSBwYXRjaCB0aGF0IGNhbGxzIHdiaW52ZCgpIHVuY29uZGl0aW9uYWxseSBiZWZvcmUgbWljcm9j
b2RlPiAgbG9hZGluZy4gSXQgaXMgdW5kZXIgaW50ZXJuYWwgZGlzY3Vzc2lvbi4KPgo+SSBub3Rp
Y2VkIHRoYXQgeW91IHJlbW92ZWQgdGhlIHBhdGNoIHdoaWNoIGFkZHMgd2JpbnZkKCkgYmFjayBp
biB2OC4KPldoYXQgd2FzIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoYXQgYW5kIGlzIHRoZXJlIGFu
eSBvdXRjb21lIGZyb20gdGhlCj5pbnRlcm5hbCBkaXNjdXNzaW9uIHRoYXQgeW91IG1lbnRpb24g
aGVyZT8KCkphbiAobWF5YmUgc29tZW9uZSBlbHNlKSB3YXMgY29uY2VybmVkIGFib3V0IHRoZSBp
bXBhY3Qgb2YgY2FsbGluZwp3YmludmQoKSB1bmNvbmRpdGlvbmFsbHksIGVzcGVjaWFsbHkgd2l0
aCB5b3VyIHdvcmsgdG8gbWFrZSBzZXJpYWwKdWNvZGUgbG9hZGluZyBhbiBvcHRpb24uIFRvIGFk
ZHJlc3MgdGhpcyBjb25jZXJuLCBJIHBsYW5uZWQgdG8gY2FsbAp3YmludmQoKSBjb25kaXRpb25h
bGx5LiBJIG5lZWQgdG8gY29uZmlybSB3aXRoIEludGVsIG1pY3JvY29kZSB0ZWFtCndoZXRoZXIg
aXQgaXMgZmluZSBhbmQgd2hhdCB0aGUgY29uZGl0aW9uIHNob3VsZCBiZS4gQnV0IEkgaGF2ZW4n
dApyZWNlaXZlZCBhbiBhbnN3ZXIuIEkgd2lsbCB0YWxrIHdpdGggQXNob2sgYWdhaW4gYW5kIHBy
b2JhYmx5IGFkZAp0aGlzIHBhdGNoIGJhY2sgaW4gdjEwLgoKVGhhbmtzCkNoYW8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
