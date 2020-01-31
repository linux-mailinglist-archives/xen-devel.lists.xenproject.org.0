Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50A14F04A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:59:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYgB-0003JY-AI; Fri, 31 Jan 2020 15:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYgA-0003JT-F2
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:57:58 +0000
X-Inumbo-ID: 7333113a-4442-11ea-8bdc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7333113a-4442-11ea-8bdc-12813bfff9fa;
 Fri, 31 Jan 2020 15:57:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYg9-00060s-BD; Fri, 31 Jan 2020 15:57:57 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYg9-0005aK-0H; Fri, 31 Jan 2020 15:57:57 +0000
Date: Fri, 31 Jan 2020 15:57:53 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200131155753.gyv4n67oz3znsxt5@debian>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-6-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121084330.18309-6-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 5/9] libs: add libxenhypfs
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

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDk6NDM6MjZBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgdGhlIG5ldyBsaWJyYXJ5IGxpYnhlbmh5cGZzIGZvciBhY2Nlc3MgdG8gdGhl
IGh5cGVydmlzb3IgZmlsZXN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgpJJ3ZlIG9ubHkgc2tpbW1lZCByZWFkIGl0LiBUaGUgY29kZSBs
b29rcyBzZW5zaWJsZS4KCk9uZSBtaW5vciBjb21tZW50LgoKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlicy9oeXBmcy94ZW5oeXBmcy5wYy5pbiBiL3Rvb2xzL2xpYnMvaHlwZnMveGVuaHlwZnMucGMu
aW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjljYjk2OGYwZGIK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvbGlicy9oeXBmcy94ZW5oeXBmcy5wYy5pbgo+
IEBAIC0wLDAgKzEsMTAgQEAKPiArcHJlZml4PUBAcHJlZml4QEAKPiAraW5jbHVkZWRpcj1AQGlu
Y2RpckBACj4gK2xpYmRpcj1AQGxpYmRpckBACj4gKwo+ICtOYW1lOiBYZW5oeXBmcwo+ICtEZXNj
cmlwdGlvbjogVGhlIFhlbmh5cGZzIGxpYnJhcnkgZm9yIFhlbiBoeXBlcnZpc29yCj4gK1ZlcnNp
b246IEBAdmVyc2lvbkBACj4gK0NmbGFnczogLUkke2luY2x1ZGVkaXJ9IEBAY2ZsYWdzbG9jYWxA
QAo+ICtMaWJzOiBAQGxpYnNmbGFnQEAke2xpYmRpcn0gLWx4ZW5oeXBmcwo+ICtSZXF1aXJlcy5w
cml2YXRlOiB4ZW50b29sY29yZSx4ZW50b29sbG9nLHhlbmNhbGwKCk5lZWQgdG8gbGlzdCBsaWJ6
IGhlcmU/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
