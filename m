Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E36158EC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 04:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435436.688804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq3za-0002YU-5s; Wed, 02 Nov 2022 03:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435436.688804; Wed, 02 Nov 2022 03:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq3za-0002WP-2x; Wed, 02 Nov 2022 03:00:38 +0000
Received: by outflank-mailman (input) for mailman id 435436;
 Wed, 02 Nov 2022 03:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unuU=3C=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oq3zY-0002WD-6w
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 03:00:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849dac6b-5a5a-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 04:00:34 +0100 (CET)
Received: from DU2PR04CA0216.eurprd04.prod.outlook.com (2603:10a6:10:2b1::11)
 by DB9PR08MB8226.eurprd08.prod.outlook.com (2603:10a6:10:39e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 03:00:30 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::81) by DU2PR04CA0216.outlook.office365.com
 (2603:10a6:10:2b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Wed, 2 Nov 2022 03:00:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 03:00:29 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 02 Nov 2022 03:00:29 +0000
Received: from 7cab5397478d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52011106-587B-4BA4-A671-543468190550.1; 
 Wed, 02 Nov 2022 03:00:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cab5397478d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 03:00:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9666.eurprd08.prod.outlook.com (2603:10a6:20b:606::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 03:00:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 03:00:20 +0000
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
X-Inumbo-ID: 849dac6b-5a5a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NQbLLcQ/KcgmL8JdIZqyBuMwAhBz0O76wykwKnoTuTYL7zBClUhvzvShokS36yD7CeYOxPASHGgAstA3sjqizXFAMovS/TUZQAOZg8LuKVsImZXaUdi3vBgLAl1gs2uW6vpHB8f9IueRWIe1mTL57LpEjJk1wBJzk3en/JuaXnnocOzW1EO7z/CLxdyHPVOOkBHULDP4SKcrbak+jwrqM3wCxxXdLnMdoGg4RQV7M9cYW/n2k/iodVq80gkWQ98RqqYN4HRGLs8Pk14JrS7obyN0/Rn3HNS7bdAwp11Xv5NMH3gYU5Xt1kw+PdrcUzC8WOXirWjs8kHOAOfq1jOShA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afh2g8IHnLtSRQc/BsQlf/r/DdqKy5FuoqMnnXz9Q6c=;
 b=FiRpZf+BQD9oXaVt1w323NPkDi2hmdFRiaYppZWJoLgHgLX9Gcn9aLL6L0yxx2LETwrM4C0xWWG959I+JRpB7bv4STDaslsqkRfOIdQDKAtX+glH/h+aWAjUjRJa+x4IBSBuG7QSfyvQYK7fWBT8QbhK6/2TOx+pPhlevrt1uh8ZkSh1Hb0Fi/8tOgtwthHqa/+FitKoPg2MjQP42CwulA9QllmWh2WrgNxgopZiMdErFj+DEHXUCJXqlx4KOio2farR4yBREMXn8PYyjXpiMTU+bb6Fxs7grZ+A1Qh59LJBsvjsimHZzbLTKnO3k8qIJyDa/tIQRb+ELC39xInfGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afh2g8IHnLtSRQc/BsQlf/r/DdqKy5FuoqMnnXz9Q6c=;
 b=0jIMjoc5+v+mYLfr9xhCniaZQ7HwIIf3whC2n1OlYeQNjTM0pPADOkd0Z5xFo17T81xH8xkR5ZNrBY6AW2PfDKm6hy131F16MzzgClvAzGOjA0GxnEyGjiqBvBhyqorv/Gc/JmT7sfeT41j63CUev48Rm/GjHD0wMJNSzTEc2lE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljkW8dPSq+HDUEV46uv37Q4BrKWRLazvBZMdE+FJu8bQlTDf+MQzo7krQHEyHzehuFzA4lDYbtjrStfPZFDnWdC/CkwKaADIQT/Z+z6ZzhczWEQSRUj8STToGwlRozJSbzKrMacdZQNDq0Hje1cJM4qaj/CQfWwf7S+hvG6WY8lFYHo8pWOoVI8Hot8c6PAsgRhabqd8ahcLmQhGKKGG1oXiFLtN02d5usxmMgo0/mxkAVPCEpLbCIlqm9iYtuMyZphZtV3QLFVjc4A2YQyuRuyICvYXeg5WOSzPapFCICGRdZTrb0V7mN+kwuWFWVAqbljTIUui2IExUdns732jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afh2g8IHnLtSRQc/BsQlf/r/DdqKy5FuoqMnnXz9Q6c=;
 b=Wr7Wsau6TGfA83TCxNujMBvWZmCDHoivFQ3ynQ+mj1+9a1dQlVsBA8W2qi3Ia7u+SLWlaIYeOAdoNcRt8fuAij/aOMQi/oOaoxFpjLBnG2ODle/ONqWMCVLkXEdQWUBu0Gn0dtX3er9XF4DnBxlxECOXdyho4dxMsh3uV2y8OBUTGtKZ7r7+fNO83Cxqbgrpw5s1YQuzB6pU3RtgV1q7BorhAMTOdoN4h/MgInTWy41o8kwCPTUO9P8kLFWP71amqTfaCzEdbc83at+d64K4vPIi0zeantdc0fd6NoUZZRj5cTgEpGlzXxG1LhWBD8MId5Qvgrg+FeJZJgeMQedkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afh2g8IHnLtSRQc/BsQlf/r/DdqKy5FuoqMnnXz9Q6c=;
 b=0jIMjoc5+v+mYLfr9xhCniaZQ7HwIIf3whC2n1OlYeQNjTM0pPADOkd0Z5xFo17T81xH8xkR5ZNrBY6AW2PfDKm6hy131F16MzzgClvAzGOjA0GxnEyGjiqBvBhyqorv/Gc/JmT7sfeT41j63CUev48Rm/GjHD0wMJNSzTEc2lE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Feedback for postponing the 4.17 release to a week later
Thread-Topic: Feedback for postponing the 4.17 release to a week later
Thread-Index: Adjqh6nb7bpyTo+8QPKuDS/Y5NDKqwAI6YmAAAA21oAAAA9FIADukS/A
Date: Wed, 2 Nov 2022 03:00:20 +0000
Message-ID:
 <AS8PR08MB7991C642E1CDFA9B2B97E10392399@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
 <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E3BC93EE67FFFC41AB18970D425F9721.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9666:EE_|DBAEUR03FT047:EE_|DB9PR08MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c98881b-7f96-4967-c59d-08dabc7e6687
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IvzYegatshIhprjNdmafkGK2Ktz85zbeX091HKQjaud5wK3GixzCjsse8eJVK3Neac9tEFLbvXZs0Yrnlp9SeJ+Kt6p8wLqhGkUnrNeAVz5jb5WzKJ0FqkzIZfROxCrcB5IhYoS3EeL1kX2MZjRsj1aUldtUcEoyAOYXJ5cKaDFu3Cm45U5tBqbUqiN7MSR7wTHtehkSwEkYwlTMAlvpb/v4RPWnZE59qaXpPw3k7LPwqE54Mrlmrm+nNjDd6LVl7umkPv5sDCfiDHJpcx87sKZW2+iFyuuBBzyNm9/8kj/6E4CKFu1fdt9kTe0OmtgqPJI3gYT7JIEQnCsTxvhcOPi3+bl2kZsMB/U14WR5TgeIxE186sebxrqn28rhb0iq3plyu5EcWMG2V2/QcHOpTo9ABPq+2DHfpQ4SnzS7SFGF0z7WUPVkCSmvSZ4GyLxtU2SxvfpFDL1nPSFeniNZoI5a0VDf0OeKa5fcVVKRZVMKyVlkGWvwmpA1PAzyZ5ckXL3QWh4ivjzTxd4TwNReFUZ9zNDjFv3c2ksfHOZBm+9lEMh7wD1dZ1arVXvqzkNUQ5OCl1Fkrm+aal+fw3zUESDSaG0xtBsGO2wjPMiLqExrv9Vcekw4QaZKYEHh6h85RMhEvVqk8Ac9yPZqJSUyHQfkhCC6CPbEbN9e9bwjtD+rI5Xl5GizaTlGISMsXBvyp1Lm6DGq+GNVWL+Ct/xbzd6QfpZcNXA8ZWnwL5ZF1m3Dg+URO2EFeIjMqqFuwTcONTJqQzjseBYMdYnT4w//Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(38070700005)(110136005)(316002)(54906003)(83380400001)(64756008)(66946007)(66556008)(66476007)(86362001)(66446008)(4326008)(122000001)(76116006)(38100700002)(8676002)(66899015)(6506007)(2906002)(5660300002)(52536014)(7416002)(186003)(8936002)(55016003)(71200400001)(9686003)(7696005)(26005)(33656002)(41300700001)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9666
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29485887-e1ec-4fd1-5e23-08dabc7e6130
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/DeG6HuVbkbnM1V6lwKSUNBEXGSp7FNk8XFTVvKfxTdq8gvluRBD3giaDlgUu7yZVogkyDsfh46lxoY7FbhI+cVqvhzNlOKO2cY4h3yd2jzX7EEzHOq5pomwbm09gt9hp3teFbFnxDdYW4FsMOt29Mtpb2lx/0f/UexA9igPlO76KoVxWI1YpUjWsAnyJl12rpWYqKYUcsHcqx28qiUY1CTmxrYA+fFy88fLemhxuDvxiualNzLD3yaomxfY4yELBagrJv/+7XHabV/wAH3mND8z05OQvh0tduQfthcb63w2EvzuiIBkXxN2CDBZTUuoW2pssygORFMFXLxtnBcJWALrETmJGjbWq8t/EDLY6iBsrCMCyx5fIC3rHW5dHV/o/9kWk8+MyEVH8fHZg7kBqtlggcYdRVw/F+ImWc7fn1hAxYjTltN2Y+KSwO1lqJoh7Ag0zA1zHthkbWiyKKguVGNCSHSIIseWZkI6ojpCUSkx6tniSyILGgr12v1PUgBCVxtlcB6MkitezDWCfVp4K9aeaFj2TUe13xoQIMYUSssL8VY4CAf+gc5cTOILtPHzsRI5SK2X8dKdpuQYubOKrySMIXk3dxhnlakUziDSbYaaWP/3SEzoWrYyIXqr4HSV1CQkbc6AkaY7A+ydYdDzwyR98UYbQeKH4J5NFQHKRMAYYD/RecdcyJN0jwoH59pLTCwDgwgX4+G7jwuZN2ITGVhJBFfUrRO3ZTH+968eAOYUTKG2ATvdtEVYaj69sZBdOUBFsBHUIFoYJ26JBW5lOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(81166007)(36860700001)(336012)(7696005)(2906002)(186003)(316002)(83380400001)(86362001)(8936002)(40460700003)(41300700001)(52536014)(9686003)(33656002)(55016003)(47076005)(5660300002)(70206006)(6506007)(8676002)(70586007)(4326008)(40480700001)(26005)(478600001)(66899015)(82310400005)(54906003)(110136005)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 03:00:29.8421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c98881b-7f96-4967-c59d-08dabc7e6687
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8226

SGkgSnVsaWVuIGFuZCBKYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IFNvbWV3aGF0IHJlbGF0ZWQuIFdoZW4gc2hvdWxkIHdlIGJyYW5jaCBmb3IgdGhlIHJlbGVhc2Ug
YW5kIHNldA0KPiA+ID4gQ09ORklHX0RFQlVHPW4/DQo+ID4gPg0KPiA+ID4gSSB0aGluayB3ZSB3
b3VsZCBhdCBsZWFzdCBuZWVkIGEgUkMgd2l0aCBDT05GSUdfREVCVUc9biBidXQgSUlVQyB3ZQ0K
PiA+ID4gdXN1YWxseSBkbyBpdCBhdCBhIHBvaW50IHdoZXJlIHRoZSB0cmVlIGlzIG5lYXJseSBm
cm96ZW4uDQo+ID4gPg0KPiA+ID4gQUZBSUNULCB0aGVyZSBhcmUgc3RpbGwgYSBmZXcgdGhpbmdz
IGluIGZsaWdodCAoaW5jbHVkaW5nIGZpeCBmb3INCj4gPiA+IFhTQS00MDkpLiBTbyBJIGFtIG5v
dCBzdXJlIHdlIGFyZSBpbiBwb3NpdGlvbiB5ZXQgdG8gYnJhbmNoLiBBbnkgb3BpbmlvbnM/DQo+
ID4NCj4gPiArMSB0byBpdCBiZWluZyB0b28gZWFybHkgdG8gYnJhbmNoLiBJIHdvdWxkIHN1Z2dl
c3QgdGhhdCB0aGUgWFNBIGJhdGNoDQo+ID4gc2hvdWxkIGhhdmUgZ29uZSBpbiBmaXJzdCBhbmQg
cmVsZWFzZSBibG9ja2VycyBzaG91bGQgaGF2ZSBiZWVuIGRlYWx0DQo+ID4gd2l0aCAodW5sZXNz
IGZvciBzb21lIGl0IGlzIGNsZWFyIHRoYXQgdGhleSdyZSBnb2luZyB0byBiZSB1bmludHJ1c2l2
ZSksDQo+ID4gdG8gbGltaXQgd2hhdCBuZWVkcyBhcHBseWluZyB0byBzdGFnaW5nIGFuZCB0aGUg
bmV3IGJyYW5jaC4NCj4gDQo+IEkgYWdyZWUsIHRoZXJlZm9yZSBJIHRoaW5rIHdlIGNhbiBzd2l0
Y2ggdG8gQ09ORklHX0RFQlVHPW4gaW4gdGhlIFJDDQo+IG5leHQgd2VlayBhZnRlciB0aGUgTm92
LiAxIFhTQXMuIFNvIHdlIGhhdmUgYXQgbGVhc3QgYSB3ZWVrIGFmdGVyIHRoZSBSQzMuDQo+IA0K
PiBEb2VzIHRoaXMgc291bmQgb2s/DQoNClRoYW5rIHlvdSBib3RoIGZvciB0aGUgc3VnZ2VzdGlv
bnMhDQoNCkp1c3QgaW4gY2FzZSBJIGZvcmdldCB0aGlzLi4uSSBzYXcgdGhlIHhlbnN0b3JlIFhT
QXMgYmVlbiBtZXJnZWQgeWVzdGVyZGF5LA0KYW5kIGhlbmNlIG1heSBJIHBsZWFzZSBhc2sgZm9y
IGEgY2xhcmlmaWNhdGlvbiBpZiB5b3UgYXJlIG9rIHdpdGggdGhlIGFib3ZlDQpwbGFuIHNvIHdl
IGNhbiB0YWcgUkMzIHRoaXMgd2VlayBsYXRlciBhZnRlciBtYXN0ZXIgYnJhbmNoIGlzIHN5bmNl
ZCB3aXRoDQpzbW9rZS9zdGFnaW5nPw0KDQpBbHNvIEkgdGhpbmsgd2UgbmVlZCB0byBzdWJtaXQg
YSBwYXRjaCB0byBtYWtlIHRoZSBkZWZhdWx0IENPTkZJR19ERUJVRw0KdG8gbiBpbiBLY29uZmln
PyBUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0K

