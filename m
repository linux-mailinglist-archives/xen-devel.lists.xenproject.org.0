Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B07802E94
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646659.1009135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Fy-00050A-Qm; Mon, 04 Dec 2023 09:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646659.1009135; Mon, 04 Dec 2023 09:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Fy-0004x6-OE; Mon, 04 Dec 2023 09:28:50 +0000
Received: by outflank-mailman (input) for mailman id 646659;
 Mon, 04 Dec 2023 09:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GT4u=HP=linutronix.de=alex@srs-se1.protection.inumbo.net>)
 id 1rA5Fx-0004vg-7x
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:28:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8658802c-9287-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:28:47 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8658802c-9287-11ee-9b0f-b553b5be7939
Message-ID: <da50a3db-b950-4a0e-a7e7-a715c1f74f4a@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701682126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lbiHHiLgWT2Ti+H0E9uATy11k8pqT4M6CrojOb8D//Y=;
	b=KbfPzfTw1+BJaNaxUYqPEFHTrioBQ/i6m65WKUuw0ezhywSqGesby6Hjgp7rsTHY59GMA3
	25ilBISHOuWyoljthmH5nQQCwJdlLjAc4fzKkH/B/7mJ5VAErumt55QEMYVF6b7vJIs0FD
	WKDHuRjGwgK8DsVAfNhFGS7pmG0t1YJpVl7TTDho+IktQJ2EQ3avTdyyRRkML4j+PSpPEj
	sBKJbJN8XbdFn8qCbXH/9J3XpQIWif/DqvaBy/YTM9P6bO+EeKqfLLgAP/4IhMbz+l/+w9
	VzQuqxKd9H4427QBLjkugYMHCoojAU+ckjC5dBCfq6ofTF2NBnAO6eYamD2o4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701682126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lbiHHiLgWT2Ti+H0E9uATy11k8pqT4M6CrojOb8D//Y=;
	b=snKUF2DqY4Gl6QKgyJH7UtIo313eFpwuObKbzICNmA4MJAJx74AFU+LnvLTqm/EMAT5kxI
	FQsg+aC1ZSIJIODw==
Date: Mon, 4 Dec 2023 10:28:43 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
 <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
 <890f54b5-9692-40b8-94fa-9a55268e29f5@suse.com>
 <da7a86ba-7f74-41bb-9540-76f4530ac7ac@xen.org>
