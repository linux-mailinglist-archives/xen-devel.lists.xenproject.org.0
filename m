Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DC35844B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 15:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107338.205209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUSZ-0002XP-SY; Thu, 08 Apr 2021 13:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107338.205209; Thu, 08 Apr 2021 13:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUSZ-0002Wx-OJ; Thu, 08 Apr 2021 13:12:35 +0000
Received: by outflank-mailman (input) for mailman id 107338;
 Thu, 08 Apr 2021 13:12:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUUSX-0002WV-Uz
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:12:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4d6b0de-8c93-45cc-bd8a-6d97df98261a;
 Thu, 08 Apr 2021 13:12:29 +0000 (UTC)
Received: from MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2f::13)
 by DB7PR08MB3193.eurprd08.prod.outlook.com (2603:10a6:5:24::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 13:12:26 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:2f:cafe::ac) by MR1P264CA0026.outlook.office365.com
 (2603:10a6:501:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 13:12:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 13:12:25 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90");
 Thu, 08 Apr 2021 13:12:25 +0000
Received: from fe5fc99fd01c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3EC25BE1-5960-4E0B-A80E-0533D6485CC0.1; 
 Thu, 08 Apr 2021 13:12:15 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe5fc99fd01c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 13:12:15 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 13:12:14 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 13:12:14 +0000
Received: from [192.168.0.22] (82.8.129.65) by
 LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 13:12:14 +0000
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
X-Inumbo-ID: b4d6b0de-8c93-45cc-bd8a-6d97df98261a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rxb2bddurB77XcSBWAtEMAsJo42fUcRhMctdUBE7Xk=;
 b=mFd7BwoHQVAiSiDf0TyS1BtmnbJlxSx8GPjsLQUYaNU29v9KrutmanuEzBLK/lQZiCNAt/5LqK37kFTF24DEMsCJ5soCK/QUqSLWU3fFj4RBfqKkdcSx7V1MyqTEWn0+7x5JQMKC7igTnLklaXaGg/EKN3lnizTCD/LRc2KuYbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f4fb35bf4265cde
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdbjc484CsDpHzwdm6+6FQ7grYxCRwlQ5XmhP8VqUkCrbOFelfRuHtKaVGe1IOPrOK/1ui3bm3/WGqOwnKHNtfjOHxOwmR0n/dAWMwGgY+gP4DWQ9ArLHAWP15S4FvWIlHr96Sh684fyYUoVs8F8nFnZkJ974mP/dsIdWFgzpKju+I2kkAg8L6geXK5CHth4vjfYhqVw6+AZZ5sUixQy+tZqaIrWnNXuRyv19UZoRwjkemoEcq4yHksuDDtisRIVKPjjAIRSvegqvPY6wZZashYqAHSN/jx+sPMXu35ZZFE2Qu//KxWEWnKMmYx7q2TR7J1Cyr3albaoN4zyCaHN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rxb2bddurB77XcSBWAtEMAsJo42fUcRhMctdUBE7Xk=;
 b=HZCia4ftvjyt0tIt0zgsT/spteL09iLsXi/4soc6NVo/7cboEYRlzkrqgmPHrlm9NqjLRY3vVHXO0L6KdqtFkdSi46XiRBmihWMwgrPU7qSWBgjIlcKK3iXD7Y3ZcBNUO3ZpaVojGS35GLZrCOz+rVCheLzGkUGZKphBAT0uWJO0X/zhBj+xTYtS8oJhzaqwOU/A8/hK/XW9RFpdvJPqMzWjdjQzZEJAwc3oZuLlffZHgX8JkyCEW4A1FJ4FPQJCOg+/tCguh0A77NEItcyXkmXrRTxJJbuItNHzrQwkGdrQG5e9YC7BPMoiCWYE+PuSEh5ugHcaiiyk2wiWxYRjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rxb2bddurB77XcSBWAtEMAsJo42fUcRhMctdUBE7Xk=;
 b=mFd7BwoHQVAiSiDf0TyS1BtmnbJlxSx8GPjsLQUYaNU29v9KrutmanuEzBLK/lQZiCNAt/5LqK37kFTF24DEMsCJ5soCK/QUqSLWU3fFj4RBfqKkdcSx7V1MyqTEWn0+7x5JQMKC7igTnLklaXaGg/EKN3lnizTCD/LRc2KuYbA=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 3/4] xen/arm: Reserve domid 0 for Dom0
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <19fd45ff-b373-dd89-9377-79cb77ffee5b@suse.com>
Date: Thu, 8 Apr 2021 14:12:12 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F99D2C5F-B7E0-418D-8A41-D8CFB20933C9@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-4-luca.fancellu@arm.com>
 <19fd45ff-b373-dd89-9377-79cb77ffee5b@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b97c0583-f2c4-4bf4-26b2-08d8fa8ff423
