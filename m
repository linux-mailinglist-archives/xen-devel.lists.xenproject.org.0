Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874D57D061
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 17:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372882.604905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYUs-0004eg-M7; Thu, 21 Jul 2022 15:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372882.604905; Thu, 21 Jul 2022 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYUs-0004c1-In; Thu, 21 Jul 2022 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 372882;
 Thu, 21 Jul 2022 15:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FenC=X2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oEYUr-0004bu-35
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 15:53:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20087.outbound.protection.outlook.com [40.107.2.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5057294e-090d-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 17:53:51 +0200 (CEST)
Received: from DBBPR09CA0036.eurprd09.prod.outlook.com (2603:10a6:10:d4::24)
 by AM0PR08MB4578.eurprd08.prod.outlook.com (2603:10a6:208:100::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 15:53:39 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::7e) by DBBPR09CA0036.outlook.office365.com
 (2603:10a6:10:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 21 Jul 2022 15:53:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 15:53:39 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 21 Jul 2022 15:53:38 +0000
Received: from 6abfc0c0a138.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBDDBBEC-7551-4A57-96B5-B8146F21121E.1; 
 Thu, 21 Jul 2022 15:53:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6abfc0c0a138.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 15:53:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7363.eurprd08.prod.outlook.com (2603:10a6:150:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 15:53:30 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 15:53:30 +0000
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
X-Inumbo-ID: 5057294e-090d-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O2tWMdBFZJwfmo3KKwTxFOwbbTqiiiKTIr1QMBIqV3F4uUSlJ7TTAM2tuFC3nKoRrHPdycqUkIDuZIHS3pH0Tud3ed2Mo/c9nJSEP5ZikQ8DEE8PhwlrMj5fJj3gXNVdXZrGn5NLE5QvCZAjyNXGI3tHsT9uqNk1LzemdYbwrN4mvVRXahCRIfWNUBYA4u8Bs5osikxjeAgjvSQ/cTh8dz8j2OuZVGL5DTEimuw6mz0WrU9rCGF6CZ4K8EZXi2sTvHYeX01uACPINTDROWmttZPBvOpPtiNS7MhJcMUtNCrcfDFn5TJjx5xma1F9dca99+6fYwvqaena9KnNMC1pdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7qqhMz9u9+zPwSI1CNZsMaoieAopSHk2OeZj4UUXT0=;
 b=g0b23Swn0i8dMqmkP1OARmr6RhPIzthNZle+cb1Mkhs3xKNM8SUa/spE8nypLvuXj2jUQ2y23lw2h0Jw6gN0oF9Z7DJ7CLWuenObo/iJfGmeUMKO9A5NYZs9im+bLe5HXf3DolEYe4q0fc4gTLnCCAifLM05dKS91Xw+Q7SCvVQpB6arLm27ZvBnkK8JKCqSmdfEAR3Y/3phewTTpoUaF5DtbQly6c3FXa6eO4ajn810dD/LlLFBd14nxxfm4udnqeULMpkclyb5Wh1zN0o9IPF+kwBPKBM4S5C/kk4HuowkcpoJnizq4kDhiqvF/3zGd/CHMmjY7OTIUNpM1ExmsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7qqhMz9u9+zPwSI1CNZsMaoieAopSHk2OeZj4UUXT0=;
 b=M+jZa8V6r6jzMbUh42tzgofwz/TmIDXXV5sDdAFnbVe2lY+gY4AajzI5qn4sk4bQ/UEMOL2vxDvCKIEhz5Fi8AHS7+UZ4mXWj7xKKz3zacQRNYS+LtL07a2SY+xkdx60hMWa1b+jNqz8JhGW4B7hoPSNb4Z587UVRtveXYtv4v0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4ff78273d246a4f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0sE+/yKwmObztipMkEMN4N08DGevzrzoJo2WxEb9JYkVD3jSGy3AFohPWuiP/xe4wSvyghFXAsUpI5YB8VFOz5DQgVGBxscySOXoNM26CB4bg96JDA2bpX2B6FjOFNb0inMw1Hmrt/fwcI99bc9xT9V8VEgJ0eJPKudxpXd1xEkOZ4KbVv/5lUaEQfpbvlzXBDqoD50EYXdFdxPA8l8WKWKYO9iDjEpKqk++AFTz2FR6xiK5IigInx7umsIUX7W9pD6hGkLSFyolFvVzfry/LDwpK+Ow6UAVukfDqvWoYkOYUXywrZ/P/9EzJg7BcxFk8dfd3l5uGoLM8aYJoLrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7qqhMz9u9+zPwSI1CNZsMaoieAopSHk2OeZj4UUXT0=;
 b=ibLErslqnjdeXrHvi9S1p3HhQHwEYfFvHjeavsOJWaSH9XT9eHLd09GfXaF9tklhOyxzSRThqEHE95vNNLdCGRmRWrD4c9Fx2fygo6/MjqCaOS0vJfRPKlkZZ52N0xthG9YbGKkJGKT4klOsoGIiAkAzTDzMr1J3BaO07cghakFI26SWthMAoCNaE9bo+IXUAeI/MVIU9+N9IhHZCooB3xoyhUtAa8h24ZiGgCBxivsFGHDb5iIIrhnTMRUolA/4/juz8qmcLjl/3S7+py3w8IMSK0WqX/j4l9pSHzxYxeiupdoZLzhluQLLWLvLhrXtLxvCSTyfNYJE1mX4nOFpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7qqhMz9u9+zPwSI1CNZsMaoieAopSHk2OeZj4UUXT0=;
 b=M+jZa8V6r6jzMbUh42tzgofwz/TmIDXXV5sDdAFnbVe2lY+gY4AajzI5qn4sk4bQ/UEMOL2vxDvCKIEhz5Fi8AHS7+UZ4mXWj7xKKz3zacQRNYS+LtL07a2SY+xkdx60hMWa1b+jNqz8JhGW4B7hoPSNb4Z587UVRtveXYtv4v0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Mykyta Poturai <mykyta.poturai@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index:
 AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoCABl1EgIBEoW2AgAA0fACAAZfdAIAEm8YAgAGSSQCAAEbogIALO3kAgCQMb4A=
Date: Thu, 21 Jul 2022 15:53:30 +0000
Message-ID: <69C0FF69-98E3-440B-9CE7-3025EE5E0E4C@arm.com>
References: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
 <20220628172338.1637121-1-mykyta_poturai@epam.com>
In-Reply-To: <20220628172338.1637121-1-mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2b8ff324-aba7-4a33-366c-08da6b312daf
x-ms-traffictypediagnostic:
	GV1PR08MB7363:EE_|DBAEUR03FT049:EE_|AM0PR08MB4578:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mloRJZj7yvRcQqL4DvgirCQm51Pwna+A7EfWflJvbieHG8lcF77/IEo9d+Ng2gQ36si3sSeryW73NGVyFM/ZZDcdA/LxIpFyd1Kjx4aJxhwKqV+yH70mUnZLzt5i5JMFweIp9cg+pTxyJekhIKVg0cKLpsb98A3WkTwlPfHpy1P5waYrWP57gyiGvyAJOwTe4DuYVGR7kG5VljyPD7Lfol6aKoluqSURKmSng+IdP+ky6VZ1mj0kuNaRv3M0C3f+arA+qBinPWoSP3dmrFfBOclqIA6XVRhv4uOl3BlZmSqjN6jnAnaPEpubfdle+94YVulZZ6ebc886XeIALFkEviwDIksuB7PGvuTZy7aAL0j8gLVGvvPeOWlkV63Max4eh7YkKOJB0Szcf52G+RV1Y99gnfM2RSxQ196Z4mhZPRWghds3nECmU9orz1Xia0dTHIp1L+vj5+wG7aCCWD0HFJJdfdFyKZnvMxj8Yzu2wFaoA/PRxiR1eCm7RkEf8w42xl0kH9rHhwmciRBfkIYKS6L7SCu7RrdNyKu82UmjcqjADMYaUil9AbiBcHqxOLoMlZSzf1UQfTdg+LHNxtza5f6O35B19LwD24nqBGpEMRfQB54s9nAG2mzAq5Ef2zIu8U+rKhWg2g0EOqViOEBvyxPBPMG0c5T972oxAruPNK3AX3DTaMcL+Eb1RpHvnoSp+4e0BBIblFUW9W75bT/Y0UjMGgXJGhXxc9rjxxS2xcuotLG9pTEyCMHveJAwWWpsxbfCRgqGY0qeh2JMtwMvJsvtnQKfECA9Keghuv3kk3p9pNFxNzT25/rdU6sfah+792HtZ4DZcPKIAO6EqES4WQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(4326008)(64756008)(33656002)(8936002)(83380400001)(2906002)(66556008)(5660300002)(38070700005)(66446008)(54906003)(86362001)(6916009)(91956017)(53546011)(76116006)(8676002)(316002)(36756003)(71200400001)(122000001)(2616005)(186003)(41300700001)(6512007)(6486002)(26005)(38100700002)(66476007)(66946007)(6506007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <433AF83FA0B6B743AA014315B5BA8014@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a436506-99be-4206-affb-08da6b31286a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aei/x54lwEYBL9Up4BNtRBNQoPHsNJA4iFRoX/b98z2r5wvH4tWWvFxd3jxMi/6fdy1E0mx0lCjx5pbBCOsFURaG2efU4xla45XTTlhRDcDkvdISuc3WAzI7w2xUZzctY+rit2kepx6hdfNFbZgYtWWyxVulbKAlnnYbV0PBb1WbC8+DZ1IJno/9SS6EnP8h9UUsm3s7U6jMU0vOSPqbKwrfW/eh1Ln9FsEtcwKCqsr8/cGfZV6RzTCnuNYuOMcJcrC82GkTXz+qssgdTzbzYFhL+kprQbFYatcAxaB6eh1Qo73lmgH7TR58ifGNul1eaGyuJCOtHXQHd4F/I4OVugEOE1nWJoQ4bYpENXHD/1RKhM80mZuuHJrf78WAgtyyy5Df8rTzeF7OaQDFl8LDRgfdfrviypcJGr/lCq9Ed8LPc05U6aQ3uBtsn+pIWQR6ECz1+RywubzlY6pZ8iXLCKC4xvyAYyzx2U/801dAzgsQhBWyJo2iSaJkLMzUiyLuvmFREM7dkyZbt28P2nREUr6lRcBRY9PSTty97BdY1sYv6Egny4gIEpxaeVx7Nac7qQD6JXIMSG7DMDo/y9tIwCbb0R4dgjvSTQV4o11Wlxs6gtcSkrE1ZiTa9n8vtVNWwD0ZrkJPVmHO982p305/CJ7bDTXaffYRaehrMpdE72vfLRHzI2+/FBSPREqqdcuVvQBTLDEBaziJiMkSIE7bi/ARhy4LwDNVJvY8IblRjFAKhcfIYEQSx/kXmRRJt2cL8lV4iuKX50kekdXJ3WjgD854NT55rt5YQ7VkqtUhL/vVDeVSvL02jmI4MYIk/uEq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(40470700004)(36840700001)(40480700001)(6506007)(41300700001)(5660300002)(6486002)(40460700003)(26005)(6862004)(478600001)(356005)(336012)(53546011)(186003)(6512007)(47076005)(82310400005)(83380400001)(2616005)(36756003)(8676002)(33656002)(316002)(8936002)(54906003)(4326008)(70206006)(70586007)(81166007)(36860700001)(86362001)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 15:53:39.0373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8ff324-aba7-4a33-366c-08da6b312daf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4578

SGkgLA0KDQo+IE9uIDI4IEp1biAyMDIyLCBhdCA2OjIzIHBtLCBNeWt5dGEgUG90dXJhaSA8bXlr
eXRhLnBvdHVyYWlAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBIaSBNeWt5dGEsDQo+PiANCj4+
PiBPbiAyMSBKdW4gMjAyMiwgYXQgMTA6MzggYW0sIE15a3l0YSBQb3R1cmFpIDxteWt5dGEucG90
dXJhaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+PiBUaGFua3MgZm9yIHRlc3RpbmcgdGhl
IHBhdGNoLg0KPj4+Pj4gQnV0IG5vdCBmaXhlZCB0aGUgIlVuZXhwZWN0ZWQgR2xvYmFsIGZhdWx0
IiB0aGF0IG9jY2FzaW9uYWxseSBoYXBwZW5zIHdoZW4gZGVzdHJveWluZw0KPj4+Pj4gdGhlIGRv
bWFpbiB3aXRoIGFuIGFjdGl2ZWx5IHdvcmtpbmcgR1BVLiBBbHRob3VnaCwgSSBhbSBub3Qgc3Vy
ZSBpZiB0aGlzIGlzc3VlDQo+Pj4+PiBpcyByZWxldmFudCBoZXJlLg0KPj4+PiANCj4+Pj4gQ2Fu
IHlvdSBwbGVhc2UgaWYgcG9zc2libGUgc2hhcmUgdGhlIG1vcmUgZGV0YWlscyBhbmQgbG9ncyBz
byB0aGF0IEkgY2FuIGxvb2sgaWYgdGhpcyBpc3N1ZSBpcyByZWxldmFudCBoZXJlID8NCj4+PiAN
Cj4+PiBTbyBpbiBteSBzZXR1cCBJIGhhdmUgYSBib2FyZCB3aXRoIElNWDggY2hpcCBhbmQgMiBj
b3JlIFZpdmFudGUgR1BVLiBHUFUgaXMgc3BsaXQgYmV0d2VlbiBkb21haW5zLg0KPj4+IE9uZSBj
b3JlIGdvZXMgdG8gRG9tMCBhbmQgb25lIHRvIERvbVUuDQo+Pj4gDQo+Pj4gU3RlcHMgdG8gdHJp
Z2dlciB0aGlzIGlzc3VlOg0KPj4+IDEuIFN0YXJ0IERvbVUNCj4+PiAyLiBTdGFydCB3YXlsYW5k
IGFuZCBnbG1hcmsyLWVzMi13YXlsYW5kIGluc2lkZSBEb21VDQo+Pj4gMy4gRGVzdHJveSBEb21V
DQo+Pj4gDQo+Pj4gU29tZXRpbWVzIGl0IGRlc3Ryb3lzIGZpbmUgYnV0IHJvdWdobHkgMSBvZiA4
IHRpbWVzIEkgZ2V0IGxvZ3MgbGlrZSB0aGlzOg0KPj4+IA0KPj4+IHJvb3RAZG9tMDp+IyB4bCBk
ZXN0IERvbVUNCj4+PiBbMTI3MjUuNDEyOTQwXSB4ZW5icjA6IHBvcnQgMSh2aWY4LjApIGVudGVy
ZWQgZGlzYWJsZWQgc3RhdGUNCj4+PiBbMTI3MjUuNjcxMDMzXSB4ZW5icjA6IHBvcnQgMSh2aWY4
LjApIGVudGVyZWQgZGlzYWJsZWQgc3RhdGUNCj4+PiBbMTI3MjUuNjg5OTIzXSBkZXZpY2Ugdmlm
OC4wIGxlZnQgcHJvbWlzY3VvdXMgbW9kZQ0KPj4+IFsxMjcyNS42OTY3MzZdIHhlbmJyMDogcG9y
dCAxKHZpZjguMCkgZW50ZXJlZCBkaXNhYmxlZCBzdGF0ZQ0KPj4+IFsxMjcyNS42OTY5ODldIGF1
ZGl0OiB0eXBlPTE3MDAgYXVkaXQoMTYxNjU5NDI0MC4wNjg6MzkpOiBkZXY9dmlmOC4wIHByb209
MCBvbGRfcHJvbT0yNTYgYXVpZD00Mjk0OTY3Mjk1IHVpZD0wIGdpZD0wIHNlcz00Mjk0OTY3Mjk1
DQo+Pj4gKFhFTikgc21tdTogL2lvbW11QDUxNDAwMDAwOiBVbmV4cGVjdGVkIGdsb2JhbCBmYXVs
dCwgdGhpcyBjb3VsZCBiZSBzZXJpb3VzDQo+Pj4gKFhFTikgc21tdTogL2lvbW11QDUxNDAwMDAw
OiAgICBHRlNSIDB4MDAwMDAwMDEsIEdGU1lOUjAgMHgwMDAwMDAwNCwgR0ZTWU5SMSAweDAwMDAx
MDU1LCBHRlNZTlIyIDB4MDAwMDAwMDANCj4+PiANCj4+PiBNeSBndWVzcyBpcyB0aGF0IHRoaXMg
aGFwcGVucyBiZWNhdXNlIEdQVSBjb250aW51ZXMgdG8gYWNjZXNzIG1lbW9yeSB3aGVuIHRoZSBj
b250ZXh0IGlzIGFscmVhZHkgaW52YWxpZGF0ZWQsDQo+Pj4gYW5kIHRoZXJlZm9yZSB0cmlnZ2Vy
cyB0aGUgIkludmFsaWQgY29udGV4dCBmYXVsdCIuDQo+PiANCj4+IFllcyB5b3UgYXJlIHJpZ2h0
IGluIHRoaXMgY2FzZSBHUFUgdHJ5aW5nIHRvIGRvIERNQSBvcGVyYXRpb24gYWZ0ZXIgWGVuIGRl
c3Ryb3llZCB0aGUgZ3Vlc3QgYW5kIGNvbmZpZ3VyZXMNCj4+IHRoZSBTMkNSIHR5cGUgdmFsdWUg
dG8gZmF1bHQuIFNvbHV0aW9uIHRvIHRoaXMgaXNzdWUgaXMgdGhlIHBhdGNoIHRoYXQgSSBzaGFy
ZWQgZWFybGllci4NCj4+IA0KPj4gWW91IGNhbiB0cnkgdGhpcyBwYXRjaCBhbmQgY29uZmlybS5U
aGlzIHBhdGNoIHdpbGwgc29sdmUgYm90aCB0aGUgaXNzdWVzLg0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9zbW11LmMNCj4+IGluZGV4IDVjYWNiMmRkOTkuLmZmMWI3M2QzZDggMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+PiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+PiBAQCAtMTY4MCw2ICsxNjgwLDEw
IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpk
b21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikNCj4+IGlmICghY2ZnKQ0KPj4gcmV0dXJuIC1FTk9E
RVY7DQo+PiANCj4+ICsgcmV0ID0gYXJtX3NtbXVfbWFzdGVyX2FsbG9jX3NtZXMoZGV2KTsNCj4+
ICsgaWYgKHJldCkNCj4+ICsgcmV0dXJuIHJldDsNCj4+ICsNCj4+IHJldHVybiBhcm1fc21tdV9k
b21haW5fYWRkX21hc3RlcihzbW11X2RvbWFpbiwgY2ZnKTsNCj4+IH0NCj4+IA0KPj4gQEAgLTIw
NzUsNyArMjA3OSw3IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYWRkX2RldmljZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+PiBpb21tdV9ncm91cF9hZGRfZGV2aWNlKGdyb3VwLCBkZXYpOw0KPj4gaW9t
bXVfZ3JvdXBfcHV0KGdyb3VwKTsNCj4+IA0KPj4gLSByZXR1cm4gYXJtX3NtbXVfbWFzdGVyX2Fs
bG9jX3NtZXMoZGV2KTsNCj4+ICsgcmV0dXJuIDA7DQo+PiB9DQo+PiANCj4+IA0KPj4gUmVnYXJk
cywNCj4+IFJhaHVsDQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IFdpdGggdGhpcyBwYXRjaCBJIGdl
dCB0aGUgc2FtZSByZXN1bHRzLCBoZXJlIGlzIHRoZSBlcnJvciBtZXNzYWdlOg0KPiANCj4gKFhF
Tikgc21tdTogL2lvbW11QDUxNDAwMDAwOiBVbmV4cGVjdGVkIGdsb2JhbCBmYXVsdCwgdGhpcyBj
b3VsZCBiZSBzZXJpb3VzDQo+IChYRU4pIHNtbXU6IC9pb21tdUA1MTQwMDAwMDogICAgR0ZTUiAw
eDAwMDAwMDAxLCBHRlNZTlIwIDB4MDAwMDAwMDQsIEdGU1lOUjEgMHgwMDAwMTA1NSwgR0ZTWU5S
MiAweDAwMDAwMDAwDQo+IA0KDQpBcyB5b3UgbWVudGlvbmVkIGVhcmxpZXIsIHRoaXMgZmF1bHQg
aXMgb2JzZXJ2ZWQgYmVjYXVzZSBHUFUgY29udGludWVzIHRvIGFjY2VzcyBtZW1vcnkgd2hlbiB0
aGUgY29udGV4dCBpcw0KYWxyZWFkeSBpbnZhbGlkYXRlZCwgYW5kIHRoZXJlZm9yZSB0cmlnZ2Vy
cyB0aGUgIkludmFsaWQgY29udGV4dCBmYXVsdCIuICBUaGlzIGlzIGEgZGlmZmVyZW50IGlzc3Vl
IGFuZCBpcyBub3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KDQpASnVsaWVuIGFyZSB5b3Ugb2th
eSBpZiBJIHdpbGwgc2VuZCB0aGUgYmVsb3cgcGF0Y2ggZm9yIG9mZmljaWFsIHJldmlldyBhcyB0
aGlzIGlzc3VlIHBlbmRpbmcgZm9yIGEgbG9uZyB0aW1lPw0KDQpJbiB0aGlzIHBhdGNoIHdlIGRv
buKAmXQgbmVlZCB0byBjYWxsIGFybV9zbW11X21hc3Rlcl9mcmVlX3NtZXMoKSBpbiBhcm1fc21t
dV9kZXRhY2hfZGV2KCkgYnV0IHdlIHdpbGwgaW1wbGVtZW50IG5ldw0KZnVuY3Rpb24gYXJtX3Nt
bXVfZG9tYWluX3JlbW92ZV9tYXN0ZXIoKSB0aGF0IHdpbGwgY29uZmlndXJlIHRoZSBzMmNyIHZh
bHVlIHRvIHR5cGUgZmF1bHQgaW4gZGV0YWNoIGZ1bmN0aW9uLg0KYXJtX3NtbXVfZG9tYWluX3Jl
bW92ZV9tYXN0ZXIoKSB3aWxsIHJldmVydCB0aGUgY2hhbmdlcyBkb25lIGJ5IGFybV9zbW11X2Rv
bWFpbl9hZGRfbWFzdGVyKCkgaW4gYXR0YWNoIGZ1bmN0aW9uLg0KDQoNCmRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3NtbXUuYw0KaW5kZXggNjk1MTE2ODNiNC4uZGEzYWRmOGU3ZiAxMDA2NDQNCi0tLSBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9zbW11LmMNCkBAIC0xNTk4LDIxICsxNTk4LDYgQEAgb3V0X2VycjoNCnJl
dHVybiByZXQ7DQp9DQoNCi1zdGF0aWMgdm9pZCBhcm1fc21tdV9tYXN0ZXJfZnJlZV9zbWVzKHN0
cnVjdCBhcm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcpDQotew0KLSBzdHJ1Y3QgYXJtX3NtbXVfZGV2
aWNlICpzbW11ID0gY2ZnLT5zbW11Ow0KLSBpbnQgaSwgaWR4Ow0KLSBzdHJ1Y3QgaW9tbXVfZndz
cGVjICpmd3NwZWMgPSBhcm1fc21tdV9nZXRfZndzcGVjKGNmZyk7DQotDQotIHNwaW5fbG9jaygm
c21tdS0+c3RyZWFtX21hcF9sb2NrKTsNCi0gZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwg
ZndzcGVjLT5udW1faWRzKSB7DQotIGlmIChhcm1fc21tdV9mcmVlX3NtZShzbW11LCBpZHgpKQ0K
LSBhcm1fc21tdV93cml0ZV9zbWUoc21tdSwgaWR4KTsNCi0gY2ZnLT5zbWVuZHhbaV0gPSBJTlZB
TElEX1NNRU5EWDsNCi0gfQ0KLSBzcGluX3VubG9jaygmc21tdS0+c3RyZWFtX21hcF9sb2NrKTsN
Ci19DQotDQpzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9hZGRfbWFzdGVyKHN0cnVjdCBhcm1f
c21tdV9kb21haW4gKnNtbXVfZG9tYWluLA0Kc3RydWN0IGFybV9zbW11X21hc3Rlcl9jZmcgKmNm
ZykNCnsNCkBAIC0xNjM1LDYgKzE2MjAsMjAgQEAgc3RhdGljIGludCBhcm1fc21tdV9kb21haW5f
YWRkX21hc3RlcihzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpzbW11X2RvbWFpbiwNCnJldHVybiAw
Ow0KfQ0KDQorc3RhdGljIHZvaWQgYXJtX3NtbXVfZG9tYWluX3JlbW92ZV9tYXN0ZXIoc3RydWN0
IGFybV9zbW11X2RvbWFpbiAqc21tdV9kb21haW4sDQorIHN0cnVjdCBhcm1fc21tdV9tYXN0ZXJf
Y2ZnICpjZmcpDQorew0KKyBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gc21tdV9kb21h
aW4tPnNtbXU7DQorIHN0cnVjdCBhcm1fc21tdV9zMmNyICpzMmNyID0gc21tdS0+czJjcnM7DQor
IHN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGFybV9zbW11X2dldF9md3NwZWMoY2ZnKTsN
CisgaW50IGksIGlkeDsNCisNCisgZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwgZndzcGVj
LT5udW1faWRzKSB7DQorIHMyY3JbaWR4XSA9IHMyY3JfaW5pdF92YWw7DQorIGFybV9zbW11X3dy
aXRlX3MyY3Ioc21tdSwgaWR4KTsNCisgfQ0KK30NCisNCnN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0
YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikN
CnsNCmludCByZXQ7DQpAQCAtMTY4NCwxMCArMTY4MywxMSBAQCBzdGF0aWMgaW50IGFybV9zbW11
X2F0dGFjaF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQoNCnN0YXRpYyB2b2lkIGFybV9zbW11X2RldGFjaF9kZXYoc3RydWN0IGlvbW11X2RvbWFp
biAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQp7DQorIHN0cnVjdCBhcm1fc21tdV9kb21h
aW4gKnNtbXVfZG9tYWluID0gZG9tYWluLT5wcml2Ow0Kc3RydWN0IGFybV9zbW11X21hc3Rlcl9j
ZmcgKmNmZyA9IGZpbmRfc21tdV9tYXN0ZXJfY2ZnKGRldik7DQoNCmlmIChjZmcpDQotIGFybV9z
bW11X21hc3Rlcl9mcmVlX3NtZXMoY2ZnKTsNCisgcmV0dXJuIGFybV9zbW11X2RvbWFpbl9yZW1v
dmVfbWFzdGVyKHNtbXVfZG9tYWluLCBjZmcpOw0KDQp9DQoNCg0KUmVnYXJkcywNClJhaHVs

