Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0857C9AD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:01:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrwH-0004F6-2r; Wed, 31 Jul 2019 16:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hsrwG-0004Ek-2R
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:58:56 +0000
X-Inumbo-ID: 7977930a-b3b4-11e9-80a7-070076895f02
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7977930a-b3b4-11e9-80a7-070076895f02;
 Wed, 31 Jul 2019 16:58:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F4FFAE12;
 Wed, 31 Jul 2019 16:58:52 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2019 18:58:51 +0200
Message-ID: <156459233172.7075.6811919592319549670.stgit@Palanthas>
In-Reply-To: <156458463216.7075.10552410480716651842.stgit@Palanthas>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] automation: build in openSUSE Tumbleweed
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCkNj
OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLS0KIGF1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwgfCAgIDIwICsrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwgYi9hdXRvbWF0aW9uL2dpdGxhYi1j
aS9idWlsZC55YW1sCmluZGV4IDFlNjFkMzBjODUuLjk0ODc3ZjlkMDEgMTAwNjQ0Ci0tLSBhL2F1
dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwKKysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kv
YnVpbGQueWFtbApAQCAtNDIwLDYgKzQyMCwyNiBAQCBvcGVuc3VzZS1sZWFwLWdjYy1kZWJ1ZzoK
ICAgdmFyaWFibGVzOgogICAgIENPTlRBSU5FUjogc3VzZTpvcGVuc3VzZS1sZWFwCiAKK29wZW5z
dXNlLXR1bWJsZXdlZWQtY2xhbmc6CisgIGV4dGVuZHM6IC5jbGFuZy14ODYtNjQtYnVpbGQKKyAg
dmFyaWFibGVzOgorICAgIENPTlRBSU5FUjogc3VzZTpvcGVuc3VzZS10dW1ibGV3ZWVkCisKK29w
ZW5zdXNlLXR1bWJsZXdlZWQtY2xhbmctZGVidWc6CisgIGV4dGVuZHM6IC5jbGFuZy14ODYtNjQt
YnVpbGQtZGVidWcKKyAgdmFyaWFibGVzOgorICAgIENPTlRBSU5FUjogc3VzZTpvcGVuc3VzZS10
dW1ibGV3ZWVkCisKK29wZW5zdXNlLXR1bWJsZXdlZWQtZ2NjOgorICBleHRlbmRzOiAuZ2NjLXg4
Ni02NC1idWlsZAorICB2YXJpYWJsZXM6CisgICAgQ09OVEFJTkVSOiBzdXNlOm9wZW5zdXNlLXR1
bWJsZXdlZWQKKworb3BlbnN1c2UtdHVtYmxld2VlZC1nY2MtZGVidWc6CisgIGV4dGVuZHM6IC5n
Y2MteDg2LTY0LWJ1aWxkLWRlYnVnCisgIHZhcmlhYmxlczoKKyAgICBDT05UQUlORVI6IHN1c2U6
b3BlbnN1c2UtdHVtYmxld2VlZAorCiAjIEFybSBidWlsZHMKIAogZGViaWFuLXVuc3RhYmxlLWdj
Yy1hcm02NDoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
