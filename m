Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D3557576
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354611.581816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ICh-0000hr-AM; Thu, 23 Jun 2022 08:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354611.581816; Thu, 23 Jun 2022 08:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ICh-0000fQ-5k; Thu, 23 Jun 2022 08:28:43 +0000
Received: by outflank-mailman (input) for mailman id 354611;
 Thu, 23 Jun 2022 08:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9w-0005Uq-MY
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16bbc3bb-f2ce-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:51 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:33 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:33 +0000
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
X-Inumbo-ID: 16bbc3bb-f2ce-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=M9sDkqyoWe8u+1pJDvGlTJ+8UF/5g6xliqOyamJnVWI=;
  b=F7fy1z09bxx8iGH5vfE62HRDlKLGLlapEq6BKKPUwGtFow1zHTkD3Dva
   lYal19zr7NMFqYDtY06d1XUJ3cdK9MMEZ+svD1+lCTwiKyIUljW1ENl7C
   ErUQgjeBcW9YX7XQHMKjJ0TbK7CFis4c3jY7WaGifAuGHLv8u5tKFGrnO
   M=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 73580354
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ayqbl6AJ4h1+cBVW/13iw5YqxClBgxIJ4kV8jS/XYbTApGwnhjYPx
 jEfDWrQa/fba2b0eYwlYI+y/E0Fv5eDn4JrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj2NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh/5
 8tju5+TRjszGaqPuNYtcCFHLSJhaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcH80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjz2ymnKGAEwL6TjZsbvXb95QJw7IboMPrFZ93bAvx7h1nN8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa60iDXtT7GRqirxa5UgU0XtNRF6g27V+Lw6+NuQKBXDFbEnhGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb03ojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:o9muhq9dYfPOqit5Bh1uk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 Ohz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlOl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QVEJgUjtYkid0w7heMAoql/lp
 r525tT5cFzp7ctHMRA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="73580354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxCIowIDGrOKrX7/eLjIYrjmeMdqBJgDPCf6tzqnlxhmJHMV3lMsbrEbGMXfAKDc96sM6kZzBLE+RaQD2kOFZQYRgCQwlip9I7RDrx4xKtgPWQfUb9KlgQZL0Ilo4nW07DYVDhVh1KJfCtauG+XUJBeo1F78x3fPtx8arGT/yR8JXohG3DJObIejyrvlI356/qKYaP1Kqr1AwHxAN69tYQqJAywXWuzPtkHhgoXGZczF0jFjQsgvCJwl/t4cdfsBaQLbX/ZBHbwv2aGh3QM7wzh5qXKpyOg8fIhUsP8PztgBUYN7I+aSWKbZHRWtpLjDSF4c9wttfiINhi+1YF0/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+VcW6quQIs1mH4she5NONTPj4PREd8r33VA4ThvE2Y=;
 b=Vm1JnhpCimwNl09RPPYqhRrqKB6StYkwhHCnxWA9i2y97qBp1c4MTgToOhcIraCGdWo4NR2GxTtcia+Qygnxv8BBk2lI6Bo+9BphEnez/kPqGxJEstqbs+QhZNtMiQzLrSRCqun9gpsW8Mo/SHJ/XPnes3VJIUYVT3moEUgEbNNlQMMKC9Pm0AeLOE8X/GfzmLXxKwDmi3BWW7C9rsJ7tQyuM6yUo7eEr9kV3XkE8sv+iBKEk9cXscIk7FYq4VU6u+xhzbtYK/swYJW+r5Jp45kvueFXTEGI1fHDAOcQryv3UbBMTKFr8MbPjl+DERxDrJ1koRs2fmUFtDB495ghYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+VcW6quQIs1mH4she5NONTPj4PREd8r33VA4ThvE2Y=;
 b=kUovyGIqr6eagJG1A7sgbmKqvnXYjccK8voJuqegfyNGB8kwmkdXEYw/GL7EKLut5ggNAvlQXN6QzfLJLKPEPmv+bXQY2bj5tSOsRSVgLxrxxJseKoWM9BonIVJJb4pnEIdUDCRnYjYbayy6VcwnIczMO57JKk4MzSrwEpvxMz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 6/6] x86/irq: do not set nr_irqs based on nr_irqs_gsi in APIC mode
