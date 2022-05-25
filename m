Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA584533811
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336977.561453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm98-00075P-Qi; Wed, 25 May 2022 08:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336977.561453; Wed, 25 May 2022 08:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm98-00072Z-Ls; Wed, 25 May 2022 08:13:34 +0000
Received: by outflank-mailman (input) for mailman id 336977;
 Wed, 25 May 2022 08:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntm96-0006XS-Mv
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:13:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9041dd70-dc02-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:13:31 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 04:13:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN2PR03MB2384.namprd03.prod.outlook.com (2603:10b6:804:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 08:13:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 08:13:28 +0000
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
X-Inumbo-ID: 9041dd70-dc02-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653466411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8F7EfaoMWpTNFHcKmBPjZ/vxeH0S1RpTiRruL/e6XuI=;
  b=I3VcSb9weGC1vaMZDePovtTOQ6ZtVi6d5VDYgFVKooqsq26Q5aj6VWjl
   zAuoUHM4w/t1QeEOl/sDfYGEX9kigfiyGfiiyXsGta680gai9Y/ty8tuq
   Nd++r3vicsxEEqF4LCywpnTBSYlIdnKP2VAJMzPeD1AF3x3T+ucZVwEmn
   A=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 72524846
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Ay8EqvDwx6n5ip6Qzbj3d43Z+fnVCJfMUV32f8akzHdYApBsoF/q
 tZmKTuEOf2CYzP1f95xPou39k4P7MXdx4dgTQo6pX81EStG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi92GqrJw7o3fSUGTSZ7B5MYp+7iIyKW5Jn7I03uKxMAwt1IJWRvZMgy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5v3aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3P+PBrszSNpOB3+LrmF+rrYv26fOt2t2udj
 0DI70inByhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUHBBqlz6PV50OTADgCRzsYMdg+7pZpHnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:PYK6yKsqmZF4n5WVfE4BMqud7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72524846"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdCTcHnhrys4QppJRE05fjAi4Vb3Hr4iSZ21awdJoz60fzthZrnoJz8nTsbmsyu2m/veezDGm0Um0mx/ctgSo6pyfcxbicHybxn4NxnxRPvpz82r4j+vT+RXCFHxkgCF+1DCim3ViYxisgmFW6Yz/0H8ct2wxGjyLjaRAD3NuK8MmF4srvFKVjo0rX4mw1Yd2C11IijtGSDyqlNOLsALO1o/e87M9s+M1TJf3xhLFDQ6A4uHjTFBBd3s+hwAGWzEcDisVRGy04i5tKSeqUMnuTqh0BXNvHFHZWL31ezGD86OY6EtySlT25ZkbTJ4akwmwKI+AFt3x5cfIOrU4L2IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuFt592UrrbYEvjJPFgpDXuLgHLJ3o7mGGCCs3x5yqg=;
 b=AaGuv3qoijmUAvXzxRFD8MJi1ekeGChpTXQdxiPd33iPRh8ddhO/dWp2A1zgIUim1vkny+lUOBvtYVan05CXT0BBQz4t9q7WVGkYVJQ7owvw2yE0sDWHkRzojI74baysYhkfWCreuF/TDlojinPOu7Hh0Q8j7chpbGRAwQIkKAJpEg283fIl4xMeZO11Gymt1ZN1RJwtuBPf7Lp0IMBcr7sAdWNQa6M1yicYwwRYxhLC9p2XUpiPESK/XFLIadDHLHzMI657ZOOvT70hbDHM0jOfQtDLFGAeurPioSlGYQ1HUIhnRhCVtB7kdXXwT86pnlSR5jUw2i2/ImgzRfusjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuFt592UrrbYEvjJPFgpDXuLgHLJ3o7mGGCCs3x5yqg=;
 b=a9PFeflKCZUswGNDiwe2mS2MXBY976k6ayVUhIO82DAq/vJPD/rR/DOvNTPqXeRsocMcNT4RPTRlLBLW5GBQv9pMOwKIYjqvCH/YzGIJqV2BHxkHA/a6fWbg/7KITfZAEhECYkyQGnXj8JVdtK5UNSpfhxuzedeDxak7mGVJbOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] x86/flushtlb: remove flush_area check on system state
