Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDB1D471C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 09:32:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZUp4-0004nN-D7; Fri, 15 May 2020 07:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuqU=65=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jZUp2-0004nG-Tz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 07:31:57 +0000
X-Inumbo-ID: 275c6c50-967e-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 275c6c50-967e-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 07:31:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l11so2346518wru.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=/ocs+7WMPCtyzKVNdpdsTSb8gG4Snmg5kN30V0JBJbQ=;
 b=V6qEgp90ePw1B50KWWo6COzF6yzRerkU92PgWtNWF3kg/gJfhxbEBJnYyoUfrjB0AQ
 37aHM7pPaOuI1LTQdFZ+UhI9Fej8+c7GtMcgtDBKDffOe0XfvvBxPVLyuriMvm8xwvM6
 K/dgisBU8EWDYabUYnxPbIS6Ol9xsGGOe27YnkrP/T16pC1dQvDkOC0I89oLBSZnPnbm
 ylnOvm8YSavEF8zKDE3wjLN1iwEvUdScf4kZlM5IQxzhUE+rVkbINtaVt5xu9gWrBAl0
 jbbNOkVWv1Ztv+WfXTNKi+8DPkF2+NlxI5vOv6ZoNxRAKkgUBa3TOPaQoGy1Wmvbz7hZ
 iPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=/ocs+7WMPCtyzKVNdpdsTSb8gG4Snmg5kN30V0JBJbQ=;
 b=Hc4ZTaytj2XlQI6u32ZHxu3puwY3HzrBpImmquHHSG0xGl4U1H1df9W0jatumchtab
 9bsFWE5ZtV5JU5k5nVlH6tXT7AFNWBVPeHWQl/cTU+TolcKNyOpJsJ2SRRL8YpaMJG4X
 JQa8XJ9K5UudvLdHZ3bolTvtR1T9pZj0iXyAnpCMDJRIyDBUbpzE2lWOOR3yxtHSqlh7
 2UWxnME2F/gVIkI+AzmO2KWTD672ykyyk/g1gtIL4v4LyVubzDVkXFVZn8iaeIZDsFaI
 8OpQ6bGB50luSzx2kt/TKrFfsmyTOsqjmVQFp9w16/kZ3s/UM236Z/W4hlKFNN+ClO9b
 xgqQ==
X-Gm-Message-State: AOAM531hsvCoeSlMxBDJSYTr9Ell/vyPTijonN7LdW0LsRDg9cG41DhT
 bkCb400mJEe9mMz5UIUZ735tq3eIz+E=
X-Google-Smtp-Source: ABdhPJyVjx/izG32NLb+bmufgR4UDTfLXLTml4kWosa9iU6s15Uhqm94PyoGScTGS1tlFMMp04VjVA==
X-Received: by 2002:adf:e703:: with SMTP id c3mr2800851wrm.252.1589527915294; 
 Fri, 15 May 2020 00:31:55 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id x17sm2177434wrp.71.2020.05.15.00.31.54
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 May 2020 00:31:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Subject: Cut-off date for Xen 4.14 is May 22nd
Date: Fri, 15 May 2020 08:31:53 +0100
Message-ID: <002701d62a8a$e86c8d90$b945a8b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdYqirHDK/Nw4wzWS4qg4/nhX6yO9w==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

*** ONE WEEK TO GO ***

Hi all,

The cut-off date for Xen 4.14 is Friday May 22nd. If you want your features to be
included for the release, please make sure they are committed by that date.

  Paul Durrant