From: Alexander Kanavin <alex@linutronix.de>
Autocrypt: addr=alex@linutronix.de; keydata=
 xsDNBGHm1swBDADo+8UfTmQ2gV6TeJv11EvzlOgInBSbY8MyOgXjiakzu6C8AFE0j9JIbLWV
 uVsxDoFmFUgDHUCItXWibZ4hiHV5tHTWwUICcusgNdAuNUxpMZ/qV5IOEzuVEqcX9qLl13Qd
 SVxgJt+uC05g831Q/fCYTIheX8dsk+K/PkFCE6sYol5Q/KHXWv+M73QEo3pq7xYoZ333TaLO
 eR4mPz1jorqk8flRc7NCJb5Yrmigy0xBpf/CSW5Ux8lrwvOrz3zA8xHbSG4nUwGfzTK9GETH
 UcTsXYy3sq6YL7mDazQ2oLswBt6QD9XGnxTFDYoDU0ZlvLAj2+KjeX2+KbM+QjB6v2POYrJO
 mfQQUJoP7NyL4nEt3npnFVuGIvbsYOZwfsmdcwq8bQBIDJqrmbFA5w0EK3GGkRoLDXLK/+en
 TeCotmW2XShnCI8gWQjTpQv79Di3bV2ucBIvS56wTJqzKoSb/1K/2q+W7P7yLTO8fOYPc97E
 I0yyznjSsxRSjZajqHWG8DUAEQEAAc0mQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
 b25peC5kZT7CwRQEEwEKAD4WIQS0m1Lg1L9/kNpscyOI0ieG55SfbQUCYebWzAIbAwUJA8Jn
 AAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCI0ieG55SfbRycC/44I2toOx+pGT9NAhOi
 ZU2hsjSQacQzmLpKMfv9fMIS86DE0Hsi4PYVfT8kemL5F8hiAYL3XLZwuWLTinH1H3FFb8ko
 T//aCOGMjoQLpXtjbUnw9UGeIiwFdUg3Yym8hq/rtMMFsEG0gfUz6wiOlEfohIW+a2HuO96z
 +BWVT+ziPZdTPZvNGWuvWUO9/54GqcMBWf6nQtbyrDfqG3YD2wpmSuYWlavIszzCp0Dzvz86
 Q0vxSiWqO3IdttoIjDpIDMaK3uDdJE6CPO+oqVJhsxEWex842yy92f7B5jKOJZqcD/vo8iMJ
 bQDUoEis2WGkkou3JxRbHM2JE4lKEuG6usgjErwW9sv6CiR+3a17A4sjwK8Cewd0Gj0a4Bn5
 0TwhAWZ9i2UFbuhsm7P7ku5OVZrlfN+MDEH2DEH1RotN98CCUtogAF8WIr1A8dZle5sYlNkt
 Q9qLZwCPFbEdkOyDDoE9vO1hTHUKz9wqKba88Kvv1YWHj3xmcfE88b+GUnpbfO7OwM0EYebW
 zAEMALaOKBsfqdmBHJL7h7Hfe292bmlAGuQ9JL/z+PUGk9FDAl6+buJc/YP4LYDSTsDf61Vq
 fZVrqMVGb46SbLkb/+blhzUVfaNJaViyvhnYC4UyO8pAb19jPsxlD9HN/w0nbZCwcIJYQSh5
 6khm5JXWtrjCtbp5HAQComiiSnZqS7MMB8vScGqKYutumtjpsdn/dWiQ2vwjwR+gDSZWGjUP
 vDCONdOhfDFQo0UvRmRlEk7ZJs/EuPDI17EzBfnZqgudbvI4uPutOxiCM+5IIMgwQUIK3qkU
 E7HwHtdUU/LWYR7LMVh14mr4BZJv6k5JpwrfQ1Sl9SzhfXaelOwso98KpJPah86cDFPbhqO+
 c4Cdktjz0jhrUBprVC3Uo14pxNZo/1MWAhWKGVSaYTa7rVO1EPZYEttOUVcUbF5d1ykd/jps
 md02kLKjC2Wxpr5r2JImkjbMUCyvGScXlAKgZMpaTkCulatk5gHClNT10Gt3CaOVR496OqgL
 RFj0oMDHi/+zRwARAQABwsD8BBgBCgAmFiEEtJtS4NS/f5DabHMjiNInhueUn20FAmHm1swC
 GwwFCQPCZwAACgkQiNInhueUn23QwgwAuLixohLN0Xmue5rAMM0d9/I/w+z2WXeVzhMFBo+D
 OE8mv53e1GplAf540PGhws4AzZ8crvvr+/hARJXiEnZZgaaXLK4IF3y2F9hrsD0+C0k6BFGC
 ksDmaDRmmXmJYdXiPk0MN0L0XNs3X6GfkoNa8b5JDSj7mj9TFLD+TqqOTtLqSc5sxC5Il6yp
 vghJqvpETo9g2dVLNL6474SyP8xplokSVl52rlfEUD1HkAzRQIVhko1+uhXXo0zYrZyFbFL6
 ZZzxRIae6NfhZM7FN42A4ZIyZWrEQAUnw0zV1OUNOY/hhlpo7M8XoxRwdSe1wMuUuM4jRY07
 4RdcMteXobRAj8HCZTLQ+SMRBY8Yivf5P4RbB5fU529jeyRc5moG7LJcZdnHIE2yAXuSgOle
 0kaqHKNoY93EmcP9JjlJU/er9V/Fiwxvw/4FCgJWYmCzixVnnJXFBsOlPnTSy5nryM6lW2qF
 gzn7ZvFgzjgWGXdfZ/hwHhehs0fOiJpS5L/mWETf
In-Reply-To: <da7a86ba-7f74-41bb-9540-76f4530ac7ac@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/1/23 20:14, Julien Grall wrote:
>
> So I agree that if we were to remove -Wdeclaration-after-statement 
> then we should also update the CODING_STYLE. However, I am not 
> entirely sure I would want to mix code and declaration in the hypervisor.
>
> Anyway, I think this is a separate discussion from resolving the 
> immediate problem (i.e. building the python bindings).
>
> So for now, I think it would make sense to push the 
> -Wdeclaration-after-statement to the tools.
>
> @Alexander, are you going to send a new version? If not, I would be 
> happy to do it.

Please do it, as in the meantime, my attention has focused entirely 
elsewhere, so I'd have to switch context and find time to study the xen 
source. I don't have specific interest in xen, the reason I looked into 
it is that we're updating python to 3.12 in yocto and this one was one 
of the many issues that came up all over the userspace stack.


-- 
Alexander Kanavin
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 39; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen |
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700
806 | Geschäftsführer (Managing Directors): Heinz Egger, Thomas Gleixner,
Sharon Heck, Yulia Beck, Tiffany Silva


