Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9521E77AB
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZyd-0001kn-2s; Fri, 29 May 2020 08:02:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz0h=7L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeZyb-0001ki-6Q
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:02:49 +0000
X-Inumbo-ID: c90e8880-a182-11ea-9947-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90e8880-a182-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 08:02:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k26so2247727wmi.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=2TvzXF49B/JE0BOcTqfEISgDEX57eQJaXw7vhxyiURo=;
 b=GKVGtidhj4ri1AbyeeEBX5ZIMDCIkmVuWRM0SCrj3ErHU8y04jEAepFeQTeXhxrjf/
 SmRQN0j4Zq0qGql5jmzPRW6/rh1Ar7AJ/LXHeBG6on3+OLdb35ztlWicNMO0dRhhLOR3
 /o/v+MsK1tdr1/iDclrRR6QTeVt+KKT1SfZc49NSTcDeq2D6GBs9+Q7EGqFR8At2u4ib
 MQlJRR23S3XQzuKB5sg0JgcPu8GZc7BaTriuWQUqWiSndeaHNahzzVqnDA/zNCDxZZHo
 g4/djfWsV9H4NzQdAW8SqGoaXoSq/xqENYD0kvBzq8qc78iARInhsLqsEJh3ubKHpZPr
 XGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=2TvzXF49B/JE0BOcTqfEISgDEX57eQJaXw7vhxyiURo=;
 b=ZqVaMN+pO9PZk8EqeinUvfWV4w6v+JfIRuaSIs/RNTy/F3Rn+2+dvcgSN2+DBNHt+D
 Xw0WjlViyLVCZ0OWztUkdMPynE5whBO+kgOZmaJ4FNjflwg4HTUW9/vHEHbgwcPxPPeo
 ETiLQy7FtVanscZBBDf3wd/QWi9xI+vRJWkmQgZiMASNYkpRdNHDj+uvEYdPS+rOTegE
 uKNQzCiWKNHLwSyiIp5ptguoeywy4e2LYQ0Bq8+1oqzKqZn89pDTbSTVle+Bds7wwQof
 O/dNJ0INMhUxxyOCJpd6R5R0A/fDiU4WVEL+TbNsFFfoMm97HnNJzid87Ut218Ctvi7t
 UB0w==
X-Gm-Message-State: AOAM530BG9Y/DMS1hbbIGwKkBWjMmO91RSCnrfrBGf0oliQQxR73rJ7W
 zZQ1FL9pfum+KN53/cADqhF/sN4kJAk=
X-Google-Smtp-Source: ABdhPJyTvFS8qoQiIQs6YaPyqEQKygCv2cl6KYBTPJ7PMsFJMcF7/xPvH3ERuOVQwzSt1aOBWmcULg==
X-Received: by 2002:a05:600c:2317:: with SMTP id
 23mr7454219wmo.139.1590739367369; 
 Fri, 29 May 2020 01:02:47 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id j135sm11216264wmj.43.2020.05.29.01.02.46
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 01:02:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Subject: *** Cut-off date for Xen 4.14 is today ***
Date: Fri, 29 May 2020 09:02:45 +0100
Message-ID: <002d01d6358f$8a10a370$9e31ea50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdY1jx5n1zlinPaDQPCRqd80uWMYcg==
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

Hi all,

This is a reminder that the cut-off date for Xen 4.14 is today (May 29th). If you want your features to be included for the release,
please make sure they are committed a.s.a.p.

  Paul Durrant


