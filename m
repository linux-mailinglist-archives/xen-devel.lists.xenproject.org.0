Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB7C1C9035
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 16:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWhku-0001im-Gg; Thu, 07 May 2020 14:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pIK=6V=amazon.com=prvs=389e06f2e=jgrall@srs-us1.protection.inumbo.net>)
 id 1jWhkt-0001ig-0C
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 14:44:07 +0000
X-Inumbo-ID: 33fd2fac-9071-11ea-9887-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33fd2fac-9071-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1588862647; x=1620398647;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=b4jvw6bVDJC92arf13SnRUtWEV9x0v/aLL5pNKXnqms=;
 b=Wd11rcaIeTPyWY4HMvuadkfh+gkbH8E3Kg13V62LHzx3Wv5zdUD7w4Wb
 5qizHO8Ti6ENP0Aw5w45P2PH55SY6GpK9/bed6/oaEaQBW7a8ggx5FJP4
 edPQd3PQEv6ko1FJlOpUqToHnAeJKjX5ue6t6tR3atYDjlKIJbs8X9Iud Q=;
IronPort-SDR: kG6Ge/Fjn4Tu/K62QgCu76tKJa5rCmY2MU8AJ62krU1Vn9TrEjg7nWjrhTCPgSMJigCwoShHVb
 sW8JS3d3XNGQ==
X-IronPort-AV: E=Sophos;i="5.73,364,1583193600"; d="scan'208";a="29094016"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 07 May 2020 14:43:54 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 673ECA2399; Thu,  7 May 2020 14:43:53 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 7 May 2020 14:43:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 7 May 2020 14:43:50 +0000
Received: from a483e7b01a66.ant.amazon.com (10.85.91.252) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 7 May 2020 14:43:49 +0000
To: "committers@xenproject.org" <committers@xenproject.org>
From: Julien Grall <jgrall@amazon.com>
Subject: Xen Coding style
Message-ID: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
Date: Thu, 7 May 2020 15:43:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Woodhouse, David" <dwmw@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

This was originally discussed during the last community call.

A major part of the comments during review is related to coding style 
issues. This can lead to frustration from the contributor as the current 
CODING_STYLE is quite light and the choice often down to a matter of 
taste from the maintainers.

In the past, Lars tried to address the problem by introducing a coding 
style checker (see [1] and [2]). However, the work came to stop because 
we couldn't agree on what is Xen coding style.

I would like to suggest a different approach. Rather than trying to 
agree on all the rules one by one, I propose to have a vote on different 
coding styles and pick the preferred one.

The list of coding styles would come from the community. It could be 
coding styles already used in the open source community or new coding 
styles (for instance a contributor could write down his/her 
understanding of Xen Coding Style).

Are the committers happy with this appraoch? If so, I could send a 
formal call for coding style?

Cheers,

[1] <20190718144317.23307-1-tamas@tklengyel.com>
[2] <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>

