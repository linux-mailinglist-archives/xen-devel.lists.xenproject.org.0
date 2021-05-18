Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D273875B6
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 11:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129001.242150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwO5-0000kG-1D; Tue, 18 May 2021 09:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129001.242150; Tue, 18 May 2021 09:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwO4-0000i7-Te; Tue, 18 May 2021 09:51:40 +0000
Received: by outflank-mailman (input) for mailman id 129001;
 Tue, 18 May 2021 09:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1liwO4-0000hz-3Q
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 09:51:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 737d3679-f0fa-49aa-ab02-cd4949aaf8e8;
 Tue, 18 May 2021 09:51:38 +0000 (UTC)
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 09:51:37 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::a4) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 09:51:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 09:51:36 +0000
Received: ("Tessian outbound 6c8a2be3c2e7:v92");
 Tue, 18 May 2021 09:51:36 +0000
Received: from bcae2406f976.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64F1C447-83C4-4A9B-8B73-B9DC90B96E7F.1; 
 Tue, 18 May 2021 09:51:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcae2406f976.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 09:51:26 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5581.eurprd08.prod.outlook.com (2603:10a6:800:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 09:51:25 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 09:51:25 +0000
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
X-Inumbo-ID: 737d3679-f0fa-49aa-ab02-cd4949aaf8e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACcCiPpJf1X/XpSp4DB6Km0XuczRENrQcuj3msIh8v0=;
 b=RttbBikGk4qknTM+9xnS+drlyMoHYsSErXkaC2MBjGbJ0uRbZicCRbUSx1jBRG8GwHT//piqpk0CNdsqj6hmYcgxtyaQxu8j7bi2aRIohnG91JH8hPQnJpzr2MQ4w7zYS8LAg60zdpUh2lPTT5X6FjGI3ZMUV+QWjhpKyElKJWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hky4kD/YGWCvBw/uMbIVSMLxLg5C9rVT/VN/I0H+z5xiyhxBNW2Lm/rAYlAA09hF2ABwXKaJSXzol8Y64RiNBuAEzWJrT/c2I9FmfGJjlafhZuSPWsz1gOaPBuK4Nvg9QE4FO0ekNawv51+istEi34r84IF9J7hFBCCw6KuohT00XskHPeudbB70NH84xWd8WOBFrCnX+Ti6pFQZkPP5P128OzpyRlAR7bpid2/qyO63fkXt0fkd1+Z2nBCtXqST/aMbL4B4IxmAafoCYCRgwl5gl1jIjRn9dPZwL9f8mPDHDFjea9wDl7XzmrzOuh7uHIMqAyjg7kikKVDiBdMpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACcCiPpJf1X/XpSp4DB6Km0XuczRENrQcuj3msIh8v0=;
 b=jFiVEUxR2I3jBQJC1fltHnpd7p31BpwcV2wkAkLJqZrQJ8zA8jaa43ADw6piCRxwwQSZmtvjqc1EXNei+VySvduuF89mA6GEbtd1iff79Y7Sv6UweY+NwNahE2RS5amBj+j9Goq4Nht/GBRS2zY7wAs7Mm22cxQ2WrGQXeOlueeQbJi86sWSQK/pCA1i8jaa2C4wFiE9up8LyWq7kGHUvJghJsinDgzt66H0d2bdUIT4AyhYP92+QXXuBspKFgq4ycWChlMHF9hqEiLpXH5PDIGwuql4BNfpI6lwOB9aRf3GIJYfr1w2LdB+XqEaJE613pjFfEo488K8EXQOQ5EALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACcCiPpJf1X/XpSp4DB6Km0XuczRENrQcuj3msIh8v0=;
 b=RttbBikGk4qknTM+9xnS+drlyMoHYsSErXkaC2MBjGbJ0uRbZicCRbUSx1jBRG8GwHT//piqpk0CNdsqj6hmYcgxtyaQxu8j7bi2aRIohnG91JH8hPQnJpzr2MQ4w7zYS8LAg60zdpUh2lPTT5X6FjGI3ZMUV+QWjhpKyElKJWQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 04/10] xen/arm: static memory initialization
Thread-Topic: [PATCH 04/10] xen/arm: static memory initialization
Thread-Index: AQHXS6WzoKPo0e3K4EKgzRPDOGKP8Kro0+kAgAAm7iA=
Date: Tue, 18 May 2021 09:51:25 +0000
Message-ID:
 <VE1PR08MB5215E7203960F535BC857F5CF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
 <dbffa647-37e2-93b6-4041-a1344aeb1837@suse.com>
In-Reply-To: <dbffa647-37e2-93b6-4041-a1344aeb1837@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3C665C90F9340D4AB36D95639ACD7A34.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bc8ee6ce-7786-482b-9119-08d919e2871e
x-ms-traffictypediagnostic: VE1PR08MB5581:|DBAPR08MB5717:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5717E30B5485659C2479D8D2F72C9@DBAPR08MB5717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 suPbpIzbIxVoVd9u7vIyNpQjoJA6E9JONe6mgSP8QyT51uQbKMwwXv8KIFqyBuY2JgP1iGvmxZ1ujMivb0LrdLTw25z6ynpf0DXKoniAr3hfTf5I/WTLSaEhCH81P+vMCbM6FrRs+7FFyFjjTHAjPrfPuoyTcORY+6fLUwbn72tyFwzVe1q1JLPVvVYuJFqeZebtcxAa7y6hM8iyqU0gLwEn8zJoJ986c9gSrf7EDOsD8QTT1khgtUH+B0039mZ/c67knmHSoXcXgXYPMW1kwBv6blZOeTy1w0Tu1miGy77fREf/q/wDiYdIjN8WAhY+KZvSgMP8V683qUp1hU6mUFfSRNga5ONGPUK84+cj9QuDpmUitu0wgREwPLQf7rjGq3KYEMcHuyJr0IMub1TyKR8IBe5VyIXMq6g1lxwh10ZB/PiGT48Uix5kvANsOZCPR4DrNabmoJ9gz3KY6Kkb8boal0cZaBSBbVBeZI6cux551xrMC1ZMZ2i3Q52v9IQBMsrWdI/iILF6XZCbdpN6Y3gsZGqWnCNA7x7+H5rrg16pju7E+ssMUj2dGYWPUODjgQQyEfRagjgDfa0wXayKC1wFm9ZPxX0iCfBC0Ece3eI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(9686003)(83380400001)(7696005)(53546011)(6506007)(186003)(5660300002)(38100700002)(122000001)(4326008)(52536014)(54906003)(316002)(8936002)(26005)(478600001)(6916009)(71200400001)(8676002)(33656002)(86362001)(2906002)(55016002)(66556008)(66476007)(64756008)(66446008)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?dFFOaHdhNUFsYjRFb0pDNHgvQjRoSVowcW1PTUpnaFlSNTROYkZ1SDgvR0Qv?=
 =?utf-8?B?SHVwYTF1TTJFQXNEUUpaR2tpNTRsSWFjdHRreVRVc0hsY21BUVFTN3IyN2pj?=
 =?utf-8?B?TS9sZGVuMmlLRTMwSk5TVVJDT092WlJvWnMrb3Rwd0JYMVpQdDBRTGlFWWE4?=
 =?utf-8?B?R0pmK2Z5VmVIMERocGh0SnlITkMvbkt1YlpLaFducThtWGlnd1orMDNjUnVW?=
 =?utf-8?B?Y0xOOUxDZllubDNpOUhnU0FsWVo3cWpjaTRjdnZUNUNkTWhBNElMWWZqL2Ny?=
 =?utf-8?B?WWNkclpNUVZXbjhsZ2lLYjd3eUxoVFdidFByNmQ4K0toNzQzekRMY0YwZkdY?=
 =?utf-8?B?Y09iS0haNVBBalY2bnVzVkZZQnZOZFM2YlUvUXVpa1ZLNEtGMjVDYUN3c0Fv?=
 =?utf-8?B?NmJkQWViSXNVbkQrTTc0bnZkZFp0RkVNMWtONUNPdGc3eXNNcUVXMytVQm04?=
 =?utf-8?B?Ui8xR2QxU1ltd3N4MUZiblljVHdmMk81SVY5d2ZsNjUxWTlrSGdGN3hvNVF4?=
 =?utf-8?B?OVptS2R0VDhLR2oweXVDQWJMY0Q5TmlLY0xhZkdGdVVpZEdhdERBU3gzWnkw?=
 =?utf-8?B?K1Q3Z3dicVdaVExxTHZ1c1NXeEdtQjR3VTRhc05PcGptRVlyb1greEM4SzFq?=
 =?utf-8?B?OHdIZXhWUXE0YitPaWpJTzlqMUxpR2lGT3VNQ3BMVndMTTN5N2N6UmJLdUZB?=
 =?utf-8?B?aVJZVHlqVjRYbCt1QjFFRGJCS2Vac2NGZHBRMk9JS3haNG1zUHVndTlXSmNO?=
 =?utf-8?B?bWhXU20zU1NFM2NJb3dhMjVDSjZNMjAxT2hvMW9XdGdnUFBxRG5XOVRZY0lH?=
 =?utf-8?B?blpQb1QyNUlwUHBNcjBJUlBYTXhsbXByYVE2MGllY0lBeWFZS0VMbjdVOEhs?=
 =?utf-8?B?N21nQitlRnUxWHRwZFdYckZTcnZxQVpjWnUwdkZmdUdPRTlsamt4RUlhYWZR?=
 =?utf-8?B?SkpBbWpheEwrKzRXUkxmek5YUjRtYXRpd3kwaHkrcHpXSDJjNmt5RlZaamZL?=
 =?utf-8?B?OXJ6bzZNL3VMTGpGQXRzcGZFVXR5RlJZTmV4QXRvbUkrVW00cVg0UjlCYSs0?=
 =?utf-8?B?aitvVEcxQWdibWFwcm1QM0xUNFc3aERkdlM3VGRWUENyekFsNGtkc3gzSjJF?=
 =?utf-8?B?S1dibVhGdjNqYmt5ditkUnh5RXI2NnJsZkNWMHMwdVNrYW1ad0hXM3BrYXV4?=
 =?utf-8?B?WUIwRyt6a2hILy9ZVldGcXBxSVZXT256ei9JdXNZYnRZK1YwOVlIOWRqK1Bu?=
 =?utf-8?B?eGwvd1JCdTMwbW85YzZ1b1gzY2duYVRzdTNrYlBBM2lTaVdmc1JHcVpKaDNi?=
 =?utf-8?B?OFBsME1yYXo5WUYwS0h1NHdNb0tHWGw4bm1TSHltMGZobktSN0pIVThjODUv?=
 =?utf-8?B?Rk1sbXpxcVdqUkUxS256UDFYUWowTHVjOXB6c3Q4eUZYWW5CamhWbjB5c3U4?=
 =?utf-8?B?dVlRYVZxb24rQkU5ZGZiRDd2MkdKc0xzQ051NHpjNzZnaGVrQktQWGtINUc2?=
 =?utf-8?B?WDJ1R2M3b1dmS3ljL1IzMzF5amRoeDZ6RDB5ZUZmb1U5Uk15aiszMms4TWZF?=
 =?utf-8?B?ZStrZzQzME5VaTE5TEQ2VkRpbG1CcXhMd2NpU202L0szWVI2N3Vja2E3aVV4?=
 =?utf-8?B?Q24zTUo3MzFuRTBGc1c3T3hOdUh6MHdSZE8xTGpXTFVUQk9wNnVldGFrbHdI?=
 =?utf-8?B?V3ZPc1F2YTRzM21XNndqa0YvWGlyTiswdTBINVpGUitMdXlxNDNnSkRqNW14?=
 =?utf-8?Q?AlkCENpGqyrLx0EkQlFNk+d+zh80+XyeQbT9Z7v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d4151f5-cb57-477b-e23b-08d919e28036
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gAHJSK8V7WqtIx4h8bpb6quWlEobTqLoyeBSVVlULjMqGmE08ugNERDncWye2R840m02OMJnNxhy0OD9gn7TTG2YB4dKQiGXK6Kg4tz4c0mgtXxc8CQ/b/wYadMj3rCj9taE05tckxjHFJKpIBrSi//HbvgFPbjMxjJ2OhAPwJA+Ear0kXhJaQoiIiHwt1N4i+a8TU7OvsHuATTIbuKq0hp9rdhbLT4LXzEEb2w2hgqOUn9960zqf/owQXlUOUp7BTEAHPvGwYi3NlRV89adlRN1j2CrEymJ8H1IC6E76nEjKJWcPB7LxlfdmViiLKxnCLC7fS6tIV/nfvJoik2cINdABhwhRUez4mtn2HZD3q2AIFHXyQaSLJR1tjTfdRW6K/mbWoSb8MX7lxGMeT8+qDsfD4jSzspQuW2Xq070xASqeJFbyQeHcJSx0Ymo9tCEYPEzo8HBIc+rb35At6qJkz1QiQloZQ0f8bvc79BVs7IScJYDzfAw1CixySS1n7XpDsFCPR2VljsWeD4uPUdnNlgQISFCHlonClwXCBh15ltMvuJHqVmsugxp4ksnbM38ffQ/6YYYSHE0HRRHsds+iNiRCYcMRD+CbruW8r4JbyZteWsGYotTzhIaUhRpXMJ/voW5IktuDHhOG5VdCz9tWhH9xV+u4RuDgzIO/rkSR/U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(186003)(36860700001)(9686003)(70206006)(336012)(70586007)(356005)(6506007)(53546011)(7696005)(316002)(81166007)(82310400003)(47076005)(52536014)(8676002)(478600001)(55016002)(86362001)(82740400003)(2906002)(6862004)(54906003)(5660300002)(8936002)(83380400001)(4326008)(33656002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:51:36.9796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8ee6ce-7786-482b-9119-08d919e2871e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgMzox
NiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA0LzEwXSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0
aW9uDQo+IA0KPiBPbiAxOC4wNS4yMDIxIDA3OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBU
aGlzIHBhdGNoIGludHJvZHVjZXMgc3RhdGljIG1lbW9yeSBpbml0aWFsaXphdGlvbiwgZHVyaW5n
IHN5c3RlbSBSQU0gYm9vdA0KPiB1cC4NCj4gPg0KPiA+IE5ldyBmdW5jIGluaXRfc3RhdGljbWVt
X3BhZ2VzIGlzIHRoZSBlcXVpdmFsZW50IG9mIGluaXRfaGVhcF9wYWdlcywNCj4gPiByZXNwb25z
aWJsZSBmb3Igc3RhdGljIG1lbW9yeSBpbml0aWFsaXphdGlvbi4NCj4gPg0KPiA+IEhlbHBlciBm
dW5jIGZyZWVfc3RhdGljbWVtX3BhZ2VzIGlzIHRoZSBlcXVpdmFsZW50IG9mIGZyZWVfaGVhcF9w
YWdlcywNCj4gPiB0byBmcmVlIG5yX3BmbnMgcGFnZXMgb2Ygc3RhdGljIG1lbW9yeS4NCj4gPiBG
b3IgZWFjaCBwYWdlLCBpdCBpbmNsdWRlcyB0aGUgZm9sbG93aW5nIHN0ZXBzOg0KPiA+IDEuIGNo
YW5nZSBwYWdlIHN0YXRlIGZyb20gaW4tdXNlKGFsc28gaW5pdGlhbGl6YXRpb24gc3RhdGUpIHRv
IGZyZWUNCj4gPiBzdGF0ZSBhbmQgZ3JhbnQgUEdDX3Jlc2VydmVkLg0KPiA+IDIuIHNldCBpdHMg
b3duZXIgTlVMTCBhbmQgbWFrZSBzdXJlIHRoaXMgcGFnZSBpcyBub3QgYSBndWVzdCBmcmFtZSBh
bnkNCj4gPiBtb3JlDQo+IA0KPiBCdXQgaXNuJ3QgdGhlIGdvYWwgKGFzIHBlciB0aGUgcHJldmlv
dXMgcGF0Y2gpIHRvIGFzc29jaWF0ZSBzdWNoIHBhZ2VzIHdpdGggYQ0KPiBfc3BlY2lmaWNfIGRv
bWFpbj8NCj4gDQoNCkZyZWVfc3RhdGljbWVtX3BhZ2VzIGFyZSBhbGlrZSBmcmVlX2hlYXBfcGFn
ZXMsIGFyZSBub3QgdXNlZCBvbmx5IGZvciBpbml0aWFsaXphdGlvbi4NCkZyZWVpbmcgdXNlZCBw
YWdlcyB0byB1bnVzZWQgYXJlIGFsc28gaW5jbHVkZWQuDQpIZXJlLCBzZXR0aW5nIGl0cyBvd25l
ciBOVUxMIGlzIHRvIHNldCBvd25lciBpbiB1c2VkIGZpZWxkIE5VTEwuDQpTdGlsbCwgSSBuZWVk
IHRvIGFkZCBtb3JlIGV4cGxhbmF0aW9uIGhlcmUuDQoNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTE1
MCw2ICsxNTAsOSBAQA0KPiA+ICAjZGVmaW5lIHAybV9wb2Rfb2ZmbGluZV9vcl9icm9rZW5faGl0
KHBnKSAwICAjZGVmaW5lDQo+ID4gcDJtX3BvZF9vZmZsaW5lX29yX2Jyb2tlbl9yZXBsYWNlKHBn
KSBCVUdfT04ocGcgIT0gTlVMTCkgICNlbmRpZg0KPiA+ICsjaWZkZWYgQ09ORklHX0FSTV82NA0K
PiA+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ID4gKyNlbmRpZg0KPiANCj4gV2hhdGV2ZXIg
aXQgaXMgdGhhdCdzIG5lZWRlZCBmcm9tIHRoaXMgaGVhZGVyIHN1Z2dlc3RzIHRoZSBjb2RlIHdv
bid0IGJ1aWxkDQo+IGZvciBvdGhlciBhcmNoaXRlY3R1cmVzLiBJIHRoaW5rIGluaXRfc3RhdGlj
bWVtX3BhZ2VzKCkgaW4gaXRzIGN1cnJlbnQgc2hhcGUNCj4gc2hvdWxkbid0IGxpdmUgaW4gdGhp
cyAoY29tbW9uKSBmaWxlLg0KPiANCg0KWWVzLCBJIHNob3VsZCBpbmNsdWRlIHRoZW0gYWxsIGJv
dGggdW5kZXIgb25lIHNwZWNpZmljIGNvbmZpZywgbWF5YmUgbGlrZQ0KQ09ORklHX1NUQVRJQ19N
RU0sIGFuZCB0aGlzIGNvbmZpZyBpcyBhcm0tc3BlY2lmaWMuDQoNCj4gPiBAQCAtMTUxMiw2ICsx
NTE1LDQ5IEBAIHN0YXRpYyB2b2lkIGZyZWVfaGVhcF9wYWdlcygNCj4gPiAgICAgIHNwaW5fdW5s
b2NrKCZoZWFwX2xvY2spOw0KPiA+ICB9DQo+ID4NCj4gPiArLyogRXF1aXZhbGVudCBvZiBmcmVl
X2hlYXBfcGFnZXMgdG8gZnJlZSBucl9wZm5zIHBhZ2VzIG9mIHN0YXRpYw0KPiA+ICttZW1vcnku
ICovIHN0YXRpYyB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBn
LA0KPiB1bnNpZ25lZCBsb25nIG5yX3BmbnMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgbmVlZF9zY3J1YikNCj4gDQo+IFJpZ2h0IG5vdyB0aGlzIGZ1bmN0aW9u
IGdldHMgY2FsbGVkIG9ubHkgZnJvbSBhbiBfX2luaXQgb25lLiBVbmxlc3MgaXQgaXMNCj4gaW50
ZW5kZWQgdG8gZ2FpbiBmdXJ0aGVyIGNhbGxlcnMsIGl0IHNob3VsZCBiZSBtYXJrZWQgX19pbml0
IGl0c2VsZiB0aGVuLg0KPiBPdGhlcndpc2UgaXQgc2hvdWxkIGJlIG1hZGUgc3VyZSB0aGF0IG90
aGVyIGFyY2hpdGVjdHVyZXMgZG9uJ3QgaW5jbHVkZSB0aGlzDQo+IChkZWFkIHRoZXJlKSBjb2Rl
Lg0KPiANCg0KU3VyZSwgSSdsbCBhZGQgX19pbml0LiBUaHguDQoNCj4gPiArew0KPiA+ICsgICAg
bWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGcpOw0KPiA+ICsgICAgaW50IGk7DQo+IA0KPiBUaGlz
IHR5cGUgZG9lc24ndCBmaXQgbnJfcGZucydlcy4NCj4gDQoNClN1cmUsIG5yX21mbnMgaXMgYmV0
dGVyIGluIGFsc28gbWFueSBvdGhlciBwbGFjZXMuDQoNCj4gSmFuDQo=