X-MS-TrafficTypeDiagnostic: VE1PR08MB5775:|DB7PR08MB3193:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB319316207E97C93A50A648B0E4749@DB7PR08MB3193.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 afVvdS5m1XhB/jTweGVgTlE5Gx6CBAIOdab8X1rmPoJdoQ8cgZCoU/ZxRis8B61qgssdMOq55lj+7csdWS1qRO1710xV3MtUDvnSJLm9dOhSkbtfEQegRe270HyZ1FDEViMqG8Qjsat1LsTZQq7uctErqEwfvP0FaV2G6B1ztv57vb+S4+qeLHCGMTfM+Bpk4muv13S6x0WoDcRkqD5NHaXKVt08Ymu+3jKuZkbc01mpYYeI17wIYzOCruWuRABRgXOKWwQ0w/Ei8njTTo0A/LrNq3Ao6oALvqHS2ZHAJM82FzfC4JMAgdgSjcM59VcEb7jU+lzMMQrhpx9qm7UL3U2/+74ntLTK8lndnAwFQVmn37WkiP2MMDB0+alYFRsts9WfbAycmVNV1KqguXwMDvh5t3gMOzafc2LYHHQb5dasN2hpzHR+wCPQVrZUrsWzjc+4HL9Ev7R6tjvS/tLiKESgMVuE3jZ3cR4SvxEMdDUTisAGbs/MnI8sk9AWEU6VMhnYn5m4w50HTtffD48G8QwoyRcqjavdjm/FMxZC95ENuZCO96kR63AtQQli31OH65ELBx8jhwOYfbAfWTi6NdU0LqSuabLad5n6qjQqaOd5U9cKSbOUjBonzP3uSz8LM276sKItCgKoZE0r2SUiPUw1kr03V9c0NITdEkLrDXfslJLJEEs9PaanTIkTwZxS+5tEWyODa7j36RC67W9BbiVAnDEJFDechzA7ktYrO14=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(33656002)(956004)(316002)(38100700001)(2616005)(52116002)(66476007)(2906002)(66946007)(4326008)(53546011)(66556008)(36756003)(38350700001)(6486002)(186003)(5660300002)(16526019)(54906003)(8676002)(478600001)(44832011)(86362001)(6916009)(8936002)(26005)(4744005)(16576012)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?KoVCCYHVWnK8Ky6mVBaAuBN47A56zuT8q4T0zsH9I1SKBERaB/8JHMYenT2w?=
 =?us-ascii?Q?YweS8kuyXaxkBeubxwPsBvKCmWiSy6MFlTM0HDxsTWlUuzh4MxFypHXdwF5e?=
 =?us-ascii?Q?jpvrHQomjGA4rzF6uUlPoYROWRQYoSyVbYdoklCXq+lMs4cTvfjbCz8+7iJI?=
 =?us-ascii?Q?jFSxLlFYU48i6mwXmWi0xO89LRy0hZo6qrWOqqUBPznpeJMIya2F0BF569L7?=
 =?us-ascii?Q?9YXqvtuHCXC5u5U686qGqkdzp3nwY756V0OP9MUI73ZbhdUt8pmBNWgsUpu4?=
 =?us-ascii?Q?l83Hi6TH92syjU5hNZLsU3KeezjXNNqe8RpDUyFlprJzmk4rTiqu/gaIaIZC?=
 =?us-ascii?Q?RC6HgoO27Z7EwPNXenZPI7yrju5U3bJ0OtqMjz/rBcFx3bY4HYr9pVFDPsvj?=
 =?us-ascii?Q?S7Yb8QMJr+ECktjeOx3SKiLAKdkpELRCAATgZN2zgbSDC1BYCmGQyJcbpKLU?=
 =?us-ascii?Q?yZvdOu1kKeoQZJfMtIPV/jdmIIysBQYqzv6Z85Hfstk5EiJODp/MI6fjcB55?=
 =?us-ascii?Q?r3JFzUgw9wvn4Fusd9qIqnWSwQMIxvmlh379x3SdA8KAf3khSdOANvmZB0kI?=
 =?us-ascii?Q?aDwQ3pa1YUpUrr+5yv6OclLczsyT2oJecPp/a0sfPuES0OCiZkHZDQ27cWGc?=
 =?us-ascii?Q?H7BMKtlogcFJrLMUAIlg8iYGCdvaGjMIr/deIIWlCtuWF1gpRLNAtAcAijsI?=
 =?us-ascii?Q?A6ORbS8lyEmEb/zcOaCNYJprxVGon4UP5dkpDScUhzbfVpk/G2PM78g2Yugu?=
 =?us-ascii?Q?XadvDedQgZMlcpbsMJ3m4yoEM4Kp6KtgDBxB5qFzbZiVaMAVtReGQ+KdIX0F?=
 =?us-ascii?Q?AB6fKtyZ2TG5AdekdPtj1m4XRkTGesz2BMeqRj8XpVq9LPXhfhT/seizQ48Z?=
 =?us-ascii?Q?GHdK7impaFMAa41ti7KTLipGLzZ990O6vZfxy9THkNbaDcfwfzsTTbROoxMu?=
 =?us-ascii?Q?z83oWO3+zEOymVuZQFGQYjMwwwAFdRITUjH6s2/kMPizWt1E8dsccjk7s2F5?=
 =?us-ascii?Q?OFLbHv+FOITsUkyRghyvlquDpnam7rZ8dYPTBfKV+CeKQAtp32Z2B0tAFE5U?=
 =?us-ascii?Q?fI9jyQIDDs03N6tiaJJH0YFQfnsf2omhA1d9MHpecsQKT5fbYiY9TllJaftg?=
 =?us-ascii?Q?gm6wDj5M5UI4Ylr8rQqE2iWW+Ad04jm4NI6fdrMGs1Bs+RYF1VKxa9rEaXK5?=
 =?us-ascii?Q?qjDScY/Ll3Op3fBBf9hpWXEMCJTdwHNWg1pxmOU/O6p88ubvDccriOD4tbMn?=
 =?us-ascii?Q?NsFcLXnvW41g/igEAfNBDXQ71QegkjbRPYYngebR+gKpyyZwlElEBNoEaTMg?=
 =?us-ascii?Q?gmCxKCD2k86YQnd6L6KNEvR8?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef0a77e2-2037-4d1e-8321-08d8fa8fed9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nmh+yGh+A5LkUxeR1athsiOMM7RpkAcRMEwpoaoCqTuUcGyB9JcsJxnIfRJX/M1qDBR75qMuEueHacdIFZQS6CsPdYydXG6fezHZXoREzE77d9J+sLrbKYEJtjqBFXF1s7Tpujr9gNfiBJIVpiPZ0MjtEcMg6wWRJ2pKWRPDvLcwSrQnvnhnZ7jAP5gBknEF96g92a32JqshXF1Csk7V65va6x9mLPW1msZLCgUmnDRWiHItaRCiiqjAWC5Wpjxg+nm0VAlZjPsNi8Gajjcs5Vfft9BC8MTK20MszlK8DZM6GoSVFMOBJsXWvMuxFFJCpbXsbP6tz+EsosktBqfM9FGc6lFs5YNy3yf1E2+pY+d1iDKcW2g20pW2t+MIV8+dt3kC6G9g/qOuQJcvenHdLEdu6mPML41TnkOuQT8S/zOiE5pAGab7kEWZ/PBQDxluj69CkFd66oCdzWAk3fd3RypDiM2EupEpk/OSHNFi0+2RthTyVDYqdsZC2xfUXGeUOD2orFWVvD9xpSEi93bMhzG/SYxTRUn+pHsC/pJv1AFuF4ZpTOUMPjyl3T3GJaODOEgjSJEtyO1oZ8LvcgEsxgFtnL6JaOIQgvlTLU48DEpNYSze/q6u8jtqxZS7PrrYZdGS34YVOL4gkCs4QNJmm4aXICwPMCA0rosNn5CzaVQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(26005)(16576012)(4744005)(8936002)(82740400003)(356005)(478600001)(16526019)(4326008)(81166007)(336012)(2906002)(186003)(6486002)(47076005)(53546011)(70206006)(70586007)(316002)(33656002)(6862004)(2616005)(82310400003)(36756003)(5660300002)(36860700001)(44832011)(956004)(54906003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 13:12:25.4859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b97c0583-f2c4-4bf4-26b2-08d8fa8ff423
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3193



> On 8 Apr 2021, at 11:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.04.2021 11:48, Luca Fancellu wrote:
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -419,7 +419,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) =
u_domctl)
>>             {
>>                 if ( dom =3D=3D DOMID_FIRST_RESERVED )
>>                     dom =3D 1;
>> -                if ( is_free_domid(dom) )
>> +                if ( (dom !=3D 0) && is_free_domid(dom) )
>>                     break;
>>             }
>>=20
>=20
> I don't think this change is needed - I don't see how dom could
> ever end up being zero. The code is already intended to be safe
> wrt accidentally creating a domain with ID zero. (Granted "rover"
> would benefit from being moved into the yet more narrow scope,
> which would make this even more obvious.)

Yes I agree, I will remove the check in the next version patch.

Cheers,
Luca

>=20
> Jan


