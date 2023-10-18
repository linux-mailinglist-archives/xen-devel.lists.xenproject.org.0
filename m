Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1E7CE23B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 18:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618717.962743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt95m-0001HW-SS; Wed, 18 Oct 2023 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618717.962743; Wed, 18 Oct 2023 16:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt95m-0001EM-Ov; Wed, 18 Oct 2023 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 618717;
 Wed, 18 Oct 2023 16:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4j4C=GA=citrix.com=prvs=648c180f0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qt95k-0001EB-4X
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 16:08:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8973adcd-6dd0-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 18:08:14 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Oct 2023 12:08:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6594.namprd03.prod.outlook.com (2603:10b6:806:1c9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 16:08:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 16:08:08 +0000
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
X-Inumbo-ID: 8973adcd-6dd0-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697645293;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ebC+wG1ZPbdqDPS5tUiT2M+u33PQOsOSxn/yfFL0K48=;
  b=HMN/sJOYknpxEKWaY9X8sHHqiO6Xj5ANx7+jBiNsszyWmp2/rDuob9YU
   /GbXcdtB7kZrloMe8s58VaFPA8E3M6+PzTPLix4nfDMqesLL2Djdvza10
   SNjyMlWSQz+hdUj0JiLxjBb+Ccn18IH5RttV88cF7SgadK2kp9JDtaT4w
   A=;
X-CSE-ConnectionGUID: ii2trKc1Sdm3Jrs4EOp7GA==
X-CSE-MsgGUID: jYHXpuitRu6uGXoG0adbyg==
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 125963607
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8MR10qNixtl/0YzvrR1hlsFynXyQoLVcMsEvi/4bfWQNrUol0TMBy
 GcaXz3VOPncZjHyLYx3O9+2pkMHvpaBn9Q3Sgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ud2W31U1
 vdBEzwINTKZnL6b56rkZcA506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjx17GUw3ukMG4UPL+J1s5ynVyP/HFNFTImUnTjqPWzm0HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcBaDEFS00Z4tDliIA1kh/LCN1kFcaIYsbdHDjxx
 3WAqnc4jrBK1coTjfzjpBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4Vulz0RhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:i+e6+azgwm5PqsbTk/nNKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWVtN9vYgBDpTntAsa9qBDnmaKdg7NhXotKNTOO0FdAR7sC0WKN+VPd8iTFh4tg6Z
 s=
X-Talos-CUID: =?us-ascii?q?9a23=3AvMi5zmo1FPi+xYh5YHttgT7mUcEkKGHH73yJGEO?=
 =?us-ascii?q?9UkRzU+G4bkfP14oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2dDeeg9B48cBeV3V9RMfE5WQf8VZw5S2FUERq4h?=
 =?us-ascii?q?Ypua0MgMoMjuXnTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,235,1694750400"; 
   d="scan'208";a="125963607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdYFf1H38Ss7OGzXrSEOIU3QpFruyoUBU8ZSwKMohgtOAinSHkagc+ZsEEEtBr1pgHGYurgr47q3xntyHz6lISG7V0aSLXOvkpnne9wkZBzQ6Y+rMuSN2SEXJrI69AiOXYmV/8aZMywbRGIDOMVRHQINhWrfHOXqoB0ftLqsMirvU3d9Vr7zhFvYnl9G+vhw1JfHCJK6LfMl49eswy36DXeBPEp6Slz3cCRXMN1Ym3l9tVWGXKmmslVddZYSICLxNuzi/CIXspohc4y6mLVpg+lyUXgoHnv6mLl8y9h2LF300YpwCLkfDwEG16OyrrZ7Sxe+ys38BqQaldRfSL233g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NB+b3J380cq5NzadCk1WF4+vrWWrWFw9x7B0e3IBno=;
 b=lAPxyw08+6dSbNJHqY/ZOdBz5fKUqS7XAIChZSUblQ5oiqg8ZI1Sgd93NDz+GJOoNOEioWdFC6baNOKSWzlDZ1JSCzF/7CRK+Dq8r9zxnBjOa4pckJdfJxLZWJQ6b6sVB+i+vAu2RvWEezEa9VjFWry2qRTF8sM0UibgWcevjZmI3nYS5YtlCXjTVp9JV91X5OE5Qal0da2H+Olr0kJVAh0XjxF5VJuP1OSXl7vo5tnI6bkW2LU1OcurDUJblbe/H+z06v+XUPpjvfgDkIYAl+epXysEGx23dTJ7ZCFFSDih9tGZS3AKFG9Kvfcrd28Avh0P2/Aip3baoC5YOv4khw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NB+b3J380cq5NzadCk1WF4+vrWWrWFw9x7B0e3IBno=;
 b=jUW/G4/oLh/czQTPdj828CTDEAr70AFt9vPEPC+KX2BT293A1Da57/9qg05evwZFb6rryfYQNd3GbLueZKbEkc/GB+bS8s3Ot1kCeyHp/h34wVmxC9mGBYGsGWdTSy9iblxJWjKn8xjEPXQHNKhjjbz0uQZGg5n6EAsGagtujZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Date: Wed, 18 Oct 2023 18:07:33 +0200
Message-ID: <20231018160733.24655-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0626.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 6419f4c5-aa04-467c-e62e-08dbcff46ac0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D6R4D+TPAdvhTJDldRE3NyreWILUZ+ty6I1izruLbSLS5EQM7lN4pZx+WYoQEWAJgMYZ3dp3ytb05KC5Bqx9BfiR82CVWPB4eItEhg++/U+PfVALbQ+ageva2XcPAevvKzwmq+5cQKfytPZaDwyJcr1qEYZEGHfAHXTwTrPKBKe9t/qDVzw5R5KwuofQI1Nb69u/6vGRdTlkcAvxyJM8pUsKQjujynCzdNIdpsXliS+7r+ddOykTO0AmaeVEYFOZZrxXcICVhj7l+yfCFRkkqPJb7biWns0B3nKLmB7Vb/195TbL5kaLyWH/7EsVAjAiUJTSzP+BIAWVO1dGUhDhhNEQIBBj33fvpRWydYOTfgnbyzxdZK43O1tsYwaSf2d6umzoMsL+HEiKE24O/86y9tuXGIqczs5PgwAb5w2yHqzNuEwi9A18156HcU7KEB75Wn1pW+lg5Ui2ce5iT2k/anHsHADnw+BpSRav9geaxSfc/i0ZdiV2miimJniDAbN8oMmTenOVSpUAyrWyHQg8AErjAY5/5fROJY/0Lb9J6vrnNO7HbqrO0KzWj2BhK3Gx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(66946007)(6916009)(66556008)(8936002)(66476007)(4326008)(54906003)(86362001)(316002)(8676002)(5660300002)(41300700001)(6666004)(478600001)(2906002)(6486002)(6506007)(2616005)(82960400001)(1076003)(26005)(6512007)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDVFNG1qMnVYZDV2RWhVSTFUSVEvTHZGVCtMenhZaHJ4amY3NUNJeXljMWNU?=
 =?utf-8?B?bm9GR3oyZ3hDNURRUUxycEtuT3hZQWJISkx4djE2eG41eHFYdXRtbzdzblZ4?=
 =?utf-8?B?WGhqMkRvVHdUZm1LTHJ3dDU2ZDBMNEJuY1ltWi8vaERZSThHUEZjc0xNT0V4?=
 =?utf-8?B?aERGN21BNkdrUk5VYzZVbk82OHNCbVVXTkQ2RmxDNnVDbUtEWGs4djJoMk41?=
 =?utf-8?B?QnFITmNMb053UmQ5YlZqUkVBOG9nQ2lEWHVhOVJwSzl3TWoxK045K2FEZnZp?=
 =?utf-8?B?UlQwR2JQL1RSMFpGcWpaS1VHMGtzVzdZQWZKdWNUdklLOTFtN2IwcVlPZ1BP?=
 =?utf-8?B?QXNOSHgxS2l5MytlREdhYUh3Njl3UEIrVHBiZkhBU25SK3FCdE5UN0hMZEdq?=
 =?utf-8?B?RXpPbndRYmxnalIrbm9KbGc4cUxHQWxET2JpcEo1VjFXVWlNbythZ2NxK0lQ?=
 =?utf-8?B?MFNCK21IWXkxY0dSS3IyK1hNd3VLL01OdytBNm5JYVdTNlRxTDVVeXFMTHFz?=
 =?utf-8?B?d1dUajZaM3BVekVOZEtQdjN6VjVEVXIvNFhmSnpuRHdhaVpsdUNmK203aERH?=
 =?utf-8?B?UmpZTkVYSTlFOWRMbDhsenovWlhyc1BkZS9pUnd3K1lZUGE5SDEraVpSMlJa?=
 =?utf-8?B?RTJtVGxaVkgyelZ6ZG9xSldDdXZ6Mm9QOEh6K2kvVkFyOUhLcWpZT1pweEV4?=
 =?utf-8?B?UkFIZHAwWnNvRnp2alVhNnljUjBnWmx1cUNpZ2RNczhta1dUbll3WFYzZTVG?=
 =?utf-8?B?ZVFWZU5PbkViVG14d0hXVHBsVU9YSm1KaWttczBhSWRGYVNaUDcwTE0zdFFQ?=
 =?utf-8?B?blB1QnkwN0d2UjBlQjZ0ZGo5YXhWOHNhdWgzaVhQbkppUmFKYXhDbHZvRzVv?=
 =?utf-8?B?akx1ODJKWitCYTIxSFFlcnZXTE14cUJOZlJ6alB4REtxZmt2N3NWY0dteWxn?=
 =?utf-8?B?cU9tVGl4eldPazBhK3c4M1RxUlpod2hQTmFpZjdWSDRkSzN5Q1VwVy82UHlL?=
 =?utf-8?B?UWw3bStDV1pvckJvTzI5S21KUytTeERITWF6REpuOE4wZmRTK2lKakR5WWU1?=
 =?utf-8?B?dGZMeTNIc0dqY0w5a1ZyRnRkdnR4N2YyelArMG55dWZOMHZYbStvczdmN1N0?=
 =?utf-8?B?b2tId05CMXNiRGIzMlNsUVdPQWRaR09Ib1c0ajVKSmVQbHRzOWZLMExVZzU0?=
 =?utf-8?B?NndDNjJKQXp5VHZ2VmppK2NpS2Z6RVdEUVNLMmtPOHJWRkQ3K0dyTGpVTURy?=
 =?utf-8?B?UWJiK2NBaEk0ZlVjaE9VQkFvVTFXem02K0RIVGxKbWNMbEZRTG0weWFUaHJQ?=
 =?utf-8?B?RFFuazlwL0xwTzZ0LytpY3IwU0UrYkR1TkN2elVLem9XM255R0N5TW51U2Fk?=
 =?utf-8?B?QXROUURHeUs5b1pmVTdyejM5a3gwclNrWGhDT3J5aEs1azR2U1NJZnA2bita?=
 =?utf-8?B?UHhKWktEV0hqZmdFenZ2TWpodHdNWE13TEFoQisvcHlDYXVnamVvUk51b2Zh?=
 =?utf-8?B?MjNCRzRiZlQvSFZuZERrd3ZhbVpZR0FiQjR6YzFVQ2NYMTZJQ0piREtISHl2?=
 =?utf-8?B?MmZmeHY4cHNGT2h3RlppU1V1b0NUUGFCQU5icEFyVFRGUUVIckZzVTI5SXJu?=
 =?utf-8?B?aHc1VFBySGluZFlYME5NaTJxYmx3M2RmbDllMy8vZnVlTXAvU0c1U25nZTBo?=
 =?utf-8?B?SFhURmZpNUhJQlB6VVJKRzBOd3pycnBQZWlLaTRsUGZBWHFxRmw1M1JzdldL?=
 =?utf-8?B?Q1JOKzM1TnFQRTY0aUNRcGZuRk1hM2wvWkN3L2YwTURtc1VQd2pPcnl2aTd6?=
 =?utf-8?B?WHdCMDV6R2tKZ3M2Z2Q1RmVGM01yZ2JEZXdZVnFTK2l0NFIwNTJ1bU5laUVt?=
 =?utf-8?B?MzMveG5wTUdaZ09LWnZkOFhMUzVSeVpPM0xKYWlQUmVJMm1tOGYyRmxMVVcw?=
 =?utf-8?B?NVJTd0pkK2RISHBZWGdIU2IxNU5RQjMveHJ1Mlh3NXR1b3pIR3dReTUxUjgy?=
 =?utf-8?B?cmp3OW4rakxVQU8yZytNenFaNTU5N3FsV3BJREZIOFVMNTNmTHY0UTlMM09P?=
 =?utf-8?B?UWowMHQwRVFXTXVlTkJFR2dNZytML0tXU0dxeVZ3MlJXZUxOZm9Rd3lCbGIv?=
 =?utf-8?Q?YHjfuF93/bHNqVGLjV4g5eY/+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wLZnkHt67yXJZBaO75CM1oukEQdZ6NBxxTG++bNElOhifpwBp9AJWAFryZ3hpXZhp/dkM/pH8lONvtfFcw7KO/qhjRcfiCNZVy7Ixxb3JlP985A9se79qyUMoJZF3sOltUhvxvj6xIIqd9FZJCFeHdpPIHD0/nrPIPf8DZ+5XSA4vo6VVtIz146uFfpRkDyQ713k/szoBYhwCknG+ecH4E5r9iOQ1g3ZF+jNN9l1tic/aRUGrGK2dZpCD9UQF1SvRGJAcwo+pwAcv6MAHcMI4u0MLxZa4nPLm6b5IQZLMcIiB1Wr3d0hkwuzyAQUt9eI0i93mzykK1OeQW2NuWLCgWAq4IUIfIDkTnCR4mbbflwSb3Q7QMA+jw0gkRJMOVazMyZVugGSDck+X6vTDuclEw3UaV1E2KTcWPx6wIzA4b43dpRZRIGI7vXddbRtfqI47Pb99Qlliygp3RjIgGXIPLwKDNI/YGgru+xp3KzJGMS5mQ3ozhv3/HS2spP5PYryVnZu1Csq/+H8kS2RylD2Xh5b+3p437JwXXym1imzf3N6hQKSwUbh/LN6A3hQamHRr1aTyUTf1seYJsNPJJ4Pf4p8pvjCgaDHvZQm/hsTLxLcw6HfTA2zL51i32w+2kmA6Yysodi7BQVDnWH7ET2dpB/D4wK1kPLHn9vrm5eVNEppvYjsz9pvh5jYj1TWvCAxyJhi0o2ezE5x/2cWF2dh1dRmTTMq7MqkSIMjBRm8wJ46TZUNMtSxau7IBl2aYFBtv3ChWwPVQnq/4TD8Q0C1Hcbpcnto41WDUCKVadx35cMCMRXcjuHRIWhxUpzJTzfgwGj3mSJSRvIhPM/lVHqonKp/SoQyrcZHMRhYMXw5+s8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6419f4c5-aa04-467c-e62e-08dbcff46ac0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:08:07.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNFnN+QGdbowu5Odd3q+LWnjg5SZfdks63QWyaIWPaxyDOjS2WhJarIENVcHuSKawD6t+wvqiXA1AdUoJboNZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6594

SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
level page tables respectively.  According to the Intel VT-d specification, an
IOMMU can report multiple SAGAW bits being set.

Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
it's actually replacing an open coded implementation to find the last set bit.
The change forces the used AGAW to the lowest supported by the IOMMU instead of
the highest one between 1 and 2.

Restore the previous SAGAW parsing by using fls() instead of
find_first_set_bit(), in order to get the highest (supported) AGAW to be used.

However there's a caveat related to the value the AW context entry field must
be set to when using passthrough mode:

"When the Translation-type (TT) field indicates pass-through processing (10b),
this field must be programmed to indicate the largest AGAW value supported by
hardware." [0]

Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
and signal such support in SAGAW bit 3.

Enabling 5 level paging support (AGAW 3) at this point in the release is too
risky, so instead put a bodge to unconditionally disable passthough mode if
SAGAW has any bits greater than 2 set.  Ignore bit 0, it's reserved in the
specification but unlikely to have any meaning in the future.

Note the message about unhandled SAGAW bits being set is printed
unconditionally, regardless of whether passthrough mode is enabled.  This is
done in order to easily notice IOMMU implementations with not yet supported
SAGAW values.

[0] Intel VT Directed Spec Rev 4.1

Fixes: 859d11b27912 ('VT-d: prune SAGAW recognition')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Reword commit message
 - Put a bodge for SAGAW bit 3.
---
 xen/drivers/passthrough/vtd/iommu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index ceef7359e553..d2211ecc0b1b 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1327,15 +1327,24 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
 
     /* Calculate number of pagetable levels: 3 or 4. */
     sagaw = cap_sagaw(iommu->cap);
-    if ( sagaw & 6 )
-        agaw = find_first_set_bit(sagaw & 6);
-    if ( !agaw )
+    agaw = fls(sagaw & 6) - 1;
+    if ( agaw == -1 )
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
         print_iommu_regs(drhd);
         rc = -ENODEV;
         goto free;
     }
+    if ( sagaw >> 3 )
+    {
+        printk_once(XENLOG_WARNING VTDPREFIX
+                    "IOMMU: unhandled bits set in sagaw (%#x)%s\n",
+                    sagaw,
+                    iommu_hwdom_passthrough ? " disabling passthrough" : "" );
+        if ( iommu_hwdom_passthrough )
+            iommu_hwdom_passthrough = false;
+    }
+
     iommu->nr_pt_levels = agaw_to_level(agaw);
     if ( min_pt_levels > iommu->nr_pt_levels )
         min_pt_levels = iommu->nr_pt_levels;
-- 
2.42.0