Date: Wed, 25 May 2022 10:13:11 +0200
Message-Id: <20220525081311.13416-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220525081311.13416-1-roger.pau@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b8d78e-8596-4c36-6a85-08da3e2672a1
X-MS-TrafficTypeDiagnostic: SN2PR03MB2384:EE_
X-Microsoft-Antispam-PRVS:
	<SN2PR03MB2384E257696C2474EDC03AFD8FD69@SN2PR03MB2384.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5z9g20HgFkjv5Ki2FLNo+Cjodi08bd77CofPYM9HRIursp6yichgLPAdTVF6awbNSWZ/0McWl6Q2iex59c9CdF2szeEAJXlDVtSXDWEgquaNtkfGQZYX663dS/znvGEt0gA6jAiktLLUwzYWouC2FIdqV7YbGxbBcZ8Xckf8cuLaPif6lJSOtbb4rjgptKfFfAZBLwS3wqnj9ogjkxiUXZj7OvRENu/VbYXFdrbKOwDPs1rwxV4Ti2qGaTSz/cn0SmDkQF0nhHiFlC+MA2z9wQTdf38Y0nb0dc2VCutOs2Y/GcKnyozKtKlOG+IP6IcTW9ezMXB/Zu+B9tYfPcm9OMby6I5mOPhlxiuysbfYCLQembR28EMv6eblxam4lZTfJu9UKolg5ZmNDyLBQmfNl24vmCCJfzL0z75QmT4ziGiiSh1yRZkLSohYdFJBUgREHhDY9GMv9NcdxOguRLwKZ0sr0535JidQoiuAnlkHVpgZvUBW9zXOlHYi4oKWgl6LWwngH/D8mwkgbH5YKVhcUxh7C4Wl/ydryA/163WZwJyZrS25gfq/8AKrxHqMeX5SR1TyNn6ld0Kxhc1tvky/Or6ejPehVHMm4zMWbjZh5aDe6LcQamuahgBtz5BJO0rgjx2nrR2axCQNVB/NTAeY8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(6506007)(4326008)(26005)(6512007)(8676002)(82960400001)(86362001)(5660300002)(508600001)(83380400001)(8936002)(6486002)(1076003)(2906002)(38100700002)(316002)(2616005)(6666004)(36756003)(186003)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1lnZmJnWi93UzJ4bjZyYlpQV3dKSlpEMWgvSDdPOEhTT0JUbG9GWGFQWnVV?=
 =?utf-8?B?T0tBQlVkcTUvSGxyM0N4emNES240VE1XaVdRQmwrWi9WSGZacWhPMXU4NkFl?=
 =?utf-8?B?a1k4UkEzUm9DRmpVTWZqcTdrM2R3TlQ0WkNoQkhnc1J2VC9xYUxtZWFKcWRq?=
 =?utf-8?B?QzdUc3RucXNORzAxOWp2Z0loeXRiYnVvU2t5S25XT2tvRDkyUXNCWGhxVS9T?=
 =?utf-8?B?VFZVbi9HMHdoY1lXcmlNdFJGZEJvaUJFWktUcWl2cUJtMllWMjlkWDZJdXQw?=
 =?utf-8?B?SDU2ZjluOTdrMGVPejhKQ3psRnY4ckx5aXJTbzNqeWQxZnQ2ekhRYnRyU2Jr?=
 =?utf-8?B?U2NKbXVDZ0g2VTB3R3BDTUE2VXdIRWdGMlFtWm41RmREYVpUNHRnK21kMWFB?=
 =?utf-8?B?YVZ3RHBzR3dvZnhxS21qN3hnYUJrd1ZKWitmbExWeWxjMDBaOER2YzR6dzVE?=
 =?utf-8?B?aTNnaTZFeVlCcm1Ra21yMGNPMlhVeHBMdEhML2xSelZxTFhFbGF2UE1pODZ6?=
 =?utf-8?B?dkdHRkxGT3Q5ZjNPNFlnV2Z3clNiajhDME81di9NdDEyRkdoUjdzajNOQ2RW?=
 =?utf-8?B?Q3M4MW9ZL3lrckVsUy81KzhnWThOZVNKV051THM4VXdqN3JuT0Y1YzdTMnB0?=
 =?utf-8?B?eVZmOWRwWGhVK0NWVGJnRUN6dUl4ZmIyekkrOW1lNmhCNUdvclpFT05WZmFK?=
 =?utf-8?B?UzdXckxrbExhWmZWbWttV0V6N1Y3Tm1MOVY1NHc2KzZNQWJsYXlXVXIxeEk4?=
 =?utf-8?B?SXZDenE1ZGtiK3Z5eG9FMEpkd1lxa09xS3FaL1hIeUxLY1c4YlRJcU9PUDdH?=
 =?utf-8?B?bFdKalkzZG1ySU53MjM5UytkQjVkZDN5YnZ2Kzk3ZGRLMEI5RmNkaS9XKzVJ?=
 =?utf-8?B?RXlTMkdLWmNrQ0hXcG9IekRpbWxCTGkrVDI1TnpscDRZUTBJOU1nVW5HblVK?=
 =?utf-8?B?VVhQS25CajZuZXJaeHBWQ2RJQnA2ektLZWdYRHMxTGFtL0ZRWGZXMloweE4x?=
 =?utf-8?B?ZnBRREFxQzJwanYxY0VTd2NGdGtpQXEyVVN6akhBN3N6MU1nemdSTlpNWEJo?=
 =?utf-8?B?akcxdHloYk9xdk5vV1V5RnBhZWNRSlFQOWNuR1JRbWdsVHpmeFhrMjFLVzdO?=
 =?utf-8?B?K1dRTGlndER2d1lMK3dzaHphazNmQlNHZEM1S3ZSdGdsU2dNcFl4T2N1TldY?=
 =?utf-8?B?NEorU3llay84dnZvLzhYZVR6aTFSM2JZMVUvcjBkSXlINncyTS9ieFFsY3ZV?=
 =?utf-8?B?dTAwOXVNa3RVM01NK2RXUHgyQXpjdE9pUmVEZVlwN1RKU3NzdnRtV04vcTBS?=
 =?utf-8?B?ZVRJRmkxbUp6Q3hyZ3lybFhrSVdMei9ES01FNTU1aGRMbHBjWW85YlpVbmEx?=
 =?utf-8?B?d25zdkQyQUJPSDlySS9HdXhUSkVqVUlBQU1nc0dOTEI1Z2ZCakNTQjdlNjZy?=
 =?utf-8?B?c1lrMWllMkViazBrekxjVmdYdTQ3UWp1MHlhQXUzWU1kenJmUStEM2NoZWh3?=
 =?utf-8?B?RTMxV0s2THpXcEJXK240TXgrTVJKeVNXV2VoZWpTUW5PaW9sK3JrcTJXYzc1?=
 =?utf-8?B?aGx3MlN5TTJ1ZjB2cFRwYzE1ZWlNcDAwOTU3VnZ6eUYyTndPZ3NCWkNaTHNn?=
 =?utf-8?B?K3ZYb1d5TTVPUXgzLzRLaC9XQmY1TzFSZGxNZWVOZHAzQU15WjI0bmg2MlE0?=
 =?utf-8?B?eTBkdnh6NE52WHViRE5nSXRybnFMTGVkOVRpcmJLbGpuOTNhRVg0ZlkxV25U?=
 =?utf-8?B?VDEyWFpJcVhla3phcC92OUlDaU5iTFdRUU51YWxiN1lvQjhhbE9LZXphYW54?=
 =?utf-8?B?UEVxRGxrTmx2VjNWL3NsT0ZhNFhhNzBia0U5MExLTXh5UklORzhBQU5tekY5?=
 =?utf-8?B?aHFHZnJHSmtCR05kL1Y3ZThzVC9CcTFUOTBtMUZCZ3VlOVROeHF4R1h2VDFZ?=
 =?utf-8?B?MkIwa3RUY0ZZZ282SjVmU0xxTFI1ZS92QnlSVnFiK1pUYU93dm05RUNvMjJW?=
 =?utf-8?B?YXRtT3FpcnZZVnZKRjlTOFMvTGV6dFZHNUFoTXBaNFczTm1PZTY5b0hMVUdu?=
 =?utf-8?B?VkJnZytJUzAwMHBnTXpNU3IvVU5rTks3ek1HT1JvalRhQ0MyTkZhejcrVC8w?=
 =?utf-8?B?elZnY3lxeDZCY2pCQzcvVGNzcmlQdmJySDNJN0VMdmdKS0JsOWVSd2oxK1hy?=
 =?utf-8?B?Y1BBeEhoL240OWUvOTNXTGQ5eFB4aVcwM0xFOG16NDd1U1Q5SkxDVGkwczlv?=
 =?utf-8?B?eVRqd1lIRk9idUY2VlgrenQ0Z0V2OUE0Qi84Sjl0RXhNS0xhZG9BY0xSSjR0?=
 =?utf-8?B?QUhrOFJmemtuZjRtMGNkRTcxbWpUT3lORE93cEloc0dKSmJ1U1VlRXdXaW9X?=
 =?utf-8?Q?1dogFr/1mQrwbgSY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b8d78e-8596-4c36-6a85-08da3e2672a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:13:28.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61YIBSJK7dWjfKR3+7YDhdrKu9OgCa3HPi9L8HxLZKwWU0ELIA/h1EfsuBfNrkYlul2EgaEME86bWHdT8FxF6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2384

