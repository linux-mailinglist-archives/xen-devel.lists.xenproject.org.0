Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31492C1B3D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 08:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEokb-00075U-LF; Mon, 30 Sep 2019 06:01:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEoka-00075P-CG
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 06:01:36 +0000
X-Inumbo-ID: c16c4ecd-e347-11e9-96c8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c16c4ecd-e347-11e9-96c8-12813bfff9fa;
 Mon, 30 Sep 2019 06:01:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3ADB8B15C;
 Mon, 30 Sep 2019 06:01:34 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
References: <osstest-141990-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
Date: Mon, 30 Sep 2019 08:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <osstest-141990-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMDY6MjMsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQxOTkwIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDE5OTAvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXFlbXV0LWRlYmlhbmh2bS1hbWQ2NCAgNyB4ZW4tYm9vdCAgICBmYWlsIFJFR1IuIHZzLiAxNDE4
MjIKPiAgIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAg
ICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MTgyMgo+ICAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQt
eHNtICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxODIyCj4g
ICB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0
L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDE0MTgyMgo+ICAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZp
cnQgICAgICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxODIy
Cj4gICB0ZXN0LWFtZDY0LWFtZDY0LW1pZ3J1cGdyYWRlIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hv
c3QvZHN0X2hvc3QgZmFpbCBSRUdSLiB2cy4gMTQxODIyCj4gICB0ZXN0LWFtZDY0LWkzODYtbGli
dmlydC1wYWlyIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hvc3QgZmFpbCBSRUdSLiB2
cy4gMTQxODIyCj4gICB0ZXN0LWFtZDY0LWkzODYtbWlncnVwZ3JhZGUgMjIgZ3Vlc3QtbWlncmF0
ZS9zcmNfaG9zdC9kc3RfaG9zdCBmYWlsIFJFR1IuIHZzLiAxNDE4MjIKPiAgIHRlc3QtYXJtNjQt
YXJtNjQtZXhhbWluZSAgICAxMSBleGFtaW5lLXNlcmlhbC9ib290bG9hZGVyIGZhaWwgUkVHUi4g
dnMuIDE0MTgyMgo+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2
bS1hbWQ2NC14c20gMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDE0MTgyMgo+
ICAgdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAxMiBndWVzdC1zdGFydCAgICAgICAgICAg
ICAgZmFpbCBSRUdSLiB2cy4gMTQxODIyCj4gICB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhk
IDEwIGRlYmlhbi1kaS1pbnN0YWxsICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE4MjIKPiAgIHRl
c3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDE0MTgyMgo+ICAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMCBk
ZWJpYW4tZGktaW5zdGFsbCAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxODIyCgpTZXZlcmFsIG9m
IHRoZSBmYWlsdXJlcyBzZWVtIHRvIGJlIHJlbGF0ZWQgdG8gY29tbWl0IGJhYmRlNDdhM2ZlZGE2
ZGQ0CigiaW50cm9kdWNlIGEgJ3Bhc3N0aHJvdWdoJyBjb25maWd1cmF0aW9uIG9wdGlvbiB0byB4
bC5jZmciKS4KCkkgdGhpbmsgdGhlIGFzc2VydCgpIGluIGxpeGxfY3JlYXRlLmMgKGxpbmUgNTg5
KSBzaG91bGQganVzdCBiZSBkcm9wcGVkPwoKICAgICAgICAgYXNzZXJ0KGluZm8tPnBhc3N0aHJv
dWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQpOwogICAgICAgICBMT0coREVUQUlMLCAi
cGFzc3Rocm91Z2g6ICVzIiwKICAgICAgICAgICAgIGxpYnhsX3Bhc3N0aHJvdWdoX3RvX3N0cmlu
ZyhpbmZvLT5wYXNzdGhyb3VnaCkpOwoKICAgICAgICAgaWYgKGluZm8tPnBhc3N0aHJvdWdoICE9
IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEKQogICAgICAgICAgICAgY3JlYXRlLmZsYWdzIHw9
IFhFTl9ET01DVExfQ0RGX2lvbW11OwoKICAgICAgICAgaWYgKGluZm8tPnBhc3N0aHJvdWdoID09
IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQpCiAgICAgICAgICAgICBjcmVhdGUuaW9tbXVfb3B0
cyB8PSBYRU5fRE9NQ1RMX0lPTU1VX25vX3NoYXJlcHQ7CgpPciB0aGUgaWYgKCkgc3RhdGVtZW50
cyBhZnRlciB0aGF0IGFyZSBqdXN0IHBsYWluIHdyb25nPwoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
