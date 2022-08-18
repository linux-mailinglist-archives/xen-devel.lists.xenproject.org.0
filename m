Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23499598488
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389552.626548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfpX-00065F-39; Thu, 18 Aug 2022 13:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389552.626548; Thu, 18 Aug 2022 13:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfpW-00063R-Vp; Thu, 18 Aug 2022 13:45:02 +0000
Received: by outflank-mailman (input) for mailman id 389552;
 Thu, 18 Aug 2022 13:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOfpV-00063L-Sm
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:45:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f472d88b-1efb-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 15:45:00 +0200 (CEST)
Received: from AS9PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:20b:48b::8)
 by AM6PR08MB3878.eurprd08.prod.outlook.com (2603:10a6:20b:8b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 13:44:58 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::30) by AS9PR04CA0074.outlook.office365.com
 (2603:10a6:20b:48b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Thu, 18 Aug 2022 13:44:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 13:44:57 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 18 Aug 2022 13:44:57 +0000
Received: from 62d2da611fe2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D21B7EBB-84F1-490A-BF12-2D6C1B6E588A.1; 
 Thu, 18 Aug 2022 13:44:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62d2da611fe2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 13:44:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6671.eurprd08.prod.outlook.com (2603:10a6:102:13b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 13:44:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 13:44:49 +0000
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
X-Inumbo-ID: f472d88b-1efb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cB5v9/0o2Z1BIh3JqERtizM6EYVWzCrDiGp3G0rkkBOVnqI3Zo1X0WVbAez6HSWvX/5F1hDpcHkvlCm5wBIz2AItu6SA9wEcWRPCoxAvHLbQHkc5NerVchMBspI4GrsUPIXhWyi/WgafoeGCVfNu1POy/hIOo8y3IJQD/DG2rl/yxN1KQtcvd67R7ln4CQEUtigSssXE/1HZGeL7eLo8G59AZfkkl4oJ+gMmuMYM87+VxRW3RFTL94ltkPgv10NSlOP4MpsAm1Q/sbP5cK6gVv+Eh+oT75ebNS5wiMgStLYhqukG0Uzj4SES6/VoKkDcnjJSRVDSMa2ciNXd4dTs9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSbXvASIfaOyoWZSvlXd6lPnXEl9ZP2YmkVL+G1bwUU=;
 b=XJSHoyIfqtv9sFYneORoFjTf7oyD+VATBNFLg6ovZemhpt0eWhWBnUv30D8ujknqZBysRQee6e2xBwzRNw6s56TS2O96m+RBMHBXnBi6dMBlH2nq6XShKEROQ5JeZIbJmVk5kFuXbFCAjr+/lt7sTrJwJzVxORsbh7zr3NkrjQH9lKggo82NQO8SNRVYWZ+eggcEjojFb9xp+EMK6EaqS8PZJC+4D1pESBA+t1TH2Yys9vRFPWldiOGXlFCjVUjJjSCH0XRI+Oe3ocumAYY7LIZRRiGb4xy3XqH8xk0Sz1+aNc1LzolHtidHutH+Gfn1xQC6QAjFlVJyOdteArmGjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSbXvASIfaOyoWZSvlXd6lPnXEl9ZP2YmkVL+G1bwUU=;
 b=VYSp1K5R3GmWQMCNR6oU2QZMoJOboehth7jb30cLhBO857gxhHqVLICySfOo1jYVUpMA2guJr4jPgJ91EJs2GqrZdYOKVmlXV/qmo6sFm8E6bKwzTnxjDysdaPKjGQBCf5ntAsXp4dbwbm4XSjtbWxUdcfvH2D1THWE5AzpDqGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e5b087d091a6820
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABCkRoIcB7ZPh+B3PY5MEjZnbFaWvt0iwHJ1g/TGXsXJVY0NZ1/3Y3Z1O2ncrmtSyMkZRiAYegyXAYU74pdRDhFP7y2wevOxdtEjjJsepEKF4Z3YrXgRgmzKDP76RMtuIVDE4C7KGmPFLZZdsDfXbBVoYypeYrbPLBrBmRJqiyUPTTaVyRo13qrSGwVVgonWu6Tp16LAXeZXfxIMsIOHScRdS/IUjrvcAdlfQ/KMKPN16BfVG0FQCVaVgbMZ5w2vooThMsWlafL+vdb6zsJ/Po10eUhLqwYE8ZAiqjzHJzZ/XFavgg4qvb0ngd0nCbF5yCetpuAVrLdlCYngj6spfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSbXvASIfaOyoWZSvlXd6lPnXEl9ZP2YmkVL+G1bwUU=;
 b=Wb0q7VOmOumoS3GDNypxQM5BNmyO9w+t/a7cnW6H27MGPtTpCzTcumCGuQ0sXQhiOiXluPne1YQqkozwF6nE4uLG4Bp5q3s75U42KrxmLZUv8ivv4Q0Gp3rPJPMJ+8s03z2KjfiyhDNzJZ8ZpKiE5SPxf1GiGT9Mn+OAUEwztXLaEwsCURT2O1yVWxDgrTw8M0Zk+X94ETCJjPX8pjEDwUWVXWJjUgcLaqt3U7WFngnklubC8wdGETHllIsXhgXATa6CqfADWpiem7CDfhtZcMBFldTuKBsUp+Hc6LxWk/MxwOw9SoREqJRwtp5xpFxXdBF84hktAvcg0kogz0r65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSbXvASIfaOyoWZSvlXd6lPnXEl9ZP2YmkVL+G1bwUU=;
 b=VYSp1K5R3GmWQMCNR6oU2QZMoJOboehth7jb30cLhBO857gxhHqVLICySfOo1jYVUpMA2guJr4jPgJ91EJs2GqrZdYOKVmlXV/qmo6sFm8E6bKwzTnxjDysdaPKjGQBCf5ntAsXp4dbwbm4XSjtbWxUdcfvH2D1THWE5AzpDqGc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
Thread-Topic: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Index: AQHYsvEkHkqzGWJxi0qzDFcav/qI3620q3mA
Date: Thu, 18 Aug 2022 13:44:48 +0000
Message-ID: <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org>
In-Reply-To: <20220818105601.1896082-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c515b591-2656-4adc-2e2e-08da811fd71c
x-ms-traffictypediagnostic:
	PAXPR08MB6671:EE_|VE1EUR03FT055:EE_|AM6PR08MB3878:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3UhaWi3td6u1RdLLcVSQK3ppF6bxGhMNQLk8O/ghQL1PeddEal2jyFop8uTCqz4iZYH3NHlQgDUMUJOPMgrgDhxnzl0qA72icQoD4JivW/X8doOs7l0N0G/zLR6OGcrDh+o0I14bUmarSpT+7i+TNIAsAUvyZzpAJPH/abypgJ5ICzFY4b53qLkh+gQOipjjcrDdgHl7Mn4PwTeYQ5+MpSiSAIxr356OMQWg+dE38wAKOtl+iqRk3tADm1DrJiBNqcOr65f03zXpk+S8VoJZXbhtl+E2JTbeJ3r8mUb1JO4zrIoBKfiGolzLtlY8Z96gjt95m8x4Qqq+tp3ZgCeQv1EP1ImAFEGtNGuseVadjQxBpHGtw9lM3K3PsqxAUCBKe2SnM60Rv9jVO+EQcR++7fv/kjN0XwdlrY3wXHKAZ6xwm+XFY0fGxT4Eej9DxyQuwOUV3ASLO6zsUywS/QHU1ZBO4avZvqboUB96Rj/BikZVDP6/iI4cK7SZINUycN+L0vvOBKiMDxmYTKP8y9vrU01CilrNcu1a7boFLmEoQlgbFTOBRNWI143SS0Q2TdteahPs4fXtJ3OcfEm0ekfWBzvfOwz0eLn1d89VFur0XfwB+Km9DpNDloz7TCtDUJL7ok7UOkCsPAkS4AYXWoemuVIowLIUzH98TSvFvqx3eA2s1qdW2LBXIXRdpj75B2XKKRLNZPjcsgF1neKJQ/9Y/grIRfMqsUGDppRsJOBV1WapIKYwFmc/uMIvkGTdR5gIV+3qLYKx05DIl32WVx9PsExU4sjWjloHYsDMC7nw3jfnn84KSiyjwghLCZOVHCrneGsmzFBiAmsL8FIKDKf6ag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(5660300002)(2906002)(8936002)(6506007)(33656002)(86362001)(26005)(71200400001)(41300700001)(66476007)(186003)(38070700005)(2616005)(6512007)(122000001)(6916009)(478600001)(83380400001)(53546011)(966005)(38100700002)(316002)(66556008)(8676002)(64756008)(4326008)(54906003)(76116006)(6486002)(91956017)(66446008)(36756003)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FF8AFE83E28B344A2C0C59CE26E79B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6671
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96902970-6377-4384-572f-08da811fd1c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TbfUFy5og+j4TKTOEJuEBmv4OFcmBJqPrL2zUCbXd61iTaiV0rYVo9JJPu8XFOqwJ3GPm858JGRT5HdlWXm9CUAsz1TSD+Z9OE/8RJeONJv79bv3YRrNFN60kLkwCC0+jqdPNze3IlnVfWz00+dITVaWqLTo3tn/rVPs0nnET8F1kjCV8lGeibnW9FsCleR/x374ksA9T9U2NXR4xYsEPswtz12fpvracrAKpHjBt+5g5HmI7l3wAaxyMN16ryfIGtY2THGhcCY50cgfpcmELV3cknnQ+NIaYMfi9YUJ/rOhJtCOoMdA5swdvT848cDIeB1h4p8VQZ3KcCYdk0oUW645hPoBvkvKJ8UZfDZXAoZdx15FgnevCqKghHQfotZbbPBvGRRJR24yZfX1pd1mRyrqcbaHYU+qcwppPFJvn1wQxOfeO7I/02BoE23WJJj9+nRxu78Eo7pVNd8IOIFIaQtTr5iLy5b9pB9TRY33H2JGun1A8CG3OWERdJocEfyq/SYcGwBCg63YQMFaxW0qiwVdmwES3x0GdX8RsO4sPJ2TrDnUPXVCE5B6BX0LFBo32kAzOhWTvaxG7TdbZ0eS5y3C1nyPcOmhVl2SrLNjURN1VovnmhW3jc4hUBcjmwJtsb0E92hAHwaZkdC3DqYK0weIwLeQ01Egzs+rOiRancMnHpcnStmeDyEe1T/mPbq7owc3XNzGpu0kRWoAMJnqYU4olkVZghV2GdzcCYsmbanYXQxJdCuC7DmVQewSLb5NybCq3fhPWsyrepXGChIcIj3Dvx+d49bwoV+7hV75CG0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(40470700004)(46966006)(36840700001)(26005)(6506007)(53546011)(6512007)(36756003)(36860700001)(47076005)(8936002)(2616005)(40460700003)(478600001)(186003)(6486002)(41300700001)(336012)(966005)(83380400001)(82310400005)(82740400003)(54906003)(316002)(86362001)(8676002)(356005)(70586007)(70206006)(6862004)(81166007)(33656002)(40480700001)(4326008)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:44:57.7701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c515b591-2656-4adc-2e2e-08da811fd71c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3878

Hi Jens,

> On 18 Aug 2022, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> registers and result registers for the SMC and HVC instructions.
>=20
> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> parameter and result registers.
>=20
> Let us add new interface to support this extended set of input/output
> registers.
>=20
> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> extended input/output registers") by Sudeep Holla from the Linux kernel
>=20
> The SMCCC version reported to the VM is bumped to 1.2 in order to support
> handling FF-A messages.

With this patch, you add something so that you could call SMCCCv1.2 but in =
practice you are not using it anywhere.
I do not think this patch should bump the version we present to guests.

>=20
> [1] https://developer.arm.com/documentation/den0028/c/?lang=3Den
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
> xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/smccc.h | 40 +++++++++++++++++++++++++++++
> xen/arch/arm/vsmc.c              |  2 +-
> 4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-of=
fsets.c
> index 280ddb55bfd4..1721e1ed26e1 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -56,6 +56,15 @@ void __dummy__(void)
>    BLANK();
>    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
>    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs, a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs, a4);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs, a6);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs, a8);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs, a10);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
> }
>=20
> /*
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index 91bae62dd4d2..c546192e7f2d 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
>         stp     x2, x3, [x4, #SMCCC_RES_a2]
> 1:
>         ret
> +
> +

Please only add one line only here

> +/*
> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> + *                        struct arm_smccc_1_2_regs *res)
> + */
> +ENTRY(arm_smccc_1_2_smc)
> +    /* Save `res` and free a GPR that won't be clobbered */

