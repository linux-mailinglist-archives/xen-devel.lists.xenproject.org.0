Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55CE596C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 11:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOI31-0003mc-Pv; Sat, 26 Oct 2019 09:07:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iOI30-0003mX-SQ
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 09:07:46 +0000
X-Inumbo-ID: 117fa62e-f7d0-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 117fa62e-f7d0-11e9-beca-bc764e2007e4;
 Sat, 26 Oct 2019 09:07:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8ABD7B0C6;
 Sat, 26 Oct 2019 09:07:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sat, 26 Oct 2019 11:07:40 +0200
Message-Id: <20191026090740.9581-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: patch for 5.4-rc5
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjQtcmM1LXRhZwoKeGVuOiBwYXRjaCBmb3IgNS40LXJjNQoKSXQgY29udGFpbnMganVzdCBvbmUg
cGF0Y2ggZm9yIGlzc3VpbmcgYSBkZXByZWNhdGlvbiB3YXJuaW5nIGZvciAzMi1iaXQKWGVuIHB2
IGd1ZXN0cy4KClRoYW5rcy4KCkp1ZXJnZW4KCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMg
fCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpKdWVyZ2VuIEdy
b3NzICgxKToKICAgICAgeGVuOiBpc3N1ZSBkZXByZWNhdGlvbiB3YXJuaW5nIGZvciAzMi1iaXQg
cHYgZ3Vlc3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
