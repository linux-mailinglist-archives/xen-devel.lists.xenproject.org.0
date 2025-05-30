Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32671AC96B4
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 22:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001522.1381644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6Wj-0000dr-Bg; Fri, 30 May 2025 20:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001522.1381644; Fri, 30 May 2025 20:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6Wj-0000cL-94; Fri, 30 May 2025 20:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1001522;
 Fri, 30 May 2025 20:40:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uL6Wh-0000cF-OJ
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 20:40:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6Wg-00ADsf-1y;
 Fri, 30 May 2025 20:40:26 +0000
Received: from [2a02:8012:3a1:0:ec4a:d3ec:7374:b46c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6Wg-009lFW-2q;
 Fri, 30 May 2025 20:40:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=BrKBbgwGEjuNACf2zpAcE9omA+b12A1mSbdhd8numiM=; b=qA2xQIXljkgVge/vAMQmpGekVi
	L9ur3+s/U7J2mArDJZ8oTYG6Lsd+lr3Kq1qPkQMh0U0VMTTjho69Kk6H3V/gvr/a7ptFvoaL08LM5
	C+MyXvBYUI9b4Cm9lM/UhrE7Xy/Su2qFOHJGBFL9vFBVNZ2yYWNvpXHuD4lMXtw8r1KY=;
Message-ID: <2d218180-4be4-4c3f-ab65-04a112141b0f@xen.org>
Date: Fri, 30 May 2025 21:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] BCM2711 reboot fix
Content-Language: en-GB
To: evgeny@contentwise.tech, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, miro@contentwise.tech
References: <1748381372906.7.62038@webmail-backend-production-66cfbfc4bc-ddzt7>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1748381372906.7.62038@webmail-backend-production-66cfbfc4bc-ddzt7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Evgeny,

Thank you for the patch. Let me start with the process,
patches are submitted inline rather than in attachment.

git-send-email commmand can do that for you.

Now regarding the patch. I understand that newer kernel
will use the new compatible. But I would assume there is
still some device-tree out using the old property. So I
think Xen needs to check both compatible.

Lastly, for the future,when mentioning we commit, we tend to use a smaller
hash (12 digits) followed by the commit title. In your case,
it would be:

b334c1afad17 ("ARM: dts: bcm2711: Use proper compatible in PM/Watchdog 
node").

Cheers,

-- 
Julien Grall