The comment here should be fixed, you are clobbering x19 hence you need to =
save it.

> +    stp     x1, x19, [sp, #-16]!
> +
> +    /* Ensure `args` won't be clobbered while loading regs in next step =
*/
> +    mov	x19, x0

You do not need to save args (and no code is restoring it).

> +
> +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
> +    ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    smc #0
> +
> +    /* Load the `res` from the stack */
> +    ldr	x19, [sp]
> +
> +    /* Store the registers x0 - x17 into the result structure */
> +    stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    /* Restore original x19 */
> +    ldp     xzr, x19, [sp], #16

You should use ldr and just load x19 value here.=20

> +    ret
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index b3dbeecc90ad..b5e3f67eb34e 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -33,6 +33,7 @@
>=20
> #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
> #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
> +#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
>=20
> /*
>  * This file provides common defines for ARM SMC Calling Convention as
> @@ -265,6 +266,45 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a=
1, register_t a2,
>         else                                                    \
>             arm_smccc_1_0_smc(__VA_ARGS__);                     \
>     } while ( 0 )
> +
> +/**
> + * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
> + * @a0-a17 argument values from registers 0 to 17
> + */
> +struct arm_smccc_1_2_regs {
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long a8;
> +    unsigned long a9;
> +    unsigned long a10;
> +    unsigned long a11;
> +    unsigned long a12;
> +    unsigned long a13;
> +    unsigned long a14;
> +    unsigned long a15;
> +    unsigned long a16;
> +    unsigned long a17;
> +};
> +
> +/**
> + * arm_smccc_1_2_smc() - make SMC calls
> + * @args: arguments passed via struct arm_smccc_1_2_regs
> + * @res: result values via struct arm_smccc_1_2_regs
> + *
> + * This function is used to make SMC calls following SMC Calling Convent=
ion
> + * v1.2 or above. The content of the supplied param are copied from the
> + * structure to registers prior to the SMC instruction. The return value=
s
> + * are updated with the content from registers on return from the SMC
> + * instruction.
> + */
> +void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> +                       struct arm_smccc_1_2_regs *res);
> #endif /* CONFIG_ARM_64 */
>=20
> #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 676740ef1520..6f90c08a6304 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>     switch ( fid )
>     {
>     case ARM_SMCCC_VERSION_FID:
> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);

As said for the commit message, I do not see what changes are making Xen pr=
oviding 1.2 interface at this stage.

Regards
Bertrand

>         return true;
>=20
>     case ARM_SMCCC_ARCH_FEATURES_FID:
> --=20
> 2.31.1
>=20


