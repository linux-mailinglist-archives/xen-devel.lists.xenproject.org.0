Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625651C34D
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322198.543435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmd2X-00025u-Uu; Thu, 05 May 2022 15:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322198.543435; Thu, 05 May 2022 15:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmd2X-00021y-RU; Thu, 05 May 2022 15:05:13 +0000
Received: by outflank-mailman (input) for mailman id 322198;
 Thu, 05 May 2022 15:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmd2W-00021q-Vz
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:05:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c18cb4ce-cc84-11ec-a406-831a346695d4;
 Thu, 05 May 2022 17:05:11 +0200 (CEST)
Received: from mail-mw2nam08lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 11:05:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2479.namprd03.prod.outlook.com (2603:10b6:300:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 5 May
 2022 15:05:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:05:03 +0000
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
X-Inumbo-ID: c18cb4ce-cc84-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651763111;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=e12+Ir6qQ2qQlWMl37aN1oefWWj0goSiQ8/7bOI7iYQ=;
  b=Yxb7KuqSsoabtm3KkM/jgngyjgqiL2VS0TklPeG0PzQy1T14cXoByi+8
   LC86vXOs8KNYxOIBRVMkfauk+F8miJizESBPdSuBMHvdPpLyBMsbm8xtl
   ZUqfFG6OBSlhxitKFmB1w/t2vMug9exsyCpARmMIqcm6V8R7n+6Mzg+Y+
   U=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 71069423
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:umcfW6lnaZ/eaPCoWZr4okDo5gydJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCGyBa/uLa2D8cth+OYuxpx5VupfVnNQyQAc6qSw1ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW17V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaAQrOYDFhsshcDJxCA9+GYZm9afaPi3q2SCT5xWun3rE5dxLVB1zGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvpkBg2pYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8QrL9PZtuAA/yiRIj6W2EcTQYOCIWPtnuGyen
 Ezmpz3mV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdx+lpH+JuDYMVtwWFPc1gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fC0Kd2kLYHdUSRNfuoa+5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:v/GCf6gYeluGtO37GnpswxOtFXBQX0d13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMjVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xQ+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYwnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxSISbeE4XiQ7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri6knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdo99RrBmc4a+d
 RVfYDhDK48SyLbU5mZhBgk/DWUZAV9Iv/cKXJy+fB80FBt7QJEJgUjtY4id0w7he0Aoql/lp
 j525tT5c9zp7ctHMRA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="71069423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enI5xvtu5mO4pavX1Lfgxp7SuwQhbDpZ9j6+P30xKoCW6V6INLAyu7bcp9fHRuduOirEw2P+pQe1eJU35h48K0Lq2qq7fbdMBYph/bvmAZLYxFG/nhbenoqI6YWH7vNMRIuCwNwllJoZ+m0I6Nj3M4LT2t5Cx3Mtav8ZSU6P1vu7qLmVi8cPcBmCHtGP7zBijV52/V5VBhUN6q/bqhREztTUkYdsUm9NmPyTV0z5OtlTfSiXx4bX31MQVBjyOX8E4vok8sFyJ5lM5+KodZdlYicPGD6DTFLS1ZJi5e0oBzuJ5s+I9OO/JdT9UKbAZwAAgh8Q5EqErqz5uW1zZgCa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sufkpVdc1PCxK+7fv5xNB4YoUCnXEg5aE0/RPgrAw1s=;
 b=d+4u1jfdRNvntJahOFcd0htvDmwTMKHvYTq216Rw3wRdHUN01XaArcqcfv1G1FMDZdgkC3RJYvP7q5xMEsKqX5vY/UqoQWGbL/mE5y8OqCGL1w3QDeXpZ/Ri6ef8Jk0OPNmp89FuK+HQZnMVPu3Em1UYQdiodzWP2hHA9NdIKNHKDgOeGjX7k/FzZnr/794jJ32XiCCjZtHtrE1T4xrsoXLFv/lUNtVAi3F/EVObpgCZlEaoS7KYaUlX/ZpfcITltBbTe/lLJ1qVNe13DCdsSzvpMO8h5d1phF40ZFDdU5Rg7bMn9z6AICt4wNHAl2fjWTMCVkxrQNz5UW9uI4fuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sufkpVdc1PCxK+7fv5xNB4YoUCnXEg5aE0/RPgrAw1s=;
 b=gdWtqv3K9/JC00G3qFRYNGCuJTfFpGwzgxFNVGkHktHK4c9iH8GBnn1JqTxte0iSozJxOzCnGsI17RPfqOv3w6AMA4R9PO5sUz8pQHR58Ipm55vMfHB0RfTwy0XhM7h6j6xxUunoU3nV9Fq5mBHSES6AEHvklOvNUbkrg4eRYi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add myself as reviewer for IOMMU vendor independent code
Date: Thu,  5 May 2022 17:04:54 +0200
Message-Id: <20220505150454.51710-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e22727-2e7d-4eb4-3bbb-08da2ea8a1fe
X-MS-TrafficTypeDiagnostic: MWHPR03MB2479:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB24797F64C44EDCFE4BB961B68FC29@MWHPR03MB2479.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVq/IT6x2JYDRBiC6tYz7q+3S7RI5lOhhvIDbBjW3c/sqOj9rey6ufZeE1JWhlAYyMRTPYKB2Iomabeq3Wc66O3ZWHxJ6jMnc4A1mluTRN/qCXNAWZQ2dif1u+WwWka4Q0ovSSgp0rZne7LXVSQIftxogILK6kP9h4eGPtX/BSWfTz5vtuWTDwVc8KvykBkhZacQm+6CcuGD9fp44N/CMsJiZ9geqg2Q7JCAL0Qt0V0r8bGA/lZhQrob61Svi0yevgceuB7hYAcypqu4e3a/h3kV6D4/WiUz2xi74VkFkIXsDh6o0AOMqIwKnOdaugxc51gwOG2afmfORbLP1QeLVt/Oy73bPkpK+U19rU3/1w4Q7ucLl3QBwBnjbbhOVUm9lFCIwlnK4s7jFe66Z5V8dhbDNC3E1r/16Dk+FJ+dq0oYYGcNp4TLsIm7xJNeEuPXAiS3MNUChcpM47sgQOnuLax5o7xS2VLrTXZh/V0lCWGP9+5at0Ub4SHmA2Bh3wHv9gPbrmHI+xIjUGNLbDBFfdxd8aioof/YEi+KeuuTItdBLcV1YnramRnY45z731sehC0XduwXK+P949vTu+vGiLyXirTjtUJVvF+F73ltmD4fXRV5qxjkVI+vKRmZssRajC7WlX2gPq9coR2cPM7R3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(86362001)(6506007)(6916009)(316002)(54906003)(38100700002)(26005)(6512007)(6666004)(5660300002)(4744005)(8936002)(36756003)(82960400001)(508600001)(1076003)(2616005)(186003)(4326008)(8676002)(6486002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkREYWNYdHo3SHpIcTdzaUx0SjRvV0NiS0ZyTGhPemVwN1ZRdDVVVDNTT0c0?=
 =?utf-8?B?ZkNFbHNkRHZ2dmFmNnJ2ZlZGNTNTOE95Nk1xZ0FRRG1wY1E0SENBQWZLZVNU?=
 =?utf-8?B?Wno1eklKZys0bjhVa0hHb1JhZEdvMGZJMk8rVTZMVkJkL0ZXclRzaWh2WnVH?=
 =?utf-8?B?TVZqMzE0eWZRTGtXYXppSXVXMm1wYWNOVlE0SFpqajJyM3NYeXRZZkxVd09h?=
 =?utf-8?B?MmY4V21meVdGWlR2U1JvcndwTjZXR1VyZjhkdm9FazBTNGQwbXdIQ29FQlpX?=
 =?utf-8?B?bE9UenVZa3R3eXVqcXYyRVUzVHpsN0dHQ1pxRFBRM21Rd3JXemtHZDFNTU5w?=
 =?utf-8?B?eXJzNkdwL3JhSk1td2diNmVKTVA0NysvaG4vbzZ0NzJqN2RWSDZTbGJLdldH?=
 =?utf-8?B?M21mVG9VOENUUHQvNnZvWHRtdG9zU3pOVTVyZ04xcWN1NHcrSXFkTGE0R2Zh?=
 =?utf-8?B?SDB4K3pXY0RJYnNCL0lvOCtQdjJrT0xYbjJ3dkVUUHJxajlEck40bVJtWmR4?=
 =?utf-8?B?NHFYMmNxZ0QvaVhMWVNjNXJZWUQwb3pCWTNZam94eGMxNmNLRWcwVVBSajF3?=
 =?utf-8?B?NzdKdURvT3h1alVQS1JmaGZNc3RFeEZjMGdNNHNQWDFWWHovdGI5RnY5WVRl?=
 =?utf-8?B?NFhoQWVzTGU3WkVid2lqbGcrS3ZaRXhYZDNoL05VdTBac3NWSkpxUmVFTy9K?=
 =?utf-8?B?SjRXUUlrc2FtbjhTZmZnMmNMWGlsSGxsZkpBZWN1aHo2Tlhic0IwN0daU1JF?=
 =?utf-8?B?TWRvTGUyV2lmSGJKYU9tNnF1WGJqRm94R1RhYU1PVlhSU2RxTlJ1RUxLTE5C?=
 =?utf-8?B?WGlWK1FxMjZHZklJMWttWWoxZGp3cnI0OTR6eHlQYlZJOEY0VExPckJmMnZz?=
 =?utf-8?B?bFFXdFFZc0ZxV29BTHMwUmpscFFhS2lzTXFLRXdvZllwdUJnQklaWExLU3FW?=
 =?utf-8?B?bzA4cXYxeG5LWmduVkQwMzFyeWRzSmVJenJNVmlOUjNQWERQSHVpMXNmd0Y4?=
 =?utf-8?B?NEhaRnJGbFc5cnBqc3J3YXIwTHpuNEZFeWM0U1g1NDVkenR4S2UyeU5YWGlz?=
 =?utf-8?B?VW9BVEpMVm9wekdwTG9uS3ZHVHRyR3Z6bFl3a2JrVnFvWU1uVjliRU9NSmR3?=
 =?utf-8?B?a2h0enR4VWxoT01hVEJndkNaWWRlWEdKcWZlcElneWVQa2IrTG1ndjVEVkp1?=
 =?utf-8?B?eG1ESC9vVld5YUlqRjRUTDZyMVlPam10NSt2dHhiSWNPVjVxZjV6R29oQ21x?=
 =?utf-8?B?T0VVWWc4bHU3REtpelRuNXhEUHlnL1k2b0pLYVF5UWFVV2JSYmhNMHh6NHZa?=
 =?utf-8?B?Vm5pYktueFZsc05Rd0Vwd0tjd3RiZDJiQzhkaVlTUHJndWNvdU9SYWhsd29B?=
 =?utf-8?B?OTdUSlNZNENQai9RZWpkMisvYlJOTThzMGxEdElOUHdPT05TRVY4cDhyOGx3?=
 =?utf-8?B?NlYvVkFzUGFFYXE3WUFCUERvREZSaHVCakZlTHVoVVFnM2dNNEFsUjVHU0lk?=
 =?utf-8?B?eTVGSDZNdTRvdWZHbFFTWTFHSHhPNnVocUVvaUx5Uk0yaVZES2hXRW9BQjB6?=
 =?utf-8?B?RERqcGg4TlcvcjlPY2FFdmdjQkQ2Z1Y4M2srUnVjaXNKZWRuMUdpTHpIVjJw?=
 =?utf-8?B?OFhJOGdEMEVVTXlRaS92V2tQQVlTV0NxNjhSODVjQXRidGZyenNLcFpUMThD?=
 =?utf-8?B?ZWh0V1JCczFxU0p1dTBOZmE4YzAwZnhibjgzc2dHbXBvWU5GUHdPcnlvZFhh?=
 =?utf-8?B?QUFUcnpWMUdPSHlEQzNEYlFNNzV2RnlvUGk5YTJiTEYyZTFYMXl4NnZjR3I1?=
 =?utf-8?B?VnRJU09EcE9iUVlINnBCc2FTaXE0QTgyR0NzaUQ2OFE5NjUvZlJMQ1Y0MStL?=
 =?utf-8?B?UEd5YVhJdUQ1QXZIMENrRUZneFRsU3FmWjZ3dE1BREpZbVk5QnlBRWc2RGd1?=
 =?utf-8?B?RGJKZEl2TitFSzVNZnh6Vlhna0VqenZBUGJPRDh0VXFhMHNDanBDTGJiSC9Z?=
 =?utf-8?B?OFhSRmRCZlpJTy9RZUdRaDBQVmVtbHBhNWtBYzVLOEVNTlpvak56eTZqa0dl?=
 =?utf-8?B?cUhldXZTNkRrQjliMmNPcmt6aFlHUitnZXRabmxUNWxteE1JeXNoUFljN01P?=
 =?utf-8?B?b3RqMGdUaWxoZVQ0R0VYTWVic3pIQUpqNVIwTlYwRjhzdExYN1ZwMEU4WGlY?=
 =?utf-8?B?ditmdW0ycENYbFNwZVNtTlU3N1lDdi93cjBsZDQ2aVlLV0dDelIydmhiS1NE?=
 =?utf-8?B?QTZNWTV3bUdZb1Riclpsb1ZMcDV1WUJ1Zlk0Rm5BQURVV2ZvSUtUN0xIeWZH?=
 =?utf-8?B?NE1oajM3YlBhVG9rbzFkR2NSb2VWWGZPUTJFK0laMGlxYkM2ODJ6ODcyblMx?=
 =?utf-8?Q?vg74WG27LvMCsRTQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e22727-2e7d-4eb4-3bbb-08da2ea8a1fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:05:03.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHeQAma1ht5I4c3GgBbb4+WmCiPsGrxKKqLzajlOCrT2THkJhmc1zJ8QwdKVxoljBXhIb7vtqwLUxW3V84EM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2479

That also covers the PCI bits which I'm interested on.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba0d1c0c1b..96866f626e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -346,6 +346,7 @@ F:	xen/arch/x86/mm/p2m-ept.c
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Paul Durrant <paul@xen.org>
+R:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
 F:	xen/drivers/passthrough/
 X:	xen/drivers/passthrough/amd/
-- 
2.36.0


