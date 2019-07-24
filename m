Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A57286C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 08:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqAvu-00063k-0P; Wed, 24 Jul 2019 06:39:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mx4+=VV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqAvs-00063f-SM
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 06:39:24 +0000
X-Inumbo-ID: c55c1acc-addd-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c55c1acc-addd-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 06:39:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so43459712ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B8wLngInno2MMizYhGtlLuA9ri9GfEXxV2V+3I9mipQ=;
 b=qbGX7LgsPaKpuMpvfHAhpVRB3VXKsIYwjhwTX6cepCZ9G12uXSeH9QNU/nYMNHpfRJ
 /5BNqKaCOVE0EW4aTHUWTUDLPuyI/RY/qqmAyaN0ZEAUHhNjC2ES1uQwCfIhm5QesJA9
 VytmxhR4KphA3+YYEUJ0UoJtvS3IHP4e4oVk77czXWwPKwINarmbw80kb72B5TrQtKNq
 wREp5+QM0OtFHjMnfsXOpMku9IiFigz4hENWz8Jq4GVG1AjPoJgtXUGTAVP8o4xonTn1
 oOhHIb9tx8K2AHqIqWeKoMdeBl3xwy6Vle+cbU8QNxOX1J/5g7/VUT/StNjIH7JRcCwH
 iGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B8wLngInno2MMizYhGtlLuA9ri9GfEXxV2V+3I9mipQ=;
 b=hRPuWVcsntjRa+DTf+PEqhyTA45fmyU82N0PJPAAH7c/U1lvmwNYJg1Q/ku63pZy8w
 prWjaEYl5Zfly5If78D0egppGWANt8ydwV0p5P4gvmlwTUtA3NCrL5SSZOsbWNjZwZyq
 85kM0whhgTiV5AXo9l7qbD+Lfdj5kqsMdRTlOUTO0Y/gi3q9S0c54teaN2/DY1Sf4qQD
 JRVklaFI7csSu2GD61PuyJ4LRgVxfIg/tNDKN1Fvmd3DEbGOipY6GrP7dKlQFmWrJtMu
 /gAq05OOAWyk85t4c2Jx7pRaIk7dfU4GXrQFRVScA6Dudyl0ovbcZgp7AGGXNzoMmpEV
 nLgw==
X-Gm-Message-State: APjAAAXLqLUS+tqBznSJs82GOI7Ixw4pGMW4fvo+btnb6ndybDHR7Onm
 pd2oZqDbPjJnzs+HG7CCkHvsJU+G
X-Google-Smtp-Source: APXvYqxHH1ojT4o04kZzTOxSdgzClRSqMiIP7rW3Z0PuwddabRLmDHCYxcJNuP6fsvc5yTs8OBkODw==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr41539569ljg.80.1563950361081; 
 Tue, 23 Jul 2019 23:39:21 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id h3sm8492194lja.93.2019.07.23.23.39.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Jul 2019 23:39:19 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2019 09:39:18 +0300
Message-Id: <1563950358-8988-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] schedule: fix a comment missprint
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkZpeCB0aGUgY29t
bWVudCBtaXNwcmludCwgc28gaXQgcmVmZXJzIHRvIHRoZSBleGFjdCBmdW5jdGlvbiBuYW1lLgoK
U2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0t
CiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMg
Yi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggOWUxNmMxNi4uOGI3ODI5MyAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAt
MTU5Myw3ICsxNTkzLDcgQEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfdXAodW5zaWduZWQgaW50
IGNwdSkKICAgICBpbml0X3RpbWVyKCZzZC0+c190aW1lciwgc190aW1lcl9mbiwgTlVMTCwgY3B1
KTsKICAgICBhdG9taWNfc2V0KCZzZC0+dXJnZW50X2NvdW50LCAwKTsKIAotICAgIC8qIEJvb3Qg
Q1BVIGlzIGRlYWx0IHdpdGggbGF0ZXIgaW4gc2NoZWR1bGVfaW5pdCgpLiAqLworICAgIC8qIEJv
b3QgQ1BVIGlzIGRlYWx0IHdpdGggbGF0ZXIgaW4gc2NoZWR1bGVyX2luaXQoKS4gKi8KICAgICBp
ZiAoIGNwdSA9PSAwICkKICAgICAgICAgcmV0dXJuIDA7CiAKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
