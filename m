Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2cVHD1H1F2ofXggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B85EE1B6
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320981.1588024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbB-00088s-BF; Thu, 28 May 2026 07:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320981.1588024; Thu, 28 May 2026 07:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbB-00087Q-7h; Thu, 28 May 2026 07:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1320981;
 Thu, 28 May 2026 07:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSVb9-000878-6n
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 07:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSVb8-00HB53-Bc
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 09:56:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f514-bab6-0a2a0a5309dd-0a2a4505ca38-24
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:10 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f51a-aaa8-0a2a45050019-d155dd2bc037-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:10 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso127298f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:56:10 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b2ba9sm11540146f8f.31.2026.05.28.00.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 00:56:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954970; x=1780559770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+AG9nJM4PtWcQtYWeySSP2px0OjUlVQOK2Bw4Cwn90=;
        b=GJrUCn6Y9OIKYxSxbXkQw7NEsHtAz0QIgu5X81L0uyfxlODnNmBirvdkZmLF5W2fKD
         ECcoq7knRYpgtt2mCXldjgWanLAFYedOWMUvHTkzUhlhLcTD64SfnKP4WNheS3t5TENR
         Xx+ereKGV2R8KuKqRoVGzXL835lpfNdmmMrEu4z4iEWOcR3vcv6GCA+rfXMTWM4HMb+V
         NoAbH7PMMA/CsdSbYGBpY/Uqwa0RlMg/XtNJ+0DHiiq+f/tzOmhKEHwRkLnU6ZdV0lRJ
         0CLl48C4/t02IptAig1xV+CsxVJyahAu3ul8dqYHH/a16zuWi+hnwrDItncP0ceovm8n
         SmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954970; x=1780559770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+AG9nJM4PtWcQtYWeySSP2px0OjUlVQOK2Bw4Cwn90=;
        b=HyJudowsdELtliYSY5epgP5PvPzHFq6hYw/z4aXB2RqonbQ0c5D/+Fl088Tr4R+4Rv
         g4BnTM636qKcLjIZfkEDw1iq4tIDy1v2vV3i2CLHPlCxGHzk7+aM28Xy9ZgfYsKUhyFb
         5zlaj3cF13uVv8e+NH9G+99iBG1auRC0dM5aQBtJFrl8d+BbYRVo+xHaWd+80XpElQ6s
         gFTGGBsw43a9eOPnFlZzHhDdCrjVgxPA/HzZhtiSwkqL/z7hcqqzXE9+e0Dqx5JgOHMM
         eNXydonRtEn4mnMPljJaet2BI+6/+i/5fq/8TgLu9+oFdnlYeiqoGGml84vBsu3dAlgr
         W9bQ==
X-Gm-Message-State: AOJu0Yx/xt8m4CCkgJ/iktE5RRK3F/zZ/8VpUsn3dqCDvuT6nc5VD4L8
	F0VfsWuCWvbDabfmjXIntBtg/e7ijaS4v52h/hg59l58eILnsg9eHdBgVwBVqWqp
X-Gm-Gg: Acq92OF32ce6qLcza0QHc61C5XugukQx4TwLv8N1EHzvh1gUfYFKam6dw3qlz3lKbtx
	W3z4xNcOEixoMF2LNVjqPntApCiyUCSqz/vW1V3trc8wTtOcyO3wDGodNv+g3PES51i+41wIeSo
	ultn1aiGHCQueMYK3i72c1A9SPOr9RwqVYVXVkEd7CkgCEIbj2ueXQpuEjmfMVSSu7wZovjFL/O
	ZH6kOXzFxcAKKk7+24SSLchvxyP8cdeoxVN/888snbgTlXUbVUfKH00WxFmcERgykTh/r6snOSk
	k/Eeh8xjmQKXDto+lngjNTLXEqpcLRo+vcBeLnmjuDYSlltTn0zKxOR7WnhEREt6QvYOjKovT2Z
	FKlEjr3MkYL9Rm8FVn42lCPaxOfmxao+VKEb5s/hKBl/IYSDocB4duSetCuY8meMQ2YmiL1RZmL
	Uywld6R4bkzRKdz/HW9dsI/YnbP8HVGXGivx5eKDZSAZ2w+HlXMTep+UG6MYKPJ8NjTfYLYnRgP
	YMcwmTwA6CO29/0f2UxAq9mnqzFlw4OmBF1DTl67kFkbtI=
X-Received: by 2002:a05:6000:2408:b0:45e:941e:77b3 with SMTP id ffacd0b85a97d-45eb38c9299mr46072070f8f.41.1779954969404;
        Thu, 28 May 2026 00:56:09 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] public/xen.h: Update mmu_update comment
Date: Thu, 28 May 2026 08:55:33 +0100
Message-ID: <20260528075539.10209-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779954970-D3961443-B84A6C4A/0/0
X-purgate-type: clean
X-purgate-size: 249
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C7B85EE1B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Frediano Ziglio (2):
  public/xen.h: Update page table layout comments
  public/xen.h: Update comment for mmu_update hypercall

 xen/include/public/xen.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.0