Date: Thu, 23 Jun 2022 10:24:28 +0200
Message-Id: <20220623082428.28038-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0447.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f99e338-6a36-44ae-1460-08da54f1f0fe
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5008604B2685388A6C5EF0AD8FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgl5riFRUauTheRMLupyjcOw1ebgF36stwfZBAek9SNtCKjXBmh95IdfC6PXZZ+/tcsVtCEk/3QsYVgcYF/CjUD/sL5PPWKtzCLf5PByjIqd9mu2lKZbzmb7mGdg3W0EuMt7Nut825VgLHW6/ZG/QB14RWPP/KyS2XpF4nRiZrfjKcPp8hdWf+4sfX3Ji2cu6ukqlkXqSwhNE8F4fpk74WB26LomZHD1JBAhGjzs1E6aUwye83WGVrw9dfwl70+Kr0iF8CxWFCInrQRrnFsxD0yyogUMUUUY2aSyvkaWL4icz+M3Kg9QitN/V+wM5krHXjaWsVZ3/P07Zx4VxwqAh0XXSowbNVt4xhKqgHrnwAN0LJSZz9EmrnhU2mkFu52VGkc1iMd/NmerttY5114A2rO3qkVe+GqNp4bZObGZP4RiksABBn0O1wdEFiXPLy0kZpMohcM8boFpguGNLlhp3l4kH7HzwUtmbsuCHR7SKtWIv/TQG6beN48X0hOf6Z85WEiZuirnCf7uLeigEpemT0tVtH6hqsX5dRrBSk2wOGHNJfzYvvrQ9UCwE67AxPySie3TntH7xafKSGBY1wRzCJWTg0mX2gWz1IlG52gH7PdmYjA4OcemR1FHqtfFtJUas8CwWfhMn6eufwHolVmFHY8mbj9Tgo4RdN2cia5UC+rg//ELwA6iM7DhVH97iWeWBiJV3DReG1161Kfkaomx6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(4744005)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1IxVUQ0RENzS0ZNWWgraTJvN2QvMGdZOCtVT0lncWVaczBSUWRTb1RhNlQ2?=
 =?utf-8?B?SmQzTUt5RjA1c3BkeFZPRE85ZjVvVW9ha0hQL1dSR2dWeFFGYVprSHp4N3pn?=
 =?utf-8?B?cGt6T2xjbEpPVzRqdlhZOFpoei9jK2VkWHVnYkFGdWJja3VwWW0za2o2dHVn?=
 =?utf-8?B?endaM1U0VnVMYis3c2lEc3JtY2NYVjcxdzg3aXQyb0V6M0ZNOWZrcTdUTTlD?=
 =?utf-8?B?bW5xUGFlMkVLQVUyVWROcSs0YlU4aDB6MGdNcVlncjZXYW1PWFhLV2NoREhE?=
 =?utf-8?B?OGNJVmJ5K0FlWW5OZVdFVWlKSGYyZUIvR1V4aTBLTG0wWlBSQ3E5bVVWVDVo?=
 =?utf-8?B?Y0Q0RENNWGtMZGJ1ZUdNR0pGbVM4a3Qvbk9qU3JMN2dVVGplQUxTdjVqV2Fn?=
 =?utf-8?B?bnpneG1DSmEvVWw2Ym9OdTJRVS9JbjdYK3FXRGMycEt4YW5rUW90TXgvUUI2?=
 =?utf-8?B?Z3pOZmhXZzUyU0VQQUhUSEgyMVk3ZU9wemJrY0k1SFNFY09lSHJOZ2l1UlNv?=
 =?utf-8?B?MWRZOU8rVnJ6YWptTTBLL1phbWhGNEJaZDV2M0Y4NHMyR0F3ZTcrQ05WNitv?=
 =?utf-8?B?MWp3OUsyWUNJM3ZQcmNacytkMVZsVlNxN01RZDMxaEZONHlvaGxaYU9HRzdK?=
 =?utf-8?B?UWZVTzVOQlBtT0tHVzlOVCthVTNLTnRaaGlQbkRkWlBHWG9mNjNHb3ZyS0lm?=
 =?utf-8?B?azhNTXlTTVQzSWZBZ2RYd2NSQUs3YUpXTGJySnpORnZyUEJQTlJNZW9CcGdm?=
 =?utf-8?B?eE1TdHF5Q3J6OWNZcHQ3TkJBRnhkV3NQOVFsbmRDT0RVYnNjaVkySjFJU29X?=
 =?utf-8?B?SmcvdU1IWXJ6dlJ5c1IyWUQ3MkRKSVFrR2VGUHQwY1A0eDh4QXFnZjNydytD?=
 =?utf-8?B?dnFMaisyc2RCYS9XVElyL2c5a2x3NDlYYnlTY1BrUmFSeW5JQ0dlMWlJWCtR?=
 =?utf-8?B?RXlBNDZ3Z1ZrRXh4N2czK2l4Y2FrVzZUa3N1d1FETHlzNVdTekNCRkJCamll?=
 =?utf-8?B?NWRCc2EzYXBoKzR2UzVPNWNJeklNNkNVK0NOQjN4RHVYeEw5dUtXYmZLRWln?=
 =?utf-8?B?OGFOZUpGZEZBdkRYaC9CRGJleTh3UFN6SHFrQWF6VVpZQjdoNlQyRlVCZTc5?=
 =?utf-8?B?L1dXWERpK3lRQjNNNFpnOFoxdDdiVHBhRVYwWkx2REY0U2RWSFZHa3ZHY1gz?=
 =?utf-8?B?MkFwaWRtd0ViV2RZK1BvWVNpa2h5Q3p2YnU3WVFNMUU4QTRNRk43MC9ycC9W?=
 =?utf-8?B?YTJSd2N4K3NOZjg3SFBzb3czN1kwYkMzUGkzYW0wNk1GZlA4WU9vNWdWbkVP?=
 =?utf-8?B?SXpUSDRyalU4dmFLMXVqQjBSdU5tZ1ZrWHB1ekFQOXJJOGV6MlNvd2d2NWQ5?=
 =?utf-8?B?TFlvOWhySUtnMWU5TUx0Q2ovSVQzemcxbS9DOFYwSW9nNlhQOS9SQnVNR2x3?=
 =?utf-8?B?VWQ3bU9nNFJWL3ErZnMvTGpDZW5KQ0h2Y2xueTBsa3VLdkE3MU1FQnFwNllT?=
 =?utf-8?B?c200SVJYSkZxQVNBT0hIZUczdzVSblRTT1A1blFPQVhLWmtYZk5pcVRnN2lj?=
 =?utf-8?B?SU95OTFhWjZMVUQ4Szd2UnRoblhXN1FkSk8vV3B3eUo2ZldlVUVjL1dHWG13?=
 =?utf-8?B?cmpYWkFGZ3BzRkg1alJ6VU5mcHVXS1dJSnExUzFLM3BmbEp2MzUzNHVlK21n?=
 =?utf-8?B?YTBXamRHRjNBQVdtYWtLdTNBbEJ3WE56NXg3M1VwTW1GRTRMaWRZQmVkWDd5?=
 =?utf-8?B?WUMzWnpBci9QODloekcyMkVMQmljSHJMWmYyS3lnZmlQZDY1MmlMNlgyV3I3?=
 =?utf-8?B?ODRRRTh1QkRYc0FjUHl4L2RlRkxTdFhXY2JDMlJ6dW9RTGc2V1IxYUZTYVRK?=
 =?utf-8?B?a2NGdzJFN1RzdCsrS0xBUlRGTW9TTjgyekRMUWJ0ZmxvaGZMWWpwTFBXemxy?=
 =?utf-8?B?L1AzNkpWYUVUWDBzWjdQWGhlNmZMTzkrZUFJd3pwNUNqdXZXWExVM1JuY29C?=
 =?utf-8?B?L0l5MjZyUTc5enh5R0N6S0sxNmxIOFFNVzNaVmc0ZzduT2pqRmlzWlNrdU9v?=
 =?utf-8?B?ZSt4ZFNWcUdHSkZONjZ1UGNjclJ3ZjdORzN4WEJJejRJc3R3dFV3N1A1U1Av?=
 =?utf-8?B?SXpZcmtZeWV2c0gvTEJDek92S3pkdWV1NlRNUi8wZ05ramt0UnFrR0pTcWc3?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f99e338-6a36-44ae-1460-08da54f1f0fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:33.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpGckuVjjZjhPRGfyVuGz6rhYne9hwQlUPbRxKbumSVGuMtfORHXcu3e9k4KYT2mIFqA2CTbwyuEDdzeuLt7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

When using an APIC do not set nr_irqs based on a factor of nr_irqs_gsi
(currently x8), and instead do so exclusively based on the amount of
available vectors on the system.

There's no point in setting nr_irqs to a value higher than the
available set of vectors, as vector allocation will fail anyway.

Fixes: e99d45da8a ('x86/x2apic: properly implement cluster mode')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 7f75ec8bcc..e3b0bee527 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -426,8 +426,7 @@ int __init init_irq_data(void)
             (x2apic_enabled && !x2apic_phys) ? x2apic_max_cluster_id + 1
                                              : num_present_cpus();
 
-        nr_irqs = cpu_has_apic ? max(vec_spaces * NR_DYNAMIC_VECTORS,
-                                     8 * nr_irqs_gsi)
+        nr_irqs = cpu_has_apic ? vec_spaces * NR_DYNAMIC_VECTORS
                                : nr_irqs_gsi;
     }
     else if ( nr_irqs < 16 )
-- 
2.36.1


