Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DE70632E
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 10:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535824.833856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzCik-00024N-H8; Wed, 17 May 2023 08:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535824.833856; Wed, 17 May 2023 08:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzCik-00022Q-81; Wed, 17 May 2023 08:41:18 +0000
Received: by outflank-mailman (input) for mailman id 535824;
 Wed, 17 May 2023 08:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUit=BG=citrix.com=prvs=494f6562e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzCii-00022E-2v
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 08:41:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93357330-f48e-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 10:41:12 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2023 04:41:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6064.namprd03.prod.outlook.com (2603:10b6:5:393::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 08:41:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 08:41:03 +0000
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
X-Inumbo-ID: 93357330-f48e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684312872;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=r2q0Q52rFzTToN7ZOZhpSLgYL+DI1ss7GQEjLHq7fC0=;
  b=NDFTU1OWyLAeH9fETC0YvEVA9bHMrFdsieXuUblID1b/2l/cONBGM6zH
   gpQmSDc6Gz6oaVmTPvMcWW2Poa90m1c+7VkySYV/tU0hDbeaBjatyMQRM
   IkV2fUuoBGBHsk7B00qdasLRi68IR6qA+Vu2NpeEzCj4sIUb9HJAN6udL
   4=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 108093322
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EkKTmqBKzfKC8hVW/8niw5YqxClBgxIJ4kV8jS/XYbTApDl312NRz
 WtLXT+AOK2Na2L1eNp2OtuyphsDuJ7Sy9ExQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6spnPGZ37
 NoiGGpWMCyGoMeVwIqXVbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDe7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiL017SUx3mTtIQ6HbKH0MRLrQyvhXFLMxYWTkOaq+uysxvrMz5YA
 wlOksY0loAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQc0QA0E6p/ZqY4yhx7GTdF+OKewgpv+HjSY6
 yuWoSY3gbJVltIC3ai/+VHBghqlo5SPRQkwjjg7RUqg5wJ9IYKgOYqh7AGB6e4addnGCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:qL9xUq0wbrtXwAYMdwEKFAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:XamwWWPMOkM5FO5DSAV3yUktA+YfQieGkkvVBGqbCV5FV+jA
X-Talos-MUID: 9a23:a9VaewrASJBhrl/nsbcezzhtC+FSwon/NAMQya4Nu9KcFCZiMA7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,281,1677560400"; 
   d="scan'208";a="108093322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpVbJ9XDUXwTk1ErFUhVvLy/X60tfFhei1V8ppc7paEAc4Evk9dbUPUzI9LqRyDxTVlGQGZRA+Al3KYcVfDur9HCDUnr+DOFsWrNfWZNEdDQXBvFZZg99E2pg3evP8T0Wvc4LKmN9IEqYzK7RZcJb5BHLY5QAtfl8K30Uko1Cy7w3xG26aIYyKTjySTLvjBO0MWAmEadh8//BFPhB2YtoXDe2R7D4W4FqOum4/SbXgFlMzevFs+qR6aY6W9ohCHfGRjJnJifI57J8RlvHkkN5/ckHm4XaabCv9bhX/uz/PdK8e2697Xd0E6WEMIhny+3gXuvxiebSslDK/LLG8rrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAq9fnKH21Pz3T30qI0X/bMwHGnzIAvBXdpHc/TAM1E=;
 b=KDe6nIQG/1VasmtqESuu8wELR0bfkJtbyRQbMYRPmqt22gGGgW6AmDnAm5wjmh7mahw7tiAXhNGaO3U2cArMvZwtDMcsB/6Py7+hEbcR8r2q0p2YBTr/i6c4Ahjn2iJ3LZbay4cDZdIwp+yPgYouI5MjkuXdrcFZ7+BZZYIjKFAPv/Waqad+Lt8SC3EY3Af/MXyeDYQISURGKZybIqX94xIzsxRAC6orluKFAK4qEEMBvKRLy/yHC2/TKsXYAR44tmwL9JKb9JTuGXQKZhyxxuG4C8l+SqOsaxmezpOJDSF4Ez7TOfgOBTcopTARzWjWbzL2TyjRDXRh5arlrIlaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAq9fnKH21Pz3T30qI0X/bMwHGnzIAvBXdpHc/TAM1E=;
 b=S+7shMNwzohWKHB5pyi5Pr0SMz5yjWAn9+weLcnJ/Smt+0wbDtZO2wegz3JUf6f26K9TlZR78+l2dbG5i/trxHV4wH8ksR6H40WCF9GYzpDh8gyb5BhwQCzN+HlgX9zpmkDFh/VjOCpoLzB/ByCqUirekeLiohArYC2c62moLjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 May 2023 10:40:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGSTGIMh6qvCLZSr@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <ZGH+5OKqnjTjUr/F@Air-de-Roger>
 <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
 <ZGNLArlA0Yei4Fr0@Air-de-Roger>
 <alpine.DEB.2.22.394.2305161522480.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305161522480.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO6P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 891c1fe5-93d2-4d72-ce4b-08db56b2726f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMTusC9kUDneiAF6Q8upT7winnSCZiPwac1lNkJvcWdXU/sAX6bB8DRSqjqAzczgn2RZP/5d9m9SZ6RcBuu1QxJA0sUAlD4nZGZBT++tZ7N2/48oqKxQIQvGNwKkpoVjGhIgEQCpdrIpTY1fzTfcwhAO8SokmHnkumZmPEHT83fJFyfh8k7xuhHmNDrkY7wk9zqmkbrdxyH4EVwZl5yRD5FDoxfYUoo6EOuIV52XVBy2qnTKdgYi1OzK2eALhCJ58+Hw3ucnAHxVMbA1wp7ta3Hv7obNWFzFEZKIY4kSEUMf6fNrYqnkDaFaIG7xFIWpSluFTwdAs9h+sS2UXyQHu7V0eay3uiU+wCTfBP8btyDr+mN7Q48A06B45+80IEByKRAeuYWg7JgJjgCE2nrRpVJ04xIZOGnW6Res2slp2VRj3bM6woPaZ1HUYvYqSo3TxRMjZzX4OVxyuRtglWRjMwUzspmmJiNzKVbitg5FveXv/iibSIVvcwIi7ZT8pJXn85JXBsnaWfVI1Oi6/+3q7Q2Q7bIXlTPCpWkD/jLjCpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(5660300002)(41300700001)(2906002)(83380400001)(30864003)(85182001)(86362001)(33716001)(82960400001)(38100700002)(26005)(186003)(6512007)(6506007)(8676002)(8936002)(9686003)(66556008)(66476007)(66946007)(478600001)(6486002)(6666004)(84970400001)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldudXR6enpMbFNZc29uN0paZWZucmpuNlpGcW5iNkFOd2VYdTJ6Vmd5SjFp?=
 =?utf-8?B?NkNycVdtZiszQ1NUdU0zeHp4NmFzdUlwZHdaOHNoTit0RnFoNnNBOVRVdXk2?=
 =?utf-8?B?aXNmU3RwWW9UOEpmcmh3dVpqSktKUTZFWnRZK0c5OTBIdjdEM1Q2NDN4R1g4?=
 =?utf-8?B?eUdDWVR4c1RKdzZZallyQitXM3VrN1VSVmllZGt1R0IvYVFWNE9oSzNTbGhp?=
 =?utf-8?B?QjNhTW8xcGlNa3RJRzB5NlB4RzZCay9xS3dEMUJnaWxZZFhVZVJGQm5pNXBq?=
 =?utf-8?B?aDJmUTAyUi8rOU9uWW9oTFNDZzJLeEQycTQ3dWRpMzVDNU45R0w4RVdkQ0c0?=
 =?utf-8?B?bEJCMFRXN0hLSFp3TkxCNlA2VnZyUlNjL29qS25UL1dXNXZOM1pCTW5aNGhH?=
 =?utf-8?B?Z1VoRjM0OVVhdUVLYzRYcE0rdVZLWDFDWkg2c3ZSSlNLOEJabXJFZ0kwUHNO?=
 =?utf-8?B?a2doTDNsR1VnZ1lXcEpvVFJjbEFwRGJzTWFaVmQzQmpCalBXaW1NL1R1MDdi?=
 =?utf-8?B?aDk4R1F6Q0FFUDJTUjcvcnNWdnphNkppQkEyRXE1N2VRV0tuTmp3bUVpWWJv?=
 =?utf-8?B?TlVUVGtISW5hdGZNb25HdDZ0RVhIV0poVHRudVpLekZvS0luMStWUjBoKzVq?=
 =?utf-8?B?NXk4dVgzWGczSFBCbUxsWlZ0WDNZTk9pL1ZRcWZzYUZPNjZ5cXJ1VFkzaUtS?=
 =?utf-8?B?Z1Z1N3ZVbktIVGEzUkFaTGFBRFYrY3EzeFZkMit6QTFaVUF1WlM2UlZ2TGo4?=
 =?utf-8?B?MHhnNVdlcTJPa2lSSVo2TXkxeVF0S3U5MXdyaWZzOWxtOUF1TDFzemFlU1Bm?=
 =?utf-8?B?YXNHWEI0VG5JYTFaUEtRL3VkQm9STDEvUm1WVk1laFJiREV5dHVscWtxMzE0?=
 =?utf-8?B?em9mMjdCUlpIZk9wajR3TnoyaTBYaG80MFpheXZKVXNjRWFCaWk5UlpGSmZ4?=
 =?utf-8?B?SzhQOGpGSlBKWVEwRXdHRklXUWg5dGpoRmFORWJtWnFpNzFuYi9sU05EWXox?=
 =?utf-8?B?UEJmVzlNWjRvZXB5WStRcm1SVDMyZ0ZmK2RQNXRNcXpqajNhM29La1FnZ29r?=
 =?utf-8?B?aXhGZ2lITFdxb0ozV2tiRExiOHZrUGkvOGw2Z1RacnhKcVgwcEk5dW9TOFIy?=
 =?utf-8?B?NU9NSUF1OUpKaGZNcXZZWi9JRXNwK3BsREZkd1ZRN1dZajJ3SkhJYmFkL3Zu?=
 =?utf-8?B?K2NaVEx4SUgrRGs1WEdhU2ZJU2VQVCtqd3FBN0F2MHJkQ2VZbFdsMnRGemJi?=
 =?utf-8?B?MzJSdC9XWVd3cGJEYzNDZ3luaXJrTE0zOTgyNlpNQ0M2OUFNZ1RWWlVLaVBX?=
 =?utf-8?B?d0FIajdCdWZjcXk2MWtqWkc5STdSOUI2K1dhcjNUZnlYUGhNN2NZYjNvMFlB?=
 =?utf-8?B?VE05SHZYeTNOVGdHaCtGRFJCM211UFNhbldnVzNseXlDL0lGeXZFMEtaV3JV?=
 =?utf-8?B?anZTZXZVSjRtSnFCdUFPYUM1VHJFc2lXOXpwb2FKTjNwZlhhT2pXVHRya2RL?=
 =?utf-8?B?NjN0bnJaWU03Q1ZJVWd0QlliL0R0ZzJHWWVFSjJmY2JrRWVOVGtFTnN1RFdN?=
 =?utf-8?B?V3Btd3N5ZkNrWGQ3SXJSSFlIMTVXM09QRk5FVVBqOXNkN0U4R3MvVzYrVWZD?=
 =?utf-8?B?QXJIUm1zVVVITWZXN1JuMHM1WGdkZ3JGN3ZHalUvMEFLTHpDNW5DR29HMWVl?=
 =?utf-8?B?RU84MkgrbnRpcGZwSXd4NWdjRWdqdW81eTFYUjhqRXQ0NW9yWU85NjFxN05P?=
 =?utf-8?B?QUdpZmhUSTBQdE9tT1VTV0NORGhlY1RGT2NMOHFueTZ6MnBwVzEwaXNEOTF5?=
 =?utf-8?B?b3pRVzRiUVlhOFRCMnNDR1FIekZKMDdDZ3g1OWlvM083SldnVjNsK21kUlNQ?=
 =?utf-8?B?SmRkZm1wSTJsSlh3d3lBTFFwZ0NNOG40UGRrNldNS0dxZG55aWVJVndvQ1hJ?=
 =?utf-8?B?U0pGTTd0TkZMZzVtUkUzSlNIQ2FjT1ZKZjBOZWxoL0lzc1dlUlpyMXdNZ25p?=
 =?utf-8?B?aTdOMURHY05KSlJqRGtrMWVCUFU3d1c3OUxoNStzdTFiU2JueEt0SkduVXNv?=
 =?utf-8?B?VjlCV1FET0MwVTlRRlphalN4VXNjV2lQOEttYWViQWsxd0p4NVBmZFA5bE55?=
 =?utf-8?Q?ixuBxiyouZOQtNkKq63EDEexZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F4JKTeSpzWT0LuMnk0eceqe+cQ/elKzLOtxuBsfFPa2zsyTIWYIsg5pFy5MtPswX1uD80XDxMz1RUq4iTJvzSmRwbka4pzHcUv4DjhHrzCRiEqwkdJWd794VD08EXT/5dokdBF33tVJs7mgloASn4B5yvlWPclYv6fWORjXIMvIelfUvLPzG7q2FlxN9Xos06CJa08Ry8UjRs3W6+wmzNUV2v5hDGQyDdH6EA+F4uKTwoOIcvz4LqMhGRGsTb19MX5SVCisq9qVOg26oLdiAAsHVSfbirPhlYzSWp0rzQvu4MA5weCQh/RhS11U0JMDSy7o+BRO94oD9KOpSyCTBI8nxHhUUoiiQmQPwY5wmNtx933B5isAuYsSpBiNHz3NBFKZ4pLhIX/SWzdI8z3C26isZqK1C9k58RBCgksiycc5bgyByL8G8K0ffrUoMxZQopCcAh+TBZKYgXscvpQ7RZJ49bDL7oSGAMMJOys5cETRj0x/2ctG+fJhNi3E7NVZ5iDducQjSSPQNU8yytvehKYC3b0esjsHGDdrli1RdhmWJ35GPG2G16aQG3iqHXzx6h2TKeBjphk0g9cmXAqIU0f9AeIYhr6dj65Ud4Q10okAUWAGN8ErzMP9/PqBRQMlucjH+3CmrOfTOzi3RFveWCfpwPp5sZdbmVD6wfcBrULEe0I64dCcPkQZCWJVcDJ9AojHOjJoaczXlEA0D1pHH9L9TLiKY/M8EFU7eyb30n2zUtDW5HosaL9gyd12sazVWR8v28bD1V09o/4LRGyiG2fHdZHH/0XKSSkToFChnP3zO51kMbMw5kB+6vu6YcnuY8VvrSsayBM/FiIRTVirOnmjtdj/v890QZ6yLdmwvpqM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891c1fe5-93d2-4d72-ce4b-08db56b2726f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 08:41:03.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVmBdDN++gbX5CYQ9FN1ue9QuCYXDV5nZc2jbPkW3/IYFH6PZDapbDyy2BRkXZYLiFPdrkwkX8v2ZneZxLhGEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064

On Tue, May 16, 2023 at 04:34:09PM -0700, Stefano Stabellini wrote:
> On Tue, 16 May 2023, Roger Pau Monné wrote:
> > On Mon, May 15, 2023 at 05:11:25PM -0700, Stefano Stabellini wrote:
> > > On Mon, 15 May 2023, Roger Pau Monné wrote:
> > > > On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > > > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > 
> > > > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > > > the tables in the guest. Instead, copy the tables to Dom0.
> > > > > 
> > > > > This is a workaround.
> > > > > 
> > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > ---
> > > > > As mentioned in the cover letter, this is a RFC workaround as I don't
> > > > > know the cause of the underlying problem. I do know that this patch
> > > > > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > > > > parse ACPI tables.
> > > > 
> > > > I'm unsure how safe this is for native systems, as it's possible for
> > > > firmware to modify the data in the tables, so copying them would
> > > > break that functionality.
> > > > 
> > > > I think we need to get to the root cause that triggers this behavior
> > > > on QEMU.  Is it the table checksum that fail, or something else?  Is
> > > > there an error from Linux you could reference?
> > > 
> > > I agree with you but so far I haven't managed to find a way to the root
> > > of the issue. Here is what I know. These are the logs of a successful
> > > boot using this patch:
> > > 
> > > [   10.437488] ACPI: Early table checksum verification disabled
> > > [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> > > [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> > > [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
> > > [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> > > [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> > > [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> > > [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> > > [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> > > 
> > > 
> > > And these are the logs of the same boot (unsuccessful) without this
> > > patch:
> > > 
> > > [   10.516015] ACPI: Early table checksum verification disabled
> > > [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > > [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > [   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > [   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]
> > > 
> > > It is clearly a memory corruption around FACS but I couldn't find the
> > > reason for it. The mapping code looks correct. I hope you can suggest a
> > > way to narrow down the problem. If I could, I would suggest to apply
> > > this patch just for the QEMU PVH tests but we don't have the
> > > infrastructure for that in gitlab-ci as there is a single Xen build for
> > > all tests.
> > 
> > Would be helpful to see the memory map provided to Linux, just in case
> > we messed up and there's some overlap.
> 
> Everything looks correct. Here are some more logs:
> 
> (XEN) Xen-e820 RAM map:
> (XEN)  [0000000000000000, 000000000009fbff] (usable)
> (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> (XEN)  [0000000000100000, 000000007ffdffff] (usable)
> (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> (XEN) Microcode loading not available
> (XEN) New Xen image base address: 0x7f600000
> (XEN) System RAM: 2047MB (2096636kB)
> (XEN) ACPI: RSDP 000F58D0, 0014 (r0 BOCHS )
> (XEN) ACPI: RSDT 7FFE1B21, 0034 (r1 BOCHS  BXPC            1 BXPC        1)
> (XEN) ACPI: FACP 7FFE19CD, 0074 (r1 BOCHS  BXPC            1 BXPC        1)
> (XEN) ACPI: DSDT 7FFE0040, 198D (r1 BOCHS  BXPC            1 BXPC        1)
> (XEN) ACPI: FACS 7FFE0000, 0040
> (XEN) ACPI: APIC 7FFE1A41, 0080 (r1 BOCHS  BXPC            1 BXPC        1)
> (XEN) ACPI: HPET 7FFE1AC1, 0038 (r1 BOCHS  BXPC            1 BXPC        1)
> (XEN) ACPI: WAET 7FFE1AF9, 0028 (r1 BOCHS  BXPC            1 BXPC        1)
> [...]
> (XEN) Dom0 memory map:
> (XEN)  [0000000000000000, 000000000009efff] (usable)
> (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> (XEN)  [0000000000100000, 0000000040060f1d] (usable)
> (XEN)  [0000000040060f1e, 0000000040060fa7] (ACPI data)
> (XEN)  [0000000040061000, 000000007ffdffff] (unusable)
> (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> [...]
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000040060f1d] usable
> [    0.000000] BIOS-e820: [mem 0x0000000040060f1e-0x0000000040060fa7] ACPI data
> [    0.000000] BIOS-e820: [mem 0x0000000040061000-0x000000007ffdffff] unusable
> [    0.000000] BIOS-e820: [mem 0x000000007ffe0000-0x000000007fffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> [...]
> [   10.102427] ACPI: Early table checksum verification disabled
> [   10.104455] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> [   10.106250] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [   10.109549] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [   10.115173] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> [   10.116054] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.116182] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> 
> 
> 
> > It seems like some of the XSDT entries (the FADT one) is corrupt?
> > 
> > Could you maybe add some debug to the Xen-crafted XSDT placement.
> 
> I added a printk just after:
> 
>   xsdt->table_offset_entry[j++] = tables[i].address;
> 
> And it printed only once:
> 
>   (XEN) DEBUG pvh_setup_acpi_xsdt 1000 name=FACP address=7ffe19cd
> 
> That actually matches the address read by Linux:
> 
>   [   10.175448] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> 
> So the address seems correct. It is the content of the FADT/FACP table
> that is corrupted.
> 
> I wrote the following function in Xen:
> 
> static void check(void)
> {
>     unsigned long addr = 0x7ffe19cd;
>     struct acpi_table_fadt *fadt;
>     fadt = acpi_os_map_memory(addr, sizeof(*fadt));
>     printk("DEBUG %s %d s=%s\n",__func__,__LINE__,fadt->header.signature);
>     acpi_os_unmap_memory(fadt, sizeof(*fadt));
> }
> 
> It prints the right table signature at the end of pvh_setup_acpi.
> I also added a call at the top of xenmem_add_to_physmap_one, and the
> signature is still correct. Then I added a call at the beginning of
> __update_vcpu_system_time. Here is the surprise: from Xen point of view
> the table never gets corrupted. Here are the logs:
> 
> [...]
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) d0v0: upcall vector f3
> [    0.000000] Linux version 6.1.19 (root@124de7fbba7f) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT_3
> [    0.000000] Command line: console=hvc0
> [...]
> [   10.371610] ACPI: Early table checksum verification disabled
> [   10.373633] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> [   10.375548] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [   10.378732] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [   10.384188] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> [   10.385374] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.385519] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> [...]
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> (XEN) DEBUG fadt_check 1551 s=FACPt
> 
> 
> So it looks like it is a problem with the mapping itself? Xen sees the
> data correctly and Linux sees it corrupted?

It seems to me like the page is not correctly mapped, and so 1s are
returned? (same behavior as a hole).  IOW: would seem to me like MMIO
areas are not correctly handled by nested NPT? (I assume you are
running this on AMD).

Does it make a difference if you try to boot with dom0=pvh,shadow?

A couple of wild ideas.  Maybe the nested virt support that you are
using doesn't handle the UC bit in second stage page table entries?
You could to remove this in p2m_type_to_flags() (see the
p2m_mmio_direct case).

Another wild idea I have is that the emulated NPT code doesn't like
having the bits 63:52 from the PTE set to anything different than 0,
and hence only p2m_ram_rw works (p2m_mmio_direct is 5).

> 
> 
> > > If it helps to repro on your side, you can just do the following,
> > > assuming your Xen repo is in /local/repos/xen:
> > > 
> > > 
> > > cd /local/repos/xen
> > > mkdir binaries
> > > cd binaries
> > > mkdir -p dist/install/
> > > 
> > > docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
> > > cp /initrd* /local/repos/xen/binaries
> > > exit
> > > 
> > > docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
> > > cp /bzImage /local/repos/xen/binaries
> > > exit
> > > 
> > > That's it. Now you have enough pre-built binaries to repro the issue.
> > > Next you can edit automation/scripts/qemu-alpine-x86_64.sh to add
> > > 
> > >   dom0=pvh dom0_mem=1G dom0-iommu=none
> > 
> > Do you get to boot with dom0-iommu=none?  Is there also some trick
> > here in order to identity map dom0? I would expect things to not work
> > because addresses used for IO with QEMU emulated devices won't be
> > correct.
> 
> That's easy: just don't use any devices to boot. Put everything needed
> in the dom0 ramdisk. That's the configuration provided in the gitlab-ci
> script I pointed you in the previous email which uses an Alpine Linux
> ramdisk.

Doh, yes :).

Thanks, Roger.

