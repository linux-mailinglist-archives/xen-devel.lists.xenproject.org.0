Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820B7BBB98
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 17:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613724.954467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomas-0000dJ-Vl; Fri, 06 Oct 2023 15:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613724.954467; Fri, 06 Oct 2023 15:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomas-0000b2-Sz; Fri, 06 Oct 2023 15:18:22 +0000
Received: by outflank-mailman (input) for mailman id 613724;
 Fri, 06 Oct 2023 15:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qomaq-0000Zg-Lc
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 15:18:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 927e431d-645b-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 17:18:18 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 11:18:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7037.namprd03.prod.outlook.com (2603:10b6:510:293::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 15:18:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 15:18:11 +0000
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
X-Inumbo-ID: 927e431d-645b-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696605498;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7gBB4rD6/Mdk0Hzci/I+lG/rNPOl26bNkzQNDzmnAcU=;
  b=cV/PTvixv2lIRgRUZUWzhEEtTGNLlBH/HPBRVj1THtNUVxQZyXmt5YhF
   nhq28Ar2ETsRXeGQqQMFWgQn9UMwd6WZH+03kFBfQHRRDUMDxTtXq1HSY
   jXLy+bc1fwQeyoYQpK0SSbhbaykVwDr4M/lollPQ/a1MELT8KrCzc0FdR
   8=;
X-CSE-ConnectionGUID: qKTpbkDUTOuHZvD2htyYLA==
X-CSE-MsgGUID: xQ2DLBncTm2byHTVPKTOGA==
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 124846856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RJM5A6xK22XpVHbV/bF6t+d/xirEfRIJ4+MujC+fZmUNrF6WrkUGy
 2ZMC2uDbKmCYjf9fY0kPdy1oRhUsZ7XmINjTQRspSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPa4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXhty
 eQSKxwwUjeep9Co7Oi7Vvhdou12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WTzX+lCN9MfFG+3u5T2nG37GoYNBhMX0qbnceBqXKZdPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZIbNEkvck6Xztsy
 FaNm97rAhRktLqIRTSW8bL8hTG9IyERKUcLYCYWSg1D6N7myKkohxTGVcpqC6+ypsf8AS332
 T2Moyk4irgJjMgEka68+DjvhDahpYPIT0g2+x/QVWKm6St2YYekY8qj7l2zxdZNKpyICGaIu
 ncsktKbqusJCPmltgaAXeEMF7GB/OuePXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBS
 FDXkRNc4tlUJnTCRa1qZ4O8Dew6wK6mEs7qPs04dfJLa5l1MQSApSdnYBfJ23i3yRdy16YiJ
 Z2cbMCgS24ADrhqxya3QOFb1qI3wic5xiXYQpWTIwmb7IdyrUW9Ed8tWGZipMhghE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:c3dJxq6Rx8ORwmVOfgPXwBLXdLJyesId70hD6qkXc20xTiX4rb
 HNoB1/73XJYVkqKRIdcLy7SdK9qFLnhPhICOsqTM2ftAiPghrREGgK1+KLqF3d8kXFl9K1vp
 0QFJSWZueAaWSSTvyX3OB7KbsdKRW8n5xA/t2utkuFhDsFV4hl7wN0ThmWCVd3Qg4uP+tFKK
 ah
X-Talos-CUID: 9a23:BeSn+G59WK91bQogZdss7W0oAsomXkDh62rwEVGUU2Z1WYyxYArF
X-Talos-MUID: =?us-ascii?q?9a23=3Ajnbadgw9bCJNwpJ51Au1njOOIySaqLSXUmwpu5M?=
 =?us-ascii?q?Nh8zePz1QBwmlrwiQbaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124846856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTim+lS9XfKjWH7YKPnMWOh13qmyvwLWto9FruMyT88BM8nSAsCemCeZh/JtR4pGwzr/2c6KcNfv1vIGzzB74E1J7b/XhY3qKNM4+4wxh4EPQaR/3qclxWSW+JxRLh5EftYT+pRIrLKS6pqAR+H20kJojrmY5ifGFRlbsQtk1fLgePhtfL1PKPr5vNzBK6yjG5WlzRBDvDXkp81l0kEX4dhtZjYJhqEdahyqrkjNWOEG/mOWeR22gdWAy1ExmeFcBq1LB5HnjytwNb1/IEYG50cenwj25pOfwd4DBdx7n/su1mEooDpBs9z3Sqh6MbE2iTvEyUHtiHDCxZWCMq/iMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlPwlojfnOPOJrTqWhQg69YRNT9GWtUGLt5F89zVzQA=;
 b=ShxfjW6FniW6b2vbyB1hzvqSczXCRkTXXn1SxpM+oIq43w1CMmh2CazwA0myflxmYlLkyjKt5pVb9WTNqOduMm2yJOwk+UsRhW4PRHnf79xnzQaNIIrydbSSROKflKR7YGQjre1lbU6EGeeDMbs5ePrloLDLT4ML7K8tsgvGutlkFHPNx8J9omg+szVdqgcmAsnTR3qNn/hbUlJUe+wK2qXBCBtYQAEj4AN5FIIPiNSDYfUYClWrsb+7JGneWEQdW81sDFEEsgO0iETuMJeSXTi7MY5QoGy74RXbWgGzShz45b1N07I7ClIiLKKXsOk5qgDdcqe5TZJxXSPnyGw+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlPwlojfnOPOJrTqWhQg69YRNT9GWtUGLt5F89zVzQA=;
 b=wBNXujxPycpfbzLCFGXX9k4/MxRkmxKOGMdCYXT1QLSvqjMORyMEjeEnaKpemAWBTvp2Bhyx3DCZX4fBomoGvImu4o0gD2GHZ6UO04k2In7Qszmr2kseRT3FSuwTQYxbXx7Wn11G2EGOXS0ptTBq2YEvKRAJyMpNU/RkOOQtAxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 17:18:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Julien Grall <jgrall@amazon.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
Message-ID: <ZSAlLuJ-j4wDgfKg@MacBookPdeRoger>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: b394cc6f-65f2-4b03-b0e2-08dbc67f73e8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63ldCHxGk2bUFfHWO8AkZyBNLin38k6VHf0KREhFS3TpM64j3w1PtuKyQ5Rjy2u9LrUIAy2rPb86VEjefyiXpEhAtLHgUGqGPozh1sV+SW0nab78xeyLPPRWYdqjQwKkiTfKw4IdiSwb1YfmoFEGQYIbSzsREv/yeMz0fYqpKHGGOw6n7eNabckIPIgsXPQsiq+eSBYl1i0mkAtT4Nhd8dp8FIOCtWqskIVJ+4Ru3sHZQLtM0k26QUTXDiTYzSSkM6gQz59PGX/apVm9BotrvQZl57Orc9evosLCoy+mwrHHLD8buIYIr5WDpmBdtTToz1dhZV3Mo/3YQmeU5HZ1xob/W/ZfJOXkk8RzeUgtlkvHnLXJf58/MgfgPn+egNMHHaZjGV47ipqjV2q2Rt3kFIV6DsGk3imb10T/BHKm6a7/Uthtwa/XKv5PpxLH38sYrGbp1kps050LtI97v8ocqwu7YFvWQEhTWIpyOa2bCshaCj7QQkpxRM9ngoUr/7J7YUfjO2uPb3DJe+KyACd/psdCj+hmkjKKT2Uwxfwa/EuUEKUwS38tTSABrm2ZpV33
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(7416002)(4744005)(6486002)(478600001)(6666004)(85182001)(26005)(33716001)(38100700002)(83380400001)(6506007)(6512007)(9686003)(86362001)(82960400001)(316002)(8936002)(8676002)(4326008)(41300700001)(6862004)(5660300002)(66946007)(66556008)(66476007)(54906003)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU1sWU9wdWV4dmpIclBPeDJWY3dIeTVORnFNaitoV2NoSld1Sk8yNTlUVkdL?=
 =?utf-8?B?S0R5RXRsQ0NRdWlvd1cvbWtpb1l4MWhXbG1KT0xnSzM1MGY0dklkMGx5MGU2?=
 =?utf-8?B?eUhvS3FSaW1ib3F0NGk1T2xxckd4YmNDSUhFbmdFNHMyKzc3eFgwUG5sVk1u?=
 =?utf-8?B?YXpRV1dBaU9YS1RIempiMXJYYzJxWlMwQjhOVjI0QmdGenhYck9jYzR1dFlI?=
 =?utf-8?B?UXBwUUJsaGpZayt0Tnl4YjYyeC8yRzJsbEkzVTE1TXZ1eEtuYTZ6N1BjM29U?=
 =?utf-8?B?M3dLS1BHZVIvMTlzbjh6dEhoTHYyR3IxZDRvYnV1TTEvRTdjUGI4WGJ5MENP?=
 =?utf-8?B?Qk5xTWlEUkE2U29VdFhWaExDL1ErVUJSKzhZalA4UHBiZUhRT25zelR1aVhn?=
 =?utf-8?B?cUM0REdJRmpZclpzVTlMV3dBcDZPMFp6cnlzazZUL0htckJCYk1GV1o4SXcy?=
 =?utf-8?B?WEoxYW9Pamhpc0xXVTFqdXhWQ0gvdktrYjhJNXJ0QmpVLzFBSUFRNmNnbXI4?=
 =?utf-8?B?RkpHd3JOVXdLcTZPWFVicmJsbStqMWJlYkptd2w3R0dUOEtoa2tYc2dFK1BO?=
 =?utf-8?B?OW14eEVVMHovWGxkNnFKeWIxejRJTXpDVDVJb3pwakZZN1pkUkp6NW5jRVp5?=
 =?utf-8?B?Rk05ZDd2dVI4TzB0MVpZTDBJeUFETmxKcE8rNVpkNkl3REtQNlZmWHQ2bm9W?=
 =?utf-8?B?RmZSbE5RVFBuaGRMUjFQdXBrS2RXWWJyMmZMWnJ1RkNqbnZlRmFvN3VhYnF3?=
 =?utf-8?B?d3ZiVmYrWHQrOFNvMGpmbWJDTEpmRE5TTXBSR0xLQTd4QzdJNndtOTZ1b3dW?=
 =?utf-8?B?ajY1ejMxQlBvRmF1eFRrVjRVdEdwMHFGNWdpYlNUUnFtWGk3T21SY3o2MWpu?=
 =?utf-8?B?aG0yZDh2dm83OGJiekt3clIrVGxaVW04UW41WEtYd282UElUYy9XZ3hqODBq?=
 =?utf-8?B?ZS9qMExaelpIdERzRDlDSm82bUdqTExFMlIvRXVoWVdGNW1RQlNVT1l6SC90?=
 =?utf-8?B?aUMrQnNhT1RLM2ZhalptaTloOTBsN3oxNXZlNE9vQjU0L0hoblJWZXBTazJx?=
 =?utf-8?B?UzVNZWNORnZmc3JwK2MxRUFzWVBEV3lhdkRTY1djekZ1ODlOcnhBSDRmL3ZI?=
 =?utf-8?B?aHI3YjJ4TVBnaFZjWUdqVEo5TXV3QUs2dVFINll0ZEVRVmdJOEFuN2RTajVT?=
 =?utf-8?B?UHdQSXU4Q3BVd0VXZDc3RUpsM0hHVyt5Q0lFbVVUVWNiRENJcGtuT3loWEUz?=
 =?utf-8?B?VytLbm5TSnVJTjUwcGdrMnpaWWF6ZzJ6a3ZiaGxsdDNjYlhlSlBMS1RYOHpO?=
 =?utf-8?B?RXNNVm1oTE5iZzFyL0tjM29MZnpuem0zSXczMmw2alA1WXQyRHoydlltK1JN?=
 =?utf-8?B?ZGkyRkZQTFRURjBTQ2EvRUMwbU1PTFkyVVkyTFdGaU5CN2hzYVpreG1uMmlJ?=
 =?utf-8?B?b1FDU2RMNUhmSWlqMnlDKytOVHg4b1FIb2pPdDhkdHhyRjZIV1dCcFlaSm5l?=
 =?utf-8?B?dU56a0ZvMkpuc1hQMWRxWDFJM2lTc2R6cTRwc0xrRFhXdDJkOFlGdmQzOXd2?=
 =?utf-8?B?UUlQZGY5eXRzckNsa0dPTHRuODVFc3NQUEU2bkJiNUZINHZ3QmhQZCt5Ym1h?=
 =?utf-8?B?MlVHTkZKR3dSZlpjU0hzQTBKZGlYV3dsMnJvVnVRSk9pS3NRUHkrZVNvM2w3?=
 =?utf-8?B?MkJOTzZ1Y2Z2b0drUUVHbEx2blNpZ2V6YnNaQTJVRXFYSCtMRy83bCtCSkJa?=
 =?utf-8?B?dGhzWXNXTG9iRDgwaXkwUHRiTEc3allMTWhZbGV4RWI2alQ4VVJnaUJRd1dj?=
 =?utf-8?B?NGIwRFd3TXNtZFZSMjQra0hpc3I3RXZUTzlucHRwMkRlQldhNDVTVVBXVS9L?=
 =?utf-8?B?UVNGMEZwUzRGdzN0Ykk2dkUzVmpuUmN0R1ROZ09HeXhzcmFBS3pvdmxjZzM4?=
 =?utf-8?B?bmFWQ2hCQUpYVTdxRlY1WUZnU0JNK0lRQ2t1WkZYeUoremo3SlE0U2tPRDQw?=
 =?utf-8?B?b1BBcnRYSWo0K2M5QmlvdTNKcmZVSHRBd2ZxUkx2RFp1MFRpRHhrZ3RvSEZu?=
 =?utf-8?B?dlVYUVk5ZXluWWJHUDd0ZkdlV2pDS2tyaDdmVVFkczAwQ3ROWDZRQ1RiM2NV?=
 =?utf-8?B?VDc1QkE0Z0tYdFhFRlFMZ3FWZStXOVBlQkpZc2kwODhwYTZvU3lDdkV5anlJ?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Qk9veW95ZEJyenROZDlqK3lrWS9ieDAyVDBFazQrZ0VabWNzdEhTYjBVdWth?=
 =?utf-8?B?bHdtTDdWRjBXVGJHZTcxMVpQS2orQm5iY0F4Znl6TjRmdkxKSFdiUDJMRmQ5?=
 =?utf-8?B?T05hOFFISnFuRERhZlRsK2ZMeDRPa0ZKRVE0enRlREtoZTl1aTZGcU84dlhj?=
 =?utf-8?B?YlIzZnZNOWxSaTg1NjBSK0szQzBNVkxqYjdPN3k2MzM0dXkxR0Z5eHh2aXdG?=
 =?utf-8?B?TEhzelBqQVFUVzNRSGFoMGNKTGtOVVcva3RQWUNITDJNQUxlMnZEc3pYTzlF?=
 =?utf-8?B?cUZXczNnUGZLZmhRTHZkRkpDSjE2MDMybDFONzFUemtNT1Z2cFpXMnU1Mko0?=
 =?utf-8?B?ZG43VTMxVXJkNUh1N0Nyc1RzK2tPTVI1VE1VaDZTdkFGYkVHMXFpV2svUFE4?=
 =?utf-8?B?M1VIbVFVb0VmNDcwNENielV2YURaWnpzQ3FSZzJIR0xCdnFYcE5uK1lPbGRI?=
 =?utf-8?B?ZlJGS2N2b1hScHZReEpSK1gzOEdVNUNIcC9QejgzdUJ5TmliSHJNeXhFeWEw?=
 =?utf-8?B?TGdNNUVnYm43cjhVTUtPSnpySmRuRnBaY1UwdmZKckNJeTYrVGlGV2hxQUY1?=
 =?utf-8?B?TGRJK01tdCt3QXkyZ3BZaDBlMjBSUlpxeFM3OUpraloxYzNGLzZwaStlbko3?=
 =?utf-8?B?OWdWaWhUTmlaSnZVWjZjWEUrTHFqM0xwbm5RQlp3VXluOVh4NGVHQkVSNU1h?=
 =?utf-8?B?dEVZa3paamh3ajZZMUlJQitidzJIN3RxRlpna2IwLzgrTklJQi96aGl6Zmxo?=
 =?utf-8?B?U09LTmpCNmlxR2dnRXN5S2hkNm02TDhqeTlXSC9TeEFUL0JZc2EyOVNESzhE?=
 =?utf-8?B?RG9lQkdYa0pMQTFRZERITThud1VxRjlucEF6NHBCRWxQNkhCWi9XL2kvT2xO?=
 =?utf-8?B?K2RCNzEwVG1EdDhiaTk4aDdGNnBCQmgraVVjbGtRc01XUUl4RWZvM3VFd3Ft?=
 =?utf-8?B?ZHQ1aUZWQlBqeFdaL2Q5YmFMNldMdkFqM2xVMnowT25wOThuZEkyYlVERnoz?=
 =?utf-8?B?bDl4TE9iUWY2V2x0WVppL1lUVDFuMDMxVjhXK3Q1WEk3MVdFcFdLN2FYTmpI?=
 =?utf-8?B?Y0FiVkxXK2tXeUZieDAzdkMvUmpZVk9zYjRvWkgyampEMUN4ZGExWFhVa2pT?=
 =?utf-8?B?Sy9XSW1EYlIzV2xaL0JQVGFIeVkzaUpZNVI0Um5GcS9yWndlbXJGZjJWTzFW?=
 =?utf-8?B?V000UUVqamVJK3hRNDI5a04zQVVDNUFyakE1MGlJR2ZHWkRoM3lLYVBBdksw?=
 =?utf-8?B?ZlJRZDh4U0NoVGY5cWIyejNFT2lZMFpObDBRQjE0MHkzVFdwNmRScXlBaWhC?=
 =?utf-8?B?alp5aG84dEd4eVFSK2NyVTdZMnRtYkxNeHNjd3RXcEMvTGszMkZBaWlNcCtQ?=
 =?utf-8?B?eTNWTWlsOHNEcUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b394cc6f-65f2-4b03-b0e2-08dbc67f73e8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 15:18:11.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFNRf/LBf462m/qhD9UoH9BWh16hLvG1yXyiZte9X2hsAiqnIbJJihD0D8MLpwhvuFEx62P00ZN7tUiw75diVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7037

On Fri, Oct 06, 2023 at 03:44:05PM +0100, Andrew Cooper wrote:
> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Adds a new compile-time flag to allow disabling PDX compression and
> compiles out compression-related code/data. It also shorts the pdx<->pfn
> conversion macros and creates stubs for masking functions.
> 
> While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
> illusion of choice, it was not optional.
> 
> There are ARM and PPC platforms with sparse RAM banks - leave compression
> active by default there.  OTOH, there are no known production x86 systems with
> sparse RAM banks, so disable compression.  This decision can be revisited if
> such a platform comes along.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

