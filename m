Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E735FB1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYXHw-0001Gq-PM; Wed, 05 Jun 2019 14:53:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYXHu-0001Gj-UI
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:53:14 +0000
X-Inumbo-ID: a298679e-87a1-11e9-ba76-bbcb104abec0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a298679e-87a1-11e9-ba76-bbcb104abec0;
 Wed, 05 Jun 2019 14:53:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yIsxh30F9X26Tdy8d+FYstMfBXvbG6RSY2DG/3JDpJMpONMYIHaM0GGorD8QQV+d8Qbg4gMK0T
 4+9sUtw2xhKAmkwqDZDATnGQe5wI9ncpGfUn7hlIG2IBgE1Xajv0aNsuoSIYMKkh8fs5vbkV/2
 Hq4naLndXzOhQtmhiz7SX/53kTnhEZeauq8tTxR1v6KkpjtygTaIuOHl3rlD9r/+xYL7MMjCv9
 AqzotmcZmWhCFEF06axmVveLnZiiqF9I/DHxSQLtByInyY/7RhhyIamVJSLVlR1zro7ZdwyNW3
 XUE=
X-SBRS: 2.7
X-MesageID: 1355716
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1355716"
Date: Wed, 5 Jun 2019 16:52:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190605145259.656jjucllbepchpq@Air-de-Roger>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558945891-3015-10-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDQ6MzE6MzBQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gbWljcm9jb2RlX3VwZGF0ZV9sb2NrIGlzIHRvIHByZXZlbnQgbG9naWMgdGhyZWFkcyBvZiBh
IHNhbWUgY29yZSBmcm9tCj4gdXBkYXRpbmcgbWljcm9jb2RlIGF0IHRoZSBzYW1lIHRpbWUuIEJ1
dCBkdWUgdG8gdXNpbmcgYSBnbG9iYWwgbG9jaywgaXQKPiBhbHNvIHByZXZlbnRlZCBwYXJhbGxl
bCBtaWNyb2NvZGUgdXBkYXRpbmcgb24gZGlmZmVyZW50IGNvcmVzLgoKT2gsIE9LLCBzbyB0aGF0
J3Mgd2hhdCBJIHdhcyBtaXNzaW5nIGZyb20gcGF0Y2ggOCBhbmQgd2hhdCBzZXJpYWxpemVzCnRo
ZSB1cGRhdGluZy4KCj4gUmVtb3ZlIHRoaXMgbG9jayBpbiBvcmRlciB0byB1cGRhdGUgbWljcm9j
b2RlIGluIHBhcmFsbGVsLiBJdCBpcyBzYWZlCj4gYmVjYXVzZSB3ZSBoYXZlIGFscmVhZHkgZW5z
dXJlZCBzZXJpYWxpemF0aW9uIG9mIHNpYmxpbmcgdGhyZWFkcyBhdCB0aGUKPiBjYWxsZXIgc2lk
ZS4KClRoZW4geW91IGNlcnRhaW5seSBuZWVkIHRvIGZpeCB0aGUgd2FpdCBsb29wIGluIGRvX21p
Y3JvY29kZV91cGRhdGUgdG8Kb25seSB3YWl0IGZvciBNSUNST0NPREVfVVBEQVRFX1RJTUVPVVRf
VVMgcmVnYXJkbGVzcyBvZiB0aGUgbnVtYmVyIG9mCkNQVXMgaW4gdGhlIHN5c3RlbT8KCj4gMS5G
b3IgbGF0ZSBtaWNyb2NvZGUgdXBkYXRlLCBkb19taWNyb2NvZGVfdXBkYXRlKCkgZW5zdXJlcyB0
aGF0IG9ubHkgb25lCj4gICBzaWJpbGluZyB0aHJlYWQgb2YgYSBjb3JlIGNhbiB1cGRhdGUgbWlj
cm9jb2RlLgo+IDIuRm9yIG1pY3JvY29kZSB1cGRhdGUgZHVyaW5nIHN5c3RlbSBzdGFydHVwIG9y
IENQVS1ob3RwbHVnLAo+ICAgbWljcm9jb2RlX211dGV4KCkgZ3VhcmFudGVlcyB1cGRhdGUgc2Vy
aWFsaXphdGlvbiBvZiBsb2dpY2FsIHRocmVhZHMuCj4gMy5nZXQvcHV0X2NwdV9iaXRtYXBzKCkg
cHJldmVudHMgdGhlIGNvbmN1cnJlbmN5IG9mIENQVS1ob3RwbHVnIGFuZAo+ICAgbGF0ZSBtaWNy
b2NvZGUgdXBkYXRlLgo+IAo+IE5vdGUgdGhhdCBwcmludGsgaW4gYXBwbHlfbWljcm9jb2RlKCkg
YW5kIHN2bV9ob3N0X29zdm1faW5pdCgpIChmb3IgQU1ECj4gb25seSkgYXJlIHN0aWxsIHByb2Nl
c3NlZCBzZXF1ZW50aWFsbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2Fv
QGludGVsLmNvbT4KClBhdGNoIExHVE0sIGJ1dCBpdCBuZWVkcyB0byBmaXggdGhlIHdhaXQgbG9v
cCBpbiBkb19taWNyb2NvZGVfdXBkYXRlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
