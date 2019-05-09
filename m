Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20526193E7
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 23:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOq6k-0004mm-C2; Thu, 09 May 2019 20:57:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEiW=TJ=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hOq6i-0004mh-1l
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:57:36 +0000
X-Inumbo-ID: 110185f7-729d-11e9-8980-bc764e045a96
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 110185f7-729d-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 20:57:34 +0000 (UTC)
Date: Thu, 09 May 2019 20:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557435452;
 bh=QW1Pa29bHHtdGJ41wUxpg6iydew9Trsro8cju+33O0Y=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=JzBJ5ptrvj5+5qzYq47naYKkeasRvEYm61IYRqv7Q469lpruZjJuEvIxFg+gG3zp4
 fN7lGogTHZ0AKQqF3M/jVIaPuVL+yOJmyeZyS1tSP3ylWvBfG6uZE3L5t2R+NmWDZb
 RUUqi8AOVEfPJGscNkriLyf0ecPL5G4othpFyRH8=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpmb2xsb3dpbmcgYSBwcmV2aW91cyBjb252ZXJzYXRpb24sIGkgd291bGQgbGlrZSB0byBj
YXRjaCBNT1YtVE8tRFJ4IFZNSSBldmVudHMgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBkaXNh
YmxpbmcgbXkgaGFyZHdhcmUgYnJlYWtwb2ludHMuCgpAVGFtYXMgcG9pbnRlZCBtZSB0byB0aGlz
IGhlYWRlcjoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9i
O2Y9eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmg7aD1iMmJhZmMwZDc3Zjk3NThlNDJiMGQ1
M2MwNWE3ZTZiYjg2Yzg2Njg2O2hiPUhFQUQjbDE1NAoKQW5kLCBhcyBmYXIgYXMgSSBjYW4gdGVs
bCwgSSBoYXZlIHRvCi0gYWRkIGEgbmV3IFJFQVNPTgojZGVmaW5lIFZNX0VWRU5UX1JFQVNPTl9X
UklURV9ERUJVR1JFRyAgICAgIDE1CgotIGFkZCBhIG5ldyBzdHJ1Y3QKc3RydWN0IHZtX2V2ZW50
X3dyaXRlX2RlYnVncmVnIHsKICAgIHVpbnQzMl90IGluZGV4OwogICAgdWludDMyX3QgX3BhZDsK
ICAgIHVpbnQ2NF90IG5ld192YWx1ZTsKICAgIHVpbnQ2NF90IG9sZF92YWx1ZTsKfTsKCi0gaW5z
ZXJ0IGl0IGludG8gdGhlIHZtX2V2ZW50X3N0IHVuaW9uCgpDYW4geW91IGdpdmUgbWUgbW9yZSBw
b2ludGVyIGFuZCBndWlkYW5jZSBob3cgdG8gaW1wbGVtZW50IHRoaXMgaW50byBYZW4gPwpJIGhh
dmUgbmV2ZXIgc3VibWl0dGVkIGEgcGF0Y2gsIG5vciBsb29rZWQgaW50byBYZW4gc291cmNlIGNv
ZGUuCgpTaG91bGQgd2UgY3JlYXRlIGEgc2luZ2xlIGV2ZW50IGZvciBNT1YtVE8tUkVHeCBWTUkg
ZXZlbnRzID8KSXQgd291bGQgdm9pZCBjb3B5IHBhc3RpbmcgYW5kIGR1cGxpY2F0aW5nIGNvZGUu
CgpUaGFua3MgIQoKClNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3VyZSBFbWFpbC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
