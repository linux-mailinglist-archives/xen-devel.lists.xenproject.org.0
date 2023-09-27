Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98A7B0FA8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609182.948101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleJT-0002TX-C9; Wed, 27 Sep 2023 23:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609182.948101; Wed, 27 Sep 2023 23:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleJT-0002Qo-8s; Wed, 27 Sep 2023 23:51:27 +0000
Received: by outflank-mailman (input) for mailman id 609182;
 Wed, 27 Sep 2023 23:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8T5=FL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qleJR-0002O2-2Y
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:51:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe13::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c34ad8b6-5d90-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 01:51:23 +0200 (CEST)
Received: from AS9P194CA0026.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::34)
 by DB9PR08MB7675.eurprd08.prod.outlook.com (2603:10a6:10:37e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 23:51:15 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::93) by AS9P194CA0026.outlook.office365.com
 (2603:10a6:20b:46d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 23:51:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Wed, 27 Sep 2023 23:51:14 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Wed, 27 Sep 2023 23:51:13 +0000
Received: from 9119fb056a23.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2734ACB6-748B-4181-ABA7-C9D8BFB9968B.1; 
 Wed, 27 Sep 2023 23:51:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9119fb056a23.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 23:51:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6105.eurprd08.prod.outlook.com (2603:10a6:10:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 23:51:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:50:59 +0000
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
X-Inumbo-ID: c34ad8b6-5d90-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBuOaCTR45stCCxIoLUYSUEQxxPFwRRQ+18KGY0xOh8=;
 b=FX6pQkEiBAB7fKR1P6NBikKYYFGr6FsHq4cr17oGLQrywshH3CEFJaJ2ZQorTuMVGpUhQsFxpzaFAZu4zcigONZ8n9WWVLXm6287HeuLQfINwVfPP6u9bB7Wz+/dBuYrACNCxFMAfbbvggNP4Cu2PNQhRDJs4N5acxFLZp/Y6Mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2769e6d640be69f4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9gs7YIuoJRIN40ILIrkPMNsFt2mLmv863KoIXjmv/s15tRD+HK5Qa+g0EFoLyHVMrFYkuFETFsITGkXM+L40J2viLR7LSQ0BI2zfKTsiu/LHQzL34PrYXMjBg4XITChmx1Kxb4Fw12kaeZQJgAHFKGZTStdxMTr0CHH1/KLnchh1PNpSWxq5aDccpOg2N+x5zi6yTRJiXPma/Gx175+e+ybBd5NVhRCoCTmtj18YyPKoteB1lMUxwdLoQQBxA6vMWc+sPBnHvfzzpr30Bsl8ZzZ24ZdRh81bGk/zVAXdbCpX99/rQMpg9hmXoYavcGSfFUjY+ETiuZqrNog70RDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBuOaCTR45stCCxIoLUYSUEQxxPFwRRQ+18KGY0xOh8=;
 b=ZhSb9CoPAhCgHCyEKr0nqW58Qz3QtcEMBWDEQhR2NnuMqRU/4W0KOoWQU3RUIS4EGRMoOk+4xgLOn1U4AWEJte0hDvxmvllmhUr8g+jmfvW6vdlQOIJO+xPK+y058ahZbSe6X14X57LPeFOKAtbhBf7/yjq3qD4FhC1aCciBb6EGgJ6coNjP6vm4spaJnsguYHfuWDRJrgfSvvMop/8DqswQ6q14FFqv24Ta5N+7sgKuamy6MAoEcKnpIKgFXgKBmkBXOU6oe5Bzn7W4MmKjyq/Epj1Bx3lGJ80kQQdBkZBMdG8qPoAs4KR7V2WxrdRq0TAJbLHu+pgDUdunjsd10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBuOaCTR45stCCxIoLUYSUEQxxPFwRRQ+18KGY0xOh8=;
 b=FX6pQkEiBAB7fKR1P6NBikKYYFGr6FsHq4cr17oGLQrywshH3CEFJaJ2ZQorTuMVGpUhQsFxpzaFAZu4zcigONZ8n9WWVLXm6287HeuLQfINwVfPP6u9bB7Wz+/dBuYrACNCxFMAfbbvggNP4Cu2PNQhRDJs4N5acxFLZp/Y6Mw=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"wl@xen.org" <wl@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Thread-Topic: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Thread-Index: AQHZ8Zk4q0YFU+4IqkCxx1TGfRQp3bAvV64A
Date: Wed, 27 Sep 2023 23:50:59 +0000
Message-ID: <F9C3C613-B09C-478F-99C0-46A5A80DFDF1@arm.com>
References: <20230927232004.1981595-1-sstabellini@kernel.org>
In-Reply-To: <20230927232004.1981595-1-sstabellini@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6105:EE_|AM7EUR03FT048:EE_|DB9PR08MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 91adc0cf-cee3-4694-93be-08dbbfb4a248
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4XoC5zxBXzJvQmUCHPlBv+mtOTGrc27Wl34oRzK07zZulPU9RJ8j2IPEc5fXLmi55RmUEypfmCMJZNQzbZ9ldLwPgG6+mhprjgriV1deDVZMZJrxw6GjEGNQniyYeuZDDVzEC/Ls1cmcesTdYoAgkap0vkqRAojW5FTNpz09us9uJUv2T7lYHlqWQLaYQX/09YjQs4AIMVTyZrKw3KPVnfW9BYI6XcITpgy7WflxnlYz9jx3s/9Ol/M1DNusP7N75hkbXgMSjzioksCleF8It4jtom5CWRcSE+NIzOWH2UJ+GA8QWQt/AlJXfJonDs33cFPoO+Au/+oe3KuNyKB2sPKOVAUy5RU4xVO087HdK4YSCfmy0mefmn/3HirOsJE1p0T20cW4Uikfg0NDAiTCxg3XV699ysh9rZ0ji61auUKKxARpRYJr68YQEWEgkcavv24R9zwpucqh7e5LiwEIRY2Av4KCb6qAvBC9fLwyzr2QBNVwW+4JqZYiU3iFzR8Uf9iCwDO+gIEKhRIYFenhEUrlnlWoSLVv78R579pEDaNLgS2hSnfGu58rYgzGvFGYrAuvQxnA8X0ttx+lUH91qZ6PyT2Q5WBfGNZYqx8JGj8u/BafhWb6d3xqwa3y64ZP2H/hAgF+Ld0ZCbAmoYsoHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(36756003)(2616005)(26005)(478600001)(38070700005)(71200400001)(53546011)(38100700002)(6486002)(6506007)(6512007)(33656002)(66556008)(66946007)(316002)(41300700001)(76116006)(91956017)(6916009)(66476007)(64756008)(66446008)(54906003)(5660300002)(8676002)(4326008)(8936002)(4744005)(86362001)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8ACCA3DBA41F7C458C772876C4ACE3B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e85aab7a-0d85-457d-19bc-08dbbfb499b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eozKehyndhoYEReKkB4b/ofSVGNMIXodbD3yJQjrDqp7K4MvEeXcWX/d8NqQJemYt0BMJodJTkylpFuGAWIga8J8Ns8abcAzc6HVHZXfb9o0N3kHV0acnuycr+N9E0cMONhny4Nn0zfk8MOKuu/bAob2MKMHpo0RZCIRKJJEMcxOHH+4XucJ0zn1ywk3VaSx/LLpfPhWvlnZEKPYly4ak3ubn4lSUIhmzA8GLFFipGjPy31IlNArkaVjOjesBltqpvESb2jYUtd/+pcQWqEHJdt0nk4QadOGpm3cXSfaSFi55ZvT7RqZtvNrIworQvtATIZh0z3Akpchm3bSWKO1qG4RSpGQdHOHKgCSi5il6VPpFeHFz2Fe3THFtbGDb5fgY/ELC9uZ36WCGJ4J2ImeFwS1bgP8qm7W/kL3k4B+QkHMgfgFwDQIFC6Fitnk9899z/EHRBUnPhj4pcWgWq0z1foVhWEfoXRWzfnv2hFY6KCH7A2TuhtI2nW+cXE2w5LPOqv6Z0vf2iXNPxBD/RYsnx5aO4c8qlZ3PbZub0jHdN2/YM26H827YYtkx5gMKlQHpP3sQ+xrTpiFVRZfE7XvUVzdjPU/JfjRSmcsJAoHf8cUheIBaQFU6iabx5D8HSQZFXx7zFranmCvcVR106nHXee30CcnJ1vt+HkPvYkz5z0bNLC5fz+PZwmgLCwbeCQRuBMEL+qYsb85qXjTAzP2LqiVXLgUCjCeVCA2kXybjnDHbha6wtmoJ0nBf2r2h8Nc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(6862004)(8936002)(2616005)(4326008)(8676002)(36860700001)(70586007)(54906003)(316002)(336012)(26005)(70206006)(86362001)(4744005)(2906002)(40460700003)(47076005)(356005)(81166007)(478600001)(82740400003)(40480700001)(33656002)(53546011)(36756003)(6486002)(6512007)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:51:14.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91adc0cf-cee3-4694-93be-08dbbfb4a248
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7675

Hi Stefano,

> On Sep 28, 2023, at 07:20, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members. We could use QEMU to test it, but even that it is known not to
> work.
>=20
> Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
> for clarity.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


