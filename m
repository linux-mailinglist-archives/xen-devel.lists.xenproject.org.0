Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4F17DF9F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:14:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHFk-000456-Gj; Mon, 09 Mar 2020 12:11:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBHFi-00044Y-SB
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:11:22 +0000
X-Inumbo-ID: 16e1fccc-61ff-11ea-ac1a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16e1fccc-61ff-11ea-ac1a-12813bfff9fa;
 Mon, 09 Mar 2020 12:11:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 664ECAF6F;
 Mon,  9 Mar 2020 12:11:21 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Message-ID: <2fd9e568-cc00-bf18-e54b-f2e8a70b77fa@suse.com>
Date: Mon, 9 Mar 2020 13:11:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 9/9] x86: reduce mce.h include dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCB0aGUgcHVibGljIGhlYWRlciAjaW5jbHVkZSBhcyBub3QgbmVlZGVkIGJ5IHRoZSBoZWFk
ZXIgaXRzZWxmLiBBZGQKb25lIHRoYXQgd2FzIG1pc3NpbmcsIGFuZCBtb3ZlIGFsbCBpbnNpZGUg
dGhlIGluY2x1c2lvbiBndWFyZC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWNlLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tY2UuaApAQCAtMSw4ICsxLDkgQEAKLSNpbmNsdWRlIDx4ZW4vdHlwZXMu
aD4KLSNpbmNsdWRlIDxwdWJsaWMvYXJjaC14ODYveGVuLW1jYS5oPgogI2lmbmRlZiBfWEVOX1g4
Nl9NQ0VfSAogI2RlZmluZSBfWEVOX1g4Nl9NQ0VfSAogCisjaW5jbHVkZSA8eGVuL3NwaW5sb2Nr
Lmg+CisjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CisKIC8qCiAgKiBFbXVsYXRlIDIgYmFua3MgZm9y
IGd1ZXN0CiAgKiBCYW5rMDogcmVzZXJ2ZWQgZm9yICdiYW5rMCBxdWlyaycgb2NjdXIgYXQgc29t
ZSB2ZXJ5IG9sZCBwcm9jZXNzb3JzOgpAQCAtMzIsNiArMzMsOSBAQCBzdHJ1Y3Qgdm1jZSB7CiAg
ICAgc3RydWN0IHZtY2VfYmFuayBiYW5rW0dVRVNUX01DX0JBTktfTlVNXTsKIH07CiAKK3N0cnVj
dCBkb21haW47CitzdHJ1Y3QgdmNwdTsKKwogLyogR3Vlc3Qgdk1DRSBNU1JzIHZpcnR1YWxpemF0
aW9uICovCiBleHRlcm4gdm9pZCB2bWNlX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqKTsKIGV4dGVy
biBpbnQgdm1jZV9yZXN0b3JlX3ZjcHUoc3RydWN0IHZjcHUgKiwgY29uc3Qgc3RydWN0IGh2bV92
bWNlX3ZjcHUgKik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