Booting with Shadow Stacks leads to the following assert on a debug
hypervisor:

Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
CPU:    0
RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
[...]
Xen call trace:
   [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
   [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
   [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
   [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
   [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
   [<ffff82d040203344>] F __high_start+0x94/0xa0

This is due to SYS_STATE_smp_boot being set before calling
alternative_branches(), and the flush in modify_xen_mappings() then
using flush_area_all() with interrupts disabled.  Note that
alternative_branches() is called before APs are started, so the flush
must be a local one (and indeed the cpumask passed to
flush_area_mask() just contains one CPU).

Take the opportunity to simplify a bit the logic and make flush_area()
an alias of flush_area_all() in mm.c, taking into account that
cpu_online_map just contains the BSP before APs are started.  This
requires widening the assert in flush_area_mask() to allow being
called with interrupts disabled as long as it's strictly a local only
flush.

The overall result is that a conditional can be removed from
flush_area().

While there also introduce an ASSERT to check that a vCPU state flush
is not issued for the local CPU only.

Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to local only')
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix commit message.
 - Keep flush_area() in mm.c and reduce code churn.

Changes since v1:
 - Add an extra assert.
 - Rename flush_area() to flush_area_all().
---
 xen/arch/x86/mm.c  | 9 ++-------
 xen/arch/x86/smp.c | 5 ++++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bbb834c3fb..038f71ecf4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5070,13 +5070,8 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
 #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
 
-/*
- * map_pages_to_xen() can be called early in boot before any other
- * CPUs are online. Use flush_area_local() in this case.
- */
-#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
-                         flush_area_local((const void *)v, f) : \
-                         flush_area_all((const void *)v, f))
+/* flush_area_all() can be used prior to any other CPU being online.  */
+#define flush_area(v, f) flush_area_all((const void *)v, f)
 
 #define L3T_INIT(page) (page) = ZERO_BLOCK_PTR
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 0a02086966..b42603c351 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
 {
     unsigned int cpu = smp_processor_id();
 
-    ASSERT(local_irq_is_enabled());
+    /* Local flushes can be performed with interrupts disabled. */
+    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu)));
+    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
+    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));
 
     if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
          cpumask_test_cpu(cpu, mask) )
-- 
2.36.0


